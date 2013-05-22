#!/bin/bash

# Add public key for chrome repo
(wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - ) || exit 1;

# Add chrome to apt-get repo list
(echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list) ||  (echo "Failed to add apt sources" && exit 2);

# Update apt-get rep list
apt-get update || (echo "Failed on update of repo list" && exit 3);


# Install Chrome
apt-get -y install google-chrome-stable || (echo "Install failed!" && exit 4);
