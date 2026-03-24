#!/bin/bash

# Install zsh
if ! command -v zsh &>/dev/null; then
  sudo apt update && sudo apt install zsh -y
fi

# Set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s $(which zsh)
fi

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://install.ohmyz.sh)" "" --unattended
else
  echo "Oh My Zsh already installed, updating..."
  cd ~/.oh-my-zsh && git pull
fi

# Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "Powerlevel10k already installed, updating..."
  cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && git pull
fi

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
  echo "zsh-autosuggestions already installed, updating..."
  cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && git pull
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
  echo "zsh-syntax-highlighting already installed, updating..."
  cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git pull
fi

# Configure .zshrc
if ! grep -q "powerlevel10k" ~/.zshrc; then
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
fi

if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
  sed -i 's/plugins=(git)/plugins=(git docker docker-compose dotnet sudo z zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
fi

# Fix PATH
if ! grep -q '\.local/bin' ~/.zshrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
fi

source ~/.zshrc

echo ""
echo "✅ Done! Please:"
echo "  1. Close and reopen your terminal"
echo "  2. Powerlevel10k wizard will run on first open — just follow the prompts"
