@interface SBApplicationLaunchNotifyAirplaneModeAlertItem
- (BOOL)_isOnCellular;
- (SBApplicationLaunchNotifyAirplaneModeAlertItem)initWithApplication:(id)a3;
- (id)_alertTitleForOnCellular:(int)a3 isMessagesApplication:;
- (id)_createSystemApertureElement;
- (uint64_t)_primaryActionTriggeredForOnCellular:(uint64_t)result;
- (void)_configureForAirplaneModeDataAlertOnCellular:(int)a3 isMessagesApplication:;
- (void)_isMessagesApplication;
- (void)_sendUserToSettings;
- (void)_turnOffAirplaneMode;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBApplicationLaunchNotifyAirplaneModeAlertItem

- (SBApplicationLaunchNotifyAirplaneModeAlertItem)initWithApplication:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBApplicationLaunchNotifyAirplaneModeAlertItem;
  v5 = [(SBApplicationLaunchNotifyAlertItem *)&v7 initWithApplication:v4];
  if (v5) {
    v5->_usesCellNetwork = ([v4 dataUsage] & 4) != 0;
  }

  return v5;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  unsigned int v5 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _isOnCellular](self);
  int v6 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _isMessagesApplication](self);
  -[SBApplicationLaunchNotifyAirplaneModeAlertItem _configureForAirplaneModeDataAlertOnCellular:isMessagesApplication:](self, v5, v6);
}

- (BOOL)_isOnCellular
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 application];
  BOOL v2 = [v1 dataUsage] != 0;

  return v2;
}

- (void)_isMessagesApplication
{
  if (result)
  {
    v1 = [result application];
    BOOL v2 = [v1 bundleIdentifier];
    uint64_t v3 = [v2 isEqualToString:@"com.apple.MobileSMS"];

    return (void *)v3;
  }
  return result;
}

- (void)_configureForAirplaneModeDataAlertOnCellular:(int)a3 isMessagesApplication:
{
  if (a1)
  {
    int v6 = [a1 alertController];
    objc_super v7 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _alertTitleForOnCellular:isMessagesApplication:]((uint64_t)a1, a2, a3);
    [v6 setTitle:v7];

    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    v9 = v8;
    if (a2) {
      v10 = @"AIRPLANE_DISABLE";
    }
    else {
      v10 = @"AIRPLANE_DATA_SETTINGS";
    }
    if (a2) {
      v11 = @"AIRPLANE_CANCEL";
    }
    else {
      v11 = @"AIRPLANE_DATA_OK";
    }
    v12 = [v8 localizedStringForKey:v10 value:&stru_1F3084718 table:@"SpringBoard"];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __117__SBApplicationLaunchNotifyAirplaneModeAlertItem__configureForAirplaneModeDataAlertOnCellular_isMessagesApplication___block_invoke;
    v18[3] = &unk_1E6B0AFF0;
    v18[4] = a1;
    char v19 = a2;
    v13 = [MEMORY[0x1E4F42720] actionWithTitle:v12 style:0 handler:v18];
    [v6 addAction:v13];

    v14 = [MEMORY[0x1E4F28B50] mainBundle];
    v15 = [v14 localizedStringForKey:v11 value:&stru_1F3084718 table:@"SpringBoard"];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __117__SBApplicationLaunchNotifyAirplaneModeAlertItem__configureForAirplaneModeDataAlertOnCellular_isMessagesApplication___block_invoke_2;
    v17[3] = &unk_1E6AF4918;
    v17[4] = a1;
    v16 = [MEMORY[0x1E4F42720] actionWithTitle:v15 style:a2 handler:v17];
    [v6 addAction:v16];
  }
}

- (id)_createSystemApertureElement
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA7D70]);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA7D80]) initWithSystemImageName:@"airplane"];
  unsigned int v5 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  [v4 setContentColor:v5];

  [v3 setLeadingContentViewProvider:v4];
  BOOL v6 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _isOnCellular](self);
  int v7 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _isMessagesApplication](self);
  v8 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _alertTitleForOnCellular:isMessagesApplication:]((uint64_t)self, v6, v7);
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FA7DB0]) initWithText:v8 style:0];
  [v9 setNumberOfLines:0];
  [v3 setPrimaryContentViewProvider:v9];
  objc_initWeak(&location, self);
  v10 = [MEMORY[0x1E4F28B50] mainBundle];
  if (v6) {
    [v10 localizedStringForKey:@"AIRPLANE_DISABLE" value:&stru_1F3084718 table:@"SpringBoard"];
  }
  else {
  v11 = [v10 localizedStringForKey:@"AIRPLANE_DATA_GO_TO_SETTINGS" value:&stru_1F3084718 table:@"SpringBoard"];
  }

  id v12 = objc_alloc(MEMORY[0x1E4FA7D58]);
  v13 = (void *)MEMORY[0x1E4F426E8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__SBApplicationLaunchNotifyAirplaneModeAlertItem__createSystemApertureElement__block_invoke;
  v18[3] = &unk_1E6AFE710;
  objc_copyWeak(&v19, &location);
  BOOL v20 = v6;
  v14 = [v13 actionWithTitle:v11 image:0 identifier:0 handler:v18];
  v15 = (void *)[v12 initWithDefaultTextActionConfigurationWithAction:v14];

  [v3 setActionContentViewProvider:v15];
  v16 = [(SBSystemApertureProvidedContentElement *)[SBAlertProvidedContentElement alloc] initWithIdentifier:self contentProvider:v3];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v16;
}

- (id)_alertTitleForOnCellular:(int)a3 isMessagesApplication:
{
  if (a1)
  {
    if (a3)
    {
      id v3 = [MEMORY[0x1E4F28B50] mainBundle];
      id v4 = v3;
      unsigned int v5 = @"AIRPLANE_CELL_PROMPT_SMS";
    }
    else if (a2)
    {
      id v3 = [MEMORY[0x1E4F28B50] mainBundle];
      id v4 = v3;
      unsigned int v5 = @"AIRPLANE_CELL_PROMPT";
    }
    else if (MGGetBoolAnswer())
    {
      int v6 = MGGetBoolAnswer();
      id v3 = [MEMORY[0x1E4F28B50] mainBundle];
      id v4 = v3;
      if (v6) {
        unsigned int v5 = @"AIRPLANE_DATA_PROMPT_WLAN";
      }
      else {
        unsigned int v5 = @"AIRPLANE_DATA_PROMPT";
      }
    }
    else
    {
      id v3 = [MEMORY[0x1E4F28B50] mainBundle];
      id v4 = v3;
      unsigned int v5 = @"AIRPLANE_DATA_PROMPT_NO_WIFI";
    }
    int v7 = [v3 localizedStringForKey:v5 value:&stru_1F3084718 table:@"SpringBoard"];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

void __78__SBApplicationLaunchNotifyAirplaneModeAlertItem__createSystemApertureElement__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBApplicationLaunchNotifyAirplaneModeAlertItem _primaryActionTriggeredForOnCellular:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));
}

- (uint64_t)_primaryActionTriggeredForOnCellular:(uint64_t)result
{
  if (result)
  {
    BOOL v2 = (void *)result;
    if (a2) {
      -[SBApplicationLaunchNotifyAirplaneModeAlertItem _turnOffAirplaneMode](result);
    }
    else {
      -[SBApplicationLaunchNotifyAirplaneModeAlertItem _sendUserToSettings](result);
    }
    return [v2 deactivateForButton];
  }
  return result;
}

uint64_t __117__SBApplicationLaunchNotifyAirplaneModeAlertItem__configureForAirplaneModeDataAlertOnCellular_isMessagesApplication___block_invoke(uint64_t a1)
{
  return -[SBApplicationLaunchNotifyAirplaneModeAlertItem _primaryActionTriggeredForOnCellular:](*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __117__SBApplicationLaunchNotifyAirplaneModeAlertItem__configureForAirplaneModeDataAlertOnCellular_isMessagesApplication___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (void)_turnOffAirplaneMode
{
  if (a1)
  {
    id v1 = +[SBAirplaneModeController sharedInstance];
    [v1 setInAirplaneMode:0];
  }
}

- (void)_sendUserToSettings
{
  if (a1)
  {
    [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ROOT#AIRPLANE_MODE"];
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    SBWorkspaceActivateApplicationFromURL(v1, 0, 0);
  }
}

@end