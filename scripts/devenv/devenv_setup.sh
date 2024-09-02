#!/bin/bash

# Step 1: Update package lists
echo "Updating package lists..."
sudo apt update
sudo apt upgrade -y

# Step 2: Install Node.js, npm, npx, Git and Docker

echo "Installing Git..."
sudo apt install -y git 

# Add NodeSource repository for the latest Node.js
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -

# Install Node.js
echo "Installing Node.js..."
sudo apt-get install -y nodejs

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

echo "Installing Docker packages..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


printf "\e[32mChecking the installed versions...\e[0m\n\n"

echo "Ubuntu version:"
lsb_release -a

echo "Node.js version:"
# verifies the right Node.js version is in the environment
node -v # should print `v22.7.0`

echo "npm version:"
# verifies the right npm version is in the environment
npm -v # should print `10.8.2`

git --version
docker --version
docker compose version

printf "\e[32mWSL development environment has been set up successfully.\e[0m\n"