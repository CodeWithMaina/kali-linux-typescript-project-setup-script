#!/bin/bash

set -euo pipefail

echo "🚀 Starting efficient TypeScript project setup..."

# Ensure pnpm is installed
if ! command -v pnpm &> /dev/null; then
  echo "❌ pnpm is not installed. Install it from https://pnpm.io/installation"
  exit 1
fi

# Prompt for project name
read -p "📦 Enter your project name: " PROJECT_NAME
ROOT_DIR="$PROJECT_NAME"

if [ -z "$PROJECT_NAME" ]; then
  echo "❌ Project name cannot be empty."
  exit 1
fi

# Create root project directory
echo "📁 Creating project directory: $ROOT_DIR"
mkdir "$ROOT_DIR"
cd "$ROOT_DIR"

# Manually create a minimal package.json
echo "🧱 Creating base package.json..."
cat > package.json <<EOF
{
  "name": "$PROJECT_NAME",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {},
  "keywords": [],
  "author": "",
  "license": "ISC"
}
EOF

# Fetch actual versions
echo "🔍 Resolving versions..."
PNPM_VERSION=$(pnpm -v)
TS_VERSION=$(pnpm info typescript version)
TSX_VERSION=$(pnpm info tsx version)

# Install dev dependencies
echo "📥 Installing dev dependencies (typescript@$TS_VERSION, tsx@$TSX_VERSION)..."
pnpm add -D "typescript@$TS_VERSION" "tsx@$TSX_VERSION" > /dev/null

# Update package.json with scripts and metadata
echo "⚙️  Finalizing package.json..."
node <<EOF
const fs = require("fs");
const path = "package.json";
const pkg = JSON.parse(fs.readFileSync(path, "utf8"));

pkg.scripts = {
  dev: "tsx watch ./src/index.ts",
  build: "tsc",
  start: "node ./dist/index.js"
};
pkg.packageManager = "pnpm@$PNPM_VERSION";

fs.writeFileSync(path, JSON.stringify(pkg, null, 2));
EOF

# Generate tsconfig.json
echo "🧠 Generating tsconfig.json..."
pnpm tsc --init > /dev/null

# Overwrite with custom config
echo "✍️  Writing custom tsconfig.json..."
cat > tsconfig.json <<EOF
{
  "compilerOptions": {
    "target": "ES2024",
    "module": "CommonJS",
    "outDir": "./dist",
    "rootDir": "./src",
    "moduleResolution": "Node",
    "strict": true,
    "skipLibCheck": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["src/**/*.ts"],
  "exclude": ["node_modules"]
}
EOF

# Create folders and index.ts file
echo "📂 Creating project structure..."
mkdir -p src dist

echo "📝 Creating src/index.ts..."
cat > src/index.ts <<EOF
let message: string = "I love TypeScript";
console.log(message);
EOF

# Done
echo "✅ Project setup complete in '$ROOT_DIR'"
echo "▶️  Launching development server..."
pnpm run dev

