FROM node:14.19.0

RUN apt-get install -y imagemagick

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
