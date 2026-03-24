# wsl-setup

Quick terminal setup script for WSL/Linux and Android (Termux).

## What it installs

- **Zsh** — shell
- **Oh My Zsh** — plugin/theme manager
- **Powerlevel10k** — prompt theme
- **zsh-autosuggestions** — command suggestions from history
- **zsh-syntax-highlighting** — colors commands as you type

## Plugins

`git` `docker` `docker-compose` `dotnet` `sudo` `z` `zsh-autosuggestions` `zsh-syntax-highlighting`

> Mobile version skips `docker`, `docker-compose`, `dotnet`

## Install

**WSL / Linux**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lapius/wsl-setup/refs/heads/main/setup.sh)"
```

**Termux (Android)**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lapius/wsl-setup/refs/heads/main/setup-mobile.sh)"
```

## Notes

- Safe to re-run — will update existing installations instead of reinstalling
- Powerlevel10k wizard runs on first terminal open after install
- For WSL: install [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads) and set it in Windows Terminal → Settings → Ubuntu → Appearance → Font
