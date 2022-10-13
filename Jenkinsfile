es (87 sloc)  2.85 KB

pipeline {
  environment {
    dockerhubb = 'https://registry.hub.docker.com'
    dockerhubCredential = 'dockerhub'
    dockerImage = ''
  }
agent any
  stages {
     stage('Cloning Git') {
      steps {
        git branch: 'main' ,  url: 'https://github.com/Manisha148/node-app.git'
        }
     } 

 stage('Building image') {
   steps{
       script {
          sh 'docker build -t demo .'
          }
        }
      }


 	stage('Push') {

		steps {
			sh 'docker push manishaverma/restapis:latest'
			}
		}
      

     stage('Trigger ManifestUpdate') {
        steps {
                echo "triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
        }
     }

  }
}

