@interface VUIAccountSettingsViewController
- (BOOL)authenticationInProgress;
- (NSNumber)_pendingSyncMySportsEnabled;
- (NSNumber)_syncMySportsEnabled;
- (NSTimer)syncMySportsDebouncer;
- (NSTimer)syncMySportsNotifyDebouncer;
- (NSURL)addFundsUrl;
- (PSSpecifier)autoPlayNextEpisodeSpecifier;
- (PSSpecifier)autoPlayRecommendedItemsSpecifier;
- (PSSpecifier)syncMySportsSpecifier;
- (VUIAccountSettingsViewController)init;
- (WLKPostPlayAutoPlayToggleInterface)autoPlayToggleInterface;
- (id)_accountSpecifiers;
- (id)_autoPlayNextVideoSpecifiers;
- (id)_clearHistorySpecifiers;
- (id)_createAxIdFromTableCell:(id)a3;
- (id)_dialogMetricsData;
- (id)_externalSpecifiers;
- (id)_getConnectedAppsCountString;
- (id)_mySportsSpecifiers;
- (id)_notificationGroupSpecifierIdentifier;
- (id)_notificationSpecifiers;
- (id)_signOutSpecifiers;
- (id)_sourcesSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_alertStyle;
- (int64_t)connectedWatchListAppCount;
- (int64_t)initialSubsection;
- (int64_t)installedWatchListAppCount;
- (int64_t)notifAuthStatus;
- (void)_addPrivacyFooterToGroup:(id)a3;
- (void)_checkConnectedAppsWithDispatchGroup:(id)a3;
- (void)_checkExternalLinksWithDispatchGroup:(id)a3;
- (void)_clearPlayHistory:(id)a3;
- (void)_didSelectSpecifier:(id)a3;
- (void)_didSelectSpecifier:(id)a3 isManualSelection:(BOOL)a4;
- (void)_dismissViewController;
- (void)_fetchMySportsSyncSettingWithCompletion:(id)a3;
- (void)_handleAccountSettingsEventWithAmsWebView:(id)a3;
- (void)_handleAccountSettingsEventWithAmsWebView:(id)a3 storeServicesBagKey:(id)a4 storeServicesUrl:(id)a5;
- (void)_handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5;
- (void)_handleNotificationsOff;
- (void)_navigateToSubsection:(int64_t)a3 clearSubsection:(BOOL)a4;
- (void)_parseUrl:(id)a3;
- (void)_promptForNotificationsAuth;
- (void)_recordDialogClick:(id)a3;
- (void)_resolveLandingBehavior;
- (void)_setSyncMySportsEnabled:(id)a3;
- (void)_showPrivacySheet:(id)a3;
- (void)_syncMySportsEnabled;
- (void)_syncMySportsSettingDidChange:(id)a3;
- (void)nextEpisodeSettingDidChange;
- (void)recommendedItemsSettingDidChange;
- (void)setAddFundsUrl:(id)a3;
- (void)setAuthenticationInProgress:(BOOL)a3;
- (void)setAutoPlayNextEpisodeSpecifier:(id)a3;
- (void)setAutoPlayRecommendedItemsSpecifier:(id)a3;
- (void)setAutoPlayToggleInterface:(id)a3;
- (void)setConnectedWatchListAppCount:(int64_t)a3;
- (void)setInitialSubsection:(int64_t)a3;
- (void)setInstalledWatchListAppCount:(int64_t)a3;
- (void)setNotifAuthStatus:(int64_t)a3;
- (void)setSyncMySportsDebouncer:(id)a3;
- (void)setSyncMySportsNotifyDebouncer:(id)a3;
- (void)setSyncMySportsSpecifier:(id)a3;
- (void)set_pendingSyncMySportsEnabled:(id)a3;
- (void)set_syncMySportsEnabled:(id)a3;
- (void)specifiers;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VUIAccountSettingsViewController

- (VUIAccountSettingsViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)VUIAccountSettingsViewController;
  v2 = [(VUIAccountSettingsViewController *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_authenticationInProgress = 0;
    v2->_installedWatchListAppCount = 0;
    v2->_connectedWatchListAppCount = 0;
    v2->_initialSubsection = 0;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = +[VUISportsFavoriteService UserConsentDidChangeNotification];
    [v4 addObserver:v3 selector:sel__syncMySportsSettingDidChange_ name:v5 object:0];

    objc_initWeak(&location, v3);
    v6 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__VUIAccountSettingsViewController_init__block_invoke;
    v12[3] = &unk_1E6DF69C0;
    objc_copyWeak(&v13, &location);
    [v6 getNotificationSettingsWithCompletionHandler:v12];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__VUIAccountSettingsViewController_init__block_invoke_3;
    v10[3] = &unk_1E6DF59E8;
    objc_copyWeak(&v11, &location);
    [(VUIAccountSettingsViewController *)v3 _fetchMySportsSyncSettingWithCompletion:v10];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB5130]) initWithDelegate:v3];
    autoPlayToggleInterface = v3->_autoPlayToggleInterface;
    v3->_autoPlayToggleInterface = (WLKPostPlayAutoPlayToggleInterface *)v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__VUIAccountSettingsViewController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__VUIAccountSettingsViewController_init__block_invoke_2;
  v5[3] = &unk_1E6DF5490;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __40__VUIAccountSettingsViewController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setNotifAuthStatus:", objc_msgSend(*(id *)(a1 + 32), "authorizationStatus"));
  if ([*(id *)(a1 + 32) authorizationStatus] != 2) {
    [WeakRetained reloadSpecifiers];
  }
}

void __40__VUIAccountSettingsViewController_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    id v4 = (void *)WeakRetained[181];
    WeakRetained[181] = v3;

    [WeakRetained reloadSpecifiers];
  }
}

- (void)_fetchMySportsSyncSettingWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke;
  block[3] = &unk_1E6DF3DD0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke(uint64_t a1)
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E6DF69E8;
  v14 = v15;
  id v13 = *(id *)(a1 + 32);
  v1 = _Block_copy(aBlock);
  dispatch_time_t v2 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_4;
  block[3] = &unk_1E6DF3DD0;
  id v3 = v1;
  id v11 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_5;
  v5[3] = &unk_1E6DF6A10;
  id v7 = v8;
  id v4 = v3;
  id v6 = v4;
  +[VUISportsFavoriteService userConsentWithCompletionHandler:v5];

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v15, 8);
}

void __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_3;
    v4[3] = &unk_1E6DF6338;
    id v5 = *(id *)(a1 + 32);
    char v6 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 status] == 2;
  char v6 = WLKSystemLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_5_cold_1(a1 + 40, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (+[VUIAuthenticationManager userHasActiveAccount])
  {
    id v4 = [(VUIAccountSettingsViewController *)self _accountSpecifiers];
    [v3 addObjectsFromArray:v4];

    if (self->_installedWatchListAppCount > 0 || self->_initialSubsection == 1)
    {
      id v5 = [(VUIAccountSettingsViewController *)self _sourcesSpecifiers];
      [v3 addObjectsFromArray:v5];
    }
    char v6 = [(VUIAccountSettingsViewController *)self _externalSpecifiers];
    [v3 addObjectsFromArray:v6];

    id v7 = [(VUIAccountSettingsViewController *)self _clearHistorySpecifiers];
    [v3 addObjectsFromArray:v7];

    if (_os_feature_enabled_impl())
    {
      v8 = [(VUIAccountSettingsViewController *)self _autoPlayNextVideoSpecifiers];
      [v3 addObjectsFromArray:v8];
    }
    if ([(VUIAccountSettingsViewController *)self notifAuthStatus] != 2)
    {
      char v9 = [(VUIAccountSettingsViewController *)self _notificationSpecifiers];
      [v3 addObjectsFromArray:v9];
    }
    if (WLKIsSportsFavoritesEnabled() && self->__syncMySportsEnabled)
    {
      v10 = [(VUIAccountSettingsViewController *)self _mySportsSpecifiers];
      [v3 addObjectsFromArray:v10];
    }
    if (!+[VUIAuthenticationManager isDemoAccount])
    {
      id v11 = [(VUIAccountSettingsViewController *)self _signOutSpecifiers];
      [v3 addObjectsFromArray:v11];
    }
  }
  else
  {
    v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(VUIAccountSettingsViewController *)v12 specifiers];
    }

    [(VUIAccountSettingsViewController *)self _dismissViewController];
  }
  [(VUIAccountSettingsViewController *)self setSpecifiers:v3];
  v20 = (void *)[v3 copy];

  return v20;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)VUIAccountSettingsViewController;
  [(VUIAccountSettingsViewController *)&v25 viewDidLoad];
  id v3 = [(VUIAccountSettingsViewController *)self view];
  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [v3 setBackgroundColor:v4];

  id v5 = [(VUIAccountSettingsViewController *)self navigationController];
  [v5 setNavigationBarHidden:0];

  char v6 = [(VUIAccountSettingsViewController *)self navigationController];
  id v7 = [v6 navigationBar];
  [v7 setPrefersLargeTitles:0];

  id v8 = objc_alloc(MEMORY[0x1E4FB14A8]);
  char v9 = +[VUILocalizationManager sharedInstance];
  v10 = [v9 localizedStringForKey:@"DONE"];
  id v11 = (void *)[v8 initWithTitle:v10 style:2 target:self action:sel__dismissViewController];

  v12 = [(VUIAccountSettingsViewController *)self navigationItem];
  [v12 setLeftBarButtonItem:0];

  uint64_t v13 = [(VUIAccountSettingsViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v11];

  uint64_t v14 = [(VUIAccountSettingsViewController *)self navigationItem];
  uint64_t v15 = +[VUILocalizationManager sharedInstance];
  uint64_t v16 = [v15 localizedStringForKey:@"SETTINGS_ACCOUNT"];
  [v14 setTitle:v16];

  uint64_t v17 = [MEMORY[0x1E4FB19D0] appearance];
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [v17 setBarTintColor:v18];

  uint64_t v19 = [MEMORY[0x1E4FB19D0] appearance];
  id v20 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  [v19 setShadowImage:v20];

  v21 = [MEMORY[0x1E4FB14A8] appearance];
  v22 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  [v21 setTintColor:v22];

  v23 = +[VUIMetricsController sharedInstance];
  v24 = [(VUIAccountSettingsViewController *)self _dialogMetricsData];
  [v23 recordDialog:v24];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIAccountSettingsViewController;
  [(VUIAccountSettingsViewController *)&v4 viewWillAppear:a3];
  [(VUIAccountSettingsViewController *)self _resolveLandingBehavior];
}

- (id)_accountSpecifiers
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"AccountGroupSpecifier"];
  objc_super v4 = +[VUIAuthenticationManager creditsString];
  if ([v4 length])
  {
    id v5 = NSString;
    char v6 = +[VUILocalizationManager sharedInstance];
    id v7 = [v6 localizedStringForKey:@"SETTINGS_CREDIT"];
    id v8 = [v5 stringWithValidatedFormat:v7, @"%@", 0, v4 validFormatSpecifiers error];

    [v3 setProperty:v8 forKey:*MEMORY[0x1E4F93170]];
    [v3 setProperty:&unk_1F3F3C920 forKey:*MEMORY[0x1E4F93138]];
  }
  char v9 = (void *)MEMORY[0x1E4F92E70];
  v10 = +[VUILocalizationManager sharedInstance];
  id v11 = [v10 localizedStringForKey:@"SETTINGS_ACCOUNT"];
  v12 = [v9 preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v12 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
  [v12 setProperty:v13 forKey:*MEMORY[0x1E4F93218]];

  uint64_t v14 = +[VUIAuthenticationManager userFullName];
  [v12 setProperty:v14 forKey:*MEMORY[0x1E4F93240]];

  uint64_t v15 = +[VUIAuthenticationManager userAccountName];
  [v12 setProperty:v15 forKey:*MEMORY[0x1E4F93230]];

  uint64_t v16 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v12 setProperty:v16 forKey:*MEMORY[0x1E4F93228]];

  [v12 setProperty:@"accountName" forKey:*MEMORY[0x1E4F93188]];
  [v12 setControllerLoadAction:sel__didSelectSpecifier_];
  v19[0] = v3;
  v19[1] = v12;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  return v17;
}

- (id)_sourcesSpecifiers
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F92E70];
  objc_super v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"SETTINGS_SOURCES"];
  char v6 = [v3 groupSpecifierWithID:@"SourcesGroupSpecifier" name:v5];

  id v7 = (void *)MEMORY[0x1E4F92E70];
  id v8 = +[VUILocalizationManager sharedInstance];
  char v9 = [v8 localizedStringForKey:@"SETTINGS_CONNECTED_APPS"];
  v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:sel__getConnectedAppsCountString detail:objc_opt_class() cell:2 edit:0];

  [v10 setControllerLoadAction:sel__didSelectSpecifier_];
  [v10 setProperty:@"connectedApps" forKey:*MEMORY[0x1E4F93188]];
  v13[0] = v6;
  v13[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return v11;
}

- (id)_externalSpecifiers
{
  v32[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"ExternalGroupSpecifier"];
  objc_super v4 = (void *)MEMORY[0x1E4F92E70];
  id v5 = +[VUILocalizationManager sharedInstance];
  char v6 = [v5 localizedStringForKey:@"SETTINGS_MANAGE_SUBSCRIPTIONS"];
  id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

  id v8 = (void *)MEMORY[0x1E4F92E70];
  char v9 = +[VUILocalizationManager sharedInstance];
  v10 = [v9 localizedStringForKey:@"SETTINGS_REDEEM_GIFT_CARD_OR_CODE"];
  id v11 = [v8 preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = *MEMORY[0x1E4F930A8];
  [v7 setProperty:v12 forKey:*MEMORY[0x1E4F930A8]];
  [v11 setProperty:objc_opt_class() forKey:v13];
  double v14 = *MEMORY[0x1E4FB2F28];
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
  uint64_t v16 = *MEMORY[0x1E4F93218];
  [v7 setProperty:v15 forKey:*MEMORY[0x1E4F93218]];

  uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
  uint64_t v30 = v16;
  [v11 setProperty:v17 forKey:v16];

  [v7 setButtonAction:sel__didSelectSpecifier_];
  [v11 setButtonAction:sel__didSelectSpecifier_];
  uint64_t v18 = *MEMORY[0x1E4F93188];
  [v7 setProperty:@"manageSubscriptions" forKey:*MEMORY[0x1E4F93188]];
  [v11 setProperty:@"redeemGiftCardOrCode" forKey:v18];
  id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v31 = (void *)v3;
  v32[0] = v3;
  v32[1] = v7;
  v32[2] = v11;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  v21 = (void *)[v19 initWithArray:v20];

  if (self->_addFundsUrl)
  {
    v22 = (void *)MEMORY[0x1E4F92E70];
    v23 = +[VUILocalizationManager sharedInstance];
    [v23 localizedStringForKey:@"SETTINGS_ADD_MONEY_TO_ACCOUNT"];
    objc_super v25 = v24 = v13;
    v26 = [v22 preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

    [v26 setProperty:objc_opt_class() forKey:v24];
    v27 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
    [v26 setProperty:v27 forKey:v30];

    [v26 setButtonAction:sel__didSelectSpecifier_];
    [v26 setProperty:@"addMoneyToAccount" forKey:v18];
    [v21 addObject:v26];
  }
  v28 = (void *)[v21 copy];

  return v28;
}

- (id)_clearHistorySpecifiers
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"ClearHistoryGroupSpecifier"];
  objc_super v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"SETTINGS_CLEAR_HISTORY_FOOTER"];

  char v6 = NSString;
  id v7 = +[VUIAuthenticationManager userAccountName];
  id v8 = [v6 stringWithValidatedFormat:v5, @"%@", 0, v7 validFormatSpecifiers error];

  [v3 setProperty:v8 forKey:*MEMORY[0x1E4F93170]];
  char v9 = (void *)MEMORY[0x1E4F92E70];
  v10 = +[VUILocalizationManager sharedInstance];
  id v11 = [v10 localizedStringForKey:@"SETTINGS_CLEAR_HISTORY"];
  uint64_t v12 = [v9 deleteButtonSpecifierWithName:v11 target:self action:sel__clearPlayHistory_];

  [v12 setProperty:@"clearPlayHistory" forKey:*MEMORY[0x1E4F93188]];
  v15[0] = v3;
  v15[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  return v13;
}

- (id)_autoPlayNextVideoSpecifiers
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F92E70];
  objc_super v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"SETTINGS_AUTO_PLAY"];
  char v6 = [v3 groupSpecifierWithID:@"AutoPlayNextVideoSpecifier" name:v5];

  id v7 = +[VUILocalizationManager sharedInstance];
  v28 = [v7 localizedStringForKey:@"SETTINGS_AUTO_PLAY_FOOTER"];

  [v6 setProperty:v28 forKey:*MEMORY[0x1E4F93170]];
  id v8 = (void *)MEMORY[0x1E4F92E70];
  char v9 = +[VUILocalizationManager sharedInstance];
  v10 = [v9 localizedStringForKey:@"SETTINGS_AUTO_PLAY_NEXT_EPISODE"];
  id v11 = [v8 preferenceSpecifierNamed:v10 target:self->_autoPlayToggleInterface set:sel_setIsNextEpisodeSettingEnabled_ get:sel_isNextEpisodeSettingEnabled detail:0 cell:6 edit:0];

  double v12 = *MEMORY[0x1E4FB2F28];
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
  uint64_t v14 = *MEMORY[0x1E4F93218];
  [v11 setProperty:v13 forKey:*MEMORY[0x1E4F93218]];

  uint64_t v15 = *MEMORY[0x1E4F93188];
  [v11 setProperty:@"autoPlayNextVideo" forKey:*MEMORY[0x1E4F93188]];
  uint64_t v16 = *MEMORY[0x1E4F93068];
  [v11 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93068]];
  autoPlayNextEpisodeSpecifier = self->_autoPlayNextEpisodeSpecifier;
  self->_autoPlayNextEpisodeSpecifier = (PSSpecifier *)v11;
  id v18 = v11;

  id v19 = (void *)MEMORY[0x1E4F92E70];
  id v20 = +[VUILocalizationManager sharedInstance];
  v21 = [v20 localizedStringForKey:@"SETTINGS_AUTO_PLAY_RECOMMENDED_ITEMS"];
  v22 = [v19 preferenceSpecifierNamed:v21 target:self->_autoPlayToggleInterface set:sel_setIsRecommendedItemsSettingEnabled_ get:sel_isRecommendedItemsSettingEnabled detail:0 cell:6 edit:0];

  v23 = [MEMORY[0x1E4F28ED0] numberWithDouble:v12];
  [v22 setProperty:v23 forKey:v14];

  [v22 setProperty:@"autoPlayNextVideo" forKey:v15];
  [v22 setProperty:MEMORY[0x1E4F1CC38] forKey:v16];
  autoPlayRecommendedItemsSpecifier = self->_autoPlayRecommendedItemsSpecifier;
  self->_autoPlayRecommendedItemsSpecifier = (PSSpecifier *)v22;
  id v25 = v22;

  v29[0] = v6;
  v29[1] = v18;
  v29[2] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];

  return v26;
}

- (id)_notificationSpecifiers
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"NotificationGroupSpecifier"];
  objc_super v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"SETTINGS_ALLOW_NOTIFICATIONS_FOOTER"];

  [v3 setProperty:v5 forKey:*MEMORY[0x1E4F93170]];
  char v6 = (void *)MEMORY[0x1E4F92E70];
  id v7 = [(VUIAccountSettingsViewController *)self _notificationGroupSpecifierIdentifier];
  id v8 = [v6 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v8 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  char v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
  [v8 setProperty:v9 forKey:*MEMORY[0x1E4F93218]];

  [v8 setButtonAction:sel__didSelectSpecifier_];
  v12[0] = v3;
  v12[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (id)_mySportsSpecifiers
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F92E70];
  objc_super v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"SETTINGS_SPORTS"];
  char v6 = [v3 groupSpecifierWithID:@"SportsGroupSpecifier" name:v5];

  id v7 = (void *)MEMORY[0x1E4F92E70];
  id v8 = +[VUILocalizationManager sharedInstance];
  char v9 = [v8 localizedStringForKey:@"SETTINGS_SPORTS_SYNC_MY_SPORTS"];
  v10 = [v7 preferenceSpecifierNamed:v9 target:self set:sel__setSyncMySportsEnabled_ get:sel__syncMySportsEnabled detail:0 cell:6 edit:0];

  id v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
  [v10 setProperty:v11 forKey:*MEMORY[0x1E4F93218]];

  [v10 setProperty:@"syncMySports" forKey:*MEMORY[0x1E4F93188]];
  syncMySportsSpecifier = self->_syncMySportsSpecifier;
  self->_syncMySportsSpecifier = (PSSpecifier *)v10;
  id v13 = v10;

  [(VUIAccountSettingsViewController *)self _addPrivacyFooterToGroup:v6];
  v16[0] = v6;
  v16[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  return v14;
}

- (void)_addPrivacyFooterToGroup:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:*MEMORY[0x1E4F93140]];

  id v7 = +[VUILocalizationManager sharedInstance];
  id v15 = [v7 localizedStringForKey:@"SPORTS_PRIVACY_FOOTER_FORMAT"];

  id v8 = [MEMORY[0x1E4F83AD0] linkWithBundleIdentifier:@"com.apple.onboarding.mysports"];
  char v9 = [v8 flow];
  v10 = [v9 localizedButtonTitle];

  id v11 = objc_msgSend(NSString, "stringWithFormat:", v15, v10);
  [v4 setProperty:v11 forKey:*MEMORY[0x1E4F93160]];
  v17.id location = [v11 rangeOfString:v10];
  double v12 = NSStringFromRange(v17);
  [v4 setProperty:v12 forKey:*MEMORY[0x1E4F93150]];

  id v13 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [v4 setProperty:v13 forKey:*MEMORY[0x1E4F93158]];

  uint64_t v14 = NSStringFromSelector(sel__showPrivacySheet_);
  [v4 setProperty:v14 forKey:*MEMORY[0x1E4F93148]];
}

- (void)_showPrivacySheet:(id)a3
{
  id v4 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.mysports"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (id)_signOutSpecifiers
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"SignOutGroupSpecifier"];
  id v4 = (void *)MEMORY[0x1E4F92E70];
  id v5 = +[VUILocalizationManager sharedInstance];
  char v6 = [v5 localizedStringForKey:@"SETTINGS_SIGN_OUT"];
  id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
  [v7 setProperty:v8 forKey:*MEMORY[0x1E4F93218]];

  [v7 setButtonAction:sel__didSelectSpecifier_];
  [v7 setProperty:@"signOut" forKey:*MEMORY[0x1E4F93188]];
  v11[0] = v3;
  v11[1] = v7;
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (void)nextEpisodeSettingDidChange
{
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __63__VUIAccountSettingsViewController_nextEpisodeSettingDidChange__block_invoke;
  char v6 = &unk_1E6DF4A30;
  objc_copyWeak(&v7, &location);
  dispatch_time_t v2 = &v3;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v3, v4)) {
    v5((uint64_t)v2);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__VUIAccountSettingsViewController_nextEpisodeSettingDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v2 = WeakRetained;
    [WeakRetained reloadSpecifier:WeakRetained[178]];
    id WeakRetained = v2;
  }
}

- (void)recommendedItemsSettingDidChange
{
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __68__VUIAccountSettingsViewController_recommendedItemsSettingDidChange__block_invoke;
  char v6 = &unk_1E6DF4A30;
  objc_copyWeak(&v7, &location);
  dispatch_time_t v2 = &v3;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v3, v4)) {
    v5((uint64_t)v2);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __68__VUIAccountSettingsViewController_recommendedItemsSettingDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v2 = WeakRetained;
    [WeakRetained reloadSpecifier:WeakRetained[179]];
    id WeakRetained = v2;
  }
}

- (void)_didSelectSpecifier:(id)a3
{
}

- (void)_didSelectSpecifier:(id)a3 isManualSelection:(BOOL)a4
{
  BOOL v4 = a4;
  v49[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:@"accountName"];

  if (v8)
  {
    [(VUIAccountSettingsViewController *)self _handleAccountSettingsEventWithAmsWebView:kVUIBagKeyModifyAccountURL storeServicesBagKey:kVUIBagKeyModifyAccountURL storeServicesUrl:0];
    v48[0] = @"targetId";
    v48[1] = @"targetType";
    v49[0] = @"account";
    v49[1] = @"menuItem";
    v48[2] = @"actionType";
    v49[2] = @"account";
    char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
    [(VUIAccountSettingsViewController *)self _recordDialogClick:v9];
  }
  else
  {
    v10 = [v6 identifier];
    int v11 = [v10 isEqualToString:@"connectedApps"];

    if (v11)
    {
      double v12 = objc_alloc_init(VUIAccountSettingsConnectedAppsViewController);
      [(VUIAccountSettingsConnectedAppsViewController *)v12 setShowsDoneButton:v4 ^ 1];
      id v13 = [(VUIAccountSettingsViewController *)self navigationController];
      [v13 pushViewController:v12 animated:v4];

      v46[0] = @"targetId";
      v46[1] = @"targetType";
      v47[0] = @"connectedApps";
      v47[1] = @"menuItem";
      v46[2] = @"actionType";
      v47[2] = @"connectedApps";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
      [(VUIAccountSettingsViewController *)self _recordDialogClick:v14];
    }
    else
    {
      id v15 = [v6 identifier];
      int v16 = [v15 isEqualToString:@"manageSubscriptions"];

      if (v16)
      {
        [(VUIAccountSettingsViewController *)self _handleAccountSettingsEventWithAmsWebView:kVUIBagKeyManageSubscriptionsURL];
        v44[0] = @"targetId";
        v44[1] = @"targetType";
        v45[0] = @"manageSubscriptions";
        v45[1] = @"menuItem";
        v44[2] = @"actionType";
        v45[2] = @"manageSubscriptions";
        NSRange v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];
        [(VUIAccountSettingsViewController *)self _recordDialogClick:v17];
      }
      else
      {
        id v18 = [v6 identifier];
        int v19 = [v18 isEqualToString:@"redeemGiftCardOrCode"];

        if (v19)
        {
          id v20 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F3C340]];
          [(VUIAccountSettingsViewController *)self _handleAccountSettingsEventWithAmsWebView:kVUIBagKeyRedeemCodeURL storeServicesBagKey:0 storeServicesUrl:v20];
          v42[0] = @"targetId";
          v42[1] = @"targetType";
          v43[0] = @"giftCard";
          v43[1] = @"menuItem";
          v42[2] = @"actionType";
          v43[2] = @"giftCard";
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
          [(VUIAccountSettingsViewController *)self _recordDialogClick:v21];
        }
        else
        {
          v22 = [v6 identifier];
          int v23 = [v22 isEqualToString:@"addMoneyToAccount"];

          if (v23)
          {
            objc_initWeak(&location, self);
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke;
            v35[3] = &unk_1E6DF4A30;
            objc_copyWeak(&v36, &location);
            [(VUIAccountSettingsViewController *)self dismissViewControllerAnimated:1 completion:v35];
            v40[0] = @"targetId";
            v40[1] = @"targetType";
            v41[0] = @"addFunds";
            v41[1] = @"menuItem";
            v40[2] = @"actionType";
            v41[2] = @"addFunds";
            uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
            [(VUIAccountSettingsViewController *)self _recordDialogClick:v24];

            objc_destroyWeak(&v36);
            objc_destroyWeak(&location);
          }
          else
          {
            id v25 = [v6 identifier];
            int v26 = [v25 isEqualToString:@"signOut"];

            if (v26)
            {
              [(VUIAccountSettingsViewController *)self setAuthenticationInProgress:1];
              objc_initWeak(&location, self);
              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_2;
              v33[3] = &unk_1E6DF6A38;
              objc_copyWeak(&v34, &location);
              +[VUIAuthenticationManager signOutUserWithCompletionHandler:v33];
              v38[0] = @"targetId";
              v38[1] = @"targetType";
              v39[0] = @"signOut";
              v39[1] = @"menuItem";
              v38[2] = @"actionType";
              v39[2] = @"signOut";
              v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
              [(VUIAccountSettingsViewController *)self _recordDialogClick:v27];

              objc_destroyWeak(&v34);
              objc_destroyWeak(&location);
            }
            else
            {
              v28 = [v6 identifier];
              v29 = [(VUIAccountSettingsViewController *)self _notificationGroupSpecifierIdentifier];
              int v30 = [v28 isEqualToString:v29];

              if (v30)
              {
                v31 = [MEMORY[0x1E4F44680] currentNotificationCenter];
                v32[0] = MEMORY[0x1E4F143A8];
                v32[1] = 3221225472;
                v32[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_4;
                v32[3] = &unk_1E6DF6A60;
                void v32[4] = self;
                [v31 getNotificationSettingsWithCompletionHandler:v32];
              }
            }
          }
        }
      }
    }
  }
}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v2 = WeakRetained;
    +[VUIApplicationRouter handleAccountSettingsEventWithUrl:WeakRetained[186] amsBagKey:0 useAMSWebView:1];
    id WeakRetained = v2;
  }
}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_3;
    block[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v3);
  }
}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAuthenticationInProgress:0];
  [WeakRetained _dismissViewController];
}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_5;
  block[3] = &unk_1E6DF5490;
  objc_copyWeak(&v7, &location);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __74__VUIAccountSettingsViewController__didSelectSpecifier_isManualSelection___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) authorizationStatus])
  {
    if ([*(id *)(a1 + 32) authorizationStatus] == 1) {
      [WeakRetained _handleNotificationsOff];
    }
  }
  else
  {
    [WeakRetained _promptForNotificationsAuth];
  }
}

- (void)_clearPlayHistory:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v4 = +[VUIAuthenticationManager userAccountName];
  int v5 = _os_feature_enabled_impl();
  id v6 = +[VUILocalizationManager sharedInstance];
  id v7 = v6;
  if (v5) {
    int v8 = @"SETTINGS_CLEAR_HISTORY_PROMPT_FORMAT_CONTINUE_WATCHING";
  }
  else {
    int v8 = @"SETTINGS_CLEAR_HISTORY_PROMPT_FORMAT";
  }
  char v9 = [v6 localizedStringForKey:v8];

  v10 = [NSString stringWithValidatedFormat:v9, @"%@", 0, v4 validFormatSpecifiers error];
  int v11 = 0;
  if ([(VUIAccountSettingsViewController *)self _alertStyle] == 1)
  {
    double v12 = +[VUILocalizationManager sharedInstance];
    int v11 = [v12 localizedStringForKey:@"SETTINGS_CLEAR_HISTORY_TITLE"];
  }
  id v13 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v11, v10, -[VUIAccountSettingsViewController _alertStyle](self, "_alertStyle"));
  uint64_t v14 = (void *)MEMORY[0x1E4FB1410];
  id v15 = +[VUILocalizationManager sharedInstance];
  int v16 = [v15 localizedStringForKey:@"SETTINGS_CLEAR_HISTORY"];
  NSRange v17 = [v14 actionWithTitle:v16 style:2 handler:&__block_literal_global_51];

  id v18 = (void *)MEMORY[0x1E4FB1410];
  int v19 = +[VUILocalizationManager sharedInstance];
  id v20 = [v19 localizedStringForKey:@"CANCEL"];
  v21 = [v18 actionWithTitle:v20 style:1 handler:&__block_literal_global_274];

  [v13 addAction:v17];
  [v13 addAction:v21];
  [(VUIAccountSettingsViewController *)self presentViewController:v13 animated:1 completion:0];
  v23[0] = @"targetId";
  v23[1] = @"targetType";
  v24[0] = @"clearPlayHistory";
  v24[1] = @"menuItem";
  v23[2] = @"actionType";
  v24[2] = @"clearPlayHistory";
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  [(VUIAccountSettingsViewController *)self _recordDialogClick:v22];
}

uint64_t __54__VUIAccountSettingsViewController__clearPlayHistory___block_invoke()
{
  return [MEMORY[0x1E4FB5150] deleteAllHistoryWithCompletion:&__block_literal_global_256];
}

void __54__VUIAccountSettingsViewController__clearPlayHistory___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 description];
  }
  else
  {
    id v6 = &stru_1F3E921E0;
  }
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"NO";
    if (a2) {
      int v8 = @"YES";
    }
    int v9 = 138412546;
    v10 = v8;
    __int16 v11 = 2112;
    double v12 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - Delete-all! %@ %@", (uint8_t *)&v9, 0x16u);
  }

  if (a2) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_268);
  }
}

void __54__VUIAccountSettingsViewController__clearPlayHistory___block_invoke_266()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"VUIClearPlayHistoryNotification" object:0];
}

- (void)_syncMySportsSettingDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__pendingSyncMySportsEnabled);

  if (!WeakRetained)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__VUIAccountSettingsViewController__syncMySportsSettingDidChange___block_invoke;
    v5[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __66__VUIAccountSettingsViewController__syncMySportsSettingDidChange___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 184) invalidate];
    id v4 = (void *)MEMORY[0x1E4F1CB00];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__VUIAccountSettingsViewController__syncMySportsSettingDidChange___block_invoke_2;
    v7[3] = &unk_1E6DF66E0;
    objc_copyWeak(&v8, v1);
    uint64_t v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v7 block:0.5];
    id v6 = (void *)v3[184];
    v3[184] = v5;

    objc_destroyWeak(&v8);
  }
}

void __66__VUIAccountSettingsViewController__syncMySportsSettingDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__VUIAccountSettingsViewController__syncMySportsSettingDidChange___block_invoke_3;
    v6[3] = &unk_1E6DF59E8;
    objc_copyWeak(&v7, v4);
    [WeakRetained _fetchMySportsSyncSettingWithCompletion:v6];
    objc_destroyWeak(&v7);
  }
}

void __66__VUIAccountSettingsViewController__syncMySportsSettingDidChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    id v4 = (void *)WeakRetained[181];
    WeakRetained[181] = v3;

    [WeakRetained reloadSpecifier:WeakRetained[177]];
  }
}

- (NSNumber)_syncMySportsEnabled
{
  syncMySportsEnabled = self->__syncMySportsEnabled;
  if (!syncMySportsEnabled)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke;
    v21 = &unk_1E6DF6AC8;
    int v23 = &v24;
    uint64_t v5 = v4;
    v22 = v5;
    [(VUIAccountSettingsViewController *)self _fetchMySportsSyncSettingWithCompletion:&v18];
    dispatch_time_t v6 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      id v7 = WLKSystemLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(VUIAccountSettingsViewController *)v7 _syncMySportsEnabled];
      }
    }
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", *((unsigned __int8 *)v25 + 24), v18, v19, v20, v21);
    id v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    int v16 = self->__syncMySportsEnabled;
    self->__syncMySportsEnabled = v15;

    _Block_object_dispose(&v24, 8);
    syncMySportsEnabled = self->__syncMySportsEnabled;
  }
  return syncMySportsEnabled;
}

intptr_t __56__VUIAccountSettingsViewController__syncMySportsEnabled__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setSyncMySportsEnabled:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->__syncMySportsEnabled, a3);
  objc_storeWeak((id *)&self->__pendingSyncMySportsEnabled, v5);
  [(NSTimer *)self->_syncMySportsDebouncer invalidate];
  [(NSTimer *)self->_syncMySportsNotifyDebouncer invalidate];
  objc_initWeak(&location, self);
  dispatch_time_t v6 = (void *)MEMORY[0x1E4F1CB00];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke;
  v9[3] = &unk_1E6DF66E0;
  objc_copyWeak(&v10, &location);
  id v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:v9 block:1.0];
  syncMySportsDebouncer = self->_syncMySportsDebouncer;
  self->_syncMySportsDebouncer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v6 = [_TtC8VideosUI26VUIUserConsentModification alloc];
    id v7 = [WeakRetained _syncMySportsEnabled];
    if ([v7 BOOLValue]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    uint64_t v9 = [(VUIUserConsentModification *)v6 initWithStatus:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2;
    v10[3] = &unk_1E6DF6AF0;
    objc_copyWeak(&v11, v4);
    +[VUISportsFavoriteService modifyUserConsentWithModification:v9 completionHandler:v10];
    objc_destroyWeak(&v11);
  }
}

void __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeWeak(WeakRetained + 182, 0);
    id v7 = WLKSystemLogObject();
    uint64_t v8 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2_cold_1(v4);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 0;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Settings: Successfully set sports syncing opt in status. Reloading specifier.", (uint8_t *)v9, 2u);
      }

      [v6 _syncMySportsSettingDidChange:0];
    }
  }
}

- (void)_resolveLandingBehavior
{
  if ([(VUIAccountSettingsViewController *)self initialSubsection])
  {
    int64_t v3 = [(VUIAccountSettingsViewController *)self initialSubsection];
    [(VUIAccountSettingsViewController *)self _navigateToSubsection:v3 clearSubsection:1];
  }
  else
  {
    id v4 = dispatch_group_create();
    [(VUIAccountSettingsViewController *)self _checkConnectedAppsWithDispatchGroup:v4];
    [(VUIAccountSettingsViewController *)self _checkExternalLinksWithDispatchGroup:v4];
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__VUIAccountSettingsViewController__resolveLandingBehavior__block_invoke;
    v5[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v6, &location);
    dispatch_group_notify(v4, MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __59__VUIAccountSettingsViewController__resolveLandingBehavior__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadSpecifiers];
    id WeakRetained = v2;
  }
}

- (void)_checkConnectedAppsWithDispatchGroup:(id)a3
{
  id v4 = a3;
  dispatch_group_enter(v4);
  [(VUIAccountSettingsViewController *)self setInstalledWatchListAppCount:0];
  [(VUIAccountSettingsViewController *)self setConnectedWatchListAppCount:0];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__VUIAccountSettingsViewController__checkConnectedAppsWithDispatchGroup___block_invoke;
  v6[3] = &unk_1E6DF6B18;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  +[VUIAccountSettingsConnectedAppsViewController fetchConnectedAppsWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __73__VUIAccountSettingsViewController__checkConnectedAppsWithDispatchGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = VUIDefaultLogObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 || !WeakRetained)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v6;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - an error occured fetching installed apps: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = [v5 count];
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - installed watchlist app count is: %lu", buf, 0xCu);
    }

    WeakRetained[175] = [v5 count];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v5;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "accessStatus", (void)v14) == 1) {
            ++WeakRetained[176];
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_checkExternalLinksWithDispatchGroup:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FA9C70], "app", a3);
  id v6 = [v4 urlForKey:kVUIBagKeyAddFundsURL];

  id v5 = v6;
  if (v6)
  {
    [(VUIAccountSettingsViewController *)self setAddFundsUrl:v6];
    id v5 = v6;
  }
}

- (id)_getConnectedAppsCountString
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_connectedWatchListAppCount);
}

- (id)_dialogMetricsData
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"dialogId";
  v4[1] = @"dialogType";
  v5[0] = @"accountSettings";
  v5[1] = @"accountSettings";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)_recordDialogClick:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [(VUIAccountSettingsViewController *)self _dialogMetricsData];
  id v8 = [v4 dictionaryWithDictionary:v6];

  [v8 addEntriesFromDictionary:v5];
  id v7 = +[VUIMetricsController sharedInstance];
  [v7 recordClick:v8];
}

- (id)_notificationGroupSpecifierIdentifier
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (!v3)
  {
    id v6 = +[VUILocalizationManager sharedInstance];
    id v7 = v6;
    id v8 = @"SETTINGS_ALLOW_NOTIFICATIONS_ON_THIS_IPHONE";
    goto LABEL_7;
  }
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    id v6 = +[VUILocalizationManager sharedInstance];
    id v7 = v6;
    id v8 = @"SETTINGS_ALLOW_NOTIFICATIONS_ON_THIS_IPAD";
LABEL_7:
    uint64_t v11 = [v6 localizedStringForKey:v8];

    goto LABEL_8;
  }
  BOOL v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 == 6)
  {
    id v6 = +[VUILocalizationManager sharedInstance];
    id v7 = v6;
    id v8 = @"SETTINGS_ALLOW_NOTIFICATIONS_ON_THIS_VISION_PRO";
    goto LABEL_7;
  }
  uint64_t v11 = 0;
LABEL_8:
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VUIAccountSettingsViewController;
  uint64_t v5 = [(VUIAccountSettingsViewController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 textField];
    [v6 setDelegate:self];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v7 = v5;
  }
  id v8 = [(VUIAccountSettingsViewController *)self _createAxIdFromTableCell:v5];
  [v5 setAccessibilityIdentifier:v8];

LABEL_6:
  return v5;
}

- (int64_t)_alertStyle
{
  uint64_t v3 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:2];
  id v4 = [(VUIAccountSettingsViewController *)self traitCollection];
  unsigned int v5 = [v4 containsTraitsInCollection:v3];

  return v5;
}

- (void)_handleAccountSettingsEventWithAmsWebView:(id)a3
{
}

- (void)_handleAccountSettingsEventWithAmsWebView:(id)a3 storeServicesBagKey:(id)a4 storeServicesUrl:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = (void *)MEMORY[0x1E4FA9C70];
  id v11 = a3;
  uint64_t v12 = [v10 app];
  uint64_t v13 = [v12 urlForKey:v11];

  if (v13)
  {
    [(VUIAccountSettingsViewController *)self _parseUrl:v13];
    goto LABEL_12;
  }
  if (v8)
  {
    long long v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - Falling back to legacy StoreServices key", buf, 2u);
    }

    long long v15 = self;
    id v16 = 0;
    id v17 = v8;
LABEL_11:
    [(VUIAccountSettingsViewController *)v15 _handleAccountSettingsEventWithUrl:v16 amsBagKey:v17 useAMSWebView:0];
    goto LABEL_12;
  }
  uint64_t v18 = VUIDefaultLogObject();
  uint64_t v19 = v18;
  if (v9)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v27 = 0;
      _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - Falling back to legacy StoreServices URL", v27, 2u);
    }

    long long v15 = self;
    id v16 = v9;
    id v17 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[VUIAccountSettingsViewController _handleAccountSettingsEventWithAmsWebView:storeServicesBagKey:storeServicesUrl:](v19, v20, v21, v22, v23, v24, v25, v26);
  }

LABEL_12:
}

- (void)_parseUrl:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4DE50]);
  id v6 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
  id v7 = (void *)[v5 initWithBag:v6];

  id v8 = [v7 typeForURL:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__VUIAccountSettingsViewController__parseUrl___block_invoke;
  v10[3] = &unk_1E6DF6B40;
  id v9 = v4;
  id v11 = v9;
  objc_copyWeak(&v12, &location);
  [v8 addFinishBlock:v10];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __46__VUIAccountSettingsViewController__parseUrl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__VUIAccountSettingsViewController__parseUrl___block_invoke_cold_1(a1);
    }
  }
  int v8 = [v5 intValue];
  id v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8 == 0;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - AMSURLParser for Account Settings URL. useAMSWebView=%d", (uint8_t *)v11, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAccountSettingsEventWithUrl:*(void *)(a1 + 32) amsBagKey:0 useAMSWebView:v8 == 0];
}

- (void)_handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__VUIAccountSettingsViewController__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView___block_invoke;
  block[3] = &unk_1E6DF4A58;
  objc_copyWeak(&v15, &location);
  BOOL v16 = a5;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __95__VUIAccountSettingsViewController__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained navigationController];
  if (v3 && *(unsigned char *)(a1 + 56))
  {
    +[VUIApplicationRouter pushAccountSettingsEventWithUrl:*(void *)(a1 + 32) amsBagKey:*(void *)(a1 + 40) useAMSWebView:1 fromNavigationController:v3];
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __95__VUIAccountSettingsViewController__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView___block_invoke_2;
    v4[3] = &unk_1E6DF6B68;
    id v5 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    char v7 = *(unsigned char *)(a1 + 56);
    [WeakRetained dismissViewControllerAnimated:1 completion:v4];
  }
}

BOOL __95__VUIAccountSettingsViewController__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView___block_invoke_2(uint64_t a1)
{
  return +[VUIApplicationRouter handleAccountSettingsEventWithUrl:*(void *)(a1 + 32) amsBagKey:*(void *)(a1 + 40) useAMSWebView:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_dismissViewController
{
}

- (id)_createAxIdFromTableCell:(id)a3
{
  uint64_t v3 = [a3 specifier];
  id v4 = [v3 identifier];

  id v5 = [@"UIA.TV.AccountSettings." stringByAppendingString:v4];

  return v5;
}

- (void)_handleNotificationsOff
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"SETTINGS_NOTIFICATIONS_ARE_OFF_TITLE"];
  id v6 = +[VUILocalizationManager sharedInstance];
  char v7 = [v6 localizedStringForKey:@"SETTINGS_NOTIFICATIONS_ARE_OFF_MESSAGE"];
  id v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = +[VUILocalizationManager sharedInstance];
  id v11 = [v10 localizedStringForKey:@"SETTINGS_GO_TO_SETTINGS"];
  uint64_t v12 = [v9 actionWithTitle:v11 style:0 handler:&__block_literal_global_312];

  id v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = +[VUILocalizationManager sharedInstance];
  id v15 = [v14 localizedStringForKey:@"SETTINGS_ACCESS_DENY"];
  BOOL v16 = [v13 actionWithTitle:v15 style:1 handler:0];

  [v8 addAction:v16];
  [v8 addAction:v12];
  [(VUIAccountSettingsViewController *)self presentViewController:v8 animated:1 completion:0];
  v18[0] = @"targetId";
  v18[1] = @"targetType";
  v19[0] = @"gotoSettings";
  v19[1] = @"menuItem";
  v18[2] = @"actionType";
  v19[2] = @"gotoSettings";
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  [(VUIAccountSettingsViewController *)self _recordDialogClick:v17];
}

void __59__VUIAccountSettingsViewController__handleNotificationsOff__block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=NOTIFICATIONS_ID&path=com.apple.tv"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)_promptForNotificationsAuth
{
  uint64_t v3 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __63__VUIAccountSettingsViewController__promptForNotificationsAuth__block_invoke;
  v4[3] = &unk_1E6DF6A38;
  objc_copyWeak(&v5, &location);
  [v3 requestAuthorizationWithOptions:7 completionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__VUIAccountSettingsViewController__promptForNotificationsAuth__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__VUIAccountSettingsViewController__promptForNotificationsAuth__block_invoke_2;
  v3[3] = &unk_1E6DF5330;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __63__VUIAccountSettingsViewController__promptForNotificationsAuth__block_invoke_2(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [WeakRetained setNotifAuthStatus:v4];
  [v3 reloadSpecifiers];
  v6[0] = @"targetId";
  v6[1] = @"targetType";
  v7[0] = @"promptNotificationAuthorization";
  v7[1] = @"menuItem";
  v6[2] = @"actionType";
  v7[2] = @"promptNotificationAuthorization";
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  [v3 _recordDialogClick:v5];
}

- (void)_navigateToSubsection:(int64_t)a3 clearSubsection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    int64_t v13 = [(VUIAccountSettingsViewController *)self initialSubsection];
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIAccountSettings - Navigating to initial subsection: %ld", (uint8_t *)&v12, 0xCu);
  }

  if (a3 == 1)
  {
    id v8 = @"connectedApps";
  }
  else
  {
    if (a3 != 2)
    {
      id v11 = VUIDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[VUIAccountSettingsViewController _navigateToSubsection:clearSubsection:]((uint64_t)self, v11);
      }

      goto LABEL_12;
    }
    id v8 = @"manageSubscriptions";
  }
  uint64_t v9 = [(VUIAccountSettingsViewController *)self specifierForID:v8];
  if (v9)
  {
    id v10 = v9;
    [(VUIAccountSettingsViewController *)self _didSelectSpecifier:v9 isManualSelection:0];
    goto LABEL_14;
  }
LABEL_12:
  id v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[VUIAccountSettingsViewController _navigateToSubsection:clearSubsection:]((uint64_t)self, v10);
  }
LABEL_14:

  if (v4) {
    [(VUIAccountSettingsViewController *)self setInitialSubsection:0];
  }
}

- (void)setAuthenticationInProgress:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self->_authenticationInProgress = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = [(VUIAccountSettingsViewController *)self specifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x1E4F93130];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [MEMORY[0x1E4F28ED0] numberWithInt:!self->_authenticationInProgress];
        [v10 setProperty:v11 forKey:v8];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  int v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v12 startAnimating];
  int64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v12];
  uint64_t v14 = [(VUIAccountSettingsViewController *)self navigationItem];
  id v15 = v14;
  if (self->_authenticationInProgress) {
    BOOL v16 = v13;
  }
  else {
    BOOL v16 = 0;
  }
  [v14 setLeftBarButtonItem:v16];
}

- (int64_t)initialSubsection
{
  return self->_initialSubsection;
}

- (void)setInitialSubsection:(int64_t)a3
{
  self->_initialSubsection = a3;
}

- (BOOL)authenticationInProgress
{
  return self->_authenticationInProgress;
}

- (int64_t)installedWatchListAppCount
{
  return self->_installedWatchListAppCount;
}

- (void)setInstalledWatchListAppCount:(int64_t)a3
{
  self->_installedWatchListAppCount = a3;
}

- (int64_t)connectedWatchListAppCount
{
  return self->_connectedWatchListAppCount;
}

- (void)setConnectedWatchListAppCount:(int64_t)a3
{
  self->_connectedWatchListAppCount = a3;
}

- (PSSpecifier)syncMySportsSpecifier
{
  return self->_syncMySportsSpecifier;
}

- (void)setSyncMySportsSpecifier:(id)a3
{
}

- (PSSpecifier)autoPlayNextEpisodeSpecifier
{
  return self->_autoPlayNextEpisodeSpecifier;
}

- (void)setAutoPlayNextEpisodeSpecifier:(id)a3
{
}

- (PSSpecifier)autoPlayRecommendedItemsSpecifier
{
  return self->_autoPlayRecommendedItemsSpecifier;
}

- (void)setAutoPlayRecommendedItemsSpecifier:(id)a3
{
}

- (int64_t)notifAuthStatus
{
  return self->_notifAuthStatus;
}

- (void)setNotifAuthStatus:(int64_t)a3
{
  self->_notifAuthStatus = a3;
}

- (void)set_syncMySportsEnabled:(id)a3
{
}

- (NSNumber)_pendingSyncMySportsEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__pendingSyncMySportsEnabled);
  return (NSNumber *)WeakRetained;
}

- (void)set_pendingSyncMySportsEnabled:(id)a3
{
}

- (NSTimer)syncMySportsDebouncer
{
  return self->_syncMySportsDebouncer;
}

- (void)setSyncMySportsDebouncer:(id)a3
{
}

- (NSTimer)syncMySportsNotifyDebouncer
{
  return self->_syncMySportsNotifyDebouncer;
}

- (void)setSyncMySportsNotifyDebouncer:(id)a3
{
}

- (WLKPostPlayAutoPlayToggleInterface)autoPlayToggleInterface
{
  return self->_autoPlayToggleInterface;
}

- (void)setAutoPlayToggleInterface:(id)a3
{
}

- (NSURL)addFundsUrl
{
  return self->_addFundsUrl;
}

- (void)setAddFundsUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addFundsUrl, 0);
  objc_storeStrong((id *)&self->_autoPlayToggleInterface, 0);
  objc_storeStrong((id *)&self->_syncMySportsNotifyDebouncer, 0);
  objc_storeStrong((id *)&self->_syncMySportsDebouncer, 0);
  objc_destroyWeak((id *)&self->__pendingSyncMySportsEnabled);
  objc_storeStrong((id *)&self->__syncMySportsEnabled, 0);
  objc_storeStrong((id *)&self->_autoPlayRecommendedItemsSpecifier, 0);
  objc_storeStrong((id *)&self->_autoPlayNextEpisodeSpecifier, 0);
  objc_storeStrong((id *)&self->_syncMySportsSpecifier, 0);
}

void __76__VUIAccountSettingsViewController__fetchMySportsSyncSettingWithCompletion___block_invoke_5_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_14();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

- (void)specifiers
{
}

- (void)_syncMySportsEnabled
{
}

void __60__VUIAccountSettingsViewController__setSyncMySportsEnabled___block_invoke_2_cold_1(void *a1)
{
  uint64_t v6 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_14();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
}

- (void)_handleAccountSettingsEventWithAmsWebView:(uint64_t)a3 storeServicesBagKey:(uint64_t)a4 storeServicesUrl:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__VUIAccountSettingsViewController__parseUrl___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v6 = [*(id *)(a1 + 32) absoluteString];
  OUTLINED_FUNCTION_0_14();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x16u);
}

- (void)_navigateToSubsection:(uint64_t)a1 clearSubsection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 1392);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "No specifier associated with subsection: %ld. Ignoring.", (uint8_t *)&v3, 0xCu);
}

@end