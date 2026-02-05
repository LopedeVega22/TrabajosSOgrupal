#!/bin/bash

if [ "$1" == "-install" ];then
 if [ "$2" == "-c" ];then
  echo "Placeholder instalación con comandos"
 elif [ "$2" == "-d" ];then
  echo "Placeholder instalación con Docker"
 else
  echo "Esa opción no es válida, si necesita ayuda utilice --help al ejecutar el programa"
 fi
elif [ "$1" == "-delete" ];then
 echo "Placeholder eliminación del servicio"
elif [ "$1" == "-start" ];then
 echo "Placeholder puesta en marcha"
elif [ "$1" == "-stop" ];then
 echo "Placeholder parada"
elif [ "$1" == "-logs" ];then
 echo "Placeholder consultar logs"
elif [ "$1" == "--help" ];then
 echo "------------------------------------------------------------------------------------"
 echo "-install Instalación del servicio con comandos (-install -c) o Docker (-install -d)"
 echo "------------------------------------------------------------------------------------"
 echo "-delete Eliminación del servicio"
 echo "------------------------------------------------------------------------------------"
 echo "-start Puesta en marcha"
 echo "------------------------------------------------------------------------------------"
 echo "-stop Parada"
 echo "------------------------------------------------------------------------------------"
 echo "-logs Consultar logs:"
 echo "-f por fecha"
 echo "-t por tipo"
 echo "Incluir la fecha(YYYY-MM-DD) o el tipo como tercer parámetro"
 echo "------------------------------------------------------------------------------------"
else
echo ""
echo "Esa opción no es válida, si necesita ayuda utilice --help al ejecutar el programa"
echo ""
fi