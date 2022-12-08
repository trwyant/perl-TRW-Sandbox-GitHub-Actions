package main;

use 5.008;

use strict;
use warnings;

use Test::More 0.88;	# Because of done_testing();

is scalar `echo Hello world.`, "Hello world.\n", 'Back ticks'
    or diag exit_code();

{
    no warnings qw{ qw };
    open my $fh, '-|', qw{ echo Hello, sailor. }
	or do {
	fail "Pipe open failed: $!";
	last;
    };

    local $/ = undef;	# Slurp
    is <$fh>, "Hello, sailor.\n", 'Open to pipe';
    close $fh;
}

SKIP: {
    {
	AmigaOS	=> 1,
	'RISC OS'	=> 1,
	VMS	=> 1,
    }->{$^O}
	and skip "Fork does not work under $^O", 1;


    my $pid = open my $fh, '-|';

    if ( ! defined $pid ) {	# Fork failed
	fail "Fork failed: \$! is $!, \$? is " . exit_code();
    } elsif ( $pid ) {		# We're the parent
	local $/ = undef;	# Slurp
	is scalar <$fh>, "Goodbye, cruel world.\n", 'Fork, spawn Perl';
	close $fh;
    } else {			# We're the child
	no warnings qw{ exec };
	exec { 'perl' } qw{ perl -le }, 'print "Goodbye, cruel world.";';
	diag "Exec failed: $!";
    }

}

done_testing;

sub exit_code {
    $? == -1
	and return "Failed to execute command: $!";
    $? & 127
	and return sprintf 'Child died with signal %d, %s coredump',
    $? & 127, $? & 128 ? 'with' : 'without';
    return sprintf 'Child exited with value %d', $? >> 8;
}

1;

# ex: set textwidth=72 :
