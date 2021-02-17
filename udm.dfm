object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 426
  Width = 526
  object conectaBanco: TIBDatabase
    Params.Strings = (
      'user_name='
      'password=')
    LoginPrompt = False
    DefaultTransaction = TRSConectaBanco
    ServerType = 'IBServer'
    Left = 136
    Top = 104
  end
  object TRSConectaBanco: TIBTransaction
    DefaultDatabase = conectaBanco
    Left = 224
    Top = 104
  end
end
