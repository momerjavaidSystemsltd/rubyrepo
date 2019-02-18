# **Sinatra WebMF**

## **Running the Service**

### **Locally with Rack**

With a Ruby environment installed and bundler gem (`gem install bundler`), you can run the application locally with:

```bash
bundle install   # install Sinatra library
rackup &         # start server via Rack
# manually test
curl -i localhost:3000/
curl -i localhost:3000/hello/Simon
```

### **Using Docker-Compose**

```bash
docker-compose up -d  # start up container
# set server IP address
[ -z ${DOCKER_MACHINE_NAME} ] || WEBSERVER=$(docker-machine ip ${DOCKER_MACHINE_NAME})
WEBSERVER=${WEBSERVER:-localhost}
# manually test
curl -i ${WEBSERVER}:3000/
curl -i ${WEBSERVER}:3000/hello/Simon
```

### **Using Docker in Vagrant/Virtualbox**

```bash
vagrant up  # start up virtualbox w/ docker container
# manually test
curl -i localhost:3000/
curl -i localhost:3000/hello/Simon
```

## **Testing**

### **Locally**

There are basic unit tests provided, to run them simply run:

```bash
rake
```

### **Continious Integration**

In a CI system, for a test stage, you can run:

```bash
rake ci:all
```

A `Jenkinsfile` using DSL pipeline is provided to demonstrate this solution.

## Resources

* Web Microframework:
    * [Sinatra](http://sinatrarb.com/)
* Test Frameworks
    * [Rack-Test](https://github.com/rack-test/rack-test)
    * [Testing Sinatra with Rack::Test](http://sinatrarb.com/testing.html)
    * [Test::Unit](http://test-unit.github.io/index.html)
    * [CI Reporter](https://github.com/ci-reporter/ci_reporter)
    * [CI Reporter for Test Unit](https://github.com/ci-reporter/ci_reporter_test_unit)
* Jenkins Declarative Pipeline for Ruby
    * [Creating your first Pipeline: Ruby](https://jenkins.io/doc/pipeline/tour/hello-world/#ruby)
