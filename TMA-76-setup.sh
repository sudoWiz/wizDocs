#!/bin/bash

sudo hostname TMA-76

## RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf groupupdate core -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install libdvdcss -y
sudo dnf install rpmfusion-nonfree-release-tainted -y
sudo dnf install \*-firmware -y

## System76
sudo dnf copr enable szydell/system76 -y
sudo dnf install system76-dkms system76-power system76-driver system76-firmware firmware-manager system76-io-dkms system76-acpi-dkms -y
sudo systemctl enable system76-power system76-power-wake system76-firmware-daemon
sudo systemctl start system76-power system76-firmware-daemon
systemctl enable --user com.system76.FirmwareManager.Notify.timer

## DNF Packages
sudo dnf remove firefox -y # removing to make way for flatpak version
sudo dnf update -y

## Git setup
git config --global user.name "Wiz"
git config --global user.email "wiz@privatewizard.com"
git config pull.rebase false

### VSCodium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium -y

sudo dnf install \
fortune-mod \
gnome-tweaks \
micro \
neofetch \
syncthing \
tilix \
fish \
python3-pip \
util-linux-user -y # required for chsh

chsh -s /usr/bin/fish # change user to Fish shell
sudo chsh -s /usr/bin/fish # change root to Fish shell

sudo systemctl enable --now syncthing@USER.service

## pip3
pip3 install --user \
gnome-extensions-cli \
ansible \
bpytop

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
org.gnome.World.PikaBackup \
org.gnome.gitlab.YaLTeR.VideoTrimmer \
com.uploadedlobster.peek \
org.mozilla.Thunderbird \
ch.protonmail.protonmail-bridge -y

## to-do list (manual steps)
echo > ~/Desktop/to-do.md "- [ ] dark mode
- [ ] set keyboard shortcuts for terminal, browser, and files
- [ ] sign into steam
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
- [ ] change fish greeting
    - [ ] funced fish_greeting
    - [ ] fortune
    - [ ] funcsave fish_greeting"
