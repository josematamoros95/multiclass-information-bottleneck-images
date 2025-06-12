Dataset de: https://www.kaggle.com/datasets/samuelcortinhas/sports-balls-multiclass-image-classification

Para crear la imagen:
1) docker build -t python-instance .

Para ejecutar comandos en el contenedor, por ejemplo, para actualizar dependencias:
2) docker run -it -v "C:\Users\jose.matamoros\OneDrive - Accenture\Documents\POCs\information-bottleneck:/app" python-instance

Para ejecutar el servicio de Jupyter Notebook:
3) docker run -t --rm --workdir="/app" -p 8888:8888 -v "C:\Users\jose.matamoros\OneDrive - Accenture\Documents\POCs\information-bottleneck:/app" python-instance /bin/bash -ci "jupyter notebook --allow-root --port 8888 --ip 0.0.0.0 --no-browser --NotebookApp.token=''"

Para agregar una nueva dependencia:
Ejecutar comando (2) y en la línea de comandos ejecutar: poetry add <nombre_dependencia> (se puede agregar versiones en particular)
Esperar que se escriba el archivo lock
Ejecutar comando (1) para crear la imagen con las dependencias nuevas