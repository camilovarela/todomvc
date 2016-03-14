#!/bin/bash
echo ${BACKEND_IP} backend-rest >> /etc/hosts

echo "Starting Python Server"
cd /dojo/todomvc/
python -m SimpleHTTPServer
