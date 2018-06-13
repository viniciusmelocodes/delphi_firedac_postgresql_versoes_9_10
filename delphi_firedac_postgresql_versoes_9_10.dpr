program delphi_firedac_postgresql_versoes_9_10;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
