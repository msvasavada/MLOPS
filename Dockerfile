# Use a lightweight Python base
FROM python:3.12.4-slim

# Set the working directory
WORKDIR /app

# Only copy requirements first for caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of your app
COPY . .

# Run your FastAPI app
CMD ["uvicorn", "diabetes_main:app", "--host", "0.0.0.0", "--port", "8000"]
