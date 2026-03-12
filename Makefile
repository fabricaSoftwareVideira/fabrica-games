.PHONY: up down start stop restart logs ps network clean build

NETWORK_NAME=fabrica-network
CONTAINER_NAME=fabrica-games

## Cria a rede externa necessária (executar uma vez)
# network:
# 	docker network inspect $(NETWORK_NAME) >/dev/null 2>&1 || \
# 		docker network create $(NETWORK_NAME)

## Sobe os containers (cria a rede se necessário)
# up: network
# 	docker compose up -d

up: 
	docker compose up -d

## Para e remove os containers
down:
	docker compose down

## Inicia containers existentes
start:
	docker compose start

## Para os containers sem removê-los
stop:
	docker compose stop

## Reinicia os containers
restart:
	docker compose restart

## Exibe os logs em tempo real
logs:
	docker compose logs -f

## Lista os containers do projeto
ps:
	docker compose ps

## Atualiza a imagem base
build:
	docker compose pull

## Remove containers, rede e limpa volumes órfãos
clean:
	docker compose down --remove-orphans
	docker volume prune -f
