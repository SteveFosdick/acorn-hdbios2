#! /usr/bin/perl

my $label;
while (<stdin>) {
    chomp;
    if (/^;/ || /^\s*$/) {
        print "$_\n";
    }
    elsif (/^(\w+:)\s+equ\s+(.*)$/) {
        printf("%-16sequ  %s\n", $1, $2);
    }
    elsif (/^(\w+:)\s*$/) {
        $label = $1;
    }
    else {
        s/^\s*//;
        my ($inst, $comment) = split(/\s*;\s*/, $_);
        my ($opcode, $operand) = split(/\s+/, $inst, 2);
        if ($comment ne '') {
            printf("%-16s%-5s%-20s; %s\n", $label, $opcode, $operand, $comment);
        }
        elsif ($operand ne '') {
            printf("%-16s%-5s%s\n", $label, $opcode, $operand);
        }
        else {
            printf("%-16s%s\n", $label, $opcode);
        }
        $label = undef;
    }
}
print "; end\n";
