package main;

use 5.010;

use strict;
use warnings;

use Test::More 0.88;	# Because of done_testing();
use TRW::Sandbox::GitHub::Actions;

use constant CLASS	=> 'TRW::Sandbox::GitHub::Actions';

is CLASS->hi(), 'Hello, world!', 'hi()';

is CLASS->hi( 'sailor' ), 'Hello, sailor!', q<hi( 'sailor' )>;

# is CLASS->hi( 'boys' ), 'Hello, girls!', 'Intentional error';

done_testing;

1;

# ex: set textwidth=72 :
