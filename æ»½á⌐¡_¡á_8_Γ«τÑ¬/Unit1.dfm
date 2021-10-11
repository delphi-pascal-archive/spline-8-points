object Form1: TForm1
  Left = 243
  Top = 112
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1099#1074#1086#1076' '#1082#1088#1080#1074#1086#1081' '#1041#1077#1079#1100#1077' '#1087#1086' 8 '#1090#1086#1095#1082#1072#1084
  ClientHeight = 602
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 854
    Height = 602
    Align = alClient
    OnMouseDown = Image1MouseDown
  end
  object Shape1: TShape
    Left = 24
    Top = 56
    Width = 16
    Height = 16
    Cursor = crDrag
    Hint = '1'
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape1MouseDown
    OnMouseMove = Shape1MouseMove
    OnMouseUp = Shape1MouseUp
  end
  object Shape2: TShape
    Left = 104
    Top = 112
    Width = 16
    Height = 16
    Cursor = crDrag
    Hint = '2'
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape1MouseDown
    OnMouseMove = Shape1MouseMove
    OnMouseUp = Shape1MouseUp
  end
  object Shape3: TShape
    Left = 200
    Top = 176
    Width = 16
    Height = 16
    Cursor = crDrag
    Hint = '3'
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape1MouseDown
    OnMouseMove = Shape1MouseMove
    OnMouseUp = Shape1MouseUp
  end
  object Shape4: TShape
    Left = 288
    Top = 240
    Width = 16
    Height = 16
    Cursor = crDrag
    Hint = '4'
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape1MouseDown
    OnMouseMove = Shape1MouseMove
    OnMouseUp = Shape1MouseUp
  end
  object Shape5: TShape
    Left = 408
    Top = 312
    Width = 16
    Height = 16
    Cursor = crDrag
    Hint = '5'
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape1MouseDown
    OnMouseMove = Shape1MouseMove
    OnMouseUp = Shape1MouseUp
  end
  object Shape6: TShape
    Left = 512
    Top = 384
    Width = 16
    Height = 16
    Cursor = crDrag
    Hint = '6'
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape1MouseDown
    OnMouseMove = Shape1MouseMove
    OnMouseUp = Shape1MouseUp
  end
  object Shape7: TShape
    Left = 608
    Top = 448
    Width = 16
    Height = 16
    Cursor = crDrag
    Hint = '7'
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape1MouseDown
    OnMouseMove = Shape1MouseMove
    OnMouseUp = Shape1MouseUp
  end
  object Shape8: TShape
    Left = 744
    Top = 536
    Width = 16
    Height = 16
    Cursor = crDrag
    Hint = '8'
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape1MouseDown
    OnMouseMove = Shape1MouseMove
    OnMouseUp = Shape1MouseUp
  end
  object dot1: TShape
    Left = 48
    Top = 264
    Width = 10
    Height = 10
    Cursor = crHandPoint
    Brush.Color = clRed
    Shape = stSquare
    Visible = False
    OnMouseDown = dot1MouseDown
    OnMouseMove = dot1MouseMove
    OnMouseUp = dot1MouseUp
  end
  object dot2: TShape
    Left = 104
    Top = 240
    Width = 10
    Height = 10
    Cursor = crHandPoint
    Brush.Color = clRed
    Shape = stSquare
    Visible = False
    OnMouseDown = dot1MouseDown
    OnMouseMove = dot1MouseMove
    OnMouseUp = dot1MouseUp
  end
  object CheckBox1: TCheckBox
    Left = 704
    Top = 8
    Width = 137
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077' '#1083#1080#1085#1080#1080
    TabOrder = 0
    OnClick = CheckBox1Click
  end
end
