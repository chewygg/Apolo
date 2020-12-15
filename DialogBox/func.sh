#!/bin/bash

FIRMWARE_FILES=$(ls $HOME/Downloads | grep --ignore-case .BIN$)

### VARIAVEIS PARA O PROCESSADOR
MODEL_CPU=$(cat /proc/cpuinfo | grep "model name" | uniq| awk -F: '{print $2}')
N_PROCESSORS=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
N_CORES=$(cat /proc/cpuinfo | grep processor| wc -l)

### VARIAVEIS PARA MEMORIA
MEM_PRIM_TOTAL=$(expr $(cat /proc/meminfo | grep MemTotal|tr -d ' '| cut -d: -f2|tr -d kB) / 1024)

### VARIAVEIS PARA INT DE REDE
INT_DE_REDE=$(ls -A /sys/class/net)

### VARIAVEIS PARA BIOS
BIOS_INFO=$(dmidecode -t bios -q | grep -Ei 'version|release')

### Menu Dialog interativoI
OptionsMenu(){
  DATA=$(date +%d/%m/%Y)
  SELECTION=$(dialog --stdout 						       \
                     --title "Obtencao de Informacoes Servidor $(hostname -s)" \
                     --radiolist "Data Local -> ${DATA}" 0 0 0 		       \

                     1 'Status do webserver' 		off		       \
                     2 'Deletar Usuarios' 		on		       \
                     3 'Remover Pacotes' 	off			\
  		     4 'Instalar Pacotes' 		off		\
		     5 'Adicionar Usuários' 		off		\
		     6 'Sair' 				off;		)

}

