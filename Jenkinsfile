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
                echo 'Testing Dotnet'
                sh 'dotnet test'

            }
        }
        stage('Node') {
            agent {
            docker { image 'node' }
            }
            
            stages {
                stage('Build Node') {
                    steps{
                        echo 'installing node..'
                        dir("DotnetTemplate.Web") {
                            sh 'npm install'
                            sh 'npm run build'
                            
                        }
                    }
                }
                stage ('Test Node'){
                    steps{
                        echo 'Testing node..'
                        dir("DotnetTemplate.Web") {
                            sh 'npm t'
                            sh 'npm run lint'
                        }
                    }
                }
            }
        }
        
    }
}