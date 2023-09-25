FROM node:lts as build
WORKDIR /app
COPY . .
RUN npm i
RUN npm run build

FROM httpd:2.4 as runtime
COPY --from=build /app/dist /usr/local/apache2/htdocs/
EXPOSE 80