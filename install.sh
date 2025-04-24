#!/bin/sh
set INITIAL_DIR $PWD
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install Yay
yay=$(which yay)
if [ ! -z $yay ]; then
    echo "Yay already installed skipping"
else
    echo "Installing Yay"
    sudo pacman -S --needed git base-devel
    mkdir /tmp
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $SCRIPT_DIR
    rm -rf /tmp/yay
fi

# Install Command Line Utilities
yay -S --needed fish starship stow neovim

# Installing Desktop Core Packages
yay -S --needed hyprland hyprlock hyprpaper rofi-wayland waybar

# Install Core Utilities
yay -S --needed network-manager-applet grim slurp wl-clipboard nvim

# Install Fonts
yay -S --needed otf-firamono-nerd ttf-firacode-nerd ttf-hack ttf-icomoon-feather otf-font-awesome

# Install Desktop Apps
yay -S --needed alacritty zen-browser-bin nautilus steam discord spotify visual-studio-code-bin mpv

# Install dotfiles
stow .

# return to the users initial directory
cd $INITIAL_DIR
