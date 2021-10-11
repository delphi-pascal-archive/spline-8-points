unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    dot1: TShape;
    dot2: TShape;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dot1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dot1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dot1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   OneSpline = record
      massPoint: array [0..3] of TPoint;
   end;

var
  Form1: TForm1;

  massPoint: array [0..7] of OneSpline;

implementation

uses Types;

{$R *.dfm}
// ��������� ��������������� ������ �� ����� 1 �� ����� 2 //
procedure SetDefCoor(Itm:Integer;Sp1,Sp2:TShape);
var x1,y1,x2,y2,l:Integer;
begin
     // �������� ����� ������� 1//
     x1:=Sp1.Left+(Sp1.Width div 2);
     y1:=Sp1.Top+(Sp1.Height div 2);

     // �������� ����� ������� 2//
     x2:=Sp2.Left+(Sp2.Width div 2);
     y2:=Sp2.Top+(Sp2.Height div 2);

     if x2<x1 then begin
        l:=x1-x2;
        massPoint[Itm].massPoint[0].X:=x2;
        massPoint[Itm].massPoint[1].X:=x2+l;
        massPoint[Itm].massPoint[2].X:=x2;
        massPoint[Itm].massPoint[3].X:=x1;
     end else begin
        l:=x2-x1;
        massPoint[Itm].massPoint[0].X:=x1;
        massPoint[Itm].massPoint[1].X:=x1+l;
        massPoint[Itm].massPoint[2].X:=x1;
        massPoint[Itm].massPoint[3].X:=x2;
     end;

     if y2<y1 then begin
        l:=y1-y2;
        massPoint[Itm].massPoint[0].Y:=y2;
        massPoint[Itm].massPoint[1].Y:=y2;
        massPoint[Itm].massPoint[2].Y:=y2+l;
        massPoint[Itm].massPoint[3].Y:=y1;
     end else begin
        l:=y2-y1;
        massPoint[Itm].massPoint[0].Y:=y1;
        massPoint[Itm].massPoint[1].Y:=y1;
        massPoint[Itm].massPoint[2].Y:=y1+l;
        massPoint[Itm].massPoint[3].Y:=y2;
     end;
end;


// ��������� �� ����� 1 �� ����� 2 //
procedure SetRedefCoor(Itm:Integer;Sp1,Sp2:TShape);
var x1,y1,x2,y2,l:Integer;
begin
     // �������� ����� ������� 1//
     x1:=Sp1.Left+(Sp1.Width div 2);
     y1:=Sp1.Top+(Sp1.Height div 2);

     // �������� ����� ������� 2//
     x2:=Sp2.Left+(Sp2.Width div 2);
     y2:=Sp2.Top+(Sp2.Height div 2);

     massPoint[Itm].massPoint[0].X:=x1;
     massPoint[Itm].massPoint[3].X:=x2;

     massPoint[Itm].massPoint[0].Y:=y1;
     massPoint[Itm].massPoint[3].Y:=y2;
end;


/// ����� �������� //
procedure DrawSpline(Canv:TCanvas;cW,cH:Integer;BkCol:COLORREF);
var rect:TRect;
    i:Integer;
begin
    // ������� ���� //
    rect.Left:=0;
    rect.Top:=0;
    rect.Right:=cW;
    rect.Bottom:=cH;
    Canv.Brush.Color:=BkCol;
    Canv.FillRect(rect);
    Canv.Pen.Style:=psSolid; // ��� �����
    for i:=0 to 7 do begin
        // ������������� ������ � ���� ���� //
        Canv.Pen.Color:=clBlue; // ����� ����
        Canv.Pen.Width:=3;      // ������� 3 �������
        Canv.PolyBezier(massPoint[i].massPoint);
        // ����� ������������ //
        Canv.Pen.Color:=clRed;
        Canv.Pen.Width:=0;
        Canv.Pen.Style:=psSolid; // ��� �����
        Canv.MoveTo(massPoint[i].massPoint[0].X,massPoint[i].massPoint[0].Y);
        Canv.LineTo(massPoint[i].massPoint[3].X,massPoint[i].massPoint[3].Y);

        if Form1.CheckBox1.Checked then begin
          Canv.Pen.Color:=clGreen; // ������� ����
          Canv.Pen.Width:=0;
          Canv.Pen.Style:=psDashDotDot; // ��� �����
          Canv.MoveTo(massPoint[i].massPoint[0].X,massPoint[i].massPoint[0].Y);
          Canv.LineTo(massPoint[i].massPoint[1].X,massPoint[i].massPoint[1].Y);
          Canv.LineTo(massPoint[i].massPoint[2].X,massPoint[i].massPoint[2].Y);
          Canv.LineTo(massPoint[i].massPoint[3].X,massPoint[i].massPoint[3].Y);
        end;

    end;

    if Form1.dot1.Visible=True then begin
       // ������� ������������ ����� //
        if (Form1.dot1.Hint<> '') and (Form1.CheckBox1.Checked=False) then begin
          Canv.Pen.Color:=clGreen; // ������� ����
          Canv.Pen.Width:=0;
          Canv.Pen.Style:=psDashDotDot; // ��� �����
          i:=StrToInt(Form1.dot1.Hint);
          Canv.MoveTo(massPoint[i].massPoint[0].X,massPoint[i].massPoint[0].Y);
          Canv.LineTo(massPoint[i].massPoint[1].X,massPoint[i].massPoint[1].Y);
          Canv.LineTo(massPoint[i].massPoint[2].X,massPoint[i].massPoint[2].Y);
          Canv.LineTo(massPoint[i].massPoint[3].X,massPoint[i].massPoint[3].Y);
        end;
    end;
end;

// ������ ������������ ����� //
procedure SetDotPosic(pt1,pt2:TShape);
var i,x1,y1,x2,y2:Integer;
begin
   if pt1.Hint='' then Exit;       // ���� �� ������ ������ - �������� ������
   if pt2.Hint='' then Exit;       // ���� �� ������ ������ - �������� ������

   i:=StrToInt(pt1.Hint);
   x1:=massPoint[i].massPoint[1].X; // ����� 1
   y1:=massPoint[i].massPoint[1].Y; // ����� 1
   i:=StrToInt(pt2.Hint);
   x2:=massPoint[i].massPoint[2].X; // ����� 2
   y2:=massPoint[i].massPoint[2].Y; // ����� 2
   // ���������� ������
   pt1.Left:=x1-(pt1.Width div 2);
   pt1.Top:=y1-(pt1.Height div 2);

   pt2.Left:=x2-(pt2.Width div 2);
   pt2.Top:=y2-(pt2.Height div 2);

   if pt1.Visible = False then pt1.Visible:=True;
   if pt2.Visible = False then pt2.Visible:=True;
end;

// �������� � ������� ����� ������������ ���������� �� ��������� �������� //
procedure SetRedefPosic(pt1,pt2:TShape);
var i,x1,y1,x2,y2:Integer;
begin
   if pt1.Hint='' then Exit;       // ���� �� ������ ������ - �������� ������
   if pt2.Hint='' then Exit;       // ���� �� ������ ������ - �������� ������

   i:=StrToInt(pt1.Hint);
   x1:=pt1.Left+(pt1.Width div 2);
   massPoint[i].massPoint[1].X:=x1; // ����� 1
   y1:=pt1.Top+(pt1.Height div 2);
   massPoint[i].massPoint[1].Y:=y1; // ����� 1

   i:=StrToInt(pt2.Hint);
   x2:=pt2.Left+(pt2.Width div 2);
   massPoint[i].massPoint[2].X:=x2; // ����� 2
   y2:=pt2.Top+(pt2.Height div 2);
   massPoint[i].massPoint[2].Y:=y2; // ����� 2
end;


procedure TForm1.FormShow(Sender: TObject);
begin
// ��������� ������ ���������� ������� //
    SetDefCoor(0,Shape1,Shape2);
    SetDefCoor(1,Shape2,Shape3);
    SetDefCoor(2,Shape3,Shape4);
    SetDefCoor(3,Shape4,Shape5);
    SetDefCoor(4,Shape5,Shape6);
    SetDefCoor(5,Shape6,Shape7);
    SetDefCoor(6,Shape7,Shape8);
    DrawSpline(Image1.Canvas,Image1.Width,Image1.Height,clWhite);
end;

procedure TForm1.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if TShape(Sender).Tag = 0 then begin
      SetCapture(Form1.Handle);
      TShape(Sender).Tag:=1;
      Shape1.Brush.Color:=clWhite;
      Shape2.Brush.Color:=clWhite;
      Shape3.Brush.Color:=clWhite;
      Shape4.Brush.Color:=clWhite;
      Shape5.Brush.Color:=clWhite;
      Shape6.Brush.Color:=clWhite;
      Shape7.Brush.Color:=clWhite;
      Shape8.Brush.Color:=clWhite;
      TShape(Sender).Brush.Color:=clBlack;
   end;
end;

procedure TForm1.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:Integer;
begin
   if TShape(Sender).Tag = 1 then begin
      ReleaseCapture;
      TShape(Sender).Tag:=0;
      i:=StrToInt(TShape(Sender).Hint)-1;
      Form1.Caption:='������� �����: '+TShape(Sender).Hint;

      if i<7 then begin
         // c 0 �� 6
         dot1.Hint:=IntToStr(i);
         dot2.Hint:=IntToStr(i);
      end else begin
         dot1.Hint:=IntToStr(i-1);
         dot2.Hint:=IntToStr(i-1);
      end;
      SetDotPosic(dot1,dot2);
      DrawSpline(Image1.Canvas,Image1.Width,Image1.Height,clWhite);
   end;
end;

procedure TForm1.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var r1:TRect;p1:TPoint;
begin
   if TShape(Sender).Tag = 1 then begin
      GetWindowRect(TShape(Sender).Parent.Handle,r1);
      GetCursorPos(p1);
      p1.X:=p1.X-r1.Left;
      p1.Y:=p1.Y-r1.Top;
      TShape(Sender).Left:=p1.X-(TShape(Sender).Width div 2);
      TShape(Sender).Top:=p1.Y-32-(TShape(Sender).Height div 2); // ��-�� ������ ��������� �������� "32" - ���������� ������� �����
      // ��������������� ��������� //
      SetRedefCoor(0,Shape1,Shape2);
      SetRedefCoor(1,Shape2,Shape3);
      SetRedefCoor(2,Shape3,Shape4);
      SetRedefCoor(3,Shape4,Shape5);
      SetRedefCoor(4,Shape5,Shape6);
      SetRedefCoor(5,Shape6,Shape7);
      SetRedefCoor(6,Shape7,Shape8);
      DrawSpline(Image1.Canvas,Image1.Width,Image1.Height,clWhite);
   end;
end;

procedure TForm1.dot1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//
   if TShape(Sender).Tag = 0 then begin
      SetCapture(Form1.Handle);
      TShape(Sender).Tag:=1;
   end;
end;

procedure TForm1.dot1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if TShape(Sender).Tag = 1 then begin
      ReleaseCapture;
      TShape(Sender).Tag:=0;
   end;

end;

procedure TForm1.dot1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var r1:TRect;p1:TPoint;
begin
   if TShape(Sender).Tag = 1 then begin
      GetWindowRect(TShape(Sender).Parent.Handle,r1);
      GetCursorPos(p1);
      p1.X:=p1.X-r1.Left;
      p1.Y:=p1.Y-r1.Top;
      TShape(Sender).Left:=p1.X-(TShape(Sender).Width div 2);
      TShape(Sender).Top:=p1.Y-32-(TShape(Sender).Height div 2); // ��-�� ������ ��������� �������� "32" - ���������� ������� �����

      // ��������������� ��������� //
      SetRedefCoor(0,Shape1,Shape2);
      SetRedefCoor(1,Shape2,Shape3);
      SetRedefCoor(2,Shape3,Shape4);
      SetRedefCoor(3,Shape4,Shape5);
      SetRedefCoor(4,Shape5,Shape6);
      SetRedefCoor(5,Shape6,Shape7);
      SetRedefCoor(6,Shape7,Shape8);
      SetRedefPosic(dot1,dot2);
      DrawSpline(Image1.Canvas,Image1.Width,Image1.Height,clWhite);
   end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
      // ��������������� ��������� //
      SetRedefCoor(0,Shape1,Shape2);
      SetRedefCoor(1,Shape2,Shape3);
      SetRedefCoor(2,Shape3,Shape4);
      SetRedefCoor(3,Shape4,Shape5);
      SetRedefCoor(4,Shape5,Shape6);
      SetRedefCoor(5,Shape6,Shape7);
      SetRedefCoor(6,Shape7,Shape8);
      DrawSpline(Image1.Canvas,Image1.Width,Image1.Height,clWhite);

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // ������ ��� �����
  if dot1.Visible then begin
     dot1.Visible:=False;
     dot2.Visible:=False;
      // ��������������� ��������� //
      SetRedefCoor(0,Shape1,Shape2);
      SetRedefCoor(1,Shape2,Shape3);
      SetRedefCoor(2,Shape3,Shape4);
      SetRedefCoor(3,Shape4,Shape5);
      SetRedefCoor(4,Shape5,Shape6);
      SetRedefCoor(5,Shape6,Shape7);
      SetRedefCoor(6,Shape7,Shape8);
      DrawSpline(Image1.Canvas,Image1.Width,Image1.Height,clWhite);
  end;

end;

end.
