# showatar - show gravatar for <email> in <size> using f{eh,irefox}
use strict;
use warnings;
use Getopt::Long;
use URI::Escape qw(uri_escape);
use Digest::MD5 qw(md5_hex);


if(!@ARGV) {
  print << "FOO";
  USAGE: $0 <e-mail> (-s <size>)
FOO
}

our ($size);
GetOptions('size=i' =>  \$size);

if(!$size) {
  $size = 80;
}
my $cmd      = 'feh';
my @mails    = @ARGV;
my $defuri   = 'http://www.gravatar.com/avatar/'; 

foreach my $mail(@mails) {
  my $gravid  = md5_hex(lc($mail));
  my $fulluri = $defuri.$gravid."?s=$size.jpg";
  print "$fulluri ($mail) \n";
  system("$cmd $fulluri");
}
