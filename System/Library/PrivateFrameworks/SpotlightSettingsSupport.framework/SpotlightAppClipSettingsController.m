@interface SpotlightAppClipSettingsController
+ (id)bundle;
- (id)learnFromAppClipsEnabled:(id)a3;
- (id)showInSearchEnabled:(id)a3;
- (id)specifiers;
- (id)suggestAppClipsEnabled:(id)a3;
- (void)setLearnFromAppClipsEnabled:(id)a3 specifier:(id)a4;
- (void)setShowInSearchEnabled:(id)a3 specifier:(id)a4;
- (void)setSuggestAppClipsEnabled:(id)a3 specifier:(id)a4;
- (void)specifiers;
- (void)viewDidLoad;
@end

@implementation SpotlightAppClipSettingsController

+ (id)bundle
{
  v2 = (void *)bundle_sSpotlightBundle_0;
  if (!bundle_sSpotlightBundle_0)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sSpotlightBundle_0;
    bundle_sSpotlightBundle_0 = v3;

    v2 = (void *)bundle_sSpotlightBundle_0;
  }
  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SpotlightAppClipSettingsController;
  [(SpotlightAppClipSettingsController *)&v5 viewDidLoad];
  uint64_t v3 = [(id)objc_opt_class() bundle];
  v4 = [v3 localizedStringForKey:@"APP_CLIPS" value:&stru_270B1D938 table:@"SpotlightSettings"];
  [(SpotlightAppClipSettingsController *)self setTitle:v4];
}

- (id)specifiers
{
  v47[5] = *MEMORY[0x263EF8340];
  if (!self->_disabledSpotlightBundles)
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v3 = (void (*)(uint64_t))getSPGetDisabledBundleSetSymbolLoc_ptr;
    v46 = getSPGetDisabledBundleSetSymbolLoc_ptr;
    if (!getSPGetDisabledBundleSetSymbolLoc_ptr)
    {
      v4 = (void *)SearchLibrary();
      v44[3] = (uint64_t)dlsym(v4, "SPGetDisabledBundleSet");
      getSPGetDisabledBundleSetSymbolLoc_ptr = (_UNKNOWN *)v44[3];
      uint64_t v3 = (void (*)(uint64_t))v44[3];
    }
    _Block_object_dispose(&v43, 8);
    if (!v3) {
      -[SpotlightAppClipSettingsController specifiers]();
    }
    v3(1);
    objc_super v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    disabledSpotlightBundles = self->_disabledSpotlightBundles;
    self->_disabledSpotlightBundles = v5;
  }
  if (!self->_disabledSpotlightApps)
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    v7 = (void (*)(uint64_t))getSPGetDisabledAppSetSymbolLoc_ptr;
    v46 = getSPGetDisabledAppSetSymbolLoc_ptr;
    if (!getSPGetDisabledAppSetSymbolLoc_ptr)
    {
      v8 = (void *)SearchLibrary();
      v44[3] = (uint64_t)dlsym(v8, "SPGetDisabledAppSet");
      getSPGetDisabledAppSetSymbolLoc_ptr = (_UNKNOWN *)v44[3];
      v7 = (void (*)(uint64_t))v44[3];
    }
    _Block_object_dispose(&v43, 8);
    if (!v7) {
      -[SpotlightAppClipSettingsController specifiers]();
    }
    v7(1);
    v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    disabledSpotlightApps = self->_disabledSpotlightApps;
    self->_disabledSpotlightApps = v9;
  }
  v11 = (void *)MEMORY[0x263F5FC40];
  v12 = [(id)objc_opt_class() bundle];
  v13 = [v12 localizedStringForKey:@"APP_CLIPS_IN_APP_CLIPS_HEADER" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v14 = [v11 groupSpecifierWithName:v13];

  v15 = [(id)objc_opt_class() bundle];
  v16 = [v15 localizedStringForKey:@"APP_CLIPS_IN_APP_CLIPS_FOOTER" value:&stru_270B1D938 table:@"SpotlightSettings"];
  uint64_t v17 = *MEMORY[0x263F600F8];
  [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x263F600F8]];

  v18 = (void *)MEMORY[0x263F5FC40];
  v19 = [(id)objc_opt_class() bundle];
  v20 = [v19 localizedStringForKey:@"APP_CLIPS_LEARN_FROM_APP_CLIPS" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v21 = [v18 preferenceSpecifierNamed:v20 target:self set:sel_setLearnFromAppClipsEnabled_specifier_ get:sel_learnFromAppClipsEnabled_ detail:0 cell:6 edit:0];

  uint64_t v22 = *MEMORY[0x263F5FEF8];
  [v21 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  uint64_t v23 = *MEMORY[0x263F600A8];
  [v21 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  v24 = (void *)MEMORY[0x263F5FC40];
  v25 = [(id)objc_opt_class() bundle];
  v26 = [v25 localizedStringForKey:@"SEARCH_PERAPP_ONHOMESCREEN_HEADER" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v27 = [v24 groupSpecifierWithName:v26];

  v28 = [(id)objc_opt_class() bundle];
  v29 = [v28 localizedStringForKey:@"APP_CLIPS_IN_SEARCH_FOOTER" value:&stru_270B1D938 table:@"SpotlightSettings"];
  [v27 setObject:v29 forKeyedSubscript:v17];

  v30 = (void *)MEMORY[0x263F5FC40];
  v31 = [(id)objc_opt_class() bundle];
  v32 = [v31 localizedStringForKey:@"APP_CLIPS_SHOW_IN_SEARCH" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v33 = [v30 preferenceSpecifierNamed:v32 target:self set:sel_setShowInSearchEnabled_specifier_ get:sel_showInSearchEnabled_ detail:0 cell:6 edit:0];

  [v33 setProperty:MEMORY[0x263EFFA88] forKey:v22];
  [v33 setProperty:MEMORY[0x263EFFA88] forKey:v23];
  v34 = (void *)MEMORY[0x263F5FC40];
  v35 = [(id)objc_opt_class() bundle];
  v36 = [v35 localizedStringForKey:@"APP_CLIPS_SUGGEST_APP_CLIPS" value:&stru_270B1D938 table:@"SpotlightSettings"];
  v37 = [v34 preferenceSpecifierNamed:v36 target:self set:sel_setSuggestAppClipsEnabled_specifier_ get:sel_suggestAppClipsEnabled_ detail:0 cell:6 edit:0];

  [v37 setProperty:MEMORY[0x263EFFA88] forKey:v22];
  [v37 setProperty:MEMORY[0x263EFFA88] forKey:v23];
  v47[0] = v14;
  v47[1] = v21;
  v47[2] = v27;
  v47[3] = v33;
  v47[4] = v37;
  uint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:5];
  v39 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v40 = *v39;
  id *v39 = (id)v38;

  id v41 = *v39;
  return v41;
}

- (void)setLearnFromAppClipsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue];
  CFPreferencesSetAppValue(@"SuggestionsLearnFromAppClips", (CFPropertyListRef)[NSNumber numberWithBool:v4], @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (id)learnFromAppClipsEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = (void *)CFPreferencesCopyAppValue(@"SuggestionsLearnFromAppClips", @"com.apple.suggestions");
  objc_super v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = 1;
  }

  return (id)[v3 numberWithBool:v6];
}

- (void)setShowInSearchEnabled:(id)a3 specifier:(id)a4
{
  v8[2] = *MEMORY[0x263EF8340];
  int v5 = [a3 BOOLValue];
  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  if (v5)
  {
    [(NSMutableSet *)disabledSpotlightBundles removeObject:@"com.apple.app-clips"];
    [(NSMutableSet *)self->_disabledSpotlightApps removeObject:@"com.apple.app-clips"];
  }
  else
  {
    [(NSMutableSet *)disabledSpotlightBundles addObject:@"com.apple.app-clips"];
    [(NSMutableSet *)self->_disabledSpotlightApps addObject:@"com.apple.app-clips"];
  }
  CFPreferencesSetAppValue(@"SBSearchDisabledBundles", (CFPropertyListRef)[(NSMutableSet *)self->_disabledSpotlightBundles allObjects], @"com.apple.spotlightui");
  CFPreferencesSetAppValue(@"SBSearchDisabledApps", (CFPropertyListRef)[(NSMutableSet *)self->_disabledSpotlightApps allObjects], @"com.apple.spotlightui");
  v8[0] = @"SBSearchDisabledBundles";
  v8[1] = @"SBSearchDisabledApps";
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  +[SpotlightSettingsUtilities updateSearchPreferencesModificationForKeys:v7];

  CFPreferencesSynchronize(@"com.apple.spotlightui", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  notify_post("com.apple.spotlightui.prefschanged");
}

- (id)showInSearchEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [(NSMutableSet *)self->_disabledSpotlightBundles containsObject:@"com.apple.app-clips"] ^ 1;
  return (id)[v3 numberWithInt:v4];
}

- (void)setSuggestAppClipsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue];
  CFPreferencesSetAppValue(@"SuggestionsSuggestAppClips", (CFPropertyListRef)[NSNumber numberWithBool:v4], @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (id)suggestAppClipsEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSuggestAppClips", @"com.apple.suggestions");
  int v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = 1;
  }

  return (id)[v3 numberWithBool:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledSpotlightApps, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
}

- (void)specifiers
{
}

@end