@interface ICSAppsSyncingToiCloudViewController
- (ICSAppsSyncingToiCloudViewController)initWithAccountManager:(id)a3;
- (id)_specifiersForAppsSyncingToDrive;
- (id)account;
- (id)specifiers;
- (void)dealloc;
- (void)setSpecifier:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICSAppsSyncingToiCloudViewController

- (ICSAppsSyncingToiCloudViewController)initWithAccountManager:(id)a3
{
  id v4 = a3;
  v5 = [(ICSDataclassViewController *)self init];
  v6 = v5;
  if (v5)
  {
    [(ICSDataclassViewController *)v5 setAccountManager:v4];
    v7 = [ICSAppsSyncingToDriveSpecifierProvider alloc];
    v8 = [(ICSDataclassViewController *)v6 accountManager];
    uint64_t v9 = [(ICSAppsSyncingToDriveSpecifierProvider *)v7 initWithAccountManager:v8 presenter:v6];
    appsSyncingToDriveSpecifierProvider = v6->_appsSyncingToDriveSpecifierProvider;
    v6->_appsSyncingToDriveSpecifierProvider = (ICSAppsSyncingToDriveSpecifierProvider *)v9;

    [(ICSAppsSyncingToDriveSpecifierProvider *)v6->_appsSyncingToDriveSpecifierProvider setDelegate:v6];
  }

  return v6;
}

- (id)account
{
  v2 = [(ICSDataclassViewController *)self accountManager];
  v3 = [v2 accounts];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v4;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "AAUISyncingToiCloudViewController dealloc %@", buf, 0xCu);
  }

  [(ICSAppsSyncingToDriveSpecifierProvider *)self->_appsSyncingToDriveSpecifierProvider setDelegate:0];
  appsSyncingToDriveSpecifierProvider = self->_appsSyncingToDriveSpecifierProvider;
  self->_appsSyncingToDriveSpecifierProvider = 0;

  v5.receiver = self;
  v5.super_class = (Class)ICSAppsSyncingToiCloudViewController;
  [(ICSDataclassViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)ICSAppsSyncingToiCloudViewController;
  [(ACUIDataclassConfigurationViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSAppsSyncingToiCloudViewController;
  [(ACUIDataclassConfigurationViewController *)&v7 viewWillAppear:a3];
  id v4 = [(ICSAppsSyncingToiCloudViewController *)self navigationItem];
  objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"APPS_SYNCING_TO_ICLOUD_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v4 setTitle:v6];
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICSAppsSyncingToiCloudViewController;
  [(ICSAppsSyncingToiCloudViewController *)&v11 setSpecifier:v4];
  objc_super v5 = [ICSAppsSyncingToDriveSpecifierProvider alloc];
  v6 = [(ICSDataclassViewController *)self accountManager];
  objc_super v7 = [(ICSAppsSyncingToDriveSpecifierProvider *)v5 initWithAccountManager:v6 presenter:self];
  appsSyncingToDriveSpecifierProvider = self->_appsSyncingToDriveSpecifierProvider;
  self->_appsSyncingToDriveSpecifierProvider = v7;

  [(ICSAppsSyncingToDriveSpecifierProvider *)self->_appsSyncingToDriveSpecifierProvider setDelegate:self];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"icloudAccountManager"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[ICSAppsSyncingToiCloudViewController setSpecifier:]();
  }
  if (!v9)
  {
    v10 = LogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ICSAppsSyncingToiCloudViewController setSpecifier:](v10);
    }
  }
}

- (id)specifiers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3))
  {
    id v4 = LogSubsystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "ICSAppsSyncingToiCloudViewController is loading specifiers.", (uint8_t *)&v16, 2u);
    }

    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"THIRD_PARTY_APPS"];
    objc_super v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"APPS_SYNCING_TO_ICLOUD_DESC" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    [v6 setProperty:v8 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    if (self->_appsSyncingToDriveSpecifierProvider)
    {
      uint64_t v9 = [(ICSAppsSyncingToiCloudViewController *)self _specifiersForAppsSyncingToDrive];
      [v5 addObjectsFromArray:v9];
    }
    v10 = (objc_class *)[v5 copy];
    objc_super v11 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = v10;
  }
  v12 = LogSubsystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    int v16 = 138412290;
    uint64_t v17 = v13;
    _os_log_impl(&dword_262993000, v12, OS_LOG_TYPE_DEFAULT, "ICSAppsSyncingToiCloudViewController specifiers: returning %@", (uint8_t *)&v16, 0xCu);
  }

  v14 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);

  return v14;
}

- (id)_specifiersForAppsSyncingToDrive
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_appsSyncingToDriveSpecifierProvider)
  {
    id v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"APPS SYNCING"];
    [v3 addObject:v4];

    id v5 = [(ICSAppsSyncingToDriveSpecifierProvider *)self->_appsSyncingToDriveSpecifierProvider specifiers];
    [v3 addObjectsFromArray:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsSyncingToDriveSpecifierProvider, 0);

  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
}

- (void)setSpecifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_262993000, log, OS_LOG_TYPE_FAULT, "ICSAppsSyncingToiCloudViewController was instantiated without an AIDAAccountManager set on the launching specifier.", v1, 2u);
}

- (void)setSpecifier:.cold.2()
{
}

@end