#define MyAppName "Русификатор для Wanderstop"
#define MyAppVersion "1.06 [20260128]"
#define MyAppPublisher "Dontaz"
#define MyAppURL "https://steamcommunity.com/sharedfiles/filedetails/?id=3479356545"
#define MyAppBoosty "https://boosty.to/dontaz"
#define MyAppDonationAlerts "https://www.donationalerts.com/r/dontaz" 
#define GameName "Wanderstop"

[Setup]
AppId={{E2A8C1B4-473C-4321-AFFD-5D6E06F4WNDR}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={code:GetGamePath}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=C:\Users\user\Desktop\Programs\Unreal Engine Modding\UnrealPak\Русификатор Wanderstop
OutputBaseFilename=Русификатор для Wanderstop
SolidCompression=yes
WizardStyle=modern dynamic
WizardSizePercent=150
UsePreviousAppDir=no
DisableDirPage=no
DirExistsWarning=no
AppendDefaultDirName=no
UninstallDisplayName=Удаление русификатора Wanderstop
UninstallFilesDir={app}\Удаление русификатора
WizardImageFile=sidebar_new.png
WizardSmallImageFile=small.png
WizardImageFileDynamicDark=sidebar_new.png
WizardSmallImageFileDynamicDark=small.png
DisableWelcomePage=no
VersionInfoCompany=Dontaz
VersionInfoDescription={#MyAppURL}
VersionInfoVersion=1.0.6
VersionInfoProductName={#MyAppName}
VersionInfoCopyright=MIT License

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "C:\Users\user\Desktop\Programs\Unreal Engine Modding\UnrealPak\Русификатор Wanderstop\Установщик\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[CustomMessages]
WelcomeTitle=Вас приветствует мастер установки русификатора Wanderstop
WelcomeText=Данный мастер установки поможет вам установить русификатор (версия {#MyAppVersion}) для игры {#GameName}.%n%nАвтор перевода: {#MyAppPublisher}.%nПри публикации на сторонних ресурсах просьба указывать авторство.%n%nНажимая «Далее», вы соглашаетесь с условиями использования.
VisitLink=🌐 Найти самую актуальную версию (Steam Руководство)
BoostyLink=🧡 Поддержать автора перевода
DisclaimerLink=⚠️ Условия использования (Читать)
DisclaimerFullText=УСЛОВИЯ ИСПОЛЬЗОВАНИЯ:%n%n1. Данный перевод является неофициальным и фанатским. Он создан исключительно в ознакомительных целях и распространяется бесплатно. Автор не преследует коммерческих целей.%n%n2. Все права на игру принадлежат её компании-разработчику и издателю. Пожалуйста, поддержите разработчиков покупкой лицензионной копии.%n%n3. Установка, использование или модификация файлов осуществляется пользователем добровольно, по собственной инициативе и под его личную ответственность.%n%n4. Автор перевода не несёт ответственности за возможные последствия, технические неполадки или утрату данных. Используя данный материал, вы подтверждаете, что принимаете на себя все риски.

[Code]
var
  VisitLabel: TNewStaticText;
  BoostyLabel: TNewStaticText;
  DisclaimerLabel: TNewStaticText;
  SupportForm: TForm;
  LinkColor: TColor;

procedure OpenUrl(Url: String);
var
  ErrorCode: Integer;
begin
  ShellExec('open', Url, '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure BoostyBtnClick(Sender: TObject);
begin
  OpenUrl(ExpandConstant('{#MyAppBoosty}'));
  if SupportForm <> nil then SupportForm.Close;
end;

procedure DABtnClick(Sender: TObject);
begin
  OpenUrl(ExpandConstant('{#MyAppDonationAlerts}'));
  if SupportForm <> nil then SupportForm.Close;
end;

procedure CloseSupportClick(Sender: TObject);
begin
  if SupportForm <> nil then SupportForm.Close;
end;

procedure ShowSupportWindow;
var
  TitleLabel: TLabel;
  DescLabel: TLabel;
  BtnBoosty, BtnDA, DummyBtn: TNewButton;
  CloseLabel: TLabel;
begin
  SupportForm := TForm.Create(WizardForm);
  try
    SupportForm.ClientWidth := ScaleX(340);
    SupportForm.ClientHeight := ScaleY(260);
    SupportForm.Caption := 'Поддержать автора';
    SupportForm.Position := poMainFormCenter;
    SupportForm.BorderStyle := bsDialog;
    
    SupportForm.Color := WizardForm.Color;
    SupportForm.Font.Color := WizardForm.Font.Color;

    DummyBtn := TNewButton.Create(SupportForm);
    DummyBtn.Parent := SupportForm;
    DummyBtn.Width := 0;
    DummyBtn.Height := 0;
    DummyBtn.Left := -100;
    DummyBtn.Default := True;

    TitleLabel := TLabel.Create(SupportForm);
    TitleLabel.Parent := SupportForm;
    TitleLabel.Caption := 'Вам нравится перевод?';
    TitleLabel.Font.Name := 'Segoe UI';
    TitleLabel.Font.Size := 14;
    TitleLabel.Font.Style := [fsBold];
    TitleLabel.Font.Color := SupportForm.Font.Color; 
    TitleLabel.AutoSize := False;
    TitleLabel.Alignment := taCenter;
    TitleLabel.Left := 0;
    TitleLabel.Width := SupportForm.ClientWidth;
    TitleLabel.Top := ScaleY(25);
    TitleLabel.Transparent := True;

    DescLabel := TLabel.Create(SupportForm);
    DescLabel.Parent := SupportForm;
    DescLabel.Caption := 'Выберите удобный способ поддержки:';
    DescLabel.Font.Color := SupportForm.Font.Color;
    DescLabel.Font.Size := 9;
    DescLabel.WordWrap := True;
    DescLabel.AutoSize := False;
    DescLabel.Alignment := taCenter;
    DescLabel.Left := ScaleX(10);
    DescLabel.Width := SupportForm.ClientWidth - ScaleX(20);
    DescLabel.Top := ScaleY(60);
    DescLabel.Height := ScaleY(40);
    DescLabel.Transparent := True;

    BtnBoosty := TNewButton.Create(SupportForm);
    BtnBoosty.Parent := SupportForm;
    BtnBoosty.Width := ScaleX(280);
    BtnBoosty.Height := ScaleY(40);
    BtnBoosty.Left := (SupportForm.ClientWidth - BtnBoosty.Width) div 2;
    BtnBoosty.Top := ScaleY(110);
    BtnBoosty.Caption := '🟠  Поддержать на Boosty'; 
    BtnBoosty.Cursor := crHandPoint;
    BtnBoosty.Font.Style := [fsBold];
    BtnBoosty.Font.Size := 10;
    BtnBoosty.OnClick := @BoostyBtnClick;
    BtnBoosty.TabOrder := 1;

    BtnDA := TNewButton.Create(SupportForm);
    BtnDA.Parent := SupportForm;
    BtnDA.Width := ScaleX(280);
    BtnDA.Height := ScaleY(40);
    BtnDA.Left := (SupportForm.ClientWidth - BtnDA.Width) div 2;
    BtnDA.Top := ScaleY(160);
    BtnDA.Caption := '🟠  Поддержать на DonationAlerts';
    BtnDA.Cursor := crHandPoint;
    BtnDA.Font.Style := [fsBold];
    BtnDA.Font.Size := 10;
    BtnDA.OnClick := @DABtnClick;
    BtnDA.TabOrder := 2;

    CloseLabel := TLabel.Create(SupportForm);
    CloseLabel.Parent := SupportForm;
    CloseLabel.Caption := 'Спасибо, но в другой раз';
    CloseLabel.Cursor := crHandPoint;
    
    if SupportForm.Color = clWhite then
       CloseLabel.Font.Color := $808080
    else
       CloseLabel.Font.Color := $C0C0C0;

    CloseLabel.Font.Style := [fsUnderline];
    CloseLabel.Font.Size := 9;
    CloseLabel.OnClick := @CloseSupportClick;
    CloseLabel.AutoSize := False;
    CloseLabel.Alignment := taCenter;
    CloseLabel.Left := 0;
    CloseLabel.Width := SupportForm.ClientWidth;
    CloseLabel.Top := ScaleY(225);
    CloseLabel.Transparent := True;

    SupportForm.ShowModal;
  finally
    SupportForm.Free;
    SupportForm := nil;
  end;
end;

procedure LinkLabelClick(Sender: TObject);
begin
  OpenUrl(ExpandConstant('{#MyAppURL}'));
end;

procedure BoostyLabelClick(Sender: TObject);
begin
  ShowSupportWindow();
end;

procedure ShowDisclaimerBox(Sender: TObject);
begin
  MsgBox(CustomMessage('DisclaimerFullText'), mbInformation, MB_OK);
end;

procedure DisclaimerLabelClick(Sender: TObject);
begin
  ShowDisclaimerBox(Sender);
end;

procedure InitializeWizard;
var
  BottomMargin: Integer;
begin
  BottomMargin := ScaleY(100);

  if WizardForm.Font.Color = clWhite then
    LinkColor := $00A5FF 
  else
    LinkColor := clBlue;

  WizardForm.WelcomeLabel1.Caption := CustomMessage('WelcomeTitle');
  WizardForm.WelcomeLabel2.Caption := CustomMessage('WelcomeText');
  
  WizardForm.WelcomeLabel2.Height := WizardForm.WelcomePage.Height - WizardForm.WelcomeLabel2.Top - BottomMargin;

  VisitLabel := TNewStaticText.Create(WizardForm);
  VisitLabel.Parent := WizardForm.WelcomePage;
  VisitLabel.Caption := CustomMessage('VisitLink');
  VisitLabel.Font.Color := LinkColor; 
  VisitLabel.Font.Style := [fsUnderline];
  VisitLabel.Cursor := crHandPoint;
  VisitLabel.OnClick := @LinkLabelClick;
  
  VisitLabel.Left := WizardForm.WelcomeLabel2.Left;
  VisitLabel.Top := WizardForm.WelcomeLabel2.Top + WizardForm.WelcomeLabel2.Height + ScaleY(10);
  VisitLabel.Width := WizardForm.WelcomeLabel2.Width;

  BoostyLabel := TNewStaticText.Create(WizardForm);
  BoostyLabel.Parent := WizardForm.WelcomePage;
  BoostyLabel.Caption := CustomMessage('BoostyLink');
  BoostyLabel.Font.Color := LinkColor;
  BoostyLabel.Font.Style := [fsUnderline];
  BoostyLabel.Cursor := crHandPoint;
  BoostyLabel.OnClick := @BoostyLabelClick;
  
  BoostyLabel.Left := WizardForm.WelcomeLabel2.Left;
  BoostyLabel.Top := VisitLabel.Top + VisitLabel.Height + ScaleY(10);
  BoostyLabel.Width := WizardForm.WelcomeLabel2.Width;

  DisclaimerLabel := TNewStaticText.Create(WizardForm);
  DisclaimerLabel.Parent := WizardForm.WelcomePage;
  DisclaimerLabel.Caption := CustomMessage('DisclaimerLink');
  
  DisclaimerLabel.Font.Color := LinkColor;
  DisclaimerLabel.Font.Style := [fsUnderline];
  DisclaimerLabel.Cursor := crHandPoint;
  DisclaimerLabel.OnClick := @DisclaimerLabelClick;
  
  DisclaimerLabel.Left := WizardForm.WelcomeLabel2.Left;
  DisclaimerLabel.Top := BoostyLabel.Top + BoostyLabel.Height + ScaleY(10);
  DisclaimerLabel.Width := WizardForm.WelcomeLabel2.Width;
end;

function GetSteamPath(): String;
var
  RegPath: String;
begin
  RegPath := '';
  if RegQueryStringValue(HKLM64, 'SOFTWARE\Valve\Steam', 'InstallPath', RegPath) then
  begin
    Result := RegPath;
    Exit;
  end;
  if RegQueryStringValue(HKLM, 'SOFTWARE\Valve\Steam', 'InstallPath', RegPath) then
  begin
    Result := RegPath;
    Exit;
  end;
  Result := ExpandConstant('{commonpf}\Steam');
end;

function GetValueFromLine(const Line: String): String;
var
  StartPos, EndPos: Integer;
  TempStr: String;
begin
  Result := '';
  TempStr := Line;
  while (Length(TempStr) > 0) and (TempStr[1] = ' ') do Delete(TempStr, 1, 1);
  StartPos := Pos('"', TempStr);
  if StartPos > 0 then
  begin
    Delete(TempStr, 1, StartPos);
    StartPos := Pos('"', TempStr);
    if StartPos > 0 then
    begin
      Delete(TempStr, 1, StartPos);
      StartPos := Pos('"', TempStr);
      if StartPos > 0 then
      begin
        Delete(TempStr, 1, StartPos);
        EndPos := Pos('"', TempStr);
        if EndPos > 0 then Result := Copy(TempStr, 1, EndPos - 1);
      end;
    end;
  end;
end;

function CheckCommonPirateLocations(): String;
var
  i: Integer;
  GamePath: String;
  CommonDirs: array[0..9] of String;
begin
  Result := '';
  CommonDirs[0] := 'C:\Games\{#GameName}';
  CommonDirs[1] := 'C:\Игры\{#GameName}';
  CommonDirs[2] := 'C:\Program Files\{#GameName}';
  CommonDirs[3] := 'C:\Program Files (x86)\{#GameName}';
  CommonDirs[4] := 'C:\{#GameName}';
  CommonDirs[5] := 'D:\Games\{#GameName}';
  CommonDirs[6] := 'D:\Игры\{#GameName}';
  CommonDirs[7] := 'D:\{#GameName}';
  CommonDirs[8] := 'E:\Games\{#GameName}';
  CommonDirs[9] := ExpandConstant('{userdesktop}\{#GameName}');
  
  for i := 0 to 9 do
  begin
    if DirExists(CommonDirs[i]) then
    begin
      Result := CommonDirs[i];
      Exit;
    end;
  end;
  
  for i := 65 to 90 do
  begin
    GamePath := Chr(i) + ':\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Games\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Игры\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Игра\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Game\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Games\Игры\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Игры\Games\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
  end;
end;

function GetGamePath(Param: String): String;
var
  DefaultPath, SteamPath, LibraryFoldersFile: String;
  GamePath, TempPath: String;
  i, LineCount: Integer;
  FileLines: TArrayOfString;
  Line: String;
begin
  SteamPath := GetSteamPath();
  DefaultPath := SteamPath + '\steamapps\common\{#GameName}';
  
  if DirExists(DefaultPath) then
  begin
    Result := DefaultPath;
    Exit;
  end;
  
  GamePath := '\home\deck\.local\share\Steam\steamapps\common\{#GameName}';
  if DirExists(GamePath) then
  begin
    Result := GamePath;
    Exit;
  end;
  
  LibraryFoldersFile := SteamPath + '\steamapps\libraryfolders.vdf';
  
  if FileExists(LibraryFoldersFile) then
  begin
    if LoadStringsFromFile(LibraryFoldersFile, FileLines) then
    begin
      LineCount := GetArrayLength(FileLines);
      for i := 0 to LineCount - 1 do
      begin
        Line := FileLines[i];
        if Pos('"path"', Line) > 0 then
        begin
          TempPath := GetValueFromLine(Line);
          if TempPath <> '' then
          begin
            GamePath := TempPath + '\steamapps\common\{#GameName}';
            StringChange(GamePath, '\\', '\');
            if DirExists(GamePath) then
            begin
              Result := GamePath;
              Exit;
            end;
          end;
        end;
      end;
    end;
  end;
  
  for i := 65 to 90 do
  begin
    GamePath := Chr(i) + ':\SteamLibrary\steamapps\common\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Steam\steamapps\common\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
  end;
  
  GamePath := CheckCommonPirateLocations();
  if GamePath <> '' then
  begin
    Result := GamePath;
    Exit;
  end;
  
  Result := 'C:\Program Files (x86)\Steam\steamapps\common\{#GameName}';
end;