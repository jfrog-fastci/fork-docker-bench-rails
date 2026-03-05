FROM ruby:3.3

RUN apt-get update && apt-get install -y vim less man-db wget telnet curl net-tools iputils-ping htop dnsutils strace nodejs

WORKDIR /app

COPY . .

RUN bundle install

EXPOSE 3000

CMD ["ruby", "app.rb"]
