FROM python:3.6-alpine

# Dépendances système (pour psycopg2 et autres)
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev python3-dev make

# Dossier de travail
WORKDIR /app

# Copie du code
COPY . /app

# Installation des dépendances Python
RUN pip install --no-cache-dir -r releases.txt

# Variables d’environnement (valeurs par défaut)
ENV ODOO_URL=http://odoo.local
ENV PGADMIN_URL=http://pgadmin.local

# Port exposé par Flask
EXPOSE 8080

# Commande de démarrage
CMD ["python", "app.py"]
