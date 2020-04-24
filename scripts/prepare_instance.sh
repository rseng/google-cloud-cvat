#!/bin/sh

# This script will install dependencies for cvat, including docker and docker-compose
# UPDATE
# This was developed on Ubuntu 18.04 LTS minimal on Google Cloud with 100GB disk

# Prepare instance (or machine) with Docker, docker-compose, python

sudo apt-get update && \
    sudo apt-get install -y git \
                            build-essential \
                            nginx \
                            vim \
                            python-dev

# Needed module for system python
wget https://bootstrap.pypa.io/get-pip.py
sudo /usr/bin/python get-pip.py
sudo pip install ipaddress
sudo pip install oauth2client

# Install Docker dependencies
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add docker key server
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# OK

# $ sudo apt-key fingerprint 0EBFCD88
# pub   rsa4096 2017-02-22 [SCEA]
#       9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
# uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
# sub   rsa4096 2017-02-22 [S]

# Add stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker!
sudo apt-get update &&
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# test, you will still need sudo
# sudo docker run hello-world

# Docker group should already exist
# sudo groupadd docker

# make sure to add all users that will use docker
sudo usermod -aG docker $USER

# Docker-compose
sudo apt -y install docker-compose
