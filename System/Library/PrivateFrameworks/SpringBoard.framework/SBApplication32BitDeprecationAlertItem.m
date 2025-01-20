@interface SBApplication32BitDeprecationAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBApplication)associatedDisplay;
- (SBApplication32BitDeprecationAlertItem)initWithApplication:(id)a3;
- (id)_message;
- (id)_title;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setAssociatedDisplay:(id)a3;
@end

@implementation SBApplication32BitDeprecationAlertItem

- (SBApplication32BitDeprecationAlertItem)initWithApplication:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBApplication32BitDeprecationAlertItem;
  v5 = [(SBAlertItem *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_associatedDisplay, v4);
  }

  return v6;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  v6 = [(SBApplication32BitDeprecationAlertItem *)self _title];
  [v5 setTitle:v6];

  v7 = [(SBApplication32BitDeprecationAlertItem *)self _message];
  [v5 setMessage:v7];

  objc_super v8 = (void *)MEMORY[0x1E4F42720];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 localizedStringForKey:@"DEPRECATED_32_BIT_APP_SECONDARY_NO_UPDATE" value:&stru_1F3084718 table:@"SpringBoard"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__SBApplication32BitDeprecationAlertItem_configure_requirePasscodeForActions___block_invoke;
  v17[3] = &unk_1E6AF4918;
  v17[4] = self;
  v11 = [v8 actionWithTitle:v10 style:0 handler:v17];

  [v5 addAction:v11];
  v12 = (void *)MEMORY[0x1E4F42720];
  v13 = [MEMORY[0x1E4F28B50] mainBundle];
  v14 = [v13 localizedStringForKey:@"DEPRECATED_32_BIT_APP_ACKNOWLEDGE" value:&stru_1F3084718 table:@"SpringBoard"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__SBApplication32BitDeprecationAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v16[3] = &unk_1E6AF4918;
  v16[4] = self;
  v15 = [v12 actionWithTitle:v14 style:0 handler:v16];

  [v5 addAction:v15];
  [v5 setPreferredAction:v15];
}

uint64_t __78__SBApplication32BitDeprecationAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=About/APPLICATIONS"];
  SBWorkspaceActivateApplicationFromURL(v2, 0, 0);

  v3 = *(void **)(a1 + 32);
  return [v3 deactivateForButton];
}

uint64_t __78__SBApplication32BitDeprecationAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
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

- (id)_title
{
  v3 = NSString;
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 localizedStringForKey:@"DEPRECATED_32_BIT_APP_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedDisplay);
  v7 = [WeakRetained displayName];
  objc_super v8 = objc_msgSend(v3, "stringWithFormat:", v5, v7);

  return v8;
}

- (id)_message
{
  v2 = NSString;
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 localizedStringForKey:@"DEPRECATED_32_BIT_APP_BODY_NO_UPDATE_NO_SYSTEM_VERSION" value:&stru_1F3084718 table:@"SpringBoard"];
  v5 = [v2 stringWithFormat:v4];

  return v5;
}

- (SBApplication)associatedDisplay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedDisplay);
  return (SBApplication *)WeakRetained;
}

- (void)setAssociatedDisplay:(id)a3
{
}

- (void).cxx_destruct
{
}

@end