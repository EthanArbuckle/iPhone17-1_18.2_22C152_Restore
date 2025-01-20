@interface ICSDataclassSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (ACAccount)account;
- (BOOL)_showSpecifierForDataclass:(id)a3;
- (BOOL)isRegularWatchPairing;
- (BOOL)shouldShowSpecifierForServiceType:(id)a3;
- (ICSDataclassSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4 homeViewModel:(id)a5 manageStorageAppsListViewModel:(id)a6;
- (ICSUbiquitySpecifierProvider)ubiquitySpecifierProvider;
- (NSArray)specifiers;
- (_TtC14iCloudSettings19iCloudHomeViewModel)homeViewModel;
- (_TtC14iCloudSettings30ManageStorageAppsListViewModel)manageStorageAppsListViewModel;
- (id)_buildAppGroupHeaderSpecifiers;
- (id)_buildAppSpecifiers;
- (id)_buildEmailSpecifier;
- (id)_buildHealthDataSpecifier;
- (id)_buildKeychainSpecifier;
- (id)_buildPhotosSpecifier;
- (id)_buildUbiquitySpecifier;
- (id)_dataclassState:(id)a3;
- (id)_loadCalendarSpecifierProvider;
- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4;
- (id)_specifierForDataclass:(id)a3;
- (id)_specifierForDataclass:(id)a3 fromProvisionedSpecifiers:(id)a4;
- (id)_specifierForDataclass:(id)a3 withCustomDetailClass:(Class)a4;
- (id)_specifierForMessagesDataclass;
- (id)_specifiersForAppListVC;
- (id)_specifiersForProvisionedDataclasses;
- (id)getICloudMailSpecifier;
- (id)loadBundle:(id)a3 atPath:(id)a4;
- (id)specifierForDataclass:(id)a3;
- (id)specifierForServiceType:(id)a3;
- (id)valueForServiceSpecifier:(id)a3;
- (void)_decorateDataclassSpecifier:(id)a3 forDataclass:(id)a4;
- (void)_decorateLiverpoolSpecifier:(id)a3 forBundleId:(id)a4;
- (void)_decorateServiceSpecifier:(id)a3 forService:(id)a4;
- (void)_initiateServiceAuthHandler;
- (void)_initiateSpecifiers;
- (void)_loadCalendarSpecifierProvider;
- (void)_performUpdateIfNeededOnSpecifier:(id)a3 forDataclass:(id)a4;
- (void)cleanupDataclassSpecifiers;
- (void)dealloc;
- (void)getICloudMailSpecifier;
- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4;
- (void)reloadSpecifiers;
- (void)resetAccount;
- (void)setDelegate:(id)a3;
- (void)setHomeViewModel:(id)a3;
- (void)setManageStorageAppsListViewModel:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setValue:(id)a3 forServiceSpecifier:(id)a4;
@end

@implementation ICSDataclassSpecifierProvider

- (ICSDataclassSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4 homeViewModel:(id)a5 manageStorageAppsListViewModel:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)ICSDataclassSpecifierProvider;
  v15 = [(ICSDataclassSpecifierProvider *)&v31 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountManager, a3);
    objc_storeWeak((id *)&v16->_listController, v12);
    objc_storeStrong((id *)&v16->_homeViewModel, a5);
    objc_storeStrong((id *)&v16->_manageStorageAppsListViewModel, a6);
    uint64_t v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFACF8], *MEMORY[0x263EFAD48], *MEMORY[0x263EFACB8], *MEMORY[0x263EFACB0], *MEMORY[0x263EFAC20], 0);
    mainViewDataclasses = v16->_mainViewDataclasses;
    v16->_mainViewDataclasses = (NSSet *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.appleaccountsettings.accountwork", v19);
    accountWorkQueue = v16->_accountWorkQueue;
    v16->_accountWorkQueue = (OS_dispatch_queue *)v20;

    objc_initWeak(&location, v16);
    v22 = [MEMORY[0x263F08A00] defaultCenter];
    v23 = +[ManageStorageAppsListViewModel ViewModelDidUpdateNotificationName];
    manageStorageAppsListViewModel = v16->_manageStorageAppsListViewModel;
    v25 = [MEMORY[0x263F08A48] mainQueue];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __111__ICSDataclassSpecifierProvider_initWithAccountManager_presenter_homeViewModel_manageStorageAppsListViewModel___block_invoke;
    v28[3] = &unk_2655B5868;
    objc_copyWeak(&v29, &location);
    id v26 = (id)[v22 addObserverForName:v23 object:manageStorageAppsListViewModel queue:v25 usingBlock:v28];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __111__ICSDataclassSpecifierProvider_initWithAccountManager_presenter_homeViewModel_manageStorageAppsListViewModel___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = +[ManageStorageAppsListViewModel ViewModelDidUpdateNotificationName];
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "%@ notification received. Reloading specifiers.", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSDataclassSpecifierProvider;
  [(ICSDataclassSpecifierProvider *)&v4 dealloc];
}

- (ACAccount)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return (ACAccount *)v3;
}

- (void)resetAccount
{
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(ICSDataclassSpecifierProvider *)self _initiateServiceAuthHandler];

  [(ICSDataclassSpecifierProvider *)self _initiateSpecifiers];
}

- (void)_initiateServiceAuthHandler
{
  if (!self->_serviceAuthHandler)
  {
    v3 = [ICSServiceAuthHandler alloc];
    accountManager = self->_accountManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    int v5 = [(ICSServiceAuthHandler *)v3 initWithAccountManager:accountManager presenter:WeakRetained];
    serviceAuthHandler = self->_serviceAuthHandler;
    self->_serviceAuthHandler = v5;
  }
}

- (void)_initiateSpecifiers
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_262993000, log, OS_LOG_TYPE_DEBUG, "Calendar settings main feature not enabled", v1, 2u);
}

- (void)cleanupDataclassSpecifiers
{
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  appGroupSpecifiers = self->_appGroupSpecifiers;
  self->_appGroupSpecifiers = 0;

  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = 0;

  [(ICSKeychainSpecifierProvider *)self->_keychainSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_photoStreamSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_mailSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_hmeSpecifierProvider setSpecifiers:0];
  [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_healthDataSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_otherSpecifierProvider setSpecifiers:0];
  if (_os_feature_enabled_impl())
  {
    calendarSpecifierProvider = self->_calendarSpecifierProvider;
    [(AAUISpecifierProvider *)calendarSpecifierProvider setSpecifiers:0];
  }
}

- (void)reloadSpecifiers
{
  id v4 = (id)[(NSArray *)self->_specifiers copy];
  [(ICSDataclassSpecifierProvider *)self cleanupDataclassSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v4 animated:0];
}

- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  if ([v5 cellType] == 6)
  {
    [v5 removePropertyForKey:*MEMORY[0x263F60308]];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v9 = WeakRetained;
    id v7 = v5;
    uint64_t v8 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v9 = WeakRetained;
    id v7 = v5;
    uint64_t v8 = 1;
  }
  [WeakRetained reloadSpecifier:v7 animated:v8];
}

- (BOOL)_showSpecifierForDataclass:(id)a3
{
  id v4 = (void *)MEMORY[0x263F25810];
  id v5 = a3;
  v6 = [v4 sharedManager];
  id v7 = [(ICSDataclassSpecifierProvider *)self account];
  char v8 = [v6 shouldShowDataclass:v5 forAccount:v7];

  return v8;
}

- (id)_buildPhotosSpecifier
{
  if ((-[ICSDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", *MEMORY[0x263EFACC0])|| -[ICSDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", *MEMORY[0x263EFAD28]))&& (-[AAUISpecifierProvider specifiers](self->_photoStreamSpecifierProvider, "specifiers"), v3 = objc_claimAutoreleasedReturnValue(), uint64_t v4 = [v3 count], v3, v4))
  {
    id v5 = [(AAUISpecifierProvider *)self->_photoStreamSpecifierProvider specifiers];
    v6 = [v5 firstObject];

    [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v6 forDataclass:*MEMORY[0x263EFACF8]];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_buildHealthDataSpecifier
{
  v3 = [(AAUISpecifierProvider *)self->_healthDataSpecifierProvider specifiers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(AAUISpecifierProvider *)self->_healthDataSpecifierProvider specifiers];
    v6 = [v5 firstObject];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_buildUbiquitySpecifier
{
  v3 = [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider ubiquityLinklistSpecifier];
  [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v3 forDataclass:*MEMORY[0x263EFAD48]];
  if ([(ICSDataclassSpecifierProvider *)self _showSpecifierForDataclass:*MEMORY[0x263EFB4C0]])
  {
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 1;
  }
  if (v4) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

- (id)_buildEmailSpecifier
{
  uint64_t v3 = *MEMORY[0x263EFACB8];
  if (!-[ICSDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", *MEMORY[0x263EFACB8])|| (-[AAUISpecifierProvider specifiers](self->_mailSpecifierProvider, "specifiers"), v4 = objc_claimAutoreleasedReturnValue(), uint64_t v5 = [v4 count], v4, !v5))
  {
    id v7 = 0;
    goto LABEL_10;
  }
  if ([MEMORY[0x263F25CC8] isAccountDataclassListRedesignEnabled])
  {
    v6 = [(ICSDataclassSpecifierProvider *)self account];
    if (objc_msgSend(v6, "aa_isAccountClass:", *MEMORY[0x263F25618]))
    {
    }
    else
    {
      char v8 = [(ICSDataclassSpecifierProvider *)self account];
      int v9 = objc_msgSend(v8, "aa_isManagedAppleID");

      if (!v9)
      {
        id v7 = [(ICSDataclassSpecifierProvider *)self specifierForDataclass:v3];
        goto LABEL_9;
      }
    }
  }
  v10 = [(AAUISpecifierProvider *)self->_mailSpecifierProvider specifiers];
  id v7 = [v10 firstObject];

LABEL_9:
  [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v7 forDataclass:v3];
LABEL_10:

  return v7;
}

- (id)_buildKeychainSpecifier
{
  uint64_t v3 = *MEMORY[0x263EFACB0];
  if (-[ICSDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", *MEMORY[0x263EFACB0])&& (-[ICSKeychainSpecifierProvider specifiers](self->_keychainSpecifierProvider, "specifiers"), v4 = objc_claimAutoreleasedReturnValue(), uint64_t v5 = [v4 count], v4, v5))
  {
    v6 = [(ICSKeychainSpecifierProvider *)self->_keychainSpecifierProvider specifiers];
    id v7 = [v6 firstObject];

    [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v7 forDataclass:v3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_specifierForMessagesDataclass
{
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    uint64_t v3 = (void *)getCKCloudSettingsViewControllerClass_softClass;
    uint64_t v13 = getCKCloudSettingsViewControllerClass_softClass;
    if (!getCKCloudSettingsViewControllerClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getCKCloudSettingsViewControllerClass_block_invoke;
      v9[3] = &unk_2655B59A0;
      v9[4] = &v10;
      __getCKCloudSettingsViewControllerClass_block_invoke((uint64_t)v9);
      uint64_t v3 = (void *)v11[3];
    }
    uint64_t v4 = *MEMORY[0x263EFACC8];
    id v5 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v6 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:v4 withCustomDetailClass:v5];
  }
  else
  {
    uint64_t v4 = *MEMORY[0x263EFACC8];
    uint64_t v6 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFACC8]];
  }
  id v7 = (void *)v6;
  [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v6 forDataclass:v4];

  return v7;
}

- (BOOL)isRegularWatchPairing
{
  if (isRegularWatchPairing_onceToken != -1) {
    dispatch_once(&isRegularWatchPairing_onceToken, &__block_literal_global_3);
  }
  return 0;
}

- (id)_buildAppGroupHeaderSpecifiers
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"APP_GROUP_HEADER_GROUP"];
  [v3 addObject:v4];
  id v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"AppsUsingiCloudHeader" target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v5 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"APPS_USING_ICLOUD_HEADER_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F602D0]];

  char v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v9 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DATACLASS_LIST_INFO_TEXT"];
  uint64_t v10 = [v8 localizedStringForKey:v9 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F602C8]];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"SAVED_TO_ICLOUD_LEARN_MORE_LINK" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v5 setObject:v12 forKeyedSubscript:@"AAUIDataclassAttributedLink"];

  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"LEARN_MORE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v5 setObject:v14 forKeyedSubscript:@"AAUIDataclassAttributedLinkText"];

  [v5 setObject:&unk_270E05BE8 forKeyedSubscript:*MEMORY[0x263F5FEF0]];
  v15 = (void *)MEMORY[0x263F827E8];
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = [v15 imageNamed:@"AppsUsingiCloud" inBundle:v16];
  [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x263F60140]];

  [v3 addObject:v5];

  return v3;
}

- (id)_buildAppSpecifiers
{
  appSpecifiers = self->_appSpecifiers;
  if (appSpecifiers) {
    goto LABEL_79;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = [(ICSDataclassSpecifierProvider *)self _specifiersForProvisionedDataclasses];
  if ([v5 count])
  {
    uint64_t v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"APPS_GROUP_0"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v9 = [(ICSDataclassSpecifierProvider *)self _buildAppGroupHeaderSpecifiers];
      [v4 addObjectsFromArray:v9];
    }
    else
    {
      uint64_t v10 = [(ICSDataclassSpecifierProvider *)self account];
      if (objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x263F25618]))
      {
        id v11 = [(ICSDataclassSpecifierProvider *)self account];
        int v12 = objc_msgSend(v11, "aa_isManagedAppleID");

        if (!v12) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      uint64_t v13 = (void *)MEMORY[0x263F5FC40];
      int v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v14 = [v9 localizedStringForKey:@"SYNC_WITH_ICLOUD_GROUP_NAME" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      uint64_t v15 = [v13 groupSpecifierWithID:@"SYNC WITH ICLOUD" name:v14];

      uint64_t v6 = (void *)v15;
    }

LABEL_11:
    [v4 addObject:v6];
  }
  if ([(ICSDataclassSpecifierProvider *)self isRegularWatchPairing])
  {
    v16 = 0;
  }
  else
  {
    v16 = [(ICSDataclassSpecifierProvider *)self _buildPhotosSpecifier];
    if (v16) {
      [v4 addObject:v16];
    }
  }
  if (self->_ubiquitySpecifierProvider)
  {
    uint64_t v17 = [(ICSDataclassSpecifierProvider *)self _buildUbiquitySpecifier];
    if (v17) {
      [v4 addObject:v17];
    }
  }
  v18 = [(ICSDataclassSpecifierProvider *)self _buildEmailSpecifier];
  if (v18) {
    [v4 addObject:v18];
  }
  if (![(ICSDataclassSpecifierProvider *)self isRegularWatchPairing])
  {
    uint64_t v19 = [(ICSDataclassSpecifierProvider *)self _buildKeychainSpecifier];

    if (v19)
    {
      [v4 addObject:v19];
      v16 = (void *)v19;
    }
    else
    {
      v16 = 0;
    }
  }
  uint64_t v20 = *MEMORY[0x263EFACE8];
  v21 = [v5 specifierForID:*MEMORY[0x263EFACE8]];

  if (v21)
  {
    [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v21 forDataclass:v20];
    [v4 addObject:v21];
  }
  if (![(ICSDataclassSpecifierProvider *)self isRegularWatchPairing])
  {
    uint64_t v22 = *MEMORY[0x263EFACC8];
    uint64_t v23 = [v5 specifierForID:*MEMORY[0x263EFACC8]];

    if (v23)
    {
      [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v23 forDataclass:v22];
      [v4 addObject:v23];
      v21 = (void *)v23;
    }
    else
    {
      v21 = 0;
    }
  }
  v24 = [MEMORY[0x263F25810] sharedManager];
  uint64_t v25 = *MEMORY[0x263EFAC90];
  id v26 = [(ICSDataclassSpecifierProvider *)self account];
  int v27 = [v24 shouldShowDataclass:v25 forAccount:v26];

  if (!v27) {
    goto LABEL_39;
  }
  v28 = [MEMORY[0x263F25810] sharedManager];
  int v29 = [v28 appIsNeitherInstalledOrPlaceholder:v25];

  if (!v29)
  {
    uint64_t v31 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:v25 fromProvisionedSpecifiers:v5];

    if (v31)
    {
      [v4 addObject:v31];
      v21 = (void *)v31;
      goto LABEL_39;
    }
LABEL_38:
    v21 = 0;
    goto LABEL_39;
  }
  uint64_t v30 = [(ICSDataclassSpecifierProvider *)self _buildHealthDataSpecifier];

  if (!v30) {
    goto LABEL_38;
  }
  [v4 addObject:v30];
  [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v30 forDataclass:v25];
  v21 = (void *)v30;
LABEL_39:
  if (![(ICSDataclassSpecifierProvider *)self isRegularWatchPairing])
  {
    if (_os_feature_enabled_impl()
      && ([(ICSDataclassSpecifierProvider *)self account],
          v32 = objc_claimAutoreleasedReturnValue(),
          int v33 = objc_msgSend(v32, "aa_isAccountClass:", *MEMORY[0x263F25618]),
          v32,
          v33))
    {
      v34 = [(AAUISpecifierProvider *)self->_calendarSpecifierProvider specifiers];
      uint64_t v35 = [v34 count];

      if (v35)
      {
        v36 = [(AAUISpecifierProvider *)self->_calendarSpecifierProvider specifiers];
        [v4 addObjectsFromArray:v36];

        v37 = [(AAUISpecifierProvider *)self->_calendarSpecifierProvider specifiers];
        uint64_t v38 = [v37 count];

        if (v38)
        {
          v39 = [(AAUISpecifierProvider *)self->_calendarSpecifierProvider specifiers];
          v40 = [v39 firstObject];

          [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v40 forDataclass:*MEMORY[0x263EFAC50]];
        }
      }
      v41 = v21;
    }
    else
    {
      v41 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAC50] fromProvisionedSpecifiers:v5];

      if (v41)
      {
        if (_os_feature_enabled_impl()) {
          [v41 setName:@"iCloud Calendar"];
        }
        [v4 addObject:v41];
      }
    }
    v42 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAC60] fromProvisionedSpecifiers:v5];

    if (v42) {
      [v4 addObject:v42];
    }
    v21 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAD08] fromProvisionedSpecifiers:v5];

    if (v21) {
      [v4 addObject:v21];
    }
  }
  v43 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAC28] fromProvisionedSpecifiers:v5];

  if (v43) {
    [v4 addObject:v43];
  }
  v44 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFACE0] fromProvisionedSpecifiers:v5];

  if (v44) {
    [v4 addObject:v44];
  }
  v45 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAD40] fromProvisionedSpecifiers:v5];

  if (v45) {
    [v4 addObject:v45];
  }
  v46 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAC98] fromProvisionedSpecifiers:v5];

  if (v46) {
    [v4 addObject:v46];
  }
  v47 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAC80] fromProvisionedSpecifiers:v5];

  if (v47) {
    [v4 addObject:v47];
  }
  v48 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAD30] fromProvisionedSpecifiers:v5];

  if (v48) {
    [v4 addObject:v48];
  }
  uint64_t v49 = *MEMORY[0x263F26D38];
  v50 = [(ICSDataclassSpecifierProvider *)self specifierForServiceType:*MEMORY[0x263F26D38]];

  if (v50)
  {
    [(ICSDataclassSpecifierProvider *)self _decorateServiceSpecifier:v50 forService:v49];
    [v4 addObject:v50];
  }
  v51 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAD38] fromProvisionedSpecifiers:v5];

  if (v51) {
    [v4 addObject:v51];
  }
  v52 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFAC88] fromProvisionedSpecifiers:v5];

  if (v52) {
    [v4 addObject:v52];
  }
  v53 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFACD0] fromProvisionedSpecifiers:v5];

  if (v53) {
    [v4 addObject:v53];
  }
  v54 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFACF0] fromProvisionedSpecifiers:v5];

  if (v54) {
    [v4 addObject:v54];
  }
  v55 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:*MEMORY[0x263EFACA0] fromProvisionedSpecifiers:v5];

  if (v55) {
    [v4 addObject:v55];
  }
  v56 = (NSArray *)[v4 copy];
  v57 = self->_appSpecifiers;
  self->_appSpecifiers = v56;

  appSpecifiers = self->_appSpecifiers;
LABEL_79:

  return appSpecifiers;
}

- (id)_specifierForDataclass:(id)a3 fromProvisionedSpecifiers:(id)a4
{
  id v6 = a3;
  id v7 = [a4 specifierForID:v6];
  if (v7)
  {
    [(ICSDataclassSpecifierProvider *)self _decorateDataclassSpecifier:v7 forDataclass:v6];
    id v8 = v7;
  }

  return v7;
}

- (void)_decorateDataclassSpecifier:(id)a3 forDataclass:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(ICSDataclassSpecifierProvider *)self manageStorageAppsListViewModel];
  id v8 = [v7 expandedSubTitleForDataclass:v6];

  if (([v6 isEqualToString:*MEMORY[0x263EFACF8]] & 1) == 0
    && ([v6 isEqualToString:*MEMORY[0x263EFAC58]] & 1) == 0
    && ([v6 isEqualToString:*MEMORY[0x263EFACE8]] & 1) == 0
    && ![v6 isEqualToString:*MEMORY[0x263EFACB0]])
  {
LABEL_9:
    uint64_t v10 = 0;
    v16 = 0;
    if (!v8) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  int v9 = [(ICSDataclassSpecifierProvider *)self homeViewModel];
  uint64_t v10 = [v9 expandedSubTitleForDataclass:v6];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v12 = [v11 localizedStringForKey:@"SUBTITLE_ON" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
  if ([v10 isEqualToString:v12])
  {

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"SUBTITLE_OFF" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
  int v15 = [v10 isEqualToString:v14];

  if (v15) {
    goto LABEL_8;
  }
  if (v8 && v10)
  {
    id v17 = [NSString stringWithFormat:@"%@ • %@", v10, v8];
    goto LABEL_11;
  }
  if (v8)
  {
LABEL_10:
    id v17 = v8;
LABEL_11:
    v16 = v17;
    goto LABEL_12;
  }
  if (v10)
  {
    id v17 = v10;
    uint64_t v10 = v17;
    goto LABEL_11;
  }
  v16 = 0;
LABEL_12:
  [v18 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  if (v16) {
    [v18 setObject:v16 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }
}

- (void)_decorateLiverpoolSpecifier:(id)a3 forBundleId:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(ICSDataclassSpecifierProvider *)self manageStorageAppsListViewModel];
  id v8 = [v7 expandedSubTitleForLiverpoolBundleId:v6];

  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }
  [v9 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
}

- (void)_decorateServiceSpecifier:(id)a3 forService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  id v9 = [(ICSDataclassSpecifierProvider *)self homeViewModel];
  id v8 = [v9 expandedSubTitleForService:v6];

  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F602C8]];
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    id v4 = [(ICSDataclassSpecifierProvider *)self _specifiersForAppListVC];
    id v5 = self->_specifiers;
    self->_specifiers = v4;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (id)_specifiersForAppListVC
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  appGroupSpecifiers = self->_appGroupSpecifiers;
  if (!appGroupSpecifiers)
  {
    id v4 = objc_opt_new();
    if (!self->_appSpecifiers)
    {
      id v5 = [(ICSDataclassSpecifierProvider *)self _buildAppSpecifiers];
      [v4 addObjectsFromArray:v5];
    }
    id v6 = [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider specifiers];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v8 = [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider specifiers];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __56__ICSDataclassSpecifierProvider__specifiersForAppListVC__block_invoke;
      v32[3] = &unk_2655B5660;
      v32[4] = self;
      [v8 enumerateObjectsUsingBlock:v32];

      id v9 = [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider specifiers];
      [v4 addObjectsFromArray:v9];
    }
    uint64_t v10 = [(ICSDataclassSpecifierProvider *)self account];
    int v11 = objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x263F25618]);

    if (v11)
    {
      int v12 = [(AAUISpecifierProvider *)self->_hmeSpecifierProvider specifiers];
      if ([v12 count])
      {
        uint64_t v13 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        [v4 addObject:v13];

        [v4 addObjectsFromArray:v12];
      }
    }
    id v14 = [(AAUISpecifierProvider *)self->_otherSpecifierProvider specifiers];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      v16 = [(AAUISpecifierProvider *)self->_otherSpecifierProvider specifiers];
      [v4 addObjectsFromArray:v16];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v4;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      uint64_t v21 = *MEMORY[0x263F60138];
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v24 = objc_msgSend(v23, "objectForKeyedSubscript:", v21, (void)v28);
          [(ICSDataclassSpecifierProvider *)self _performUpdateIfNeededOnSpecifier:v23 forDataclass:v24];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v19);
    }

    uint64_t v25 = (NSArray *)[v17 copy];
    id v26 = self->_appGroupSpecifiers;
    self->_appGroupSpecifiers = v25;

    appGroupSpecifiers = self->_appGroupSpecifiers;
  }

  return appGroupSpecifiers;
}

void __56__ICSDataclassSpecifierProvider__specifiersForAppListVC__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  [v2 _decorateLiverpoolSpecifier:v3 forBundleId:v4];
}

- (id)_specifiersForProvisionedDataclasses
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [(ICSDataclassSpecifierProvider *)self account];
  id v4 = [v3 provisionedDataclasses];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int v11 = [MEMORY[0x263F25810] sharedManager];
        int v12 = [(ICSDataclassSpecifierProvider *)self account];
        int v13 = [v11 shouldShowDataclass:v10 forAccount:v12];

        if (v13)
        {
          id v14 = [(ICSDataclassSpecifierProvider *)self specifierForDataclass:v10];
          if (v14) {
            [v17 addObject:v14];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v15 = LogSubsystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v17;
    _os_log_impl(&dword_262993000, v15, OS_LOG_TYPE_DEFAULT, "Returning specifiers: %@", buf, 0xCu);
  }

  return v17;
}

- (id)specifierForDataclass:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x263EFACC0]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263EFAD28]])
  {
    id v5 = [(AAUISpecifierProvider *)self->_photoStreamSpecifierProvider specifiers];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      photoStreamSpecifierProvider = self->_photoStreamSpecifierProvider;
LABEL_5:
      id WeakRetained = [photoStreamSpecifierProvider specifiers];
      uint64_t v9 = [WeakRetained firstObject];
LABEL_6:
      uint64_t v10 = (void *)v9;

      goto LABEL_18;
    }
    goto LABEL_14;
  }
  uint64_t v11 = *MEMORY[0x263EFAC90];
  if ([v4 isEqualToString:*MEMORY[0x263EFAC90]])
  {
    int v12 = [MEMORY[0x263F25810] sharedManager];
    int v13 = [v12 appIsNeitherInstalledOrPlaceholder:v11];

    if (v13)
    {
      id v14 = [(AAUISpecifierProvider *)self->_healthDataSpecifierProvider specifiers];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        photoStreamSpecifierProvider = self->_healthDataSpecifierProvider;
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  else
  {
    if ([v4 isEqualToString:*MEMORY[0x263EFACB0]])
    {
      v16 = [(ICSKeychainSpecifierProvider *)self->_keychainSpecifierProvider specifiers];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        photoStreamSpecifierProvider = self->_keychainSpecifierProvider;
        goto LABEL_5;
      }
LABEL_14:
      uint64_t v10 = 0;
      goto LABEL_18;
    }
    if (![v4 isEqualToString:*MEMORY[0x263EFACE8]])
    {
      if (![v4 isEqualToString:*MEMORY[0x263EFACC8]])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
        uint64_t v9 = [WeakRetained specifierForDataclass:v4];
        goto LABEL_6;
      }
      uint64_t v18 = [(ICSDataclassSpecifierProvider *)self _specifierForMessagesDataclass];
      goto LABEL_17;
    }
  }
  uint64_t v18 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:v4];
LABEL_17:
  uint64_t v10 = (void *)v18;
LABEL_18:

  return v10;
}

- (void)_performUpdateIfNeededOnSpecifier:(id)a3 forDataclass:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = [(ICSDataclassSpecifierProvider *)self account];
  int v8 = objc_msgSend(v7, "aa_serverDisabledDataclass:", v6);

  if (v8)
  {
    [v18 cellType];
    [v18 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v18 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"MANAGED_BY_APPLE_ID" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    [v18 setProperty:v10 forKey:*MEMORY[0x263F602C8]];
  }
  uint64_t v11 = [v18 name];
  char v12 = [v11 isEqualToString:@"AppsUsingiCloudHeader"];

  if ((v12 & 1) == 0)
  {
    int v13 = NSNumber;
    id v14 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);
    double v16 = *MEMORY[0x263F839B8];
    if (!IsAccessibilityCategory) {
      double v16 = 60.0;
    }
    uint64_t v17 = [v13 numberWithDouble:v16];
    [v18 setProperty:v17 forKey:*MEMORY[0x263F602A8]];
  }
}

- (id)_specifierForDataclass:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSDataclassSpecifierProvider *)self _specifierForDataclass:v4 withCustomDetailClass:objc_opt_class()];

  return v5;
}

- (id)_specifierForDataclass:(id)a3 withCustomDetailClass:(Class)a4
{
  id v6 = (void *)MEMORY[0x263F5FC40];
  id v7 = a3;
  int v8 = [(ICSDataclassSpecifierProvider *)self account];
  uint64_t v9 = objc_msgSend(v6, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", v7, v8, self, 0, sel__dataclassState_, a4);

  [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60138]];
  [v9 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];

  return v9;
}

- (id)_dataclassState:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v7 = [WeakRetained specifierProvider:self dataclassSwitchStateForSpecifier:v5];

  LODWORD(v5) = [v7 BOOLValue];
  int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = v8;
  if (v5) {
    uint64_t v10 = @"ON";
  }
  else {
    uint64_t v10 = @"OFF";
  }
  uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  return v11;
}

- (BOOL)shouldShowSpecifierForServiceType:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([MEMORY[0x263F25820] isMultiUserMode] & 1) != 0
    || ([(ICSDataclassSpecifierProvider *)self account],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = objc_msgSend(v5, "aa_isAccountClass:", *MEMORY[0x263F25618]),
        v5,
        !v6))
  {
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
  id v7 = [(ICSServiceAuthHandler *)self->_serviceAuthHandler serviceOwnersManager];
  int v8 = [(id)objc_opt_class() supportedServices];
  char v9 = [v8 containsObject:v4];

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = LogSubsystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_262993000, v11, OS_LOG_TYPE_DEFAULT, "Could not find a service owner for %@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_8;
  }
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (id)specifierForServiceType:(id)a3
{
  id v4 = a3;
  if ([(ICSDataclassSpecifierProvider *)self shouldShowSpecifierForServiceType:v4])
  {
    id v5 = (void *)MEMORY[0x263F5FC40];
    int v6 = AALocalizedStringForServiceType();
    id v7 = [v5 preferenceSpecifierNamed:v6 target:self set:sel_setValue_forServiceSpecifier_ get:sel_valueForServiceSpecifier_ detail:0 cell:6 edit:0];

    if ([v4 isEqualToString:*MEMORY[0x263F26D38]])
    {
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
      int v8 = +[ICSIconBundleIdKeys GameCenterIconKey];
      [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F60188]];
    }
    [v7 setProperty:v4 forKey:@"com.apple.appleaccount.ServiceType"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setValue:(id)a3 forServiceSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int v8 = [v7 propertyForKey:@"com.apple.appleaccount.ServiceType"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  BOOL v10 = [WeakRetained activeSpecifier];

  if (!v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_listController);
    [v11 startSpinnerInSpecifier:v7];

    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __62__ICSDataclassSpecifierProvider_setValue_forServiceSpecifier___block_invoke;
    id v18 = &unk_2655B5978;
    long long v19 = self;
    id v20 = v7;
    char v12 = _Block_copy(&v15);
    int v13 = objc_msgSend(v6, "BOOLValue", v15, v16, v17, v18, v19);
    serviceAuthHandler = self->_serviceAuthHandler;
    if (v13) {
      [(ICSServiceAuthHandler *)serviceAuthHandler signInAccountForService:v8 completion:v12];
    }
    else {
      [(ICSServiceAuthHandler *)serviceAuthHandler signOutAccountForService:v8 completion:v12];
    }
  }
}

void __62__ICSDataclassSpecifierProvider_setValue_forServiceSpecifier___block_invoke(uint64_t a1, char a2)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained stopSpinnerInActiveSpecifier];

  if ((a2 & 1) == 0)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v5 reloadSpecifier:*(void *)(a1 + 40)];
  }
}

- (id)valueForServiceSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:@"com.apple.appleaccount.ServiceType"];
  id v5 = [(ICSServiceAuthHandler *)self->_serviceAuthHandler serviceOwnersManager];
  id v6 = [v5 accountForService:v4];

  if (v6)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ICSServiceAuthHandler accountMatchesPrimaryAccount:service:](self->_serviceAuthHandler, "accountMatchesPrimaryAccount:service:", v6, v4));
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA80];
  }

  return v7;
}

- (id)_loadCalendarSpecifierProvider
{
  id v3 = objc_msgSend(MEMORY[0x263F086E0], "ics_loadBundle:atPath:", @"icloudCalendarSettings.bundle", @"System/Library/PreferenceBundles/AccountSettings");
  id v4 = NSClassFromString(&cfstr_Calendarsettin.isa);
  if ([(objc_class *)v4 conformsToProtocol:&unk_270E21F68])
  {
    id v5 = [v4 alloc];
    accountManager = self->_accountManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    int v8 = (void *)[v5 initWithAccountManager:accountManager presenter:WeakRetained];

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 setDelegate:v9];
  }
  else
  {
    BOOL v10 = LogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(ICSDataclassSpecifierProvider *)(uint64_t)self _loadCalendarSpecifierProvider];
    }

    int v8 = 0;
  }

  return v8;
}

- (id)getICloudMailSpecifier
{
  id v3 = [(ICSDataclassSpecifierProvider *)self loadBundle:@"icloudMailSettings.bundle" atPath:@"System/Library/PreferenceBundles/AccountSettings"];
  id v4 = [(ICSDataclassSpecifierProvider *)self _loadSpecifierProviderWithClassName:@"MailSettingsSpecifierProvider" inBundle:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = LogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICSDataclassSpecifierProvider getICloudMailSpecifier](v7);
    }
  }

  return v5;
}

- (id)loadBundle:(id)a3 atPath:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = MEMORY[0x263E5BB10]();
  int v8 = [v7 stringByAppendingPathComponent:v6];

  id v9 = [v8 stringByAppendingPathComponent:v5];
  BOOL v10 = [MEMORY[0x263F086E0] bundleWithPath:v9];
  if (([v10 isLoaded] & 1) == 0)
  {
    id v11 = LogSubsystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_262993000, v11, OS_LOG_TYPE_DEFAULT, "%@ not loaded. Loading...", (uint8_t *)&v13, 0xCu);
    }

    [v10 load];
  }

  return v10;
}

- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = (NSString *)a3;
  id v7 = a4;
  int v8 = NSClassFromString(v6);
  if ([(objc_class *)v8 conformsToProtocol:&unk_270E21F68])
  {
    id v9 = [v8 alloc];
    accountManager = self->_accountManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    char v12 = (void *)[v9 initWithAccountManager:accountManager presenter:WeakRetained];
  }
  else
  {
    int v13 = LogSubsystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543874;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = v7;
      _os_log_error_impl(&dword_262993000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v15, 0x20u);
    }

    char v12 = 0;
  }

  return v12;
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setSpecifiers:(id)a3
{
}

- (ICSUbiquitySpecifierProvider)ubiquitySpecifierProvider
{
  return self->_ubiquitySpecifierProvider;
}

- (_TtC14iCloudSettings19iCloudHomeViewModel)homeViewModel
{
  return self->_homeViewModel;
}

- (void)setHomeViewModel:(id)a3
{
}

- (_TtC14iCloudSettings30ManageStorageAppsListViewModel)manageStorageAppsListViewModel
{
  return self->_manageStorageAppsListViewModel;
}

- (void)setManageStorageAppsListViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manageStorageAppsListViewModel, 0);
  objc_storeStrong((id *)&self->_homeViewModel, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainViewDataclasses, 0);
  objc_storeStrong((id *)&self->_serviceAuthHandler, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_appGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_calendarSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_otherSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_hmeSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_keychainSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_mailSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_healthDataSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_photoStreamSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_accountWorkQueue, 0);
  objc_destroyWeak((id *)&self->_listController);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_loadCalendarSpecifierProvider
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
}

- (void)getICloudMailSpecifier
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_262993000, log, OS_LOG_TYPE_ERROR, "AAUIMailSpecifierProvider not found", v1, 2u);
}

@end