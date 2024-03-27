#!/bin/bash
# -o controls output file name, %j is the job id
#SBATCH -o md.%j.slurm.out
# select number of tasks to be allocated to the job since by default 1 task is given 1 CPU, this will
# allocate 2 tasks would allocate 2 CPUs to a job
#SBATCH --ntasks 2
# select how many GPUs to allocate to a job
#SBATCH --gres=gpu:1

# amber configuration
export AMBERHOME=/usr/local/amber22_test
source /usr/local/amber22_test/amber.sh

# run md
/usr/local/amber22_test/bin/pmemd.cuda -O -i amber.cfg -p amber.prm7 -c amber.rst7 -o amber.out -r amber.crd -inf amber.nrg -x amber.nc
