# --
# Copyright (C) 2013 - 2023 Perl-Services.de, https://perl-services.de
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::TicketOverview::Hooks::PendingTime;

use strict;
use warnings;

our @ObjectDependencies = qw(
    Kernel::Config
    Kernel::System::Ticket
);

=head1 NAME

Kernel::System::TicketOverview::Hooks::PendingTime - mark tickets in ticket overview that have reached the pending time

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item Run()

Returns a color when the ticket belongs to the Junk-Queue

    my $PendingTimeColor = $PendingTimeObject->Run(
        TicketID  => 123,
        UntilTime => 1351,
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    return if !$Param{UntilTime};
    return if $Param{UntilTime} >= 0;
    return if $Param{StateType} !~ m{\Apending};

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $Color        = $ConfigObject->Get('Hook::PendingTime') || 'ff0000';

    return $Color;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut

