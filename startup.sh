#!/bin/bash
# 1. Non-interactive frontend to prevent apt from hanging
export DEBIAN_FRONTEND=noninteractive

# 2. Update and install prerequisites
apt-get update -y
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# 3. Add Docker’s official GPG key and repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 4. Install Docker
apt-get update -y
apt-get install -y docker-ce

# 5. Start Docker
systemctl start docker
systemctl enable docker

# 6. Run the uber-app image (Added -d for detached mode)
docker pull digdock2/uber-app:latest
docker run -d -p 5000:5000 --name flask_app --restart always digdock2/uber-app:latest
