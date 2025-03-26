FROM python:3.9-slim

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Set environment variables
ENV FLASK_SKIP_DOTENV=1
ENV FLASK_ENV=production
ENV SECRET_KEY=your_production_secret_key_123
ENV PORT=8080

# Expose the port
EXPOSE 8080

# Run the application
CMD gunicorn --bind 0.0.0.0:$PORT no_env_app:app 