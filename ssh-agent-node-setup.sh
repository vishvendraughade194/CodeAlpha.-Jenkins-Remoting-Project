
#!/bin/bash
# Run this on the remote agent node

# Create Jenkins user
sudo useradd -m -s /bin/bash jenkins
sudo mkdir /home/jenkins/agent
sudo chown -R jenkins:jenkins /home/jenkins/agent

# Install Java (required for Jenkins)
sudo apt update
sudo apt install -y openjdk-11-jdk

# Setup SSH (ensure public key from Jenkins master is added)
mkdir -p /home/jenkins/.ssh
chmod 700 /home/jenkins/.ssh
touch /home/jenkins/.ssh/authorized_keys
chmod 600 /home/jenkins/.ssh/authorized_keys

echo "✅ Remote node is ready."
