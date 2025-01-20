@interface CKCloudSettingsViewController
+ (id)dynamicMessagesIconImage;
- (AIDAAccountManager)accountManager;
- (BOOL)isCloudSyncingEnabled;
- (BOOL)isStorageUsedRequestInProgress;
- (CKCloudSettingsViewController)init;
- (CKiCloudSettingsViewModel)viewModel;
- (ICQAppCloudStorage)appCloudStorage;
- (id)_fetchKeepMessagesPreference:(id)a3;
- (id)_fetchStorageUsed:(id)a3;
- (id)_fetchSyncStatusText:(id)a3;
- (id)_headerGroupSpecifiers;
- (id)_messagesInCloudCount:(id)a3;
- (id)_syncDetailsSpecifiers;
- (id)_syncSpecifiers;
- (id)account;
- (id)specifiers;
- (void)_internalInit;
- (void)_navigateToMessagesSettings;
- (void)_presentAlertForAccountMismatchFromSpecifier:(id)a3;
- (void)_presentScreenForSpecifier:(id)a3;
- (void)_startObservingAccountStoreChanges;
- (void)_stopObservingAccountStoreChanges;
- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4;
- (void)dealloc;
- (void)navigateToSettingsWithURLString:(id)a3 forSpecifier:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setAppCloudStorage:(id)a3;
- (void)setStorageUsedRequestInProgress:(BOOL)a3;
- (void)setViewModel:(id)a3;
- (void)syncButtonPressed:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKCloudSettingsViewController

- (id)_headerGroupSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"HEADER_GROUP"];
  [v3 addObject:v4];

  v5 = (void *)MEMORY[0x263F5FC40];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"MESSAGES_DATACLASS_TITLE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  v8 = [v5 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v8 setProperty:NSClassFromString(&cfstr_Aauidataclasss.isa) forKey:*MEMORY[0x263F5FFE0]];
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"HEADING_TITLE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [v8 setProperty:v10 forKey:*MEMORY[0x263F602D0]];

  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v25 = [v11 localizedStringForKey:@"SECURELY_STORE_YOUR_MESSAGES_IN_ICLOUD" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  v12 = [NSString stringWithFormat:@"%@ %%@", v25];
  [v8 setProperty:v12 forKey:*MEMORY[0x263F602C8]];
  v13 = [(CKCloudSettingsViewController *)self viewModel];
  v14 = [v13 messagesLearnMoreUrlString];

  [v8 setProperty:v14 forKey:@"AAUIDataclassAttributedLink"];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"LEARN_MORE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [v8 setProperty:v16 forKey:@"AAUIDataclassAttributedLinkText"];

  v17 = [(id)objc_opt_class() dynamicMessagesIconImage];
  uint64_t v18 = *MEMORY[0x263F60140];
  [v8 setProperty:v17 forKey:*MEMORY[0x263F60140]];
  [v3 addObject:v8];
  v19 = +[CKiCloudSettingsUtils iCloudSettingsSyncText];
  v20 = [(ACUIDataclassConfigurationViewController *)self specifierForDataclass:*MEMORY[0x263EFACC8]];
  [v20 setName:v19];
  [v20 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  v21 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v22 = [v21 applicationIsInstalled:@"com.apple.MobileSMS"];

  v23 = [NSNumber numberWithBool:v22];
  [v20 setProperty:v23 forKey:*MEMORY[0x263F600A8]];

  [v20 removePropertyForKey:v18];
  [v3 addObject:v20];

  return v3;
}

+ (id)dynamicMessagesIconImage
{
  v2 = (void *)dynamicMessagesIconImage___dynamicMessagesIconImage;
  if (!dynamicMessagesIconImage___dynamicMessagesIconImage)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:@"com.apple.MobileSMS"];
    id v4 = objc_alloc(MEMORY[0x263F4B558]);
    v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 scale];
    v7 = objc_msgSend(v4, "initWithSize:scale:", 64.0, 64.0, v6);

    id v8 = objc_alloc(MEMORY[0x263F4B558]);
    v9 = [MEMORY[0x263F1C920] mainScreen];
    [v9 scale];
    v11 = objc_msgSend(v8, "initWithSize:scale:", 64.0, 64.0, v10);

    [v11 setAppearance:1];
    v12 = [v3 prepareImageForDescriptor:v7];
    v13 = [v3 prepareImageForDescriptor:v11];
    v14 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:", objc_msgSend(v12, "CGImage"));
    v15 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:", objc_msgSend(v13, "CGImage"));
    v16 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    v17 = [v14 imageAsset];
    [v17 registerImage:v15 withTraitCollection:v16];

    uint64_t v18 = (void *)dynamicMessagesIconImage___dynamicMessagesIconImage;
    dynamicMessagesIconImage___dynamicMessagesIconImage = (uint64_t)v14;

    v2 = (void *)dynamicMessagesIconImage___dynamicMessagesIconImage;
  }
  return v2;
}

- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKCloudSettingsViewController *)self viewModel];
  char v9 = [v8 micAccountsMatch];

  int v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_2561DD000, v11, OS_LOG_TYPE_INFO, "Toggled MiC switch newState={%@}, will call super.", buf, 0xCu);
      }
    }
    v13.receiver = self;
    v13.super_class = (Class)CKCloudSettingsViewController;
    [(ACUIDataclassConfigurationViewController *)&v13 dataclassSwitchStateDidChange:v6 withSpecifier:v7];
  }
  else
  {
    if (v10)
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2561DD000, v12, OS_LOG_TYPE_INFO, "Tried to toggle MiC but there is an account mismatch. Showing alert.", buf, 2u);
      }
    }
    [(CKCloudSettingsViewController *)self _presentAlertForAccountMismatchFromSpecifier:v7];
  }
}

- (void)_presentAlertForAccountMismatchFromSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v5 localizedStringForKey:@"ACCOUNT_MISMATCH_ALERT_TITLE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v6 localizedStringForKey:@"ICLOUD_ACCOUNT_MISMATCH" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id location = 0;
  uint64_t v18 = self;
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x263F1C3F0];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v9 = [v8 localizedStringForKey:@"SHOW_IMESSAGE_SETTINGS" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __96__CKCloudSettingsViewController_HeaderSpecifiers___presentAlertForAccountMismatchFromSpecifier___block_invoke;
  v24[3] = &unk_2653F5280;
  objc_copyWeak(&v26, &location);
  id v10 = v4;
  id v25 = v10;
  v11 = [v7 actionWithTitle:v9 style:0 handler:v24];

  v12 = (void *)MEMORY[0x263F1C3F0];
  objc_super v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"CANCEL" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __96__CKCloudSettingsViewController_HeaderSpecifiers___presentAlertForAccountMismatchFromSpecifier___block_invoke_2;
  v21[3] = &unk_2653F5280;
  objc_copyWeak(&v23, &location);
  id v15 = v10;
  id v22 = v15;
  uint64_t v16 = [v12 actionWithTitle:v14 style:1 handler:v21];

  v17 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v20 message:v19 preferredStyle:1];
  [v17 addAction:v11];
  [v17 addAction:v16];
  [v17 setPreferredAction:v11];
  [(CKCloudSettingsViewController *)v18 presentViewController:v17 animated:1 completion:0];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __96__CKCloudSettingsViewController_HeaderSpecifiers___presentAlertForAccountMismatchFromSpecifier___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];

  id v4 = objc_loadWeakRetained(v2);
  [v4 _navigateToMessagesSettings];
}

void __96__CKCloudSettingsViewController_HeaderSpecifiers___presentAlertForAccountMismatchFromSpecifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
}

- (void)_navigateToMessagesSettings
{
  [(CKCloudSettingsViewController *)self navigateToSettingsWithURLString:@"prefs:root=MESSAGES" forSpecifier:0];
}

- (CKCloudSettingsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKCloudSettingsViewController;
  v2 = [(ACUIDataclassConfigurationViewController *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(CKCloudSettingsViewController *)v2 _internalInit];
  }
  return v3;
}

- (void)_internalInit
{
  id v3 = objc_alloc_init(CKiCloudSettingsViewModel);
  [(CKiCloudSettingsViewModel *)v3 setDelegate:self];
  viewModel = self->_viewModel;
  self->_viewModel = v3;
}

- (void)dealloc
{
  [(CKCloudSettingsViewController *)self _stopObservingAccountStoreChanges];
  id v3 = [(CKCloudSettingsViewController *)self viewModel];
  [v3 stopObservers];

  v4.receiver = self;
  v4.super_class = (Class)CKCloudSettingsViewController;
  [(ACUIDataclassConfigurationViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CKCloudSettingsViewController;
  [(ACUIDataclassConfigurationViewController *)&v5 viewDidLoad];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"MESSAGES" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [(CKCloudSettingsViewController *)self setTitle:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKCloudSettingsViewController;
  [(ACUIDataclassConfigurationViewController *)&v7 viewWillAppear:a3];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"MESSAGES" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  id v6 = [(CKCloudSettingsViewController *)self navigationItem];
  [v6 setTitle:v5];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = [(CKCloudSettingsViewController *)self _headerGroupSpecifiers];
    [v5 addObjectsFromArray:v6];

    objc_super v7 = [(CKCloudSettingsViewController *)self _syncDetailsSpecifiers];
    [v5 addObjectsFromArray:v7];

    if ([(CKCloudSettingsViewController *)self isCloudSyncingEnabled]
      && [(CKiCloudSettingsViewModel *)self->_viewModel isSyncAvailable])
    {
      id v8 = [(CKCloudSettingsViewController *)self _syncSpecifiers];
      [v5 addObjectsFromArray:v8];
    }
    char v9 = (objc_class *)[v5 copy];
    id v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v9;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_syncSpecifiers
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SYNC_ACTION_GROUP_IDENTIFIER"];
  objc_super v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = [(CKCloudSettingsViewController *)self viewModel];
  id v6 = [v5 syncButtonText];
  objc_super v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

  id v8 = [(CKCloudSettingsViewController *)self viewModel];
  uint64_t v9 = [v8 isSyncButtonEnabled];

  [v7 setIdentifier:@"SYNC_NOW_BUTTON"];
  [v7 setButtonAction:sel_syncButtonPressed_];
  id v10 = [NSNumber numberWithBool:v9];
  [v7 setProperty:v10 forKey:*MEMORY[0x263F600A8]];

  v13[0] = v3;
  v13[1] = v7;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v11;
}

- (void)syncButtonPressed:(id)a3
{
  id v3 = [(CKCloudSettingsViewController *)self viewModel];
  [v3 syncButtonPressed];
}

- (void)navigateToSettingsWithURLString:(id)a3 forSpecifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2561DD000, v7, OS_LOG_TYPE_INFO, "Detected tap on footer link text.", (uint8_t *)&v12, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_2561DD000, v8, OS_LOG_TYPE_INFO, "Attempting to present a screen for specifier={%@}", (uint8_t *)&v12, 0xCu);
    }
  }
  if (v5)
  {
    uint64_t v9 = [MEMORY[0x263F01880] defaultWorkspace];
    id v10 = [NSURL URLWithString:v5];
    [v9 openSensitiveURL:v10 withOptions:0];
  }
  else if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = 0;
      _os_log_impl(&dword_2561DD000, v11, OS_LOG_TYPE_INFO, "Programming error - unable to load urlString=(%@)", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)account
{
  v2 = [(CKCloudSettingsViewController *)self accountManager];
  id v3 = [v2 accounts];
  objc_super v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v4;
}

- (AIDAAccountManager)accountManager
{
  accountManager = self->_accountManager;
  if (!accountManager)
  {
    objc_super v4 = [(CKCloudSettingsViewController *)self specifier];

    if (v4)
    {
      id v5 = [(CKCloudSettingsViewController *)self specifier];
      id v6 = [v5 objectForKeyedSubscript:@"icloudAccountManager"];

      [(CKCloudSettingsViewController *)self setAccountManager:v6];
      [(CKCloudSettingsViewController *)self _startObservingAccountStoreChanges];
    }
    accountManager = self->_accountManager;
    if (!accountManager)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__CKCloudSettingsViewController_accountManager__block_invoke;
      block[3] = &unk_2653F52A8;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
      accountManager = self->_accountManager;
    }
  }
  return accountManager;
}

void __47__CKCloudSettingsViewController_accountManager__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)_startObservingAccountStoreChanges
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(CKCloudSettingsViewController *)self accountManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__CKCloudSettingsViewController__startObservingAccountStoreChanges__block_invoke;
  v4[3] = &unk_2653F52D0;
  objc_copyWeak(&v5, &location);
  [v3 addAccountChangeObserver:self handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__CKCloudSettingsViewController__startObservingAccountStoreChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = *MEMORY[0x263F26D28];
    id v8 = [v14 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
    uint64_t v9 = [v5 objectForKeyedSubscript:v7];
    id v10 = [v8 enabledDataclasses];
    uint64_t v11 = [v10 count];
    int v12 = [v9 enabledDataclasses];
    uint64_t v13 = [v12 count];

    if (v11 != v13) {
      [WeakRetained reloadSpecifiers];
    }
  }
}

- (void)_stopObservingAccountStoreChanges
{
  accountManager = self->_accountManager;
  if (accountManager) {
    [(AIDAAccountManager *)accountManager removeAccountChangeObserver:self];
  }
}

- (BOOL)isCloudSyncingEnabled
{
  id v3 = [(CKCloudSettingsViewController *)self account];

  if (!v3) {
    return 0;
  }
  objc_super v4 = [(CKCloudSettingsViewController *)self account];
  char v5 = [v4 isEnabledForDataclass:*MEMORY[0x263EFACC8]];

  return v5;
}

- (CKiCloudSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (void)setAccountManager:(id)a3
{
}

- (ICQAppCloudStorage)appCloudStorage
{
  return self->_appCloudStorage;
}

- (void)setAppCloudStorage:(id)a3
{
}

- (BOOL)isStorageUsedRequestInProgress
{
  return self->_storageUsedRequestInProgress;
}

- (void)setStorageUsedRequestInProgress:(BOOL)a3
{
  self->_storageUsedRequestInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appCloudStorage, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (id)_syncDetailsSpecifiers
{
  id v3 = [MEMORY[0x263EFF980] array];
  objc_super v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SYNC_DETAILS_GROUP"];
  char v5 = [(CKCloudSettingsViewController *)self viewModel];
  id v6 = [v5 syncStatusFooterText];

  uint64_t v7 = [(CKCloudSettingsViewController *)self viewModel];
  id v8 = [v7 syncStatusFooterSubstringForHyperlink];

  v30 = v6;
  if (v8)
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v4 setProperty:v10 forKey:*MEMORY[0x263F600C0]];

    uint64_t v11 = [(CKCloudSettingsViewController *)self viewModel];
    int v12 = [v11 syncStatusFooterSubstringForHyperlink];

    v32.id location = [v6 rangeOfString:v12];
    uint64_t v13 = NSStringFromRange(v32);
    [v4 setProperty:v13 forKey:*MEMORY[0x263F600D0]];

    [v4 setProperty:v6 forKey:*MEMORY[0x263F600E8]];
    id v14 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v4 setProperty:v14 forKey:*MEMORY[0x263F600E0]];

    id v15 = NSStringFromSelector(sel__presentScreenForSpecifier_);
    [v4 setProperty:v15 forKey:*MEMORY[0x263F600C8]];
  }
  else
  {
    [v4 setProperty:v6 forKey:*MEMORY[0x263F600F8]];
  }
  uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"MANAGE_STORAGE_TITLE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  uint64_t v18 = +[CKiCloudSettingsUtils specifierWithTitle:v17 target:self selector:sel__fetchStorageUsed_];

  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"KEEP_MESSAGES_TITLE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  v21 = +[CKiCloudSettingsUtils specifierWithTitle:v20 target:self selector:sel__fetchKeepMessagesPreference_];

  id v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v23 = [v22 localizedStringForKey:@"IN_ICLOUD_TITLE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  v24 = +[CKiCloudSettingsUtils specifierWithTitle:v23 target:self selector:sel__messagesInCloudCount_];

  id v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v26 = [v25 localizedStringForKey:@"STATUS_TITLE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  v27 = +[CKiCloudSettingsUtils specifierWithTitle:v26 target:self selector:sel__fetchSyncStatusText_];

  [v18 setCellType:2];
  [v18 setDetailControllerClass:NSClassFromString(&cfstr_Ckcloudmessage.isa)];
  [v21 setCellType:2];
  [v21 setDetailControllerClass:NSClassFromString(&cfstr_Ckkeepmessages.isa)];
  [v3 addObject:v4];
  [v3 addObject:v18];
  if ([(CKCloudSettingsViewController *)self isCloudSyncingEnabled])
  {
    [v3 addObject:v21];
    [v3 addObject:v24];
    [v3 addObject:v27];
  }
  v28 = (void *)[v3 copy];

  return v28;
}

- (void)_presentScreenForSpecifier:(id)a3
{
  id v4 = a3;
  char v5 = [(CKCloudSettingsViewController *)self viewModel];
  unint64_t v6 = [v5 syncState];

  if (v6 <= 9)
  {
    if (((1 << v6) & 0x78) != 0)
    {
      id v8 = [(CKCloudSettingsViewController *)self viewModel];
      uint64_t v9 = [v8 footerHyperlinkUrl];
      [(CKCloudSettingsViewController *)self navigateToSettingsWithURLString:v9 forSpecifier:v4];
    }
    else
    {
      if (((1 << v6) & 7) == 0)
      {
        uint64_t v7 = [(CKCloudSettingsViewController *)self viewModel];
        [v7 showICloudUpsellIfAvailable];
LABEL_9:

        goto LABEL_10;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl(&dword_2561DD000, v7, OS_LOG_TYPE_INFO, "Attempted to present a screen for a hyperlink for an unsupported sync state.", v10, 2u);
        }
        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

- (id)_fetchStorageUsed:(id)a3
{
  id v4 = a3;
  char v5 = [(CKCloudSettingsViewController *)self appCloudStorage];

  if (v5)
  {
    unint64_t v6 = [(CKCloudSettingsViewController *)self appCloudStorage];
    uint64_t v7 = [v6 storageUsed];
    [v7 longLongValue];

    NSLocalizedFileSizeDescription();
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (![(CKCloudSettingsViewController *)self isStorageUsedRequestInProgress])
    {
      [(CKCloudSettingsViewController *)self setStorageUsedRequestInProgress:1];
      id v9 = objc_alloc(NSClassFromString(&cfstr_Icqcloudstorag.isa));
      id v10 = [(CKCloudSettingsViewController *)self account];
      uint64_t v11 = (void *)[v9 initWithAccount:v10];

      [v11 setShouldIgnoreCache:1];
      id location = 0;
      objc_initWeak(&location, self);
      int v12 = [MEMORY[0x263F25810] sharedManager];
      uint64_t v13 = [v12 appBundleIdentifierForDataclass:*MEMORY[0x263EFACC8]];

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __72__CKCloudSettingsViewController_SyncStateSpecifiers___fetchStorageUsed___block_invoke;
      v15[3] = &unk_2653F53F0;
      objc_copyWeak(&v16, &location);
      [v11 fetchStorageByApp:v13 completion:v15];
      objc_destroyWeak(&v16);

      objc_destroyWeak(&location);
    }
    id v8 = &stru_2704C4418;
  }

  return v8;
}

void __72__CKCloudSettingsViewController_SyncStateSpecifiers___fetchStorageUsed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setStorageUsedRequestInProgress:0];

  if (v3)
  {
    id v6 = objc_loadWeakRetained(v4);
    [v6 setAppCloudStorage:v3];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__CKCloudSettingsViewController_SyncStateSpecifiers___fetchStorageUsed___block_invoke_2;
    block[3] = &unk_2653F53C8;
    objc_copyWeak(&v8, v4);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v8);
  }
}

void __72__CKCloudSettingsViewController_SyncStateSpecifiers___fetchStorageUsed___block_invoke_2(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained specifiers];

  uint64_t v3 = [v6 count];
  id v4 = objc_loadWeakRetained(v1);
  char v5 = v4;
  if (v3) {
    [v4 reloadSpecifierID:@"SYNC_DETAILS_GROUP" animated:1];
  }
  else {
    [v4 reloadSpecifiers];
  }
}

- (id)_fetchKeepMessagesPreference:(id)a3
{
  uint64_t v3 = [(CKCloudSettingsViewController *)self viewModel];
  id v4 = [v3 keepMessagesPreference];

  return v4;
}

- (id)_messagesInCloudCount:(id)a3
{
  uint64_t v3 = [(CKCloudSettingsViewController *)self viewModel];
  id v4 = [v3 messagesInCloudCount];

  return v4;
}

- (id)_fetchSyncStatusText:(id)a3
{
  uint64_t v3 = [(CKCloudSettingsViewController *)self viewModel];
  id v4 = [v3 syncStatus];

  return v4;
}

@end