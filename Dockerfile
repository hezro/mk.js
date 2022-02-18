FROM node:14.19.0-alpine

RUN apk add --no-cache imagemagick=7.1.0.16-r0 && rm -rf /var/cache/apk/*

# Create the mk.js directory and copy in the app
RUN mkdir /opt/mk.js
COPY server/ /opt/mk.js/server/
COPY game/ /opt/mk.js/game/
WORKDIR /opt/mk.js/server
# Install deps
RUN npm install
# Open port 80
EXPOSE 80
# Run the game in exec form
CMD ["node", "server.js"]
