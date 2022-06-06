FROM ruby:2.6.1

# Create app directory
ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Install app dependencies
COPY Gemfile $APP_HOME
RUN bundle install

# Bundle app source
COPY . $APP_HOME
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

EXPOSE 3000
CMD ["bundle", "exec", "rackup"]
