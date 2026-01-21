# 🚀 Modern Terminal Setup (Beginner-Friendly)

A clean, fast, and modern terminal setup built for macOS, designed to be easy to understand even if you've never customized a terminal before.

> **📝 Note:** This repository contains configuration assets (not an installer). You copy the files you want and place them in the right location.

## ✨ What You'll Get

- 🎨 A beautiful terminal with icons, colors, and a smart prompt
- ⚡ A faster workflow (jump between folders, search files, cleaner commands)
- 🔰 A setup that looks advanced but is safe and beginner-friendly

## 🧩 Tools Used (Explained Simply)

| Tool          | What It Does     | Why It's Useful                     |
| ------------- | ---------------- | ----------------------------------- |
| **Ghostty**   | The terminal app | Fast, modern, GPU-accelerated       |
| **Zsh**       | The shell        | Smarter than default shell          |
| **Starship**  | The prompt       | Shows git, language, status cleanly |
| **Zinit**     | Plugin manager   | Loads features fast (lazy loading)  |
| **zoxide**    | Smarter `cd`     | Jump folders by memory, not typing  |
| **fzf**       | Fuzzy search     | Find files & history quickly        |
| **eza**       | Better `ls`      | Icons, git status, readable output  |
| **fastfetch** | System summary   | Shows system info on startup        |

> 💡 **Don't worry if these names feel unfamiliar** — we'll explain each while setting them up.

---

## 🛠️ Installation Guide

### 1️⃣ Install Required Tools

We'll use **Homebrew**, a package manager for macOS.

#### Step 1: Install Homebrew (if you don't have it)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> 🤔 **Why?** Homebrew lets you install developer tools safely without manual downloads.

#### Step 2: Install all tools used in this setup

```bash
brew install \
  ghostty \
  starship \
  zinit \
  zoxide \
  fzf \
  eza \
  fastfetch \
  boxes \
  fd
```

#### Step 3: Install a Nerd Font

This font is better suited for terminals and supports icons.

```bash
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
```

---

### 2️⃣ Set Up Ghostty (The Terminal App)

Ghostty is the window you type commands into.

#### Step 1: Create the config folder

```bash
mkdir -p ~/.config/ghostty
open -e ~/.config/ghostty/config
```

> 📝 TextEdit will open an empty file.

#### Step 2: Paste the Ghostty config

1. 📂 Go to this repo → `ghostty/config`
2. 📋 Copy everything
3. 📝 Paste it into TextEdit
4. 💾 Save and close

---

### 3️⃣ Configure Zsh (How Commands Run)

#### Step 1: Open .zshrc in TextEdit

```bash
open -e ~/.zshrc
```

#### Step 2: Paste the Zsh config

1. 📂 Open `zsh/.zshrc` in this repo
2. 📋 Copy all contents
3. 📝 Paste into TextEdit
4. 💾 Save and close

#### Step 3: Restart the terminal

> 🔄 **On first launch:** Plugins will auto-download. This happens only once.

#### 🎯 What Changes After Zsh Setup?

**1. 🚀 Smarter folder jumping - ditch `cd`, use `z` (zoxide)**

Instead of:
```bash
cd ~/Documents/projects/my-app
```

You can do:
```bash
z my-app
```

> ✅ **Why this is better:**
> - Remembers where you go
> - Less typing
> - Faster navigation

**2. 📁 Better file listing (eza)**

Try this command:
```bash
ll
```

> 👀 **You'll see:**
> - 🎨 Icons
> - 📏 File sizes
> - 🔀 Git status
> - 🧹 Clean layout

...and many more! Try searching about each tool - you'll be surprised how productive you can be.

---

### 4️⃣ Configure Starship (The Prompt)

Starship controls the line before your cursor.

#### Step 1: Create the config folder

```bash
mkdir -p ~/.config
```

#### Step 2: Open Starship config in TextEdit

```bash
open -e ~/.config/starship.toml
```

#### Step 3: Paste the Starship config

1. 📂 Open `starship/starship.toml` in this repo
2. 📋 Copy everything
3. 📝 Paste
4. 💾 Save and close

---

### 5️⃣ Configure Fastfetch (System Info Screen)

Fastfetch shows system info when you open a terminal.

#### Step 1: Create config folder

```bash
mkdir -p ~/.config/fastfetch
```

#### Step 2: Open config in TextEdit

```bash
open -e ~/.config/fastfetch/config.json
```

#### Step 3: Paste Fastfetch config

1. 📂 Open `fastfetch/config.json` in this repo
2. 📋 Copy everything
3. 📝 Paste
4. 💾 Save but **DON'T close it yet**

#### Step 4: Add your image & edit required fields (important)

Fastfetch shows an image (logo/avatar) on the left. We first need to put the image in the correct place.

**📂 Open the folder to drop the image:**

1. 🔍 Open Finder
2. ⌨️ Press `Cmd + Shift + G`
3. 📝 Paste this path and press Enter:

```
~/.config/fastfetch
```

4. 🖼️ Drag your image into this folder
5. ✏️ Make sure you rename it to `logo.png`

> 📍 **At the end, your image should be here:**
> ```
> ~/.config/fastfetch/logo.png
> ```

**✏️ Update the required fields in the file:**

```bash
open -e ~/.config/fastfetch/config.json
```

Inside TextEdit, update these values:

```json
"source": "/Users/{{system_user_name}}/.config/fastfetch/logo.png"
```

```json
"format": "{{any_name}}"
```

> 💡 **Note:** `system_user_name` is your Mac username. You can see it by going to **Macintosh HD → Users**

---

## 🎉 Setup Complete!

### 📚 Quick Reference

Type in your terminal now:
```bash
cheat
```

> 👀 **You'll see:**
> - ⌨️ Cursor shortcuts
> - 🗑️ Delete shortcuts
> - 🔀 Git commands
> - 🧭 Navigation tips

---

## 🤝 Contributing

Found an issue or want to improve this setup? Feel free to:

1. 🐛 [Open an issue](../../issues)
2. 🔧 Submit a pull request
3. ⭐ Star this repo if it helped you!

## 📄 License

[MIT License](LICENSE) — free to copy, modify, and reuse.

---

**⭐ If this helped you, please consider starring the repo! ⭐**

Made with ❤️ for the terminal enthusiast community
