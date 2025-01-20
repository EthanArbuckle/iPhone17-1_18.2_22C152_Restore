@interface LTUITranslateSettingsController
- (BOOL)isOnDeviceOnlyTranslationForced;
- (id)appGroupUserDefaultForSpecifier:(id)a3;
- (id)onDeviceOnlyFooterString;
- (id)specifiers;
- (void)openAppToLanguages:(id)a3;
- (void)setAppGroupUserDefaultsEnabled:(id)a3 specifier:(id)a4;
- (void)showTranslatePrivacy;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation LTUITranslateSettingsController

- (void)viewDidAppear:(BOOL)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)LTUITranslateSettingsController;
  [(LTUITranslateSettingsController *)&v11 viewDidAppear:a3];
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.Translate"];
  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"TRANSLATE" table:@"Localizable" locale:v6 bundleURL:v8];

  v12[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(LTUITranslateSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.Translate" title:v9 localizedNavigationComponents:v10 deepLink:v4];
}

- (id)specifiers
{
  v51[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F92EA0]) initWithBundleIdentifier:@"com.apple.Translate"];
    v6 = [MEMORY[0x1E4F1CA48] array];
    v50 = v5;
    v49 = [v5 specifiersForPolicyOptions:41975808 force:0];
    objc_msgSend(v6, "addObjectsFromArray:");
    v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"Languages"];
    v8 = _LTSettingsLocalizedString(@"ON_DEVICE_LANGUAGES_DESCRIPTION");
    uint64_t v9 = *MEMORY[0x1E4F93170];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F93170]];

    v48 = v7;
    [v6 addObject:v7];
    v10 = (void *)MEMORY[0x1E4F92E70];
    objc_super v11 = _LTSettingsLocalizedString(@"ON_DEVICE_LANGUAGES_TITLE");
    v12 = [v10 preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v6 addObject:v12];
    uint64_t v13 = *MEMORY[0x1E4F931B0];
    [v12 setObject:@"DOWNLOADED_LANGUAGES_SPECIFIER" forKeyedSubscript:*MEMORY[0x1E4F931B0]];
    v14 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"OnDeviceOnlyGroup"];
    onDeviceOnlyGroup = self->onDeviceOnlyGroup;
    self->onDeviceOnlyGroup = v14;

    v16 = [(LTUITranslateSettingsController *)self onDeviceOnlyFooterString];
    [(PSSpecifier *)self->onDeviceOnlyGroup setObject:v16 forKeyedSubscript:v9];

    [v6 addObject:self->onDeviceOnlyGroup];
    v17 = (void *)MEMORY[0x1E4F92E70];
    v18 = _LTSettingsLocalizedString(@"ON_DEVICE_PREF_NAME");
    v19 = [v17 preferenceSpecifierNamed:v18 target:self set:sel_setAppGroupUserDefaultsEnabled_specifier_ get:sel_appGroupUserDefaultForSpecifier_ detail:0 cell:6 edit:0];

    v20 = (__CFString *)MEMORY[0x1E4F1CC38];
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
    v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = (id)[v21 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.private.translation"];

    [v19 setObject:@"OnDeviceOnly" forKeyedSubscript:v13];
    BOOL v23 = [(LTUITranslateSettingsController *)self isOnDeviceOnlyTranslationForced];
    v24 = (void *)MEMORY[0x1E4F93110];
    if (v23)
    {
      v25 = (void *)MEMORY[0x1E4F93250];
      v26 = (__CFString *)MEMORY[0x1E4F1CC28];
      v27 = v20;
      v28 = (void *)MEMORY[0x1E4F93130];
    }
    else
    {
      [v19 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F93110]];
      v27 = @"group.com.apple.private.translation.globalprefschanged";
      v24 = (void *)MEMORY[0x1E4F93248];
      v25 = (void *)MEMORY[0x1E4F930E0];
      v26 = @"group.com.apple.private.translation";
      v28 = (void *)MEMORY[0x1E4F93070];
      v20 = @"group.com.apple.private.translation";
    }
    [v19 setObject:v26 forKeyedSubscript:*v28];
    [v19 setObject:v20 forKeyedSubscript:*v25];
    [v19 setObject:v27 forKeyedSubscript:*v24];
    [v6 addObject:v19];
    v29 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"PrivacyLink"];
    v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"PRIVACY_LINK" value:&stru_1F3548BC8 table:0];

    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    [v29 setProperty:v33 forKey:*MEMORY[0x1E4F93140]];

    [v29 setProperty:v31 forKey:*MEMORY[0x1E4F93160]];
    v53.length = [v31 length];
    v53.location = 0;
    v34 = NSStringFromRange(v53);
    [v29 setProperty:v34 forKey:*MEMORY[0x1E4F93150]];

    v35 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v29 setProperty:v35 forKey:*MEMORY[0x1E4F93158]];

    [v29 setProperty:@"showTranslatePrivacy" forKey:*MEMORY[0x1E4F93148]];
    [v6 addObject:v29];
    if (_LTIsInternalInstall())
    {
      v36 = [MEMORY[0x1E4F1CB18] translationAppGroupDefaults];
      int v37 = [v36 BOOLForKey:*MEMORY[0x1E4F423B8]];

      if (v37)
      {
        v38 = MEMORY[0x1E018C0D0]();
        v51[0] = v38;
        v51[1] = @"AppleInternal";
        v51[2] = @"Library";
        v51[3] = @"PreferenceBundles";
        v51[4] = @"TranslationSettings.bundle";
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:5];

        v40 = (void *)MEMORY[0x1E4F28B50];
        v41 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v39];
        v42 = [v40 bundleWithURL:v41];

        if (v42)
        {
          v47 = v39;
          v43 = objc_msgSend(MEMORY[0x1E4F92E70], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"Translation Internal", 0, 0, 0, objc_msgSend(v42, "principalClass"), 1, 0);
          [v43 setProperty:@"TRANSLATION_INTERNAL" forKey:*MEMORY[0x1E4F93188]];
          v44 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"InternalSettings"];
          [v6 addObject:v44];
          [v6 addObject:v43];

          v39 = v47;
        }
      }
    }
    v45 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)showTranslatePrivacy
{
  id v3 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.translate"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)setAppGroupUserDefaultsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F931B0];
  id v7 = a3;
  id v11 = [a4 objectForKeyedSubscript:v6];
  v8 = [MEMORY[0x1E4F1CB18] translationAppGroupDefaults];
  [v8 setValue:v7 forKey:v11];

  uint64_t v9 = [MEMORY[0x1E4F1CB18] translationAppGroupDefaults];
  [v9 synchronize];

  if ([v11 isEqualToString:@"OnDeviceOnly"])
  {
    v10 = [(LTUITranslateSettingsController *)self onDeviceOnlyFooterString];
    [(PSSpecifier *)self->onDeviceOnlyGroup setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F93170]];

    [(LTUITranslateSettingsController *)self reloadSpecifier:self->onDeviceOnlyGroup animated:1];
  }
}

- (BOOL)isOnDeviceOnlyTranslationForced
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isOnDeviceOnlyTranslationForced];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)appGroupUserDefaultForSpecifier:(id)a3
{
  char v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F931B0]];
  id v5 = [MEMORY[0x1E4F1CB18] translationAppGroupDefaults];
  uint64_t v6 = [v5 valueForKey:v4];

  if ([v4 isEqualToString:@"OnDeviceOnly"]
    && [(LTUITranslateSettingsController *)self isOnDeviceOnlyTranslationForced])
  {
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:1];

    uint64_t v6 = (void *)v7;
  }

  return v6;
}

- (void)openAppToLanguages:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 openApplicationWithBundleID:@"com.apple.Translate"];
}

- (id)onDeviceOnlyFooterString
{
  return _LTSettingsLocalizedString(@"ON_DEVICE_FOOTER");
}

- (void).cxx_destruct
{
}

@end