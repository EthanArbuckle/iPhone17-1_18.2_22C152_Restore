@interface SBApplicationSignatureVersionUnsupportedAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBApplicationSignatureVersionUnsupportedAlertItem)initWithApplication:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBApplicationSignatureVersionUnsupportedAlertItem

- (SBApplicationSignatureVersionUnsupportedAlertItem)initWithApplication:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBApplicationSignatureVersionUnsupportedAlertItem;
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
  v6 = [MEMORY[0x1E4F42948] currentDevice];
  v7 = [v6 systemVersion];

  v8 = NSString;
  objc_super v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 localizedStringForKey:@"SIGNATURE_VERSION_UNSUPPORTED_ERROR_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  v11 = [(SBApplication *)self->_application displayName];
  v12 = objc_msgSend(v8, "stringWithFormat:", v10, v11);
  [v5 setTitle:v12];

  v13 = NSString;
  v14 = [MEMORY[0x1E4F28B50] mainBundle];
  v15 = [v14 localizedStringForKey:@"SIGNATURE_VERSION_UNSUPPORTED_ERROR_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
  v16 = objc_msgSend(v13, "stringWithFormat:", v15, v7);
  [v5 setMessage:v16];

  v17 = (void *)MEMORY[0x1E4F42720];
  v18 = [MEMORY[0x1E4F28B50] mainBundle];
  v19 = [v18 localizedStringForKey:@"SIGNATURE_VERSION_UNSUPPORTED_ERROR_ACKNOWLEDGE" value:&stru_1F3084718 table:@"SpringBoard"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__SBApplicationSignatureVersionUnsupportedAlertItem_configure_requirePasscodeForActions___block_invoke;
  v21[3] = &unk_1E6AF4918;
  v21[4] = self;
  v20 = [v17 actionWithTitle:v19 style:0 handler:v21];

  [v5 addAction:v20];
  [v5 setPreferredAction:v20];
}

uint64_t __89__SBApplicationSignatureVersionUnsupportedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
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