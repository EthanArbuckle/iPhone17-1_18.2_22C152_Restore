@interface SBAppFreeDevProfileNotTrustedAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBAppFreeDevProfileNotTrustedAlertItem)initWithApp:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBAppFreeDevProfileNotTrustedAlertItem

- (SBAppFreeDevProfileNotTrustedAlertItem)initWithApp:(id)a3
{
  id v5 = a3;
  v6 = [(SBAlertItem *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_app, a3);
  }

  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  id v5 = [(SBAlertItem *)self alertController];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:@"APP_FREE_DEVELOPER_PROFILE_NOT_TRUSTED_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setTitle:v7];

  v8 = [(SBApplication *)self->_app info];
  v9 = [v8 signerIdentity];

  v10 = NSString;
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"APP_FREE_DEVELOPER_PROFILE_NOT_TRUSTED_BODY"];
  v13 = [v11 localizedStringForKey:v12 value:&stru_1F3084718 table:@"SpringBoard"];
  v14 = objc_msgSend(v10, "stringWithFormat:", v13, v9);

  [v5 setMessage:v14];
  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = [v15 localizedStringForKey:@"APP_FREE_DEVELOPER_PROFILE_NOT_TRUSTED_CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__SBAppFreeDevProfileNotTrustedAlertItem_configure_requirePasscodeForActions___block_invoke;
  v18[3] = &unk_1E6AF4918;
  v18[4] = self;
  v17 = [MEMORY[0x1E4F42720] actionWithTitle:v16 style:1 handler:v18];
  [v5 addAction:v17];
}

uint64_t __78__SBAppFreeDevProfileNotTrustedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (void).cxx_destruct
{
}

@end