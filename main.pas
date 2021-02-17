unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.DBCtrls, Data.FMTBcd,
  Data.SqlExpr;

type
  TForm1 = class(TForm)
    lblTabela: TLabel;
    edtBanco: TEdit;
    edtSenha: TEdit;
    lblBanco: TLabel;
    lblSenha: TLabel;
    btnConectar: TButton;
    cmbboxTabelas: TComboBox;
    edtUsuario: TEdit;
    lblUsuario: TLabel;
    IBQuery1: TIBQuery;
    dtsource: TDataSource;
    dbgridColunasBD: TDBGrid;
    IBQuery2: TIBQuery;
    DataSource1: TDataSource;
    gpboxConBanco: TGroupBox;
    gpboxDados: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure btnConectarClick(Sender: TObject);
    procedure cmbboxTabelasSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

Uses UDM;

procedure TForm1.btnConectarClick(Sender: TObject);
  begin
    UDM.DataModule2.conectaBanco.DatabaseName := edtBanco.Text;
    UDM.DataModule2.conectaBanco.Params.Values['user_name'] := edtUsuario.Text;
    UDM.DataModule2.conectaBanco.Params.Values['password'] := edtSenha.Text;
    UDM.DataModule2.conectaBanco.LoginPrompt := False;
    UDM.DataModule2.conectaBanco.Connected := True;
    UDM.DataModule2.conectaBanco.TestConnected;
    UDM.DataModule2.TRSConectaBanco.Active := True;


    IBQuery1.SQL.Text :=  'select rdb$relation_name '+
                          'from rdb$relations ' +
                          'where substr(rdb$relation_name,1,3) not IN(''RDB'',''MON'',''SEC'')'+
                          'and substr(rdb$relation_name,1,2) <> ''V_'''+
                          'order by rdb$relation_name';
    IBQuery1.Open;
    IBQuery1.First;
    while not IBQuery1.Eof do
      begin
        cmbboxTabelas.Items.Add(IBQuery1.FieldByName('rdb$relation_name').AsString);
        IBQuery1.Next;
      end;
    IBQuery1.Close;
  end;

procedure TForm1.cmbboxTabelasSelect(Sender: TObject);
  begin
    IBQuery2.SQL.Add('select h.rdb$field_name coluna, '+
                      'case o.rdb$type_name '+
                      'when ''TEXT'' then ''CHAR'' '+
                      'when ''SHORT'' then ''NUMERIC'' '+
                      'when ''LONG'' then ''INTEGER'' '+
                      'when ''double'' then ''DOUBLE'' '+
                      'when ''VARYING'' then ''VARCHAR'' '+
                      'when ''INT64'' then ''NUMERIC'' '+
                      'else rdb$type_name '+
                    'end tipo, '+
                    'f.rdb$field_length tamanho '+
                    'from rdb$relation_fields h '+
                    'inner join rdb$fields f on f.rdb$field_name=h.rdb$field_source '+
                    'inner join rdb$types o on o.rdb$type = f.rdb$field_type and o.rdb$field_name=''RDB$FIELD_TYPE'' '+
                    'where h.rdb$relation_name =:coluna order by h.rdb$field_name');

    IBQuery2.ParamByName('coluna').AsString := cmbboxTabelas.Text;
    DataSource1.DataSet := IBQuery2;
    dbgridColunasBD.DataSource := DataSource1;
    IBQuery2.Open;

    dbgridColunasBD.Columns[0].Width :=100;
    dbgridColunasBD.Columns[1].Width :=70;
    dbgridColunasBD.Columns[2].Width :=20;
  end;

end.
