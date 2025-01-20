@interface SBNetworkReselectionAlertItem
- (SBNetworkReselectionAlertItem)initWithSlot:(int64_t)a3;
- (id)lockLabel;
- (id)shortLockLabel;
- (void)_showPrefs;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)performUnlockAction;
@end

@implementation SBNetworkReselectionAlertItem

- (SBNetworkReselectionAlertItem)initWithSlot:(int64_t)a3
{
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 localizedStringForKey:@"NETWORK_LOST" value:&stru_1F3084718 table:@"SpringBoard"];
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 localizedStringForKey:@"NETWORK_LOST_TEXT" value:&stru_1F3084718 table:@"SpringBoard"];
  v9 = [(SBPhoneAlertItem *)self initWithTitle:v6 bodyText:v8 slot:a3];

  return v9;
}

- (void)_showPrefs
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Carrier"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v2, 0, 0);
}

- (id)lockLabel
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"NETWORK_LOST_LOCK_LABEL" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (id)shortLockLabel
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"NETWORK_LOST_LOCK_LABEL_SHORT" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (void)performUnlockAction
{
  [(SBNetworkReselectionAlertItem *)self _showPrefs];
  [(SBAlertItem *)self deactivate];
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  v6 = [(id)SBApp telephonyStateProvider];
  int64_t v7 = [(SBPhoneAlertItem *)self slot];
  v8 = [v6 subscriptionInfoForSlot:v7];
  unint64_t v9 = [v8 registrationRejectionCauseCode] - 2;
  if (v7 && [v6 isDualSIMEnabled])
  {
    if (v7 == 1) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    int v11 = [v6 isSIMPresentForSlot:v10];
  }
  else
  {
    int v11 = 0;
  }
  v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = v12;
  v31 = v8;
  if (v9 > 4)
  {
    v14 = [v12 localizedStringForKey:@"NETWORK_LOST" value:&stru_1F3084718 table:@"SpringBoard"];

    v15 = NSString;
    v16 = [MEMORY[0x1E4F28B50] mainBundle];
    if (v11)
    {
      v17 = @"NETWORK_LOST_TEXT_FORMAT";
      goto LABEL_13;
    }
    v21 = @"NETWORK_LOST_TEXT";
  }
  else
  {
    v14 = [v12 localizedStringForKey:@"NETWORK_RESTRICTED" value:&stru_1F3084718 table:@"SpringBoard"];

    v15 = NSString;
    v16 = [MEMORY[0x1E4F28B50] mainBundle];
    if (v11)
    {
      v17 = @"NETWORK_RESTRICTED_TEXT_FORMAT";
LABEL_13:
      v18 = [v16 localizedStringForKey:v17 value:&stru_1F3084718 table:@"SpringBoard-gemini"];
      v19 = [v8 SIMLabel];
      v20 = objc_msgSend(v15, "stringWithFormat:", v18, v19);

      goto LABEL_17;
    }
    v21 = @"NETWORK_RESTRICTED_TEXT";
  }
  v18 = [v16 localizedStringForKey:v21 value:&stru_1F3084718 table:@"SpringBoard"];
  v20 = [v15 stringWithFormat:v18];
LABEL_17:

  [v5 setTitle:v14];
  [v5 setMessage:v20];
  if (!a3)
  {
    v22 = (void *)MEMORY[0x1E4F42720];
    v23 = [MEMORY[0x1E4F28B50] mainBundle];
    v24 = [v23 localizedStringForKey:@"DISMISS_ALERT" value:&stru_1F3084718 table:@"SpringBoard"];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __69__SBNetworkReselectionAlertItem_configure_requirePasscodeForActions___block_invoke;
    v33[3] = &unk_1E6AF4918;
    v33[4] = self;
    v25 = [v22 actionWithTitle:v24 style:0 handler:v33];
    [v5 addAction:v25];

    v26 = (void *)MEMORY[0x1E4F42720];
    v27 = [MEMORY[0x1E4F28B50] mainBundle];
    v28 = [v27 localizedStringForKey:@"SETTINGS" value:&stru_1F3084718 table:@"SpringBoard"];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __69__SBNetworkReselectionAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v32[3] = &unk_1E6AF4918;
    v32[4] = self;
    v29 = [v26 actionWithTitle:v28 style:0 handler:v32];

    [v5 addAction:v29];
    [v5 setPreferredAction:v29];
  }
}

uint64_t __69__SBNetworkReselectionAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

uint64_t __69__SBNetworkReselectionAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showPrefs];
  id v2 = *(void **)(a1 + 32);
  return [v2 deactivateForButton];
}

@end