# Azure Blob Storage + Laravel 12 + Docker

Proyecto base Laravel 12 integrado con Azure Blob Storage y preparado para desarrollo con Docker.

---

## 🚀 Levantar el proyecto con Docker

1. **Clona el repositorio**

   ```bash
    git clone https://github.com/tu_usuario/azure-blob-storage.git
    cd azure-blob-storage
    

2. Copia tu archivo de variables de entorno

    ```bash
    cp .env.example .env

3. Modifica las variables de tu .env

    ```bash
    DB_CONNECTION=mysql
    DB_HOST=db
    DB_PORT=3306
    DB_DATABASE=laravel
    DB_USERNAME=laravel
    DB_PASSWORD=laravel

Y agrega tus credenciales de Azure Blob:

    ```bash
    AZURE_STORAGE_ACCOUNT_NAME=your_account_name
    AZURE_STORAGE_ACCOUNT_KEY=your_account_key
    AZURE_STORAGE_CONTAINER=your_container
    AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=your_account_name;AccountKey=your_account_key;EndpointSuffix=core.windows.net"
    Levanta los contenedores

4. Levanta los contenedores

    ```bash
    docker-compose up --build -d

5. Instala las dependencias de Laravel

    ```bash
    docker-compose exec app composer install


6. Genera la key de la app

    ```bash
    docker-compose exec app php artisan key:generate

7. Accede a la app

    http://localhost:8000


📂 Subir un archivo a Azure Blob Storage
Endpoint de ejemplo
Se incluye un endpoint en el controlador AzureBlobController para probar la subida:

    POST /upload
    Parámetros:
    file (form-data): Archivo a subir

Ejemplo con Postman:
    1) Selecciona método POST
    2) URL: http://localhost:8000/upload
    3) En Body selecciona form-data
    4) Agrega un campo llamado file y selecciona cualquier archivo
    5) Haz clic en Enviar
    6) Si la subida es exitosa, recibirás un JSON con la URL o path en Azure.