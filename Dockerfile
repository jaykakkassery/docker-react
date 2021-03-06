FROM node:alpine as builderphase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builderphase /app/build /usr/share/nginx/html 