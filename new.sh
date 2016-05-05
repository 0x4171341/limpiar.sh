#!/bin/bash

if [ $USER != root ]; then
  echo ">> Error: debes ser root"
  echo ">> Saliendo ..."
  exit 0
fi

echo
echo ">> Borrando la cache de pacman ..."
echo
pacman -Scc
echo
echo ">> Borrando archivos de configuración obsoletos ..."
echo
sudo pacman -Qdt
echo
sudo pacman -Rsn $(pacman -Qdtq)
echo
echo ">> Vaciando todas las papeleras ..."
echo
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
rm -rf /root/.local/share/Trash/*/** &> /dev/null
echo
echo ">> Eliminando la caché de las imágenes [thumbnails] ..."
echo
rm -rf /home/*/.thumbnails/*/** &> /dev/null
rm -rf /root/.thumbnails/*/** &> /dev/null
sleep 2
echo "eliminaremos la basura del directorio Temporal"
rm -rf /tmp/* &> /dev/null
echo
sleep 2
echo ">> Se han realizado todas las tareas correctamente. Hasta pronto!"
echo
sleep 2
echo
