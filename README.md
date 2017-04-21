# ownCloud
Docker image for [ownCloud](https://owncloud.org), based on the [Ubuntu 16.04 Docker Image](https://hub.docker.com/_/ubuntu/)

> _Requires Docker to be installed and running :whale2: [Docker Install](https://docs.docker.com/engine/installation/)_

## Build the image
```bash
$ git clone git@github.com:ishahid/owncloud.git && cd owncloud && docker build -t owncloud .
```

## Or pull the image from Docker Hub
```bash
$ docker pull ishahid/owncloud:9.1
```

## Run the image
```bash
$ docker run -d -p 4000:80 owncloud
```

## Installation
Point your browser to http://localhost:4000 and complete the setup using the [Installation Wizard](https://doc.owncloud.org/server/9.1/admin_manual/installation/installation_wizard.html).
