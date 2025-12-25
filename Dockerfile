# compatible con Spring Boot project
FROM jenkins/jenkins:lts-jdk17


# Cambiamos a root para instalar dependencias y configurar git
# Jenkins corre como root para usar docker.sock
USER root

# Instalar Docker CLI y docker-compose
RUN apt-get update && \
    apt-get install -y docker.io docker-compose && \
    apt-get clean

# 🔐 FIX IMPORTANTE:
# Permite a Git operar en workspaces montados (EFS / Docker volumes)
RUN git config --system --add safe.directory "*"

# Agregar usuario jenkins al grupo docker
# RUN groupadd docker || true && usermod -aG docker jenkins

# Volvemos al usuario jenkins (MUY importante)
# USER jenkins