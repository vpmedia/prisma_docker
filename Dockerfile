FROM ubuntu:23.04

RUN apt update && apt upgrade -y && apt install -y \
  apt-utils \
  apt-transport-https \
  ca-certificates \
  software-properties-common \
  build-essential \
  curl \
  zip

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt update && apt install -y nodejs

ENV NODE_ENV development

WORKDIR /var/www/app

COPY package.json .
COPY .env .
COPY prisma ./prisma

RUN npm install
RUN npm run generate
CMD ["exit", "0"]
