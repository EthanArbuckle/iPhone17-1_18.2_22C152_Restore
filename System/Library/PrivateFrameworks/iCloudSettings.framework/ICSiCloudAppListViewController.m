@interface ICSiCloudAppListViewController
- (AIDAServiceOwnerProtocol)serviceOwnersManager;
- (BOOL)_shouldDisableiCloudUI;
- (_TtC14iCloudSettings19iCloudHomeViewModel)homeViewModel;
- (_TtC14iCloudSettings30ManageStorageAppsListViewModel)manageStorageAppsListViewModel;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_specifiersForAppsGroup;
- (id)dataClassSpecifierProvider;
- (id)specifiers;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4;
- (void)cleanupDataclassSpecifiers;
- (void)dealloc;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setAccountManager:(id)a3;
- (void)setHomeViewModel:(id)a3;
- (void)setManageStorageAppsListViewModel:(id)a3;
- (void)setServiceOwnersManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ICSiCloudAppListViewController

- (void)setAccountManager:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICSiCloudAppListViewController;
  [(ICSDataclassViewController *)&v3 setAccountManager:a3];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "ICSiCloudAppListViewController dealloc %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICSiCloudAppListViewController;
  [(ICSDataclassViewController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)ICSiCloudAppListViewController;
  [(ACUIDataclassConfigurationViewController *)&v9 viewDidAppear:a3];
  objc_super v4 = (void *)[objc_alloc(NSURL) initWithString:@"settings-navigation://com.apple.Settings.AppleAccount/ICLOUD_SERVICE/com.apple.Dataclass"];
  v5 = +[ICSDeviceExpertManager savedToiCloudTitle];
  v6 = +[ICSDeviceExpertManager appleAccountTitle];
  v10[0] = v6;
  uint64_t v7 = +[ICSDeviceExpertManager iCloudTitle];
  v10[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  [(ICSiCloudAppListViewController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.application-icon.icloud" title:v5 localizedNavigationComponents:v8 deepLink:v4];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ICSiCloudAppListViewController;
  [(ACUIDataclassConfigurationViewController *)&v5 viewDidLoad];
  [(ManageStorageAppsListViewModel *)self->_manageStorageAppsListViewModel fetchAppsListWithFetchHomeViewModel:0 loadImages:0 completionHandler:&__block_literal_global_2];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"APP_LIST_VIEW_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [(ICSiCloudAppListViewController *)self setTitle:v4];
}

void __45__ICSiCloudAppListViewController_viewDidLoad__block_invoke()
{
  v0 = LogSubsystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __45__ICSiCloudAppListViewController_viewDidLoad__block_invoke_cold_1(v0);
  }
}

- (id)dataClassSpecifierProvider
{
  dataClassSpecifierProvider = self->_dataClassSpecifierProvider;
  if (dataClassSpecifierProvider) {
    goto LABEL_4;
  }
  objc_super v4 = [(ICSiCloudAppListViewController *)self homeViewModel];

  if (v4)
  {
    objc_super v5 = [ICSDataclassSpecifierProvider alloc];
    v6 = [(ICSDataclassViewController *)self accountManager];
    uint64_t v7 = [(ICSiCloudAppListViewController *)self homeViewModel];
    v8 = [(ICSiCloudAppListViewController *)self manageStorageAppsListViewModel];
    objc_super v9 = [(ICSDataclassSpecifierProvider *)v5 initWithAccountManager:v6 presenter:self homeViewModel:v7 manageStorageAppsListViewModel:v8];
    v10 = self->_dataClassSpecifierProvider;
    self->_dataClassSpecifierProvider = v9;

    [(ICSDataclassSpecifierProvider *)self->_dataClassSpecifierProvider setDelegate:self];
    dataClassSpecifierProvider = self->_dataClassSpecifierProvider;
LABEL_4:
    v11 = dataClassSpecifierProvider;
    goto LABEL_5;
  }
  v11 = 0;
LABEL_5:

  return v11;
}

- (id)specifiers
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3))
  {
    objc_super v4 = LogSubsystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "ICSiCloudAppListViewController is loading specifiers.", buf, 2u);
    }

    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [(ICSiCloudAppListViewController *)self _specifiersForAppsGroup];
    [v5 addObjectsFromArray:v6];

    uint64_t v7 = (objc_class *)[v5 copy];
    v8 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = v7;
  }
  if ([(ICSiCloudAppListViewController *)self _shouldDisableiCloudUI])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = *(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      uint64_t v13 = *MEMORY[0x263F600A8];
      uint64_t v14 = MEMORY[0x263EFFA80];
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v15++), "setObject:forKeyedSubscript:", v14, v13, (void)v20);
        }
        while (v11 != v15);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v11);
    }
  }
  v16 = LogSubsystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v17;
    _os_log_impl(&dword_262993000, v16, OS_LOG_TYPE_DEFAULT, "ICSiCloudAppListViewController specifiers: returning %@", buf, 0xCu);
  }

  v18 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);

  return v18;
}

- (void)cleanupDataclassSpecifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = 0;

  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = 0;

  dataClassSpecifierProvider = self->_dataClassSpecifierProvider;

  [(ICSDataclassSpecifierProvider *)dataClassSpecifierProvider setSpecifiers:0];
}

- (id)_specifiersForAppsGroup
{
  appSpecifiers = self->_appSpecifiers;
  if (!appSpecifiers)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = [(ICSiCloudAppListViewController *)self dataClassSpecifierProvider];
    v6 = [v5 specifiers];
    [v4 addObjectsFromArray:v6];

    uint64_t v7 = (NSMutableArray *)[v4 copy];
    v8 = self->_appSpecifiers;
    self->_appSpecifiers = v7;

    appSpecifiers = self->_appSpecifiers;
  }

  return appSpecifiers;
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  [(ICSiCloudAppListViewController *)self cleanupDataclassSpecifiers];

  [(ICSiCloudAppListViewController *)self reloadSpecifiers];
}

- (BOOL)_shouldDisableiCloudUI
{
  uint64_t v3 = [(ICSDataclassViewController *)self account];
  if (objc_msgSend(v3, "aa_needsToVerifyTerms"))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(ICSDataclassViewController *)self account];
    if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
    {
      v6 = [(ICSDataclassViewController *)self account];
      uint64_t v7 = objc_msgSend(v6, "aa_suspensionInfo");
      char v4 = [v7 isiCloudSuspended];
    }
    else
    {
      char v4 = 1;
    }
  }
  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(ICSDataclassViewController *)self activeSpecifier];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ICSiCloudAppListViewController;
  [(ICSDataclassViewController *)&v27 accountDidChangeFromAccount:v6 toAccount:v7];
  v8 = [v6 provisionedDataclasses];
  id v9 = [v7 provisionedDataclasses];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(ICSiCloudAppListViewController *)self dataClassSpecifierProvider];
    [v11 resetAccount];

    [(ICSiCloudAppListViewController *)self cleanupDataclassSpecifiers];
    [(ICSiCloudAppListViewController *)self reloadSpecifiers];
  }
  uint64_t v12 = [v6 enabledDataclasses];
  uint64_t v13 = [v7 enabledDataclasses];
  char v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = LogSubsystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_262993000, v15, OS_LOG_TYPE_DEFAULT, "Account enabled dataclasses changed. Will reload specifiers.", v26, 2u);
    }

    if (v7)
    {
      uint64_t v16 = *MEMORY[0x263EFACB8];
      int v17 = [v6 isEnabledForDataclass:*MEMORY[0x263EFACB8]];
      if (v17 != [v7 isEnabledForDataclass:v16])
      {
        v18 = [(ICSiCloudAppListViewController *)self dataClassSpecifierProvider];
        v19 = [v18 ubiquitySpecifierProvider];
        long long v20 = [v19 ubiquityAccessManager];
        objc_msgSend(v20, "setAppAccessGranted:forBundleID:", objc_msgSend(v7, "isEnabledForDataclass:", v16), @"com.apple.mobilemail");
      }
      uint64_t v21 = *MEMORY[0x263EFAC28];
      int v22 = [v6 isEnabledForDataclass:*MEMORY[0x263EFAC28]];
      if (v22 != [v7 isEnabledForDataclass:v21])
      {
        long long v23 = [(ICSiCloudAppListViewController *)self dataClassSpecifierProvider];
        v24 = [v23 ubiquitySpecifierProvider];
        uint64_t v25 = [v24 ubiquityAccessManager];
        objc_msgSend(v25, "setAppAccessGranted:forBundleID:", objc_msgSend(v7, "isEnabledForDataclass:", v21), @"com.apple.mobilesafari");
      }
    }
  }
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
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
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_dataClassSpecifierProvider, 0);

  objc_storeStrong((id *)&self->_appSpecifiers, 0);
}

void __45__ICSiCloudAppListViewController_viewDidLoad__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_262993000, log, OS_LOG_TYPE_DEBUG, "ICSiCloudAppListViewController: Apps list request complete", v1, 2u);
}

@end