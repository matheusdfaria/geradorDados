object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Gerador de Dados'
  ClientHeight = 550
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTabela: TLabel
    Left = 24
    Top = 24
    Width = 36
    Height = 13
    Caption = 'Tabela:'
  end
  object cmbboxTabelas: TComboBox
    Left = 66
    Top = 21
    Width = 215
    Height = 21
    TabOrder = 0
    OnSelect = cmbboxTabelasSelect
  end
  object dbgridColunasBD: TDBGrid
    Left = 24
    Top = 63
    Width = 281
    Height = 458
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object gpboxConBanco: TGroupBox
    Left = 318
    Top = 21
    Width = 201
    Height = 145
    Caption = 'Conex'#227'o com o Banco'
    TabOrder = 2
    object lblBanco: TLabel
      Left = 19
      Top = 28
      Width = 29
      Height = 13
      Caption = 'Banco'
    end
    object lblSenha: TLabel
      Left = 18
      Top = 82
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object lblUsuario: TLabel
      Left = 12
      Top = 55
      Width = 36
      Height = 16
      Caption = 'Usu'#225'rio'
    end
    object edtBanco: TEdit
      Left = 54
      Top = 25
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'd:\banco\sghdados.046'
    end
    object edtSenha: TEdit
      Left = 54
      Top = 52
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'masterkey'
    end
    object edtUsuario: TEdit
      Left = 54
      Top = 79
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'sysdba'
    end
    object btnConectar: TButton
      Left = 61
      Top = 106
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 3
      OnClick = btnConectarClick
    end
  end
  object gpboxDados: TGroupBox
    Left = 318
    Top = 184
    Width = 201
    Height = 185
    Caption = 'Tipos de dado'
    TabOrder = 3
    object RadioButton1: TRadioButton
      Left = 16
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Randomico'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 71
      Width = 113
      Height = 17
      Caption = 'De uma lista'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 16
      Top = 110
      Width = 113
      Height = 17
      Caption = 'De uma tabela'
      TabOrder = 2
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule2.conectaBanco
    Transaction = DataModule2.TRSConectaBanco
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 200
    Top = 416
  end
  object dtsource: TDataSource
    DataSet = IBQuery1
    Left = 232
    Top = 416
  end
  object IBQuery2: TIBQuery
    Database = DataModule2.conectaBanco
    Transaction = DataModule2.TRSConectaBanco
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 200
    Top = 472
  end
  object DataSource1: TDataSource
    DataSet = IBQuery2
    Left = 232
    Top = 472
  end
end
