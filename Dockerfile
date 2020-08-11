FROM ruby:2.7.1-alpine
WORKDIR /app
COPY Gemfile Gemfile.lock config.ru /app/

RUN set -eu; \
    mkdir /var/geminabox-data; \
    gem install bundler; \
    bundle install
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0"]
EXPOSE 9292
