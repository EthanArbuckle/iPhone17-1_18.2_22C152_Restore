@interface PUINetworkController
- (BOOL)isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle;
- (NEConfiguration)pathControllerConfiguration;
- (NSMutableArray)dnsConfigurations;
- (PUINetworkController)init;
- (id)eligibleApplications;
- (id)isLocalNetworkEnabled:(id)a3;
- (id)networkConfigurationEnabled:(id)a3;
- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4;
- (id)specifiers;
- (void)dnsConfigurationChanged:(id)a3;
- (void)loadConfigurationsForceRefresh:(BOOL)a3 completionHandler:(id)a4;
- (void)provideNavigationDonations;
- (void)saveConfiguration;
- (void)setDnsConfigurations:(id)a3;
- (void)setIsWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle:(BOOL)a3;
- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4;
- (void)setPathControllerConfiguration:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUINetworkController

- (PUINetworkController)init
{
  v15.receiver = self;
  v15.super_class = (Class)PUINetworkController;
  v2 = [(PUINetworkController *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle = 0;
    [(PUINetworkController *)v2 setReusesCells:1];
    objc_initWeak(&location, v3);
    v4 = [MEMORY[0x1E4F38CD0] sharedManagerForAllUsers];
    uint64_t v5 = MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __28__PUINetworkController_init__block_invoke;
    v12[3] = &unk_1E6E9CB78;
    objc_copyWeak(&v13, &location);
    [v4 setChangedQueue:v5 andHandler:v12];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __28__PUINetworkController_init__block_invoke_3;
    v10[3] = &unk_1E6E9D940;
    objc_copyWeak(&v11, &location);
    [(PUINetworkController *)v3 loadConfigurationsForceRefresh:0 completionHandler:v10];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel_dnsConfigurationChanged_ name:@"PUINetworkDNSChangedNotification" object:0];

    v8 = v3;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __28__PUINetworkController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__PUINetworkController_init__block_invoke_2;
  v6[3] = &unk_1E6E9D940;
  objc_copyWeak(&v7, v4);
  [WeakRetained loadConfigurationsForceRefresh:1 completionHandler:v6];

  objc_destroyWeak(&v7);
}

void __28__PUINetworkController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WeakRetained[1384])
    {
      WeakRetained[1384] = 0;
    }
    else
    {
      v2 = WeakRetained;
      [WeakRetained reloadSpecifiers];
      id WeakRetained = v2;
    }
  }
}

void __28__PUINetworkController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadSpecifiers];
    id WeakRetained = v2;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUINetworkController;
  [(PUINetworkController *)&v4 viewDidAppear:a3];
  [(PUINetworkController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v7 = (void *)[v5 initWithKey:@"LOCAL_NETWORK" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/LOCAL_NETWORK"];
  [(PUINetworkController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.internet-sharing" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (void)dnsConfigurationChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PUINetworkController_dnsConfigurationChanged___block_invoke;
  v5[3] = &unk_1E6E9D940;
  objc_copyWeak(&v6, &location);
  [(PUINetworkController *)self loadConfigurationsForceRefresh:1 completionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __48__PUINetworkController_dnsConfigurationChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadSpecifiers];
    id WeakRetained = v2;
  }
}

- (void)saveConfiguration
{
  id v2 = [(PUINetworkController *)self pathControllerConfiguration];
  id v3 = [MEMORY[0x1E4F38CD0] sharedManagerForAllUsers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PUINetworkController_saveConfiguration__block_invoke;
  v6[3] = &unk_1E6E9C780;
  id v7 = v2;
  id v4 = v2;
  [v3 saveConfiguration:v4 withCompletionQueue:MEMORY[0x1E4F14428] handler:v6];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"com.apple.PrivacySettingsUI.NetworkConfigChanged" object:0];
}

void __41__PUINetworkController_saveConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _PUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136446722;
      id v7 = "-[PUINetworkController saveConfiguration]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v3;
      __int16 v10 = 2114;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1E4AD5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Save error %{public}@ for %{public}@", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)loadConfigurationsForceRefresh:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PUINetworkController *)self pathControllerConfiguration];

  if (!v7 || v4)
  {
    __int16 v10 = [MEMORY[0x1E4F38CD0] sharedManagerForAllUsers];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__PUINetworkController_loadConfigurationsForceRefresh_completionHandler___block_invoke;
    v14[3] = &unk_1E6E9D968;
    v14[4] = self;
    id v15 = v6;
    id v11 = v6;
    [v10 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v14];

    id v9 = v15;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PUINetworkController_loadConfigurationsForceRefresh_completionHandler___block_invoke_37;
    block[3] = &unk_1E6E9CB28;
    id v13 = v6;
    id v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v9 = v13;
  }
}

void __73__PUINetworkController_loadConfigurationsForceRefresh_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "-[PUINetworkController loadConfigurationsForceRefresh:completionHandler:]_block_invoke";
      __int16 v31 = 2114;
      id v32 = v6;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Failed to load with error %{public}@", buf, 0x16u);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [*(id *)(a1 + 32) setDnsConfigurations:v8];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "name", (void)v24);
        if ([v15 isEqualToString:@"com.apple.preferences.networkprivacy"])
        {
          v16 = [v14 pathController];

          if (v16)
          {
            [*(id *)(a1 + 32) setPathControllerConfiguration:v14];
            continue;
          }
        }
        else
        {
        }
        uint64_t v17 = [v14 dnsSettings];
        if (v17)
        {
          v18 = (void *)v17;
          uint64_t v19 = [v14 grade];

          if (v19 == 2)
          {
            v20 = [*(id *)(a1 + 32) dnsConfigurations];
            [v20 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  v21 = [*(id *)(a1 + 32) dnsConfigurations];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    v23 = [*(id *)(a1 + 32) dnsConfigurations];
    [v23 sortUsingFunction:compareConfigurationNames context:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__PUINetworkController_loadConfigurationsForceRefresh_completionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)eligibleApplications
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(PUINetworkController *)self pathControllerConfiguration];
  id v6 = [v5 pathController];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [v6 pathRules];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v12 multicastPreferenceSet])
        {
          id v13 = [v12 matchSigningIdentifier];
          [v4 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  if ([v4 count])
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __44__PUINetworkController_eligibleApplications__block_invoke;
    uint64_t v22 = &unk_1E6E9D990;
    id v23 = v4;
    id v14 = v3;
    id v24 = v14;
    id v15 = _Block_copy(&v19);
    v16 = objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", v19, v20, v21, v22);
    [v16 enumerateApplicationsOfType:0 block:v15];
    [v16 enumerateApplicationsOfType:1 block:v15];
    if ([v14 count]) {
      [v14 sortUsingFunction:compareAppNames context:0];
    }
    id v17 = v14;
  }
  return v3;
}

void __44__PUINetworkController_eligibleApplications__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v7 bundleIdentifier];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
  *a3 = 0;
}

- (id)networkConfigurationEnabled:(id)a3
{
  id v3 = [a3 propertyForKey:@"PUINetworkConfigurationKey"];
  id v4 = [v3 dnsSettings];
  if ([v4 isEnabled]) {
    id v5 = @"On";
  }
  else {
    id v5 = @"Off";
  }
  id v6 = PUI_LocalizedStringForPrivacy(v5);

  return v6;
}

- (id)specifiers
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v22 = (int)*MEMORY[0x1E4F92F08];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    id v6 = PUI_LocalizedStringForPrivacy(@"LOCAL_NETWORK_FOOTER");
    [v5 setProperty:v6 forKey:*MEMORY[0x1E4F93170]];

    id v24 = v4;
    v21 = v5;
    [v4 addObject:v5];
    long long v25 = self;
    [(PUINetworkController *)self eligibleApplications];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      uint64_t v10 = *MEMORY[0x1E4F931D0];
      uint64_t v11 = *MEMORY[0x1E4F931C0];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v14 = [v13 bundleIdentifier];
          id v15 = (void *)MEMORY[0x1E4F92E70];
          v16 = [v13 localizedName];
          id v17 = [v15 preferenceSpecifierNamed:v16 target:v25 set:sel_setLocalNetworkEnabled_specifier_ get:sel_isLocalNetworkEnabled_ detail:objc_opt_class() cell:6 edit:0];

          v18 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
          [v17 setProperty:v18 forKey:v10];

          [v17 setProperty:v14 forKey:v11];
          [v17 setProperty:v14 forKey:@"PUINetworkApplicationKey"];
          [v24 addObject:v17];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }
    uint64_t v19 = *(Class *)((char *)&v25->super.super.super.super.super.isa + v22);
    *(Class *)((char *)&v25->super.super.super.super.super.isa + v22) = (Class)v24;

    id v3 = *(Class *)((char *)&v25->super.super.super.super.super.isa + v22);
  }
  return v3;
}

- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PUINetworkController *)self pathControllerConfiguration];
  uint64_t v8 = [v7 pathController];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = objc_msgSend(v8, "pathRules", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v14 matchSigningIdentifier];
        int v16 = [v15 isEqualToString:v6];

        if (v16)
        {
          id v17 = v14;
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    id v17 = (id)[objc_alloc(MEMORY[0x1E4F38D18]) initWithSigningIdentifier:v6];
    v18 = [v8 pathRules];

    if (v18)
    {
      uint64_t v9 = [v8 pathRules];
      uint64_t v19 = [v9 arrayByAddingObject:v17];
      [v8 setPathRules:v19];
    }
    else
    {
      id v25 = v17;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      [v8 setPathRules:v9];
    }
LABEL_13:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v9 = [a4 propertyForKey:@"PUINetworkApplicationKey"];
  uint64_t v7 = [(PUINetworkController *)self pathRuleForBundleID:v9 create:1];
  int v8 = [v6 BOOLValue];

  [v7 setDenyMulticast:v8 ^ 1u];
  [v7 setMulticastPreferenceSet:1];
  [(PUINetworkController *)self saveConfiguration];
  self->_isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle = 1;
}

- (id)isLocalNetworkEnabled:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"PUINetworkApplicationKey"];
  id v5 = [(PUINetworkController *)self pathRuleForBundleID:v4 create:0];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithBool:", objc_msgSend(v5, "denyMulticast") ^ 1);

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUINetworkController;
  [(PUINetworkController *)&v3 viewWillAppear:a3];
}

- (NEConfiguration)pathControllerConfiguration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setPathControllerConfiguration:(id)a3
{
}

- (NSMutableArray)dnsConfigurations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setDnsConfigurations:(id)a3
{
}

- (BOOL)isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle
{
  return self->_isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle;
}

- (void)setIsWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle:(BOOL)a3
{
  self->_isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsConfigurations, 0);
  objc_storeStrong((id *)&self->_pathControllerConfiguration, 0);
}

@end