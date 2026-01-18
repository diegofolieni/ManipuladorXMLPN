unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, ACBrCompress, synacode, ACBrJSON;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnDesconverter: TButton;
    btnGerarPayload: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    memXML: TMemo;
    memJSON: TMemo;
    memXmlBase64: TMemo;
    memXmlDPSAssinado: TMemo;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    tsDecompress: TTabSheet;
    Compress: TTabSheet;
    procedure btnDesconverterClick(Sender: TObject);
    procedure btnGerarPayloadClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnDesconverterClick(Sender: TObject);
begin
  memXML.Text := DeCompress(DecodeBase64(memXmlBase64.Text));
end;

procedure TForm1.btnGerarPayloadClick(Sender: TObject);
var
  lJSON: TACBrJSONObject;
begin
  lJSON := TACBrJSONObject.Create;
  try
    lJSON.AddPair('dpsXmlGZipB64', EncodeBase64(GZipCompress(memXmlDPSAssinado.Text)));
    memJSON.Text := lJSON.ToJSON;
  finally
    lJSON.Free;
  end;
end;

end.

