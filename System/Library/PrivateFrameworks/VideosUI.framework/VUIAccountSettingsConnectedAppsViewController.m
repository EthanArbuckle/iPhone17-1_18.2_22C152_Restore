@interface VUIAccountSettingsConnectedAppsViewController
+ (void)fetchConnectedAppsWithCompletion:(id)a3;
- (BOOL)showsDoneButton;
- (CGSize)_iconSize;
- (VUIAccountSettingsConnectedAppsViewController)init;
- (id)_accessStatusForSpecifier:(id)a3;
- (id)_appGroupSpecifier;
- (id)specifiers;
- (int64_t)_alertStyle;
- (void)_addPrivacyFooterToGroup:(id)a3;
- (void)_configureDoneButton;
- (void)_dismiss;
- (void)_loadAppGroup;
- (void)_promptToDisableChannel:(id)a3 withExternalID:(id)a4;
- (void)_promptToEnableChannel:(id)a3 withExternalID:(id)a4;
- (void)_showPrivacySheet:(id)a3;
- (void)_showVppaExpiredPrompt:(id)a3;
- (void)_startAppSpinner;
- (void)_stopAppSpinner;
- (void)_toggleSpecifier:(id)a3 sender:(id)a4;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation VUIAccountSettingsConnectedAppsViewController

- (VUIAccountSettingsConnectedAppsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)VUIAccountSettingsConnectedAppsViewController;
  v2 = [(VUIAccountSettingsConnectedAppsViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(VUIAccountSettingsConnectedAppsViewController *)v2 setShowsDoneButton:0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)VUIAccountSettingsConnectedAppsViewController;
  [(VUIAccountSettingsConnectedAppsViewController *)&v10 viewDidLoad];
  v3 = [(VUIAccountSettingsConnectedAppsViewController *)self navigationItem];
  v4 = +[VUILocalizationManager sharedInstance];
  objc_super v5 = [v4 localizedStringForKey:@"SETTINGS_CONNECTED_APPS"];
  [v3 setTitle:v5];

  [(VUIAccountSettingsConnectedAppsViewController *)self _configureDoneButton];
  v6 = +[VUIMetricsPageEventData createWithPageType:@"connectedApps"];
  v7 = +[VUIMetricsController sharedInstance];
  [v7 recordPage:v6];

  v8 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"ConnectedApps"];
  v9 = [(VUIAccountSettingsConnectedAppsViewController *)self view];
  [v9 setAccessibilityIdentifier:v8];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - specifiers - existing specifiers are nil, initializing them", buf, 2u);
    }

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!self->_appGroup)
    {
      v7 = VUIDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - specifiers - existing app group is nil, adding new appGroupSpecifier", v12, 2u);
      }

      v8 = [(VUIAccountSettingsConnectedAppsViewController *)self _appGroupSpecifier];
      appGroup = self->_appGroup;
      self->_appGroup = v8;

      [v6 addObject:self->_appGroup];
      [(VUIAccountSettingsConnectedAppsViewController *)self _loadAppGroup];
    }
    objc_super v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_appGroupSpecifier
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 preferredLocalizations];
  objc_super v5 = [v4 firstObject];

  id v6 = +[VUILocalizationManager sharedInstance];
  v7 = [v6 localizedStringForKey:@"SETTINGS_APPS_GROUP"];
  v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v5];
  v9 = [v7 uppercaseStringWithLocale:v8];

  objc_super v10 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v9];
  [v10 setProperty:@"VUISpinnerHeaderView" forKey:*MEMORY[0x1E4F93178]];
  [(VUIAccountSettingsConnectedAppsViewController *)self _addPrivacyFooterToGroup:v10];

  return v10;
}

- (void)_addPrivacyFooterToGroup:(id)a3
{
  id v4 = a3;
  objc_super v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:*MEMORY[0x1E4F93140]];

  v7 = +[VUILocalizationManager sharedInstance];
  id v15 = [v7 localizedStringForKey:@"SETTINGS_APPS_GROUP_FOOTER_FORMAT"];

  v8 = [MEMORY[0x1E4F83AD0] linkWithBundleIdentifier:@"com.apple.onboarding.tvapp"];
  v9 = [v8 flow];
  objc_super v10 = [v9 localizedButtonTitle];

  v11 = [NSString stringWithValidatedFormat:v15, @"%@", 0, v10 validFormatSpecifiers error];
  [v4 setProperty:v11 forKey:*MEMORY[0x1E4F93160]];
  v17.location = [v11 rangeOfString:v10];
  v12 = NSStringFromRange(v17);
  [v4 setProperty:v12 forKey:*MEMORY[0x1E4F93150]];

  v13 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [v4 setProperty:v13 forKey:*MEMORY[0x1E4F93158]];

  v14 = NSStringFromSelector(sel__showPrivacySheet_);
  [v4 setProperty:v14 forKey:*MEMORY[0x1E4F93148]];
}

- (void)_loadAppGroup
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke;
  v3[3] = &unk_1E6DF6B18;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  +[VUIAccountSettingsConnectedAppsViewController fetchConnectedAppsWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - loaded group for apps: %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    uint64_t v9 = [v5 count];
    if (v6 || !v9)
    {
      v16 = VUIDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_cold_2((uint64_t)v6, v16);
      }

      [WeakRetained removeSpecifier:WeakRetained[173]];
    }
    else
    {
      if ([WeakRetained[174] count])
      {
        objc_super v10 = VUIDefaultLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [WeakRetained[174] count];
          *(_DWORD *)buf = 67109120;
          LODWORD(v22) = v11 != 0;
          _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - app specifier count is above 0: %d", buf, 8u);
        }

        [WeakRetained removeContiguousSpecifiers:WeakRetained[174] animated:0];
      }
      objc_initWeak((id *)buf, WeakRetained);
      v12 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_41;
      block[3] = &unk_1E6DF7230;
      id v13 = v5;
      uint64_t v14 = *(void *)(a1 + 32);
      id v18 = v13;
      uint64_t v19 = v14;
      objc_copyWeak(&v20, (id *)buf);
      dispatch_async(v12, block);

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v15 = VUIDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_cold_1(v15);
    }
  }
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_41(id *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v20 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a1[4];
  uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v22)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        v2 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v3 = (void *)MEMORY[0x1E4F92E70];
        id v4 = [v2 displayName];
        id v5 = [v3 preferenceSpecifierNamed:v4 target:a1[5] set:sel__toggleSpecifier_sender_ get:sel__accessStatusForSpecifier_ detail:objc_opt_class() cell:6 edit:0];

        id v6 = [v2 channelID];
        [v5 setIdentifier:v6];

        [v5 setUserInfo:v2];
        v7 = [MEMORY[0x1E4FB5080] sharedInstance];
        v8 = [v2 channelID];
        uint64_t v9 = [v7 channelForID:v8];

        [a1[5] _iconSize];
        double v11 = v10;
        double v13 = v12;
        objc_initWeak(&location, v5);
        uint64_t v14 = VUIDefaultLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v2 channelID];
          v40.width = v11;
          v40.height = v13;
          v16 = NSStringFromCGSize(v40);
          *(_DWORD *)buf = 138412546;
          id v35 = v15;
          __int16 v36 = 2112;
          v37 = v16;
          _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - begin fetching icon for channelID: %@ of size: %@", buf, 0x16u);
        }
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_49;
        v26[3] = &unk_1E6DFBDB8;
        objc_copyWeak(&v27, &location);
        v26[4] = v2;
        objc_copyWeak(&v28, a1 + 6);
        +[VUIAppIconImageService fetchIconForInstallable:size:completion:](VUIAppIconImageService, "fetchIconForInstallable:size:completion:", v9, v26, v11, v13);
        [v20 addObject:v5];
        objc_destroyWeak(&v28);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v22);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_54;
  block[3] = &unk_1E6DF5490;
  objc_copyWeak(&v25, a1 + 6);
  id v24 = v20;
  id v17 = v20;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v25);
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_49(id *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v5 = WeakRetained;
  if (v3) {
    BOOL v6 = WeakRetained == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [a1[4] channelID];
    *(_DWORD *)buf = 138412546;
    id v18 = v9;
    __int16 v19 = 1024;
    int v20 = v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - done fetching icon for channelID: %@ shouldSetSpecifier: %d", buf, 0x12u);
  }
  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_50;
    v12[3] = &unk_1E6DFBD90;
    objc_copyWeak(&v16, a1 + 6);
    id v13 = v3;
    id v10 = v5;
    id v11 = a1[4];
    id v14 = v10;
    id v15 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v12);

    objc_destroyWeak(&v16);
  }
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_50(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    id v5 = objc_msgSend(v3, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);

    BOOL v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [*(id *)(a1 + 40) identifier];
      v8 = [*(id *)(a1 + 48) channelID];
      int v9 = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      double v12 = v8;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - set and reload specifier id: %@ for channel: %@", (uint8_t *)&v9, 0x16u);
    }
    [*(id *)(a1 + 40) setProperty:v5 forKey:*MEMORY[0x1E4F93190]];
    [WeakRetained reloadSpecifier:*(void *)(a1 + 40)];
  }
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_54(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - loadAppGroup - stopping app spinner and setting app specifiers", v4, 2u);
    }

    [WeakRetained _stopAppSpinner];
    objc_storeStrong(WeakRetained + 174, *(id *)(a1 + 32));
    [WeakRetained insertContiguousSpecifiers:*(void *)(a1 + 32) afterSpecifier:WeakRetained[173] animated:0];
  }
}

- (void)_startAppSpinner
{
  id v2 = [(PSSpecifier *)self->_appGroup propertyForKey:*MEMORY[0x1E4F93180]];
  [v2 showSpinner];
}

- (void)_stopAppSpinner
{
  id v2 = [(PSSpecifier *)self->_appGroup propertyForKey:*MEMORY[0x1E4F93180]];
  [v2 hideSpinner];
}

- (CGSize)_iconSize
{
  double v2 = 29.0;
  double v3 = 29.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_toggleSpecifier:(id)a3 sender:(id)a4
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 identifier];
  int v9 = [MEMORY[0x1E4FB5080] sharedInstance];
  id v10 = [v9 channelForID:v8];

  __int16 v11 = [v7 userInfo];

  double v12 = [v11 externalID];
  uint64_t v13 = [MEMORY[0x1E4FB5088] sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__VUIAccountSettingsConnectedAppsViewController__toggleSpecifier_sender___block_invoke;
  v21[3] = &unk_1E6DFBE08;
  v21[4] = self;
  id v22 = v6;
  id v23 = v10;
  id v24 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v6;
  [v13 fetchConfigurationWithCompletionHandler:v21];

  id v17 = +[VUIMetricsController sharedInstance];
  v25[0] = @"targetId";
  v25[1] = @"targetType";
  v26[0] = v8;
  v26[1] = @"switch";
  v25[2] = @"actionType";
  int v18 = [v16 BOOLValue];
  __int16 v19 = VUIMetricsActionTypeAdd;
  if (!v18) {
    __int16 v19 = VUIMetricsActionTypeRemove;
  }
  v26[2] = *v19;
  int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  [v17 recordClick:v20];
}

void __73__VUIAccountSettingsConnectedAppsViewController__toggleSpecifier_sender___block_invoke(id *a1, void *a2)
{
  double v3 = (void *)[a2 vppaStatus];
  objc_initWeak(&location, a1[4]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__VUIAccountSettingsConnectedAppsViewController__toggleSpecifier_sender___block_invoke_2;
  v4[3] = &unk_1E6DFBDE0;
  objc_copyWeak(v8, &location);
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[7];
  v8[1] = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __73__VUIAccountSettingsConnectedAppsViewController__toggleSpecifier_sender___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if ((*(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL) == 2) {
      [WeakRetained _showVppaExpiredPrompt:v2];
    }
    else {
      [WeakRetained _promptToEnableChannel:v2 withExternalID:*(void *)(a1 + 48)];
    }
  }
  else
  {
    [WeakRetained _promptToDisableChannel:*(void *)(a1 + 40) withExternalID:*(void *)(a1 + 48)];
  }
}

- (id)_accessStatusForSpecifier:(id)a3
{
  double v3 = [a3 userInfo];
  id v4 = [MEMORY[0x1E4FB5158] sharedSettings];
  id v5 = [v3 channelID];
  id v6 = [v3 externalID];
  id v7 = [v4 settingsForChannelID:v5 externalID:v6];

  if ([v7 accessStatus] == 1) {
    v8 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v8 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v8;
}

- (void)_showPrivacySheet:(id)a3
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.tvapp"];
  [v4 setPresentingViewController:self];
  [v4 present];
  id v5 = +[VUIMetricsController sharedInstance];
  v7[0] = @"targetId";
  v7[1] = @"targetType";
  v8[0] = @"privacyLink";
  v8[1] = @"link";
  v7[2] = @"actionType";
  id v8[2] = @"privacyLink";
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  [v5 recordClick:v6];
}

- (void)_showVppaExpiredPrompt:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIAccountSettingsConnectedAppsViewController *)self navigationController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__VUIAccountSettingsConnectedAppsViewController__showVppaExpiredPrompt___block_invoke;
  void v7[3] = &unk_1E6DF3D58;
  id v8 = v4;
  id v6 = v4;
  [v5 dismissViewControllerAnimated:1 completion:v7];
}

void __72__VUIAccountSettingsConnectedAppsViewController__showVppaExpiredPrompt___block_invoke(uint64_t a1)
{
  id v2 = +[VUIVPPAManager sharedInstance];
  [v2 startVPPAConsentFlow:*(void *)(a1 + 32) consentCancelButtonType:0 shouldForceVPPAPrompt:0 completion:&__block_literal_global_132];
}

void __72__VUIAccountSettingsConnectedAppsViewController__showVppaExpiredPrompt___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = VUIBoolLogString();
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - showVppaExpiredPrompt - Finished VPPA reconsent. Success: %@", (uint8_t *)&v7, 0xCu);
  }
  if (a3)
  {
    id v6 = +[VUIVPPAManager sharedInstance];
    [v6 reloadConfigurationAfterVPPAChange];
  }
}

- (void)_promptToEnableChannel:(id)a3 withExternalID:(id)a4
{
  id v6 = a3;
  id v44 = a4;
  int v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
  uint64_t v9 = [v8 username];

  id v10 = +[VUILocalizationManager sharedInstance];
  uint64_t v11 = [v10 localizedStringForKey:@"SETTINGS_APP_OPT_IN_PROMPT_FORMAT"];

  double v12 = NSString;
  uint64_t v13 = [v6 name];
  v42 = (void *)v11;
  v43 = (void *)v9;
  uint64_t v14 = [v12 stringWithValidatedFormat:v11, @"%@ %@", 0, v13, v9 validFormatSpecifiers error];

  id v15 = +[VUILocalizationManager sharedInstance];
  uint64_t v16 = [v15 localizedStringForKey:@"SETTINGS_APP_OPT_IN_TITLE_FORMAT"];

  id v17 = NSString;
  int v18 = [v6 name];
  CGSize v40 = (void *)v16;
  uint64_t v19 = [v17 stringWithValidatedFormat:v16, @"%@", 0, v18 validFormatSpecifiers error];

  uint64_t v39 = (void *)v19;
  if ([(VUIAccountSettingsConnectedAppsViewController *)self _alertStyle] == 1) {
    int v20 = (void *)v19;
  }
  else {
    int v20 = 0;
  }
  id v38 = v20;
  v41 = (void *)v14;
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v38, v14, -[VUIAccountSettingsConnectedAppsViewController _alertStyle](self, "_alertStyle"));
  id v22 = [v6 channelID];
  id v23 = +[VUILocalizationManager sharedInstance];
  uint64_t v24 = [v23 localizedStringForKey:@"SETTINGS_APP_OPT_IN_FORMAT"];

  id v25 = NSString;
  v26 = [v6 name];
  v37 = (void *)v24;
  id v27 = [v25 stringWithValidatedFormat:v24, @"%@", 0, v26 validFormatSpecifiers error];

  objc_initWeak(location, self);
  id v28 = (void *)MEMORY[0x1E4FB1410];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke;
  v48[3] = &unk_1E6DFBE58;
  id v29 = v22;
  id v49 = v29;
  id v45 = v44;
  id v50 = v45;
  id v30 = v6;
  id v51 = v30;
  v52 = self;
  objc_copyWeak(&v53, location);
  long long v31 = [v28 actionWithTitle:v27 style:0 handler:v48];
  long long v32 = (void *)MEMORY[0x1E4FB1410];
  long long v33 = +[VUILocalizationManager sharedInstance];
  v34 = [v33 localizedStringForKey:@"CANCEL"];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_2;
  v46[3] = &unk_1E6DFBE80;
  v46[4] = self;
  id v35 = v29;
  id v47 = v35;
  __int16 v36 = [v32 actionWithTitle:v34 style:1 handler:v46];

  [v21 addAction:v31];
  [v21 addAction:v36];
  [(VUIAccountSettingsConnectedAppsViewController *)self presentViewController:v21 animated:1 completion:0];

  objc_destroyWeak(&v53);
  objc_destroyWeak(location);
}

void __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FB5158] sharedSettings];
  [v4 setStatus:1 forChannelID:*(void *)(a1 + 32) externalID:*(void *)(a1 + 40)];
  id v5 = [v4 settingsForChannelID:*(void *)(a1 + 32) externalID:*(void *)(a1 + 40)];
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToEnableChannel - Enabling channel %@", buf, 0xCu);
  }

  id v8 = (void *)MEMORY[0x1E4FB5150];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_79;
  v12[3] = &unk_1E6DFBE30;
  id v13 = *(id *)(a1 + 48);
  id v9 = v4;
  id v14 = v9;
  id v15 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 56);
  id v16 = v10;
  uint64_t v17 = v11;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  [v8 updateCloudStoreAppSettings:v5 deleteHistory:0 completion:v12];
  objc_destroyWeak(&v18);
}

void __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_79(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) channelID];
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToEnableChannel - Successfully enabled channel %@", buf, 0xCu);
    }
    uint64_t v7 = +[VUIVPPAManager sharedInstance];
    [v7 reloadConfigurationAfterVPPAChange];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToEnableChannel - Failed to sync opt-in to cloud, reverting", buf, 2u);
    }

    [*(id *)(a1 + 40) setStatus:2 forChannelID:*(void *)(a1 + 48) externalID:*(void *)(a1 + 56)];
    id v8 = [*(id *)(a1 + 64) specifierForID:*(void *)(a1 + 48)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_80;
    v10[3] = &unk_1E6DF5490;
    objc_copyWeak(&v12, (id *)(a1 + 72));
    id v11 = v8;
    id v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v10);

    objc_destroyWeak(&v12);
  }
}

void __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
}

void __87__VUIAccountSettingsConnectedAppsViewController__promptToEnableChannel_withExternalID___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) specifierForID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadSpecifier:v2 animated:1];
}

- (void)_promptToDisableChannel:(id)a3 withExternalID:(id)a4
{
  id v6 = a3;
  id v53 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
  id v9 = [v8 username];

  id v10 = +[VUILocalizationManager sharedInstance];
  uint64_t v11 = [v10 localizedStringForKey:@"SETTINGS_APP_OPT_OUT_PROMPT_FORMAT"];

  id v12 = NSString;
  id v13 = [v6 name];
  id v14 = [v6 name];
  uint64_t v15 = [v12 stringWithValidatedFormat:v11, @"%@ %@ %@", 0, v13, v14, v9 validFormatSpecifiers error];

  id v16 = +[VUILocalizationManager sharedInstance];
  uint64_t v17 = [v16 localizedStringForKey:@"SETTINGS_APP_OPT_OUT_TITLE_FORMAT"];

  id v18 = NSString;
  uint64_t v19 = [v6 name];
  id v51 = (void *)v17;
  uint64_t v20 = [v18 stringWithValidatedFormat:v17, @"%@", 0, v19 validFormatSpecifiers error];

  id v50 = (void *)v20;
  if ([(VUIAccountSettingsConnectedAppsViewController *)self _alertStyle] == 1) {
    uint64_t v21 = (void *)v20;
  }
  else {
    uint64_t v21 = 0;
  }
  id v49 = v21;
  v52 = (void *)v15;
  v55 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v49, v15, -[VUIAccountSettingsConnectedAppsViewController _alertStyle](self, "_alertStyle"));
  id v22 = [v6 channelID];
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke;
  aBlock[3] = &unk_1E6DFBEA8;
  id v23 = v22;
  id v65 = v23;
  id v48 = v53;
  id v66 = v48;
  id v54 = v6;
  id v67 = v54;
  v68 = self;
  objc_copyWeak(&v69, location);
  uint64_t v24 = _Block_copy(aBlock);
  id v25 = +[VUILocalizationManager sharedInstance];
  uint64_t v26 = [v25 localizedStringForKey:@"SETTINGS_APP_OPT_OUT_FORMAT"];
  id v47 = (void *)v11;

  id v27 = NSString;
  id v28 = [v54 name];
  uint64_t v29 = [v27 stringWithValidatedFormat:v26, @"%@", 0, v28 validFormatSpecifiers error];
  v46 = (void *)v26;

  id v30 = (void *)MEMORY[0x1E4FB1410];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_2;
  v61[3] = &unk_1E6DFBED0;
  id v31 = v24;
  id v63 = v31;
  id v32 = v23;
  id v62 = v32;
  id v45 = (void *)v29;
  long long v33 = [v30 actionWithTitle:v29 style:0 handler:v61];
  v34 = (void *)MEMORY[0x1E4FB1410];
  id v35 = +[VUILocalizationManager sharedInstance];
  __int16 v36 = [v35 localizedStringForKey:@"SETTINGS_APP_OPT_OUT_AND_DELETE"];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_3;
  v58[3] = &unk_1E6DFBED0;
  id v37 = v31;
  id v60 = v37;
  id v38 = v32;
  id v59 = v38;
  uint64_t v39 = [v34 actionWithTitle:v36 style:2 handler:v58];

  CGSize v40 = (void *)MEMORY[0x1E4FB1410];
  v41 = +[VUILocalizationManager sharedInstance];
  v42 = [v41 localizedStringForKey:@"CANCEL"];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_4;
  v56[3] = &unk_1E6DFBE80;
  v56[4] = self;
  id v43 = v38;
  id v57 = v43;
  id v44 = [v40 actionWithTitle:v42 style:1 handler:v56];

  [v55 addAction:v33];
  [v55 addAction:v39];
  [v55 addAction:v44];
  [(VUIAccountSettingsConnectedAppsViewController *)self presentViewController:v55 animated:1 completion:0];

  objc_destroyWeak(&v69);
  objc_destroyWeak(location);
}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4FB5158] sharedSettings];
  [v4 setStatus:2 forChannelID:*(void *)(a1 + 32) externalID:*(void *)(a1 + 40)];
  BOOL v5 = [v4 settingsForChannelID:*(void *)(a1 + 32) externalID:*(void *)(a1 + 40)];
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    uint64_t v8 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToDisableChannel - Disabling channel %@ Delete:%@", buf, 0x16u);
  }

  id v9 = (void *)MEMORY[0x1E4FB5150];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_101;
  v13[3] = &unk_1E6DFBE30;
  id v14 = *(id *)(a1 + 48);
  id v10 = v4;
  id v15 = v10;
  id v16 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 56);
  id v17 = v11;
  uint64_t v18 = v12;
  objc_copyWeak(&v19, (id *)(a1 + 64));
  [v9 updateCloudStoreAppSettings:v5 deleteHistory:a2 completion:v13];
  objc_destroyWeak(&v19);
}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_101(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = VUIDefaultLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) channelID];
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToDisableChannel - Successfully disabled channel %@", buf, 0xCu);
    }
    id v9 = +[VUIVPPAManager sharedInstance];
    [v9 reloadConfigurationAfterVPPAChange];
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - promptToDisableChannel - Failed to sync opt-out to cloud, reverting: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setStatus:1 forChannelID:*(void *)(a1 + 48) externalID:*(void *)(a1 + 56)];
    id v10 = [*(id *)(a1 + 64) specifierForID:*(void *)(a1 + 48)];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_102;
    v12[3] = &unk_1E6DF5490;
    objc_copyWeak(&v14, (id *)(a1 + 72));
    id v13 = v10;
    id v11 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v12);

    objc_destroyWeak(&v14);
  }
}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_102(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_2(uint64_t a1)
{
  v6[4] = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = +[VUIMetricsController sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = @"targetId";
  v5[1] = @"targetType";
  v6[0] = v3;
  v6[1] = @"alertButton";
  v5[2] = @"actionType";
  v5[3] = @"actionContext";
  v6[2] = @"remove";
  v6[3] = @"alert";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  [v2 recordClick:v4];
}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_3(uint64_t a1)
{
  v6[4] = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = +[VUIMetricsController sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = @"targetId";
  v5[1] = @"targetType";
  v6[0] = v3;
  v6[1] = @"alertButton";
  v5[2] = @"actionType";
  v5[3] = @"actionContext";
  v6[2] = @"removeAndClearHistory";
  v6[3] = @"alert";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  [v2 recordClick:v4];
}

void __88__VUIAccountSettingsConnectedAppsViewController__promptToDisableChannel_withExternalID___block_invoke_4(uint64_t a1)
{
  void v7[4] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) specifierForID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadSpecifier:v2 animated:1];
  uint64_t v3 = +[VUIMetricsController sharedInstance];
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = @"targetId";
  v6[1] = @"targetType";
  v7[0] = v4;
  v7[1] = @"alertButton";
  v6[2] = @"actionType";
  v6[3] = @"actionContext";
  v7[2] = @"cancel";
  void v7[3] = @"alert";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  [v3 recordClick:v5];
}

- (int64_t)_alertStyle
{
  uint64_t v3 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:2];
  uint64_t v4 = [(VUIAccountSettingsConnectedAppsViewController *)self traitCollection];
  unsigned int v5 = [v4 containsTraitsInCollection:v3];

  return v5;
}

- (void)_configureDoneButton
{
  if (self->_showsDoneButton)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__dismiss];
    uint64_t v3 = [(VUIAccountSettingsConnectedAppsViewController *)self navigationItem];
    [v3 setRightBarButtonItem:v4];
  }
}

- (void)_dismiss
{
  id v2 = [(VUIAccountSettingsConnectedAppsViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

+ (void)fetchConnectedAppsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FB5158] sharedSettings];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke;
  v6[3] = &unk_1E6DF49E8;
  id v7 = v3;
  id v5 = v3;
  [v4 synchronize:1 completion:v6];
}

void __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_cold_1((uint64_t)v4, v5);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v4);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB5158] sharedSettings];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_115;
    v9[3] = &unk_1E6DF3DA8;
    id v10 = v8;
    id v11 = *(id *)(a1 + 32);
    id v7 = v8;
    [v7 _updateDisplayNamesForUI:v9];
  }
}

void __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_115(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_2;
  block[3] = &unk_1E6DFBEF8;
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _watchListAppsFiltered];
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [v2 count];
    int v5 = *(unsigned __int8 *)(a1 + 48);
    int v6 = 134218240;
    uint64_t v7 = v4;
    __int16 v8 = 1024;
    int v9 = v5;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIAccountSettingsConnectedApps - fetchConnectedApps - finished fetching apps, count: %lu, updateSuccess: %d", (uint8_t *)&v6, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_appGroup, 0);
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIAccountSettingsConnectedApps - loadAppGroup - strongSelf is nil, aborting", v1, 2u);
}

void __62__VUIAccountSettingsConnectedAppsViewController__loadAppGroup__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIAccountSettingsConnectedApps - loadAppGroup - app groups are empty or an error occured! aborting load. error: %@", (uint8_t *)&v2, 0xCu);
}

void __82__VUIAccountSettingsConnectedAppsViewController_fetchConnectedAppsWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIAccountSettingsConnectedApps - fetchConnectedApps - failed to fetch connected apps with error: %@", (uint8_t *)&v2, 0xCu);
}

@end