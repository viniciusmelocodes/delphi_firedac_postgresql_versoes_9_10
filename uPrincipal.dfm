object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Principal'
  ClientHeight = 398
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 195
    Top = 11
    Width = 121
    Height = 41
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 64
    Width = 680
    Height = 334
    Align = alBottom
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 363
    Top = 18
    Width = 121
    Height = 25
    Caption = 'Abrir tabela'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=PG')
    LoginPrompt = False
    Left = 152
    Top = 88
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 176
    Top = 184
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 280
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 256
    Top = 192
  end
end
