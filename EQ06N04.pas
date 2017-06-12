Program EQ06N04;
//Arthur Mattoso de Oliveira, GRR20175438
//Paulo Eduardo Grigonis Tedesco da Silva, GRR20175427

uses modulos;

const prova1 = 'prova1.txt';
			prova2 = 'prova2.txt';
			cadast = 'cadast.dir';

type  notas=record
			 p,certas,erradas,nr,n1,n2,n3,n4:integer;
			end;
			
var   prov,prov2:text;
			registro:regis;
			cad:file of regis;
			dados:string[54];
			gab,res,gab2:string[50];
			insc:string[4];  
			a,b,c,d,p,e,t,err,certas,erradas,nr,n1,n2,n3,n4:integer;
			vetnotas:array[1..2000] of notas;
			media:real;
			soma:integer;
			
Begin

assign (cad,cadast);
reset (cad);

clrscr;
writeln ('Pressione ENTER para corrigir a primeira prova');
readln;
clrscr;
	
for a:=1 to 50 do
	insert ('A',gab,1); //Criou um gabarito com respostas A para todas as questões.
	
assign (prov,prova1);
reset (prov);
t:=1;
		
	while not eof(prov) do
		begin
		  certas:=0;
		  erradas:=0;
		  nr:=0;
		  n1:=0;
		  n2:=0;
			readln(prov,dados);
			insc:=copy(dados,1,4);
			res:=copy(dados,5,54);
			val(insc,p,err);
				
			for b:=1 to 25 do
				if (res[b] = gab[b]) then
					begin
						certas:=certas+1;
						n1:=n1+4;
					end
				else if (res[b] = ' ') then
					nr:=nr+1	
				else
					erradas:=erradas+1;
				
			for b:=26 to 50 do
				if (res[b] = gab[b]) then
					begin
					certas:=certas+1;
					n2:=n2+4;
					end
				else if (res[b] = ' ') then
					nr:=nr+1		
				else
					erradas:=erradas+1;
						
		 	vetnotas[t].p:=p;
		 	vetnotas[t].certas:=certas;
		 	vetnotas[t].erradas:=erradas;
		 	vetnotas[t].nr:=nr;
			vetnotas[t].n1:=n1;
		 	vetnotas[t].n2:=n2;
		 	
		 	t:=t+1;
		end;
		t:=t-1;
		for c:=1 to t do
			begin
				seek(cad,vetnotas[c].p-1);
				read(cad,registro);
				registro.n1:=vetnotas[c].n1;
				registro.n2:=vetnotas[c].n2;
			  seek(cad,vetnotas[c].p-1);
			  write(cad,registro);
			end;  
close (prov);
writeln('NUM':4,' NOME',' ':33,'CERTAS',' ERRADAS',' NR',' N1':3,' N2':4);
soma:=0;
for c:=1 to t do
	begin
		seek(cad,vetnotas[c].p-1);
		read(cad,registro);
		writeln(registro.num:4,' ',registro.nome:36,' ',vetnotas[c].certas:6,' ',vetnotas[c].erradas:7,' ',vetnotas[c].nr,' ',registro.n1:3,' ',registro.n2:3);
			if (c mod 50=0) then
				begin
				readln;
				writeln(registro.num:4,' ',registro.nome:36,' ',vetnotas[c].certas:6,' ',vetnotas[c].erradas:7,' ',vetnotas[c].nr,' ',registro.n1:3,' ',registro.n2:3);
				end;		
		soma:=(soma+registro.n1+registro.n2);						
	end;
	media:=(soma/t);
	writeln;
	writeln;
	write ('A media das notas da turma na primeira prova foi de: ',media);
	readln;	

	
//INÍCIO SEGUNDA PROVA
close (cad);
reset (cad);

clrscr;
writeln ('Pressione ENTER para corrigir a segunda prova');
readln;
clrscr;
	
for a:=1 to 50 do 
	insert ('B',gab2,1); //Criou um gabarito com respostas B para todas as questões.
	
assign (prov2,prova2);
reset (prov2);
t:=1;
		
	while not eof(prov2) do
		begin
		  certas:=0;
		  erradas:=0;
		  nr:=0;
		  n3:=0;
		  n4:=0;
			readln(prov2,dados);
			insc:=copy(dados,1,4);
			res:=copy(dados,5,54);
			val(insc,p,err);
				
			for b:=1 to 25 do
				if (res[b] = gab2[b]) then
					begin
						certas:=certas+1;
						n3:=n3+4;
					end
				else if (res[b] = ' ') then
					nr:=nr+1	
				else
					erradas:=erradas+1;
				
			for b:=26 to 50 do
				if (res[b] = gab2[b]) then
					begin
					certas:=certas+1;
					n4:=n4+4;
					end
				else if (res[b] = ' ') then
					nr:=nr+1		
				else
					erradas:=erradas+1;
						
		 	vetnotas[t].p:=p;
		 	vetnotas[t].certas:=certas;
		 	vetnotas[t].erradas:=erradas;
		 	vetnotas[t].nr:=nr;
			vetnotas[t].n3:=n3;
		 	vetnotas[t].n4:=n4;
		 	
		 	t:=t+1;
		end;
		t:=t-1;
		for c:=1 to t do
			begin
				seek(cad,vetnotas[c].p-1);
				read(cad,registro);
				registro.n3:=vetnotas[c].n3;
				registro.n4:=vetnotas[c].n4;
			  seek(cad,vetnotas[c].p-1);
			  write(cad,registro);
			end;  
close (prov2);
writeln('NUM':4,' NOME',' ':33,'CERTAS',' ERRADAS',' NR',' N3':3,' N4':4);
soma:=0;
for c:=1 to t do
	begin
		seek(cad,vetnotas[c].p-1);
		read(cad,registro);
		writeln(registro.num:4,' ',registro.nome:36,' ',vetnotas[c].certas:6,' ',vetnotas[c].erradas:7,' ',vetnotas[c].nr,' ',registro.n3:3,' ',registro.n4:3);
			if (c mod 50=0) then
				begin
				readln;
				writeln(registro.num:4,' ',registro.nome:36,' ',vetnotas[c].certas:6,' ',vetnotas[c].erradas:7,' ',vetnotas[c].nr,' ',registro.n3:3,' ',registro.n4:3);
				end;		
		soma:=(soma+registro.n3+registro.n4);						
	end;
	media:=(soma/t);
	writeln;
	writeln;
	write ('A media das notas da turma na SEGUNDA prova foi de: ',media);
	readln;		
  
End.
