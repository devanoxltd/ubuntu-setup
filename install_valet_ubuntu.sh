#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Ubuntu dev Server
# Run like (without sudo) - bash install_lamp_ubuntu.sh
# Script should auto terminate on errors

export DEBIAN_FRONTEND=noninteractive


echo -e "\e[96m Stop apache server to reflect changes  \e[39m"
sudo service apache2 stop

echo -e "\e[96m Installing Requirements  \e[39m"
sudo apt-get -y install network-manager libnss3-tools jq xsel

valet install