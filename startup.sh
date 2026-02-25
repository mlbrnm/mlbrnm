#!/bin/bash
# 1. Update and install prerequisites
apt-get update -y
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# 2. Add Docker’s official GPG key and repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 3. Install Docker
apt-get update -y
apt-get install -y docker-ce

# 4. Start Docker and ensure it runs on boot
systemctl start docker
systemctl enable docker

# 5. Pull and run the uber-app image
docker pull digdock2/uber-app:latest
docker run -p 5000:5000 --restart always digdock2/uber-app:latest
