@interface STCommunicationSafetyAnalyticsTipGroupSpecifierProvider
+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4;
- (BOOL)_shouldShowAnalyticsTip;
- (PSSpecifier)communicationSafetyAnalyticsTipSpecifer;
- (STCommunicationSafetyAnalyticsTipGroupSpecifierProvider)init;
- (UIViewController)rootViewController;
- (void)_acknowledgeTip;
- (void)_setCommunicationSafetyAnalyticsTip;
- (void)_showCommunicationSafetyAnalyticsTipIfNeeded;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCommunicationSafetyAnalyticsTipSpecifer:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setRootViewController:(id)a3;
@end

@implementation STCommunicationSafetyAnalyticsTipGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___STCommunicationSafetyAnalyticsTipGroupSpecifierProvider;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v8, sel_providerWithCoordinator_, a3);
  objc_msgSend(v6, "setRootViewController:", v5, v8.receiver, v8.super_class);

  return v6;
}

- (STCommunicationSafetyAnalyticsTipGroupSpecifierProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)STCommunicationSafetyAnalyticsTipGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v8 init];
  [(STGroupSpecifierProvider *)v2 setIsHidden:1];
  v3 = (void *)MEMORY[0x263F5FC40];
  v4 = objc_opt_new();
  id v5 = [v4 UUIDString];
  v6 = [v3 groupSpecifierWithID:v5];

  [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v6];
  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted" context:"STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted" context:"STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled" context:"STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"viewModel.me.hasPasscode"];
  v6.receiver = self;
  v6.super_class = (Class)STCommunicationSafetyAnalyticsTipGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  if (v4) {
    [(STCommunicationSafetyAnalyticsTipGroupSpecifierProvider *)self _setCommunicationSafetyAnalyticsTip];
  }
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted" options:5 context:"STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted" options:5 context:"STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled" options:5 context:"STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"viewModel.me.hasPasscode" options:5 context:"STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext"];
}

- (void)_setCommunicationSafetyAnalyticsTip
{
  v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
  communicationSafetyAnalyticsTipSpecifer = self->_communicationSafetyAnalyticsTipSpecifer;
  self->_communicationSafetyAnalyticsTipSpecifer = v3;

  [(PSSpecifier *)self->_communicationSafetyAnalyticsTipSpecifer setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  id v5 = [STCommunicationSafetyOnboardingController alloc];
  objc_super v6 = [(STRootGroupSpecifierProvider *)self coordinator];
  v7 = [(STCommunicationSafetyOnboardingController *)v5 initWithCoordinator:v6];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke;
  aBlock[3] = &unk_264767078;
  aBlock[4] = self;
  v15 = v7;
  objc_super v8 = v7;
  v9 = _Block_copy(aBlock);
  v10 = _Block_copy(v9);
  [(PSSpecifier *)self->_communicationSafetyAnalyticsTipSpecifer setObject:v10 forKeyedSubscript:*MEMORY[0x263F5FF70]];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_48;
  v13[3] = &unk_264766F30;
  v13[4] = self;
  v11 = _Block_copy(v13);
  v12 = _Block_copy(v11);
  [(PSSpecifier *)self->_communicationSafetyAnalyticsTipSpecifer setObject:v12 forKeyedSubscript:*MEMORY[0x263F60078]];
}

void __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  v3 = [*(id *)(a1 + 32) rootViewController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_2;
  v4[3] = &unk_264767CD8;
  objc_copyWeak(&v5, &location);
  [v2 presentOverViewController:v3 skipFeatureEnablement:1 completionBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_2(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (a2 & 1) == 0)
  {
    id v17 = WeakRetained;
    [WeakRetained _acknowledgeTip];
    v7 = [v17 coordinator];
    objc_super v8 = [v7 communicationSafetyCoordinator];
    v9 = [v8 viewModel];

    [v9 setIsCommunicationSafetyAnalyticsEnabled:a4];
    v10 = [v17 coordinator];
    v11 = [v10 communicationSafetyCoordinator];
    [v11 persistCommunicationSafetySettingsWithCompletionHandler:&__block_literal_global_9];

    v12 = objc_opt_new();
    v13 = [v17 coordinator];
    [v12 setCoordinator:v13];

    v14 = [v17 delegate];
    [v12 setParentController:v14];
    v15 = [v14 rootController];
    [v12 setRootController:v15];

    v16 = [v17 communicationSafetyAnalyticsTipSpecifer];
    [v12 setSpecifier:v16];

    [v17 showController:v12 animated:1];
    id WeakRetained = v17;
  }
}

void __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = v2;
    id v4 = +[STUILog communicationSafety];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_3_cold_2((uint64_t)v3, v4);
    }
LABEL_4:

    goto LABEL_10;
  }
  if (!_os_feature_enabled_impl())
  {
    id v3 = 0;
    goto LABEL_10;
  }
  id v5 = [MEMORY[0x263F67088] sharedController];
  objc_super v6 = [MEMORY[0x263F67088] sharedController];
  v7 = [v6 viewContext];
  id v9 = 0;
  char v8 = [v5 saveContext:v7 error:&v9];
  id v3 = v9;

  if ((v8 & 1) == 0)
  {
    id v4 = +[STUILog communicationSafety];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke_cold_1((uint64_t)v3, v4);
    }
    goto LABEL_4;
  }
LABEL_10:
}

uint64_t __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _acknowledgeTip];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext")
  {
    [(STCommunicationSafetyAnalyticsTipGroupSpecifierProvider *)self _showCommunicationSafetyAnalyticsTipIfNeeded];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)STCommunicationSafetyAnalyticsTipGroupSpecifierProvider;
    -[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_showCommunicationSafetyAnalyticsTipIfNeeded
{
  id v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 communicationSafetyCoordinator];
  id v5 = [v4 viewModel];
  int v6 = [v5 isCommunicationSafetyAnalyticsEnabled];

  if (v6)
  {
    [(STCommunicationSafetyAnalyticsTipGroupSpecifierProvider *)self _acknowledgeTip];
  }
  else
  {
    if ([(STCommunicationSafetyAnalyticsTipGroupSpecifierProvider *)self _shouldShowAnalyticsTip])
    {
      [(STGroupSpecifierProvider *)self setIsHidden:0];
      uint64_t v7 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
      objc_super v8 = [(STCommunicationSafetyAnalyticsTipGroupSpecifierProvider *)self communicationSafetyAnalyticsTipSpecifer];
      char v9 = [v7 containsObject:v8];

      if (v9) {
        return;
      }
      id v14 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
      uint64_t v10 = [(STCommunicationSafetyAnalyticsTipGroupSpecifierProvider *)self communicationSafetyAnalyticsTipSpecifer];
      [v14 addObject:v10];
    }
    else
    {
      v11 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
      v12 = [(STCommunicationSafetyAnalyticsTipGroupSpecifierProvider *)self communicationSafetyAnalyticsTipSpecifer];
      int v13 = [v11 containsObject:v12];

      if (!v13) {
        return;
      }
      [(STGroupSpecifierProvider *)self setIsHidden:1];
      id v14 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
      uint64_t v10 = [(STCommunicationSafetyAnalyticsTipGroupSpecifierProvider *)self communicationSafetyAnalyticsTipSpecifer];
      [v14 removeObject:v10];
    }
  }
}

- (BOOL)_shouldShowAnalyticsTip
{
  id v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v3 = [v2 communicationSafetyCoordinator];
  id v4 = [v3 viewModel];

  id v5 = [v2 viewModel];
  if ([v4 isCommunicationSafetySendingRestricted]) {
    char v6 = 0;
  }
  else {
    char v6 = [v4 isCommunicationSafetyReceivingRestricted] ^ 1;
  }
  char v7 = [v4 isCommunicationSafetyAnalyticsEnabled];
  BOOL v8 = 0;
  if ((v6 & 1) == 0 && (v7 & 1) == 0)
  {
    char v9 = [v5 me];
    uint64_t v10 = [v9 dsid];
    v11 = [v10 stringValue];
    BOOL v12 = +[STCommunicationSafetyAnalyticsTipCell didAcknowledgeTipViewForDSID:v11];

    BOOL v8 = !v12;
  }

  return v8;
}

- (void)_acknowledgeTip
{
  [(STGroupSpecifierProvider *)self setIsHidden:1];
  id v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v7 = [v3 viewModel];

  id v4 = [v7 me];
  id v5 = [v4 dsid];
  char v6 = [v5 stringValue];

  +[STCommunicationSafetyAnalyticsTipCell acknowledgeTipViewForDSID:v6];
}

- (PSSpecifier)communicationSafetyAnalyticsTipSpecifer
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCommunicationSafetyAnalyticsTipSpecifer:(id)a3
{
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
  objc_destroyWeak((id *)&self->_rootViewController);

  objc_storeStrong((id *)&self->_communicationSafetyAnalyticsTipSpecifer, 0);
}

void __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Could not save Communication Safety settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end