#!/bin/sh

if ! [ $(id -u) = 0 ]; then
    echo "Sorry, who are you? Not root!"
    exit 1
fi

user=$SUDO_USER

if ! [ $user ]; then
    user=$USER
fi

sudo -u $user echo "Discord Updaters/PTB.sh - https://github.com/VoidNulll/discord-updaters"

sudo -u $user echo "[INFO] Updating/installing Discord PTB... This may take a while" &
wait

sudo -u $user wget -O discord-ptb.deb "https://discordapp.com/api/download/ptb?platform=linux&format=deb" &
wait

dpkg -i discord-ptb.deb &
wait

sudo -u $user echo "[INFO] [SUCCESS] Discord PTB has been updated/installed!" &
wait

sudo rm -rf discord-ptb.deb

sudo -u $user discord-ptb
