@interface SBCarDoNotDisturbExitConfirmationAlertItem
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)showSiriHeaderViewController;
- (id)notDrivingActionHandler;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)controllerDidProvideContext:(id)a3;
- (void)setNotDrivingActionHandler:(id)a3;
- (void)setShowSiriHeaderViewController:(BOOL)a3;
@end

@implementation SBCarDoNotDisturbExitConfirmationAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v17.receiver = self;
  v17.super_class = (Class)SBCarDoNotDisturbExitConfirmationAlertItem;
  [(SBAlertItem *)&v17 configure:a3 requirePasscodeForActions:a4];
  v5 = [(SBAlertItem *)self alertController];
  [v5 setPreferredStyle:0];
  [v5 setTitle:0];
  [v5 setMessage:0];
  v6 = (void *)MEMORY[0x1E4F42720];
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 localizedStringForKey:@"CARDND_EXIT_NOT_DRIVING" value:&stru_1F3084718 table:@"SpringBoard"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__SBCarDoNotDisturbExitConfirmationAlertItem_configure_requirePasscodeForActions___block_invoke;
  v16[3] = &unk_1E6AF4918;
  v16[4] = self;
  v9 = [v6 actionWithTitle:v8 style:0 handler:v16];

  [v5 addAction:v9];
  if ([(SBCarDoNotDisturbExitConfirmationAlertItem *)self showSiriHeaderViewController])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FA4FF8]);
    [v10 setDelegate:self];
    [v5 _setSeparatedHeaderContentViewController:v10];
  }
  v11 = (void *)MEMORY[0x1E4F42720];
  v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__SBCarDoNotDisturbExitConfirmationAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v15[3] = &unk_1E6AF4918;
  v15[4] = self;
  v14 = [v11 actionWithTitle:v13 style:1 handler:v15];
  [v5 addAction:v14];
}

void __82__SBCarDoNotDisturbExitConfirmationAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) notDrivingActionHandler];
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }
}

uint64_t __82__SBCarDoNotDisturbExitConfirmationAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (void)controllerDidProvideContext:(id)a3
{
}

- (id)notDrivingActionHandler
{
  return self->_notDrivingActionHandler;
}

- (void)setNotDrivingActionHandler:(id)a3
{
}

- (BOOL)showSiriHeaderViewController
{
  return self->_showSiriHeaderViewController;
}

- (void)setShowSiriHeaderViewController:(BOOL)a3
{
  self->_showSiriHeaderViewController = a3;
}

- (void).cxx_destruct
{
}

@end