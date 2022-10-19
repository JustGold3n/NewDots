#!/bin/bash

#mkdir ~/Gold3n_dotfiles && cd ~/Gold3n_dotfiles || exit 
# intall paru
sudo pacman -S vim --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru || exit
makepkg -si
# intall yoru
paru -Sy awesome-git picom-git wezterm rofi acpi acpid acpi_call upower lxappearance-gtk3 jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg blueman redshift pipewire pipewire-alsa pipewire-pulse alsa-utils brightnessctl feh maim mpv mpd mpc mpdris2 python-mutagen ncmpcpp neovim-nightly-bin neovide playerctl --needed

systemctl --user enable mpd.service
systemctl --user start mpd.service

git clone --depth 1 --recurse-submodules https://github.com/rxyhn/yoru.git
cd yoru && git submodule update --remote --merge
# najít všechny části konfigu a pushnout je (zsh, upravení gdk, upravení fontu ve Wezterm)

cp -r misc/home ~

cp -r config/* ~/.config/
cp -r misc/fonts/* ~/.fonts/
cp -r ~/newdots/fire.jpg .config/awesome/theme/assets/fire.jpg

fc-cache -fv
# nvim config (nyoom, neovide + custom)
git clone --depth 1 https://github.com/shaunsingh/nyoom.nvim.git ~/.config/nvim 
cd ~/.config/nvim/ || exit
bin/nyoom install 
bin/nyoom sync


cp -r ~/newdots/wezterm.lua  ~/.config/wezterm/wezterm.lua
cp -r ~/newdots/init.lua ~/.config/nvim/init.lua
cp -r ~/newdots/apps.lua ~/.config/awesome/configuration/apps.lua

git clone https://github.com/rxyhn/AestheticStuff.git

sudo cp -rf Aesthetic-Night/* /usr/share/themes
cp -rf Aesthetic-Night-GTK4/* ~/.config/gtk-4.0

echo "gtk-decoration-layout=close,maximize,minimize:menu" >> ~/.config/gtk-3.0/settings.ini
#https://github.com/rxyhn/yoru/tree/eadcff1c79221aae8f31362449bb4cd52f018186
