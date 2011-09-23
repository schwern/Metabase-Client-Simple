#!perl

# Test the https scheme error message for various verions of LWP.

# This file is part of Metabase-Client-Simple
# 
# This software is Copyright (c) 2010 by David Golden.
# 
# This is free software, licensed under:
# 
#   The Apache License, Version 2.0, January 2004

use strict;
use warnings;

use Test::More 0.88;

my $CLASS = 'Metabase::Client::Simple';

require_ok($CLASS);

note "Older LWP"; {
    local $LWP::VERSION = 6.01;

    my $msg = $CLASS->_error_message_for_scheme("https");
    like $msg, qr{^Scheme 'https' is not supported by your LWP::UserAgent\.$}m;
    like $msg, qr{^You must install Crypt::SSLeay or IO::Socket::SSL or use http instead.$}m;
}

note "Newer LWP"; {
    local $LWP::VERSION = 6.02;

    my $msg = $CLASS->_error_message_for_scheme( "https");
    like $msg, qr{^Scheme 'https' is not supported by your LWP::UserAgent\.$}m;
    like $msg, qr{^You must install LWP::Protocol::https or use http instead.$}m;
}


done_testing;
