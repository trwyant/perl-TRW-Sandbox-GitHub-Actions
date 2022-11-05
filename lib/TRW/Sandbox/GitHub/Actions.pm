package TRW::Sandbox::GitHub::Actions;

use 5.010;

use strict;
use warnings;

use Carp;

our $VERSION = '0.000_001';

use constant DEFAULT_NAME	=> 'world';

sub hi {
    my $name = $_[-1];
    defined $name
	and not $name->isa( __PACKAGE__ )
	or $name = DEFAULT_NAME;
    return "Hello, $name!";
}

1;

__END__

=head1 NAME

TRW::Sandbox::GitHub::Actions - Play with GitHub actions.

=head1 SYNOPSIS

 use TRW::Sandbox::GitHub::Actions;
 say TRW::Sandbox::GitHub::Actions->hi();

=head1 DESCRIPTION

This Perl module exists only to provide a sandbox for me to play with
GitHub Actions without introducing more extraneous commits into
production code.

=head1 METHODS

This class supports the following public methods:

=head2 hi

 say TRW::Sandbox::GitHub::Actions->hi(); # Hello, world!
 say TRW::Sandbox::GitHub::Actions->hi( 'sailor' ); # Hello, sailor!

This static method returns the string C<"Hello, $last_argument!">. If
the last argument is C<undef>, it returns C<'Hello, world!'>.

=head1 SUPPORT

Support is by the author. Please file bug reports at
L<https://rt.cpan.org/Public/Dist/Display.html?Name=TRW-Sandbox-GitHub-Actions>,
L<https://github.com/trwyant/perl-TRW-Sandbox-GitHub-Actions/issues/>, or in
electronic mail to the author.

=head1 AUTHOR

Thomas R. Wyant, III F<wyant at cpan dot org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2022 by Thomas R. Wyant, III

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl 5.10.0. For more details, see the full text
of the licenses in the directory LICENSES.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=cut

# ex: set textwidth=72 :
