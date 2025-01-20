@interface SBDataPlanDisableAlertItem
- (void)_showSettings;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBDataPlanDisableAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3, a4);
  v7 = [(SBAlertItem *)self alertController];
  v8 = [v6 localizedStringForKey:@"DATA_PLAN_DISABLE_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v7 setTitle:v8];

  v9 = [v6 localizedStringForKey:@"DATA_PLAN_DISABLE_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
  [v7 setMessage:v9];

  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E4F42720];
    v11 = [v6 localizedStringForKey:@"OK" value:&stru_1F3084718 table:@"SpringBoard"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__SBDataPlanDisableAlertItem_configure_requirePasscodeForActions___block_invoke;
    v17[3] = &unk_1E6AF4918;
    v17[4] = self;
    v12 = [v10 actionWithTitle:v11 style:0 handler:v17];
    [v7 addAction:v12];

    v13 = (void *)MEMORY[0x1E4F42720];
    v14 = [v6 localizedStringForKey:@"SETTINGS" value:&stru_1F3084718 table:@"SpringBoard"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__SBDataPlanDisableAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v16[3] = &unk_1E6AF4918;
    v16[4] = self;
    v15 = [v13 actionWithTitle:v14 style:0 handler:v16];
    [v7 addAction:v15];
  }
}

uint64_t __66__SBDataPlanDisableAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

uint64_t __66__SBDataPlanDisableAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showSettings];
  v2 = *(void **)(a1 + 32);
  return [v2 deactivateForButton];
}

- (void)_showSettings
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MOBILE_DATA_SETTINGS_ID"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v2, 0, 0);
}

@end