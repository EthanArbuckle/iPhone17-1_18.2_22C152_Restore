@interface SBRestoreFailureAlertItem
- (BOOL)allowInSetup;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (BOOL)suppressForKeynote;
- (void)_rebootNow;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)performUnlockAction;
- (void)restartSystemEvent;
@end

@implementation SBRestoreFailureAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3, a4);
  v6 = [(SBAlertItem *)self alertController];
  v7 = NSString;
  v8 = [v5 localizedStringForKey:@"RESTORE_FAILURE_ALERT_BODY_TEXT" value:&stru_1F3084718 table:@"SpringBoard"];
  v9 = +[SBPlatformController sharedInstance];
  v10 = [v9 localizedPlatformName];
  v11 = objc_msgSend(v7, "stringWithFormat:", v8, v10);

  [v6 setMessage:v11];
  v12 = [v5 localizedStringForKey:@"RESTORE_FAILURE_ALERT_RESTART_BUTTON_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__SBRestoreFailureAlertItem_configure_requirePasscodeForActions___block_invoke;
  v14[3] = &unk_1E6AF4918;
  v14[4] = self;
  v13 = [MEMORY[0x1E4F42720] actionWithTitle:v12 style:1 handler:v14];
  [v6 addAction:v13];
}

uint64_t __65__SBRestoreFailureAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) restartSystemEvent];
  v2 = *(void **)(a1 + 32);
  return [v2 deactivateForButton];
}

- (void)_rebootNow
{
  id v2 = [(id)SBApp restartManager];
  [v2 rebootForReason:@"SBRestoreFailureAlertItem"];
}

- (void)restartSystemEvent
{
}

- (void)performUnlockAction
{
  [(SBRestoreFailureAlertItem *)self restartSystemEvent];
  [(SBAlertItem *)self deactivate];
}

- (BOOL)allowMenuButtonDismissal
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)allowInSetup
{
  return 1;
}

- (BOOL)suppressForKeynote
{
  return 1;
}

@end