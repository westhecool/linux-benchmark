#!/bin/bash
GREEN="\e[32m"
RED="\e[31m"
ENDCOLOR="\e[0m"
echo -e "${GREEN}RUNNING RAM BENCHMARK${ENDCOLOR}"
sysbench --verbosity=3 memory run
num_cores=$(nproc)
for ((cores=1; cores <= $num_cores; cores++)); do
    echo -e "${GREEN}RUNNING CPU BENCHMARK (Cores: $cores)${ENDCOLOR}"
    sysbench --verbosity=3 --threads=$cores cpu run
done