@interface PUILockdownModeController
- (BOOL)_2GEnabled;
- (BOOL)has2GSupport;
- (BOOL)lockdownModeEnabled;
- (BOOL)shouldReloadSpecifiersOnResume;
- (CoreTelephonyClient)client;
- (NSArray)_lockdownModeOptionsSpecifiers;
- (PUILockdownModeController)init;
- (id)_2GEnabled:(id)a3;
- (id)lockdownModeOptionsSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dataDidChange;
- (void)didTapEnableLockdownModeButton:(id)a3;
- (void)didTapOnboardingLockdownModeButton;
- (void)getEligibleDevicesWithCompletion:(id)a3;
- (void)init;
- (void)openLearnMorePage;
- (void)presentConfirmationAlert:(id)a3 hasPairedWatch:(BOOL)a4;
- (void)presentErrorAlert;
- (void)presentOnboardingController;
- (void)provideNavigationDonations;
- (void)refreshLinkStatusInParent;
- (void)set2GEnabled:(id)a3 specifier:(id)a4;
- (void)setClient:(id)a3;
- (void)setHas2GSupport:(BOOL)a3;
- (void)setLockdownModeEnabled:(BOOL)a3;
- (void)setLockdownModeEnabled:(BOOL)a3 forAllDevices:(BOOL)a4;
- (void)set_2GEnabled:(BOOL)a3;
- (void)set_lockdownModeOptionsSpecifiers:(id)a3;
- (void)updateSpecifiersForImposedSettings;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUILockdownModeController

- (PUILockdownModeController)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PUILockdownModeController;
  v2 = [(PUILockdownModeController *)&v15 init];
  if (v2)
  {
    [(PUILockdownModeController *)v2 setLockdownModeEnabled:+[PUILockdownModeUtilities isLockdownModeEnabled]];
    if ([(PUILockdownModeController *)v2 lockdownModeEnabled])
    {
      v3 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];
      [(PUILockdownModeController *)v2 setClient:v3];

      v4 = [(PUILockdownModeController *)v2 client];
      id v14 = 0;
      uint64_t v5 = [v4 get2GSwitchEnabledSync:&v14];
      id v6 = v14;
      [(PUILockdownModeController *)v2 setHas2GSupport:v5];

      if (v6)
      {
        v7 = _PUILoggingFacility();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[PUILockdownModeController init]();
        }
      }
      if ([(PUILockdownModeController *)v2 has2GSupport])
      {
        v8 = [(PUILockdownModeController *)v2 client];
        id v13 = v6;
        uint64_t v9 = [v8 get2GUserPreferenceSync:&v13];
        id v10 = v13;

        [(PUILockdownModeController *)v2 set_2GEnabled:v9];
        if (v10)
        {
          v11 = _PUILoggingFacility();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v17 = v10;
            _os_log_impl(&dword_1E4AD5000, v11, OS_LOG_TYPE_DEFAULT, "Error getting if 2G is enabled: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        id v10 = v6;
      }
    }
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUILockdownModeController;
  [(PUILockdownModeController *)&v4 viewWillAppear:a3];
  [(PUILockdownModeController *)self updateSpecifiersForImposedSettings];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUILockdownModeController;
  [(PUILockdownModeController *)&v4 viewDidAppear:a3];
  [(PUILockdownModeController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = PUI_BundleForPrivacySettingsFramework();
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = (void *)[v5 initWithKey:@"LOCKDOWN_MODE" table:@"LockdownMode" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/LOCKDOWN_MODE"];
  [(PUILockdownModeController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.privacy" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)refreshLinkStatusInParent
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E4F92F90]));
  [WeakRetained reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0])];
}

- (void)dataDidChange
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__PUILockdownModeController_dataDidChange__block_invoke;
  v2[3] = &unk_1E6E9C618;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __42__PUILockdownModeController_dataDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)updateSpecifiersForImposedSettings
{
  if ([(PUILockdownModeController *)self lockdownModeEnabled]
    && [(PUILockdownModeController *)self indexOfSpecifierID:@"LOCKDOWN_MODE_OPTIONS_GROUP"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [(PUILockdownModeController *)self lockdownModeOptionsSpecifiers];
    [(PUILockdownModeController *)self addSpecifiersFromArray:v3 animated:0];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_opt_new();
    BOOL v6 = +[PUILockdownModeUtilities getCanSetLockdownMode];
    v7 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    id v8 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v7 setObject:v8 forKeyedSubscript:@"PUIOnboardingCellDelegateKey"];

    [v5 addObject:v7];
    BOOL v9 = [(PUILockdownModeController *)self lockdownModeEnabled];
    id v10 = (void *)MEMORY[0x1E4F92E70];
    if (v9)
    {
      v11 = PUI_LocalizedStringForLockdownMode(@"STATE_SPECIFIER_TURN_OFF");
      v12 = [v10 deleteButtonSpecifierWithName:v11 target:self action:sel_didTapOnboardingLockdownModeButton];
    }
    else
    {
      id v13 = PUI_LocalizedStringForLockdownMode(@"STATE_SPECIFIER_TURN_ON");
      v12 = [v10 preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v12 setObject:&unk_1F4080380 forKeyedSubscript:*MEMORY[0x1E4F93060]];
      [v12 setButtonAction:sel_didTapOnboardingLockdownModeButton];
    }
    id v14 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
    [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F93130]];

    [v5 addObject:v12];
    objc_super v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)lockdownModeOptionsSpecifiers
{
  v61[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUILockdownModeController *)self _lockdownModeOptionsSpecifiers];

  if (!v3)
  {
    v47 = objc_opt_new();
    v49 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"LOCKDOWN_MODE_OPTIONS_GROUP"];
    objc_msgSend(v47, "addObject:");
    uint64_t v4 = getLocalizedDeviceName();
    v46 = PUI_LocalizedStringForLockdownMode(@"SECTION_MESSAGES_HEADER");
    v60[0] = v46;
    v45 = PUI_LocalizedStringForLockdownMode(@"SECTION_MESSAGES_CONTENT");
    v60[1] = v45;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
    v61[0] = v44;
    v43 = PUI_LocalizedStringForLockdownMode(@"SECTION_FACETIME_HEADER");
    v59[0] = v43;
    v42 = PUI_LocalizedStringForLockdownMode(@"SECTION_FACETIME_CONTENT");
    v59[1] = v42;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    v61[1] = v41;
    v40 = PUI_LocalizedStringForLockdownMode(@"SECTION_WEB_HEADER");
    v58[0] = v40;
    v39 = PUI_LocalizedStringForLockdownMode(@"SECTION_WEB_CONTENT");
    v58[1] = v39;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
    v61[2] = v38;
    v37 = PUI_LocalizedStringForLockdownMode(@"SECTION_SHARED_ALBUMS_HEADER");
    v57[0] = v37;
    v36 = PUI_LocalizedStringForLockdownMode(@"SECTION_SHARED_ALBUMS_CONTENT");
    v57[1] = v36;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    v61[3] = v35;
    v34 = PUI_LocalizedStringForLockdownMode(@"SECTION_USB_HEADER");
    v56[0] = v34;
    id v5 = NSString;
    v33 = PUI_LocalizedStringForLockdownMode(@"SECTION_USB_CONTENT");
    v32 = objc_msgSend(v5, "stringWithFormat:", v33, v4);
    v56[1] = v32;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
    v61[4] = v31;
    v30 = PUI_LocalizedStringForLockdownMode(@"SECTION_WIRELESS_CONNECTIVITY_HEADER");
    v55[0] = v30;
    [(PUILockdownModeController *)self has2GSupport];
    v29 = SFLocalizableWAPIStringKeyForKey();
    v28 = PUI_LocalizedStringForLockdownMode(v29);
    v55[1] = v28;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    v61[5] = v6;
    v7 = PUI_LocalizedStringForLockdownMode(@"SECTION_REMOTE_HEADER");
    v54[0] = v7;
    id v8 = NSString;
    BOOL v9 = PUI_LocalizedStringForLockdownMode(@"SECTION_REMOTE_CONTENT");
    v48 = (void *)v4;
    id v10 = objc_msgSend(v8, "stringWithFormat:", v9, v4);
    v54[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    v61[6] = v11;
    v12 = PUI_LocalizedStringForLockdownMode(@"SECTION_PROFILES_HEADER");
    v53[0] = v12;
    id v13 = PUI_LocalizedStringForLockdownMode(@"SECTION_PROFILES_CONTENT");
    v53[1] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    v61[7] = v14;
    objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:8];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __58__PUILockdownModeController_lockdownModeOptionsSpecifiers__block_invoke;
    v50[3] = &unk_1E6E9C640;
    v50[4] = self;
    id v16 = v15;
    id v51 = v16;
    id v17 = v47;
    id v52 = v17;
    [v16 enumerateObjectsUsingBlock:v50];
    uint64_t v18 = (void *)MEMORY[0x1E4F92E70];
    v19 = PUI_LocalizedStringForLockdownMode(@"WEB_CONTENT");
    v20 = [v18 preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v17 addObject:v20];
    if ([(PUILockdownModeController *)self has2GSupport])
    {
      v21 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:&stru_1F4072988];
      v22 = PUI_LocalizedStringForLockdownMode(@"ENABLE_2G_FOOTER");
      [v21 setProperty:v22 forKey:*MEMORY[0x1E4F93170]];

      [v17 addObject:v21];
      v23 = (void *)MEMORY[0x1E4F92E70];
      v24 = PUI_LocalizedStringForLockdownMode(@"ENABLE_2G");
      v25 = [v23 preferenceSpecifierNamed:v24 target:self set:sel_set2GEnabled_specifier_ get:sel__2GEnabled_ detail:0 cell:6 edit:0];

      [v25 setIdentifier:@"Enable_2G"];
      [v25 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93130]];
      [v17 addObject:v25];
    }
    [(PUILockdownModeController *)self set_lockdownModeOptionsSpecifiers:v17];
  }
  v26 = [(PUILockdownModeController *)self _lockdownModeOptionsSpecifiers];
  return v26;
}

void __58__PUILockdownModeController_lockdownModeOptionsSpecifiers__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v8 = [v5 objectAtIndexedSubscript:0];
  BOOL v6 = [v5 objectAtIndexedSubscript:1];

  v7 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v8 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:-1 edit:0];
  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93130]];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F93240]];
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F93230]];
  [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
  if ([*(id *)(a1 + 40) count] - 1 > a3) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PUITableCellNoSeparator"];
  }
  [*(id *)(a1 + 48) addObject:v7];
}

- (BOOL)lockdownModeEnabled
{
  return +[PUILockdownModeUtilities isLockdownModeEnabled];
}

- (void)openLearnMorePage
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v3 = (void *)getSFSafariViewControllerClass_softClass;
  uint64_t v14 = getSFSafariViewControllerClass_softClass;
  if (!getSFSafariViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getSFSafariViewControllerClass_block_invoke;
    v10[3] = &unk_1E6E9C7F8;
    v10[4] = &v11;
    __getSFSafariViewControllerClass_block_invoke((uint64_t)v10);
    uint64_t v3 = (void *)v12[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v11, 8);
  id v5 = [v4 alloc];
  BOOL v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT212650"];
  v7 = (void *)[v5 initWithURL:v6];

  id v8 = [(PUILockdownModeController *)self presentedViewController];

  if (v8)
  {
    BOOL v9 = [(PUILockdownModeController *)self presentedViewController];
    [v9 presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    [(PUILockdownModeController *)self presentViewController:v7 animated:1 completion:0];
  }
}

- (void)didTapOnboardingLockdownModeButton
{
  if ([(PUILockdownModeController *)self lockdownModeEnabled])
  {
    [(PUILockdownModeController *)self presentConfirmationAlert:0 hasPairedWatch:0];
  }
  else
  {
    [(PUILockdownModeController *)self presentOnboardingController];
  }
}

- (void)set2GEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 propertyForKey:*MEMORY[0x1E4F93250]];
  if (([v6 isEqual:v8] & 1) == 0)
  {
    objc_initWeak(location, self);
    if ([v6 BOOLValue])
    {
      uint64_t v9 = PUI_LocalizedStringForLockdownMode(@"2G_ALERT_ENABLE_TITLE");
      v21 = PUI_LocalizedStringForLockdownMode(@"2G_ALERT_ENABLE_MESSAGE");
      id v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v21 preferredStyle:1];
      uint64_t v11 = (void *)MEMORY[0x1E4FB1410];
      v12 = PUI_LocalizedStringForLockdownMode(@"2G_ALERT_ENABLE_BUTTON");
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke;
      v30[3] = &unk_1E6E9C690;
      v30[4] = self;
      id v13 = v7;
      id v31 = v13;
      id v14 = v8;
      id v32 = v14;
      objc_copyWeak(&v33, location);
      objc_super v15 = [v11 actionWithTitle:v12 style:2 handler:v30];
      [v10 addAction:v15];

      id v16 = (void *)MEMORY[0x1E4FB1410];
      id v17 = PUI_LocalizedStringForLockdownMode(@"CANCEL");
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_139;
      v26[3] = &unk_1E6E9C6B8;
      id v27 = v13;
      id v28 = v14;
      objc_copyWeak(&v29, location);
      uint64_t v18 = [v16 actionWithTitle:v17 style:1 handler:v26];
      [v10 addAction:v18];

      [(PUILockdownModeController *)self presentViewController:v10 animated:1 completion:0];
      objc_destroyWeak(&v29);

      objc_destroyWeak(&v33);
      v19 = (void *)v9;
    }
    else
    {
      v20 = [(PUILockdownModeController *)self client];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_140;
      v22[3] = &unk_1E6E9C668;
      id v23 = v7;
      id v24 = v8;
      objc_copyWeak(&v25, location);
      [v20 set2GUserPreference:0 completion:v22];

      objc_destroyWeak(&v25);
      v19 = v23;
    }

    objc_destroyWeak(location);
  }
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] client];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2;
  v5[3] = &unk_1E6E9C668;
  id v6 = a1[5];
  id v7 = a1[6];
  objc_copyWeak(&v8, a1 + 7);
  [v4 set2GUserPreference:1 completion:v5];

  objc_destroyWeak(&v8);
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _PUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F93250]];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
  }
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_139(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F93250]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_140(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _PUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_140_cold_1();
    }

    [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F93250]];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
  }
}

- (id)_2GEnabled:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v4 = [(PUILockdownModeController *)self _2GEnabled];
  return (id)[v3 numberWithBool:v4];
}

- (void)didTapEnableLockdownModeButton:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PUILockdownModeController_didTapEnableLockdownModeButton___block_invoke;
  v3[3] = &unk_1E6E9C6E0;
  v3[4] = self;
  [(PUILockdownModeController *)self getEligibleDevicesWithCompletion:v3];
}

uint64_t __60__PUILockdownModeController_didTapEnableLockdownModeButton___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) presentConfirmationAlert:a2 hasPairedWatch:a3];
}

- (void)presentOnboardingController
{
  id v3 = getLocalizedDeviceName();
  id v4 = objc_alloc(MEMORY[0x1E4F83AE8]);
  id v5 = PUI_LocalizedStringForLockdownMode(@"LOCKDOWN_MODE");
  id v6 = NSString;
  id v7 = PUI_LocalizedStringForLockdownMode(@"ONBOARDING_UI_DETAIL");
  id v8 = objc_msgSend(v6, "stringWithFormat:", v7, v3);
  uint64_t v9 = (void *)[v4 initWithTitle:v5 detailText:v8 symbolName:0 contentLayout:2];

  id v10 = PUI_LocalizedStringForLockdownMode(@"SECTION_MESSAGES_HEADER");
  uint64_t v11 = PUI_LocalizedStringForLockdownMode(@"SECTION_MESSAGES_CONTENT");
  [v9 addSectionWithHeader:v10 content:v11];

  v12 = PUI_LocalizedStringForLockdownMode(@"SECTION_FACETIME_HEADER");
  id v13 = PUI_LocalizedStringForLockdownMode(@"SECTION_FACETIME_CONTENT");
  [v9 addSectionWithHeader:v12 content:v13];

  id v14 = PUI_LocalizedStringForLockdownMode(@"SECTION_WEB_HEADER");
  objc_super v15 = PUI_LocalizedStringForLockdownMode(@"SECTION_WEB_CONTENT");
  [v9 addSectionWithHeader:v14 content:v15];

  id v16 = PUI_LocalizedStringForLockdownMode(@"SECTION_SHARED_ALBUMS_HEADER");
  id v17 = PUI_LocalizedStringForLockdownMode(@"SECTION_SHARED_ALBUMS_CONTENT");
  [v9 addSectionWithHeader:v16 content:v17];

  uint64_t v18 = PUI_LocalizedStringForLockdownMode(@"SECTION_USB_HEADER");
  v19 = NSString;
  v20 = PUI_LocalizedStringForLockdownMode(@"SECTION_USB_CONTENT");
  v21 = objc_msgSend(v19, "stringWithFormat:", v20, v3);
  [v9 addSectionWithHeader:v18 content:v21];

  v22 = PUI_LocalizedStringForLockdownMode(@"SECTION_WIRELESS_CONNECTIVITY_HEADER");
  [(PUILockdownModeController *)self has2GSupport];
  id v23 = SFLocalizableWAPIStringKeyForKey();
  id v24 = PUI_LocalizedStringForLockdownMode(v23);
  [v9 addSectionWithHeader:v22 content:v24];

  id v25 = PUI_LocalizedStringForLockdownMode(@"SECTION_REMOTE_HEADER");
  v26 = PUI_LocalizedStringForLockdownMode(@"SECTION_REMOTE_CONTENT");
  [v9 addSectionWithHeader:v25 content:v26];

  id v27 = PUI_LocalizedStringForLockdownMode(@"SECTION_PROFILES_HEADER");
  id v28 = NSString;
  id v29 = PUI_LocalizedStringForLockdownMode(@"SECTION_PROFILES_CONTENT");
  v30 = objc_msgSend(v28, "stringWithFormat:", v29, v3);
  [v9 addSectionWithHeader:v27 content:v30];

  id v31 = [MEMORY[0x1E4F83AB8] linkButton];
  id v32 = PUI_LocalizedStringForLockdownMode(@"ENABLE_LOCKDOWN_MODE");
  [v31 setTitle:v32 forState:0];

  [v31 addTarget:self action:sel_didTapEnableLockdownModeButton_ forEvents:0x2000];
  id v33 = [v9 buttonTray];
  [v33 addButton:v31];

  id v34 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v35 = (void *)MEMORY[0x1E4FB13F0];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __56__PUILockdownModeController_presentOnboardingController__block_invoke;
  v41[3] = &unk_1E6E9C708;
  id v42 = v9;
  id v36 = v9;
  v37 = [v35 actionWithHandler:v41];
  v38 = (void *)[v34 initWithBarButtonSystemItem:1 primaryAction:v37];

  v39 = [v36 navigationItem];
  [v39 setLeftBarButtonItem:v38];

  v40 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v36];
  [(PUILockdownModeController *)self presentModalViewController:v40 withTransition:3];
}

void __56__PUILockdownModeController_presentOnboardingController__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentConfirmationAlert:(id)a3 hasPairedWatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(PUILockdownModeController *)self lockdownModeEnabled];
  BOOL v33 = !v7;
  id v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v9 = objc_msgSend(v8, "sf_isiPhone");

  id v10 = getLocalizedDeviceName();
  if (v7) {
    uint64_t v11 = @"CONFIRM_ALERT_DISABLE_TITLE";
  }
  else {
    uint64_t v11 = @"CONFIRM_ALERT_ENABLE_TITLE";
  }
  v12 = PUI_LocalizedStringForLockdownMode(v11);
  if (v6 && [v6 count])
  {
    int v13 = v4 & v9;
    id v14 = NSString;
    if (v13 == 1)
    {
      objc_super v15 = @"CONFIRM_ALERT_ENABLE_ALL_DEVICES_WITH_WATCH_MESSAGE";
      id v16 = @"CONFIRM_ALERT_DISABLE_ALL_DEVICES_WITH_WATCH_MESSAGE";
    }
    else
    {
      objc_super v15 = @"CONFIRM_ALERT_ENABLE_ALL_DEVICES_MESSAGE";
      id v16 = @"CONFIRM_ALERT_DISABLE_ALL_DEVICES_MESSAGE";
    }
  }
  else
  {
    int v17 = v4 & v9;
    id v14 = NSString;
    if (v17 == 1)
    {
      objc_super v15 = @"CONFIRM_ALERT_ENABLE_WITH_WATCH_MESSAGE";
      id v16 = @"CONFIRM_ALERT_DISABLE_WITH_WATCH_MESSAGE";
    }
    else
    {
      objc_super v15 = @"CONFIRM_ALERT_ENABLE_MESSAGE";
      id v16 = @"CONFIRM_ALERT_DISABLE_MESSAGE";
    }
  }
  if (v7) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v15;
  }
  v19 = PUI_LocalizedStringForLockdownMode(v18);
  v20 = objc_msgSend(v14, "stringWithFormat:", v19, v10);

  v21 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v20 preferredStyle:1];
  if (v7) {
    v22 = @"CONFIRM_ALERT_DISABLE_BUTTON";
  }
  else {
    v22 = @"CONFIRM_ALERT_ENABLE_BUTTON";
  }
  if (v7) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 0;
  }
  id v24 = PUI_LocalizedStringForLockdownMode(v22);
  id v25 = (void *)MEMORY[0x1E4FB1410];
  v26 = objc_msgSend(NSString, "stringWithFormat:", v24, v10);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __69__PUILockdownModeController_presentConfirmationAlert_hasPairedWatch___block_invoke;
  v34[3] = &unk_1E6E9C730;
  v34[4] = self;
  BOOL v35 = v33;
  id v27 = [v25 actionWithTitle:v26 style:v23 handler:v34];
  [v21 addAction:v27];

  id v28 = (void *)MEMORY[0x1E4FB1410];
  id v29 = PUI_LocalizedStringForLockdownMode(@"CANCEL");
  v30 = [v28 actionWithTitle:v29 style:1 handler:0];
  [v21 addAction:v30];

  id v31 = [(PUILockdownModeController *)self presentedViewController];

  if (v31)
  {
    id v32 = [(PUILockdownModeController *)self presentedViewController];
    [v32 presentViewController:v21 animated:1 completion:0];
  }
  else
  {
    [(PUILockdownModeController *)self presentViewController:v21 animated:1 completion:0];
  }
}

uint64_t __69__PUILockdownModeController_presentConfirmationAlert_hasPairedWatch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLockdownModeEnabled:*(unsigned __int8 *)(a1 + 40) forAllDevices:1];
}

- (void)presentErrorAlert
{
  BOOL v3 = [(PUILockdownModeController *)self lockdownModeEnabled];
  BOOL v4 = !v3;
  if (v3) {
    id v5 = @"ERROR_ALERT_DISABLE_TITLE";
  }
  else {
    id v5 = @"ERROR_ALERT_ENABLE_TITLE";
  }
  if (v4) {
    id v6 = @"ERROR_ALERT_ENABLE_MESSAGE";
  }
  else {
    id v6 = @"ERROR_ALERT_DISABLE_MESSAGE";
  }
  PUI_LocalizedStringForLockdownMode(v5);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v7 = NSString;
  id v8 = PUI_LocalizedStringForLockdownMode(v6);
  int v9 = getLocalizedDeviceName();
  id v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

  uint64_t v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v17 message:v10 preferredStyle:1];
  v12 = (void *)MEMORY[0x1E4FB1410];
  int v13 = PUI_LocalizedStringForLockdownMode(@"OK");
  id v14 = [v12 actionWithTitle:v13 style:1 handler:0];
  [v11 addAction:v14];

  objc_super v15 = [(PUILockdownModeController *)self presentedViewController];

  if (v15)
  {
    id v16 = [(PUILockdownModeController *)self presentedViewController];
    [v16 presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    [(PUILockdownModeController *)self presentViewController:v11 animated:1 completion:0];
  }
}

- (void)setLockdownModeEnabled:(BOOL)a3 forAllDevices:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke;
  v4[3] = &unk_1E6E9C780;
  v4[4] = self;
  +[PUILockdownModeUtilities setLockdownModeEnabled:a3 forAllDevices:a4 completion:v4];
}

void __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = _PUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke_cold_1();
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke_208;
    block[3] = &unk_1E6E9C758;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke_208(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentErrorAlert];
}

- (void)getEligibleDevicesWithCompletion:(id)a3
{
  v57[1] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void, BOOL))a3;
  BOOL v4 = [MEMORY[0x1E4F179C8] defaultStore];
  id v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
  uint64_t v6 = PUIGetActivePairedDevice();
  BOOL v7 = (void *)v6;
  BOOL v8 = v6 != 0;
  if (v5)
  {
    int v9 = objc_msgSend(v5, "aa_altDSID");
    id v10 = objc_msgSend(v4, "aa_authKitAccountForAltDSID:", v9);
    if (objc_msgSend(v10, "aa_needsToVerifyTerms")) {
      goto LABEL_14;
    }
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2050000000;
    uint64_t v11 = (void *)getAKAccountManagerClass_softClass;
    uint64_t v56 = getAKAccountManagerClass_softClass;
    if (!getAKAccountManagerClass_softClass)
    {
      uint64_t v48 = MEMORY[0x1E4F143A8];
      uint64_t v49 = 3221225472;
      v50 = __getAKAccountManagerClass_block_invoke;
      id v51 = &unk_1E6E9C7F8;
      id v52 = &v53;
      __getAKAccountManagerClass_block_invoke((uint64_t)&v48);
      uint64_t v11 = (void *)v54[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v53, 8);
    int v13 = [v12 sharedInstance];
    BOOL v14 = [v13 securityLevelForAccount:v10] == 4;

    if (!v14)
    {
LABEL_14:
      v3[2](v3, 0, v7 != 0);
    }
    else
    {
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2050000000;
      objc_super v15 = (void *)getAKDeviceListRequestContextClass_softClass;
      uint64_t v56 = getAKDeviceListRequestContextClass_softClass;
      if (!getAKDeviceListRequestContextClass_softClass)
      {
        uint64_t v48 = MEMORY[0x1E4F143A8];
        uint64_t v49 = 3221225472;
        v50 = __getAKDeviceListRequestContextClass_block_invoke;
        id v51 = &unk_1E6E9C7F8;
        id v52 = &v53;
        __getAKDeviceListRequestContextClass_block_invoke((uint64_t)&v48);
        objc_super v15 = (void *)v54[3];
      }
      id v16 = v15;
      _Block_object_dispose(&v53, 8);
      id v35 = objc_alloc_init(v16);
      [v35 setAltDSID:v9];
      [v35 setIncludeFamilyDevices:0];
      [v35 setIncludeUntrustedDevices:0];
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2020000000;
      id v17 = (id *)getAKServiceNameiCloudSymbolLoc_ptr;
      uint64_t v56 = getAKServiceNameiCloudSymbolLoc_ptr;
      if (!getAKServiceNameiCloudSymbolLoc_ptr)
      {
        uint64_t v48 = MEMORY[0x1E4F143A8];
        uint64_t v49 = 3221225472;
        v50 = __getAKServiceNameiCloudSymbolLoc_block_invoke;
        id v51 = &unk_1E6E9C7F8;
        id v52 = &v53;
        uint64_t v18 = (void *)AuthKitLibrary();
        v19 = dlsym(v18, "AKServiceNameiCloud");
        *(void *)(v52[1] + 24) = v19;
        getAKServiceNameiCloudSymbolLoc_ptr = *(void *)(v52[1] + 24);
        id v17 = (id *)v54[3];
      }
      _Block_object_dispose(&v53, 8);
      if (!v17)
      {
        -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
        __break(1u);
      }
      v57[0] = *v17;
      v20 = (void *)MEMORY[0x1E4F1C978];
      id v21 = v57[0];
      v22 = [v20 arrayWithObjects:v57 count:1];

      [v35 setServices:v22];
      [v35 setOperatingSystems:&unk_1F40806B0];
      id v34 = (void *)MGCopyAnswer();
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x2020000000;
      char v47 = 0;
      uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
      dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2050000000;
      id v25 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
      uint64_t v56 = getAKAppleIDAuthenticationControllerClass_softClass;
      if (!getAKAppleIDAuthenticationControllerClass_softClass)
      {
        uint64_t v48 = MEMORY[0x1E4F143A8];
        uint64_t v49 = 3221225472;
        v50 = __getAKAppleIDAuthenticationControllerClass_block_invoke;
        id v51 = &unk_1E6E9C7F8;
        id v52 = &v53;
        __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)&v48);
        id v25 = (void *)v54[3];
      }
      BOOL v33 = v8;
      v26 = v25;
      _Block_object_dispose(&v53, 8);
      id v27 = objc_alloc_init(v26);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke;
      v41[3] = &unk_1E6E9C7A8;
      id v28 = v24;
      id v42 = v28;
      id v29 = v34;
      id v43 = v29;
      id v30 = v23;
      id v44 = v30;
      v45 = v46;
      [v27 fetchDeviceListWithContext:v35 completion:v41];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_227;
      block[3] = &unk_1E6E9C7D0;
      v37 = v28;
      id v38 = v30;
      v39 = v3;
      BOOL v40 = v33;
      id v31 = v30;
      id v32 = v28;
      dispatch_async(MEMORY[0x1E4F14428], block);

      _Block_object_dispose(v46, 8);
    }
  }
  else
  {
    v3[2](v3, 0, v6 != 0);
  }
}

void __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_cold_1();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    BOOL v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v44 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v51 objects:v56 count:16];
    v45 = v8;
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v52;
      do
      {
        uint64_t v13 = 0;
        uint64_t v46 = v11;
        do
        {
          if (*(void *)v52 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v51 + 1) + 8 * v13);
          objc_super v15 = [v14 serialNumber];
          id v16 = v15;
          if (v15 && ([v15 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
          {
            id v17 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];
            if (!v17) {
              goto LABEL_14;
            }
            uint64_t v18 = [v14 lastUpdatedDate];
            [v17 lastUpdatedDate];
            uint64_t v19 = v12;
            uint64_t v20 = a1;
            v22 = id v21 = v9;
            uint64_t v23 = [v18 compare:v22];

            id v9 = v21;
            a1 = v20;
            uint64_t v12 = v19;
            uint64_t v11 = v46;

            BOOL v8 = v45;
            if (v23 == 1) {
LABEL_14:
            }
              [v8 setObject:v14 forKeyedSubscript:v16];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v11);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    dispatch_semaphore_t v24 = [v8 allValues];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v48 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v30 = [v29 lastUpdatedDate];
          [v30 timeIntervalSinceNow];
          double v32 = v31 / 86400.0;

          if (v32 <= 7.0)
          {
            BOOL v33 = [v29 operatingSystemVersion];
            id v34 = [v33 componentsSeparatedByString:@"."];

            id v35 = [v34 firstObject];
            uint64_t v36 = [v35 integerValue];

            v37 = [v29 operatingSystemName];
            int v38 = [v37 isEqualToString:@"iOS"];

            if (v38) {
              BOOL v39 = v36 < 17;
            }
            else {
              BOOL v39 = 1;
            }
            if (!v39) {
              [*(id *)(a1 + 48) addObject:v29];
            }
            BOOL v40 = [v29 operatingSystemName];
            int v41 = [v40 isEqualToString:@"macOS"];

            if (v41 && v36 >= 14) {
              [*(id *)(a1 + 48) addObject:v29];
            }
            id v42 = [v29 operatingSystemName];
            if ([v42 isEqualToString:@"watchOS"] && v36 >= 10)
            {
              int v43 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

              if (!v43)
              {
                [*(id *)(a1 + 48) addObject:v29];
                *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
              }
            }
            else
            {
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v26);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v6 = 0;
    id v5 = v44;
  }
}

uint64_t __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_227(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), v2))
  {
    id v3 = _PUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_227_cold_1(v3);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PUILockdownModeController;
  id v6 = a4;
  BOOL v7 = [(PUILockdownModeController *)&v13 tableView:a3 cellForRowAtIndexPath:v6];
  BOOL v8 = -[PUILockdownModeController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v13.receiver, v13.super_class);

  id v9 = [v8 propertyForKey:*MEMORY[0x1E4F930A8]];
  LODWORD(v6) = [v9 isEqual:objc_opt_class()];

  if (v6)
  {
    uint64_t v10 = [v7 detailTextLabel];
    [v10 setNumberOfLines:0];
  }
  uint64_t v11 = [v8 propertyForKey:@"PUITableCellNoSeparator"];

  if (v11) {
    objc_msgSend(v7, "setSeparatorInset:", 0.0, 0.0, 0.0, 1.79769313e308);
  }

  return v7;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BOOL)has2GSupport
{
  return self->_has2GSupport;
}

- (void)setHas2GSupport:(BOOL)a3
{
  self->_has2GSupport = a3;
}

- (BOOL)_2GEnabled
{
  return self->__2GEnabled;
}

- (void)set_2GEnabled:(BOOL)a3
{
  self->__2GEnabled = a3;
}

- (void)setLockdownModeEnabled:(BOOL)a3
{
  self->_lockdownModeEnabled = a3;
}

- (NSArray)_lockdownModeOptionsSpecifiers
{
  return self->__lockdownModeOptionsSpecifiers;
}

- (void)set_lockdownModeOptionsSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lockdownModeOptionsSpecifiers, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4AD5000, v0, v1, "Error getting if 2G is supported: %@", v2, v3, v4, v5, v6);
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4AD5000, v0, v1, "Error enabling 2G: %@", v2, v3, v4, v5, v6);
}

void __52__PUILockdownModeController_set2GEnabled_specifier___block_invoke_2_140_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4AD5000, v0, v1, "Error disabling 2G: %@", v2, v3, v4, v5, v6);
}

void __66__PUILockdownModeController_setLockdownModeEnabled_forAllDevices___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4AD5000, v0, v1, "Error setting Lockdown Mode state: %@", v2, v3, v4, v5, v6);
}

- (void)getEligibleDevicesWithCompletion:.cold.1()
{
}

void __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4AD5000, v0, v1, "Error fetching device list: %@", v2, v3, v4, v5, v6);
}

void __62__PUILockdownModeController_getEligibleDevicesWithCompletion___block_invoke_227_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E4AD5000, log, OS_LOG_TYPE_ERROR, "Waited too long for fetchDeviceList. Returning…", v1, 2u);
}

@end