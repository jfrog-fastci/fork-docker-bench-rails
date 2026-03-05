FROM ruby:3.3-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock* ./
RUN bundle config set --local without 'development test' && \
    bundle install && \
    rm -rf /usr/local/bundle/cache

COPY . .

EXPOSE 3000

CMD ["ruby", "app.rb"]