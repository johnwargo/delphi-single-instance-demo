object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Single Instance App Demo'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 416
    Width = 624
    Height = 25
    Panels = <>
    ParentShowHint = False
    ShowHint = False
    SimplePanel = True
    SimpleText = 'By John M. Wargo (https://johnwargo.com)'
    ExplicitTop = 419
  end
  object Output: TListBox
    Left = 0
    Top = 0
    Width = 624
    Height = 416
    Align = alClient
    ItemHeight = 15
    TabOrder = 1
    ExplicitLeft = 264
    ExplicitTop = 192
    ExplicitWidth = 121
    ExplicitHeight = 97
  end
end
