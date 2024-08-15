FROM ruby:3.2.2-slim-bullseye

WORKDIR /opt/app

COPY . .

RUN apt-get update -qq && \
    apt-get install git curl build-essential libpq-dev -y --no-install-recommends && \
    bundle install && \
    chmod +x ./entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["./entrypoint.sh"]

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
