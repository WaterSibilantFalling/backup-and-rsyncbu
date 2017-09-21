# backup

A perl 5 script that automatically backs ups all changed files:
1.	to a remote free email service
2.	to a local directory



# rsyncbu

rsyncbu is a simple wrapper around rsync. rsyncbu reads an \*.ini style configuration file and then manages an arbitrary number of similar or completely different rsync backup jobs. 

rsyncbu is written in Perl5 using only standard libraries. 


### Configuration

All configuration is done through rsyncbu's \*.conf file. The configuration file defaults to rsyncbu.conf in the current directory. However, a different configuration file can be passed to rsyncbu.

##### The rsyncbu.conf configuraion file

The rsyncbu.conf file has two major components:
1. meta settings and aliases
2. backup control sections

###### meta settings & aliases

Sets, specific groups, of rsync command line options can be establised
```
no_lt_bu_options=" -r -p -t -g -o -D -v -u -i --delete --log-file=LOGFILE" 
```

Base backup dirs, date format string, log files and the like:
```
[config]
DATE=/usr/local/bin/sdmdate
LOGFILE=DATE_rsyncBackupMessages.txt

[backupDirs]
main_backup_dir=/mnt/backup_1TB/backups/rsync_backup
some_other_dir=/aaa/bbb/ccc
```

###### backup control sections

Each of these sections specify the souce and destination of one section of the backup process. 

```
[LIBRARY_OLD]
doit=1
source=/home/library
options=standard_rsync_options
dest=main_backup_dir
excludePatterns="nnew/ *.avi *.MOV"

```

