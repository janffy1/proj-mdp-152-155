pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "janffy/calculator-app:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Docker Login & Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
                        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_creds') {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }
}

