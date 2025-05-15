# 🌐 Kali Linux TypeScript Project Setup Script

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PNPM Version](https://img.shields.io/badge/pnpm-%3E%3D7.0.0-%23F69220)](https://pnpm.io/)
[![TypeScript Version](https://img.shields.io/badge/TypeScript-%5E5.0.0-%233178C6)](https://www.typescriptlang.org/)
[![Kali Linux Compatible](https://img.shields.io/badge/Kali_Linux-Compatible-%23557C94)](https://www.kali.org/)

> **The fastest way to bootstrap TypeScript projects on Kali Linux**  
> A secure, optimized initialization system for security-focused development environments.

<div align="center">
  <img src="https://img.icons8.com/color/96/000000/typescript.png" alt="TypeScript Logo" width="80"/>
  <img src="https://img.icons8.com/color/96/000000/linux.png" alt="Linux Logo" width="80"/> 
  <img src="https://img.icons8.com/color/96/000000/console.png" alt="Terminal Logo" width="80"/>
</div>

## 📋 Table of Contents
1. [✨ Key Features](#-key-features)
2. [🚀 Installation](#-installation)
   - [⚡ Clone Setup](#-clone-setup)
3. [🏗 Project Structure](#-project-structure)
4. [⚙️ Script Capabilities](#️-script-capabilities)
5. [🛠 Troubleshooting](#-troubleshooting)
6. [🤝 Contributing](#-contributing)
7. [📜 License](#-license)

## ✨ Key Features

| Feature | Description |
|---------|-------------|
| ⚡ **Instant Setup** | Single-command project initialization |
| 🔒 **Secure Foundation** | Built with `set -euo pipefail` for error handling |
| 🚢 **Production Ready** | Pre-configured build and start scripts |
| 🧩 **Optimal Configs** | Strict TypeScript + perfect tsconfig.json |
| 📦 **PNPM Power** | Faster, more efficient than npm/yarn |

## 🚀 Installation
Clone the repository
Move the .sh file into the folder you wanna create your project in
Make the script executable
Finally, run the script

git clone https://github.com/CodeWithMaina/kali-linux-typescript-project-setup-script.git
chmod +x setup-typescript-project.sh
./setup-typescript-project.sh

🏗 Project Structure
tree
my-project/
├── src/
│   └── index.ts        → Main application entry
├── dist/               → Compiled output (auto-generated)
├── node_modules/       → Dependencies (pnpm managed)
├── package.json        → Project configuration
└── tsconfig.json       → TypeScript settings

⚙️ Script Capabilities
The automation script handles:
Environment Verification
Checks for pnpm installation
Validates system requirements
Project Scaffolding![deepseek_mermaid_20250515_3219f4](https://github.com/user-attachments/assets/8eb436a5-ac37-4d43-8d7a-045daadb6422)

📜 License

MIT License © 2023 CodeWithMaina
Permission is hereby granted... [full license]
