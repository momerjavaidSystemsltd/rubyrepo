pipeline {
  agent { docker { image 'ruby:2.5.3' } }
  stages {
    stage('requirements') {
      steps {
        sh 'gem install bundler -v 2.0.1'
      }
    }
    stage('build') {
      steps {
        sh 'bundle install'
        sh 'rackup &'
      }
    }
    stage('test') {
      steps {
        sh 'curl -i localhost:3000'
      }    
    }
  }
}