@interface SBAppProfileNeedsValidationAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBAppProfileNeedsValidationAlertItem)initWithApp:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBAppProfileNeedsValidationAlertItem

- (SBAppProfileNeedsValidationAlertItem)initWithApp:(id)a3
{
  id v5 = a3;
  v6 = [(SBAlertItem *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_application, a3);
  }

  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  id v5 = [(SBAlertItem *)self alertController];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:@"APP_PROFILE_NEEDS_VALIDATION_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setTitle:v7];

  v8 = [(SBApplication *)self->_application info];
  v9 = [v8 signerIdentity];

  v10 = NSString;
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 localizedStringForKey:@"APP_PROFILE_NEEDS_VALIDATION_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
  v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9);

  [v5 setMessage:v13];
  v14 = [MEMORY[0x1E4F28B50] mainBundle];
  v15 = [v14 localizedStringForKey:@"APP_PROFILE_NEEDS_VALIDATION_CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__SBAppProfileNeedsValidationAlertItem_configure_requirePasscodeForActions___block_invoke;
  v17[3] = &unk_1E6AF4918;
  v17[4] = self;
  v16 = [MEMORY[0x1E4F42720] actionWithTitle:v15 style:1 handler:v17];
  [v5 addAction:v16];
}

uint64_t __76__SBAppProfileNeedsValidationAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
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