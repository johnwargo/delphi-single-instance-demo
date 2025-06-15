unit main;

interface

uses

  AppSingleInstance,

  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes,

  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    StatusBar1: TStatusBar;
    Output: TListBox;
    procedure FormCreate(Sender: TObject);
  private
    procedure ProcessParam(const Param: string);
    procedure UMEnsureRestored(var Msg: TMessage); message UM_ENSURERESTORED;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.ProcessParam(const Param: string);
begin
  Output.items.Append(Format('Application parameter: "%s"', [Param]));
end;

procedure TfrmMain.CreateParams(var Params: TCreateParams);
begin
  inherited;
  StrCopy(Params.WinClassName, AppWindowName);
end;

procedure TfrmMain.UMEnsureRestored(var Msg: TMessage);
begin
  Output.items.Append('Application restored');
  if IsIconic(Application.Handle) then
    Application.Restore;
  if not Visible then
    Visible := True;
  Application.BringToFront;
  SetForegroundWindow(Self.Handle);
end;

procedure TfrmMain.WMCopyData(var Msg: TWMCopyData);
var
  PData: PChar;
  Param: string;
begin
  Output.items.Append('Data received');
  if Msg.CopyDataStruct.dwData <> cCopyDataWaterMark then
    raise Exception.Create('Invalid data structure passed in WM_COPYDATA');
  PData := Msg.CopyDataStruct.lpData;
  while PData^ <> #0 do begin
    Param := PData;
    ProcessParam(Param);
    Inc(PData, Length(Param) + 1);
  end;
  Msg.Result := 1;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  idx: Integer;
begin
  Output.items.Append('Initial application launch');
  for idx := 1 to ParamCount do
    ProcessParam(ParamStr(idx));
end;

end.
