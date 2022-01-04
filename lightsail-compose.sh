#!/bin/bash
# Starting script for new Lightsail instance.
# Not needed later on, but kept here for documentation.
# Taken from (many thanks): https://raw.githubusercontent.com/mikegcoleman/todo/master/lightsail-compose.sh

# install latest version of docker the lazy way
curl -sSL https://get.docker.com | sh

# make it so you don't need to sudo to run docker commands
usermod -aG docker ubuntu

# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose