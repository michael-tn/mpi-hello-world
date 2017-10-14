#!/bin/bash
#PBS -V
### Set the job name
#PBS -N mpi_hello_world
### Email for messaging
#PBS -M gallowaymd@ornl.gov
### Node Spec, number of nodes and processors per node
###Two nodes and 32 cores per node in this case
#PBS -l nodes=4:ppn=36
### Tell PBS the anticipated run-time for your job, where walltime=HH:MM:S
#PBS -l walltime=1:00:0:0
### qos's available: std long burst devel
#PBS -l qos=std
## Account specifier, from the account specifier in moab accounts.dat
## we can list if needed. in this case cades-ccsi
#PBS -A  staff
#PBS -W x=FLAGS:ADVRES:cades-ops.5914
### The ldap group list they need. In this case cades-user for burst
#PBS -W group_list=cades-ops
### Base queueing stuff
### Switch to the working directory
cd $PBS_O_WORKDIR 
# Calculate the number of processors allocated to this run.
NPROCS=`wc -l < $PBS_NODEFILE`
# Calculate the number of nodes allocated.
NNODES=`uniq $PBS_NODEFILE | wc -l`
### Display the job context
mpirun  singularity exec michael-tn-mpi-hello-world-master.simg mpi_hello_world  &>run.log
