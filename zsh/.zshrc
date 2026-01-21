#!/usr/bin/env zsh
# =========================================================
# Rishabh’s Zsh Configuration
# ---------------------------------------------------------
# Fast • Clean • Lazy-loaded
# Author  : Rishabh
# GitHub  : https://github.com/dev-rishabhverma
# License : MIT
# =========================================================
#
# Terminal   : Ghostty
# Shell      : Zsh
# Prompt     : Starship
# Plugin Mgr : Zinit (async, lightweight)
#
# Tooling
# --------
# • zoxide   → smarter `cd` with frecency
# • fzf      → fuzzy search everywhere
# • eza      → modern `ls` replacement
# • fastfetch→ startup system summary
#
# Philosophy
# ----------
# • XDG-compliant (clean $HOME)
# • Async plugins for instant shell startup
# • Safe defaults + productivity aliases
# • Optimized for daily dev workflows
#
# Platform
# --------
# • macOS (Apple Silicon & Intel)
# • Works locally and over SSH
#
# Repo
# ----
# Public dotfiles, opinionated but documented.
# Fork freely. Steal aggressively.
# =========================================================


# -------------------------
# XDG Directory Standard
# Keeps your home folder clean
# -------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# -------------------------
# Command History
# Shared • Deduplicated • Instant
# -------------------------

# Where history is stored (XDG-compliant, keeps $HOME clean)
HISTFILE="$XDG_CONFIG_HOME/zsh/history"

# Number of commands kept in memory & on disk
HISTSIZE=10000        # In-memory history
SAVEHIST=10000        # Saved to file

# --- History behavior ---

setopt APPEND_HISTORY         # Append new commands instead of overwriting history
setopt INC_APPEND_HISTORY    # Write commands to history immediately (no shell exit needed)
setopt SHARE_HISTORY         # Share history across all open terminals in real time

# --- Deduplication & cleanliness ---

setopt HIST_IGNORE_ALL_DUPS  # Remove older duplicate entries
setopt HIST_SAVE_NO_DUPS    # Do not write duplicates to history file
setopt HIST_FIND_NO_DUPS    # Skip duplicates when searching history

# --- Quality-of-life improvements (widely used defaults) ---

setopt HIST_IGNORE_SPACE     # Ignore commands starting with a space (useful for secrets)
setopt HIST_REDUCE_BLANKS    # Trim unnecessary spaces from commands
setopt EXTENDED_HISTORY     # Save timestamps + execution duration


# -------------------------
# Zinit (Plugin Manager)
# -------------------------
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

# -------------------------
# Zinit Plugins
# Async • Minimal • Purpose-driven
# -------------------------

# --- Typing & feedback ----------------------------------

# Syntax highlighting as you type (commands, flags, paths)
# Must be loaded early for correct coloring
zinit light zsh-users/zsh-syntax-highlighting

# Fish-like autosuggestions based on history (async)
# Accept with → or Ctrl+E
zinit ice wait'0' silent
zinit light zsh-users/zsh-autosuggestions


# --- Completion & navigation ----------------------------

# Enhanced Tab completion with fzf-style UI (async)
# Shows previews, groups, and descriptions
zinit ice wait'1' silent
zinit light Aloxaf/fzf-tab

# Search command history using partial matches (async)
# ↑ / ↓ cycle through matching commands
zinit ice wait'1' silent
zinit light zsh-users/zsh-history-substring-search


# --- Productivity helpers -------------------------------

# Desktop notification when long-running commands finish (async)
# Great for builds, installs, and scripts
zinit ice wait'2' silent
zinit light MichaelAquilina/zsh-auto-notify

# Gently reminds you to use existing aliases (async)
# Example: suggests `gs` when you type `git status`
zinit ice wait'2' silent
zinit light MichaelAquilina/zsh-you-should-use


# --- Visual consistency --------------------------------

# Shared color definitions for ls / eza / tree (async)
# Makes file listings consistent across tools
zinit ice wait'1' silent
zinit light trapd00r/LS_COLORS


# --- Oh My Zsh snippets (lightweight, no framework) -----

# Git shortcuts and helpers
zinit snippet OMZP::git

# Quickly re-run commands with sudo (`sudo !!`)
zinit snippet OMZP::sudo

# Suggests packages to install when a command is missing
zinit snippet OMZP::command-not-found

# Universal archive extractor (`extract file.tar.gz`)
zinit snippet OMZP::extract

# Copy file contents or paths to clipboard (macOS-friendly)
zinit snippet OMZP::copyfile
zinit snippet OMZP::copypath


# -------------------------
# Completion System
# Fast • Cached • Plugin-aware
# -------------------------

# Load Zsh’s completion engine
# Required for Tab completion, fzf-tab, and most plugins
autoload -Uz compinit

# Initialize completion using cache
# -C = skip security checks for faster startup (safe for single-user systems)
compinit -C -d "$XDG_CACHE_HOME/zsh/zcompdump"


# -------------------------
# Keybindings
# Consistent • Muscle-memory friendly
# -------------------------

# Use Emacs-style keybindings (default & widely expected)
# Enables Ctrl+A / Ctrl+E / Ctrl+W / etc.
bindkey -e

# History substring search
# Allows partial command matching when pressing ↑ / ↓
# Example: typing "git" + ↑ cycles through git commands
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# -------------------------
# Starship Prompt
# -------------------------
eval "$(starship init zsh)"

# -------------------------
# Zoxide (smart cd)
# Lazy-loaded on first use
# -------------------------
z() {
  unfunction z
  eval "$(zoxide init zsh)"
  z "$@"
}

# -------------------------
# FZF
# Lazy-loaded on first use
# -------------------------
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

fzf() {
  unfunction fzf
  command -v fzf >/dev/null || return
  eval "$(command fzf --zsh)"
  fzf "$@"
}


# -------------------------
# File Listing (eza)
# Modern • Readable • Git-aware
# -------------------------

# Replace ls with a modern, colorized, icon-enabled alternative
alias ls="eza --icons"

# Long listing: permissions, sizes, timestamps + git status
# Equivalent to: ls -lah
alias ll="eza -lah --icons --git"

# Directory tree view (2 levels deep)
# Great for quick project overviews
alias lt="eza --tree --icons --level=2"


# -------------------------
# Git Workflow
# Short • Muscle-memory friendly
# -------------------------

# Check working tree status
alias gs="git status"

# Stage files (use: ga .)
alias ga="git add"

# Commit with inline message (gc "message")
alias gc="git commit -m"

# Push / pull current branch
alias gp="git push"
alias gl="git pull"


# -------------------------
# Config Shortcuts
# Edit frequently touched dotfiles
# -------------------------

# Zsh configuration
alias editzsh="${EDITOR:-vim} ~/.zshrc"

# Starship prompt configuration
alias editstarship="${EDITOR:-vim} ~/.config/starship.toml"

# Ghostty terminal configuration
alias editghost="${EDITOR:-vim} ~/.config/ghostty/config"


# -------------------------
# Safety Aliases
# Prevent accidental data loss
# -------------------------

# Interactive prompts before destructive actions
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"


# -------------------------
# Ghostty SSH compatibility
# -------------------------
if [[ -n "$SSH_CONNECTION" ]]; then
  export TERM=xterm-256color
fi

# -------------------------
# System summary on shell launch
# -------------------------

# Display a fast system overview when a new terminal opens
# Runs only in interactive shells and only if fastfetch is installed
if [[ -o interactive ]] && [[ -z "$FASTFETCH_SHOWN" ]] && command -v fastfetch >/dev/null 2>&1; then
  export FASTFETCH_SHOWN=1
  fastfetch
fi


# -------------------------
# cheat()
# Interactive Terminal Cheat Sheet
# -------------------------
# Displays a quick, visually formatted reference for
# common terminal navigation + custom aliases.
#
# Usage:
#   cheat
# -------------------------

cheat() {
  {
    # Header
    printf "\033[1;36m🚀 TERMINAL QUICK CHEAT SHEET\033[0m\n\n"

    # Cursor movement
    printf "\033[1;33m🧭 Cursor Movement\033[0m\n"
    printf "  ⌥ ← / →     \033[32mMove by word\033[0m\n"
    printf "  ⌘ ←         \033[32mStart of line\033[0m\n"
    printf "  ⌘ →         \033[32mEnd of line\033[0m\n\n"

    # Deletion shortcuts
    printf "\033[1;31m🗑  Deletion\033[0m\n"
    printf "  Ctrl + U    \033[35mDelete entire line\033[0m\n"
    printf "  Ctrl + K    \033[35mDelete to end of line\033[0m\n"
    printf "  ⌥ ⌫         \033[35mDelete previous word\033[0m\n"
    printf "  ⌥ D         \033[35mDelete next word\033[0m\n\n"

    # Git aliases
    printf "\033[1;35m🌿 Git Aliases\033[0m\n"
    printf "  gs          \033[35mgit status\033[0m\n"
    printf "  ga          \033[35mgit add\033[0m\n"
    printf "  gc \"msg\"    \033[35mgit commit -m\033[0m\n"
    printf "  gl          \033[35mgit pull\033[0m\n"
    printf "  gp          \033[35mgit push\033[0m\n\n"

    # Directory navigation
    printf "\033[1;34m📂 Navigation\033[0m\n"
    printf "  z <name>    \033[36mSmart jump (zoxide)\033[0m\n"
    printf "  ll          \033[36mDetailed file list (eza)\033[0m\n"
    printf "  lt          \033[36mTree view (2 levels)\033[0m\n\n"

    # Config shortcuts
    printf "\033[1;36m⚙️  Config Shortcuts\033[0m\n"
    printf "  editzsh     \033[36mEdit ~/.zshrc\033[0m\n"
    printf "  editstarship\033[36mEdit starship.toml\033[0m\n"
    printf "  editghost  \033[36mEdit Ghostty config\033[0m\n"

  } | command -v boxes >/dev/null && boxes -d shell || cat
}

## --------------------------------- ##

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
