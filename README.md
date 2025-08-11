# mi‑react‑app

Este repositorio contiene una aplicación React preparada para ser **dockerizada** como parte de una práctica con Docker.

---

## 📁 Contenido

- `Dockerfile` – Configuración para construir la imagen Docker.
- `.dockerignore` – Archivos/carpetas ignorados durante la construcción.
- `README.md` – Esta guía para construir y ejecutar la app con Docker.

---

## ✅ Prerrequisitos

- Docker instalado en tu sistema.
- Opcional: Docker Compose, si decides ampliar la configuración.

---

## 🏗️ Construcción de la imagen Docker

Para construir la imagen ejecuta:

```bash
docker build -t mi-react-app .
