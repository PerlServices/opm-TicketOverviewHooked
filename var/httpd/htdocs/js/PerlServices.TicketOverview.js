// --
// PerlServices.TicketOverview.js - provides functions for form handling
// Copyright (C) 2010-2011 Perl-Services.de, http://perl-services.de
// --
// $Id: PerlServices.TicketOverview.js,v 1.2 2011/04/18 17:31:06 rb Exp $
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var PerlServices = PerlServices || {};

/**
 * @namespace
 * @exports TargetNS as PerlServices.TicketOverview
 * @description
 *      This namespace contains all form functions.
 */
PerlServices.TicketOverview = (function (TargetNS) {

    /**
     * @function
     * @description
     *      This function fills the form with the info from template 
     * @param JsonData - the tickettemplate as jsondata
     * @return nothing
     */
    TargetNS.ColorizeRows = function () {
        $( 'tr > td' ).each(function(index){
            var parent_elem = $(this).parent();
            var class_list  = parent_elem.attr( 'class' );
            if ( class_list && class_list.match( /Hooked_([A-Fa-z0-9]+)/ ) ) {
                $(this).css( 'background-color', '#' + RegExp.$1 );
            }
        });
    };

    return TargetNS;
}(PerlServices.TicketOverview || {}));
