@interface ICSDataclassDetailSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_shouldShowSyncingToDriveGroupSpecifier;
- (BOOL)isDataclassLDMDisabled;
- (Class)_cloudMessageDetailControllerClass;
- (ICSDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3;
- (ICSDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (NSString)dataclass;
- (id)_fetchNumberOfAppsSyncingToDrive:(id)a3;
- (id)_fetchStorageUsed:(id)a3;
- (id)_headerGroupSpecifiers;
- (id)_iconForDataclass:(id)a3;
- (id)_loadHealthSpecifierProvider;
- (id)_specifierAttributedLink;
- (id)_specifierForHealth;
- (id)_specifierSubTitle;
- (id)_specifierSwitchState:(id)a3;
- (id)_specifierTitle;
- (id)_storageUsedGroupSpecifiers;
- (id)_switchSpecifierWithTitle:(id)a3;
- (id)_syncingToDriveGroupSpecifiers;
- (id)_toggleValue:(id)a3;
- (id)account;
- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4;
- (id)ubiquityProviderGetAccountOperationsHelper;
- (void)_fetchStorageUsedAndRefreshSpecifier;
- (void)_setValue:(id)a3 forSpecifier:(id)a4;
- (void)_setupAppsSyncingToDriveSpecifier:(id)a3;
- (void)_setupStorageUsedSpecifier:(id)a3;
- (void)_storageUsedWasTapped:(id)a3;
- (void)dealloc;
- (void)setDataclass:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)ubiquityProviderShowViewController:(id)a3;
@end

@implementation ICSDataclassDetailSpecifierProvider

- (ICSDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(ICSDataclassDetailSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (ICSDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICSDataclassDetailSpecifierProvider;
  v9 = [(ICSDataclassDetailSpecifierProvider *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_presenter, v8);
    *(void *)&v10->_isStorageUsedRequestInProgress = 0xFFFFFFFF00000000;
    v11 = [_TtC14iCloudSettings22ICSAnalyticsController alloc];
    v12 = [v7 accounts];
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
    uint64_t v14 = [(ICSAnalyticsController *)v11 initWithAccount:v13];
    analyticsController = v10->_analyticsController;
    v10->_analyticsController = (_TtC14iCloudSettings22ICSAnalyticsController *)v14;

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v10 selector:sel__fetchStorageUsedAndRefreshSpecifier name:*MEMORY[0x263F88858] object:0];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSDataclassDetailSpecifierProvider;
  [(ICSDataclassDetailSpecifierProvider *)&v4 dealloc];
}

- (void)setDataclass:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_dataclass, a3);
  if ([(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263EFAC90]])
  {
    v5 = [(ICSDataclassDetailSpecifierProvider *)self _loadHealthSpecifierProvider];
    healthSpecifierProvider = self->_healthSpecifierProvider;
    self->_healthSpecifierProvider = v5;
  }
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (void)setSpecifiers:(id)a3
{
  objc_super v4 = (NSArray *)a3;
  appCloudStorage = self->_appCloudStorage;
  self->_appCloudStorage = 0;

  specifiers = self->_specifiers;
  self->_specifiers = v4;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    if (self->_dataclass)
    {
      id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
      v5 = [(ICSDataclassDetailSpecifierProvider *)self _headerGroupSpecifiers];
      [v4 addObjectsFromArray:v5];

      v6 = [(ICSDataclassDetailSpecifierProvider *)self _storageUsedGroupSpecifiers];
      [v4 addObjectsFromArray:v6];

      if ([(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263EFAD48]])
      {
        id v7 = [(ICSDataclassDetailSpecifierProvider *)self account];
        int v8 = [v7 isEnabledForDataclass:self->_dataclass];

        if (v8)
        {
          v9 = [(ICSDataclassDetailSpecifierProvider *)self _syncingToDriveGroupSpecifiers];
          [v4 addObjectsFromArray:v9];
        }
      }
      v10 = (NSArray *)[v4 copy];
      v11 = self->_specifiers;
      self->_specifiers = v10;

      specifiers = self->_specifiers;
    }
    else
    {
      specifiers = 0;
    }
  }

  return specifiers;
}

- (id)_headerGroupSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DATACLASS_HEADER_GROUP"];
  [v3 addObject:v4];

  v5 = (void *)MEMORY[0x263F5FC40];
  v6 = [(ICSDataclassDetailSpecifierProvider *)self _specifierTitle];
  id v7 = [v5 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  int v8 = [(ICSDataclassDetailSpecifierProvider *)self _specifierTitle];
  [v7 setProperty:v8 forKey:*MEMORY[0x263F602D0]];

  v9 = [(ICSDataclassDetailSpecifierProvider *)self _specifierSubTitle];
  [v7 setProperty:v9 forKey:*MEMORY[0x263F602C8]];

  v10 = [(ICSDataclassDetailSpecifierProvider *)self _specifierAttributedLink];
  [v7 setProperty:v10 forKey:@"AAUIDataclassAttributedLink"];

  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"LEARN_MORE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v7 setObject:v12 forKeyedSubscript:@"AAUIDataclassAttributedLinkText"];

  [v7 setProperty:&unk_270E05BB8 forKey:*MEMORY[0x263F5FEF0]];
  v13 = [(ICSDataclassDetailSpecifierProvider *)self _iconForDataclass:self->_dataclass];
  [v7 setProperty:v13 forKey:*MEMORY[0x263F60140]];

  [v3 addObject:v7];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DATACLASS_CELL_TITLE"];
  v16 = [v14 localizedStringForKey:v15 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  if ([(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263EFAD48]])
  {
    v17 = [[ICSUbiquitySpecifierProvider alloc] initWithAccountManager:self->_accountManager];
    ubiquitySpecifierProvider = self->_ubiquitySpecifierProvider;
    self->_ubiquitySpecifierProvider = v17;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider setDelegate:WeakRetained];

    [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider setUbiquityDelegate:self];
    v20 = [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider ubiquityDataclassSwitchSpecifier];
    if (!v20) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  uint64_t v21 = *MEMORY[0x263EFAC90];
  if ([(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263EFAC90]])
  {
    v20 = [(ICSDataclassDetailSpecifierProvider *)self _specifierForHealth];
    [v20 setName:v16];
    if (!v20)
    {
LABEL_6:
      uint64_t v21 = *MEMORY[0x263EFAC90];
      goto LABEL_7;
    }
LABEL_9:
    [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    [v3 addObject:v20];

    goto LABEL_10;
  }
LABEL_7:
  if (![(NSString *)self->_dataclass isEqualToString:v21])
  {
    v20 = [(ICSDataclassDetailSpecifierProvider *)self _switchSpecifierWithTitle:v16];
    if (v20) {
      goto LABEL_9;
    }
  }
LABEL_10:
  v22 = (void *)[v3 copy];

  return v22;
}

- (id)_switchSpecifierWithTitle:(id)a3
{
  id v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:a3 target:self set:sel__setValue_forSpecifier_ get:sel__toggleValue_ detail:0 cell:6 edit:0];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ICSDataclassDetailSpecifierProvider isDataclassLDMDisabled](self, "isDataclassLDMDisabled") ^ 1);
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v4 setObject:self->_dataclass forKeyedSubscript:*MEMORY[0x263F60138]];
  [v4 setObject:self->_dataclass forKeyedSubscript:@"com.apple.accountsui.dataclass"];

  return v4;
}

- (BOOL)isDataclassLDMDisabled
{
  id v3 = [MEMORY[0x263F526E8] shared];
  int v4 = [v3 enabled];

  return v4 && [(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263EFB448]];
}

- (id)_iconForDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263EFAC90];
  if ([(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263EFAC90]]
    && ([MEMORY[0x263F25810] sharedManager],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 appIsNeitherInstalledOrPlaceholder:v5],
        v6,
        v7))
  {
    int v8 = +[ICSDefaultIconLoader iconWithType:size:drawBorder:](ICSDefaultIconLoader, "iconWithType:size:drawBorder:", 1, 1, 120.0, 120.0);
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x263F827E8];
    v10 = [MEMORY[0x263F25810] sharedManager];
    v11 = [v10 appBundleIdentifierForDataclass:v4];
    int v8 = [v9 imageForDataclassWithBundleID:v11];

    if (v8) {
      goto LABEL_7;
    }
  }
  int v8 = objc_msgSend(MEMORY[0x263F5FC40], "acui_iconForDataclass:", self->_dataclass);
LABEL_7:

  return v8;
}

- (id)_storageUsedGroupSpecifiers
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"STORAGE_USED" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:sel__fetchStorageUsed_ detail:0 cell:-1 edit:0];

  [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
  [(ICSDataclassDetailSpecifierProvider *)self _setupStorageUsedSpecifier:v6];
  int v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DATACLASS_STORAGE_USED_GROUP"];
  v10[0] = v7;
  v10[1] = v6;
  int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  return v8;
}

- (void)_setupStorageUsedSpecifier:(id)a3
{
  id v4 = a3;
  appCloudStorage = self->_appCloudStorage;
  if (appCloudStorage)
  {
    v6 = [(ICQAppCloudStorage *)appCloudStorage storageUsed];
    uint64_t v7 = [v6 longLongValue];

    if (v7 < 1)
    {
      [v4 setCellType:-1];
      [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
      [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F60020]];
    }
    else
    {
      [v4 setCellType:2];
      [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
      [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F60020]];
      if ([(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263EFACC8]])
      {
        objc_msgSend(v4, "setDetailControllerClass:", -[ICSDataclassDetailSpecifierProvider _cloudMessageDetailControllerClass](self, "_cloudMessageDetailControllerClass"));
      }
      else
      {
        if ([(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263EFAC90]])
        {
          uint64_t v12 = 0;
          v13 = &v12;
          uint64_t v14 = 0x2050000000;
          v9 = (void *)getHKHealthManageStorageViewControllerClass_softClass;
          uint64_t v15 = getHKHealthManageStorageViewControllerClass_softClass;
          if (!getHKHealthManageStorageViewControllerClass_softClass)
          {
            v11[0] = MEMORY[0x263EF8330];
            v11[1] = 3221225472;
            v11[2] = __getHKHealthManageStorageViewControllerClass_block_invoke;
            v11[3] = &unk_2655B59A0;
            v11[4] = &v12;
            __getHKHealthManageStorageViewControllerClass_block_invoke((uint64_t)v11);
            v9 = (void *)v13[3];
          }
          id v10 = v9;
          _Block_object_dispose(&v12, 8);
          [v4 setDetailControllerClass:v10];
        }
        [v4 setControllerLoadAction:sel__storageUsedWasTapped_];
      }
    }
  }
  else
  {
    [v4 setCellType:2];
    [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
    int v8 = [NSNumber numberWithInt:!self->_storageUsedRequestDidError];
    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x263F60020]];
  }
}

- (void)_setupAppsSyncingToDriveSpecifier:(id)a3
{
  id v4 = a3;
  int numberOfAppsSyncingToDrive = self->_numberOfAppsSyncingToDrive;
  id v10 = v4;
  if (numberOfAppsSyncingToDrive >= 1)
  {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
    v6 = v10;
    uint64_t v7 = 2;
LABEL_3:
    [v6 setCellType:v7];
    [v10 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F60020]];
    goto LABEL_6;
  }
  uint64_t v8 = *MEMORY[0x263F600A8];
  if (!numberOfAppsSyncingToDrive)
  {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v8];
    v6 = v10;
    uint64_t v7 = -1;
    goto LABEL_3;
  }
  [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v8];
  [v10 setCellType:2];
  v9 = [NSNumber numberWithInt:!self->_appsSyncingToDriveRequestDidError];
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x263F60020]];

LABEL_6:
}

- (id)_syncingToDriveGroupSpecifiers
{
  v10[2] = *MEMORY[0x263EF8340];
  if ([(ICSDataclassDetailSpecifierProvider *)self _shouldShowSyncingToDriveGroupSpecifier])
  {
    id v3 = (void *)MEMORY[0x263F5FC40];
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"APPS_SYNCING_TO_DRIVE_SPECIFIER_NAME" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:sel__fetchNumberOfAppsSyncingToDrive_ detail:objc_opt_class() cell:2 edit:0];

    [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
    [(ICSDataclassDetailSpecifierProvider *)self _setupAppsSyncingToDriveSpecifier:v6];
    [v6 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    uint64_t v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DATACLASS_DRIVE_GROUP"];
    v10[0] = v7;
    v10[1] = v6;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (BOOL)_shouldShowSyncingToDriveGroupSpecifier
{
  id v3 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  uint64_t v5 = [MEMORY[0x263F25810] sharedManager];
  if ([v5 shouldShowDataclass:self->_dataclass forAccount:v4]) {
    char v6 = objc_msgSend(v4, "aa_isAccountClass:", *MEMORY[0x263F25618]);
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)_toggleValue:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && (id v7 = objc_loadWeakRetained((id *)&self->_delegate),
        int v8 = [v7 specifierProvider:self isDataclassAvailableForSpecifier:v4],
        v7,
        v8))
  {
    v9 = NSNumber;
    id v10 = [(ICSDataclassDetailSpecifierProvider *)self account];
    v11 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isEnabledForDataclass:", self->_dataclass));
  }
  else
  {
    v11 = (void *)MEMORY[0x263EFFA80];
  }

  return v11;
}

- (id)_specifierTitle
{
  v2 = +[ICSDataclassHelper localizedTitleForDataclass:self->_dataclass];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v5 localizedStringForKey:@"UNDEFINED_DATACLASS" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  }

  return v4;
}

- (id)_specifierSubTitle
{
  id v3 = [(ICSDataclassDetailSpecifierProvider *)self account];
  uint64_t v4 = objc_msgSend(v3, "ams_securityLevel");

  dataclass = self->_dataclass;
  char v6 = [(ICSDataclassDetailSpecifierProvider *)self account];
  id v7 = +[ICSDataclassHelper localizedSubTitleForDataclass:dataclass idmsAccount:v6 securityLevel:v4];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v9 localizedStringForKey:@"UNDEFINED_DATACLASS" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  }

  return v8;
}

- (id)_specifierAttributedLink
{
  v2 = +[ICSDataclassHelper attributedLinkForDataclass:self->_dataclass];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v5 localizedStringForKey:@"UNDEFINED_DATACLASS" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  }

  return v4;
}

- (id)_fetchNumberOfAppsSyncingToDrive:(id)a3
{
  id v4 = a3;
  if (self->_appsSyncingToDrive)
  {
    uint64_t v5 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%d", self->_numberOfAppsSyncingToDrive);
  }
  else
  {
    if (!self->_isAppsSyncingToDriveRequestInProgress && !self->_appsSyncingToDriveRequestDidError)
    {
      self->_isAppsSyncingToDriveRequestInProgress = 1;
      id v6 = objc_alloc(MEMORY[0x263F888D0]);
      id v7 = [(ICSDataclassDetailSpecifierProvider *)self account];
      id v8 = (void *)[v6 initWithAccount:v7];

      [v8 setShouldIgnoreCache:1];
      id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke;
      v14[3] = &unk_2655B5928;
      v14[4] = self;
      id v15 = v9;
      id v16 = v10;
      id v17 = v4;
      id v11 = v10;
      id v12 = v9;
      [v8 fetchAppsSyncingToiCloudDriveWithCompletion:v14];
    }
    uint64_t v5 = 0;
  }

  return v5;
}

void __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 65) = 0;
  if (v7)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 67) = 1;
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
    id v8 = [v6 apps];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke_2;
    v13[3] = &unk_2655B5638;
    id v14 = *(id *)(a1 + 40);
    [v8 enumerateObjectsUsingBlock:v13];

    id v9 = *(void **)(a1 + 48);
    id v10 = [*(id *)(*(void *)(a1 + 32) + 48) appsUsingUbiquity];
    [v9 addObjectsFromArray:v10];

    [*(id *)(a1 + 48) intersectSet:*(void *)(a1 + 40)];
    *(_DWORD *)(*(void *)(a1 + 32) + 68) = [*(id *)(a1 + 48) count];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke_3;
  block[3] = &unk_2655B5900;
  block[4] = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 containerID];
  [v3 addObject:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v4 bundleIds];

  [v6 addObjectsFromArray:v7];
}

void __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupAppsSyncingToDriveSpecifier:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained reloadSpecifierForProvider:*(void *)(a1 + 32) identifier:@"DATACLASS_DRIVE_GROUP"];
}

- (id)_fetchStorageUsed:(id)a3
{
  id v4 = a3;
  appCloudStorage = self->_appCloudStorage;
  if (appCloudStorage)
  {
    id v6 = [(ICQAppCloudStorage *)appCloudStorage storageUsed];
    [v6 longLongValue];

    id v7 = NSLocalizedFileSizeDescription();
  }
  else
  {
    if (!self->_isStorageUsedRequestInProgress && !self->_storageUsedRequestDidError)
    {
      self->_isStorageUsedRequestInProgress = 1;
      self->_storageUsedRequestDidError = 0;
      id v8 = objc_alloc(MEMORY[0x263F888D0]);
      id v9 = [(ICSDataclassDetailSpecifierProvider *)self account];
      id v10 = (void *)[v8 initWithAccount:v9];

      [v10 setShouldIgnoreCache:1];
      id v11 = [MEMORY[0x263F25810] sharedManager];
      id v12 = [v11 appBundleIdentifierForDataclass:self->_dataclass];

      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke;
      v14[3] = &unk_2655B5950;
      v14[4] = self;
      id v15 = v4;
      [v10 fetchStorageByApp:v12 completion:v14];
    }
    id v7 = 0;
  }

  return v7;
}

void __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = LogSubsystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke_cold_1((uint64_t)v6, (uint64_t)v7, v8);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v7) {
    *(unsigned char *)(v9 + 66) = 1;
  }
  else {
    objc_storeStrong((id *)(v9 + 24), a2);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke_117;
  v11[3] = &unk_2655B5900;
  id v10 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke_117(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupStorageUsedSpecifier:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained reloadSpecifierForProvider:*(void *)(a1 + 32) identifier:@"DATACLASS_STORAGE_USED_GROUP"];
}

- (void)_fetchStorageUsedAndRefreshSpecifier
{
  id v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "_fetchStorageUsedAndRefreshSpecifier", v8, 2u);
  }

  specifiers = self->_specifiers;
  if (specifiers)
  {
    uint64_t v5 = [(NSArray *)specifiers specifierForID:@"DATACLASS_STORAGE_USED_GROUP"];
    if (v5)
    {
      appCloudStorage = self->_appCloudStorage;
      self->_appCloudStorage = 0;

      id v7 = [(ICSDataclassDetailSpecifierProvider *)self _fetchStorageUsed:v5];
    }
  }
}

- (void)_setValue:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F60138]];
  int v9 = [v8 isEqualToString:*MEMORY[0x263EFAC90]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = WeakRetained;
  if (v9)
  {
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      id v16 = __62__ICSDataclassDetailSpecifierProvider__setValue_forSpecifier___block_invoke;
      id v17 = &unk_2655B5978;
      id v18 = v7;
      id v19 = v6;
      [v13 validateDataclassAccessForProvider:self specifier:v18 completion:&v14];
    }
  }
  else
  {
    [WeakRetained specifierProvider:self dataclassSwitchStateDidChange:v6 withSpecifier:v7];
  }
  -[ICSAnalyticsController sendToggleEventForDataclassID:actionType:enabled:](self->_analyticsController, "sendToggleEventForDataclassID:actionType:enabled:", v8, 0, objc_msgSend(v6, "BOOLValue", v14, v15, v16, v17));
}

uint64_t __62__ICSDataclassDetailSpecifierProvider__setValue_forSpecifier___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "ics_performSuperSetterWithValue:", *(void *)(result + 40));
  }
  return result;
}

- (void)_storageUsedWasTapped:(id)a3
{
  id v4 = (void *)MEMORY[0x263F25810];
  id v5 = a3;
  id v6 = [v4 sharedManager];
  id v13 = [v6 appBundleIdentifierForDataclass:self->_dataclass];

  id v7 = [ICSManageStorageDrilldownController alloc];
  id v8 = [(ICSDataclassDetailSpecifierProvider *)self account];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  id v10 = [WeakRetained navigationController];
  id v11 = [(ICSManageStorageDrilldownController *)v7 initWithAppBundleID:v13 account:v8 navigationController:v10];
  manageStorageController = self->_manageStorageController;
  self->_manageStorageController = v11;

  [(ICSManageStorageDrilldownController *)self->_manageStorageController beginLoadingForSpecifier:v5];
}

- (id)_specifierForHealth
{
  id v3 = [(AAUISpecifierProvider *)self->_healthSpecifierProvider specifiers];
  id v4 = [v3 firstObject];

  objc_msgSend(v4, "ics_overrideAccessorsWithTarget:getter:setter:", self, sel__specifierSwitchState_, sel__setValue_forSpecifier_);

  return v4;
}

- (id)_specifierSwitchState:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained specifierProvider:self isDataclassAvailableForSpecifier:v4])
  {
    id v6 = objc_msgSend(v4, "ics_performSuperGetter");
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA80];
  }

  return v6;
}

- (id)_loadHealthSpecifierProvider
{
  id v3 = objc_msgSend(MEMORY[0x263F086E0], "ics_loadBundle:atPath:", @"HealthDataclassOwnerPlugin.bundle", @"System/Library/Accounts/DataclassOwners");
  id v4 = [(ICSDataclassDetailSpecifierProvider *)self loadSpecifierProviderWithClassName:@"HKHealthDataclassSpecifierProvider" inBundle:v3];

  return v4;
}

- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  id v5 = NSClassFromString((NSString *)a3);
  if ([(objc_class *)v5 conformsToProtocol:&unk_270E21F68])
  {
    id v6 = (void *)[[v5 alloc] initWithAccountManager:self->_accountManager];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 setDelegate:WeakRetained];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (Class)_cloudMessageDetailControllerClass
{
  id v2 = (id)objc_msgSend(MEMORY[0x263F086E0], "ics_loadBundle:atPath:", @"CKStoragePlugin.bundle", @"System/Library/PreferenceBundles/StoragePlugins");

  return NSClassFromString(&cfstr_Ckcloudmessage.isa);
}

- (id)ubiquityProviderGetAccountOperationsHelper
{
  p_presenter = &self->_presenter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = objc_loadWeakRetained((id *)p_presenter);
    id v6 = [v5 accountOperationsHelper];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)ubiquityProviderShowViewController:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained specifierProvider:self showViewController:v5];
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_healthSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_manageStorageController, 0);
  objc_storeStrong((id *)&self->_appsSyncingToDrive, 0);
  objc_storeStrong((id *)&self->_appCloudStorage, 0);
  objc_destroyWeak((id *)&self->_presenter);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_262993000, log, OS_LOG_TYPE_DEBUG, "Fetched storage used: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

@end