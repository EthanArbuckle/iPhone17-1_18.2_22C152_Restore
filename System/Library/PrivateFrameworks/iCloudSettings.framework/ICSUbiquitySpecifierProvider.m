@interface ICSUbiquitySpecifierProvider
+ (BOOL)isSpecifierHiddenForBundleID:(id)a3 ubiquityAccessManager:(id)a4;
+ (id)appAccessGrantedForBundleID:(id)a3 ubiquityAccessManager:(id)a4;
- (BOOL)_isAccountInGrayMode;
- (BOOL)_shouldShowUbiquitySpecifier;
- (BOOL)shouldShowSpecifierForDataclass:(id)a3;
- (ICSSpecifierProviderDelegate)delegate;
- (ICSUbiquityAccessManager)ubiquityAccessManager;
- (ICSUbiquitySpecifierProvider)init;
- (ICSUbiquitySpecifierProvider)initWithAccountManager:(id)a3;
- (ICSUbiquitySpecifierProviderDelegate)ubiquityDelegate;
- (NSArray)appsUsingUbiquity;
- (id)_account;
- (id)_appAccessGrantedForSpecifier:(id)a3;
- (id)_appSpecifierWithBundleID:(id)a3;
- (id)_appSpecifiersForUbiquityServices;
- (id)_dataclassState:(id)a3;
- (id)_groupUbiquityServices:(id)a3;
- (id)_isDocumentsAndDataEnabled:(id)a3;
- (id)_ubiquitySpecifier;
- (id)specifiers;
- (id)ubiquityDataclassSwitchSpecifier;
- (id)ubiquityLinklistSpecifier;
- (id)ubiquitySpecifier;
- (void)_clearSpecifiers;
- (void)_loadiCloudDriveSettingsBundleIfNeeded;
- (void)_presentiCloudUpgradeFlowForSpecifier:(id)a3;
- (void)_setAppAccessGranted:(id)a3 forSpecifier:(id)a4;
- (void)_setDocumentsAndDataEnabled:(id)a3 forSpecifier:(id)a4;
- (void)_startObservingTCCAccessChanges;
- (void)_startUsingiCloudDriveWithSpecifier:(id)a3;
- (void)_stopObservingTCCAccessChanges;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setUbiquityDelegate:(id)a3;
@end

@implementation ICSUbiquitySpecifierProvider

- (ICSUbiquitySpecifierProvider)init
{
  return 0;
}

- (ICSUbiquitySpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICSUbiquitySpecifierProvider;
  v6 = [(ICSUbiquitySpecifierProvider *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    uint64_t v8 = +[ICSUbiquityAccessManager sharedInstance];
    ubiquityAccessManager = v7->_ubiquityAccessManager;
    v7->_ubiquityAccessManager = (ICSUbiquityAccessManager *)v8;

    v10 = [_TtC14iCloudSettings22ICSAnalyticsController alloc];
    v11 = [(AIDAAccountManager *)v7->_accountManager accounts];
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
    uint64_t v13 = [(ICSAnalyticsController *)v10 initWithAccount:v12];
    analyticsController = v7->_analyticsController;
    v7->_analyticsController = (_TtC14iCloudSettings22ICSAnalyticsController *)v13;

    [(ICSUbiquitySpecifierProvider *)v7 _startObservingTCCAccessChanges];
  }

  return v7;
}

- (void)dealloc
{
  [(ICSUbiquitySpecifierProvider *)self _stopObservingTCCAccessChanges];
  v3.receiver = self;
  v3.super_class = (Class)ICSUbiquitySpecifierProvider;
  [(ICSUbiquitySpecifierProvider *)&v3 dealloc];
}

- (id)_account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  objc_super v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (id)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    if ([(ICSUbiquitySpecifierProvider *)self shouldShowSpecifierForDataclass:*MEMORY[0x263EFB4C0]])
    {
      v4 = [(ICSUbiquitySpecifierProvider *)self _appSpecifiersForUbiquityServices];
      id v5 = [(ICSUbiquitySpecifierProvider *)self _groupUbiquityServices:v4];
    }
    else
    {
      id v5 = 0;
    }
    v6 = self->_specifiers;
    self->_specifiers = v5;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (BOOL)shouldShowSpecifierForDataclass:(id)a3
{
  v4 = (void *)MEMORY[0x263F25810];
  id v5 = a3;
  v6 = [v4 sharedManager];
  v7 = [(ICSUbiquitySpecifierProvider *)self _account];
  int v8 = [v6 shouldShowDataclass:v5 forAccount:v7];

  if (v8)
  {
    v9 = [(ICSUbiquitySpecifierProvider *)self _account];
    char v10 = objc_msgSend(v9, "aa_isAccountClass:", *MEMORY[0x263F25618]);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)ubiquitySpecifier
{
  objc_super v3 = [MEMORY[0x263F25810] sharedManager];
  uint64_t v4 = *MEMORY[0x263EFB4C0];
  id v5 = [(ICSUbiquitySpecifierProvider *)self _account];
  LODWORD(v4) = [v3 shouldShowDataclass:v4 forAccount:v5];

  if (v4)
  {
    v6 = [(ICSUbiquitySpecifierProvider *)self _ubiquitySpecifier];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_ubiquitySpecifier
{
  objc_super v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = *MEMORY[0x263EFB4C0];
  id v5 = [(ICSUbiquitySpecifierProvider *)self _account];
  v6 = objc_msgSend(v3, "acui_specifierForDataclass:account:target:set:get:", v4, v5, self, sel__setDocumentsAndDataEnabled_forSpecifier_, sel__isDocumentsAndDataEnabled_);

  v7 = [MEMORY[0x263F53C50] sharedConnection];
  LODWORD(v4) = [v7 effectiveBoolValueForSetting:*MEMORY[0x263F53860]];

  if (v4 == 2) {
    [v6 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }

  return v6;
}

- (id)ubiquityDataclassSwitchSpecifier
{
  if ([(ICSUbiquitySpecifierProvider *)self _shouldShowUbiquitySpecifier])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F25820]);
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DATACLASS_CELL_TITLE"];
    v6 = [v4 localizedStringForKey:v5 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

    v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:sel__setDocumentsAndDataEnabled_forSpecifier_ get:sel__isDocumentsAndDataEnabled_ detail:0 cell:6 edit:0];
    uint64_t v8 = *MEMORY[0x263F600A8];
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
    uint64_t v9 = *MEMORY[0x263EFAD48];
    [v7 setObject:*MEMORY[0x263EFAD48] forKeyedSubscript:*MEMORY[0x263F60138]];
    [v7 setObject:v9 forKeyedSubscript:@"com.apple.accountsui.dataclass"];
    char v10 = [MEMORY[0x263F53C50] sharedConnection];
    int v11 = [v10 effectiveBoolValueForSetting:*MEMORY[0x263F53860]];

    if (v11 == 2) {
      [v7 setProperty:MEMORY[0x263EFFA80] forKey:v8];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)ubiquityLinklistSpecifier
{
  if ([(ICSUbiquitySpecifierProvider *)self _shouldShowUbiquitySpecifier])
  {
    id v3 = (void *)MEMORY[0x263F5FC40];
    uint64_t v4 = *MEMORY[0x263EFAD48];
    id v5 = [(ICSUbiquitySpecifierProvider *)self _account];
    v6 = objc_msgSend(v3, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", v4, v5, self, 0, sel__dataclassState_, objc_opt_class());

    v7 = [MEMORY[0x263F53C50] sharedConnection];
    int v8 = [v7 effectiveBoolValueForSetting:*MEMORY[0x263F53860]];

    if (v8 == 2) {
      [v6 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    }
    [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x263F60138]];
    [v6 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_dataclassState:(id)a3
{
  id v3 = [(ICSUbiquitySpecifierProvider *)self _isDocumentsAndDataEnabled:a3];
  int v4 = [v3 BOOLValue];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v4) {
    v7 = @"ON";
  }
  else {
    v7 = @"OFF";
  }
  int v8 = [v5 localizedStringForKey:v7 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  return v8;
}

- (BOOL)_shouldShowUbiquitySpecifier
{
  id v3 = [MEMORY[0x263F25810] sharedManager];
  uint64_t v4 = *MEMORY[0x263EFAD48];
  id v5 = [(ICSUbiquitySpecifierProvider *)self _account];
  LOBYTE(v4) = [v3 shouldShowDataclass:v4 forAccount:v5];

  return v4;
}

- (id)_groupUbiquityServices:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  v38 = v3;
  id v5 = (void *)[v3 mutableCopy];
  v6 = [v5 specifierForID:@"com.apple.iBooks"];
  if (v6)
  {
    [v4 addObject:v6];
    [v5 removeObject:v6];
  }
  v7 = [v5 specifierForID:@"com.apple.Pages"];

  if (v7)
  {
    [v4 addObject:v7];
    [v5 removeObject:v7];
  }
  int v8 = [v5 specifierForID:@"com.apple.Numbers"];

  if (v8)
  {
    [v4 addObject:v8];
    [v5 removeObject:v8];
  }
  uint64_t v9 = [v5 specifierForID:@"com.apple.Keynote"];

  if (v9)
  {
    [v4 addObject:v9];
    [v5 removeObject:v9];
  }
  char v10 = [v5 specifierForID:@"com.apple.mobilegarageband"];

  if (v10)
  {
    [v4 addObject:v10];
    [v5 removeObject:v10];
  }
  uint64_t v11 = [v5 specifierForID:@"com.apple.iMovie"];

  if (v11)
  {
    [v4 addObject:v11];
    [v5 removeObject:v11];
  }
  v35 = (void *)v11;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v12 = (id)[v5 copy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v18 = [v17 identifier];
        int v19 = [v18 hasPrefix:@"com.apple."];

        if (v19)
        {
          [v4 addObject:v17];
          [v5 removeObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v14);
  }

  if ([v4 count])
  {
    v20 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"APPS_GROUP_3"];
    [v4 insertObject:v20 atIndex:0];
  }
  if (objc_msgSend(v5, "count", v12))
  {
    v21 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"APPS_GROUP_4"];
    [v5 insertObject:v21 atIndex:0];
  }
  v36 = v5;
  v37 = v4;
  [v4 arrayByAddingObjectsFromArray:v5];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v43;
    uint64_t v25 = *MEMORY[0x263F60138];
    uint64_t v40 = *MEMORY[0x263F5FFE0];
    uint64_t v39 = *MEMORY[0x263F602C8];
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        uint64_t v28 = [v27 objectForKeyedSubscript:v25];
        if (v28)
        {
          v29 = (void *)v28;
          v30 = [v27 objectForKeyedSubscript:v25];
          if ([v30 isEqualToString:@"APPS_GROUP_3"])
          {
          }
          else
          {
            v31 = [v27 objectForKeyedSubscript:v25];
            char v32 = [v31 isEqualToString:@"APPS_GROUP_4"];

            if ((v32 & 1) == 0)
            {
              [v27 setObject:objc_opt_class() forKeyedSubscript:v40];
              [v27 setObject:&stru_270DEF3F8 forKeyedSubscript:v39];
            }
          }
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v23);
  }

  return obj;
}

- (id)_appSpecifiersForUbiquityServices
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  if ([MEMORY[0x263F25820] isMultiUserMode])
  {
    uint64_t v4 = (void *)[v3 copy];
    id v5 = v3;
  }
  else
  {
    v6 = [(ICSUbiquityAccessManager *)self->_ubiquityAccessManager allBundleIDs];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__ICSUbiquitySpecifierProvider__appSpecifiersForUbiquityServices__block_invoke;
    v10[3] = &unk_2655B5B58;
    v10[4] = self;
    v7 = objc_msgSend(v6, "aaf_map:", v10);
    id v5 = (void *)[v7 mutableCopy];

    [v5 sortUsingComparator:&__block_literal_global_0];
    int v8 = LogSubsystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "Returning TCC/Ubiquity Specifiers: %@", buf, 0xCu);
    }

    uint64_t v4 = (void *)[v5 copy];
  }

  return v4;
}

uint64_t __65__ICSUbiquitySpecifierProvider__appSpecifiersForUbiquityServices__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _appSpecifierWithBundleID:a2];
}

uint64_t __65__ICSUbiquitySpecifierProvider__appSpecifiersForUbiquityServices__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)_appSpecifierWithBundleID:(id)a3
{
  id v4 = a3;
  if (+[ICSUbiquitySpecifierProvider isSpecifierHiddenForBundleID:v4 ubiquityAccessManager:self->_ubiquityAccessManager])
  {
    id v5 = 0;
  }
  else
  {
    v6 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v4];
    uint64_t v7 = (void *)MEMORY[0x263F5FC40];
    int v8 = [v6 localizedName];
    id v5 = [v7 preferenceSpecifierNamed:v8 target:self set:sel__setAppAccessGranted_forSpecifier_ get:sel__appAccessGrantedForSpecifier_ detail:0 cell:6 edit:0];

    [v5 setIdentifier:v4];
    [v5 setProperty:v4 forKey:*MEMORY[0x263F60188]];
    uint64_t v9 = MEMORY[0x263EFFA88];
    [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
    char v10 = [MEMORY[0x263F53C50] sharedConnection];
    int v11 = [v10 isCloudSyncAllowed:v4];

    if (v11) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = MEMORY[0x263EFFA80];
    }
    [v5 setProperty:v12 forKey:*MEMORY[0x263F600A8]];
  }

  return v5;
}

- (void)_clearSpecifiers
{
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  ubiquityAccessManager = self->_ubiquityAccessManager;

  [(ICSUbiquityAccessManager *)ubiquityAccessManager reloadAccessInfo];
}

- (BOOL)_isAccountInGrayMode
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v3)
  {
    if ((objc_msgSend(v3, "aa_isSuspended") & 1) != 0 || !objc_msgSend(v3, "aa_isPrimaryEmailVerified"))
    {
      BOOL v5 = 1;
    }
    else
    {
      id v4 = objc_msgSend(v3, "aa_repairState");
      BOOL v5 = [v4 unsignedIntegerValue] == 3;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isSpecifierHiddenForBundleID:(id)a3 ubiquityAccessManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v5];
  int v8 = [v7 appState];
  int v9 = [v8 isInstalled];

  if (v9)
  {
    char v10 = [v7 entitlementValueForKey:@"com.apple.private.appleaccount.app-hidden-from-icloud-settings" ofClass:objc_opt_class()];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 BOOLValue])
    {
      int v11 = +[ICSUbiquitySpecifierProvider appAccessGrantedForBundleID:v5 ubiquityAccessManager:v6];

      if (v11)
      {
        BOOL v12 = 1;
      }
      else
      {
        BOOL v12 = 1;
        [v6 setAppAccessGranted:1 forBundleID:v5];
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (id)_isDocumentsAndDataEnabled:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [v8 specifierProvider:self isDataclassAvailableForSpecifier:v4];

    if (v9)
    {
      char v10 = NSNumber;
      int v11 = [(ICSUbiquitySpecifierProvider *)self _account];
      if ([v11 isEnabledForDataclass:*MEMORY[0x263EFB4C0]])
      {
        BOOL v12 = [(ICSUbiquitySpecifierProvider *)self _account];
        uint64_t v13 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v12, "aa_isUsingCloudDocs"));
      }
      else
      {
        uint64_t v13 = [v10 numberWithInt:0];
      }

      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v14 = LogSubsystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICSUbiquitySpecifierProvider _isDocumentsAndDataEnabled:]((id *)p_delegate);
    }
  }
  uint64_t v13 = (void *)MEMORY[0x263EFFA80];
LABEL_11:

  return v13;
}

- (void)_setDocumentsAndDataEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  -[ICSAnalyticsController sendToggleEventForDataclassID:actionType:enabled:](self->_analyticsController, "sendToggleEventForDataclassID:actionType:enabled:", *MEMORY[0x263EFAD48], 0, [v6 BOOLValue]);
  id v8 = [(ICSUbiquitySpecifierProvider *)self _account];
  char v9 = objc_msgSend(v8, "aa_isUsingCloudDocs");

  if (v9)
  {
    char v10 = LogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(ICSUbiquitySpecifierProvider *)self _account];
      int v12 = [v6 BOOLValue];
      uint64_t v13 = @"NO";
      if (v12) {
        uint64_t v13 = @"YES";
      }
      int v17 = 138412546;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_262993000, v10, OS_LOG_TYPE_DEFAULT, "Updating account %@ ubiquity state to %@.", (uint8_t *)&v17, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 specifierProvider:self dataclassSwitchStateDidChange:v6 withSpecifier:v7];
    }
  }
  else
  {
    [(ICSUbiquitySpecifierProvider *)self _presentiCloudUpgradeFlowForSpecifier:v7];
  }
}

- (void)_startUsingiCloudDriveWithSpecifier:(id)a3
{
  id v15 = a3;
  [(ICSUbiquitySpecifierProvider *)self _loadiCloudDriveSettingsBundleIfNeeded];
  id v4 = objc_alloc_init(NSClassFromString(&cfstr_Cdsupgradeview.isa));
  uint64_t v5 = [v15 userInfo];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v15 userInfo];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

LABEL_5:
      char v10 = [v15 userInfo];
      int v11 = (void *)[v10 mutableCopy];

      goto LABEL_7;
    }
    id v8 = [v15 userInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_5;
    }
  }
  int v11 = [MEMORY[0x263EFF9A0] dictionary];
LABEL_7:
  int v12 = [(ICSUbiquitySpecifierProvider *)self _account];
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F23118]];

  uint64_t v13 = (void *)[v11 copy];
  [v15 setUserInfo:v13];

  [v4 setSpecifier:v15];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityDelegate);
  [WeakRetained ubiquityProviderShowViewController:v4];
}

- (void)_presentiCloudUpgradeFlowForSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"ICLOUD_SERVICE_UBIQUITY_UPGRAGE_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"ICLOUD_SERVICE_UBIQUITY_UPGRAGE_MESSAGE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  char v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v10 = [v9 localizedStringForKey:@"ICLOUD_SERVICE_UBIQUITY_UPGRAGE_BUTTON_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  uint64_t v13 = (void *)MEMORY[0x263F82418];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  __int16 v19 = __70__ICSUbiquitySpecifierProvider__presentiCloudUpgradeFlowForSpecifier___block_invoke;
  v20 = &unk_2655B5978;
  uint64_t v21 = self;
  id v22 = v4;
  id v14 = v4;
  id v15 = [v13 alertWithTitle:v6 message:v8 cancelButtonTitle:v12 defaultButtonTitle:v10 actionHandler:&v17];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:showViewController:", self, v15, v17, v18, v19, v20, v21);
}

void __70__ICSUbiquitySpecifierProvider__presentiCloudUpgradeFlowForSpecifier___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) _startUsingiCloudDriveWithSpecifier:*(void *)(a1 + 40)];
  }
  id v3 = *(id **)(a1 + 32);
  id v4 = v3[5];
  [v3 _clearSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained reloadSpecifiersForProvider:*(void *)(a1 + 32) oldSpecifiers:v4 animated:1];
}

- (void)_loadiCloudDriveSettingsBundleIfNeeded
{
  v2 = MEMORY[0x263E5BB10](self, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/AccountSettings"];

  id v4 = [v3 stringByAppendingPathComponent:@"iCloudDriveSettings.bundle"];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithPath:v4];
  if (([v5 isLoaded] & 1) == 0)
  {
    id v6 = LogSubsystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "iCloud Drive settings bundle not loaded. Loading...", v7, 2u);
    }

    [v5 load];
  }
}

- (void)_startObservingTCCAccessChanges
{
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x263EF83A0];
  id v4 = MEMORY[0x263EF83A0];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __63__ICSUbiquitySpecifierProvider__startObservingTCCAccessChanges__block_invoke;
  handler[3] = &unk_2655B5BA0;
  objc_copyWeak(&v9, &location);
  uint32_t v5 = notify_register_dispatch("com.apple.tcc.access.changed", &self->_tccObserverToken, v3, handler);

  if (v5)
  {
    id v6 = LogSubsystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "Error registering for TCC notification.", v7, 2u);
    }
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__ICSUbiquitySpecifierProvider__startObservingTCCAccessChanges__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = *((id *)WeakRetained + 5);
    id v4 = LogSubsystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v5 = @"YES";
      if (!v3) {
        uint32_t v5 = @"NO";
      }
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "ICSUbiquitySpecifierProvider received TCC access changed notification (has old specifiers: %@)", (uint8_t *)&v7, 0xCu);
    }

    [v2 _clearSpecifiers];
    id v6 = [v2 delegate];
    [v6 replaceContiguousSpecifiers:v3 withSpecifiers:v2[5] animated:0];
  }
}

- (void)_stopObservingTCCAccessChanges
{
  if (notify_is_valid_token(self->_tccObserverToken))
  {
    int tccObserverToken = self->_tccObserverToken;
    notify_cancel(tccObserverToken);
  }
}

- (id)_appAccessGrantedForSpecifier:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [v8 specifierProvider:self isDataclassAvailableForSpecifier:v4];

    if (v9)
    {
      char v10 = [v4 identifier];
      int v11 = +[ICSUbiquitySpecifierProvider appAccessGrantedForBundleID:v10 ubiquityAccessManager:self->_ubiquityAccessManager];

      goto LABEL_8;
    }
  }
  else
  {
    int v12 = LogSubsystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICSUbiquitySpecifierProvider _isDocumentsAndDataEnabled:]((id *)p_delegate);
    }
  }
  int v11 = (void *)MEMORY[0x263EFFA80];
LABEL_8:

  return v11;
}

+ (id)appAccessGrantedForBundleID:(id)a3 ubiquityAccessManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x263F53C50] sharedConnection];
  int v8 = [v7 isCloudSyncAllowed:v5];

  if (v8)
  {
    char v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isAccessGrantedForBundleID:", v5));
  }
  else
  {
    char v9 = (void *)MEMORY[0x263EFFA80];
  }

  return v9;
}

- (void)_setAppAccessGranted:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__ICSUbiquitySpecifierProvider__setAppAccessGranted_forSpecifier___block_invoke;
    v11[3] = &unk_2655B5BC8;
    objc_copyWeak(&v14, &location);
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [v10 validateDataclassAccessForProvider:self specifier:v13 completion:v11];

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);
}

void __66__ICSUbiquitySpecifierProvider__setAppAccessGranted_forSpecifier___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && a2)
  {
    id v8 = WeakRetained;
    id v5 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v6 = [*(id *)(a1 + 40) BOOLValue];
    id v7 = [*(id *)(a1 + 48) identifier];
    [v5 setAppAccessGranted:v6 forBundleID:v7];

    id WeakRetained = v8;
  }
}

- (NSArray)appsUsingUbiquity
{
  return [(ICSUbiquityAccessManager *)self->_ubiquityAccessManager allBundleIDs];
}

- (ICSSpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICSSpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (ICSUbiquitySpecifierProviderDelegate)ubiquityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityDelegate);

  return (ICSUbiquitySpecifierProviderDelegate *)WeakRetained;
}

- (void)setUbiquityDelegate:(id)a3
{
}

- (ICSUbiquityAccessManager)ubiquityAccessManager
{
  return self->_ubiquityAccessManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityAccessManager, 0);
  objc_destroyWeak((id *)&self->_ubiquityDelegate);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsController, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_isDocumentsAndDataEnabled:(id *)a1 .cold.1(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_0_1(&dword_262993000, v2, v3, "Delegate (%@) does not respond to 'specifierProvider:isDataclassAvailableForSpecifier:'", v4, v5, v6, v7, 2u);
}

@end