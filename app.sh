#!/bin/bash

docker_compose="docker-compose -f docker-compose.yml"

if [[ $1 = "start" ]]; then
  echo "Starting Python/Docker Example..."
	$docker_compose up -d
elif [[ $1 = "stop" ]]; then
	echo "Stopping Python/Docker Example..."
	$docker_compose stop
elif [[ $1 = "restart" ]]; then
	echo "Restarting Python/Docker Example..."
  $docker_compose down
  $docker_compose start
elif [[ $1 = "down" ]]; then
	echo "Tearing Down Python/Docker Example..."
	$docker_compose down
elif [[ $1 = "build" ]]; then
	echo "Rebuilding Python/Docker Example..."
	$docker_compose down --remove-orphans
	$docker_compose build --no-cache
elif [[ $1 = "shell" ]]; then
	echo "Entering Python/Docker Example Shell..."
	docker exec -it python-docker-example bash
else
	echo "Unkown or missing command..."
fi