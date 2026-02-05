#!/bin/bash

if [ "$1" == "-install" ];then
 if [ "$2" == "-c" ];then
  sudo apt install apache2 apache2-doc
 elif [ "$2" == "-d" ];then
  echo "Placeholder instalación con Docker"
 elif [ -z "$2" ];then
  echo "Por favor escoja una opción, consulte --help"
 else
  echo "Esa opción no es válida, si necesita ayuda utilice --help al ejecutar el programa"
 fi
elif [ "$1" == "-delete" ];then
 sudo apt remove apache2 apache2-doc
 sudo apt autoremove
elif [ "$1" == "-start" ];then
 sudo systemctl start apache2
elif [ "$1" == "-stop" ];then
 sudo systemctl stop apache2
elif [ "$1" == "-logs" ];then
 case $2 in
  "-f")
   if [ -z "$3" ];then
    echo "Por favor escoja una fecha (YYYY-MM-DD)"
   else
    journalctl -u apache2 --since "$3 00:00:00" --until "$3 23:59:59"
   fi
   ;;
  "-t")
   echo "Elija el nivel de detalle:"
   echo "- Errores críticos (-logs -t -e)"
   echo "- Avisos y advertencias (-logs -t -a)"
   echo "- Todo el historial (-logs -t -i)"
   case $3 in
    "-e")
     # Nivel 3: Errores que impiden el funcionamiento
     journalctl -u apache2 -p 3 -b
     ;;
    "-a")
     # Nivel 4: Advertencias (warnings)
     journalctl -u apache2 -p 4 -b
     ;;
    "-i")
     # Muestra todo el log del arranque actual
     journalctl -u apache2 -b
     ;;
    *)
     echo "Tipo no reconocido, mostrando errores por defecto."
     journalctl -u apache2 -p 3
     ;;
   esac
   ;;
  "-ip")
   journalctl -u apache2 | grep "$3"
   ;;
  "-rt")
   sudo journalctl -u apache2 -f
   ;;
  *)
   echo "Esa opción no es válida, si necesita ayuda utilice --help al ejecutar el programa"
   ;;
 esac
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
 echo "-ip por IP"
 echo "-rt en tiempo real"
 echo "Incluir la fecha(YYYY-MM-DD), el tipo o la IP como tercer parámetro"
 echo "------------------------------------------------------------------------------------"
 elif [ -z "$1" ];then
  echo "Por favor escoja una opción, consulte --help"
else
echo ""
echo "Esa opción no es válida, si necesita ayuda utilice --help al ejecutar el programa"
echo ""
fi
