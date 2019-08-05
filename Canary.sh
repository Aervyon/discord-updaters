#!/bin/sh

if ! [ $(id -u) = 0 ]; then
    echo "Sorry, who are you? Not root!"
    exit 1
fi

user=$SUDO_USER

if ! [ $user ]; then
    user=$USER
fi

sudo -u $user echo "Discord Updaters/Canary.sh - https://github.com/VoidNulll/discord-updaters"

sudo -u $user echo "[INFO] Updating/installing Discord Canary... This may take a while" &
wait

sudo -u $user wget -O discord-canary.deb "https://discordapp.com/api/download/canary?platform=linux&format=deb" &
wait

dpkg -i discord-canary.deb &
wait

sudo -u $user echo "[INFO] [SUCCESS] Discord Canary has been updated/installed!" &
wait

sudo rm -rf discord-canary.deb

sudo -u $user discord-canary
