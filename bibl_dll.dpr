library bibl_dll;

{ Important note about DLL memory management: ShareMem must be the
  firstt unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  procedures that pass strings as parameters or procedure results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses SysUtils, System.Classes;

type plist=^studenci;
      studenci = record
                imie:string[20];
                nazwisko:string[20];
                nrindeksu:integer;
                grupadziekanska:string[30];
                wsk:plist;
                end;



{$R *.res}
var
Plik:file of studenci;
studentput:studenci;
firstt:plist;





procedure insertNode(a:studenci ; var firstt:plist);stdcall; // druga przez referencjê;
var prev, cur: plist;
	begin
	cur:=firstt; // iterator;
	// brak elementów
	if firstt=nil then
	  begin
		new(firstt); // tworzymy nowy element
		firstt^.imie:=studentput.imie;
    firstt^.nazwisko:=studentput.nazwisko;
    firstt^.nrindeksu:=studentput.nrindeksu;
    firstt^.grupadziekanska:=studentput.grupadziekanska;
		firstt^.wsk:=nil;
	  end
	else // lista nie jest pusta
		if studentput.nrindeksu<=firstt^.nrindeksu then
		  begin
			new(cur);
			cur^.imie:=studentput.imie;
      cur^.nazwisko:=studentput.nazwisko;
      cur^.nrindeksu:=studentput.nrindeksu;
      cur^.grupadziekanska:=studentput.grupadziekanska;
			cur^.wsk:=firstt;
			firstt:=cur;
		  end
		else begin
			while (cur^.wsk<>nil) and (studentput.nrindeksu>cur^.wsk^.nrindeksu) do
			  cur:=cur^.wsk;
			prev:=cur;
			new(cur);
			cur^.imie:=studentput.imie;
      cur^.nazwisko:=studentput.nazwisko;
      cur^.nrindeksu:=studentput.nrindeksu;
      cur^.grupadziekanska:=studentput.grupadziekanska;
			cur^.wsk:=prev^.wsk;
			prev^.wsk:=cur;
		     end;
end(*insertNode*);

//odczyt pliku do listy
procedure odczyt_do_listy(var rows:integer);stdcall;
begin
assignfile(Plik,'records.dat');
 if not FileExists('records.dat') then
    Rewrite(plik)
 else
Reset(Plik);
rows:=0;
while not eof(Plik) do
begin
  Read(Plik, studentput);
  InsertNode(studentput,firstt);
  inc(rows);
end;
CloseFile(Plik);
end;
//Koniec odczytu. Lista zape³niona

//Zapis do pliku
procedure zapis_listy_do_pliku();stdcall;
var cur:plist;
begin
  assignfile(Plik,'records.dat');
  if not FileExists('records.dat') then
  rewrite(plik)
  else
  Reset(Plik);
  cur:=firstt;
  while (cur<>nil) do
  begin
  studentput.imie:=cur^.imie;
  studentput.nazwisko:=cur^.nazwisko;
  studentput.nrindeksu:=cur^.nrindeksu;
  studentput.grupadziekanska:=cur^.grupadziekanska;
  cur:=cur^.wsk;
  Write(Plik, studentput);
  end;
  closefile(Plik);
end;
//Koniec zapisu do pliku


exports
insertNode,
odczyt_do_listy,
zapis_listy_do_pliku ;

begin

end.
