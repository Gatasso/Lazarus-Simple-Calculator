unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    bt1: TButton;
    bt10: TButton;
    bt100: TButton;
    bt1000: TButton;
    btDivide: TButton;
    btEquals: TButton;
    btMinus: TButton;
    btMult: TButton;
    btSignal: TButton;
    btSum: TButton;
    btDel: TButton;
    lblNumero: TLabel;
    visor: TPanel;
    procedure btCLick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure btEqualsClick(Sender: TObject);
    procedure btMathClick(Sender: TObject);
    procedure btSignalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation
var mathOp: string;
var operation: array[0..1] of double;

{$R *.lfm}

{ TForm1 }

  procedure TForm1.btClick(Sender:TObject);
  var button: TButton;
  begin
     button:= Sender as TButton;
     begin
       case button.Tag of
            1:
              lblNumero.Caption := lblNumero.Caption + button.Caption;
            10:
              lblNumero.Caption := lblNumero.Caption + button.Caption;
            100:
              lblNumero.Caption := lblNumero.Caption + button.Caption;
            1000:
              lblNumero.Caption := lblNumero.Caption + button.Caption;
       end;
     end;
  end;

procedure TForm1.btDelClick(Sender: TObject);
var erased: string;
begin
   erased:= Copy(lblNumero.Caption,1,Length(lblNumero.Caption) -1);
   lblNumero.Caption:= erased;
end;

  procedure TForm1.btMathClick(Sender: TObject);
    var buttonOp: TButton;
    begin
      buttonOp:= Sender as TButton;
      //if button.Caption <> '=' then
      case buttonOp.Name of
        'btSum':
          begin
            mathOp:= 'sum';
            operation[0]:= StrToFloat(lblNumero.Caption);
            lblNumero.Caption:= '';
          end;
        'btMinus':
          begin
            mathOp:= 'subt';
            operation[0]:= StrToFloat(lblNumero.Caption);
            lblNumero.Caption:= '';
          end;
        'btMult':
          begin
            mathOp:= 'mult';
            operation[0]:= StrToFloat(lblNumero.Caption);
            lblNumero.Caption:= '';
          end;
        'btDivide':
          begin
            mathOp:= 'div';
            operation[0]:= StrToFloat(lblNumero.Caption);
            lblNumero.Caption:= '';
          end;
      end;

    end;

procedure TForm1.btSignalClick(Sender: TObject);
var newValue: double;
begin
    newValue:= -(StrToFLoat(lblNumero.Caption));
    lblNumero.Caption:= FloatToStr(newValue);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  lblNumero.Caption:= lblNumero.Caption + ',';
end;

   procedure TForm1.btEqualsClick(Sender: TObject);
   begin
     case mathOp of
       'sum':
         begin
           operation[1]:= StrToFloat(lblNumero.Caption);
           lblNumero.Caption:= FloatToStr(operation[0] + operation[1]);
           operation[0]:= StrToFloat(lblNumero.Caption);
           mathOp:= '';
         end;
       'subt':
         begin
           operation[1]:= StrToFloat(lblNumero.Caption);
           lblNumero.Caption:= FloatToStr(operation[0] - operation[1]);
           operation[0]:= StrToFloat(lblNumero.Caption);
           operation[0]:= StrToFloat(lblNumero.Caption);
           mathOp:= '';
         end;
       'mult':
         begin
           operation[1]:= StrToFloat(lblNumero.Caption);
           lblNumero.Caption:= FloatToStr(operation[0] * operation[1]);
           operation[0]:= StrToFloat(lblNumero.Caption);
           operation[0]:= StrToFloat(lblNumero.Caption);
           mathOp:= '';
         end;
       'div':
         begin
           operation[1]:= StrToFloat(lblNumero.Caption);
           lblNumero.Caption:= FloatToStr(operation[0] / operation[1]);
           operation[0]:= StrToFloat(lblNumero.Caption);
           operation[0]:= StrToFloat(lblNumero.Caption);
           mathOp:= '';
         end;
     end;
   end;
end.
