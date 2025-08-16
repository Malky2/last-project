FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

# עדכון תעודות מערכת והתקנת openssl ו־certifi
RUN apt-get update && \
    apt-get install -y curl ca-certificates openssl && \
    update-ca-certificates

# עדכון תעודות של pip/python דרך certifi
RUN python -m pip install --upgrade pip certifi

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
