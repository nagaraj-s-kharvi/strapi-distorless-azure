# Base image
FROM node:16-alpine
# Set working directory
WORKDIR /app
# Copy package.json and yarn.lock files
COPY package.json yarn.lock ./
# Install dependencies
RUN yarn install
# Copy the rest of the application code
COPY . .
RUN yarn build
# Expose the Strapi server port (change if necessary)
EXPOSE 1337
# Update the entrypoint script execution command
ENTRYPOINT ["yarn", "start"]

# FROM node:16 AS build
# WORKDIR /app
# COPY package.json yarn.lock ./
# RUN yarn install --production --frozen-lockfile
# COPY . .
# RUN yarn build

# FROM gcr.io/distroless/nodejs:16
# WORKDIR /opt/app
# COPY --from=build /app ./
# EXPOSE 1337
# CMD ["./node_modules/@strapi/strapi/bin/strapi.js", "start"]