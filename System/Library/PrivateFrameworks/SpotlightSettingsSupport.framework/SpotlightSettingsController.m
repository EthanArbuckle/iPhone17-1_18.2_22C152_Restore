@interface SpotlightSettingsController
+ (id)bundle;
- (id)isAnonymouslyRecordSearchQueriesEnabled;
- (id)isShowInLookUpEnabled;
- (id)isShowInSpotlightEnabled;
- (id)isShowZKWRecentsEnabled:(id)a3;
- (id)specifiers;
- (void)configureAnonymouslyRecordingQueries:(id)a3;
- (void)configureApplicationListSpecifiersFor:(id)a3;
- (void)configureSafariSearchEngine:(id)a3;
- (void)configureSearchAndLoookupSpecifiersFor:(id)a3;
- (void)refreshSafariSearchEnginePreference:(id)a3;
- (void)saveSpotlightSettings;
- (void)setAnonymouslyRecordSearchQueriesEnabled:(id)a3;
- (void)setShowInLookUpEnabled:(id)a3;
- (void)setShowInSpotlightEnabled:(id)a3;
- (void)setShowZKWRecentsEnabled:(id)a3 forSpecifier:(id)a4;
- (void)showAboutSearchSuggestionsSheet:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SpotlightSettingsController

+ (id)bundle
{
  v2 = (void *)bundle_sSpotlightBundle_1;
  if (!bundle_sSpotlightBundle_1)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sSpotlightBundle_1;
    bundle_sSpotlightBundle_1 = v3;

    v2 = (void *)bundle_sSpotlightBundle_1;
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SpotlightSettingsController;
  [(SpotlightSettingsController *)&v10 viewDidAppear:a3];
  +[SpotlightSettingsUtilities logSearchPreferencesModificationState];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Search"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = [(id)objc_opt_class() bundle];
  v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"SEARCH" table:@"SpotlightSettings" locale:v6 bundleURL:v8];

  [(SpotlightSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.search" title:v9 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v4];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [(SpotlightSettingsController *)self loadSpecifiersFromPlistName:@"SpotlightSettings" target:self];
    v6 = +[SpotlightSettingsController bundle];
    v7 = [v6 localizedStringForKey:@"SEARCH" value:&stru_270B1D938 table:@"SpotlightSettings"];
    [(SpotlightSettingsController *)self setTitle:v7];

    [(SpotlightSettingsController *)self configureSearchAndLoookupSpecifiersFor:v5];
    [(SpotlightSettingsController *)self configureSafariSearchEngine:v5];
    [(SpotlightSettingsController *)self configureAnonymouslyRecordingQueries:v5];
    [(SpotlightSettingsController *)self configureApplicationListSpecifiersFor:v5];
    v8 = (objc_class *)[v5 copy];
    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v8;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)configureSearchAndLoookupSpecifiersFor:(id)a3
{
  v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  v6 = +[SpotlightSettingsController bundle];
  v7 = [v6 localizedStringForKey:@"SEARCH_AND_LOOKUP_GROUP" value:&stru_270B1D938 table:@"SpotlightSettings"];
  id v32 = [v4 groupSpecifierWithName:v7];

  v8 = [MEMORY[0x263F5B8F0] linkWithBundleIdentifier:@"com.apple.onboarding.sirisuggestions"];
  v9 = [v8 flow];
  uint64_t v10 = [v9 localizedButtonTitle];

  v11 = NSString;
  v12 = +[SpotlightSettingsController bundle];
  v13 = [v12 localizedStringForKey:@"SEARCH_AND_LOOKUP_FOOTER" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v31 = (void *)v10;
  v14 = [v11 stringWithFormat:@"%@ %@", v13, v10];

  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v32 setObject:v16 forKeyedSubscript:*MEMORY[0x263F600C0]];

  [v32 setObject:v14 forKeyedSubscript:*MEMORY[0x263F600E8]];
  v34.location = [v14 rangeOfString:v10];
  v17 = NSStringFromRange(v34);
  [v32 setObject:v17 forKeyedSubscript:*MEMORY[0x263F600D0]];

  v18 = self;
  v19 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v32 setObject:v19 forKeyedSubscript:*MEMORY[0x263F600E0]];

  [v32 setObject:@"showAboutSearchSuggestionsSheet:" forKeyedSubscript:*MEMORY[0x263F600C8]];
  [v5 addObject:v32];
  v20 = (void *)MEMORY[0x263F5FC40];
  v21 = +[SpotlightSettingsController bundle];
  v22 = [v21 localizedStringForKey:@"SEARCH_AND_LOOKUP_SHOW_RECENTS" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v23 = [v20 preferenceSpecifierNamed:v22 target:v18 set:sel_setShowZKWRecentsEnabled_forSpecifier_ get:sel_isShowZKWRecentsEnabled_ detail:0 cell:6 edit:0];

  uint64_t v24 = *MEMORY[0x263F600A8];
  uint64_t v25 = MEMORY[0x263EFFA88];
  [v23 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  uint64_t v26 = *MEMORY[0x263F5FEF8];
  [v23 setProperty:v25 forKey:*MEMORY[0x263F5FEF8]];
  [v5 addObject:v23];
  v27 = (void *)MEMORY[0x263F5FC40];
  v28 = +[SpotlightSettingsController bundle];
  v29 = [v28 localizedStringForKey:@"SEARCH_AND_LOOKUP_SHOW_RELATED_CONTENT" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v30 = [v27 preferenceSpecifierNamed:v29 target:v18 set:sel_setShowInSpotlightEnabled_ get:sel_isShowInSpotlightEnabled detail:0 cell:6 edit:0];

  [v30 setProperty:v25 forKey:v24];
  [v30 setProperty:v25 forKey:v26];
  [v5 addObject:v30];
}

- (void)configureSafariSearchEngine:(id)a3
{
  v53[9] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
  [v5 setIdentifier:@"SEARCH_ENGINE_SETTING_GROUP"];
  v52[0] = *MEMORY[0x263F602D0];
  v6 = +[SpotlightSettingsController bundle];
  v7 = [v6 localizedStringForKey:@"SAFARI_SEARCH_ENGINE" value:&stru_270B1D938 table:@"SpotlightSettings"];
  uint64_t v8 = *MEMORY[0x263F60138];
  v53[0] = v7;
  v53[1] = @"SEARCH_ENGINE_SETTING";
  uint64_t v9 = *MEMORY[0x263F5FF58];
  v52[1] = v8;
  v52[2] = v9;
  uint64_t v10 = *MEMORY[0x263F602A0];
  v53[2] = MEMORY[0x263EFFA88];
  v53[3] = @"PSLinkListCell";
  uint64_t v11 = *MEMORY[0x263F60070];
  v52[3] = v10;
  v52[4] = v11;
  uint64_t v12 = *MEMORY[0x263F60170];
  uint64_t v13 = *MEMORY[0x263F55A80];
  v53[4] = @"com.apple.mobilesafarishared";
  v53[5] = v13;
  uint64_t v14 = *MEMORY[0x263F60080];
  v52[5] = v12;
  v52[6] = v14;
  uint64_t v15 = *MEMORY[0x263F5FF60];
  v53[6] = @"SearchEngineSettingsController";
  v53[7] = MEMORY[0x263EFFA88];
  uint64_t v16 = *MEMORY[0x263F5FF68];
  v52[7] = v15;
  v52[8] = v16;
  v53[8] = @"MobileSafariSettings";
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:9];

  uint64_t v49 = v17;
  v50 = @"items";
  v39 = (void *)v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
  v51 = v18;
  v19 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.mobilesafari.settings"];
  v40 = self;
  v21 = SpecifiersFromPlist();

  v41 = v5;
  v48 = v5;
  v22 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v48, 1, 0);
  [v4 addObjectsFromArray:v22];

  v42 = v4;
  [v4 addObjectsFromArray:v21];
  [MEMORY[0x263F169B0] loadSystemLanguageProperties];
  v23 = [MEMORY[0x263F169B0] sharedInstance];
  uint64_t v24 = [MEMORY[0x263EFF980] array];
  uint64_t v25 = [MEMORY[0x263EFF980] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v26 = [v23 enginesAvailableForUnifiedFieldSearching];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v32 = [v31 shortName];
        [v24 addObject:v32];

        v33 = [v31 displayName];
        [v25 addObject:v33];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v28);
  }

  NSRange v34 = [v21 firstObject];
  v35 = (void *)[v24 copy];
  v36 = (void *)[v25 copy];
  v37 = (void *)[v25 copy];
  [v34 setValues:v35 titles:v36 shortTitles:v37];

  v38 = [MEMORY[0x263F08A00] defaultCenter];
  [v38 addObserver:v40 selector:sel_refreshSafariSearchEnginePreference_ name:@"SAFARI_SEARCH_ENGINE_PREFERENCE_CHANGED" object:0];
}

- (void)configureAnonymouslyRecordingQueries:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  v6 = [v4 groupSpecifierWithName:0];
  v7 = [MEMORY[0x263F5B8F0] linkWithBundleIdentifier:@"com.apple.onboarding.sirisuggestions"];
  uint64_t v8 = [v7 flow];
  uint64_t v9 = [v8 localizedButtonTitle];

  uint64_t v10 = NSString;
  uint64_t v11 = +[SpotlightSettingsController bundle];
  uint64_t v12 = [v11 localizedStringForKey:@"SEARCH_ALLOW_ANONYMOUS_RECORDS_FOOTER" value:&stru_270B1D938 table:@"SpotlightSettings"];
  uint64_t v13 = [v10 stringWithFormat:@"%@ %@", v12, v9];

  [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x263F600E8]];
  uint64_t v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600C0]];

  v24.location = [v13 rangeOfString:v9];
  uint64_t v16 = NSStringFromRange(v24);
  [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x263F600D0]];

  uint64_t v17 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x263F600E0]];

  [v6 setObject:@"showAboutSearchSuggestionsSheet:" forKeyedSubscript:*MEMORY[0x263F600C8]];
  v18 = (void *)MEMORY[0x263F5FC40];
  v19 = +[SpotlightSettingsController bundle];
  v20 = [v19 localizedStringForKey:@"SEARCH_ALLOW_ANONYMOUS_RECORDS" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v21 = [v18 preferenceSpecifierNamed:v20 target:self set:sel_setAnonymouslyRecordSearchQueriesEnabled_ get:sel_isAnonymouslyRecordSearchQueriesEnabled detail:0 cell:6 edit:0];

  [v21 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  v23[0] = v6;
  v23[1] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  [v5 addObjectsFromArray:v22];
}

- (void)configureApplicationListSpecifiersFor:(id)a3
{
  uint64_t v3 = self;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v39 = a3;
  if (!self->_disabledSpotlightBundles)
  {
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    id v4 = (void (*)(uint64_t))getSPGetDisabledBundleSetSymbolLoc_ptr_1;
    v60 = getSPGetDisabledBundleSetSymbolLoc_ptr_1;
    if (!getSPGetDisabledBundleSetSymbolLoc_ptr_1)
    {
      uint64_t v52 = MEMORY[0x263EF8330];
      uint64_t v53 = 3221225472;
      v54 = __getSPGetDisabledBundleSetSymbolLoc_block_invoke_1;
      v55 = &unk_265524FE0;
      v56 = &v57;
      id v5 = (void *)SearchLibrary_1();
      v58[3] = (uint64_t)dlsym(v5, "SPGetDisabledBundleSet");
      getSPGetDisabledBundleSetSymbolLoc_ptr_1 = *(_UNKNOWN **)(v56[1] + 24);
      id v4 = (void (*)(uint64_t))v58[3];
    }
    _Block_object_dispose(&v57, 8);
    if (!v4) {
      -[SpotlightAppClipSettingsController specifiers]();
    }
    v4(1);
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    disabledSpotlightBundles = self->_disabledSpotlightBundles;
    self->_disabledSpotlightBundles = v6;

    uint64_t v3 = self;
  }
  if (!v3->_disabledSpotlightDomains)
  {
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    uint64_t v8 = (void (*)(uint64_t))getSPGetDisabledDomainSetSymbolLoc_ptr;
    v60 = getSPGetDisabledDomainSetSymbolLoc_ptr;
    if (!getSPGetDisabledDomainSetSymbolLoc_ptr)
    {
      uint64_t v52 = MEMORY[0x263EF8330];
      uint64_t v53 = 3221225472;
      v54 = __getSPGetDisabledDomainSetSymbolLoc_block_invoke;
      v55 = &unk_265524FE0;
      v56 = &v57;
      uint64_t v9 = (void *)SearchLibrary_1();
      v58[3] = (uint64_t)dlsym(v9, "SPGetDisabledDomainSet");
      getSPGetDisabledDomainSetSymbolLoc_ptr = *(_UNKNOWN **)(v56[1] + 24);
      uint64_t v8 = (void (*)(uint64_t))v58[3];
    }
    _Block_object_dispose(&v57, 8);
    if (!v8) {
      -[SpotlightAppClipSettingsController specifiers]();
    }
    v8(1);
    uint64_t v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    disabledSpotlightDomains = self->_disabledSpotlightDomains;
    self->_disabledSpotlightDomains = v10;
  }
  uint64_t v12 = [MEMORY[0x263F251D0] hiddenApplications];
  uint64_t v13 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v49 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = [*(id *)(*((void *)&v48 + 1) + 8 * i) bundleIdentifier];
        [v13 addObject:v17];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v14);
  }

  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  v18 = (uint64_t (*)(void))getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  v60 = getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  if (!getSBSCopyDisplayIdentifiersSymbolLoc_ptr)
  {
    uint64_t v52 = MEMORY[0x263EF8330];
    uint64_t v53 = 3221225472;
    v54 = __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke;
    v55 = &unk_265524FE0;
    v56 = &v57;
    __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke((uint64_t)&v52);
    v18 = (uint64_t (*)(void))v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v18) {
    -[SpotlightAppClipSettingsController specifiers]();
  }
  v37 = (void *)v18();
  id v40 = (id)[v37 mutableCopy];
  v19 = [MEMORY[0x263EFFA08] setWithArray:v13];
  [v40 minusSet:v19];

  if (([(NSSet *)self->_installedBundleIDs isEqual:v40] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_installedBundleIDs, v40);
    v20 = (void *)[v40 mutableCopy];
    [v20 addObject:@"com.apple.iCloudDriveApp"];
    v42 = [MEMORY[0x263EFF980] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v41 = v20;
    uint64_t v21 = [v41 countByEnumeratingWithState:&v44 objects:v61 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v45;
      uint64_t v23 = *MEMORY[0x263F5FFE0];
      uint64_t v24 = *MEMORY[0x263F60080];
      uint64_t v25 = *MEMORY[0x263F600A8];
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v41);
          }
          uint64_t v27 = [MEMORY[0x263F01868] applicationProxyForIdentifier:*(void *)(*((void *)&v44 + 1) + 8 * j)];
          uint64_t v28 = PSApplicationSpecifierForAssistantSection();
          if (v28)
          {
            [v28 setProperty:objc_opt_class() forKey:v23];
            [v28 setProperty:objc_opt_class() forKey:v24];
            [v28 setDetailControllerClass:objc_opt_class()];
            [v28 setProperty:MEMORY[0x263EFFA88] forKey:v25];
            [v42 addObject:v28];
          }
        }
        uint64_t v21 = [v41 countByEnumeratingWithState:&v44 objects:v61 count:16];
      }
      while (v21);
    }

    uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithArray:v42];
    allAppsSpecifiers = self->_allAppsSpecifiers;
    self->_allAppsSpecifiers = v29;
  }
  v31 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
  [v39 addObject:v31];
  id v32 = [(NSArray *)self->_allAppsSpecifiers sortedArrayUsingComparator:&__block_literal_global];
  v33 = (void *)MEMORY[0x263F5FC40];
  NSRange v34 = +[SpotlightSettingsController bundle];
  v35 = [v34 localizedStringForKey:@"APP_CLIPS" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v36 = [v33 preferenceSpecifierNamed:v35 target:0 set:0 get:0 detail:0 cell:1 edit:0];

  [v36 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v36 setDetailControllerClass:objc_opt_class()];
  [v36 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
  [v36 setProperty:@"com.apple.graphic-icon.app-clips" forKey:*MEMORY[0x263F60158]];
  [v39 addObject:v36];
  [v39 addObjectsFromArray:v32];
}

uint64_t __69__SpotlightSettingsController_configureApplicationListSpecifiersFor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)showAboutSearchSuggestionsSheet:(id)a3
{
  id v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.sirisuggestions"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (id)isShowZKWRecentsEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSpotlightZKWRecentsEnabled", @"com.apple.suggestions");
  id v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = 1;
  }

  return (id)[v3 numberWithBool:v6];
}

- (void)setShowZKWRecentsEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue];
  CFPreferencesSetAppValue(@"SuggestionsSpotlightZKWRecentsEnabled", (CFPropertyListRef)[NSNumber numberWithBool:v4], @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (void)saveSpotlightSettings
{
  v3[1] = *MEMORY[0x263EF8340];
  CFPreferencesSetAppValue(@"SBSearchDisabledDomains", (CFPropertyListRef)[(NSMutableSet *)self->_disabledSpotlightDomains allObjects], @"com.apple.spotlightui");
  v3[0] = @"SBSearchDisabledDomains";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  +[SpotlightSettingsUtilities updateSearchPreferencesModificationForKeys:v2];

  CFPreferencesSynchronize(@"com.apple.spotlightui", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  notify_post("com.apple.spotlightui.prefschanged");
}

- (id)isShowInLookUpEnabled
{
  v2 = (void *)CFPreferencesCopyAppValue(@"ShowInLookupEnabled", @"com.apple.spotlightui");
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA88];
  }
  id v4 = v2;

  return v4;
}

- (void)setShowInLookUpEnabled:(id)a3
{
  v4[1] = *MEMORY[0x263EF8340];
  CFPreferencesSetAppValue(@"ShowInLookupEnabled", a3, @"com.apple.spotlightui");
  v4[0] = @"ShowInLookupEnabled";
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  +[SpotlightSettingsUtilities updateSearchPreferencesModificationForKeys:v3];

  CFPreferencesSynchronize(@"com.apple.spotlightui", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  notify_post("com.apple.spotlightui.prefschanged");
}

- (id)isShowInSpotlightEnabled
{
  if ([(NSMutableSet *)self->_disabledSpotlightDomains containsObject:@"DOMAIN_ZKWS"]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(NSMutableSet *)self->_disabledSpotlightDomains containsObject:@"DOMAIN_PARSEC"] ^ 1;
  }
  id v4 = NSNumber;
  return (id)[v4 numberWithBool:v3];
}

- (void)setShowInSpotlightEnabled:(id)a3
{
  int v4 = [a3 intValue];
  disabledSpotlightDomains = self->_disabledSpotlightDomains;
  if (v4)
  {
    [(NSMutableSet *)disabledSpotlightDomains removeObject:@"DOMAIN_ZKWS"];
    [(NSMutableSet *)self->_disabledSpotlightDomains removeObject:@"DOMAIN_PARSEC"];
  }
  else
  {
    [(NSMutableSet *)disabledSpotlightDomains addObject:@"DOMAIN_ZKWS"];
    [(NSMutableSet *)self->_disabledSpotlightDomains addObject:@"DOMAIN_PARSEC"];
  }
  [(SpotlightSettingsController *)self saveSpotlightSettings];
}

- (void)refreshSafariSearchEnginePreference:(id)a3
{
  id v4 = [(SpotlightSettingsController *)self specifierForID:@"SEARCH_ENGINE_SETTING_GROUP"];
  [(SpotlightSettingsController *)self reloadSpecifier:v4 animated:1];
}

- (id)isAnonymouslyRecordSearchQueriesEnabled
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  unint64_t v3 = [v2 getSearchQueriesDataSharingStatus];

  id v4 = NSNumber;
  return (id)[v4 numberWithInt:v3 < 2];
}

- (void)setAnonymouslyRecordSearchQueriesEnabled:(id)a3
{
  if ([a3 BOOLValue]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  [v4 setSearchQueriesDataSharingStatus:v3 completion:&__block_literal_global_174];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_installedBundleIDs, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightDomains, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
}

@end