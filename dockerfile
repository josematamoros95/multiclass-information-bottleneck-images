# Usa una imagen oficial de Python como base
FROM python:3.11-slim

# Establece el directorio de trabajo
WORKDIR /app

# Instala bash y otros paquetes útiles (opcional: ca-certificates, curl, etc.)
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Instala Poetry usando el instalador oficial
RUN curl -sSL https://install.python-poetry.org | python3 -

# Agrega Poetry al PATH
ENV PATH="/root/.local/bin:$PATH"

# Copia los archivos del proyecto al contenedor
COPY . /app

RUN poetry config virtualenvs.create false
RUN poetry install --no-root

# Expone el puerto que usará Jupyter
EXPOSE 8888

CMD ["bash"]