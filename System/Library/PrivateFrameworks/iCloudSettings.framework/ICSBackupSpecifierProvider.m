@interface ICSBackupSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (ACAccount)account;
- (BOOL)_shouldShowBackupSpecifier;
- (ICSBackupSpecifierProvider)initWithAccountManager:(id)a3;
- (ICSBackupSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (id)_dataclassState:(id)a3;
- (id)_iCloudBackupSpecifier;
- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4;
- (void)_backupSpecifierWasTapped:(id)a3;
- (void)_showBackupController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICSBackupSpecifierProvider

- (ICSBackupSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSBackupSpecifierProvider;
  v9 = [(ICSBackupSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
  }

  return v10;
}

- (ICSBackupSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(ICSBackupSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (NSArray)specifiers
{
  v9[1] = *MEMORY[0x263EF8340];
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    uint64_t v4 = [(ICSBackupSpecifierProvider *)self _iCloudBackupSpecifier];
    v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      id v7 = self->_specifiers;
      self->_specifiers = v6;
    }
    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (ACAccount)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return (ACAccount *)v3;
}

- (id)_iCloudBackupSpecifier
{
  if ([(ICSBackupSpecifierProvider *)self _shouldShowBackupSpecifier])
  {
    v3 = (void *)MEMORY[0x263F5FC40];
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"ICLOUD_BACKUP_SPECIFIER_NAME" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:sel__dataclassState_ detail:0 cell:2 edit:0];

    [v6 setControllerLoadAction:sel__backupSpecifierWasTapped_];
    [v6 setObject:@"BACKUP" forKeyedSubscript:*MEMORY[0x263F60138]];
    id v7 = +[ICSDefaultIconLoader tableIconWithType:0 drawBorder:1];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60140]];

    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"BACKUP_CELL_LABEL" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    [v6 setName:v9];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldShowBackupSpecifier
{
  v3 = [(ICSBackupSpecifierProvider *)self account];
  char v4 = objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x263F25608]);

  if (v4) {
    return 0;
  }
  v6 = [(ICSBackupSpecifierProvider *)self account];
  char v7 = [v6 isProvisionedForDataclass:*MEMORY[0x263EFAC20]];

  return v7;
}

- (id)_dataclassState:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    int v8 = [v7 specifierProvider:self isDataclassAvailableForSpecifier:v4];

    if (v8)
    {
      v9 = [(ICSBackupSpecifierProvider *)self account];
      char v10 = [v9 isEnabledForDataclass:*MEMORY[0x263EFAC20]];

      if (v10)
      {
        v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        objc_super v12 = v11;
        v13 = @"ON";
        goto LABEL_9;
      }
    }
  }
  else
  {
    v14 = LogSubsystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICSPhotoStreamSpecifierProvider _isPhotoStreamEnabled:]((id *)&self->_delegate, v14);
    }
  }
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v12 = v11;
  v13 = @"OFF";
LABEL_9:
  v15 = [v11 localizedStringForKey:v13 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  return v15;
}

- (void)_backupSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__ICSBackupSpecifierProvider__backupSpecifierWasTapped___block_invoke;
    v8[3] = &unk_2655B5EC0;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v7 validateDataclassAccessForProvider:self specifier:v9 completion:v8];

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

void __56__ICSBackupSpecifierProvider__backupSpecifierWasTapped___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
  {
    id v5 = WeakRetained;
    [WeakRetained _showBackupController:*(void *)(a1 + 32)];
    id WeakRetained = v5;
  }
}

- (void)_showBackupController:(id)a3
{
  id v12 = a3;
  id v4 = objc_alloc(MEMORY[0x263F88A08]);
  id v5 = [(ICSBackupSpecifierProvider *)self account];
  char v6 = (void *)[v4 initWithAccount:v5];

  if (v6)
  {
    [v6 setSpecifier:v12];
    p_listController = &self->_listController;
    id WeakRetained = objc_loadWeakRetained((id *)p_listController);
    [v6 setParentController:WeakRetained];

    id v9 = objc_loadWeakRetained((id *)p_listController);
    id v10 = [v9 rootController];
    [v6 setRootController:v10];

    id v11 = objc_loadWeakRetained((id *)p_listController);
    [v11 showController:v6 animate:1];
  }
}

- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v6 = (NSString *)a3;
  id v7 = a4;
  int v8 = NSClassFromString(v6);
  if ([(objc_class *)v8 conformsToProtocol:&unk_270E21F68])
  {
    id v9 = (void *)[[v8 alloc] initWithAccountManager:self->_accountManager];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    [v9 setDelegate:WeakRetained];
  }
  else
  {
    id v11 = LogSubsystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543874;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v6;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_error_impl(&dword_262993000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v13, 0x20u);
    }

    id v9 = 0;
  }

  return v9;
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_listController);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end