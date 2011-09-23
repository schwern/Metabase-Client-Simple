
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'a client that submits to Metabase servers',
  'AUTHOR' => 'David Golden <dagolden@cpan.org>, Ricardo Signes <rjbs@cpan.org>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'File::Spec' => '0',
    'File::Temp' => '0',
    'Metabase::User::Profile' => '0',
    'Metabase::User::Secret' => '0',
    'Test::More' => '0.88'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Metabase-Client-Simple',
  'EXE_FILES' => [],
  'LICENSE' => 'apache',
  'NAME' => 'Metabase::Client::Simple',
  'PREREQ_PM' => {
    'HTTP::Request::Common' => '0',
    'HTTP::Status' => '0',
    'JSON' => '2',
    'LWP::UserAgent' => '5.54',
    'URI' => '0'
  },
  'VERSION' => '0.008',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



