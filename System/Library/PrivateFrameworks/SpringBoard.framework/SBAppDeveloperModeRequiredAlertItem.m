@interface SBAppDeveloperModeRequiredAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBAppDeveloperModeRequiredAlertItem)initWithApplication:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBAppDeveloperModeRequiredAlertItem

- (SBAppDeveloperModeRequiredAlertItem)initWithApplication:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAppDeveloperModeRequiredAlertItem;
  v6 = [(SBAlertItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_application, a3);
  }

  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  id v5 = [(SBAlertItem *)self alertController];
  v6 = NSString;
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 localizedStringForKey:@"DEVELOPER_MODE_REQUIRED_ERROR_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  objc_super v9 = [v6 stringWithFormat:v8];
  [v5 setTitle:v9];

  v10 = NSString;
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 localizedStringForKey:@"DEVELOPER_MODE_REQUIRED_ERROR_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
  v13 = [(SBApplication *)self->_application displayName];
  v14 = objc_msgSend(v10, "stringWithFormat:", v12, v13);
  [v5 setMessage:v14];

  v15 = (void *)MEMORY[0x1E4F42720];
  v16 = [MEMORY[0x1E4F28B50] mainBundle];
  v17 = [v16 localizedStringForKey:@"DEVELOPER_MODE_REQUIRED_ERROR_ACKNOWLEDGE" value:&stru_1F3084718 table:@"SpringBoard"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__SBAppDeveloperModeRequiredAlertItem_configure_requirePasscodeForActions___block_invoke;
  v19[3] = &unk_1E6AF4918;
  v19[4] = self;
  v18 = [v15 actionWithTitle:v17 style:0 handler:v19];

  [v5 addAction:v18];
  [v5 setPreferredAction:v18];
}

uint64_t __75__SBAppDeveloperModeRequiredAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
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