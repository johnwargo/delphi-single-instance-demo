program SingleInstance;

// https://delphidabbler.com/articles/article-13

uses
  Vcl.Forms,
  Vcl.Dialogs,
  System.SysUtils,
  Windows,
  Messages,
  main in 'main.pas' {frmMain} ,
  AppSingleInstance in 'AppSingleInstance.pas';

{$R *.res}

var
  AppWindow: HWND;

begin

  AppWindow := FindWindow(AppWindowName, nil);
  // if this is the only instance, AppWindow will be 0
  if AppWindow <> 0 then begin
    if not SwitchToPrevInst(AppWindow) then begin
      MessageDlg('Unable to activate existing application instance',
        mtInformation, [mbOk], 0, mbOk);
    end;
    halt;
  end;

  // We didn't have another instance to switch to, so start one up.
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.
