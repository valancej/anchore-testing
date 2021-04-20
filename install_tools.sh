#!/bin/bash

set -e
# Update and install docker and git

sudo yum update -y & sudo yum install docker git -y

sudo systemctl start docker

# Install Helm

sudo curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Install kind

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.10.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin

# Install kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin

sudo usermod -aG docker $USER