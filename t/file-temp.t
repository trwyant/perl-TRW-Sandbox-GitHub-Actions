package main;

use 5.008;

use strict;
use warnings;

use File::Temp;
# use Test::More 0.88;	# Because of done_testing();
use Test2::V0;

use constant WANT	=> "Able was I ere I saw Elba\n";
my $temp = File::Temp->new();

diag '';

{
    open my $fh, '>', $temp->filename()
	or die "Unable to open ", $temp->filename(), ": $!";
    diag 'Output layers:';
    diag "    $_" for PerlIO::get_layers( $fh );
    print { $fh } WANT;
    close $fh;
}

diag ' Input layers:';
diag "    $_" for PerlIO::get_layers( $temp );


seek $temp, 0, 0;

my $got = do {
    local $/ = undef;
    <$temp>;
};

is $got, WANT, 'Got back what we wrote';

done_testing;

1;

# ex: set textwidth=72 :
