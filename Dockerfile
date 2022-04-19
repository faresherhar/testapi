FROM python:3.9-slim@sha256:d39ad34d68f31707ee5cfec387ff22769043253b4cdf4cc6cc51f4ce2aba1275
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .
EXPOSE 8001
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8001"]
