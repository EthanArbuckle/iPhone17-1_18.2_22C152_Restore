@interface SBVPPAppRequiresHealingAlertItem
- (BOOL)dismissOnLock;
- (BOOL)shouldShowInLockScreen;
- (SBVPPAppRequiresHealingAlertItem)initWithApplication:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBVPPAppRequiresHealingAlertItem

- (SBVPPAppRequiresHealingAlertItem)initWithApplication:(id)a3
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
  v7 = [v6 localizedStringForKey:@"APP_REPAIR_REQUIRES_NETWORK_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setTitle:v7];

  v8 = [(SBApplication *)self->_application displayName];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 localizedStringForKey:@"APP_REPAIR_REQUIRES_NETWORK_MESSAGE" value:&stru_1F3084718 table:@"SpringBoard"];

  v11 = NSString;
  v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 localizedStringForKey:v10 value:&stru_1F3084718 table:@"SpringBoard"];
  v14 = objc_msgSend(v11, "stringWithFormat:", v13, v8);

  [v5 setMessage:v14];
  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = [v15 localizedStringForKey:@"APP_REPAIR_REQUIRES_NETWORK_OK" value:&stru_1F3084718 table:@"SpringBoard"];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__SBVPPAppRequiresHealingAlertItem_configure_requirePasscodeForActions___block_invoke;
  v18[3] = &unk_1E6AF4918;
  v18[4] = self;
  v17 = [MEMORY[0x1E4F42720] actionWithTitle:v16 style:1 handler:v18];
  [v5 addAction:v17];
}

uint64_t __72__SBVPPAppRequiresHealingAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (void).cxx_destruct
{
}

@end