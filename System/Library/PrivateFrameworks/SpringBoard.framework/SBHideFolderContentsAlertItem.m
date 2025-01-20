@interface SBHideFolderContentsAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (NSString)iconLocation;
- (SBHideFolderContentsAlertItem)initWithIcon:(id)a3 location:(id)a4;
- (SBIcon)icon;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)didActivate;
@end

@implementation SBHideFolderContentsAlertItem

- (SBHideFolderContentsAlertItem)initWithIcon:(id)a3 location:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 isFolderIcon] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBHideFolderContentsAlertItem.m", 19, @"icon must be a folder icon : icon=%@", v8 object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBHideFolderContentsAlertItem;
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
  v9.super_class = (Class)SBHideFolderContentsAlertItem;
  [(SBAlertItem *)&v9 didActivate];
  uint64_t v3 = *MEMORY[0x1E4FA7450];
  v10[0] = *MEMORY[0x1E4FA7458];
  v10[1] = v3;
  iconLocation = self->_iconLocation;
  v11[0] = &unk_1F334A4F0;
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
  v6 = [(SBHideFolderContentsAlertItem *)self icon];
  id v7 = NSString;
  id v8 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v9 = [v8 localizedStringForKey:@"ADD_FOLDER_TO_LIBRARY_ALERT_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  v10 = [v6 displayName];
  v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);
  [v5 setTitle:v11];

  uint64_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 localizedStringForKey:@"ADD_FOLDER_TO_LIBRARY_ALERT_MESSAGE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setMessage:v13];

  v14 = (void *)MEMORY[0x1E4F42720];
  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v16 = [v15 localizedStringForKey:@"REMOVE_FROM_HOME_SCREEN" value:&stru_1F3084718 table:@"SpringBoard"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__SBHideFolderContentsAlertItem_configure_requirePasscodeForActions___block_invoke;
  v23[3] = &unk_1E6AF48F0;
  v23[4] = self;
  id v24 = v6;
  id v17 = v6;
  v18 = [v14 actionWithTitle:v16 style:0 handler:v23];

  [v5 addAction:v18];
  v19 = (void *)MEMORY[0x1E4F42720];
  v20 = [(SBIcon *)self->_icon uninstallAlertCancelTitle];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__SBHideFolderContentsAlertItem_configure_requirePasscodeForActions___block_invoke_33;
  v22[3] = &unk_1E6AF4918;
  v22[4] = self;
  v21 = [v19 actionWithTitle:v20 style:1 handler:v22];
  [v5 addAction:v21];

  [v5 setPreferredAction:v18];
}

void __69__SBHideFolderContentsAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) deactivateForButton];
  uint64_t v8 = *MEMORY[0x1E4FA7460];
  v9[0] = &unk_1F334A508;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v3 = (void *)MEMORY[0x1E4FA5E78];
  id v4 = v2;
  v5 = [v3 sharedInstance];
  [v5 emitEvent:19 withPayload:v4];

  v6 = +[SBIconController sharedInstance];
  id v7 = [v6 iconManager];
  [v7 addIconToIgnoredList:*(void *)(a1 + 40) options:1 completion:0];
}

void __69__SBHideFolderContentsAlertItem_configure_requirePasscodeForActions___block_invoke_33(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) deactivateForButton];
  uint64_t v5 = *MEMORY[0x1E4FA7460];
  v6[0] = &unk_1F334A520;
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