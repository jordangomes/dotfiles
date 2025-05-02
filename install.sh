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
yay -S --needed fish starship stow neovim fastfetch

# Installing Desktop Core Packages
yay -S --needed hyprland hyprlock hyprpaper rofi-wayland waybar xdg-desktop-portal xdg-desktop-portal-hyprland

# Install Core Utilities
yay -S --needed network-manager-applet grim slurp wl-clipboard nvim

# Install Fonts
yay -S --needed otf-firamono-nerd ttf-firacode-nerd ttf-hack ttf-icomoon-feather otf-font-awesome

# Install Cursor
yay -S --needed rose-pine-hyprcursor

# Install KDE tools/utils
yay -S --needed plasma-workspace \
        kservice5 \
        kdbusaddons5 \
        kfilemetadata5 \
        kconfig5  \
        kcoreaddons5 \
        kcrash5 \
        kguiaddons5 \
        ki18n5 \
        kitemviews5 \
        kwidgetsaddons5 \
        kwindowsystem5 \
        kservice5 \
        dolphin \
        dolphin-plugins \
        kdegraphics-thumbnailers \
        ffmpegthumbs \
        kdeconnect \
        sshfs

# Install rice
yay -S -needed qt6ct-kde candy-icons-git plasma5-themes-sweet-full-git sweet-gtk-theme

# Install Desktop Apps
yay -S --needed alacritty zen-browser-bin nautilus steam discord spotify visual-studio-code-bin mpv gwenview gimp libreoffice-still

# Install dotfiles
cd $SCRIPT_DIR
stow .

# return to the users initial directory
cd $INITIAL_DIR
