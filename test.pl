
use Test;
BEGIN { plan tests => 2 };
use Linux::Fuser;
ok(1);


eval {
my $f = Linux::Fuser->new();

open(F,">$$.tmp");
my @procs = $f->fuser("$$.tmp");

foreach $proc ( @procs )
{
   print $proc->pid(),"\t",$proc->user(),"\n";
}

close F;
};
if ( $@)
{
  ok(0);
}
else
{
  ok(2);
}

END {
unlink "$$.tmp";
};

