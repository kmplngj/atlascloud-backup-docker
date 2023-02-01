FROM node:current-alpine

# hadolint ignore=DL3018
RUN apk --no-cache add \
    git \
  && rm -rf /var/cache/apk/*

# Create app directory
WORKDIR /app

# Clone app
RUN git clone https://bitbucket.org/addcraftio/atlascloud-backup.git /app

# Install app dependencies 
RUN npm install && npm audit fix

CMD ["node", "." , "create"]