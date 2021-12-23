#!/bin/bash

## DNF Packages
sudo dnf remove firefox -y
sudo dnf update -y

## Uncomment next 2 lines for Nvidia drivers
##dnf install akmod-nvidia \
##xorg-x11-drv-nvidia-cuda \

sudo dnf install \
xrdp \
gnome-tweaks \
micro \
neofetch \
syncthing \
fish \
python3-pip \
util-linux-user -y

chsh -s wiz /usr/bin/fish
sudo chsh -s /usr/bin/fish

sudo systemctl enable --now syncthing@USER.service

## pip3
pip3 install protonup

## Gnome Shell Extensions
gnome-extensions install 517 # Caffeine
gnome-extensions install 906 # Sound Input & Output Device Chooser
gnome-extensions install 1262 # Bing Wallpaper
gnome-extensions install 1319 # GSConnect
gnome-extensions install 2890 # Tray Icons: Reloaded
## Flatpak 
## Add Flathub Repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y

## Install Flatpaks
flatpak install flathub org.mozilla.firefox \
com.github.Eloston.UngoogledChromium \
com.spotify.Client \
com.bitwarden.desktop \
flathub org.videolan.VLC \
org.remmina.Remmina \
org.gnome.Epiphany \
org.telegram.desktop \
flathub com.leinardi.gwe \
org.gabmus.hydrapaper \
md.obsidian.Obsidian \
com.github.tchx84.Flatseal \
org.gnome.Extensions \
flathub org.jitsi.jitsi-meet \
com.github.wwmm.easyeffects \

## to-do list (manual steps)
touch ~/Desktop/to-do.md
cat > ~/Desktop/to-do.md
- [ ] dark mode
- [ ] mount game drive on boot
- [ ] sign into steam
- [ ] configure game drive in steam
- [ ] sign into bitwarden
- [ ] sign into firefox
- [ ] configure ungoogled chromium for Discord
- [ ] syncthing documents sync
- [ ] sign into obsidian
- [ ] mount black and blue
- [ ] enable WoWOL