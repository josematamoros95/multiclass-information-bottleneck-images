Para agilizar el levantamiento del proyecto, sugiero instalar make para que puedan ejecutar lo que está en el Makefile. (tarea para la casa)

Dataset de: https://www.kaggle.com/datasets/samuelcortinhas/sports-balls-multiclass-image-classification

Para crear la imagen:

1) make build-image

Para ejecutar comandos en el contenedor, por ejemplo, para actualizar dependencias:

2) make run-container-interactive

Para ejecutar el servicio de Jupyter Notebook:

3) run-jupyter

Para agregar una nueva dependencia:
make poetry-add-package PACK_NAME=<nombre_dependencia>

Alternativa:
Ejecutar comando (2) y en la línea de comandos ejecutar: poetry add <nombre_dependencia> (se puede agregar versiones en particular)
Esperar que se escriba el archivo lock
Ejecutar comando (1) para crear la imagen con las dependencias nuevas