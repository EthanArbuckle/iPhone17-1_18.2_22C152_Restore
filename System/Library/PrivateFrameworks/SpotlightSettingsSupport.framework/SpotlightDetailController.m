@interface SpotlightDetailController
- (BOOL)_isApplicationHiddenCheck:(id)a3;
- (BOOL)_isApplicationLockedCheck:(id)a3;
- (id)_appName;
- (id)_bundleId;
- (id)specifiers;
- (id)whileSearchingShowAppEnabled:(id)a3;
- (id)whileSearchingShowContentEnabled:(id)a3;
- (void)_addWhileSearchingSpecifiersToSpecifiers:(id)a3;
- (void)_authenticateForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)_saveWhileSearchingShowAppEnabled:(BOOL)a3;
- (void)_saveWhileSearchingShowContentEnabled:(BOOL)a3;
- (void)setWhileSearchingShowAppEnabled:(id)a3 specifier:(id)a4;
- (void)setWhileSearchingShowContentEnabled:(id)a3 specifier:(id)a4;
@end

@implementation SpotlightDetailController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (!self->_disabledSpotlightBundles)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      v5 = (void (*)(uint64_t))getSPGetDisabledBundleSetSymbolLoc_ptr_0;
      v21 = getSPGetDisabledBundleSetSymbolLoc_ptr_0;
      if (!getSPGetDisabledBundleSetSymbolLoc_ptr_0)
      {
        v6 = (void *)SearchLibrary_0();
        v19[3] = (uint64_t)dlsym(v6, "SPGetDisabledBundleSet");
        getSPGetDisabledBundleSetSymbolLoc_ptr_0 = (_UNKNOWN *)v19[3];
        v5 = (void (*)(uint64_t))v19[3];
      }
      _Block_object_dispose(&v18, 8);
      if (!v5) {
        -[SpotlightAppClipSettingsController specifiers]();
      }
      v5(1);
      v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      disabledSpotlightBundles = self->_disabledSpotlightBundles;
      self->_disabledSpotlightBundles = v7;
    }
    if (!self->_disabledSpotlightApps)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      v9 = (void (*)(uint64_t))getSPGetDisabledAppSetSymbolLoc_ptr_0;
      v21 = getSPGetDisabledAppSetSymbolLoc_ptr_0;
      if (!getSPGetDisabledAppSetSymbolLoc_ptr_0)
      {
        v10 = (void *)SearchLibrary_0();
        v19[3] = (uint64_t)dlsym(v10, "SPGetDisabledAppSet");
        getSPGetDisabledAppSetSymbolLoc_ptr_0 = (_UNKNOWN *)v19[3];
        v9 = (void (*)(uint64_t))v19[3];
      }
      _Block_object_dispose(&v18, 8);
      if (!v9) {
        -[SpotlightAppClipSettingsController specifiers]();
      }
      v9(1);
      v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      disabledSpotlightApps = self->_disabledSpotlightApps;
      self->_disabledSpotlightApps = v11;
    }
    v13 = [(SpotlightDetailController *)self _bundleId];
    self->_isApplicationHidden = [(SpotlightDetailController *)self _isApplicationHiddenCheck:v13];

    v14 = [(SpotlightDetailController *)self _bundleId];
    self->_isApplicationLocked = [(SpotlightDetailController *)self _isApplicationLockedCheck:v14];

    v15 = [MEMORY[0x263EFF980] array];
    [(SpotlightDetailController *)self _addWhileSearchingSpecifiersToSpecifiers:v15];
    v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v15;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)_isApplicationHiddenCheck:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:a3];
  v4 = [MEMORY[0x263F251D0] hiddenApplications];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)_isApplicationLockedCheck:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:a3];
  v4 = [MEMORY[0x263F251D0] lockedApplications];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (void)_addWhileSearchingSpecifiersToSpecifiers:(id)a3
{
  id v30 = a3;
  v4 = (void *)MEMORY[0x263F5FC40];
  char v5 = +[SpotlightSettingsController bundle];
  v6 = [v5 localizedStringForKey:@"SEARCH_PERAPP_WHILESEARCHING_HEADER" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v7 = [v4 groupSpecifierWithName:v6];
  whileSearchingGroup = self->_whileSearchingGroup;
  self->_whileSearchingGroup = v7;

  [v30 addObject:self->_whileSearchingGroup];
  v9 = (void *)MEMORY[0x263F5FC40];
  v10 = +[SpotlightSettingsController bundle];
  v11 = [v10 localizedStringForKey:@"SEARCH_PERAPP_WHILESEARCHING_SHOWAPP_TOGGLE" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v12 = [v9 preferenceSpecifierNamed:v11 target:self set:sel_setWhileSearchingShowAppEnabled_specifier_ get:sel_whileSearchingShowAppEnabled_ detail:0 cell:6 edit:0];
  whileSearchingShowAppSpecifier = self->_whileSearchingShowAppSpecifier;
  self->_whileSearchingShowAppSpecifier = v12;

  uint64_t v14 = *MEMORY[0x263F5FEF8];
  [(PSSpecifier *)self->_whileSearchingShowAppSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  v15 = (void *)MEMORY[0x263F600A8];
  if (self->_isApplicationHidden) {
    [(PSSpecifier *)self->_whileSearchingShowAppSpecifier setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  v16 = (void *)MEMORY[0x263F5FC40];
  v17 = +[SpotlightSettingsController bundle];
  uint64_t v18 = [v17 localizedStringForKey:@"SEARCH_PERAPP_WHILESEARCHING_SHOWCONTENT_TOGGLE" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v19 = [v16 preferenceSpecifierNamed:v18 target:self set:sel_setWhileSearchingShowContentEnabled_specifier_ get:sel_whileSearchingShowContentEnabled_ detail:0 cell:6 edit:0];
  whileSearchingShowContentSpecifier = self->_whileSearchingShowContentSpecifier;
  self->_whileSearchingShowContentSpecifier = v19;

  [(PSSpecifier *)self->_whileSearchingShowContentSpecifier setProperty:MEMORY[0x263EFFA88] forKey:v14];
  if (self->_isApplicationHidden) {
    [(PSSpecifier *)self->_whileSearchingShowContentSpecifier setProperty:MEMORY[0x263EFFA80] forKey:*v15];
  }
  [v30 addObject:self->_whileSearchingShowAppSpecifier];
  v21 = [(SpotlightDetailController *)self whileSearchingShowAppEnabled:0];
  int v22 = [v21 BOOLValue];

  if (v22) {
    [v30 addObject:self->_whileSearchingShowContentSpecifier];
  }
  v23 = self->_whileSearchingGroup;
  v24 = NSString;
  v25 = +[SpotlightSettingsController bundle];
  v26 = [v25 localizedStringForKey:@"SEARCH_PERAPP_WHILESEARCHING_FOOTER" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v27 = [(SpotlightDetailController *)self _appName];
  v28 = [(SpotlightDetailController *)self _appName];
  v29 = objc_msgSend(v24, "stringWithFormat:", v26, v27, v28);
  [(PSSpecifier *)v23 setProperty:v29 forKey:*MEMORY[0x263F600F8]];
}

- (id)whileSearchingShowAppEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  disabledSpotlightApps = self->_disabledSpotlightApps;
  char v5 = [(SpotlightDetailController *)self _bundleId];
  v6 = objc_msgSend(v3, "numberWithInt:", -[NSMutableSet containsObject:](disabledSpotlightApps, "containsObject:", v5) ^ 1);

  return v6;
}

- (void)_authenticateForBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (self->_isApplicationLocked)
  {
    v9 = spotlightSettingsLogHandles;
    if (!spotlightSettingsLogHandles)
    {
      SpotlightSettingsInitLogging();
      v9 = spotlightSettingsLogHandles;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_25E39E000, v9, OS_LOG_TYPE_DEFAULT, "Authenticating via APGuard for locked bundleIdentifier=%@", buf, 0xCu);
    }
    v10 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v6];
    v11 = [MEMORY[0x263F251F8] sharedGuard];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __73__SpotlightDetailController__authenticateForBundleIdentifier_completion___block_invoke;
    v12[3] = &unk_265525040;
    id v13 = v8;
    [v11 authenticateForSubject:v10 relayingAuditToken:1 completion:v12];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __73__SpotlightDetailController__authenticateForBundleIdentifier_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = spotlightSettingsLogHandles;
  if (!spotlightSettingsLogHandles)
  {
    SpotlightSettingsInitLogging();
    id v6 = spotlightSettingsLogHandles;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_25E39E000, v6, OS_LOG_TYPE_DEFAULT, "SNLOG success: %d, error: %@", (uint8_t *)v7, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setWhileSearchingShowAppEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __71__SpotlightDetailController_setWhileSearchingShowAppEnabled_specifier___block_invoke;
  v19[3] = &unk_265525068;
  objc_copyWeak(&v21, &location);
  id v8 = v6;
  id v20 = v8;
  id v9 = (void *)MEMORY[0x2611D50E0](v19);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__SpotlightDetailController_setWhileSearchingShowAppEnabled_specifier___block_invoke_2;
  v17[3] = &unk_265525090;
  objc_copyWeak(&v18, &location);
  uint64_t v10 = (void *)MEMORY[0x2611D50E0](v17);
  v11 = [(SpotlightDetailController *)self _bundleId];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__SpotlightDetailController_setWhileSearchingShowAppEnabled_specifier___block_invoke_3;
  v14[3] = &unk_2655250B8;
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [(SpotlightDetailController *)self _authenticateForBundleIdentifier:v11 completion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __71__SpotlightDetailController_setWhileSearchingShowAppEnabled_specifier___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [*(id *)(a1 + 32) BOOLValue];
  [WeakRetained _saveWhileSearchingShowAppEnabled:v3];
  if (v3)
  {
    v6[0] = WeakRetained[181];
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    [WeakRetained insertContiguousSpecifiers:v4 afterSpecifier:WeakRetained[180] animated:1];
  }
  else
  {
    [WeakRetained _saveWhileSearchingShowContentEnabled:0];
    uint64_t v5 = WeakRetained[181];
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v5 count:1];
    [WeakRetained removeContiguousSpecifiers:v4 animated:1];
  }

  notify_post("com.apple.spotlightui.prefschanged");
}

void __71__SpotlightDetailController_setWhileSearchingShowAppEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __71__SpotlightDetailController_setWhileSearchingShowAppEnabled_specifier___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2 = 40;
  if (a2) {
    uint64_t v2 = 32;
  }
  dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + v2));
}

- (void)_saveWhileSearchingShowAppEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SpotlightDetailController *)self _bundleId];
  disabledSpotlightApps = self->_disabledSpotlightApps;
  if (v3) {
    [(NSMutableSet *)disabledSpotlightApps removeObject:v5];
  }
  else {
    [(NSMutableSet *)disabledSpotlightApps addObject:v5];
  }
  CFPreferencesSetAppValue(@"SBSearchDisabledApps", (CFPropertyListRef)[(NSMutableSet *)self->_disabledSpotlightApps allObjects], @"com.apple.spotlightui");
  v8[0] = @"SBSearchDisabledApps";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  +[SpotlightSettingsUtilities updateSearchPreferencesModificationForKeys:v7];

  CFPreferencesSynchronize(@"com.apple.spotlightui", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
}

- (id)whileSearchingShowContentEnabled:(id)a3
{
  BOOL v3 = NSNumber;
  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  uint64_t v5 = [(SpotlightDetailController *)self _bundleId];
  id v6 = objc_msgSend(v3, "numberWithInt:", -[NSMutableSet containsObject:](disabledSpotlightBundles, "containsObject:", v5) ^ 1);

  return v6;
}

- (void)setWhileSearchingShowContentEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__SpotlightDetailController_setWhileSearchingShowContentEnabled_specifier___block_invoke;
  v19[3] = &unk_265525068;
  objc_copyWeak(&v21, &location);
  id v8 = v6;
  id v20 = v8;
  id v9 = (void *)MEMORY[0x2611D50E0](v19);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__SpotlightDetailController_setWhileSearchingShowContentEnabled_specifier___block_invoke_2;
  v17[3] = &unk_265525090;
  objc_copyWeak(&v18, &location);
  uint64_t v10 = (void *)MEMORY[0x2611D50E0](v17);
  v11 = [(SpotlightDetailController *)self _bundleId];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__SpotlightDetailController_setWhileSearchingShowContentEnabled_specifier___block_invoke_3;
  v14[3] = &unk_2655250B8;
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [(SpotlightDetailController *)self _authenticateForBundleIdentifier:v11 completion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __75__SpotlightDetailController_setWhileSearchingShowContentEnabled_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_saveWhileSearchingShowContentEnabled:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));
  notify_post("com.apple.spotlightui.prefschanged");
}

void __75__SpotlightDetailController_setWhileSearchingShowContentEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __75__SpotlightDetailController_setWhileSearchingShowContentEnabled_specifier___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2 = 40;
  if (a2) {
    uint64_t v2 = 32;
  }
  dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + v2));
}

- (void)_saveWhileSearchingShowContentEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SpotlightDetailController *)self _bundleId];
  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  if (v3) {
    [(NSMutableSet *)disabledSpotlightBundles removeObject:v5];
  }
  else {
    [(NSMutableSet *)disabledSpotlightBundles addObject:v5];
  }
  CFPreferencesSetAppValue(@"SBSearchDisabledBundles", (CFPropertyListRef)[(NSMutableSet *)self->_disabledSpotlightBundles allObjects], @"com.apple.spotlightui");
  v8[0] = @"SBSearchDisabledBundles";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  +[SpotlightSettingsUtilities updateSearchPreferencesModificationForKeys:v7];

  CFPreferencesSynchronize(@"com.apple.spotlightui", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
}

- (id)_bundleId
{
  uint64_t v2 = [(SpotlightDetailController *)self specifier];
  BOOL v3 = [v2 propertyForKey:@"BUNDLE_ID"];

  return v3;
}

- (id)_appName
{
  uint64_t v2 = [(SpotlightDetailController *)self specifier];
  BOOL v3 = [v2 propertyForKey:@"APP_NAME"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whileSearchingShowContentSpecifier, 0);
  objc_storeStrong((id *)&self->_whileSearchingShowAppSpecifier, 0);
  objc_storeStrong((id *)&self->_whileSearchingGroup, 0);
  objc_storeStrong((id *)&self->_disabledSuggestApps, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightShortcuts, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightApps, 0);
  objc_storeStrong((id *)&self->_disabledLockScreenBundles, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
}

@end