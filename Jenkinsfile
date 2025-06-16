pipeline {
    agent any
    stages {
        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/priyam930/ci-cd-jenkins-ansible-docker.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp:latest .'
            }
        }
        stage('Export Image as TAR') {
            steps {
                sh 'docker save myapp:latest -o myapp.tar'
            }
        }
        stage('Copy Image to Remote') {
            steps {
                sh 'scp -i /var/lib/jenkins/.ssh/id_rsa myapp.tar ec2-user@65.0.7.0:/tmp/'
            }
        }
        stage('Deploy via Ansible') {
            steps {
                sh 'ansible-playbook -i ansible/inventory.ini ansible/deploy.yaml'
            }
        }
    }
}
