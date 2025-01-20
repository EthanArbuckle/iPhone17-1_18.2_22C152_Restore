@interface ICSDataclassViewController
- (AIDAAccountManager)accountManager;
- (BOOL)_isDataclassAvailableForSpecifier:(id)a3;
- (BOOL)_shouldContinueDataclassChangeForSpecifier:(id)a3;
- (BOOL)specifierProvider:(id)a3 isDataclassAvailableForSpecifier:(id)a4;
- (ICSDataclassViewController)init;
- (PSSpecifier)activeSpecifier;
- (id)account;
- (id)dataclassSwitchStateForSpecifier:(id)a3;
- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4;
- (id)specifierProvider:(id)a3 dataclassSwitchStateForSpecifier:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:(id)a3 toAccount:(id)a4;
- (void)_dataclassSwitchStateDidChange:(id)a3 forSpecifier:(id)a4;
- (void)_startObservingAccountStoreChanges;
- (void)_startObservingRestrictionChanges;
- (void)_stopObservingAccountStoreChanges;
- (void)_stopObservingRestrictionChanges;
- (void)_superDataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4;
- (void)_validateDataclassAccessForSpecifier:(id)a3 completion:(id)a4;
- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4;
- (void)accountManager;
- (void)cleanupDataclassSpecifiers;
- (void)dealloc;
- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5;
- (void)operationsHelper:(id)a3 didLoadSaveActions:(id)a4 forDataclass:(id)a5 withAccount:(id)a6 error:(id)a7;
- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4;
- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setAccountManager:(id)a3;
- (void)setActiveSpecifier:(id)a3;
- (void)specifierProvider:(id)a3 dataclassSwitchStateDidChange:(id)a4 withSpecifier:(id)a5;
- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4;
- (void)startSpinnerInSpecifier:(id)a3;
- (void)stopSpinnerInActiveSpecifier;
- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5;
@end

@implementation ICSDataclassViewController

- (ICSDataclassViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICSDataclassViewController;
  v2 = [(ACUIDataclassConfigurationViewController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(ACUIDataclassConfigurationViewController *)v2 setShouldShowDeleteAccountButton:0];
    [(ACUIDataclassConfigurationViewController *)v3 setShouldEnableDeleteAccountButton:0];
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appleaccountsettings.accountwork", v4);
    accountWorkQueue = v3->_accountWorkQueue;
    v3->_accountWorkQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (AIDAAccountManager)accountManager
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  accountManager = self->_accountManager;
  if (!accountManager)
  {
    v4 = [(ICSDataclassViewController *)self specifier];

    if (v4)
    {
      dispatch_queue_t v5 = [(ICSDataclassViewController *)self specifier];
      v6 = [v5 objectForKeyedSubscript:@"icloudAccountManager"];

      v7 = LogSubsystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, "specifierAccountManager %@", buf, 0xCu);
      }

      if (v6) {
        [(ICSDataclassViewController *)self setAccountManager:v6];
      }
    }
    accountManager = self->_accountManager;
    if (!accountManager)
    {
      objc_super v8 = LogSubsystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[ICSDataclassViewController accountManager]();
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__ICSDataclassViewController_accountManager__block_invoke;
      block[3] = &unk_2655B5688;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
      accountManager = self->_accountManager;
    }
  }

  return accountManager;
}

void __44__ICSDataclassViewController_accountManager__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
  id v5 = a3;
  v6 = [ICSDataclassValidationController alloc];
  v7 = [(ICSDataclassViewController *)self account];
  objc_super v8 = [(ICSDataclassValidationController *)v6 initWithAccount:v7 presentingViewController:self];
  dataclassValidationController = self->_dataclassValidationController;
  self->_dataclassValidationController = v8;

  [(ICSDataclassValidationController *)self->_dataclassValidationController setDelegate:self];
  [(ICSDataclassViewController *)self _startObservingAccountStoreChanges];

  [(ICSDataclassViewController *)self _startObservingRestrictionChanges];
}

- (id)account
{
  id v2 = [(ICSDataclassViewController *)self accountManager];
  v3 = [v2 accounts];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v4;
}

- (void)dealloc
{
  [(ICSDataclassViewController *)self _stopObservingRestrictionChanges];
  [(ICSDataclassViewController *)self _stopObservingAccountStoreChanges];
  v3.receiver = self;
  v3.super_class = (Class)ICSDataclassViewController;
  [(ACUIDataclassConfigurationViewController *)&v3 dealloc];
}

- (void)cleanupDataclassSpecifiers
{
  id v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
  }
}

- (void)startSpinnerInSpecifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    p_activeSpecifier = &self->_activeSpecifier;
    if (!*p_activeSpecifier)
    {
      if (objc_msgSend(v5, "ics_startSpinner")) {
        objc_storeStrong((id *)p_activeSpecifier, a3);
      }
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)stopSpinnerInActiveSpecifier
{
  activeSpecifier = self->_activeSpecifier;
  if (activeSpecifier)
  {
    [(PSSpecifier *)activeSpecifier ics_stopSpinner];
    v4 = self->_activeSpecifier;
    self->_activeSpecifier = 0;
  }
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_super v8 = LogSubsystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "showViewController for provider %@", (uint8_t *)&v9, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [(ICSDataclassViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else {
    [(ICSDataclassViewController *)self showViewController:v7 sender:v6];
  }
}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_super v8 = LogSubsystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "willBeginLoadingSpecifier for provider %@", (uint8_t *)&v10, 0xCu);
  }

  if (self->_activeSpecifier)
  {
    int v9 = LogSubsystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICSDataclassViewController specifierProvider:willBeginLoadingSpecifier:]((uint64_t)v6, v9);
    }
  }
  else
  {
    [(ICSDataclassViewController *)self startSpinnerInSpecifier:v7];
  }
}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v6 = LogSubsystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "didFinishLoadingSpecifier for provider %@", (uint8_t *)&v8, 0xCu);
  }

  if (self->_activeSpecifier)
  {
    [(ICSDataclassViewController *)self stopSpinnerInActiveSpecifier];
  }
  else
  {
    id v7 = LogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICSDataclassViewController specifierProvider:didFinishLoadingSpecifier:]((uint64_t)v5, v7);
    }
  }
}

- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v9 = LogSubsystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(ICSDataclassViewController *)self specifierForID:v8];
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_262993000, v9, OS_LOG_TYPE_DEFAULT, "Inserting new specifier %@ after %@", (uint8_t *)&v16, 0x16u);
  }
  if ([*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) containsObject:v7])
  {
    id v11 = LogSubsystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      uint64_t v12 = "Did not insert new specifier because it's already present";
      uint64_t v13 = v11;
      uint32_t v14 = 2;
LABEL_8:
      _os_log_impl(&dword_262993000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }
  else
  {
    v15 = [(ICSDataclassViewController *)self specifierForID:v8];
    [(ICSDataclassViewController *)self insertSpecifier:v7 afterSpecifier:v15 animated:1];

    id v11 = LogSubsystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      uint64_t v12 = "Inserted new specifier %@";
      uint64_t v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_8;
    }
  }
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v10 = LogSubsystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_262993000, v10, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v12, 0xCu);
  }

  if ([v9 count])
  {
    id v11 = [v8 specifiers];
    [(ICSDataclassViewController *)self replaceContiguousSpecifiers:v9 withSpecifiers:v11 animated:v5];
  }
  else
  {
    [(ICSDataclassViewController *)self reloadSpecifiers];
  }
}

- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v6 = LogSubsystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "Reloading specifier with ID: %@", (uint8_t *)&v7, 0xCu);
  }

  [(ICSDataclassViewController *)self reloadSpecifierID:v5];
}

- (void)specifierProvider:(id)a3 dataclassSwitchStateDidChange:(id)a4 withSpecifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(ICSDataclassViewController *)self _dataclassSwitchStateDidChange:v8 forSpecifier:v7];
}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = LogSubsystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_262993000, v11, OS_LOG_TYPE_DEFAULT, "validateDataclassAccessForProvider. provider: %@, specifier: %@", (uint8_t *)&v12, 0x16u);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(ICSDataclassViewController *)self _validateDataclassAccessForSpecifier:v9 completion:v10];
}

- (BOOL)specifierProvider:(id)a3 isDataclassAvailableForSpecifier:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  LOBYTE(self) = [(ICSDataclassViewController *)self _isDataclassAvailableForSpecifier:v5];

  return (char)self;
}

- (id)specifierProvider:(id)a3 dataclassSwitchStateForSpecifier:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(ICSDataclassViewController *)self _isDataclassAvailableForSpecifier:v5])
  {
    id v6 = objc_msgSend(v5, "acui_dataclass");
    id v7 = NSNumber;
    id v8 = [(ICSDataclassViewController *)self account];
    id v9 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isEnabledForDataclass:", v6));
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFFA80];
  }

  return v9;
}

- (id)dataclassSwitchStateForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "acui_dataclass");
  if ([(ICSDataclassValidationController *)self->_dataclassValidationController isDataclassAvailable:v5])
  {
    v8.receiver = self;
    v8.super_class = (Class)ICSDataclassViewController;
    id v6 = [(ACUIDataclassConfigurationViewController *)&v8 dataclassSwitchStateForSpecifier:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA80];
  }

  return v6;
}

- (void)_dataclassSwitchStateDidChange:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 BOOLValue]
    && ![(ICSDataclassViewController *)self _shouldContinueDataclassChangeForSpecifier:v7])
  {
    [(ICSDataclassViewController *)self reloadSpecifier:v7];
  }
  else
  {
    objc_super v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F60138]];
    if ([v8 isEqualToString:*MEMORY[0x263EFAC90]])
    {
      [(ICSDataclassViewController *)self reloadSpecifier:v7];
    }
    else
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __74__ICSDataclassViewController__dataclassSwitchStateDidChange_forSpecifier___block_invoke;
      v9[3] = &unk_2655B62B8;
      objc_copyWeak(&v12, &location);
      id v10 = v7;
      id v11 = v6;
      [(ICSDataclassViewController *)self _validateDataclassAccessForSpecifier:v10 completion:v9];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __74__ICSDataclassViewController__dataclassSwitchStateDidChange_forSpecifier___block_invoke(id *a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__ICSDataclassViewController__dataclassSwitchStateDidChange_forSpecifier___block_invoke_2;
    block[3] = &unk_2655B5C18;
    id v7 = WeakRetained;
    id v8 = a1[4];
    id v9 = a1[5];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __74__ICSDataclassViewController__dataclassSwitchStateDidChange_forSpecifier___block_invoke_2(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 1632), *(id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 32);

  return [v4 _superDataclassSwitchStateDidChange:v2 withSpecifier:v3];
}

- (BOOL)_shouldContinueDataclassChangeForSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __73__ICSDataclassViewController__shouldContinueDataclassChangeForSpecifier___block_invoke;
  v23 = &unk_2655B5978;
  v24 = self;
  id v5 = v4;
  id v25 = v5;
  id v6 = _Block_copy(&v20);
  id v7 = objc_msgSend(v5, "acui_dataclass", v20, v21, v22, v23, v24);
  if ([v7 isEqualToString:*MEMORY[0x263EFACB8]])
  {
    id v8 = [(ICSDataclassViewController *)self account];
    int v9 = objc_msgSend(v8, "aa_needsEmailConfiguration");
  }
  else
  {
    int v9 = 0;
  }

  id v10 = objc_msgSend(v5, "acui_dataclass");
  if ([v10 isEqualToString:*MEMORY[0x263EFACE8]])
  {
    id v11 = [(ICSDataclassViewController *)self account];
    if (objc_msgSend(v11, "aa_isPrimaryAccount"))
    {
      int v12 = 0;
    }
    else
    {
      id v13 = [(ICSDataclassViewController *)self account];
      int v12 = objc_msgSend(v13, "aa_needsEmailConfiguration");
    }
  }
  else
  {
    int v12 = 0;
  }

  int v14 = v9 | v12;
  if (v14 == 1)
  {
    id v15 = [ICSMailConfigController alloc];
    uint64_t v16 = [(ICSDataclassViewController *)self account];
    id v17 = [(ICSMailConfigController *)v15 initWithAccount:v16 presenter:self];
    mailConfigController = self->_mailConfigController;
    self->_mailConfigController = v17;

    [(ICSMailConfigController *)self->_mailConfigController presentCreateFreeEmailPromptWithCompletion:v6 isForNotes:v9 ^ 1u];
  }

  return v14 ^ 1;
}

void __73__ICSDataclassViewController__shouldContinueDataclassChangeForSpecifier___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ICSDataclassViewController__shouldContinueDataclassChangeForSpecifier___block_invoke_2;
  block[3] = &unk_2655B62E0;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __73__ICSDataclassViewController__shouldContinueDataclassChangeForSpecifier___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(id **)(a1 + 32);
  if (v2) {
    return [v3 reloadSpecifier:*(void *)(a1 + 40)];
  }
  else {
    return [v3[203] configureEmailAccount];
  }
}

- (void)_validateDataclassAccessForSpecifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (self->_activeSpecifier)
  {
    [(ICSDataclassViewController *)self reloadSpecifier:v6];
    v7[2](v7, 0);
  }
  else
  {
    [(ICSDataclassViewController *)self startSpinnerInSpecifier:v6];
    objc_initWeak(&location, self);
    id v8 = objc_msgSend(v6, "acui_dataclass");
    dataclassValidationController = self->_dataclassValidationController;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __78__ICSDataclassViewController__validateDataclassAccessForSpecifier_completion___block_invoke;
    v10[3] = &unk_2655B6308;
    objc_copyWeak(&v13, &location);
    id v11 = v6;
    int v12 = v7;
    [(ICSDataclassValidationController *)dataclassValidationController validateAccessForDataclass:v8 completion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __78__ICSDataclassViewController__validateDataclassAccessForSpecifier_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "_validateDataclassAccessForSpecifier shouldContinue: %d", (uint8_t *)v6, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained stopSpinnerInActiveSpecifier];
  if ((a2 & 1) == 0) {
    [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_superDataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogSubsystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ([v6 BOOLValue]) {
      int v9 = @"YES";
    }
    else {
      int v9 = @"NO";
    }
    id v10 = [v7 name];
    *(_DWORD *)buf = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "Dataclass switch state changed to %@: %@", buf, 0x16u);
  }
  v11.receiver = self;
  v11.super_class = (Class)ICSDataclassViewController;
  [(ACUIDataclassConfigurationViewController *)&v11 dataclassSwitchStateDidChange:v6 withSpecifier:v7];
}

- (BOOL)_isDataclassAvailableForSpecifier:(id)a3
{
  id v4 = objc_msgSend(a3, "acui_dataclass");
  LOBYTE(self) = [(ICSDataclassValidationController *)self->_dataclassValidationController isDataclassAvailable:v4];

  return (char)self;
}

- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  id v8 = NSClassFromString(v6);
  if ([(objc_class *)v8 conformsToProtocol:&unk_270E21F68])
  {
    id v9 = [v8 alloc];
    id v10 = [(ICSDataclassViewController *)self accountManager];
    objc_super v11 = (void *)[v9 initWithAccountManager:v10];

    [v11 setDelegate:self];
  }
  else
  {
    int v12 = LogSubsystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICSDataclassViewController loadSpecifierProviderWithClassName:inBundle:]((uint64_t)v6, (uint64_t)v7, v12);
    }

    objc_super v11 = 0;
  }

  return v11;
}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ICSDataclassViewController;
  [(ACUIDataclassConfigurationViewController *)&v4 operationsHelper:a3 willSaveAccount:a4];
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = LogSubsystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = @"NO";
    if (v7) {
      __int16 v14 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v24 = v14;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl(&dword_262993000, v13, OS_LOG_TYPE_DEFAULT, "Operations helper did save account with success? %@, error: %@", buf, 0x16u);
  }

  if (v12)
  {
    id v15 = [v11 enabledDataclasses];
    uint64_t v16 = (void *)[v15 mutableCopy];

    id v17 = [(ACUIViewController *)self accountStore];
    __int16 v18 = [v17 enabledDataclassesForAccount:v11];

    [v16 minusSet:v18];
    accountSaveErrorHandler = self->_accountSaveErrorHandler;
    if (!accountSaveErrorHandler)
    {
      uint64_t v20 = [[ICSAccountSaveErrorHandler alloc] initWithPresenter:self];
      uint64_t v21 = self->_accountSaveErrorHandler;
      self->_accountSaveErrorHandler = v20;

      accountSaveErrorHandler = self->_accountSaveErrorHandler;
    }
    [(ICSAccountSaveErrorHandler *)accountSaveErrorHandler handleAccountSaveError:v12 forAccount:v11 failedDataclasses:v16];
  }
  v22.receiver = self;
  v22.super_class = (Class)ICSDataclassViewController;
  [(ACUIDataclassConfigurationViewController *)&v22 operationsHelper:v10 didSaveAccount:v11 withSuccess:v7 error:v12];
}

- (void)operationsHelper:(id)a3 didLoadSaveActions:(id)a4 forDataclass:(id)a5 withAccount:(id)a6 error:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = LogSubsystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    _os_log_impl(&dword_262993000, v15, OS_LOG_TYPE_DEFAULT, "Operations helper did load save actions: %@ forDataclass: %@ withAccount: %@ error: %@", (uint8_t *)&v20, 0x2Au);
  }

  if (v14)
  {
    uint64_t v16 = [MEMORY[0x263EFFA08] setWithObject:v12];
    accountSaveErrorHandler = self->_accountSaveErrorHandler;
    if (!accountSaveErrorHandler)
    {
      __int16 v18 = [[ICSAccountSaveErrorHandler alloc] initWithPresenter:self];
      v19 = self->_accountSaveErrorHandler;
      self->_accountSaveErrorHandler = v18;

      accountSaveErrorHandler = self->_accountSaveErrorHandler;
    }
    [(ICSAccountSaveErrorHandler *)accountSaveErrorHandler handleAccountSaveError:v14 forAccount:v13 failedDataclasses:v16];
  }
}

- (void)_startObservingAccountStoreChanges
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(ICSDataclassViewController *)self accountManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__ICSDataclassViewController__startObservingAccountStoreChanges__block_invoke;
  v4[3] = &unk_2655B6330;
  objc_copyWeak(&v5, &location);
  [v3 addAccountChangeObserver:self handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__ICSDataclassViewController__startObservingAccountStoreChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = *MEMORY[0x263F26D28];
    id v8 = [v10 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
    id v9 = [v5 objectForKeyedSubscript:v7];
    [WeakRetained accountDidChangeFromAccount:v8 toAccount:v9];
  }
}

- (void)_stopObservingAccountStoreChanges
{
  accountManager = self->_accountManager;
  if (accountManager) {
    [(AIDAAccountManager *)accountManager removeAccountChangeObserver:self];
  }
}

- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accountWorkQueue = self->_accountWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke;
  block[3] = &unk_2655B5C18;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accountWorkQueue, block);
}

void __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "aa_isPrimaryEmailVerified")) {
    int v2 = 0;
  }
  else {
    int v2 = objc_msgSend(*(id *)(a1 + 40), "aa_isPrimaryEmailVerified");
  }
  int v3 = [*(id *)(a1 + 32) isAuthenticated];
  int v4 = [*(id *)(a1 + 40) isAuthenticated];
  id v5 = [*(id *)(a1 + 32) enabledDataclasses];
  uint64_t v6 = [v5 count];
  id v7 = [*(id *)(a1 + 40) enabledDataclasses];
  uint64_t v8 = [v7 count];

  int v9 = [*(id *)(a1 + 32) isPropertyDirty:*MEMORY[0x263EFB148]];
  if (v2)
  {
    id v10 = LogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v11 = "Account became verified. Will reload specifiers.";
LABEL_13:
      _os_log_impl(&dword_262993000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v3 != v4)
  {
    id v10 = LogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v11 = "Account authentication state changed. Will reload specifiers.";
      goto LABEL_13;
    }
LABEL_14:

    id v12 = LogSubsystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v12, OS_LOG_TYPE_DEFAULT, "Account has changed, will reload specifiers.", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke_130;
    block[3] = &unk_2655B5688;
    void block[4] = *(void *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], block);
    return;
  }
  if (v9)
  {
    id v10 = LogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v11 = "Account enabled dataclasses are dirty and were likely set on oldAccount. Will reload specifiers.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v6 != v8)
  {
    id v13 = LogSubsystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v13, OS_LOG_TYPE_DEFAULT, "Account enabled dataclasses changed. Will reload specifiers if needed.", buf, 2u);
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke_131;
    v14[3] = &unk_2655B5C18;
    v14[4] = *(void *)(a1 + 48);
    id v15 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
}

uint64_t __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke_130(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanupDataclassSpecifiers];
  int v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke_131(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1632));
  if (![WeakRetained hasValidGetter]) {
    goto LABEL_9;
  }
  int v3 = [WeakRetained performGetter];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    [*(id *)(a1 + 32) _checkAndReloadSpecifierIfNeededForAccountChangedFrom:*(void *)(a1 + 40) toAccount:*(void *)(a1 + 48)];
    goto LABEL_10;
  }
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)ICSDataclassViewController;
  int v4 = objc_msgSendSuper2(&v7, sel_dataclassSwitchStateForSpecifier_, WeakRetained);
  if (v3 != v4)
  {
    id v5 = LogSubsystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_msgSend(WeakRetained, "acui_dataclass");
      *(_DWORD *)buf = 138412290;
      int v9 = v6;
      _os_log_impl(&dword_262993000, v5, OS_LOG_TYPE_DEFAULT, "Toggle value does not match new account state, refreshing specifier for dataclass %@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) reloadSpecifier:WeakRetained];
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 1632), 0);

LABEL_10:
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263EFACB8];
  int v9 = [v6 isEnabledForDataclass:*MEMORY[0x263EFACB8]];
  if (v9 == [v7 isEnabledForDataclass:v8])
  {
    uint64_t v11 = *MEMORY[0x263EFACC0];
    int v12 = [v6 isEnabledForDataclass:*MEMORY[0x263EFACC0]];
    if (v12 == [v7 isEnabledForDataclass:v11]
      && (uint64_t v13 = *MEMORY[0x263EFAD28],
          int v14 = [v6 isEnabledForDataclass:*MEMORY[0x263EFAD28]],
          v14 == [v7 isEnabledForDataclass:v13])
      && (uint64_t v15 = *MEMORY[0x263EFACF8],
          int v16 = [v6 isEnabledForDataclass:*MEMORY[0x263EFACF8]],
          v16 == [v7 isEnabledForDataclass:v15])
      && (uint64_t v17 = *MEMORY[0x263EFAC58],
          int v18 = [v6 isEnabledForDataclass:*MEMORY[0x263EFAC58]],
          v18 == [v7 isEnabledForDataclass:v17]))
    {
      uint64_t v11 = *MEMORY[0x263EFAD48];
      int v22 = [v6 isEnabledForDataclass:*MEMORY[0x263EFAD48]];
      if (v22 == [v7 isEnabledForDataclass:v11])
      {
        uint64_t v11 = *MEMORY[0x263EFACB0];
        int v23 = [v6 isEnabledForDataclass:*MEMORY[0x263EFACB0]];
        if (v23 == [v7 isEnabledForDataclass:v11])
        {
          uint64_t v11 = *MEMORY[0x263EFACE8];
          int v24 = [v6 isEnabledForDataclass:*MEMORY[0x263EFACE8]];
          if (v24 == [v7 isEnabledForDataclass:v11])
          {
            uint64_t v25 = *MEMORY[0x263EFACC8];
            int v26 = [v6 isEnabledForDataclass:*MEMORY[0x263EFACC8]];
            int v27 = [v7 isEnabledForDataclass:v25];
            uint64_t v28 = (uint64_t *)MEMORY[0x263EFB448];
            if (v26 != v27
              || (uint64_t v29 = *MEMORY[0x263EFB448],
                  int v30 = [v6 isEnabledForDataclass:*MEMORY[0x263EFB448]],
                  v30 != [v7 isEnabledForDataclass:v29]))
            {
              v31 = LogSubsystem();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
                -[ICSDataclassViewController _checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:].cold.6();
              }

              [(ICSDataclassViewController *)self reloadSpecifierID:v25];
              uint64_t v21 = *v28;
              int v20 = self;
              goto LABEL_12;
            }
            uint64_t v11 = *MEMORY[0x263EFAC90];
            int v32 = [v6 isEnabledForDataclass:*MEMORY[0x263EFAC90]];
            if (v32 == [v7 isEnabledForDataclass:v11])
            {
              uint64_t v11 = *MEMORY[0x263EFAC50];
              int v33 = [v6 isEnabledForDataclass:*MEMORY[0x263EFAC50]];
              if (v33 == [v7 isEnabledForDataclass:v11]) {
                goto LABEL_13;
              }
              v19 = LogSubsystem();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
                -[ICSDataclassViewController _checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:].cold.8();
              }
            }
            else
            {
              v19 = LogSubsystem();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
                -[ICSDataclassViewController _checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:].cold.7();
              }
            }
          }
          else
          {
            v19 = LogSubsystem();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
              -[ICSDataclassViewController _checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:].cold.5();
            }
          }
        }
        else
        {
          v19 = LogSubsystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            -[ICSDataclassViewController _checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:].cold.4();
          }
        }
      }
      else
      {
        v19 = LogSubsystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[ICSDataclassViewController _checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:]();
        }
      }
    }
    else
    {
      v19 = LogSubsystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[ICSDataclassViewController _checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:]();
      }
    }

    int v20 = self;
    uint64_t v21 = v11;
LABEL_12:
    [(ICSDataclassViewController *)v20 reloadSpecifierID:v21];
    goto LABEL_13;
  }
  uint64_t v10 = LogSubsystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ICSDataclassViewController _checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:]();
  }

  [(ICSDataclassViewController *)self reloadSpecifiers];
LABEL_13:
}

- (void)_startObservingRestrictionChanges
{
  if (!self->_restrictionChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    int v3 = [MEMORY[0x263F08A00] defaultCenter];
    int v4 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v5 = *MEMORY[0x263F53B40];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__ICSDataclassViewController__startObservingRestrictionChanges__block_invoke;
    v8[3] = &unk_2655B5868;
    objc_copyWeak(&v9, &location);
    id v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v8];
    id restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
    self->_id restrictionChangeNotificationObserver = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __63__ICSDataclassViewController__startObservingRestrictionChanges__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cleanupDataclassSpecifiers];

  id v3 = objc_loadWeakRetained(v1);
  [v3 reloadSpecifiers];
}

- (void)_stopObservingRestrictionChanges
{
  if (self->_restrictionChangeNotificationObserver)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_restrictionChangeNotificationObserver];

    id restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
    self->_id restrictionChangeNotificationObserver = 0;
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ICSDataclassViewController *)self activeSpecifier];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (PSSpecifier)activeSpecifier
{
  return self->_activeSpecifier;
}

- (void)setActiveSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_toggledSpecifier);
  objc_storeStrong((id *)&self->_mailConfigController, 0);
  objc_storeStrong((id *)&self->_dataclassValidationController, 0);
  objc_storeStrong((id *)&self->_accountSaveErrorHandler, 0);
  objc_storeStrong((id *)&self->_accountWorkQueue, 0);

  objc_storeStrong(&self->_restrictionChangeNotificationObserver, 0);
}

- (void)accountManager
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_262993000, v0, OS_LOG_TYPE_FAULT, "ICSDataclassViewController was instantiated without an AIDAAccountManager set on the launching specifier", v1, 2u);
}

- (void)specifierProvider:(uint64_t)a1 willBeginLoadingSpecifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "Unbalanced call to -specifierProvider:willBeginLoadingSpecifier:, please file a radar! (provider: %@)", (uint8_t *)&v2, 0xCu);
}

- (void)specifierProvider:(uint64_t)a1 didFinishLoadingSpecifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "Unbalanced call to -specifierProvider:didFinishLoadingSpecifier:, please file a radar! (provider: %@)", (uint8_t *)&v2, 0xCu);
}

- (void)loadSpecifierProviderWithClassName:(os_log_t)log inBundle:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_262993000, log, OS_LOG_TYPE_ERROR, "ICSDataclassViewController Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Mail dataclass changed, reloading all specifiers.", v2, v3, v4, v5, v6);
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Photos dataclass changed, reloading specifier.", v2, v3, v4, v5, v6);
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Ubiquity dataclass changed, reloading specifier.", v2, v3, v4, v5, v6);
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Keychain dataclass changed, reloading specifier.", v2, v3, v4, v5, v6);
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Notes dataclass changed, reloading specifier.", v2, v3, v4, v5, v6);
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Messages dataclass changed, reloading specifier.", v2, v3, v4, v5, v6);
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Health dataclass changed, reloading specifier.", v2, v3, v4, v5, v6);
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Calendars dataclass changed, reloading specifier.", v2, v3, v4, v5, v6);
}

@end