# Generamos nuestra aplicación y la construimos desde la imagen de DockerHub como multi-stage build.
FROM node:current-alpine3.22 AS build

#Definimos una carpeta de trabajo llamada app donde ahí se colocarán nuestros archivos de la aplicación
WORKDIR /app

#Inicializamos nuestra app en React directamente en el contenedor
RUN npx create-react-app mi-react-app

#Definimos una carpeta interna dentro del proyecto de trabajo
WORKDIR /app/mi-react-app

#Construimos nuestra app
RUN npm run build

#Generamos un servidor Nginx y descargamos desde Docker Hub la imagen
FROM nginx:stable-alpine

#Eliminamos el contenido por default que está en Nginx
RUN rm -rf /usr/share/nginx/html/*

#Copiamos el build de React a la carpeta de Nginx "public_html"
COPY --from=build /app/mi-react-app/build /usr/share/nginx/html

#Exponemos el puerto
EXPOSE 80

#Iniciamos el servicio de Nginx que ya contiene nuestra app de React
CMD ["nginx", "-g", "daemon off;"]
