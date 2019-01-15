FROM python:3.6.4

LABEL achooan "88soldieron@gmail.com"

# Set working directory
WORKDIR /app
COPY . /app

# Expose ports
EXPOSE 5000

# Set environment variables
ENV PORT 5000

# Install packages
RUN pip install --upgrade pip \
  && pip install pipenv \
  && pipenv lock -r > requirements.txt \
  && pip install -r requirements.txt

# Initialize database
RUN flask create-db