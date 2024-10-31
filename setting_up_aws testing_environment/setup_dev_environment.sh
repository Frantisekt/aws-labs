#!/bin/bash

# La siguiente condicion se asegura que el script esté siendo ejecutado como superuser o con sus permisos.
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo"
    exit 1
fi

# Si es una VM recien creada corremos el update y upgrade inicial para actualizar los parches de seguridad.
# Descomenta las dos lineas siguientes en caso de que no hayas hecho un update y upgrade anteriormente. Puede tardarse de 5-10min.
#echo "Updating package lists..."
#apt update && apt upgrade -y

# Instalar las dependencias curl y unzip primero.
echo "Instalando dependencias"
apt install -y curl unzip python3 python3-pip git

# Instalar boto3 usando pip
echo "Instalando boto3"
pip3 install boto3

# Instalar Ansible
echo "Instalando Ansible"
apt install -y software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt install -y ansible

# Instalar aws CLI.
echo "Instalando AWS CLI "
# Fuente de la pagina oficial de aws. Te sugiero revisar el apartado de instalacion para Linux.
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Descomprimimos el instalador.
unzip awscliv2.zip

# Instalar AWS CLI
sudo ./aws/install

# Eliminamos la carpeta zip ya que no la necesitaremos más.
rm -rf aws awscliv2.zip

# Instalar VScode
echo "Instalando VSCode"
# Fuente de la pagina oficial de visual studio code.
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
rm packages.microsoft.gpg

# Agregamos el repositorio primero
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list > /dev/null

# Actualizamos la lista de paquetes para verificar que se incluya el repositorio
apt update

# Instalar VScode
apt install -y code

# Mostramos una lista de lo que se instalócorrectamente
echo -e "\nVerification:"
echo "Curl version:"
curl --version
echo -e "\nPython version:"
python3 --version
echo -e "\nPip version:"
pip3 --version
echo -e "\nBoto3 version:"
pip3 show boto3 | grep Version
echo -e "\nGit version:"
git --version
echo -e "\nAWS CLI version:"
aws --version
echo -e "\nVSCode version:"
code --version
echo -e "\nAnsible version:"
ansible --version

echo -e "\nInstallation complete!"