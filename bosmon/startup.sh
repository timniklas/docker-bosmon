#!/bin/bash

x-window-manager &

# Link persistent storage 1
mkdir -p /data/program
ln -sT /data/program "/root/.wine/drive_c/users/root/AppData/Roaming/BosMon"
# Link persistent storage 2
mkdir -p /data/appdata
ln -sT /data/appdata "/root/.wine/drive_c/Program Files/BosMon"

# Install BosMon
if [ ! -f "/root/.wine/drive_c/Program\ Files/BosMon/BosMon.exe" ]; then
    ./install_bosmon.sh &
    wine bosmon_setup.exe /silent /COMPONENTS=bosmon
fi

while true
do
    wine /root/.wine/drive_c/Program\ Files/BosMon/BosMon.exe
    sleep 1
done
