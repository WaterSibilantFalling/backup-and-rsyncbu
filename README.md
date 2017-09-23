# backup

A perl 5 script that automatically backs ups all changed files:
1.	to a remote free email service
2.	to a local directory

```
> ./backup

Usage:

	backup	--buPeriod [day,week,month,all] | --since 'date time spec string' 

```

All changed files over the backup time period are tar'ed and gziped into tar files of a limited size, say 10MB. A listing of the files in each tar file is written to the body of an email, the tar file is attached as an attachment, and the ID of the email and each of its files is written to an easily grep-able, parse-able text file. Depending on the day, and the length of time for which files are being backed up, 3 emails, or 35 emails, can be sent. 

Easily accessible local copies of these *tgz files, gzip compressed tar files, are kept locally, until deleted by the backupCleaner utility. Remote backups are not deleted. 

**Note**:

* files larger than the tar file size can not be backed up.

* This program needs read rights to the files that it will be backing up

* a collection of utility functions, buFunctions.pl, should be intatlled in you Perl installation's 'use' path, e.g. to ```/usr/local/lib/site_perl/ ```. 

### supporting programs

**noBU**	:	a little tool run to mark a direcory as do-not-back-up

**backupCleaner** 	:	cleans out 'old' local copies of the backup files. What is old, for daily, weekly and monthly backups, is easily configured. 



# rsyncbu

rsyncbu is a simple wrapper around rsync. rsyncbu reads an \*.ini style configuration file and then manages an arbitrary number of similar or completely different rsync backup jobs. 

rsyncbu is written in Perl5 using only standard libraries. 

```

prompt>	rsyncBackup.pl 

	rsyncBackup	--doIt  [--config=./rsyncBackup.conf ]

- All configuraton is in the rsyncBackup.conf file.
- Run this program as root for some files (/etc /sbin ...)


```


### Configuration

All configuration is done through rsyncbu's \*.conf file. The configuration file defaults to rsyncbu.conf in the current directory. However, a different configuration file can be passed to rsyncbu.

##### The rsyncbu.conf configuraion file

The rsyncbu.conf file has two major components:
1. meta settings and aliases
2. backup control sections

##### meta settings & aliases

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

##### backup control sections

Each of these sections specify the souce and destination of one section of the backup process. 

```
[LIBRARY_OLD]
doit=1
source=/home/library
options=standard_rsync_options
dest=main_backup_dir
excludePatterns="nnew/ *.avi *.MOV"

```

