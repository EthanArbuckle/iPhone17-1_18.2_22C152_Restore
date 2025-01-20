@interface STFamilyMemberGroupSpecifierProvider
+ (id)providerWithCoordinator:(id)a3 presentedAsModal:(BOOL)a4;
+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4;
- (BOOL)presentedAsModal;
- (STFamilyMemberGroupSpecifierProvider)init;
- (UIViewController)rootViewController;
- (id)createSpecifierForUser:(id)a3 shouldWarn:(BOOL)a4;
- (id)familySpecifiers;
- (id)totalChildUsageTime:(id)a3;
- (void)dealloc;
- (void)imageDidUpdate:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setPresentedAsModal:(BOOL)a3;
- (void)setRootViewController:(id)a3;
- (void)showChildOnboardingFlow:(id)a3;
- (void)showChildOnboardingOrChildRootViewController:(id)a3;
- (void)showChildRootViewController:(id)a3;
@end

@implementation STFamilyMemberGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4
{
  id v5 = a4;
  v6 = +[STRootGroupSpecifierProvider providerWithCoordinator:a3];
  [v6 setRootViewController:v5];

  return v6;
}

+ (id)providerWithCoordinator:(id)a3 presentedAsModal:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___STFamilyMemberGroupSpecifierProvider;
  id v5 = objc_msgSendSuper2(&v7, sel_providerWithCoordinator_, a3);
  [v5 setPresentedAsModal:v4];

  return v5;
}

- (STFamilyMemberGroupSpecifierProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v10 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F5FC40];
    BOOL v4 = +[STScreenTimeSettingsUIBundle bundle];
    id v5 = [v4 localizedStringForKey:@"FamilyGroupName" value:&stru_26D9391A8 table:0];
    v6 = [v3 groupSpecifierWithName:v5];

    [v6 setIdentifier:@"FAMILY"];
    [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v6];
    objc_super v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_imageDidUpdate_ name:*MEMORY[0x263F67418] object:0];

    v8 = [MEMORY[0x263F53C50] sharedConnection];
    [v8 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v5.receiver = self;
  v5.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v5 invalidate];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.screenTimeEnabled" context:"STFamilyMemberGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"viewModel.children" context:"STFamilyMemberGroupSpecifierProviderObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.children" options:4 context:"STFamilyMemberGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"viewModel.screenTimeEnabled" options:4 context:"STFamilyMemberGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "STFamilyMemberGroupSpecifierProviderObservationContext")
  {
    id v12 = [(STFamilyMemberGroupSpecifierProvider *)self familySpecifiers];
    objc_super v7 = [MEMORY[0x263F53C50] sharedConnection];
    int v8 = [v7 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    if ([v12 count]) {
      BOOL v9 = v8 == 2;
    }
    else {
      BOOL v9 = 1;
    }
    uint64_t v10 = v9;
    [(STGroupSpecifierProvider *)self setIsHidden:v10];
    v11 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
    objc_msgSend(v11, "replaceObjectsInRange:withObjectsFromArray:", 0, objc_msgSend(v11, "count"), v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
    -[STFamilyMemberGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  objc_super v5 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3, a4);
  int v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

  id v9 = [(STGroupSpecifierProvider *)self specifiers];
  if ([v9 count]) {
    BOOL v7 = v6 == 2;
  }
  else {
    BOOL v7 = 1;
  }
  uint64_t v8 = v7;
  [(STGroupSpecifierProvider *)self setIsHidden:v8];
}

- (id)createSpecifierForUser:(id)a3 shouldWarn:(BOOL)a4
{
  id v5 = a3;
  int v6 = _os_feature_enabled_impl();
  BOOL v7 = (void *)MEMORY[0x263F5FC40];
  uint64_t v8 = [v5 name];
  if (v6)
  {
    id v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:sel_totalChildUsageTime_ detail:0 cell:2 edit:0];

    [v9 setControllerLoadAction:sel_showChildOnboardingOrChildRootViewController_];
  }
  else
  {
    id v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:sel_totalChildUsageTime_ detail:objc_opt_class() cell:2 edit:0];
  }
  uint64_t v10 = [v5 dsid];
  if (v10)
  {
    v11 = [NSString stringWithFormat:@"CHILD_%@", v10];
    [v9 setIdentifier:v11];

    [v9 setUserInfo:v5];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F67428]];
    id v12 = [MEMORY[0x263F67408] sharedCache];
    objc_super v13 = [v5 name];
    v14 = [v12 personImageWithDSID:v10 fullName:v13];
    [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x263F60140]];
  }
  else
  {
    [v9 setUserInfo:v5];
    [v9 setObject:0 forKeyedSubscript:*MEMORY[0x263F67428]];
    [v9 setObject:0 forKeyedSubscript:*MEMORY[0x263F60140]];
  }
  v15 = NSNumber;
  v16 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v16)) {
    double v17 = *MEMORY[0x263F839B8];
  }
  else {
    PSRoundToPixel();
  }
  v18 = [v15 numberWithDouble:v17];
  [v9 setObject:v18 forKeyedSubscript:*MEMORY[0x263F602A8]];

  [v9 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v9 setObject:&unk_26D967660 forKeyedSubscript:*MEMORY[0x263F25C30]];

  return v9;
}

- (id)familySpecifiers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 viewModel];
  id v5 = (void *)MEMORY[0x263EFF980];
  int v6 = [v4 children];
  BOOL v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = objc_msgSend(v4, "children", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = -[STFamilyMemberGroupSpecifierProvider createSpecifierForUser:shouldWarn:](self, "createSpecifierForUser:shouldWarn:", *(void *)(*((void *)&v15 + 1) + 8 * i), [*(id *)(*((void *)&v15 + 1) + 8 * i) hasDeviceWithoutUsageReported]);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)imageDidUpdate:(id)a3
{
  id v13 = a3;
  id v4 = [v13 userInfo];
  uint64_t v5 = *MEMORY[0x263F67428];
  int v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F67428]];

  BOOL v7 = [(STGroupSpecifierProvider *)self specifiers];
  uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"properties.%K == %@", v5, v6];
  uint64_t v9 = [v7 filteredArrayUsingPredicate:v8];
  uint64_t v10 = [v9 firstObject];

  if (v10)
  {
    uint64_t v11 = [v13 userInfo];
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F67430]];

    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60140]];
    [(STGroupSpecifierProvider *)self reloadSpecifier:v10 animated:0];
  }
}

- (id)totalChildUsageTime:(id)a3
{
  return &stru_26D9391A8;
}

- (void)showChildOnboardingOrChildRootViewController:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  int v6 = v5;
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v7 = [v5 dsid];
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v20 = v6;
  v21 = self;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [(STRootGroupSpecifierProvider *)self coordinator];
  uint64_t v10 = [v9 viewModel];
  uint64_t v11 = [v10 children];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v11);
        }
        long long v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = [v17 dsid];
        int v19 = [v18 isEqualToNumber:v8];

        if (v19) {
          char v14 = [v17 isManaged];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
  else
  {
    char v14 = 0;
  }

  int v6 = v20;
  self = v21;
  if (v14) {
    [(STFamilyMemberGroupSpecifierProvider *)v21 showChildRootViewController:v4];
  }
  else {
LABEL_15:
  }
    [(STFamilyMemberGroupSpecifierProvider *)self showChildOnboardingFlow:v4];
}

- (void)showChildOnboardingFlow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  int v6 = [(STGroupSpecifierProvider *)self delegate];
  [v5 setParentController:v6];
  uint64_t v7 = [v6 rootController];
  [v5 setRootController:v7];

  [v5 setSpecifier:v4];
  uint64_t v8 = [v5 coordinator];
  [v8 setHasShownMiniBuddy:1];
  uint64_t v9 = [[STIntroductionController alloc] initWithNewUserRootViewModelCoordinator:v8];
  uint64_t v10 = [v8 viewModel];
  uint64_t v11 = [v10 me];
  char v12 = [v11 isRemoteUser];

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__STFamilyMemberGroupSpecifierProvider_showChildOnboardingFlow___block_invoke;
  v16[3] = &unk_264767C30;
  id v13 = v8;
  id v17 = v13;
  char v20 = v12;
  objc_copyWeak(&v19, &location);
  id v14 = v5;
  id v18 = v14;
  [(STIntroductionController *)v9 setCompletionBlock:v16];
  uint64_t v15 = [(STFamilyMemberGroupSpecifierProvider *)self rootViewController];
  [(STIntroductionController *)v9 presentOverViewController:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __64__STFamilyMemberGroupSpecifierProvider_showChildOnboardingFlow___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v5 parentalControlsPasscode];
    uint64_t v9 = [v6 recoveryAltDSID];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__STFamilyMemberGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2;
    v10[3] = &unk_264767C08;
    char v15 = *(unsigned char *)(a1 + 56);
    id v11 = v6;
    id v12 = *(id *)(a1 + 32);
    objc_copyWeak(&v14, (id *)(a1 + 48));
    id v13 = *(id *)(a1 + 40);
    [v7 enableManagementWithPIN:v8 recoveryAltDSID:v9 completionHandler:v10];

    objc_destroyWeak(&v14);
  }
}

void __64__STFamilyMemberGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog budgets];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2_cold_1((uint64_t)v3, v4);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 64) || [*(id *)(a1 + 32) deviceForChild]) {
      [*(id *)(a1 + 40) applyIntroductionViewModel:*(void *)(a1 + 32) withCompletionHandler:0];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained showController:*(void *)(a1 + 48) animated:1];
  }
}

- (void)showChildRootViewController:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  id v5 = [(STGroupSpecifierProvider *)self delegate];
  [v7 setParentController:v5];
  int v6 = [v5 rootController];
  [v7 setRootController:v6];

  [v7 setSpecifier:v4];
  [(STGroupSpecifierProvider *)self showController:v7 animated:1];
}

- (BOOL)presentedAsModal
{
  return self->_presentedAsModal;
}

- (void)setPresentedAsModal:(BOOL)a3
{
  self->_presentedAsModal = a3;
}

- (UIViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end