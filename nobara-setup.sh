#!/bin/bash

## DNF Packages
sudo dnf remove firefox -y
sudo dnf update -y

## Uncomment next 2 lines for Nvidia drivers
#dnf install akmod-nvidia \
#xorg-x11-drv-nvidia-cuda \

sudo dnf install \
git \
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
pip3 install --user gnome-extensions-cli

## Gnome Shell Extensions
gnome-extensions-cli install 517 906 989 1262 1319 2087 2890
# 517 Caffeine
# 906 Sound Input & Output Device Chooser
# 989 Syncthing Icon
# 1262 Bing Wallpaper
# 1319 GSConnect
# 2087 Desktop Icons NG (DING)
# 2890 Tray Icons: Reloaded

## Flatpak 
## Add Flathub Repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y

## Install Flatpaks
flatpak install flathub org.mozilla.firefox \
com.github.Eloston.UngoogledChromium \
com.spotify.Client \
com.bitwarden.desktop \
org.videolan.VLC \
org.remmina.Remmina \
org.gnome.Epiphany \
org.telegram.desktop \
om.leinardi.gwe \
org.gabmus.hydrapaper \
md.obsidian.Obsidian \
com.github.tchx84.Flatseal \
org.gnome.Extensions \
org.jitsi.jitsi-meet \
com.github.wwmm.easyeffects \
net.davidotek.pupgui2 \
de.haeckerfelix.Fragments \
com.bitstower.Markets \
org.gnome.World.PikaBackup \
org.gnome.gitlab.YaLTeR.VideoTrimmer \
com.uploadedlobster.peek -y

## to-do list (manual steps)
echo > ~/Desktop/to-do.md "- [ ] dark mode
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
- [ ] connect wizDocs github"
