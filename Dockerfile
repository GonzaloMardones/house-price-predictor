FROM python:3.11-slim

WORKDIR /app

# Dependencias primero → Docker cachea esta capa si requirements.txt no cambia
COPY src/api/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Código de la API
COPY src/api/ .

# Artefactos del modelo
COPY models/trained/*.pkl models/trained/

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
