node {
      stage("Git Clone"){

        git branch: 'main', url: 'https://github.com/jsilaparasetti/new-server.git'
      }
   
      stage("Docker build"){
        sh 'docker build -t eurekaserver .'
        sh 'docker image ls'
      }
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'test', usernameVariable: 'jsilaparasetti', passwordVariable: 'password']]) {
        sh 'docker login -u jsilaparasetti -p $password docker.io'
      }
      stage("Pushing Image to Docker Hub"){
	sh 'docker tag eurekaserver jsilaparasetti/eurekaserver:latest'
	sh 'docker push jsilaparasetti/eurekaserver:latest'
      }
      stage("SSH Into Server") {
       def remote = [:]
       remote.name = 'VMububtu18.0'
       remote.host = '20.232.127.94'
       remote.user = 'azureuser'
       remote.password = 'Miracle@1234'
       remote.allowAnyHosts = true
     }
     stage("Deploy"){
	     sh 'docker stop eurekaserver|| true && docker rm -f eurekaserver || true'
	     sh 'docker run -d -p 8761:8761 --name eurekaserver eurekaserver:latest'
     }
    }
