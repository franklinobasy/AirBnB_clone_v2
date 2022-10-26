#!/usr/bin/env bash
# automated configuration of web server for web static

# check if nginx is installed
echo "checking if nginx is installed..."
dpkg -s nginx &> /dev/null

if [[ $? -ne 0  ]]
then
	echo "nginx not installed\nTrying to install nginx..."
	sudo apt-get update;
	sudo apt-get install -y nginx;
fi
echo "nginx is installed"

if [[ ! -d "/data" ]]
then
	echo "path /data does not exists, creating /data"
	sudo mkdir /data/
	echo "path /data created"
else
	echo "path /data already exists"
fi

if [[ ! -d "/data/web_static/" ]]
then
        echo "path /data/web_static/ does not exists, creating /data/web_static"
        sudo mkdir -p /data/web_static/
        echo "path /data/web_static/ created"
else
        echo "path /data/web_static/ already exists"
fi

if [[ ! -d "/data/web_static/releases/" ]]
then
        echo "path /data/web_static/releases/ does not exists, creating /data/web_static/releases"
        sudo mkdir -p /data/web_static/releases/
        echo "path /data/web_static/releases/ created"
else
        echo "path /data/web_static/releases/ already exists"
fi

if [[ ! -d "/data/web_static/shared" ]]
then
        echo "path /data/web_static/shared does not exists, creating /data/web_static/shared"
        sudo mkdir -p /data/web_static/shared
        echo "path /data/web_static/shared created"
else
        echo "path /data/web_static/shared already exists"
fi

if [[ ! -d "/data/web_static/releases/test" ]]
then
        echo "path /data/web_static/releases/ does not exists, creating /data/web_static/releases/test"
        sudo mkdir -p /data/web_static/releases/test
        echo "path /data/web_static/releases/test created"
else
        echo "path /data/web_static/releases/test already exists"
fi

echo "creating test file, index.html"
echo "Hello world" | sudo tee /data/web_static/releases/test/index.html
echo "created /data/web_static/releases/test/index.html"

echo "creating symlink /data/web_static/current"
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
echo "created symlink /data/web_static/current"

echo "changing ownership of /data to ubuntu:ubuntu"
sudo chown -R ubuntu:ubuntu /data
sudo chown -R ubuntu:ubuntu /data/*
echo "user and group of /data changed to ubuntu:ubuntu"

sudo sed -i '53i\\tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default

sudo service nginx restart
