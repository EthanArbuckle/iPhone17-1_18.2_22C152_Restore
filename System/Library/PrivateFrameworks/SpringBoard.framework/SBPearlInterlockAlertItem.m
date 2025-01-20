@interface SBPearlInterlockAlertItem
- (BOOL)reappearsAfterLock;
- (BOOL)shouldShowInLockScreen;
- (id)_message;
- (id)_title;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBPearlInterlockAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  v6 = [(SBPearlInterlockAlertItem *)self _title];
  [v5 setTitle:v6];

  v7 = [(SBPearlInterlockAlertItem *)self _message];
  [v5 setMessage:v7];

  v8 = (void *)MEMORY[0x1E4F42720];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 localizedStringForKey:@"FACE_ID_DISABLED_GO_TO_SETTINGS" value:&stru_1F3084718 table:@"SpringBoard"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__SBPearlInterlockAlertItem_configure_requirePasscodeForActions___block_invoke;
  v17[3] = &unk_1E6AF4918;
  v17[4] = self;
  v11 = [v8 actionWithTitle:v10 style:0 handler:v17];

  [v5 addAction:v11];
  v12 = (void *)MEMORY[0x1E4F42720];
  v13 = [MEMORY[0x1E4F28B50] mainBundle];
  v14 = [v13 localizedStringForKey:@"FACE_ID_DISABLED_CLOSE" value:&stru_1F3084718 table:@"SpringBoard"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__SBPearlInterlockAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v16[3] = &unk_1E6AF4918;
  v16[4] = self;
  v15 = [v12 actionWithTitle:v14 style:0 handler:v16];

  [v5 addAction:v15];
  [v5 setPreferredAction:v11];
}

uint64_t __65__SBPearlInterlockAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ROOT"];
  SBWorkspaceActivateApplicationFromURL(v2, 0, 0);

  v3 = *(void **)(a1 + 32);
  return [v3 deactivateForButton];
}

uint64_t __65__SBPearlInterlockAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)reappearsAfterLock
{
  return 1;
}

- (id)_title
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"FACE_ID_DISABLED_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (id)_message
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"FACE_ID_DISABLED_BODY" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

@end