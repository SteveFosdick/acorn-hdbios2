hdbios-dasm.z80: blocks symbols original.sys format.pl
	z80dasm -a -g 0xea00 -l -t -b blocks -S symbols original.sys | perl format.pl > hdbios-dasm.z80
