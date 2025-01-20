@interface ICSKeychainSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (ICSKeychainSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)specifiers;
- (iCloudHomeViewModel)homeViewModel;
- (id)_keychainSyncStateForSpecifier:(id)a3;
- (id)_specifierForKeychainSync;
- (id)account;
- (void)_keychainSyncStateDidChange;
- (void)_refreshKeychainState;
- (void)_registerForKeychainSyncStatusChangeNotification;
- (void)_stopListeningForKeychainSyncStatusChangeNotification;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setHomeViewModel:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICSKeychainSpecifierProvider

- (ICSKeychainSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSKeychainSpecifierProvider;
  v6 = [(ICSKeychainSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v7->_keychainStatus = 0;
    v7->_keychainStatusFetchInProgress = 0;
    [(ICSKeychainSpecifierProvider *)v7 _registerForKeychainSyncStatusChangeNotification];
  }

  return v7;
}

- (void)dealloc
{
  [(ICSKeychainSpecifierProvider *)self _stopListeningForKeychainSyncStatusChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)ICSKeychainSpecifierProvider;
  [(ICSKeychainSpecifierProvider *)&v3 dealloc];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  objc_super v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (NSArray)specifiers
{
  v9[1] = *MEMORY[0x263EF8340];
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    uint64_t v4 = [(ICSKeychainSpecifierProvider *)self _specifierForKeychainSync];
    id v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      v7 = self->_specifiers;
      self->_specifiers = v6;
    }
    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (id)_specifierForKeychainSync
{
  objc_super v3 = [MEMORY[0x263F53C50] sharedConnection];
  char v4 = [v3 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53868]];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x263F5FC40];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"KEYCHAIN_SPECIFIER_NAME" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    id v5 = [v6 preferenceSpecifierNamed:v8 target:self set:0 get:sel__keychainSyncStateForSpecifier_ detail:objc_opt_class() cell:2 edit:0];

    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    [v5 setObject:@"com.apple.Passwords" forKeyedSubscript:*MEMORY[0x263F60188]];
    uint64_t v9 = *MEMORY[0x263EFACB0];
    [v5 setObject:*MEMORY[0x263EFACB0] forKeyedSubscript:*MEMORY[0x263F60138]];
    [v5 setObject:v9 forKeyedSubscript:@"com.apple.accountsui.dataclass"];
  }

  return v5;
}

- (id)_keychainSyncStateForSpecifier:(id)a3
{
  id v5 = a3;
  unint64_t keychainStatus = self->_keychainStatus;
  if (keychainStatus == 2)
  {
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = v7;
    uint64_t v9 = @"ON";
  }
  else if (keychainStatus == 1)
  {
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = v7;
    uint64_t v9 = @"OFF";
  }
  else
  {
    if (keychainStatus) {
      goto LABEL_8;
    }
    [(ICSKeychainSpecifierProvider *)self _refreshKeychainState];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = v7;
    uint64_t v9 = @"LOADING_CELL";
  }
  objc_super v3 = [v7 localizedStringForKey:v9 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

LABEL_8:

  return v3;
}

- (void)_refreshKeychainState
{
  if (self->_keychainStatusFetchInProgress)
  {
    v2 = LogSubsystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Keychain status fetch is already in progress. Bailing!", buf, 2u);
    }
  }
  else
  {
    self->_keychainStatusFetchInProgress = 1;
    char v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__ICSKeychainSpecifierProvider__refreshKeychainState__block_invoke;
    block[3] = &unk_2655B5688;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

void __53__ICSKeychainSpecifierProvider__refreshKeychainState__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v2 = +[ICSKeychainSyncController isKeychainSyncEnabled];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  objc_super v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v9 = v2;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "isKeychainSyncEnabled: %d", buf, 8u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v2)
  {
    if (v5 == 2) {
      return;
    }
    uint64_t v6 = 2;
  }
  else
  {
    if (v5 == 1) {
      return;
    }
    uint64_t v6 = 1;
  }
  *(void *)(v4 + 16) = v6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ICSKeychainSpecifierProvider__refreshKeychainState__block_invoke_70;
  block[3] = &unk_2655B5688;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__ICSKeychainSpecifierProvider__refreshKeychainState__block_invoke_70(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v2 = LogSubsystem();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  uint64_t v4 = (void *)MEMORY[0x263EFACB0];
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x263EFACB0];
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Reloading specifier with ID: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v8 reloadSpecifierForProvider:*(void *)(a1 + 32) identifier:*v4];
  }
}

- (void)_registerForKeychainSyncStatusChangeNotification
{
  objc_initWeak(&location, self);
  BOOL v3 = (const char *)*MEMORY[0x263F16DA0];
  uint64_t v4 = dispatch_get_global_queue(2, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke;
  handler[3] = &unk_2655B5BA0;
  objc_copyWeak(&v12, &location);
  notify_register_dispatch(v3, &self->_keychainSyncNotificationToken, v4, handler);

  uint64_t v5 = (const char *)*MEMORY[0x263F16E00];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke_2;
  v9[3] = &unk_2655B5BA0;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v5, &self->_keychainSyncNotificationToken, v4, v9);

  uint64_t v6 = (const char *)*MEMORY[0x263F16E10];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke_3;
  v7[3] = &unk_2655B5BA0;
  objc_copyWeak(&v8, &location);
  notify_register_dispatch(v6, &self->_keychainSyncNotificationToken, v4, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStateDidChange];
}

void __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStateDidChange];
}

void __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStateDidChange];
}

- (void)_stopListeningForKeychainSyncStatusChangeNotification
{
}

- (void)_keychainSyncStateDidChange
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    char v7 = v5;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "%@ received keychain sync state change notification.", (uint8_t *)&v6, 0xCu);
  }
  [(ICSKeychainSpecifierProvider *)self _refreshKeychainState];
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

- (iCloudHomeViewModel)homeViewModel
{
  return self->_homeViewModel;
}

- (void)setHomeViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeViewModel, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end