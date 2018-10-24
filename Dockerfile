FROM node:8

# Create app direcyory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Add app source
COPY . .

# Set entrypoint
CMD []
ENTRYPOINT ["npm", "start"]
