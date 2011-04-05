package Cleavages;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
    I18N
    FillInForm

    StackTrace
    ErrorCatcher

    Session
    Session::Store::DBIC
    Session::State::Cookie

    Authentication
/;

extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in cleavages.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'Cleavages',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
);

# Start the application
__PACKAGE__->setup();

# shortcut call to make i18n easier in TT
sub i18nise {
    my ($c, $msgid, $msgargs) = @_;
    return $c->localize(
        $msgid,
        $msgargs
    );
}

# do we have a logged-in user?
sub is_logged_in {
    my ($c) = @_;

    return 1
        if ($c->user);

    return 0;
}


=head1 NAME

Cleavages - Catalyst based application

=head1 SYNOPSIS

    script/cleavages_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Cleavages::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Chisel,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
