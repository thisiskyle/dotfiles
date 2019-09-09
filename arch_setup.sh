#!/bin/bash

echo "========================== Updating Arch"
sudo pacman -Syu

echo "========================== Installing Basic Packages"
sudo pacman -S i3-gaps i3blocks vim neofetch feh dmenu go qutebrowser xorg xorg-xinit

echo "========================== Installing Yay"
git clone https://aur.archlinux.org/yay.git ~/yay
cd $HOME/yay
makepkg -i
cd $HOME 
sudo rm -R $HOME/yay
sudo yay -Syu

echo "========================== Installing gotop"
yay -S gotop

echo "========================== Downloading Simple Terminal"
curl -o st-0.8.2.tar.gz dl.suckless.org/st/st-0.8.2.tar.gz
tar -zvxf $HOME/st-0.8.2.tar.gz

echo "========================== Installing Dotfiles"
$HOME/.dotfiles/cp_dotfiles.sh -i

echo "========================== Installing Simple Terminal"
cd $HOME/st-0.8.2
sudo make clean install
rm $HOME/st-0.8.2.tar.gz

echo "========================== Installing Vim Config"
git clone https://github.com/thisiskyle/vimfiles $HOME/.vim
cp $HOME/.vim/.vimrc $HOME/

echo "========================== Done!"
