@interface SBDeleteNonAppIconAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (NSString)iconLocation;
- (SBDeleteNonAppIconAlertItem)initWithIcon:(id)a3 location:(id)a4;
- (SBIcon)icon;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)didActivate;
@end

@implementation SBDeleteNonAppIconAlertItem

- (SBDeleteNonAppIconAlertItem)initWithIcon:(id)a3 location:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isApplicationIcon])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBDeleteNonAppIconAlertItem.m", 23, @"icon must not be an applicationIcon : icon=%@", v8 object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBDeleteNonAppIconAlertItem;
  v10 = [(SBAlertItem *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_icon, a3);
    uint64_t v12 = [v9 copy];
    iconLocation = v11->_iconLocation;
    v11->_iconLocation = (NSString *)v12;
  }
  return v11;
}

- (void)didActivate
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SBDeleteNonAppIconAlertItem;
  [(SBAlertItem *)&v9 didActivate];
  uint64_t v3 = *MEMORY[0x1E4FA7450];
  v10[0] = *MEMORY[0x1E4FA7458];
  v10[1] = v3;
  iconLocation = self->_iconLocation;
  v11[0] = &unk_1F3349D10;
  v11[1] = iconLocation;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v6 = (void *)MEMORY[0x1E4FA5E78];
  id v7 = v5;
  id v8 = [v6 sharedInstance];
  [v8 emitEvent:18 withPayload:v7];
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  v6 = [(SBIcon *)self->_icon uninstallAlertTitle];
  [v5 setTitle:v6];

  id v7 = [(SBIcon *)self->_icon uninstallAlertBody];
  [v5 setMessage:v7];

  id v8 = (void *)MEMORY[0x1E4F42720];
  objc_super v9 = [(SBIcon *)self->_icon uninstallAlertConfirmTitle];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke;
  v27[3] = &unk_1E6AF4918;
  v27[4] = self;
  v10 = [v8 actionWithTitle:v9 style:2 handler:v27];

  [v5 addAction:v10];
  v11 = [(SBDeleteNonAppIconAlertItem *)self icon];
  if (![v11 isBookmarkIcon])
  {
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v12 = +[SBIconController sharedInstance];
  v13 = [(SBDeleteNonAppIconAlertItem *)self icon];
  v14 = [(SBDeleteNonAppIconAlertItem *)self iconLocation];
  int v15 = [v12 isHideSupportedForIcon:v13 inLocation:v14];

  if (v15)
  {
    objc_super v16 = [(SBDeleteNonAppIconAlertItem *)self icon];
    v17 = [v16 bookmark];
    v11 = [v17 webClip];

    if (([v11 isAppClip] & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1E4F42720];
      v19 = [MEMORY[0x1E4F28B50] mainBundle];
      v20 = [v19 localizedStringForKey:@"REMOVE_FROM_HOME_SCREEN" value:&stru_1F3084718 table:@"SpringBoard"];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_32;
      v26[3] = &unk_1E6AF4918;
      v26[4] = self;
      v21 = [v18 actionWithTitle:v20 style:0 handler:v26];
      [v5 addAction:v21];
    }
    goto LABEL_5;
  }
LABEL_6:
  v22 = (void *)MEMORY[0x1E4F42720];
  v23 = [(SBIcon *)self->_icon uninstallAlertCancelTitle];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_35;
  v25[3] = &unk_1E6AF4918;
  v25[4] = self;
  v24 = [v22 actionWithTitle:v23 style:1 handler:v25];
  [v5 addAction:v24];

  [v5 setPreferredAction:v10];
}

void __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) deactivateForButton];
  uint64_t v8 = *MEMORY[0x1E4FA7460];
  v9[0] = &unk_1F3349D28;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v3 = (void *)MEMORY[0x1E4FA5E78];
  id v4 = v2;
  v5 = [v3 sharedInstance];
  [v5 emitEvent:19 withPayload:v4];

  if ([*(id *)(*(void *)(a1 + 32) + 112) isApplicationIcon])
  {
    [*(id *)(*(void *)(a1 + 32) + 112) setUninstalledByUser:1];
    [*(id *)(*(void *)(a1 + 32) + 112) cancelDownload];
  }
  v6 = +[SBIconController sharedInstance];
  id v7 = [v6 iconManager];
  [v7 uninstallIcon:*(void *)(*(void *)(a1 + 32) + 112)];
}

void __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_32(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) deactivateForButton];
  uint64_t v8 = *MEMORY[0x1E4FA7460];
  v9[0] = &unk_1F3349D40;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v3 = (void *)MEMORY[0x1E4FA5E78];
  id v4 = v2;
  v5 = [v3 sharedInstance];
  [v5 emitEvent:19 withPayload:v4];

  v6 = +[SBIconController sharedInstance];
  id v7 = [v6 iconManager];
  [v7 addIconToIgnoredList:*(void *)(*(void *)(a1 + 32) + 112) options:1 completion:0];
}

void __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_35(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) deactivateForButton];
  uint64_t v5 = *MEMORY[0x1E4FA7460];
  v6[0] = &unk_1F3349D58;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v2 = (void *)MEMORY[0x1E4FA5E78];
  id v3 = v1;
  id v4 = [v2 sharedInstance];
  [v4 emitEvent:19 withPayload:v3];
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (SBIcon)icon
{
  return self->_icon;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end