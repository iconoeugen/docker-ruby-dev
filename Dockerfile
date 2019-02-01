FROM iconoeugen/fedora-dev:latest
MAINTAINER info@vlad.eu

# install things globally, for great justice
ENV GEM_HOME $HOME/.gem
ENV PATH $GEM_HOME/bin:$PATH

# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME

ENV RUBY_VERSION=2.4.5

RUN dnf -y install gcc-c++ readline-devel re2-devel && \
    dnf -y install ruby ruby-devel rubygem-bundler && \
    dnf clean all

#RUN mkdir -p /tmp/build && \
#    curl https://cache.ruby-lang.org/pub/ruby/2.4/ruby-${RUBY_VERSION}.tar.gz | tar xvz -C /tmp/build && \
#    cd /tmp/build/ruby-${RUBY_VERSION}/ && \
#    ./configure && \
#    make -j 4 && \
#    make install && \
#    rm -rf /tmp/build


# skip installing gem documentation
RUN echo -e '\ninstall: --no-document\nupdate: --no-document' >> "$HOME/.gemrc"

RUN gem install bundler && \
    bundle config --global path "$GEM_HOME" && \
    bundle config --global bin "$GEM_HOME/bin"

CMD [ "irb" ]