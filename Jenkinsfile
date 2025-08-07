
pipeline {
  agent { label 'remote-node' }
  stages {
    stage('Remote Build') {
      steps {
        echo "Building on a remote agent node"
        sh 'hostname'
        sh 'date'
      }
    }
  }
}
