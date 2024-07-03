pipeline {
    agent any  // Adjust if you need a specific agent (e.g., label)

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', // Replace with your branch name
                    url: 'https://github.com/manikanta5315/project1.git' // Replace with your Git repository URL
            }
        }
        stage('Buildi Docker Image') {
            steps {
                bat 'docker build -t mani_project1_image .' // Replace with your image name
                bat 'docker volume create volumeproject1'
            }
        }
        stage('Run Tests (Optional)') {
            steps {
                script {
                    // Customize testing commands based on your framework and container environment
                    bat 'docker run -d --name project1container7 -p 8107:80 --network bridge -v volumeproject1:/var/www/html mani_project1_image sleep infinity'
                    bat 'docker tag mani_project1_image manikanta5315/maniproject1'
                }
            }
        }
        stage('deploy docker credientials') {
            steps {
                script {
                    // Securely store Docker registry credentials in Jenkins Credentials Management
                    withCredentials([usernamePassword(credentialsId: 'manikanta5315-dockerhub', passwordVariable: 'password', usernameVariable: 'username')]) {
                        bat '''
                        echo %password% | docker login -u %username% -p %password%
                        ''' 
                        
                        bat 'docker push manikanta5315/maniproject1'
                    
                    }
                }
            }
        }
    }
}
