# --
# Copyright (C) 2011 - 2023 Perl-Services.de, https://perl-services.de
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::TicketOverview::Hooks::Junk;

use strict;
use warnings;

our @ObjectDependencies = qw(
    Kernel::Config
    Kernel::System::Ticket
);

=head1 NAME

Kernel::System::TicketOverview::Hooks::Junk - mark junk tickets in ticket overview

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

    my $JunkColor = $JunkObject->Run(
        TicketID => 123,
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    for my $Needed (qw(TicketID)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }


    if ( !$Param{Queue} ) {
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
        %Param = $TicketObject->TicketGet(
            TicketID => $Param{TicketID},
        );
    }

    return if $Param{Queue} ne 'Junk';
    return $ConfigObject->Get('Hook::Junk');
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut

=head1 VERSION

$Revision: 1.83 $ $Date: 2010/09/01 07:50:22 $

=cut
