@interface STManageContactsGroupSpecifierProvider
- (PSSpecifier)manageContactsRequestSpecifier;
- (STManageContactsGroupSpecifierProvider)init;
- (void)_communicationLimitsDidChange:(id)a3;
- (void)_showManageContactsRequestAlert:(id)a3;
- (void)_updateContactManagementState:(int64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setManageContactsRequestSpecifier:(id)a3;
@end

@implementation STManageContactsGroupSpecifierProvider

- (STManageContactsGroupSpecifierProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)STManageContactsGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v8 init];
  v3 = (void *)MEMORY[0x263F5FC40];
  v4 = +[STScreenTimeSettingsUIBundle bundle];
  v5 = [v4 localizedStringForKey:@"ManageContactsGroupSpecifierName" value:&stru_26D9391A8 table:0];
  v6 = [v3 groupSpecifierWithName:v5];
  [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v6];

  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits"];
  v6.receiver = self;
  v6.super_class = (Class)STManageContactsGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits" options:5 context:"KVOContextManageContactsGroupSpecifierProvider"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == "KVOContextManageContactsGroupSpecifierProvider")
  {
    id v12 = a3;
    [(STRootGroupSpecifierProvider *)self coordinator];

    int v13 = [v12 isEqualToString:@"contentPrivacyCoordinator.viewModel.communicationLimits"];
    if (v13)
    {
      v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      [(STManageContactsGroupSpecifierProvider *)self _communicationLimitsDidChange:v14];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STManageContactsGroupSpecifierProvider;
    id v11 = a3;
    [(STManageContactsGroupSpecifierProvider *)&v16 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (void)_communicationLimitsDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  objc_super v6 = [v5 viewModel];
  id v19 = [v6 me];

  uint64_t v7 = [v4 contactManagementState];
  if (v7 == 1 && [v19 isChild]) {
    uint64_t v8 = [v19 isRemoteUser];
  }
  else {
    uint64_t v8 = 1;
  }
  [(STGroupSpecifierProvider *)self setIsHidden:v8];
  v9 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
  if (![(STGroupSpecifierProvider *)self isHidden])
  {
    id v10 = [(STManageContactsGroupSpecifierProvider *)self manageContactsRequestSpecifier];
    char v11 = [v9 containsObject:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = +[STScreenTimeSettingsUIBundle bundle];
      int v13 = (void *)MEMORY[0x263F5FC40];
      v14 = [v12 localizedStringForKey:@"ManageContactsRequestSpecifierName" value:&stru_26D9391A8 table:0];
      v15 = [v13 preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:2 edit:0];

      [v15 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
      [v15 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
      objc_super v16 = [v12 localizedStringForKey:@"CommunicationLimitsSpecifierName" value:&stru_26D9391A8 table:0];
      [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x263F602C8]];

      v17 = [MEMORY[0x263F67408] sharedCache];
      v18 = [v17 roundedImageForImageWithName:@"Communication"];
      [v15 setObject:v18 forKeyedSubscript:*MEMORY[0x263F60140]];

      [v15 setControllerLoadAction:sel__showManageContactsRequestAlert_];
      [(STManageContactsGroupSpecifierProvider *)self setManageContactsRequestSpecifier:v15];
      [v9 addObject:v15];
    }
  }
}

- (void)_showManageContactsRequestAlert:(id)a3
{
  id v4 = +[STScreenTimeSettingsUIBundle bundle];
  v5 = [v4 localizedStringForKey:@"ManageContactsRequestAlertMessage" value:&stru_26D9391A8 table:0];
  objc_super v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = objc_msgSend(v6, "sf_isiPad");

  uint64_t v8 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:v5 preferredStyle:v7];
  v9 = [v4 localizedStringForKey:@"ManageContactsRequestApprove" value:&stru_26D9391A8 table:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__STManageContactsGroupSpecifierProvider__showManageContactsRequestAlert___block_invoke;
  v16[3] = &unk_264767658;
  v16[4] = self;
  id v10 = [MEMORY[0x263F82400] actionWithTitle:v9 style:0 handler:v16];
  [v8 addAction:v10];

  char v11 = [v4 localizedStringForKey:@"ManageContactsRequestDontApprove" value:&stru_26D9391A8 table:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__STManageContactsGroupSpecifierProvider__showManageContactsRequestAlert___block_invoke_2;
  v15[3] = &unk_264767658;
  v15[4] = self;
  id v12 = [MEMORY[0x263F82400] actionWithTitle:v11 style:2 handler:v15];
  [v8 addAction:v12];

  int v13 = [v4 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
  v14 = [MEMORY[0x263F82400] actionWithTitle:v13 style:1 handler:0];
  [v8 addAction:v14];

  [(STGroupSpecifierProvider *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __74__STManageContactsGroupSpecifierProvider__showManageContactsRequestAlert___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactManagementState:2];
}

uint64_t __74__STManageContactsGroupSpecifierProvider__showManageContactsRequestAlert___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactManagementState:0];
}

- (void)_updateContactManagementState:(int64_t)a3
{
  id v4 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v7 = [v4 contentPrivacyCoordinator];

  v5 = [v7 viewModel];
  objc_super v6 = [v5 communicationLimits];

  [v6 setContactManagementState:a3];
  [v7 saveCommunicationLimits:v6 completionHandler:0];
}

- (PSSpecifier)manageContactsRequestSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (void)setManageContactsRequestSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end