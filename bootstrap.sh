#!/usr/bin/env bash

##################################################
# Install required package
##################################################
apt-get update

export DEBIAN_FRONTEND=noninteractive
apt-get install -y mysql-server-5.5

apt-get install -y apache2

apt-get install -y php5
apt-get install -y php5-mysql

rm -rf /var/www
ln -s /vagrant-www/fa /var/www

service apache2 restart

apt-get install -y curl
apt-get install -y git

# Zombie JS 
apt-get intall -y build-essential # get gcc
apt-get install -y node
apt-get install -y npm
npm install -g zombie@2.0.0-alpha1


