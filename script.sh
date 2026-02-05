#!/bin/bash
#Datos de red del equipo
ip add
#Estado del servicio
systemctl status apache2
#Menu de instalacion
while [[ "$Menu1" != "Salir" ]]
do
read -p "Opciones del menu del servicio:
    - Instalacion del servicio (Escriba: Descarga)
    - Eliminacion del servicio (Escriba: Borrar)
    - Poner en marcha el servicio (Escriba: Correr)
    - Parar el servicio (Escriba: Parada)
    - Consultar los logs (Escriba: Logs)
    - Salir (Escriba: Salir)
    Escriba lo que desea hacer: " Menu1
#Menu descarga
case $Menu1 in
    "Descarga")
        read -p "Opciones de instalacion:
        - Instalacion mediante comandos (Escriba: Comandos)
        - Instalacion con Docker (Escriba: Docker)
        - Salir (Escriba: Salir)
        Escriba como desea descargarlo: " MenuDescarga
        case $MenuDescarga in
            "Comandos")
                sudo apt install apache2 apache2-doc
            ;;
            "Docker")
            echo "Esto es para instalar con docker"
            ;;
            "Salir")
            ;;
            *)
                echo "El valor no es valido"
            ;;
        esac
    ;;
    "Borrar")
        sudo apt remove apache2 apache2-doc
        sudo apt autoremove
    ;;
    "Correr")
        sudo systemctl start apache2
    ;;
    "Parada")
        sudo systemctl stop apache2
    ;;
    "Logs")
        read -p " Opciones de logs:
        - Mostrar logs por fecha (Escriba: Fecha)
        - Mostrar logs por tipo (Escriba: Tipo)
        - Por IP (Escriba: IP)
        - Tiempo real (Escriba: Tiempo)
        - Salir (Escriba: Salir)
        Elija que opcion de logs quiere: " MenuLog
        case $MenuLog in
            "Fecha")
                read -p "Elija de que fecha quiere ver los logs(YYYY-MM-DD):" Fecha
                journalctl -u apache2 --since "$Fecha 00:00:00" --until "$Fecha 23:59:59"
            ;;
            "Tipo")
                read -p "Elija el nivel de detalle:
                - Errores críticos (Escriba: Error)
                - Avisos y advertencias (Escriba: Alerta)
                - Todo el historial (Escriba: Info)
                Seleccione tipo: " TipoLog

                case $TipoLog in
                    "Error")
                        # Nivel 3: Errores que impiden el funcionamiento
                        journalctl -u apache2 -p 3 -b
                    ;;
                    "Alerta")
                        # Nivel 4: Advertencias (warnings)
                        journalctl -u apache2 -p 4 -b
                    ;;
                    "Info")
                        # Muestra todo el log del arranque actual
                        journalctl -u apache2 -b
                    ;;
                    *)
                        echo "Tipo no reconocido, mostrando errores por defecto."
                         journalctl -u apache2 -p 3
                    ;;
                esac
            ;;
            "IP")
                read -p "Escriba que IP quiere buscar en los logs: "
                journalctl -u apache2 | grep "$IpBusqueda"
            ;;
            "Tiempo real")
                sudo journalctl -u apache2 -f
            ;;
        esac
    ;;
    "Salir")
    ;;
    *)
        echo "El valor insertado no es valido"
    ;;
esac
done

