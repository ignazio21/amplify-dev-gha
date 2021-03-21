FROM ubuntu:18.04

RUN apt update -y
RUN apt install -y sudo git curl
RUN curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
RUN apt install -y nodejs
RUN npm install --global yarn
RUN git clone https://github.com/flochaz/amplify-cli.git
RUN cd amplify-cli; yarn config set workspaces-experimental true; npm run setup-dev

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]