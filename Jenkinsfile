node {
      stage("Git Clone"){

        git branch: 'main', url: 'https://github.com/Development456/Server.git'
      }
   
      stage("Docker build"){
        sh 'docker build -t eurekaserver .'
        sh 'docker image ls'
      }
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'test', usernameVariable: 'apurva', passwordVariable: 'password']]) {
        sh 'docker login -u apurva@09 -p $password docker.io'
      }
      stage("Pushing Image to Docker Hub"){
	sh 'docker tag eurekaserver apurva/eurekaserver:latest'
	sh 'docker push apurva/eurekaserver:latest'
      }
      stage("SSH Into Server") {
       def remote = [:]
       remote.name = 'VMububtu18.0'
       remote.host = '20.62.171.46'
       remote.user = 'dev_azureuser'
       remote.password = 'AHTgxKmRGb05'
       remote.allowAnyHosts = true
     }
     stage("Deploy"){
	     sh 'docker stop eurekaserver|| true && docker rm -f eurekaserver || true'
	     sh 'docker run -d -p 8761:8761 --name eurekaserver eurekaserver:latest'
     }
    }
