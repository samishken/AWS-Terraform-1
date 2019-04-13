#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
apt-get update
apt-get -y install nginx
cd /var/www/html
echo  "<html><h1>ByteCubed Challenge ${HOSTNAME}</h1></html>" > index.html

# make sure nginx is started
service nginx start
