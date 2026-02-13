#!/bin/bash

# Update system
sudo apt update -y

# ----------------------------
# Install Git
# ----------------------------
sudo apt install git -y

# ----------------------------
# Install Docker
# ----------------------------
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu

# ----------------------------
# Install Java (Required for Jenkins)
# ----------------------------
sudo apt install openjdk-17-jdk -y

# ----------------------------
# Install Jenkins
# ----------------------------
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y
sudo apt install jenkins -y

sudo systemctl start jenkins
sudo systemctl enable jenkins
