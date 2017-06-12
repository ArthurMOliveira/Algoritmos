Program EQ06N05;
//Arthur Mattoso de Oliveira, GRR20175438
//Paulo Eduardo Grigonis Tedesco da Silva, GRR20175427

uses modulos;

var a,b,c,p,e,t,num,tot,jt:integer;
arq2:file of regis;
reg2:regis;
nom:string[36];
vetd:array[1..2000] of cc;
dados,aux:cc;
op:string;
tro:boolean;

begin
      assign (arq2,'cadast.dir');
      reset (arq2);
      t:=1;
      
      begin 
      	writeln('Processando...');
        while not(eof(arq2)) do
        begin
          read(arq2,reg2);
          if(reg2.num<>0)then
          begin
            dados.p:=reg2.num;
            dados.nom:=reg2.nome;
            vetd[t]:=dados;
            t:=t+1;
          end;
        end;
      end;
      
        c:=0;
      for a:=1 to t do
      begin
        seek(arq2,vetd[a].p-1);
        read(arq2,reg2);
        c:=c+1;
        writeln(t:5,reg2.num:5,' ',reg2.nome,' ',reg2.cpf,' ',copy(reg2.data,7,2),'/',copy(reg2.data,5,2),'/',copy(reg2.data,1,4),reg2.car:3,reg2.n1:4,reg2.n2:4,reg2.n3:4,reg2.n4:4,reg2.so:4,reg2.clg:4,reg2.clc:3,reg2.ccl:3);
        if (c mod 50=0) then
        begin
          readln;
          clrscr;
        end;
      end;

      readln;
end.
