#!/bin/sh
sudo apt-get update

# Install docker
sudo apt-get -qqy install \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common \
	make \
	git \
	tig

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

sudo apt-get install docker-ce
sudo docker run hello-world

sudo usermod -g docker ${USER}
sudo /bin/systemctl restart docker.service

cat <<EOF > ~/.docker/config.json
{
    "detachKeys": "ctrl-\\"
}
EOF

git config --global user.name iyahoo
git config --global user.email s1200191@gmail.com
