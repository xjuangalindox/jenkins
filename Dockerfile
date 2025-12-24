# compatible con Spring Boot project
FROM jenkins/jenkins:lts-jdk17

USER root

# Instala Docker CLI y docker-compose
RUN apt-get update && \
    apt-get install -y docker.io docker-compose && \
    apt-get clean

# Agregar usuario jenkins al grupo docker
RUN groupadd docker || true && usermod -aG docker jenkins

USER jenkins