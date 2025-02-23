FROM node:latest AS build

WORKDIR /app

COPY . /app/

RUN npm install && npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html