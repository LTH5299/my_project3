FROM python:3.9 AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
FROM python:3.9

WORKDIR /app

COPY --from=builder /app /app
COPY app.py app.py

CMD ['python', 'app.py']
