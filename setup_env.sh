#!/bin/bash

echo "------------------- Setting up dhcpcd"
sudo systemctl start dhcpcd
sudo systemctl enable dhcpcd

echo "------------------- Waiting for dhcpcd"
sleep 30s

echo "------------------- Setting up time sync"
sudo timedatectl set-ntp true

echo "------------------- Updating Arch"
sudo pacman -Syu

echo "------------------- Installing basic packages"
sudo pacman -S - < $HOME/arch_utils/config/pkglist.txt

echo "------------------- Cloning yay"
git clone https://aur.archlinux.org/yay.git $HOME/yay

echo "------------------- Installing yay"
cd $HOME/yay && makepkg -si

echo "------------------- Updating yay"
yay -Syu

echo "------------------- Installing AUR packages"
yay -S yt-dlp yt-dlp-drop-in 

echo "------------------- Cloning suckless software"

echo "------------------- Cloning st"
git clone https://git.suckless.org/st $HOME/suckless/st

echo "------------------- Cloning dwm"
git clone https://git.suckless.org/dwm $HOME/suckless/dwm

echo "------------------- Cloning dmenu"
git clone https://git.suckless.org/dmenu $HOME/suckless/dmenu

echo "------------------- Cloning slock"
git clone https://git.suckless.org/slock $HOME/suckless/slock

echo "------------------- Installing dotfiles"
$HOME/arch_utils/dotfiles_install.sh

echo "------------------- Compiling st"
cd $HOME/suckless/st
sudo make clean install

echo "------------------- Compiling dwm"
cd $HOME/suckless/dwm
sudo make clean install

echo "------------------- Compiling dmenu"
cd $HOME/suckless/dmenu
sudo make clean install

echo "------------------- Compiling slock"
cd $HOME/suckless/slock
sudo make clean install

echo "------------------- Downloading vim config"
git clone https://github.com/thisiskyle/vim.git $HOME/.vim

echo "------------------- Creating symlink to .vimrc"
ln -sf ${HOME}/.vim/.vimrc ${HOME}/.vimrc

echo "------------------- Sourcing .bash_profile"
source ${HOME}/.bash_profile

echo "------------------- Setting background"

echo "------------------- Cleanup"
cd $HOME 
sudo rm -R $HOME/yay

echo "------------------- Arch environment setup complete!"
