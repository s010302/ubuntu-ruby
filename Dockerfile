FROM ubuntu:xenial AS ubuntu-ruby

RUN apt-get update && apt-get upgrade -y && apt-get install -y gnupg2 curl wget
RUN gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
        curl -sSL https://get.rvm.io | bash -s stable 

SHELL [ "/bin/bash", "-l", "-c" ]
RUN rvm install ruby-2.3.8
RUN gem install bundler
ENV BUNDLE_SILENCE_ROOT_WARNING=1
CMD ["/bin/bash", "-l"]
