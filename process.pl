use strict;

my $saxon   = "java -jar ../../../../../Tools/tei2html/tools/lib/saxon9he.jar ";

print "Create single volume XML version of Demonology...\n";

system ("$saxon Demonology.xsl Demonology.xsl > Demonology.xml");
system ("perl -S tei2html.pl -h -e Demonology.xml");
