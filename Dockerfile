FROM hub.c.163.com/library/ruby:2.2.5

RUN apt-get update && apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /slate

WORKDIR /slate

RUN bundle install              

EXPOSE 4567

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
