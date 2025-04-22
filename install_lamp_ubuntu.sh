#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Ubuntu dev Server
# Run like (without sudo) - bash install_lamp_ubuntu.sh
# Script should auto terminate on errors

export DEBIAN_FRONTEND=noninteractive

echo -e "\e[96m Adding PPA  \e[39m"
sudo add-apt-repository -y ppa:ondrej/apache2
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

echo -e "\e[96m Installing apache  \e[39m"
sudo apt-get -y install apache2

INSTALL_PHP_VER=${1:-8.4}

echo -e "\e[96m Installing php - ${INSTALL_PHP_VER} \e[39m"
sudo apt-get -y install "php${INSTALL_PHP_VER}-cli" "php${INSTALL_PHP_VER}-fpm"

sudo apt-get -y install curl zip unzip

echo -e "\e[96m Installing php extensions \e[39m"

sudo apt-get -y install php8.4-cli php8.4-curl php8.4-ctype php8.4-uuid \
  php8.4-pgsql php8.4-sqlite3 php8.4-gd \
  php8.4-imap php8.4-mysql php8.4-mbstring php8.4-iconv \
  php8.4-xml php8.4-zip php8.4-bcmath php8.4-soap php8.4-gettext \
  php8.4-intl php8.4-readline \
  php8.4-msgpack php8.4-igbinary php8.4-ldap \
  php8.4-redis php8.4-grpc php8.4-opcache


echo -e "\e[96m Enable php-fpm  \e[39m"
sudo a2enmod proxy_fcgi
# sudo a2dismod "php${INSTALL_PHP_VER}"
sudo a2enconf "php${INSTALL_PHP_VER}-fpm"
sudo a2dismod mpm_prefork
sudo a2enmod mpm_event
sudo a2enmod http2

#sudo apt-get -y install php-xdebug
sudo phpenmod curl

# Enable some apache modules
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod headers

echo -e "\e[96m Restart apache server to reflect changes  \e[39m"
sudo service apache2 restart

# Download and install composer
echo -e "\e[96m Installing composer \e[39m"
# Notice: Still using the good old way
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --force --filename=composer
# Add this line to your .bash_profile
# export PATH=~/.composer/vendor/bin:$PATH

echo -e "\e[96m Installing mysql client \e[39m"
sudo apt install -y mysql-client

echo -e "\e[96m Installing mysql server \e[39m"
sudo apt install -y mysql-server

# Install latest git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y install git

# Clean up cache
sudo apt-get clean

# Check for git version
git --version

# Check php version
php -v

# Check apache version
apachectl -v

# Check if php is working or not
php -r 'echo "\nYour PHP installation is working fine.\n";'

# Fix composer folder permissions
mkdir -p ~/.composer
sudo chown -R "$USER" "$HOME/.composer"

# Check composer version
composer --version

echo -e "\e[92m Open http://localhost/ to check if apache is working or not. \e[39m"

