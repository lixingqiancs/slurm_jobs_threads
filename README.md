# slurm_jobs_threads
## Makefile as workflow control language
The makefile simply contains rules and a rule consists of three parts: target, (dependencies) and commands.
e.g.
```
soap_align: depend.fq
  soap -p 20 ...other options...
```
## Version 1.0

## Features
- Read Makefile and submit parallel multi-threads jobs to SLURM （Simple Linux Utility for Resource Management）.
- If user qdel a job in 'qw' state, a period of time(TIMEOUT) later the program will stop.
- Jobs will be submitted in -pe smp(PE), and log directory will be 'log_SLURM'(LOG_DIR).
- Logs will be append to file log_Slurm.out.
- Specifal comment in the 'target: dependence' line, #-@ INT, will be the threads (INT). 
- No comment (#...) is allowed in command line.
- Send notification to telegram

## Mechanism:
- Using 2 objects Parallel_jobs(with nested _Job), and Makefile(with nested _Rule).
- Using squeue (1st(id) and 5th(state) column) to get jobs ongoing/waiting information. 
- Using sacct (exit_status row) to get jobs stopped(success/fail) information.

## Install:
```
# download.
git clone git@github.com:dazhouze/slurm_jobs_threads.git
# add the directory to environment variable.
export PATH=dir/of/slurm_jobs_threads:$PATH
```

## Run:
```
slurm_jobs_threads  -f makefile -j #paralell_jobs -q queue1
# More options will be shown in terminal using:
slurm_jobs_threads -h
```
