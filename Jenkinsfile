pipeline {
    agent {
    docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
    }
    environment {
    DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
    }
    stages {
        stage('Build') {
                steps {
                echo 'Building..'
                sh 'dotnet build'
            }
        }
        stage('Node') {
            agent {
            docker { image 'node' }
            }
            steps {
                echo 'installing node..'
                dir("DotnetTemplate.Web") {
                sh 'npm install'
                sh 'npm run build'
            }

            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                
            }
        }
    }
}