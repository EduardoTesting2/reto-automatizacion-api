# Gradle
.gradle/
build/

# Reportes generados
target/

# IntelliJ
.idea/
*.iml

# Visual Studio Code
.vscode/

# Archivos temporales
*.log
*.tmp

# Sistema operativo
.DS_Store
Thumbs.db


# Reto de Automatización de APIs con Karate

## Descripción

Este proyecto corresponde al reto de automatización de servicios REST.

La automatización fue desarrollada utilizando Karate Framework, Java 21,
Gradle y JUnit.

La API pública utilizada para las pruebas es:

https://api.restful-api.dev

El objetivo del proyecto es validar diferentes operaciones HTTP mediante
pruebas automatizadas, incluyendo creación, consulta, modificación y
eliminación de recursos.

---

## Tecnologías utilizadas

- Java 21
- Karate Framework
- Gradle
- JUnit
- Visual Studio Code
- Git
- GitHub

---

## Métodos HTTP automatizados

El proyecto contiene pruebas para los siguientes métodos:

- GET
- POST
- PUT
- PATCH
- DELETE

---

## Flujo automatizado

La prueba principal realiza el siguiente proceso:

1. Consulta los objetos disponibles mediante GET.
2. Crea un nuevo objeto mediante POST.
3. Guarda dinámicamente el ID generado por la API.
4. Consulta el objeto creado utilizando su ID.
5. Actualiza completamente el objeto mediante PUT.
6. Modifica parcialmente el objeto mediante PATCH.
7. Consulta nuevamente el objeto para verificar los cambios.
8. Elimina el objeto mediante DELETE.
9. Realiza una última consulta para comprobar que el recurso fue eliminado.

---

## Validaciones realizadas

Durante la automatización se validan:

- Códigos de estado HTTP.
- Estructura de la respuesta JSON.
- Datos específicos enviados y recibidos.
- IDs generados dinámicamente.
- Persistencia de las modificaciones.
- Eliminación del recurso.

---

## Estructura del proyecto

```text
reto-automatizacion-api
│
├── build.gradle
├── settings.gradle
├── gradlew
├── gradlew.bat
├── gradle
├── .gitignore
├── README.md
│
└── src
    └── test
        └── java
            ├── karate-config.js
            └── api
                ├── ApiTest.java
                └── objects.feature