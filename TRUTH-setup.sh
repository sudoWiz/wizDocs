#!/bin/bash

## DNF Packages
sudo dnf remove firefox -y # removing to make way for flatpak version
sudo dnf update -y

### Nvidia drivers
sudo dnf install akmod-nvidia \
xorg-x11-drv-nvidia-cuda -y

### VSCodium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium -y

sudo dnf install \
xrdp \
gnome-tweaks \
micro \
neofetch \
syncthing \
tilix \
fish \
python3-pip \
util-linux-user -y

chsh -s /usr/bin/fish # change user to Fish shell
sudo chsh -s /usr/bin/fish # change root to Fish shell

sudo systemctl enable --now syncthing@USER.service

## pip3
pip3 install --user \
gnome-extensions-cli \ # for managing and automating gnome shell extentions
ansible \ # automation and infrastructure management
bpytop # pretty system monitor

## Gnome Shell Extensions
gnome-extensions-cli install 517 906 1262 1319 2087 2890
# 517 Caffeine
# 906 Sound Input & Output Device Chooser
# 1262 Bing Wallpaper
# 1319 GSConnect
# 2087 Desktop Icons NG (DING)
# 2890 Tray Icons: Reloaded

## Flatpak
### Add Flathub Repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

### Install Flatpaks
flatpak install flathub org.mozilla.firefox \
com.github.Eloston.UngoogledChromium \
com.spotify.Client \
com.bitwarden.desktop \
org.videolan.VLC \
org.remmina.Remmina \
org.gnome.Epiphany \
org.telegram.desktop \
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
com.uploadedlobster.peek 
org.mozilla.Thunderbird \
ch.protonmail.protonmail-bridge -y

## to-do list (manual steps)
echo > ~/Desktop/to-do.md "- [ ] dark mode
- [ ] sign into steam
- [ ] mount game drive and configure auto-mount with Disks
- [ ] mount Blue and Black the same way
- [ ] sign into bitwarden
- [ ] sign into firefox
- [ ] configure ungoogled chromium for Discord
    - [ ] do not delete cookies
    - [ ] discord as homepage
    - [ ] ddg as search
- [ ] syncthing: activate documents sync
- [ ] sign into obsidian, enable sync
- [ ] sign into github for git control
- [ ] sign into protonmail-bridge and connect to Thunderbird
- [ ] sign into protonvpn
