@interface SBFairPlayFamilyLeaveAlertItem
- (BOOL)dismissOnLock;
- (FBSApplicationInfo)appInfo;
- (SBFairPlayFamilyLeaveAlertItem)initWithAppInfo:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setAppInfo:(id)a3;
@end

@implementation SBFairPlayFamilyLeaveAlertItem

- (SBFairPlayFamilyLeaveAlertItem)initWithAppInfo:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBFairPlayFamilyLeaveAlertItem.m", 26, @"Invalid parameter not satisfying: %@", @"appInfo" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBFairPlayFamilyLeaveAlertItem;
  v7 = [(SBAlertItem *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_appInfo, a3);
  }

  return v8;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:@"FAIRPLAY_FAMILY_LEAVE_ALERT_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setTitle:v7];

  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"FAIRPLAY_FAMILY_LEAVE_ALERT_MESSAGE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setMessage:v9];

  v10 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v11 = [v10 localizedStringForKey:@"FAIRPLAY_FAMILY_LEAVE_CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__SBFairPlayFamilyLeaveAlertItem_configure_requirePasscodeForActions___block_invoke;
  v19[3] = &unk_1E6AF4918;
  v19[4] = self;
  v12 = [MEMORY[0x1E4F42720] actionWithTitle:v11 style:1 handler:v19];
  [v5 addAction:v12];

  v13 = +[SBApplicationController sharedInstance];
  v14 = [v13 restrictionController];
  LOBYTE(v9) = [v14 isApplicationIdentifierRestricted:@"com.apple.AppStore"];

  if ((v9 & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B50] mainBundle];
    v16 = [v15 localizedStringForKey:@"FAIRPLAY_FAMILY_LEAVE_APP_STORE" value:&stru_1F3084718 table:@"SpringBoard"];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__SBFairPlayFamilyLeaveAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v18[3] = &unk_1E6AF4918;
    v18[4] = self;
    v17 = [MEMORY[0x1E4F42720] actionWithTitle:v16 style:0 handler:v18];
    [v5 addAction:v17];
  }
}

uint64_t __70__SBFairPlayFamilyLeaveAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

void __70__SBFairPlayFamilyLeaveAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = NSString;
  v4 = [*(id *)(*(void *)(a1 + 32) + 112) itemID];
  v5 = [v3 stringWithFormat:@"itms-apps://?action=lookup&ids=%@", v4];
  id v8 = [v2 URLWithString:v5];

  if ((SBWorkspaceActivateApplicationFromURL(v8, 0, 0) & 1) == 0)
  {
    id v6 = +[SBApplicationController sharedInstance];
    v7 = [v6 applicationWithBundleIdentifier:@"com.apple.AppStore"];

    if (v7) {
      SBWorkspaceActivateApplication(v7);
    }
  }
  [*(id *)(a1 + 32) deactivateForButton];
}

- (FBSApplicationInfo)appInfo
{
  return self->_appInfo;
}

- (void)setAppInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end