@interface STSetUpForFamilyGroupSpecifierProvider
+ (id)providerWithCoordinator:(id)a3 presenter:(id)a4;
- (FACircleStateController)controller;
- (PSSpecifier)setupFamilySpecifier;
- (STSetUpForFamilyGroupSpecifierProvider)init;
- (UIViewController)presenter;
- (void)_updateEnabledValue;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentAppleAccountSetupFamilyController:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setController:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setPresenter:(id)a3;
@end

@implementation STSetUpForFamilyGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 presenter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 providerWithCoordinator:v7];
  [v8 setPresenter:v6];

  [v8 setCoordinator:v7];

  return v8;
}

- (STSetUpForFamilyGroupSpecifierProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)STSetUpForFamilyGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v14 init];
  v3 = v2;
  if (v2)
  {
    [(STGroupSpecifierProvider *)v2 setIsHidden:1];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"SetUpForFamilyFooterText" value:&stru_26D9391A8 table:0];
    id v6 = [(STGroupSpecifierProvider *)v3 groupSpecifier];
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F600F8]];

    id v7 = [v4 localizedStringForKey:@"SetUpForFamilyButtonName" value:&stru_26D9391A8 table:0];
    v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v7 target:v3 set:0 get:0 detail:0 cell:13 edit:0];
    [v8 setButtonAction:sel_presentAppleAccountSetupFamilyController_];
    if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
      [v8 setButtonAction:sel_showStoreDemoAlert];
    }
    setupFamilySpecifier = v3->_setupFamilySpecifier;
    v3->_setupFamilySpecifier = (PSSpecifier *)v8;
    id v10 = v8;

    v11 = [(STGroupSpecifierProvider *)v3 mutableSpecifiers];
    [v11 addObject:v10];
    v12 = [MEMORY[0x263F53C50] sharedConnection];

    [v12 registerObserver:v3];
    [(STSetUpForFamilyGroupSpecifierProvider *)v3 _updateEnabledValue];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STSetUpForFamilyGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.canSetUpFamily" context:@"STSetUpForFamilyGroupSpecifierProviderObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STSetUpForFamilyGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.canSetUpFamily" options:4 context:@"STSetUpForFamilyGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 != @"STSetUpForFamilyGroupSpecifierProviderObservationContext")
  {
    v24.receiver = self;
    v24.super_class = (Class)STSetUpForFamilyGroupSpecifierProvider;
    id v10 = a3;
    [(STSetUpForFamilyGroupSpecifierProvider *)&v24 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];

    return;
  }
  id v11 = a3;
  [(STRootGroupSpecifierProvider *)self coordinator];

  int v12 = [v11 isEqualToString:@"viewModel.canSetUpFamily"];
  if (v12)
  {
    if (_os_feature_enabled_impl())
    {
      v13 = [MEMORY[0x263F53C50] sharedConnection];
      int v14 = [v13 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

      id v23 = [(STSetUpForFamilyGroupSpecifierProvider *)self presenter];
      if (v23)
      {
        v15 = [(STRootGroupSpecifierProvider *)self coordinator];
        v16 = [v15 viewModel];
        unsigned int v17 = [v16 canSetUpFamily] ^ 1;
        if (v14 == 2) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = v17;
        }
        [(STGroupSpecifierProvider *)self setIsHidden:v18];

        goto LABEL_16;
      }
      BOOL v21 = v14 == 2;
      v22 = self;
    }
    else
    {
      id v23 = [(STSetUpForFamilyGroupSpecifierProvider *)self presenter];
      if (v23)
      {
        v19 = [(STRootGroupSpecifierProvider *)self coordinator];
        v20 = [v19 viewModel];
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v20 canSetUpFamily] ^ 1);

LABEL_16:

        return;
      }
      v22 = self;
      BOOL v21 = 0;
    }
    [(STGroupSpecifierProvider *)v22 setIsHidden:v21];
    goto LABEL_16;
  }
}

- (void)_updateEnabledValue
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v4 = [v3 effectiveBoolValueForSetting:*MEMORY[0x263F53710]] != 2;

  id v6 = [NSNumber numberWithBool:v4];
  v5 = [(STSetUpForFamilyGroupSpecifierProvider *)self setupFamilySpecifier];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F600A8]];
}

- (void)presentAppleAccountSetupFamilyController:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v5 = (void *)getFACircleStateControllerClass_softClass;
  uint64_t v29 = getFACircleStateControllerClass_softClass;
  if (!getFACircleStateControllerClass_softClass)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __getFACircleStateControllerClass_block_invoke;
    objc_super v24 = &unk_2647684C8;
    v25 = &v26;
    __getFACircleStateControllerClass_block_invoke((uint64_t)&v21);
    v5 = (void *)v27[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v26, 8);
  id v7 = [v6 alloc];
  v8 = [(STSetUpForFamilyGroupSpecifierProvider *)self presenter];
  v9 = (FACircleStateController *)[v7 initWithPresenter:v8];
  controller = self->_controller;
  self->_controller = v9;

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v11 = (void *)getFACircleContextClass_softClass;
  uint64_t v29 = getFACircleContextClass_softClass;
  if (!getFACircleContextClass_softClass)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __getFACircleContextClass_block_invoke;
    objc_super v24 = &unk_2647684C8;
    v25 = &v26;
    __getFACircleContextClass_block_invoke((uint64_t)&v21);
    id v11 = (void *)v27[3];
  }
  int v12 = v11;
  _Block_object_dispose(&v26, 8);
  id v13 = [v12 alloc];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v14 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr;
  uint64_t v29 = getFACircleEventTypeInitiateSymbolLoc_ptr;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __getFACircleEventTypeInitiateSymbolLoc_block_invoke;
    objc_super v24 = &unk_2647684C8;
    v25 = &v26;
    v15 = (void *)FamilyCircleUILibrary();
    v16 = dlsym(v15, "FACircleEventTypeInitiate");
    *(void *)(v25[1] + 24) = v16;
    getFACircleEventTypeInitiateSymbolLoc_ptr = *(void *)(v25[1] + 24);
    int v14 = (void *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v14) {
    -[STSetUpForFamilyGroupSpecifierProvider presentAppleAccountSetupFamilyController:]();
  }
  unsigned int v17 = (void *)[v13 initWithEventType:*v14];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v18 = (void *)getFACircleClientNameScreenTimeSymbolLoc_ptr;
  uint64_t v29 = getFACircleClientNameScreenTimeSymbolLoc_ptr;
  if (!getFACircleClientNameScreenTimeSymbolLoc_ptr)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __getFACircleClientNameScreenTimeSymbolLoc_block_invoke;
    objc_super v24 = &unk_2647684C8;
    v25 = &v26;
    v19 = (void *)FamilyCircleUILibrary();
    v20 = dlsym(v19, "FACircleClientNameScreenTime");
    *(void *)(v25[1] + 24) = v20;
    getFACircleClientNameScreenTimeSymbolLoc_ptr = *(void *)(v25[1] + 24);
    uint64_t v18 = (void *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v18) {
    -[STSetUpForFamilyGroupSpecifierProvider presentAppleAccountSetupFamilyController:]();
  }
  [v17 setClientName:*v18];
  [(FACircleStateController *)self->_controller performWithContext:v17 completion:&__block_literal_global_17];
}

void __83__STSetUpForFamilyGroupSpecifierProvider_presentAppleAccountSetupFamilyController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 success] & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __83__STSetUpForFamilyGroupSpecifierProvider_presentAppleAccountSetupFamilyController___block_invoke_cold_1(v2);
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  [(STSetUpForFamilyGroupSpecifierProvider *)self _updateEnabledValue];
  v5 = [(STSetUpForFamilyGroupSpecifierProvider *)self setupFamilySpecifier];
  [(STGroupSpecifierProvider *)self reloadSpecifier:v5 animated:1];

  if (_os_feature_enabled_impl())
  {
    id v6 = [MEMORY[0x263F53C50] sharedConnection];
    int v7 = [v6 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    id v12 = [(STSetUpForFamilyGroupSpecifierProvider *)self presenter];
    if (v12)
    {
      v8 = [(STRootGroupSpecifierProvider *)self coordinator];
      v9 = [v8 viewModel];
      unsigned int v10 = [v9 canSetUpFamily] ^ 1;
      if (v7 == 2) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v10;
      }
      [(STGroupSpecifierProvider *)self setIsHidden:v11];
    }
    else
    {
      [(STGroupSpecifierProvider *)self setIsHidden:v7 == 2];
    }
  }
}

- (UIViewController)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (UIViewController *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (PSSpecifier)setupFamilySpecifier
{
  return self->_setupFamilySpecifier;
}

- (FACircleStateController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_setupFamilySpecifier, 0);

  objc_destroyWeak((id *)&self->_presenter);
}

- (void)presentAppleAccountSetupFamilyController:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString * _Nonnull getFACircleEventTypeInitiate(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"STSetUpForFamilyGroupSpecifierProvider.m", 29, @"%s", dlerror());

  __break(1u);
}

- (void)presentAppleAccountSetupFamilyController:.cold.2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString * _Nonnull getFACircleClientNameScreenTime(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"STSetUpForFamilyGroupSpecifierProvider.m", 30, @"%s", dlerror());

  __break(1u);
}

void __83__STSetUpForFamilyGroupSpecifierProvider_presentAppleAccountSetupFamilyController___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [a1 error];
  int v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to initiate family: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end