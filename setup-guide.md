
# Jenkins Remoting Setup Guide

## Requirements

- Jenkins (Docker recommended)
- Remote node (Linux VM or server with SSH)
- Public/private SSH keys

## Step 1: Jenkins Master Setup

Use Docker to start Jenkins:

```bash
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-master jenkins/jenkins:lts
```

## Step 2: Prepare SSH Key for Remoting

On Jenkins master:

```bash
ssh-keygen -t rsa -b 2048
```

Copy public key to agent machine:

```bash
ssh-copy-id user@remote-ip
```

## Step 3: Set Up Agent Node in Jenkins UI

- Go to **Manage Jenkins > Nodes > New Node**
- Select "Permanent Agent"
- Configure:
  - **Remote root directory**
  - **Launch method**: Launch agent via SSH
  - **Host**: IP of remote
  - **Credentials**: Add Jenkins SSH credentials
  - **Labels**: architecture (e.g., `linux`, `arm64`, etc.)

## Step 4: Test Job on Remote Node

Create a pipeline using:

```groovy
pipeline {
  agent { label 'remote-node' }
  stages {
    stage('Build') {
      steps {
        echo 'Running on remote node...'
        sh 'uname -a'
      }
    }
  }
}
```

## 🔒 Security Tips

- Use SSH keys, not passwords
- Apply node-specific restrictions
- Use agent-to-controller security restrictions in Jenkins settings
