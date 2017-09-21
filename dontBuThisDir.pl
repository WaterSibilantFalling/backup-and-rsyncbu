#!/usr/bin/perl
use strict;
use warnings; 
use POSIX;
use English qw( -no_match_vars ) ;
use feature 'say';
use 5.12.0;
use Getopt::Long;

#this script :
#
#
#
#
#
#

my $dirToNotBU;
my $filename ;
GetOptions(	"d=s"	=> \$dirToNotBU,
			"f:s"	=> \$filename,
			);

my %buConfigs = do '/home/backup/buConfigs.pl';

# there MUST NOT be spaces after the file or path name
if (defined $filename) {
` echo \"$dirToNotBU/$filename\" >> $buConfigs{buNeverListFilename} `;
} else {
` echo \"$dirToNotBU\" >> $buConfigs{buNeverListFilename} `;
}




















