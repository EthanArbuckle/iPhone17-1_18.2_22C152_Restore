@interface STRestrictingApplicationsGroupSpecifierProvider
- (NSArray)authorizationRecords;
- (STRestrictingApplicationsGroupSpecifierProvider)init;
- (id)isFamilyControlsEnabled:(id)a3;
- (int64_t)getAuthorizationStatusForRecordIdentifier:(id)a3 fromRecords:(id)a4;
- (void)_updateSpecifiersWithAuthorizationRecords;
- (void)setAuthorizationRecords:(id)a3;
- (void)setFamilyControlsEnabled:(id)a3 forSpecifier:(id)a4;
@end

@implementation STRestrictingApplicationsGroupSpecifierProvider

- (STRestrictingApplicationsGroupSpecifierProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)STRestrictingApplicationsGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v9 init];
  authorizationRecords = v2->_authorizationRecords;
  v2->_authorizationRecords = (NSArray *)MEMORY[0x263EFFA68];

  [(STGroupSpecifierProvider *)v2 setIsHidden:1];
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__STRestrictingApplicationsGroupSpecifierProvider_init__block_invoke;
  block[3] = &unk_264766F30;
  v5 = v2;
  v8 = v5;
  dispatch_async(v4, block);

  return v5;
}

void __55__STRestrictingApplicationsGroupSpecifierProvider_init__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F3C070] sharedCenter];
  v3 = [v2 authorizationRecords];
  [*(id *)(a1 + 32) setAuthorizationRecords:v3];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__STRestrictingApplicationsGroupSpecifierProvider_init__block_invoke_2;
  block[3] = &unk_264766F30;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__STRestrictingApplicationsGroupSpecifierProvider_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSpecifiersWithAuthorizationRecords];
}

- (void)_updateSpecifiersWithAuthorizationRecords
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [(STRestrictingApplicationsGroupSpecifierProvider *)self authorizationRecords];
  if ([v3 count])
  {
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v22 = [v4 localizedStringForKey:@"STAccessListTitle" value:&stru_26D9391A8 table:0];
    id v5 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:");
    v6 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"STAccessListDetail"];
    v23 = v4;
    v7 = [v4 localizedStringForKey:v6 value:&stru_26D9391A8 table:0];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [v5 setTarget:self];
    v21 = v5;
    [(STGroupSpecifierProvider *)self setGroupSpecifier:v5];
    v26 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v24 = v3;
    id obj = v3;
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      uint64_t v25 = *MEMORY[0x263F60140];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v13 = [v12 bundleIdentifier];
          v14 = [v12 recordIdentifier];
          if ([v12 status] != 1)
          {
            v15 = [MEMORY[0x263F670A8] sharedCache];
            v16 = [v15 appInfoForBundleIdentifier:v13];
            v17 = [v16 displayName];

            v18 = [MEMORY[0x263F67408] sharedCache];
            v19 = [v18 imageForBundleIdentifier:v13];

            v20 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v17 target:self set:sel_setFamilyControlsEnabled_forSpecifier_ get:sel_isFamilyControlsEnabled_ detail:0 cell:6 edit:0];
            [v20 setObject:v19 forKeyedSubscript:v25];
            [v20 setObject:v14 forKeyedSubscript:@"RecordID"];
            [v26 addObject:v20];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v9);
    }

    [(STGroupSpecifierProvider *)self setIsHidden:0];
    v3 = v24;
  }
  else
  {
    [(STGroupSpecifierProvider *)self setIsHidden:1];
  }
}

- (int64_t)getAuthorizationStatusForRecordIdentifier:(id)a3 fromRecords:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "recordIdentifier", (void)v18);
        v13 = [v12 UUIDString];
        v14 = [v5 UUIDString];
        char v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          int64_t v16 = [v11 status];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int64_t v16 = 1;
LABEL_11:

  return v16;
}

- (void)setFamilyControlsEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKeyedSubscript:@"RecordID"];
  uint64_t v7 = [(STRestrictingApplicationsGroupSpecifierProvider *)self authorizationRecords];
  int64_t v8 = [(STRestrictingApplicationsGroupSpecifierProvider *)self getAuthorizationStatusForRecordIdentifier:v6 fromRecords:v7];

  uint64_t v9 = [MEMORY[0x263F3C070] sharedCenter];
  uint64_t v10 = [v5 objectForKeyedSubscript:@"RecordID"];
  if (v8 == 2)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke;
    v16[3] = &unk_264767F80;
    v11 = &v17;
    v16[4] = self;
    id v17 = v5;
    id v12 = v5;
    [v9 resetAuthorizationForRecordIdentifier:v10 completionHandler:v16];
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_23;
    v14[3] = &unk_264767F80;
    v11 = &v15;
    v14[4] = self;
    id v15 = v5;
    id v13 = v5;
    [v9 requestAuthorizationForRecordIdentifier:v10 completionHandler:v14];
  }
}

void __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [MEMORY[0x263F3C070] sharedCenter];
    uint64_t v7 = [v6 authorizationRecords];
    [*(id *)(a1 + 32) setAuthorizationRecords:v7];
  }
  else
  {
    int64_t v8 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2;
    v14 = &unk_264767078;
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v9;
    [v8 addOperationWithBlock:&v11];

    uint64_t v10 = +[STUILog accessList];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_cold_1((uint64_t)v5, v10);
    }
  }
}

uint64_t __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

void __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [MEMORY[0x263F3C070] sharedCenter];
    uint64_t v7 = [v6 authorizationRecords];
    [*(id *)(a1 + 32) setAuthorizationRecords:v7];
  }
  else
  {
    int64_t v8 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2_24;
    v14 = &unk_264767078;
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v9;
    [v8 addOperationWithBlock:&v11];

    uint64_t v10 = +[STUILog accessList];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_23_cold_1((uint64_t)v5, v10);
    }
  }
}

uint64_t __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

- (id)isFamilyControlsEnabled:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"RecordID"];
  id v5 = [(STRestrictingApplicationsGroupSpecifierProvider *)self authorizationRecords];
  if ([(STRestrictingApplicationsGroupSpecifierProvider *)self getAuthorizationStatusForRecordIdentifier:v4 fromRecords:v5] == 2)id v6 = (void *)MEMORY[0x263EFFA88]; {
  else
  }
    id v6 = (void *)MEMORY[0x263EFFA80];
  id v7 = v6;

  return v7;
}

- (NSArray)authorizationRecords
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthorizationRecords:(id)a3
{
}

- (void).cxx_destruct
{
}

void __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Authorization's reset failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __89__STRestrictingApplicationsGroupSpecifierProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_23_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Request for authorization failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end