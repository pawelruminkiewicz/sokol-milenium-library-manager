unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.Grids,StrUtils,
  Vcl.ExtCtrls, Data.DB, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, math, savephoto,
  Vcl.AppEvnts,jpeg,  PNGImage, FireDAC.UI.Intf, FireDAC.VCLUI.Error,
  FireDAC.Stan.Error, FireDAC.Stan.Intf, FireDAC.Comp.UI;
  type plist2=^ksiazkarec;
     ksiazkarec = record
                  tytul:string[50];
                  autor:string[60];
                  nrkatalogowy:string[10];
                  wypozyczona:boolean;
                  wsk:plist2;
                  end;
  type plist=^czytelnikrec;
     czytelnikrec = record
                    imie:string[20];
                    nazwisko:string[30];
                    klasa:string[10];
                    zdjecie:string[255];
                    nrlegitymacji:integer;
                    wypozyczone:array[0..30] of ksiazkarec;
                    iloscwypozyczonych:integer;
                    wsk:plist;
                    end;

type
  TOpcjeForm = class(TForm)
Bt1:TButton;
Bt2:TButton;
Bt3:TButton;
Ed1:TEdit;
Ed2:TEdit;
Ed3:TEdit;
Lb1:TLabel;
Lb2:TLabel;
Lb3:TLabel;
stg:TStringgrid;
procedure Bt1Click(Sender: TObject);
procedure Bt2Click(Sender: TObject);
procedure Bt3Click(Sender: TObject);
  end;
  TDodajForm_ks = class(TForm)
Bt1:TButton;
Ed1:TEdit;
Ed2:TEdit;
Ed3:TEdit;
Lb1:TLabel;
Lb2:TLabel;
Lb3:TLabel;
procedure Bt1Click(Sender: TObject);
procedure Ed1KeyPress(Sender: TObject; var Key: Char);
procedure Ed2KeyPress(Sender: TObject; var Key: Char);
  end;
  TEdytujForm_ks = class(TForm)
Bt1:TButton;
Ed1:TEdit;
Ed2:TEdit;
Ed3:TEdit;
Lb1:TLabel;
Lb2:TLabel;
Lb3:TLabel;
procedure Ed1KeyPress(Sender: TObject; var Key: Char);
procedure Ed2KeyPress(Sender: TObject; var Key: Char);
procedure Bt1Click(Sender: TObject);
  end;
    TDodajForm = class(TForm)
Bt1:TButton;
Ed1:TEdit;
Ed2:TEdit;
Ed3:TEdit;
Ed4:TEdit;
Lb1:TLabel;
Lb2:TLabel;
Lb3:TLabel;
Lb4:TLabel;
procedure Bt1Click(Sender: TObject);
procedure Ed1KeyPress(Sender: TObject; var Key: Char);
procedure Ed2KeyPress(Sender: TObject; var Key: Char);
  end;
  TEdytujForm = class(TForm)
Bt1:TButton;
Ed1:TEdit;
Ed2:TEdit;
Ed3:TEdit;
Ed4:TEdit;
Lb1:TLabel;
Lb2:TLabel;
Lb3:TLabel;
Lb4:TLabel;
procedure Bt1Click(Sender: TObject);
procedure Ed1KeyPress(Sender: TObject; var Key: Char);
procedure Ed2KeyPress(Sender: TObject; var Key: Char);
  end;

  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    GroupBox6: TGroupBox;
    StringGrid3: TStringGrid;
    GroupBox8: TGroupBox;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Button5: TButton;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Panel1: TPanel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    Button2: TButton;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    Edit16: TEdit;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label4: TLabel;
    Button10: TButton;
    GroupBox7: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit5: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Button4: TButton;
    Button11: TButton;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Button12: TButton;
    Button3: TButton;
    Panel2: TPanel;
    ApplicationEvents1: TApplicationEvents;
    Edit1: TEdit;
    Edit2: TEdit;
    SavePhoto1: TSavePhoto;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid3Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure aktualizacja_stg_czyt();
    procedure aktualizacja_stg_ks();
    procedure aktualizacja_stg_wyp();
    procedure Button2Click(Sender: TObject);
    procedure StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown5Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown6Click(Sender: TObject; Button: TUDBtnType);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Button10Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure SavePhoto1Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  klasy:array[0..30] of string;
  lklas:integer;
  OpcjeForm:TOpcjeForm;
  EdytujForm:TEdytujForm;
  DodajForm:TDodajForm;
  EdytujForm_ks:TEdytujForm_ks;
  DodajForm_ks:TDodajForm_ks;
  uczen:czytelnikrec;
  ksiazka:ksiazkarec;
  liczba_wierszy_uczen:integer;
  liczba_wierszy_ksiazka:integer;
  first:plist;
  first2:plist2;
  const a:integer=1;


procedure zapis_ust(var tab:array of string);stdcall; external 'sokol_dll' name 'zapis_ust';
procedure odczyt_ust(var tab:array of string;var lkl:integer);stdcall; external 'sokol_dll' name 'odczyt_ust';
procedure insertNodeczyt(a:czytelnikrec ; var first:plist);stdcall; external 'sokol_dll' name 'insertNodeczyt';
procedure edycja_zdjecie(a,b:czytelnikrec;var first : plist);stdcall; external 'sokol_dll' name 'edycja_zdjecie';
procedure usun_zdjecie(a:czytelnikrec;var first : plist);stdcall; external 'sokol_dll' name 'usun_zdjecie';
procedure usunczyt(a:czytelnikrec; var first:plist);stdcall; external 'sokol_dll' name 'usunczyt';
procedure edycjaczyt(a,b:czytelnikrec; var first:plist);stdcall; external 'sokol_dll' name 'edycjaczyt';
procedure odczyt_do_listyczyt(var rows:integer; var first : plist); stdcall; external 'sokol_dll' name 'odczyt_do_listyczyt';
procedure zapis_listy_do_plikuczyt(var first : plist);stdcall; external 'sokol_dll' name 'zapis_listy_do_plikuczyt';
procedure insertNodeks(a:ksiazkarec ; var firstt2:plist2);stdcall; external 'sokol_dll' name 'insertNodeks';
procedure usunks(a:ksiazkarec; var first2:plist2);stdcall; external 'sokol_dll' name 'usunks';
procedure edycjaks(a,b:ksiazkarec; var first2:plist2);stdcall; external 'sokol_dll' name 'edycjaks';
procedure odczyt_do_listyks(var rows2:integer; var firstt2 : plist2); stdcall; external 'sokol_dll' name 'odczyt_do_listyks';
procedure zapis_listy_do_plikuks(var firstt2 : plist2);stdcall; external 'sokol_dll' name 'zapis_listy_do_plikuks';
implementation

{$R *.dfm}

function PolskiZnak(Znak: Char): Boolean;
begin
  result := false;
  case Znak of
   'π','Í','Ê','≥','Ò','Û','ú','ü','ø',
   '•',' ','∆','£','—','”','å','è','Ø': result := true;
  end;
end;
function Znakduzy(Znak: Char): Boolean;
begin
  result := false;
  case Znak of
   '•',' ','∆','£','—','”','å','è','Ø',
   'A'..'Z': result := true;
  end;
end;
function Znakmaly(Znak: Char): Boolean;
begin
  result := false;
  case Znak of
   'π','Í','Ê','≥','Ò','Û','ú','ü','ø',
   'a'..'z': result := true;
  end;
end;
procedure maska(edit:tedit;var Key: Char);
var a:string;x:integer;
begin
x:=length(edit.text);
a:=edit.text;
if (not(Key in['A'..'Z','a'..'z',' ','-',#08])) and (not(PolskiZnak(Key)))then Key := #0;
if x=0 then key:=UpCase(key);
if x<>0 then
begin
if(a[x]='-') or (a[x]=' ') then key:=UpCase(key);
if(a[x]=' ') and (key=#32)  then key:=#0;
if(a[x]='-') and (key=#45)  then key:=#0;
if(a[x]='-') and (key=#32)  then key:=#0;
if(a[x]=' ') and (key=#45)  then key:=#0;
if ((Znakduzy(key)=true) and (Znakmaly(a[x])=true)) or ((Znakduzy(key)=true) and (Znakduzy(a[x])=true)) then Key := #0;

end;
end;

procedure maska_imie(edit:tedit;var Key: Char);
var a:string;x:integer;
begin
x:=length(edit.text);
a:=edit.text;
if (not(Key in['A'..'Z','a'..'z',#08])) and (not(PolskiZnak(Key)))then Key := #0;
if x=0 then key:=UpCase(key);
if x<>0 then
begin
if ((Znakduzy(key)=true) and (Znakmaly(a[x])=true)) or ((Znakduzy(key)=true) and (Znakduzy(a[x])=true)) then Key := #0;
end;
end;

procedure akt_zdjecie();
var cur:plist;uczen:czytelnikrec;
begin
  cur:=first;
  if cur<>nil then
  begin
  uczen.imie:=form1.Stringgrid1.Cells[0,form1.Stringgrid1.Row];
  uczen.nazwisko:=form1.Stringgrid1.Cells[1,form1.Stringgrid1.Row];
  uczen.klasa:=form1.Stringgrid1.Cells[2,form1.Stringgrid1.Row];
  uczen.nrlegitymacji:=strtoint(form1.Stringgrid1.Cells[3,form1.Stringgrid1.Row]);
  while (cur^.imie<>uczen.imie) or (cur^.nazwisko<>uczen.nazwisko) or (cur^.klasa<>uczen.klasa) or (cur^.nrlegitymacji<>uczen.nrlegitymacji) do  cur:=cur^.wsk;
  uczen.zdjecie:=cur^.zdjecie;
    if uczen.zdjecie<>'' then
        if fileexists(uczen.zdjecie) then
        form1.savephoto1.Picture.LoadFromFile(uczen.zdjecie)
        else
        begin
        form1.SavePhoto1.Picture:=nil;
        form1.Button3.Enabled:=false;
        cur^.zdjecie:='';
        end
    else
    begin
    form1.SavePhoto1.Picture:=nil;
    form1.Button3.Enabled:=false;
    end;
  end;

 end;

procedure aktualizacja_stat();
var cur:plist;cur2:plist2;ks,ks_wyp,czyt,czyt_wyp,maxklasanr,aktrekord,i:integer;maxklasa,maxczyt:string;avg:single;tab:array[0..5] of integer;
begin
cur:=first;
czyt_wyp:=0;
aktrekord:=0;
maxczyt:='-';
cur2:=first2;
ks_wyp:=0;
while cur<>nil do
begin
  if cur^.iloscwypozyczonych>0 then inc(czyt_wyp);
  if cur^.iloscwypozyczonych>aktrekord then
  begin
  maxczyt:=cur^.imie+' '+cur^.nazwisko;
  aktrekord:=cur^.iloscwypozyczonych;
  end;
  cur:=cur^.wsk;
end;
while cur2<>nil do
begin
  if cur2^.wypozyczona=true then inc(ks_wyp);
  cur2:=cur2^.wsk;
end;
ks:=liczba_wierszy_ksiazka;
czyt:=liczba_wierszy_uczen;
if czyt<>0 then avg:=ks/czyt
else avg:=0;
form1.Label12.Caption:=inttostr(ks);
form1.Label13.Caption:=inttostr(ks_wyp);
form1.Label14.Caption:=inttostr(czyt);
form1.Label15.Caption:=inttostr(czyt_wyp);
form1.Label19.Caption:=maxczyt;
form1.label21.Caption:=floattostr(roundto(avg,-2));
end;
procedure Tform1.aktualizacja_stg_wyp();
var nrwiersza_wyp,liczba_wierszy_wyp,i,j:integer;cur:plist;
begin
    liczba_wierszy_wyp:=1;
    cur:=first;
    if cur<>nil then
    begin
    while (cur^.imie<>(stringgrid1.cells[0,stringgrid1.Row])) or (cur^.nazwisko<>(stringgrid1.cells[1,stringgrid1.Row])) or (cur^.klasa<>(stringgrid1.cells[2,stringgrid1.Row])) or (cur^.nrlegitymacji<>(strtoint(stringgrid1.cells[3,stringgrid1.Row]))) do cur:=cur^.wsk;
    i:=0;
    while (cur^.wypozyczone[i].tytul<>'') do inc(i);
    liczba_wierszy_wyp:=i;
    end;

    if liczba_wierszy_wyp<1 then
    begin
    StringGrid2.RowCount:=2;
    StringGrid2.Fixedrows:=1;
    end
    else
    begin
    StringGrid2.RowCount:=liczba_wierszy_wyp+1;
    StringGrid2.Fixedrows:=1;
    end;
  nrwiersza_wyp:=1;
  with StringGrid2 do
  begin
  cells[0,0]:='Tytu≥';
  cells[1,0]:='Autor';
  cells[2,0]:='Nr katalogowy';
  cells[0,1]:='';
  cells[1,1]:='';
  cells[2,1]:='';
  end;
  if cur<>nil then
  begin
  if cur^.wypozyczone[0].tytul<>'' then
    begin
      i:=0;
      while (cur^.wypozyczone[i].tytul<>'') do
        begin
        uczen.wypozyczone[i].tytul:=cur^.wypozyczone[i].tytul;
        uczen.wypozyczone[i].autor:=cur^.wypozyczone[i].autor;
        uczen.wypozyczone[i].nrkatalogowy:=cur^.wypozyczone[i].nrkatalogowy;
        with StringGrid2 do
          begin
          cells[0,nrwiersza_wyp]:=uczen.wypozyczone[i].tytul;
          cells[1,nrwiersza_wyp]:=uczen.wypozyczone[i].autor;
          cells[2,nrwiersza_wyp]:=uczen.wypozyczone[i].nrkatalogowy;
          end;
        inc(i);
        inc(nrwiersza_wyp);
        end;
    end;
    end
    else
      begin
      j:=0;
      for j :=0  to StringGrid2.RowCount do
        begin
        with StringGrid2 do
          begin
            cells[0,j]:='';
            cells[1,j]:='';
            cells[2,j]:='';
            cells[3,j]:='';
          end;
        end;
      end;

end;

procedure Tform1.aktualizacja_stg_ks();
var rows,nrwiersza_ks:integer;cur:plist2;
begin
cur:=first2;
nrwiersza_ks:=1;
    if liczba_wierszy_ksiazka<1 then
    begin
    StringGrid3.RowCount:=2;
    StringGrid3.Fixedrows:=1;
    end
    else
    begin
    StringGrid3.RowCount:=liczba_wierszy_ksiazka+1;
    StringGrid3.Fixedrows:=1;
    end;
 with StringGrid3 do
  begin
  cells[0,0]:='Tytu≥';
  cells[1,0]:='Autor';
  cells[2,0]:='Nr katalogowy';
  cells[3,0]:='DostÍpna';
  cells[0,1]:='';
  cells[1,1]:='';
  cells[2,1]:='';
  cells[3,1]:='';
  end;
  if cur<>nil then
begin
while (cur<>nil) do
  begin
  ksiazka.tytul:=cur^.tytul;
  ksiazka.autor:=cur^.autor;
  ksiazka.nrkatalogowy:=cur^.nrkatalogowy;
  ksiazka.wypozyczona:=cur^.wypozyczona;
  cur:=cur^.wsk;
  with StringGrid3 do
  begin
  cells[0,nrwiersza_ks]:=ksiazka.tytul;
  cells[1,nrwiersza_ks]:=ksiazka.autor;
  cells[2,nrwiersza_ks]:=ksiazka.nrkatalogowy;
  if ksiazka.wypozyczona=false then  cells[3,nrwiersza_ks]:='TAK'
  else  cells[3,nrwiersza_ks]:='NIE'
  end;
  inc(nrwiersza_ks);
  end;
end;

end;

procedure Tform1.aktualizacja_stg_czyt();
var  uczen:czytelnikrec;rows:integer;cur:plist;nrwiersza:integer;
begin
 cur:=first;
nrwiersza:=1;
    if liczba_wierszy_uczen<1 then
    begin
    StringGrid1.RowCount:=2;
    StringGrid1.Fixedrows:=1;
    end
    else
    begin
    StringGrid1.RowCount:=liczba_wierszy_uczen+1;
    StringGrid1.Fixedrows:=1;
    end;
 with StringGrid1 do
  begin
  cells[0,0]:='ImiÍ';
  cells[1,0]:='Nazwisko';
  cells[2,0]:='Klasa';
  cells[3,0]:='Nr legitymacji';
  cells[4,0]:='IloúÊ wypoøyczonych';
  cells[0,1]:='';
  cells[1,1]:='';
  cells[2,1]:='';
  cells[3,1]:='';
  cells[4,1]:='';
  end;
  if cur<>nil then
  begin
while (cur<>nil) do
  begin
  uczen.imie:=cur^.imie;
  uczen.nazwisko:=cur^.nazwisko;
  uczen.klasa:=cur^.klasa;
  uczen.nrlegitymacji:=cur^.nrlegitymacji;
  uczen.iloscwypozyczonych:=cur^.iloscwypozyczonych;
  cur:=cur^.wsk;
  with StringGrid1 do
  begin
  cells[0,nrwiersza]:=uczen.imie;
  cells[1,nrwiersza]:=uczen.nazwisko;
  cells[2,nrwiersza]:=uczen.klasa;
  cells[3,nrwiersza]:=inttostr(uczen.nrlegitymacji);
  cells[4,nrwiersza]:=inttostr(uczen.iloscwypozyczonych);
  end;
  inc(nrwiersza);
end;
  end;



end;


function PosExBack(aSubStr, aStr: String; aOffset: Integer): Integer;
var Res: Integer;
begin
  Result := 0;
  Res := 0;
  aStr := Copy(aStr, 1, aOffset);
  repeat
    Res := PosEx(aSubStr, aStr, Res + 1);
    if Res > 0 then Result := Res;
  until Res = 0;
end;

procedure TDodajForm_ks.Bt1Click(Sender: TObject);
var ksiazka_old,ksiazka_new:ksiazkarec;cur:plist2;
begin
cur:=first2;
ksiazka.tytul:=Ed1.Text;
ksiazka.autor:=Ed2.Text;
ksiazka.nrkatalogowy:=Ed3.Text;
ksiazka.wypozyczona:=false;
if (Ed1.Text='') or (Ed2.Text='') or  (Ed3.Text='') then
begin
MessageBox(Handle,'Uwaga! Naleøy podaÊ wszystkie dane identyfikacyjne ksiπøki','B≥πd wprowadzenia danych nowej ksiπøki',MB_OK+MB_ICONWARNING);
exit;
end;
if cur<>nil then
begin
while (cur^.nrkatalogowy<>ksiazka.nrkatalogowy) and (cur^.wsk<>nil) do cur:=cur^.wsk;
if (cur^.nrkatalogowy=ksiazka.nrkatalogowy) then
begin
MessageBox(Handle,'Uwaga! Wystπpi≥a prÛba wprowadzenia ksiπøki, ktÛrej dane prawdopodobnie sπ juø w programie.'#13#10'Podaj inny numer katalogowy.','B≥πd wprowadzenia danych nowej ksiπøki',MB_OK+MB_ICONWARNING);
exit;
end;
end;
insertNodeks(ksiazka,first2);
inc(liczba_wierszy_ksiazka);
Form1.aktualizacja_stg_ks();
aktualizacja_stat();
DodajForm_ks.Close;

end;

procedure TDodajForm_ks.Ed1KeyPress(Sender: TObject; var Key: Char);
var x:integer;a:string;
begin
x:=length(ed1.text);
a:=ed1.text;
if x=0 then key:=UpCase(key);
end;


procedure TDodajForm_ks.Ed2KeyPress(Sender: TObject; var Key: Char);
begin
maska(DodajForm_ks.Ed2,key);
end;


procedure TForm1.Button10Click(Sender: TObject);
var Bt1:TButton;
Ed1:TEdit;Ed2:TEdit;Ed3:TEdit;Ed4:TEdit;
Lb1:TLabel;Lb2:TLabel;Lb3:TLabel;Lb4:TLabel;
begin
DodajForm_ks := TDodajForm_ks.CreateNew(nil);
    DodajForm_ks.Width:=503;
    DodajForm_ks.Height:=180;
    DodajForm_ks.Top:=320;
    DodajForm_ks.left:=320;
    DodajForm_ks.Caption:='Dodanie nowej ksiπøki';
Ed1:=TEdit.Create(DodajForm_ks);
  	Ed1.Left:=76;
  	Ed1.Top:=24;
    Ed1.Name:='Ed1';
    Ed1.Width:=140;
    Ed1.Height:=40;
    ed1.MaxLength:=50;
    ed1.OnKeyPress:=DodajForm_ks.ed1keypress;
    Ed1.Text:='';
    Ed1.Parent:=DodajForm_ks;
    Ed1.Visible:=True;
Lb1:=TLabel.Create(DodajForm_ks);
    Lb1.Left:=38;
	  Lb1.Top:=26;
    Lb1.Width:=140;
    Lb1.Height:=40;
    Lb1.Caption:='Tytu≥:';
    Lb1.Font.Style:=[fsBold];
    Lb1.Parent:=DodajForm_ks;
    Lb1.Visible:=True;
Ed2:=TEdit.Create(DodajForm_ks);
  	Ed2.Left:=76;
  	Ed2.Top:=51;
    Ed2.Name:='Ed2';
    Ed2.Width:=140;
    Ed2.Height:=40;
    ed2.MaxLength:=60;
    Ed2.Text:='';
    Ed2.Parent:=DodajForm_ks;
    Ed2.Visible:=True;
    Ed2.Onkeypress:=DodajForm_ks.ed2keypress;
Lb2:=TLabel.Create(DodajForm_ks);
    Lb2.Left:=36;
	  Lb2.Top:=54;
    Lb2.Width:=140;
    Lb2.Height:=40;
    Lb2.Caption:='Autor:';
    Lb2.Font.Style:=[fsBold];
    Lb2.Parent:=DodajForm_ks;
    Lb2.Visible:=True;
Ed3:=TEdit.Create(DodajForm_ks);
  	Ed3.Left:=326;
  	Ed3.Top:=24;
    Ed3.Name:='Ed3';
    Ed3.Width:=140;
    Ed3.MaxLength:=10;
    Ed3.Height:=40;
    Ed3.Text:='';
    Ed3.NumbersOnly:=true;
    Ed3.Parent:=DodajForm_ks;
    Ed3.Visible:=True;
Lb3:=TLabel.Create(DodajForm_ks);
    Lb3.Left:=236;
	  Lb3.Top:=26;
    Lb3.Width:=140;
    Lb3.Height:=40;
    Lb3.Caption:='Nr katalogowy:';
    Lb3.Font.Style:=[fsBold];
    Lb3.Parent:=DodajForm_ks;
    Lb3.Visible:=True;
Bt1:=TButton.Create(self);
    Bt1.Left:=16; // pozycja X Bt1u na formularzu
    Bt1.Top:=91; // pozycja Y Bt1u na formularzu
    Bt1.Width:=455; // szerokoúÊ Bt1u
    Bt1.Height:=30; // wysokoúÊ Bt1u
    Bt1.Caption:='Dodaj ksiπøkÍ'; // podpis Bt1u
    Bt1.Parent:=DodajForm_ks; // rodzic Bt1u
    Bt1.Visible:=True; // czy Bt1 widoczny?
    Bt1.OnClick:=DodajForm_ks.Bt1Click;
//Zaglπdamy do listy

try
  DodajForm_ks.ShowModal;
finally
  DodajForm_ks.Free;

end;
end;


procedure TDodajForm.Bt1Click(Sender: TObject);
var  uczen:czytelnikrec;j:integer;cur:plist;
begin 

if (Ed1.Text='') or (Ed2.Text='') or  (Ed3.Text='') then
begin
MessageBox(Handle,'Uwaga! Naleøy podaÊ wszystkie dane identyfikacyjne czytelnika.','B≥πd wprowadzenia danych nowego czytelnika',MB_OK+MB_ICONWARNING);
exit;
end;
cur:=first;
uczen.imie:=Ed1.Text;
uczen.nazwisko:=Ed2.Text;
uczen.klasa:=Ed3.Text;
uczen.zdjecie:='';
uczen.nrlegitymacji:=strtoint(Ed4.Text);
uczen.iloscwypozyczonych:=0;
for j := 0 to 30 do
begin
uczen.wypozyczone[j].tytul:='';
uczen.wypozyczone[j].autor:='';
uczen.wypozyczone[j].nrkatalogowy:='';
end;
if cur<>nil then
begin
while (cur^.nrlegitymacji<>uczen.nrlegitymacji) and (cur^.wsk<>nil) do cur:=cur^.wsk;
if cur^.nrlegitymacji=uczen.nrlegitymacji then
begin
MessageBox(Handle,'Uwaga! Wystπpi≥a prÛba wprowadzenia czytelnika, ktÛrego dane prawdopodobnie sπ juø w programie.'#13#10'Podaj inny numer legitymacji.','B≥πd wprowadzenia danych nowego czytelnika',MB_OK+MB_ICONWARNING);
exit;
end;
end;
insertNodeczyt(uczen,first);
inc(liczba_wierszy_uczen);
Form1.aktualizacja_stg_czyt();
aktualizacja_stat();

DodajForm.Close;
end;

procedure TDodajForm.Ed1KeyPress(Sender: TObject; var Key: Char);
begin
maska_imie(DodajForm.Ed1,key);
end;

procedure TDodajForm.Ed2KeyPress(Sender: TObject; var Key: Char);
begin
maska(DodajForm.Ed2,key);
end;

procedure TForm1.Button11Click(Sender: TObject);
var Bt1:TButton;
Ed1:TEdit;Ed2:TEdit;Ed3:TComboBox;Ed4:TEdit;
Lb1:TLabel;Lb2:TLabel;Lb3:TLabel;Lb4:TLabel;
i:integer;
begin
DodajForm := TDodajForm.CreateNew(nil);
    DodajForm.Width:=510;
    DodajForm.Height:=180;
    DodajForm.Caption:='Edycja danych czytelnika';
    Dodajform.Left:=(Screen.Width-Width)  div 2;
    Dodajform.Top:=(Screen.Height-Height) div 2;
Ed1:=TEdit.Create(DodajForm);
  	Ed1.Left:=86;
  	Ed1.Top:=24;
    Ed1.Name:='Ed1';
    Ed1.Width:=140;
    Ed1.Height:=40;
    Ed1.Text:='';
    Ed1.MaxLength:=20;
    Ed1.Parent:=DodajForm;
    Ed1.OnKeyPress:=DodajForm.ed1keypress;
    Ed1.Visible:=True;
Lb1:=TLabel.Create(DodajForm);
    Lb1.Left:=52;
	  Lb1.Top:=26;
    Lb1.Width:=140;
    Lb1.Height:=40;
    Lb1.Caption:='ImiÍ:';
    Lb1.Font.Style:=[fsBold];
    Lb1.Parent:=DodajForm;
    Lb1.Visible:=True;
Ed2:=TEdit.Create(DodajForm);
  	Ed2.Left:=86;
  	Ed2.Top:=51;
    Ed2.Name:='Ed2';
    Ed2.Width:=140;
    Ed2.Height:=40;
    Ed2.MaxLength:=30;
    Ed2.Text:='';
    Ed2.Parent:=DodajForm;
    Ed2.OnKeyPress:=DodajForm.ed2keypress;
    Ed2.Visible:=True;
Lb2:=TLabel.Create(DodajForm);
    Lb2.Left:=26;
	  Lb2.Top:=54;
    Lb2.Width:=140;
    Lb2.Height:=40;
    Lb2.Caption:='Nazwisko:';
    Lb2.Font.Style:=[fsBold];
    Lb2.Parent:=DodajForm;
    Lb2.Visible:=True;
Ed3:=TComboBox.Create(DodajForm);
  	Ed3.Left:=337;
  	Ed3.Top:=24;
    Ed3.Name:='Ed3';
    ed3.MaxLength:=10;
    Ed3.Width:=140;
    Ed3.Height:=40;
    Ed3.Parent:=DodajForm;
    Ed3.Visible:=True;
    for i := 0 to lklas-1 do
    Ed3.Items.Add(klasy[i]);
    ed3.ItemIndex:=0;
    Ed3.style:=csOwnerDrawVariable;
    Ed3.Text:='';
Lb3:=TLabel.Create(DodajForm);
    Lb3.Left:=299;
	  Lb3.Top:=26;
    Lb3.Width:=140;
    Lb3.Height:=40;
    Lb3.Caption:='Klasa:';
    Lb3.Font.Style:=[fsBold];
    Lb3.Parent:=DodajForm;
    Lb3.Visible:=True;
Ed4:=TEdit.Create(DodajForm);
  	Ed4.Left:=337;
  	Ed4.Top:=51;
    Ed4.Name:='Ed4';
    Ed4.Width:=140;
    ed4.NumbersOnly:=true;
    Ed4.MaxLength:=8;
    Ed4.Height:=40;
    Ed4.Text:='';
    Ed4.Parent:=DodajForm;
    Ed4.Visible:=True;
Lb4:=TLabel.Create(DodajForm);
    Lb4.Left:=252;
	  Lb4.Top:=54;
    Lb4.Width:=140;
    Lb4.Height:=40;
    Lb4.Caption:='Nr legitymacji:';
    Lb4.Font.Style:=[fsBold];
    Lb4.Parent:=DodajForm;
    Lb4.Visible:=True;
Bt1:=TButton.Create(self);
    Bt1.Left:=16; // pozycja X Bt1u na formularzu
    Bt1.Top:=91; // pozycja Y Bt1u na formularzu
    Bt1.Width:=462; // szerokoúÊ Bt1u
    Bt1.Default:=true;
    Bt1.Height:=30; // wysokoúÊ Bt1u
    Bt1.Caption:='Zapisz dane czytelnika'; // podpis Bt1u
    Bt1.Parent:=DodajForm; // rodzic Bt1u
    Bt1.Visible:=True; // czy Bt1 widoczny?
    Bt1.OnClick:=DodajForm.Bt1Click;
//Zaglπdamy do listy

try
  DodajForm.ShowModal;
finally
  DodajForm.Free;

end;

end;


procedure TOpcjeForm.Bt1Click(Sender: TObject);
var i,wiersz:integer;
begin
for i := 1 to stg.RowCount do
if ansicomparestr(stg.Cells[0,i],ed1.Text)=0 then break;
    if ansicomparestr(stg.Cells[0,i],ed1.Text)<>0 then
    begin
    klasy[lklas]:=ed1.Text;
    stg.RowCount:=lklas+2;
    stg.Cells[0,lklas+1]:=klasy[lklas];
    inc(lklas);
    end
else MessageBox(Handle,'Ta klasa juø istnieje.','B≥πd dodania klasy',MB_OK+MB_ICONWARNING);
for i := 0 to lklas-1 do
form1.combobox2.Items.Add(klasy[i]);
end;

procedure TOpcjeForm.Bt2Click(Sender: TObject);
var
i,j: Integer;
begin
      for i := 0 to 29 do
        begin
            if (stg.Cells[0,stg.Row]=klasy[i]) then
                break;
        end;

    for j := i to 29 do
    klasy[j]:=klasy[j+1];
    dec(lklas);
    stg.RowCount:=lklas+1;
    for i := 1 to lklas do
  stg.Cells[0,i]:=klasy[i-1];
end;
procedure TOpcjeForm.Bt3Click(Sender: TObject);
begin
OpcjeForm.Close;
end;
procedure TForm1.Button12Click(Sender: TObject);
var Bt1,Bt2,Bt3:TButton;i,wiersz:integer;
Ed1:TEdit;Ed2:TEdit;Ed3:TComboBox;Ed4:TEdit;stg:tstringgrid;
Lb1:TLabel;Lb2:TLabel;Lb3:TLabel;Lb4:TLabel;

begin
OpcjeForm := TOpcjeForm.CreateNew(nil);
    OpcjeForm.Width:=390;
    OpcjeForm.Height:=430;
    OpcjeForm.Caption:='Opcje klas czytelnikÛw';
    OpcjeForm.Left:=(Screen.Width-Width)  div 2;
    OpcjeForm.Top:=(Screen.Height-Height) div 2;
Ed1:=TEdit.Create(OpcjeForm);
  	Ed1.Left:=20;
  	Ed1.Top:=65;
    Ed1.Name:='Ed1';
    Ed1.Width:=140;
    Ed1.Height:=40;
    Ed1.Text:='';
    Ed1.Parent:=OpcjeForm;
    Ed1.Visible:=True;
Lb1:=TLabel.Create(OpcjeForm);
    Lb1.Left:=20;
	  Lb1.Top:=45;
    Lb1.Width:=140;
    Lb1.Height:=40;
    Lb1.Caption:='Klasa:';
    Lb1.Font.Style:=[fsBold];
    Lb1.Parent:=OpcjeForm;
    Lb1.Visible:=True;
stg:=Tstringgrid.Create(OpcjeForm);
    Stg.Left:=190;
	  Stg.Top:=35;
    Stg.Width:=160;
    Stg.Height:=290;
    Stg.Name:='stg';
    Stg.ScrollBars:=ssvertical;
    Stg.FixedCols:=0;
    Stg.ColWidths[0]:=160;
    Stg.FixedRows:=1;
    Stg.ColCount:=1;
    Stg.RowCount:=2;
    Stg.Cells[0,0]:='Klasa';
    stg.Visible:=True;
    stg.Parent:=OpcjeForm;

Bt1:=TButton.Create(self);
    Bt1.Left:=20;
    Bt1.Top:=105;
    Bt1.Width:=140;
    Bt1.Name:='Bt1';
    Bt1.Height:=25;
    Bt1.Caption:='Dodaj nowπ klasÍ';
    Bt1.Parent:=OpcjeForm;
    Bt1.Visible:=True;
    Bt1.OnClick:=OpcjeForm.Bt1Click;
Bt2:=TButton.Create(self);
    Bt2.Left:=20;
    Bt2.Top:=150;
    Bt2.Width:=140;
    Bt1.Name:='Bt2';
    //Bt2.Default:=true;
    Bt2.Height:=25;
    Bt2.Caption:='UsuÒ klasÍ';
    Bt2.Parent:=OpcjeForm;
    Bt2.Visible:=True;
    Bt2.OnClick:=OpcjeForm.Bt2Click;
Bt3:=TButton.Create(self);
    Bt3.Left:=20;
    Bt3.Top:=195;
    Bt3.Width:=140;
    Bt1.Name:='Bt3';
    //Bt3.Default:=true;
    Bt3.Height:=25;
    Bt3.Caption:='Zamknij';
    Bt3.Parent:=OpcjeForm;
    Bt3.Visible:=True;
    Bt3.OnClick:=OpcjeForm.Bt3Click;
//Zaglπdamy do listy
  stg.RowCount:=lklas+1;
  for i := 1 to lklas do
  stg.Cells[0,i]:=klasy[i-1];
try
  OpcjeForm.ShowModal;
finally
  OpcjeForm.Free;

end;
end;


procedure TForm1.Button1Click(Sender: TObject);
var a,b,c,d,imie,nazwisko,klasa,nrleg:string;
alen,blen,clen,dlen,i,i_akt,licznik:integer;
begin
edit5.Text:=edit1.Text;
aktualizacja_stg_czyt();
a:=Edit1.Text;
alen:=length(a);
b:=Edit2.Text;
blen:=length(b);
c:=combobox2.Items[combobox2.itemindex];
clen:=length(c);
d:=edit16.Text;
dlen:=length(d);
licznik:=stringgrid1.RowCount;
i_akt:=1;
//imie:=stringgrid1.Cells[0,1];
//if PosExBack(a,imie,alen)>0 then stringgrid1.Rows[1]:=stringgrid1.Rows[2];
  if (a<>'') or (b<>'') or (c<>'') or (d<>'') then
  begin
  for i:=1 to licznik-1 do
    begin
    imie:=stringgrid1.Cells[0,i];
    nazwisko:=stringgrid1.Cells[1,i];
    klasa:=stringgrid1.Cells[2,i];
    nrleg:=stringgrid1.cells[3,i];

if ((a='') and (b='') and (c='') and (PosExBack(d,nrleg,dlen)>0)) or ((a='') and (b='') and (PosExBack(c,klasa,clen)>0) and (d=''))
or ((a='') and (b='') and (PosExBack(c,klasa,clen)>0) and (PosExBack(d,nrleg,dlen)>0)) or ((a='') and (PosExBack(b,nazwisko,blen)>0) and (c='') and (d=''))
or ((a='') and (PosExBack(b,nazwisko,blen)>0) and (c='') and (PosExBack(d,nrleg,dlen)>0)) or ((a='') and (PosExBack(b,nazwisko,blen)>0) and (PosExBack(c,klasa,clen)>0) and (d=''))
or ((a='') and (PosExBack(b,nazwisko,blen)>0) and (PosExBack(c,klasa,clen)>0) and (PosExBack(d,nrleg,dlen)>0)) or ((PosExBack(a,imie,alen)>0) and (b='') and (c='') and (d=''))
or ((PosExBack(a,imie,alen)>0) and (b='') and (c='') and (PosExBack(d,nrleg,dlen)>0)) or ((PosExBack(a,imie,alen)>0) and (b='') and (PosExBack(c,klasa,clen)>0) and (d=''))
or ((PosExBack(a,imie,alen)>0) and (b='') and (PosExBack(c,klasa,clen)>0) and (PosExBack(d,nrleg,dlen)>0)) or ((PosExBack(a,imie,alen)>0) and (PosExBack(b,nazwisko,blen)>0) and (c='') and (d=''))
or ((PosExBack(a,imie,alen)>0) and (PosExBack(b,nazwisko,blen)>0) and (c='') and (PosExBack(d,nrleg,dlen)>0)) or ((PosExBack(a,imie,alen)>0) and (PosExBack(b,nazwisko,blen)>0) and (PosExBack(c,klasa,clen)>0) and (d=''))
or ((PosExBack(a,imie,alen)>0) and (PosExBack(b,nazwisko,blen)>0) and (PosExBack(c,klasa,clen)>0) and (PosExBack(d,nrleg,dlen)>0))
      then
        begin
        stringgrid1.Rows[i_akt]:=stringgrid1.Rows[i];
        inc(i_akt);

        end
      else
        begin
        dec(licznik);
        end;
    end;
  stringgrid1.RowCount:=licznik;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var uczen:czytelnikrec;cur:plist;i,j:integer;a,b:shortstring;cur2:plist2;
begin
cur:=first;
cur2:=first2;
i:=0;
while (cur^.imie<>StringGrid1.cells[0,StringGrid1.Row]) or (cur^.nazwisko<>StringGrid1.cells[1,StringGrid1.Row]) or (cur^.klasa<>StringGrid1.cells[2,StringGrid1.Row]) or (cur^.nrlegitymacji<>strtoint(StringGrid1.cells[3,StringGrid1.Row])) do cur:=cur^.wsk;
while (cur^.wypozyczone[i].tytul<>StringGrid2.cells[0,StringGrid2.Row]) or (cur^.wypozyczone[i].autor<>StringGrid2.cells[1,StringGrid2.Row]) or (cur^.wypozyczone[i].nrkatalogowy<>StringGrid2.cells[2,StringGrid2.Row]) do inc(i);
while (cur2^.tytul<>cur^.wypozyczone[i].tytul) or (cur2^.autor<>cur^.wypozyczone[i].autor) or (cur2^.nrkatalogowy<>cur^.wypozyczone[i].nrkatalogowy)do cur2:=cur2^.wsk;
cur2^.wypozyczona:=false;
if i<cur^.iloscwypozyczonych then
begin
for j := i to cur^.iloscwypozyczonych do
begin
cur^.wypozyczone[j].tytul:=cur^.wypozyczone[j+1].tytul;
cur^.wypozyczone[j].autor:=cur^.wypozyczone[j+1].autor;
cur^.wypozyczone[j].nrkatalogowy:=cur^.wypozyczone[j+1].nrkatalogowy;
end;
end;
dec(cur^.iloscwypozyczonych);
aktualizacja_stg_czyt();
aktualizacja_stg_wyp();
aktualizacja_stg_ks();
aktualizacja_stat();
end;











procedure TForm1.Button3Click(Sender: TObject);
var cur:plist;uczen:czytelnikrec;
begin
if MessageBox(Handle,'Czy chcesz usunπÊ zdjÍcie tego czytelnika?','UsuniÍcie zdjÍcia czytelnika',MB_YESNO+MB_ICONWARNING)=idyes then
begin
  cur:=first;
  uczen.imie:=form1.Stringgrid1.Cells[0,form1.Stringgrid1.Row];
  uczen.nazwisko:=form1.Stringgrid1.Cells[1,form1.Stringgrid1.Row];
  uczen.klasa:=form1.Stringgrid1.Cells[2,form1.Stringgrid1.Row];
  uczen.nrlegitymacji:=strtoint(form1.Stringgrid1.Cells[3,form1.Stringgrid1.Row]);
  while (cur^.imie<>uczen.imie) or (cur^.nazwisko<>uczen.nazwisko) or (cur^.klasa<>uczen.klasa) or (cur^.nrlegitymacji<>uczen.nrlegitymacji) do  cur:=cur^.wsk;
  uczen.zdjecie:=cur^.zdjecie;
  usun_zdjecie(uczen,first);
  akt_zdjecie;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
 var a,b,c,tytul,autor,nrkat:string;
alen,blen,clen,i,i_akt,licznik:integer;
begin
aktualizacja_stg_ks();
a:=Edit5.Text;
alen:=length(a);
b:=Edit7.Text;
blen:=length(b);
c:=edit8.Text;
clen:=length(c);
licznik:=stringgrid3.RowCount;
i_akt:=1;
  if (a<>'') or (b<>'') or (c<>'') then
  begin
  for i:=1 to licznik-1 do
    begin
    tytul:=stringgrid3.Cells[0,i];
    autor:=stringgrid3.Cells[1,i];
    nrkat:=stringgrid3.Cells[2,i];

if ((a='') and (b='') and (PosExBack(c,nrkat,clen)>0)) or ((a='') and (PosExBack(b,autor,blen)>0) and (c='')) or ((a='') and (PosExBack(b,autor,blen)>0) and (PosExBack(c,nrkat,clen)>0))
or  ((PosExBack(a,tytul,alen)>0) and (b='') and (c='')) or  ((PosExBack(a,tytul,alen)>0) and (b='') and (PosExBack(c,nrkat,clen)>0)) or  ((PosExBack(a,tytul,alen)>0) and (PosExBack(b,autor,blen)>0) and (c=''))
or ((PosExBack(a,tytul,alen)>0) and (PosExBack(b,autor,blen)>0) and (PosExBack(c,nrkat,clen)>0))
    then
        begin
        stringgrid3.Rows[i_akt]:=stringgrid3.Rows[i];
        inc(i_akt);

        end
      else
        begin
        dec(licznik);
        end;
    end;
  stringgrid3.RowCount:=licznik;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
var uczen:czytelnikrec;cur:plist;cur2:plist2;myrect:tgridrect;
begin
if ((Edit12.Text='ImiÍ') or (Edit12.Text='')) and ((Edit9.Text='Tytu≥') or (Edit9.Text=''))  then
begin
MessageBox(Handle,'Uwaga! Nie zaznaczono czytelnika ani ksiπøki.','B≥πd wypoøyczenia',MB_OK+MB_ICONWARNING);
exit;
end;
if (Edit12.Text='ImiÍ') or (Edit12.Text='')  then
begin
MessageBox(Handle,'Uwaga! Nie zaznaczono czytelnika.','B≥πd wypoøyczenia',MB_OK+MB_ICONWARNING);
exit;
end;
if (Edit9.Text='Tytu≥') or (Edit9.Text='') then
begin
MessageBox(Handle,'Uwaga! Nie zaznaczono ksiπøki.','B≥πd wypoøyczenia',MB_OK+MB_ICONWARNING);
exit;
end;
begin
cur:=first;
cur2:=first2;
while (cur^.imie<>edit12.text) or (cur^.nazwisko<>edit13.text) or (cur^.klasa<>edit14.text) or (cur^.nrlegitymacji<>strtoint(edit15.text))do cur:=cur^.wsk;
while (cur2^.tytul<>edit9.text) or (cur2^.autor<>edit10.text) or (cur2^.nrkatalogowy<>edit11.text)do cur2:=cur2^.wsk;
if cur^.iloscwypozyczonych<>29 then
begin
if cur2^.wypozyczona<>true then
begin
cur^.wypozyczone[cur^.iloscwypozyczonych].tytul:=edit9.text;
cur^.wypozyczone[cur^.iloscwypozyczonych].autor:=edit10.text;
cur^.wypozyczone[cur^.iloscwypozyczonych].nrkatalogowy:=edit11.text;
cur2^.wypozyczona:=true;
//stringgrid3.options:=stringgrid3.options-[gorowselect];
inc(cur^.iloscwypozyczonych);
aktualizacja_stg_czyt();
aktualizacja_stg_wyp();
aktualizacja_stg_ks();
aktualizacja_stat();
Edit9.Text:='Tytu≥';
Edit10.Text:='Autor';
Edit11.Text:='Nr katalogowy';
end
else
MessageBox(Handle,'Uwaga! Ta ksiπøka zosta≥a juø wypoøyczona.','B≥πd wypoøyczenia',MB_OK+MB_ICONWARNING);
end
else
MessageBox(Handle,'Uwaga! Czytelnik osiπgnπ≥ limit wypoøyczeÒ, nie moøe wypoøyczaÊ ksiπøek.','B≥πd wypoøyczenia',MB_OK+MB_ICONWARNING);
end;
end;


procedure TForm1.Button6Click(Sender: TObject);
var msg:integer;
begin
msg:=MessageBox(Handle,'Czy chcesz usunπÊ tego czytelnika?','UsuniÍcie czytelnika',MB_YESNO+MB_ICONWARNING);
if msg=idyes then
begin
if strtoint(Stringgrid1.Cells[4,Stringgrid1.Row])=0 then
begin
uczen.imie:=Stringgrid1.Cells[0,Stringgrid1.Row];
uczen.nazwisko:=Stringgrid1.Cells[1,Stringgrid1.Row];
uczen.klasa:=Stringgrid1.Cells[2,Stringgrid1.Row];
uczen.nrlegitymacji:=strtoint(Stringgrid1.Cells[3,Stringgrid1.Row]);
usunczyt(uczen,first);
dec(liczba_wierszy_uczen);
aktualizacja_stg_czyt();
aktualizacja_stg_wyp();
aktualizacja_stat();
end
else
MessageBox(Handle,'Uwaga! Czytelnik nie zwrÛci≥ wszystkich ksiπøek. Jego usuniÍcie jest niemoøliwe.','B≥πd usuwania czytelnika',MB_OK+MB_ICONWARNING);
end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var cur:plist;cur2:plist2;i,j,msg:integer;
begin
msg:=MessageBox(Handle,'Czy chcesz usunπÊ tπ ksiπøkÍ?','UsuniÍcie ksiπøki',MB_YESNO+MB_ICONWARNING);
if msg=idyes then
begin
ksiazka.tytul:=Stringgrid3.Cells[0,Stringgrid3.Row];
ksiazka.autor:=Stringgrid3.Cells[1,Stringgrid3.Row];
ksiazka.nrkatalogowy:=Stringgrid3.Cells[2,Stringgrid3.Row];
cur:=first;
if Stringgrid3.Cells[3,Stringgrid3.Row]<>'YES' then
  begin
  j:=0;
  while (cur^.wsk<>nil) do
    begin
    while (cur^.wypozyczone[i].tytul<>stringgrid3.Cells[0,stringgrid3.Row]) or (cur^.wypozyczone[i].autor<>stringgrid3.Cells[1,stringgrid3.Row]) or (cur^.wypozyczone[i].nrkatalogowy<>stringgrid3.Cells[2,stringgrid3.Row]) do
      begin
      inc(i);
      if i>=(cur^.iloscwypozyczonych) then break;
      //showmessage(inttostr(i));
      //showmessage('il: '+inttostr(cur^.iloscwypozyczonych));
      end;
    if (cur^.wypozyczone[i].tytul=stringgrid3.Cells[0,stringgrid3.Row]) and (cur^.wypozyczone[i].autor=stringgrid3.Cells[1,stringgrid3.Row]) and (cur^.wypozyczone[i].nrkatalogowy=stringgrid3.Cells[2,stringgrid3.Row]) then
    break;
    cur:=cur^.wsk;
    i:=0;
    end;
  while (cur^.wypozyczone[i].tytul<>stringgrid3.Cells[0,stringgrid3.Row]) or (cur^.wypozyczone[i].autor<>stringgrid3.Cells[1,stringgrid3.Row]) or (cur^.wypozyczone[i].nrkatalogowy<>stringgrid3.Cells[2,stringgrid3.Row]) do
  inc(i);

  if i<cur^.iloscwypozyczonych then
    begin
      for j := i to cur^.iloscwypozyczonych do
      begin
      cur^.wypozyczone[j].tytul:=cur^.wypozyczone[j+1].tytul;
      cur^.wypozyczone[j].autor:=cur^.wypozyczone[j+1].autor;
      cur^.wypozyczone[j].nrkatalogowy:=cur^.wypozyczone[j+1].nrkatalogowy;
      end;
    end;
  dec(cur^.iloscwypozyczonych);
  end;
usunks(ksiazka,first2);
dec(liczba_wierszy_ksiazka);
aktualizacja_stg_ks();
aktualizacja_stg_wyp();
aktualizacja_stg_czyt();
aktualizacja_stat();
end;
end;

procedure TEdytujForm.Bt1Click(Sender: TObject);
var uczen_old,uczen_new:czytelnikrec;
begin
uczen_new.imie:=Ed1.Text;
uczen_new.nazwisko:=Ed2.Text;
uczen_new.klasa:=Ed3.Text;//Combobox1.Items[ComboBox1.ItemIndex];
uczen_new.nrlegitymacji:=strtoint(Ed4.Text);
uczen_old.imie:=Form1.StringGrid1.Cells[0,Form1.StringGrid1.Row];
uczen_old.nazwisko:=Form1.StringGrid1.Cells[1,Form1.StringGrid1.Row];
uczen_old.klasa:=Form1.StringGrid1.Cells[2,Form1.StringGrid1.Row];
uczen_old.nrlegitymacji:=strtoint(Form1.StringGrid1.Cells[3,Form1.StringGrid1.Row]);
edycjaczyt(uczen_old,uczen_new,first);
Form1.aktualizacja_stg_czyt();
EdytujForm.Close;
end;

procedure TEdytujForm.Ed1KeyPress(Sender: TObject; var Key: Char);
begin
maska_imie(EdytujForm.Ed1,key);
end;

procedure TEdytujForm.Ed2KeyPress(Sender: TObject; var Key: Char);
begin
maska(EdytujForm.Ed2,key);
end;


procedure TForm1.Button8Click(Sender: TObject);
var Bt1:TButton;
Ed1:TEdit;Ed2:TEdit;Ed3:TComboBox;Ed4:TEdit;
Lb1:TLabel;Lb2:TLabel;Lb3:TLabel;Lb4:TLabel;
i:integer;
begin
EdytujForm := TEdytujForm.CreateNew(nil);
    EdytujForm.Width:=510;
    EdytujForm.Height:=180;
    EdytujForm.Caption:='Edycja danych czytelnika';
    edytujform.Left:=(Screen.Width-Width)  div 2;
    edytujform.Top:=(Screen.Height-Height) div 2;
Ed1:=TEdit.Create(EdytujForm);
  	Ed1.Left:=86;
  	Ed1.Top:=24;
    Ed1.Name:='Ed1';
    Ed1.Width:=140;
    Ed1.Height:=40;
    ed1.MaxLength:=20;
    Ed1.Text:=StringGrid1.Cells[0,StringGrid1.Row];
    Ed1.Parent:=EdytujForm;
    Ed1.OnKeyPress:=EdytujForm.ed1keypress;
    Ed1.Visible:=True;
Lb1:=TLabel.Create(EdytujForm);
    Lb1.Left:=52;
	  Lb1.Top:=26;
    Lb1.Width:=140;
    Lb1.Height:=40;
    Lb1.Caption:='ImiÍ:';
    Lb1.Font.Style:=[fsBold];
    Lb1.Parent:=EdytujForm;
    Lb1.Visible:=True;
Ed2:=TEdit.Create(EdytujForm);
  	Ed2.Left:=86;
  	Ed2.Top:=51;
    Ed2.Name:='Ed2';
    Ed2.Width:=140;
    ed2.MaxLength:=30;
    Ed2.Height:=40;
    Ed2.Text:=StringGrid1.Cells[1,StringGrid1.Row];
    Ed2.Parent:=EdytujForm;
    ed2.OnKeyPress:=edytujform.Ed2KeyPress;
    Ed2.Visible:=True;
Lb2:=TLabel.Create(EdytujForm);
    Lb2.Left:=26;
	  Lb2.Top:=54;
    Lb2.Width:=140;
    Lb2.Height:=40;
    Lb2.Caption:='Nazwisko:';
    Lb2.Font.Style:=[fsBold];
    Lb2.Parent:=EdytujForm;
    Lb2.Visible:=True;
Ed3:=TComboBox.Create(EdytujForm);
  	Ed3.Left:=337;
  	Ed3.Top:=24;
    Ed3.Name:='Ed3';
    Ed3.Width:=140;
    Ed3.Height:=40;
    ed3.MaxLength:=10;
    Ed3.Parent:=EdytujForm;
    Ed3.Visible:=True;
    for i := 0 to lklas-1 do
    Ed3.Items.Add(klasy[i]);
    //Ed3.style:=csOwnerDrawVariable;
    ed3.ItemIndex:=0;
    Ed3.Text:=StringGrid1.Cells[2,StringGrid1.Row];
Lb3:=TLabel.Create(EdytujForm);
    Lb3.Left:=299;
	  Lb3.Top:=26;
    Lb3.Width:=140;
    Lb3.Height:=40;
    Lb3.Caption:='Klasa:';
    Lb3.Font.Style:=[fsBold];
    Lb3.Parent:=EdytujForm;
    Lb3.Visible:=True;
Ed4:=TEdit.Create(EdytujForm);
  	Ed4.Left:=337;
  	Ed4.Top:=51;
    Ed4.Name:='Ed4';
    Ed4.Width:=140;
    Ed4.MaxLength:=8;
    Ed4.Height:=40;
    ed4.NumbersOnly:=true;
    Ed4.Text:=StringGrid1.Cells[3,StringGrid1.Row];
    Ed4.Parent:=EdytujForm;
    Ed4.Visible:=True;
Lb4:=TLabel.Create(EdytujForm);
    Lb4.Left:=252;
	  Lb4.Top:=54;
    Lb4.Width:=140;
    Lb4.Height:=40;
    Lb4.Caption:='Nr legitymacji:';
    Lb4.Font.Style:=[fsBold];
    Lb4.Parent:=EdytujForm;
    Lb4.Visible:=True;
Bt1:=TButton.Create(self);
    Bt1.Left:=16; // pozycja X Bt1u na formularzu
    Bt1.Top:=91; // pozycja Y Bt1u na formularzu
    Bt1.Width:=462; // szerokoúÊ Bt1u
    Bt1.Default:=true;
    Bt1.Height:=30; // wysokoúÊ Bt1u
    Bt1.Caption:='Zapisz dane czytelnika'; // podpis Bt1u
    Bt1.Parent:=EdytujForm; // rodzic Bt1u
    Bt1.Visible:=True; // czy Bt1 widoczny?
    Bt1.OnClick:=EdytujForm.Bt1Click;
//Zaglπdamy do listy

try
  EdytujForm.ShowModal;
finally
  EdytujForm.Free;

end;
end;

procedure TEdytujForm_ks.Bt1Click(Sender: TObject);
var ksiazka_old,ksiazka_new:ksiazkarec;
begin
ksiazka_new.tytul:=Ed1.Text;
ksiazka_new.autor:=Ed2.Text;
ksiazka_new.nrkatalogowy:=Ed3.Text;
ksiazka_old.tytul:=Form1.StringGrid3.Cells[0,Form1.StringGrid3.Row];
ksiazka_old.autor:=Form1.StringGrid3.Cells[1,Form1.StringGrid3.Row];
ksiazka_old.nrkatalogowy:=Form1.StringGrid3.Cells[2,Form1.StringGrid3.Row];
edycjaks(ksiazka_old,ksiazka_new,first2);
Form1.aktualizacja_stg_ks();
EdytujForm_ks.Close;
end;

procedure TEdytujForm_ks.Ed1KeyPress(Sender: TObject; var Key: Char);
var x:integer;a:string;
begin
x:=length(ed1.text);
a:=ed1.text;
if x=0 then key:=UpCase(key);
end;

procedure TEdytujForm_ks.Ed2KeyPress(Sender: TObject; var Key: Char);
begin
maska(EdytujForm_ks.Ed2,key);
end;

procedure TForm1.Button9Click(Sender: TObject);
var Bt1:TButton;
Ed1:TEdit;Ed2:TEdit;Ed3:TEdit;Ed4:TEdit;
Lb1:TLabel;Lb2:TLabel;Lb3:TLabel;Lb4:TLabel;
begin
EdytujForm_ks := TEdytujForm_ks.CreateNew(nil);
    EdytujForm_ks.Width:=503;
    EdytujForm_ks.Height:=180;
    EdytujForm_ks.Top:=320;
    EdytujForm_ks.left:=320;
    EdytujForm_ks.Caption:='Edycja danych ksiπøki';
Ed1:=TEdit.Create(EdytujForm_ks);
  	Ed1.Left:=76;
  	Ed1.Top:=24;
    Ed1.Name:='Ed1';
    Ed1.Width:=140;
    Ed1.Height:=40;
    Ed1.MaxLength:=50;
    Ed1.Text:=StringGrid3.Cells[0,StringGrid3.Row];
    Ed1.OnKeyPress:=EdytujForm_ks.Ed1keypress;
    Ed1.Parent:=EdytujForm_ks;
    Ed1.Visible:=True;
Lb1:=TLabel.Create(EdytujForm_ks);
    Lb1.Left:=38;
	  Lb1.Top:=26;
    Lb1.Width:=140;
    Lb1.Height:=40;
    Lb1.Caption:='Tytu≥:';
    Lb1.Font.Style:=[fsBold];
    Lb1.Parent:=EdytujForm_ks;
    Lb1.Visible:=True;
Ed2:=TEdit.Create(EdytujForm_ks);
  	Ed2.Left:=76;
  	Ed2.Top:=51;
    Ed2.Name:='Ed2';
    Ed2.Width:=140;
    Ed2.Height:=40;
    ed2.MaxLength:=60;
    Ed2.Text:=StringGrid3.Cells[1,StringGrid3.Row];
    Ed2.Parent:=EdytujForm_ks;
    Ed2.OnKeyPress:=EdytujForm_ks.ed2keypress;
    Ed2.Visible:=True;
Lb2:=TLabel.Create(EdytujForm_ks);
    Lb2.Left:=36;
	  Lb2.Top:=54;
    Lb2.Width:=140;
    Lb2.Height:=40;
    Lb2.Caption:='Autor:';
    Lb2.Font.Style:=[fsBold];
    Lb2.Parent:=EdytujForm_ks;
    Lb2.Visible:=True;
Ed3:=TEdit.Create(EdytujForm_ks);
  	Ed3.Left:=326;
  	Ed3.Top:=24;
    Ed3.Name:='Ed3';
    Ed3.Width:=140;
    Ed3.MaxLength:=10;
    ed3.NumbersOnly:=true;
    Ed3.Height:=40;
    Ed3.Text:=StringGrid3.Cells[2,StringGrid3.Row];
    Ed3.Parent:=EdytujForm_ks;
    Ed3.Visible:=True;
Lb3:=TLabel.Create(EdytujForm_ks);
    Lb3.Left:=236;
	  Lb3.Top:=26;
    Lb3.Width:=140;
    Lb3.Height:=40;
    Lb3.Caption:='Nr katalogowy:';
    Lb3.Font.Style:=[fsBold];
    Lb3.Parent:=EdytujForm_ks;
    Lb3.Visible:=True;
Bt1:=TButton.Create(self);
    Bt1.Left:=16; // pozycja X Bt1u na formularzu
    Bt1.Top:=91; // pozycja Y Bt1u na formularzu
    Bt1.Width:=455; // szerokoúÊ Bt1u
    Bt1.Height:=30; // wysokoúÊ Bt1u
    Bt1.Caption:='Zapisz dane ksiπøki'; // podpis Bt1u
    Bt1.Parent:=EdytujForm_ks; // rodzic Bt1u
    Bt1.Visible:=True; // czy Bt1 widoczny?
    Bt1.OnClick:=EdytujForm_ks.Bt1Click;
//Zaglπdamy do listy

try
  EdytujForm_ks.ShowModal;
finally
  EdytujForm_ks.Free;

end;
end;





procedure TForm1.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
if (not(Key in[#08,#127,'-']))then Key := #0;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
maska_imie(edit1,key);
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
maska(edit2,key);
end;





procedure TForm1.Edit5KeyPress(Sender: TObject; var Key: Char);
var x:integer;a:string;
begin
x:=length(edit5.text);
a:=edit5.text;
if x=0 then key:=UpCase(key);
end;

procedure TForm1.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
maska(edit7,key);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var msg:integer;
begin
msg:=MessageBox(Handle,'Czy chcesz zapisaÊ zmiany?','Wyjúcie z programu',MB_YESNOCANCEL+MB_ICONWARNING);
if msg<>IDCANCEL then
begin
if msg=IDYES then
begin
zapis_listy_do_plikuczyt(first);
zapis_listy_do_plikuks(first2);
zapis_ust(klasy);
end;
end
else Action := canone;
end;



procedure TForm1.FormCreate(Sender: TObject);
var rows,kl,nrwiersza,nrwiersza_ks,i:integer;cur:plist;ksiazka:ksiazkarec;cur2:plist2;s,c:shortstring;
myrect:Tgridrect;

begin
lklas:=0;
odczyt_ust(klasy,kl);
lklas:=kl;
if lklas<>0 then
begin
for i := 0 to lklas-1 do combobox2.Items.Add(klasy[i]);
end;
//Centerowanie g≥Ûwnego okna
Left:=(Screen.Width-Width)  div 2;
Top:=(Screen.Height-Height) div 2;


odczyt_do_listyczyt(rows,first);
liczba_wierszy_uczen:=rows;

nrwiersza:=1;
    if liczba_wierszy_uczen<1 then
    begin
    StringGrid1.RowCount:=2;
    StringGrid1.Fixedrows:=1;
    end
    else
    begin
    StringGrid1.RowCount:=liczba_wierszy_uczen+1;
    StringGrid1.Fixedrows:=1;
    end;

 with StringGrid1 do
  begin
  cells[0,0]:='ImiÍ';
  cells[1,0]:='Nazwisko';
  cells[2,0]:='Klasa';
  cells[3,0]:='Nr legitymacji';
  cells[4,0]:='IloúÊ wypoøyczonych';
  cells[0,1]:='';
  cells[1,1]:='';
  cells[2,1]:='';
  cells[3,1]:='';
  cells[4,1]:='';
  end;
if cur<>nil then
begin
cur:=first;
while (cur<>nil) do
  begin
  uczen.imie:=cur^.imie;
  uczen.nazwisko:=cur^.nazwisko;
  uczen.klasa:=cur^.klasa;
  uczen.zdjecie:=cur^.zdjecie;
  uczen.nrlegitymacji:=cur^.nrlegitymacji;
  uczen.wypozyczone:=cur^.wypozyczone;
  uczen.iloscwypozyczonych:=cur^.iloscwypozyczonych;
  cur:=cur^.wsk;
  with StringGrid1 do
  begin
  cells[0,nrwiersza]:=uczen.imie;
  cells[1,nrwiersza]:=uczen.nazwisko;
  cells[2,nrwiersza]:=uczen.klasa;
  cells[3,nrwiersza]:=inttostr(uczen.nrlegitymacji);
  cells[4,nrwiersza]:=inttostr(uczen.iloscwypozyczonych);
  end;
  inc(nrwiersza);
  end;
end;

aktualizacja_stg_wyp;
akt_zdjecie;



odczyt_do_listyks(rows,first2);
liczba_wierszy_ksiazka:=rows;
cur2:=first2;
nrwiersza_ks:=1;
    if liczba_wierszy_ksiazka<1 then
    begin
    StringGrid3.RowCount:=2;
    StringGrid3.Fixedrows:=1;
    end
    else
    begin
    StringGrid3.RowCount:=liczba_wierszy_ksiazka+1;
    StringGrid3.Fixedrows:=1;
    end;
 with StringGrid3 do
  begin
  cells[0,0]:='Tytu≥';
  cells[1,0]:='Autor';
  cells[2,0]:='Nr katalogowy';
  cells[3,0]:='DostÍpna';
  cells[0,1]:='';
  cells[1,1]:='';
  cells[2,1]:='';
  end;
  if cur2<>nil then
  begin
    while (cur2<>nil) do
    begin
    ksiazka.tytul:=cur2^.tytul;
    ksiazka.autor:=cur2^.autor;
    ksiazka.nrkatalogowy:=cur2^.nrkatalogowy;
    ksiazka.wypozyczona:=cur2^.wypozyczona;
    cur2:=cur2^.wsk;
    with StringGrid3 do
      begin
      cells[0,nrwiersza_ks]:=ksiazka.tytul;
      cells[1,nrwiersza_ks]:=ksiazka.autor;
      cells[2,nrwiersza_ks]:=ksiazka.nrkatalogowy;
      if ksiazka.wypozyczona=false then cells[3,nrwiersza_ks]:='TAK'
      else cells[3,nrwiersza_ks]:='NIE';
      end;
    inc(nrwiersza_ks);
    end;
  end;
aktualizacja_stat();
savephoto1.FileName:='czytelnik'+'_'+stringgrid1.Cells[3,stringgrid1.Row];
end;




procedure Sortuj(A: TStringGrid;x,y:integer);

  procedure Zamien(Lo, Hi: Integer);
  var
    T: TStringList;
  begin
    T := TStringList.Create;
    T.Assign(A.Rows[Lo]);
    A.Rows[Lo].Assign(A.Rows[Hi]);
    A.Rows[Hi].Assign(T);
    T.Free;
  end;

  procedure QuickSort(iLo, iHi,x,y: Integer);
  var
    Lo, Hi: Integer;
    Mid: string;
  begin
    Lo := iLo;
    Hi := iHi;
    Mid := A.Cols[x][(Lo + Hi) div 2];
    repeat
    if y=1 then
    begin
      while ansicomparestr(A.Cols[x][Lo],Mid)>0 do Inc(Lo);
      while ansicomparestr(A.Cols[x][Hi],Mid)<0 do Dec(Hi);
    end
    else
    begin
      while ansicomparestr(A.Cols[x][Lo],Mid)<0 do Inc(Lo);
      while ansicomparestr(A.Cols[x][Hi],Mid)>0 do Dec(Hi);
    end;
      if Lo <= Hi then
      begin
        Zamien(Lo, Hi);
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then QuickSort(iLo, Hi,x,y);
    if Lo < iHi then QuickSort(Lo, iHi,x,y);
  end;

begin
  QuickSort(1, A.RowCount-1,x,y);
end;
procedure Sortuj2(A: TStringGrid;x,y:integer);

  procedure Zamien(Lo, Hi: Integer);
  var
    T: TStringList;
  begin
    T := TStringList.Create;
    T.Assign(A.Rows[Lo]);
    A.Rows[Lo].Assign(A.Rows[Hi]);
    A.Rows[Hi].Assign(T);
    T.Free;
  end;

  procedure QuickSort(iLo, iHi, x,y: Integer);
  var
    Lo, Hi: Integer;
    Mid: integer;
  begin
    Lo := iLo;
    Hi := iHi;
    Mid := strtoint(A.Cols[x][(Lo + Hi) div 2]);
    repeat
    if y=1 then
    begin
      while strtoint(A.Cols[x][Lo])<Mid do Inc(Lo);
      while strtoint(A.Cols[x][Hi])>Mid do Dec(Hi);
    end
    else
    begin
      while strtoint(A.Cols[x][Lo])>Mid do Inc(Lo);
      while strtoint(A.Cols[x][Hi])<Mid do Dec(Hi);
    end;
      if Lo <= Hi then
      begin
        Zamien(Lo, Hi);
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then QuickSort(iLo, Hi,x,y);
    if Lo < iHi then QuickSort(Lo, iHi,x,y);
  end;

begin
  QuickSort(1, A.RowCount-1,x,y);
end;










  procedure TForm1.RadioButton1Click(Sender: TObject);
begin
sortuj(Stringgrid1,1,1);
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
sortuj(Stringgrid1,2,1);
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
sortuj2(Stringgrid1,4,1);
end;

procedure TForm1.SavePhoto1Click(Sender: TObject);
var uczen_old,uczen_new:czytelnikrec;
begin
uczen_new.zdjecie:=SavePhoto1.SaveCatalog+'/'+'czytelnik_'+stringgrid1.Cells[3,stringgrid1.Row]+ExtractFileExt(SavePhoto1.FileAddress);
uczen_old.imie:=Form1.StringGrid1.Cells[0,Form1.StringGrid1.Row];
uczen_old.nazwisko:=Form1.StringGrid1.Cells[1,Form1.StringGrid1.Row];
uczen_old.klasa:=Form1.StringGrid1.Cells[2,Form1.StringGrid1.Row];
uczen_old.nrlegitymacji:=strtoint(Form1.StringGrid1.Cells[3,Form1.StringGrid1.Row]);
if ExtractFileExt(SavePhoto1.FileAddress)<>'' then
begin
edycja_zdjecie(uczen_old,uczen_new,first);
button3.Enabled:=true;
end;
end;

procedure TForm1.StringGrid1Click(Sender: TObject);

  begin
  edit12.Text:=stringgrid1.cells[0,stringgrid1.Row];
  edit13.Text:=stringgrid1.cells[1,stringgrid1.Row];
  edit14.Text:=stringgrid1.cells[2,stringgrid1.Row];
  edit15.Text:=stringgrid1.cells[3,stringgrid1.Row];
  aktualizacja_stg_wyp();
  akt_zdjecie();
  savephoto1.FileName:='czytelnik'+'_'+stringgrid1.Cells[3,stringgrid1.Row];
end;









procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 if (liczba_wierszy_uczen=0) or (stringgrid1.RowCount=1) then
 begin
 Button6.Enabled:=false;
 Button8.Enabled:=false;
 Button3.Enabled:=false;
 savephoto1.Enabled:=false
 end
 else
 begin
 Button6.Enabled:=true;
 Button8.Enabled:=true;
 Button3.Enabled:=true;
  savephoto1.Enabled:=true;
 end;
end;

procedure TForm1.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var cur:plist;
begin
cur:=first;
if (cur<>nil) then
begin
while (cur^.imie<>StringGrid1.cells[0,StringGrid1.Row]) or (cur^.nazwisko<>StringGrid1.cells[1,StringGrid1.Row]) or (cur^.klasa<>StringGrid1.cells[2,StringGrid1.Row]) or (cur^.nrlegitymacji<>strtoint(StringGrid1.cells[3,StringGrid1.Row])) do cur:=cur^.wsk;
 if cur^.iloscwypozyczonych=0 then
 begin
 Button2.Enabled:=false;
 end
 else
 begin
 Button2.Enabled:=true;
 end;
end
else Button2.Enabled:=false;
end;

procedure TForm1.StringGrid3Click(Sender: TObject);
  begin
  edit9.Text:=stringgrid3.cells[0,stringgrid3.Row];
  edit10.Text:=stringgrid3.cells[1,stringgrid3.Row];
  edit11.Text:=stringgrid3.cells[2,stringgrid3.Row];
end;















procedure TForm1.StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var cur2:plist2; myrect:tgridrect;i:integer;
begin
cur2:=first2;
if cur2<>nil then
begin
 while (cur2<>nil) do
     begin
     with StringGrid3 do
     with Rect do
     if ARow<>0 then
     begin
     begin
     canvas.Font.Color:=clwhite;
     if cells[3,ARow]='TAK' then
        begin

        Canvas.Brush.Color := rgb(47, 155, 31);
        Canvas.FillRect(Rect);
        Canvas.TextRect(Rect, Rect.Left+3, Rect.Top+3, StringGrid3.Cells[aCol, aRow]);
        Canvas.Textout(Left+4, Top +4, Cells[Acol, ARow]);

        end
     else
       begin
         Canvas.Brush.Color := rgb(206, 42, 42);
         Canvas.FillRect(Rect);
         Canvas.TextOut(Left+4, Top + 4, Cells[ACol, ARow]);
       end;
     end;
     end;
     cur2:=cur2^.wsk;

     end;
end;
 if (liczba_wierszy_ksiazka=0) or (stringgrid3.RowCount=1) then
 begin
 Button7.Enabled:=false;
 Button9.Enabled:=false;
 end
 else
 begin
 Button7.Enabled:=true;
 Button9.Enabled:=true;
 end;

end;




procedure TForm1.StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
//if stringgrid3.Cells[3,Arow]<>'YES' then canselect:=false;
end;



procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  sortuj(Stringgrid1,0,1);
  if Button = btPrev then
  sortuj(Stringgrid1,0,0);
end;

procedure TForm1.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  sortuj(Stringgrid1,1,1);
  if Button = btPrev then
  sortuj(Stringgrid1,1,0);
end;

procedure TForm1.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  sortuj2(Stringgrid1,3,1);
  if Button = btPrev then
  sortuj2(Stringgrid1,3,0);
end;

procedure TForm1.UpDown4Click(Sender: TObject; Button: TUDBtnType);
begin
if Button = btNext then
  sortuj(Stringgrid3,0,1);
if Button = btPrev then
  sortuj(Stringgrid3,0,0);
end;

procedure TForm1.UpDown5Click(Sender: TObject; Button: TUDBtnType);
begin
if Button = btNext then
  sortuj(Stringgrid3,1,1);
  if Button = btPrev then
  sortuj(Stringgrid3,1,0);
end;

procedure TForm1.UpDown6Click(Sender: TObject; Button: TUDBtnType);
begin
if Button = btNext then
  sortuj(Stringgrid3,2,1);
  if Button = btPrev then
  sortuj(Stringgrid3,2,0);
end;


end.
