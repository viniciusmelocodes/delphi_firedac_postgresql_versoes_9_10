{

/* Script */

-- Drop table

-- DROP TABLE public.table_teste

CREATE TABLE public.table_teste (
	id serial NOT NULL,
	descricao varchar(200) NULL,
	CONSTRAINT table_teste_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
) ;

-- Permissions

ALTER TABLE public.table_teste OWNER TO postgres;

}

unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.Intf, FireDAC.Phys.PGDef,
  FireDAC.DApt.Intf;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if FDConnection1.Connected then
  begin
    FDConnection1.Connected := False;
    Button1.Caption := 'Conectar';
  end
  else
  begin
    FDPhysPgDriverLink1.VendorHome := ExtractFilePath(Application.ExeName) + 'pgbin32\';
    FDPhysPgDriverLink1.VendorLib := 'libpq.dll';
    FDPhysPgDriverLink1.Release;

    FDConnection1.Params.Values['database'] := 'local';
    FDConnection1.Params.Values['user_name'] := 'postgres';
    FDConnection1.Params.Values['password'] := '123abc';
    FDConnection1.Params.Values['server'] := 'localhost';
    FDConnection1.Params.Values['port'] := '5432';

    FDConnection1.Connected := True;
    Button1.Caption := 'Desconectar';
  end;

  Button2.Enabled := FDConnection1.Connected = True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FDQuery1.Open('select * from table_teste');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDConnection1.Connected := False;
end;

end.

