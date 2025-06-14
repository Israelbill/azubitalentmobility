#!/bin/bash

# Test database
echo "Testing database..."
docker exec todo_db pg_isready -U admin -d todo

# Test backend API
echo "Testing backend API..."
curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/api/todos | grep 200 || echo "Backend failed!"

# Test frontend
echo "Testing frontend..."
curl -s -o /dev/null -w "%{http_code}" http://localhost:80 | grep 200 || echo "Frontend failed!"

echo "Tests completed."