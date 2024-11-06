#!/bin/bash

x-window-manager &

# Install BosMon
if [ ! -f /root/.wine/drive_c/Program\ Files/BosMon/BosMon.exe ]; then
    ./install_bosmon.sh &
    wine bosmon_setup.exe /silent /COMPONENTS=bosmon
else
    ./install_bosmon.sh &
    wine /root/.wine/drive_c/Program\ Files/BosMon/Activate.exe
fi

while true
do
    wine /root/.wine/drive_c/Program\ Files/BosMon/BosMon.exe
    sleep 1
done
