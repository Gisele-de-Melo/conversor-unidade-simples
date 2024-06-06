object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Conversor de Unidades de Medidas Simples'
  ClientHeight = 156
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object ResultLabel: TLabel
    Left = 8
    Top = 120
    Width = 76
    Height = 21
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 172
    Height = 15
    Caption = 'Digite a unidade a ser convertida'
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 68
    Height = 15
    Caption = 'Converter de'
  end
  object Label4: TLabel
    Left = 160
    Top = 64
    Width = 23
    Height = 15
    Caption = 'Para'
  end
  object InputEdit: TEdit
    Left = 8
    Top = 32
    Width = 172
    Height = 23
    TabOrder = 0
  end
  object FromCombobox: TComboBox
    Left = 8
    Top = 80
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 1
  end
  object ToComboBox: TComboBox
    Left = 160
    Top = 80
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 2
  end
  object ConvertButton: TButton
    Left = 312
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Converter'
    TabOrder = 3
    OnClick = ConvertButtonClick
  end
end
