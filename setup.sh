#!/bin/bash
sudo apt-get update

sudo apt-get -qqy install \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common \
	make \
	git \
	tig

## Install docker

if ! type docker 2>/dev/null; then
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable"

	sudo apt-get install docker-ce
	sudo docker run hello-world

	sudo usermod -g docker ${USER}
	sudo /bin/systemctl restart docker.service

	cp docker_config.json ~/.docker/config.json
fi

## Git config

git config --global user.name iyahoo
git config --global user.email s1200191@gmail.com

## bash
echo "" >> ~/.bashrc
echo "# config" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "export EDITOR=vim" >> ~/.bashrc

