# Script de Configuración del Entorno de Desarrollo

Este script automatiza la configuración del entorno de pruebas de infraestructura simple en sistemas Unix/Linux (Ubuntu).

## Descripción

`setup-dev-environment.sh` es un script que automatiza la instalación de herramientas y dependencias comunes para practicas de laboratorio de infraestructura con AWS.

## Requisitos Previos

- Sistema operativo Unix/Linux (Preferiblemente Ubuntu)


## Uso

- Antes de ejecutarlo debes darle permisos de ejecución al script con:

chmod +x setup-dev-environment.sh

- Ejecuta el script:

./setup-dev-environment.sh


## ¿Qué instala?

Por ahora, el script instala las siguientes herramientas:

- Curl
- Git
- Python3 y pip
- VSCode
- Ansible
- AWS CLI

Con el tiempo iré agregandole mas herramientas.

## Personalización

Puedes modificar el script para agregar o remover herramientas según tus necesidades específicas. 


## Solución

Si encuentras algún error durante la ejecución:

1. Verifica que tienes permisos de administrador
2. Asegúrate de que tu sistema está actualizado
3. Revisa los logs para más detalles