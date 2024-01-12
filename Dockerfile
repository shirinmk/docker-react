# FROM node:16-alpine as builder
# WORKDIR package.json .
# RUN npm install
# COPY . .
# RUN npm run build
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json package-lock.json* ./
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


