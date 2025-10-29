#!/bin/bash
# Unified Multi-Environment Deployment Script
# Versions: Production v1.0.0 | Development v2.0.0-beta

set -e

echo "====================================="
echo "DevOps Simulator - Multi-Environment Deploy"
echo "====================================="

# Default environment is production unless specified
DEPLOY_ENV=${DEPLOY_ENV:-production}

if [ "$DEPLOY_ENV" = "production" ]; then
    echo "Mode: Production"
    DEPLOY_REGION="us-east-1"
    APP_PORT=8080

    echo "Environment: $DEPLOY_ENV"
    echo "Region: $DEPLOY_REGION"
    echo "Port: $APP_PORT"

    # Pre-deployment checks
    echo "Running pre-deployment checks..."
    if [ ! -f "config/app-config.yaml" ]; then
        echo "Error: Configuration file not found!"
        exit 1
    fi

    # Deploy application
    echo "Starting production deployment..."
    echo "Pulling latest Docker images..."
    # docker pull devops-simulator:latest

    echo "Rolling update strategy initiated..."
    # kubectl rolling-update devops-simulator

    echo "Deployment completed successfully!"
    echo "Application available at: https://app.example.com"

elif [ "$DEPLOY_ENV" = "development" ]; then
    echo "Mode: Development"
    DEPLOY_MODE="docker-compose"
    APP_PORT=3000
    ENABLE_DEBUG=true

    echo "Environment: $DEPLOY_ENV"
    echo "Mode: $DEPLOY_MODE"
    echo "Port: $APP_PORT"
    echo "Debug: $ENABLE_DEBUG"

    # Pre-deployment checks
    echo "Running pre-deployment checks..."
    if [ ! -f "config/app-config.yaml" ]; then
        echo "Error: Configuration file not found!"
        exit 1
    fi

    # Install dependencies
    echo "Installing dependencies..."
    npm install

    # Run tests
    echo "Running tests..."
    npm test

    # Deploy application
    echo "Starting development deployment..."
    echo "Using Docker Compose..."
    docker-compose up -d

    # Wait for app to start
    echo "Waiting for application to be ready..."
    sleep 5

    # Health check
    echo "Performing health check..."
    curl -f http://localhost:$APP_PORT/health || exit 1

    echo "Deployment completed successfully!"
    echo "Application available at: http://localhost:$APP_PORT"
    echo "Hot reload enabled - code changes will auto-refresh"

else
    echo "Error: Unknown environment $DEPLOY_ENV"
    exit 1
fi
