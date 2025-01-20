@interface SBAppProfileExpiredAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBAppProfileExpiredAlertItem)initWithApp:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBAppProfileExpiredAlertItem

- (SBAppProfileExpiredAlertItem)initWithApp:(id)a3
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
  v6 = [(SBApplication *)self->_app displayName];
  v7 = [(SBApplication *)self->_app info];
  int v8 = [v7 isBeta];

  v9 = NSString;
  v10 = [MEMORY[0x1E4F28B50] mainBundle];
  v11 = v10;
  if (v8) {
    v12 = @"APP_BETA_EXPIRED_TITLE_WITH_NAME_FORMAT";
  }
  else {
    v12 = @"APP_PROFILE_EXPIRED_TITLE_WITH_NAME_FORMAT";
  }
  v13 = [v10 localizedStringForKey:v12 value:&stru_1F3084718 table:@"SpringBoard"];
  v14 = objc_msgSend(v9, "stringWithFormat:", v13, v6);

  [v5 setTitle:v14];
  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = [v15 localizedStringForKey:@"APP_PROFILE_EXPIRED_OK" value:&stru_1F3084718 table:@"SpringBoard"];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__SBAppProfileExpiredAlertItem_configure_requirePasscodeForActions___block_invoke;
  v18[3] = &unk_1E6AF4918;
  v18[4] = self;
  v17 = [MEMORY[0x1E4F42720] actionWithTitle:v16 style:1 handler:v18];
  [v5 addAction:v17];
}

uint64_t __68__SBAppProfileExpiredAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
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