pipeline {
    agent any  // Adjust if you need a specific agent (e.g., label)

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', // Replace with your branch name
                    url: 'https://github.com/manikanta5315/project1.git' // Replace with your Git repository URL
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t mani_project1_image .' // Replace with your image name
            }
        }
        stage('Run Tests (Optional)') {
            steps {
                script {
                    // Customize testing commands based on your framework and container environment
                    bat 'docker run -d --name project1container1 -p 8101:80 mani_project1_image sleep infinity'
                }
            }
        }
        stage('deploy docker credientials') {
            steps {
                script {
                    // Securely store Docker registry credentials in Jenkins Credentials Management
                    withCredentials([usernamePassword(credentialsId: 'manikanta5315-dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                       bat 'docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}'
                        bat 'docker tag mani_roject1_image manikanta5315/maniproject1'
                        bat 'docker push manikanta5315/maniproject1'
                    
                    }
                }
            }
        }
    }
}