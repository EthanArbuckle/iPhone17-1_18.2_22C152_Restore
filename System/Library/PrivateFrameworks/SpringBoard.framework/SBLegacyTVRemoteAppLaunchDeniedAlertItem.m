@interface SBLegacyTVRemoteAppLaunchDeniedAlertItem
- (BOOL)dismissOnLock;
- (BOOL)ignoreIfAlreadyDisplaying;
- (id)_supportURLString;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBLegacyTVRemoteAppLaunchDeniedAlertItem

- (BOOL)dismissOnLock
{
  return 1;
}

- (BOOL)ignoreIfAlreadyDisplaying
{
  return 1;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:@"LEGACY_TVREMOTEAPP_LAUNCH_ALERT_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setTitle:v7];

  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v9 = [v8 localizedStringForKey:@"LEGACY_TVREMOTEAPP_LAUNCH_ALERT_MESSAGE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setMessage:v9];

  v10 = (void *)MEMORY[0x1E4F42720];
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 localizedStringForKey:@"LEGACY_TVREMOTEAPP_LAUNCH_BUTTON_LEARN_MORE" value:&stru_1F3084718 table:@"SpringBoard"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__SBLegacyTVRemoteAppLaunchDeniedAlertItem_configure_requirePasscodeForActions___block_invoke;
  v19[3] = &unk_1E6AF4918;
  v19[4] = self;
  v13 = [v10 actionWithTitle:v12 style:0 handler:v19];
  [v5 addAction:v13];

  v14 = (void *)MEMORY[0x1E4F42720];
  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = [v15 localizedStringForKey:@"OK" value:&stru_1F3084718 table:@"SpringBoard"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__SBLegacyTVRemoteAppLaunchDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v18[3] = &unk_1E6AF4918;
  v18[4] = self;
  v17 = [v14 actionWithTitle:v16 style:0 handler:v18];
  [v5 addAction:v17];
}

uint64_t __80__SBLegacyTVRemoteAppLaunchDeniedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [*(id *)(a1 + 32) _supportURLString];
  v4 = [v2 URLWithString:v3];
  SBWorkspaceActivateApplicationFromURL(v4, 0, 0);

  v5 = *(void **)(a1 + 32);
  return [v5 deactivateForButton];
}

uint64_t __80__SBLegacyTVRemoteAppLaunchDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (id)_supportURLString
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      return @"https://support.apple.com/ht201664?cid=mc-ols-appletv-article_ht201664-ipados_ui-10062021";
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 1) {
      return @"https://support.apple.com/ht201664?cid=mc-ols-appletv-article_ht201664-ipados_ui-10062021";
    }
  }
  return @"https://support.apple.com/ht201664?cid=mc-ols-appletv-article_ht201664-ios_ui-10062021";
}

@end