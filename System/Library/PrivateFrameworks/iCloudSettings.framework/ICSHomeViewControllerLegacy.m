@interface ICSHomeViewControllerLegacy
- (BOOL)_canHandleURL:(id)a3;
- (BOOL)_shouldDisableiCloudUI;
- (BOOL)isSecondaryAccount;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4;
- (BOOL)shouldEnableAccountSummaryCell;
- (BOOL)shouldShowiCloudDetails;
- (Class)accountInfoControllerClass;
- (ICSHomeViewControllerLegacy)init;
- (id)_iCloudBackupSpecifiers;
- (id)groupSpecifierAccountSummary;
- (id)specifiers;
- (void)_changePasswordLinkWasTapped;
- (void)_cleanupAllSpecifiers;
- (void)_cleanupiCloudSpecifiers;
- (void)_initiateSpecifiers;
- (void)_loadMailSettingsBundleIfNeeded;
- (void)cleanupDataclassSpecifiers;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setShouldShowiCloudDetails:(BOOL)a3;
- (void)specifiers;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICSHomeViewControllerLegacy

- (ICSHomeViewControllerLegacy)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICSHomeViewControllerLegacy;
  v2 = [(ICSDataclassViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFACF8], *MEMORY[0x263EFAD48], *MEMORY[0x263EFACB8], *MEMORY[0x263EFACB0], *MEMORY[0x263EFAC20], 0);
    mainViewDataclasses = v2->_mainViewDataclasses;
    v2->_mainViewDataclasses = (NSSet *)v3;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSHomeViewControllerLegacy;
  [(ACUIDataclassConfigurationViewController *)&v7 viewWillAppear:a3];
  v4 = [(ICSHomeViewControllerLegacy *)self navigationItem];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"ICLOUD_SERVICE_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v4 setTitle:v6];
}

- (void)dealloc
{
  uint64_t v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "ICSHomeViewControllerLegacy dealloc.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICSHomeViewControllerLegacy;
  [(ICSDataclassViewController *)&v4 dealloc];
}

- (Class)accountInfoControllerClass
{
  if ([(ICSHomeViewControllerLegacy *)self isSecondaryAccount]) {
    [(ICSHomeViewControllerLegacy *)self _loadMailSettingsBundleIfNeeded];
  }

  return NSClassFromString(&cfstr_Accountpsdetai.isa);
}

- (BOOL)shouldEnableAccountSummaryCell
{
  int v3 = [MEMORY[0x263F25CC8] isAccountDataclassListRedesignEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(ICSHomeViewControllerLegacy *)self isSecondaryAccount];
  }
  return v3;
}

- (void)_loadMailSettingsBundleIfNeeded
{
  v2 = MEMORY[0x263E5BB10](self, a2);
  int v3 = [v2 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/AccountSettings"];

  objc_super v4 = [v3 stringByAppendingPathComponent:@"MailAccountSettings.bundle"];
  v5 = [MEMORY[0x263F086E0] bundleWithPath:v4];
  if (([v5 isLoaded] & 1) == 0)
  {
    objc_super v6 = LogSubsystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v7 = 0;
      _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "Mail settings bundle not loaded. Loading...", v7, 2u);
    }

    [v5 load];
  }
}

- (void)setAccountManager:(id)a3
{
  id v4 = a3;
  v5 = LogSubsystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICSHomeViewControllerLegacy setAccountManager:](v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)ICSHomeViewControllerLegacy;
  [(ICSDataclassViewController *)&v6 setAccountManager:v4];

  [(ICSHomeViewControllerLegacy *)self _initiateSpecifiers];
}

- (BOOL)isSecondaryAccount
{
  int v3 = [(ICSDataclassViewController *)self account];
  if (objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x263F25618]))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = [(ICSDataclassViewController *)self account];
    int v4 = objc_msgSend(v5, "aa_isManagedAppleID") ^ 1;
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSHomeViewControllerLegacy;
  [(ICSHomeViewControllerLegacy *)&v4 traitCollectionDidChange:a3];
  [(ICSHomeViewControllerLegacy *)self reloadSpecifiers];
}

- (void)_initiateSpecifiers
{
  int v3 = [ICSHeaderSpecifierProvider alloc];
  objc_super v4 = [(ICSDataclassViewController *)self accountManager];
  v5 = [(ICSHeaderSpecifierProvider *)v3 initWithAccountManager:v4 presenter:self];
  headerSpecifierProvider = self->_headerSpecifierProvider;
  self->_headerSpecifierProvider = v5;

  [(AAUISpecifierProvider *)self->_headerSpecifierProvider setDelegate:self];
  if (![MEMORY[0x263F25CC8] isAccountDataclassListRedesignEnabled]
    || ![(ICSHomeViewControllerLegacy *)self isSecondaryAccount])
  {
    objc_super v7 = [ICSBackupSpecifierProvider alloc];
    v8 = [(ICSDataclassViewController *)self accountManager];
    v9 = [(ICSBackupSpecifierProvider *)v7 initWithAccountManager:v8 presenter:self];
    backupSpecifierProvider = self->_backupSpecifierProvider;
    self->_backupSpecifierProvider = v9;

    [(AAUISpecifierProvider *)self->_backupSpecifierProvider setDelegate:self];
  }
  v11 = [ICSDataclassSpecifierProvider alloc];
  v12 = [(ICSDataclassViewController *)self accountManager];
  v13 = [(ICSDataclassSpecifierProvider *)v11 initWithAccountManager:v12 presenter:self homeViewModel:0 manageStorageAppsListViewModel:0];
  dataClassSpecifierProvider = self->_dataClassSpecifierProvider;
  self->_dataClassSpecifierProvider = v13;

  v15 = self->_dataClassSpecifierProvider;

  [(AAUISpecifierProvider *)v15 setDelegate:self];
}

- (void)_cleanupAllSpecifiers
{
  [(ICSHomeViewControllerLegacy *)self cleanupDataclassSpecifiers];

  [(ICSHomeViewControllerLegacy *)self _cleanupiCloudSpecifiers];
}

- (void)cleanupDataclassSpecifiers
{
  [(AAUISpecifierProvider *)self->_backupSpecifierProvider setSpecifiers:0];
  deviceBackupSpecifiers = self->_deviceBackupSpecifiers;
  self->_deviceBackupSpecifiers = 0;

  [(AAUISpecifierProvider *)self->_dataClassSpecifierProvider setSpecifiers:0];
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4) = 0;
}

- (void)_cleanupiCloudSpecifiers
{
  [(AAUISpecifierProvider *)self->_headerSpecifierProvider setSpecifiers:0];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = 0;
}

- (id)specifiers
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "updating the specifiers in the iCloudVC", buf, 2u);
  }

  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4))
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (![MEMORY[0x263F25CC8] isAccountDataclassListRedesignEnabled]
      || ![(ICSHomeViewControllerLegacy *)self isSecondaryAccount])
    {
      objc_super v6 = [(AAUISpecifierProvider *)self->_headerSpecifierProvider specifiers];
      uint64_t v7 = [v6 count];

      if (v7)
      {
        v8 = [(AAUISpecifierProvider *)self->_headerSpecifierProvider specifiers];
        [v5 addObjectsFromArray:v8];
      }
    }
    v9 = [(ICSDataclassViewController *)self account];

    if (v9)
    {
      if (![MEMORY[0x263F25CC8] isAccountDataclassListRedesignEnabled]
        || ![(ICSHomeViewControllerLegacy *)self isSecondaryAccount])
      {
LABEL_15:
        v13 = [(AAUISpecifierProvider *)self->_dataClassSpecifierProvider specifiers];
        [v5 addObjectsFromArray:v13];

        v14 = [(ICSHomeViewControllerLegacy *)self _iCloudBackupSpecifiers];
        [v5 addObjectsFromArray:v14];

        v15 = [(ICSDataclassViewController *)self account];

        if (v15)
        {
          if (![MEMORY[0x263F25CC8] isAccountDataclassListRedesignEnabled]
            || ![(ICSHomeViewControllerLegacy *)self isSecondaryAccount])
          {
            goto LABEL_23;
          }
          v16 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"accountSettingsSpecifier"];
          [v5 addObject:v16];
          v17 = [(ACUIDataclassConfigurationViewController *)self specifierForAccountSettingsCell];
          [v5 addObject:v17];

          v18 = [(AAUISpecifierProvider *)self->_headerSpecifierProvider specifiers];
          uint64_t v19 = [v18 count];

          if (v19)
          {
            v20 = [(AAUISpecifierProvider *)self->_headerSpecifierProvider specifiers];
            [v5 addObjectsFromArray:v20];
          }
        }
        else
        {
          v16 = LogSubsystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[ICSHomeViewControllerLegacy specifiers](v16);
          }
        }

LABEL_23:
        v21 = (objc_class *)[v5 copy];
        v22 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4);
        *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4) = v21;

        goto LABEL_24;
      }
      v10 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
      v11 = [(ICSHomeViewControllerLegacy *)self groupSpecifierAccountSummary];

      v12 = [(ACUIDataclassConfigurationViewController *)self specifierForAccountSummaryCell];
      [v5 addObject:v11];
      [v5 addObject:v12];
    }
    else
    {
      v11 = LogSubsystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ICSHomeViewControllerLegacy specifiers](v11);
      }
    }

    goto LABEL_15;
  }
LABEL_24:
  if ([(ICSHomeViewControllerLegacy *)self _shouldDisableiCloudUI])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = *(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      uint64_t v27 = *MEMORY[0x263F600A8];
      uint64_t v28 = MEMORY[0x263EFFA80];
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v29++), "setObject:forKeyedSubscript:", v28, v27, (void)v32);
        }
        while (v25 != v29);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v25);
    }
  }
  v30 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4);

  return v30;
}

- (id)groupSpecifierAccountSummary
{
  uint64_t v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"identifier" name:0];
  if ([(ICSHomeViewControllerLegacy *)self isSecondaryAccount]
    && [MEMORY[0x263F25CC8] isAccountDataclassListRedesignEnabled])
  {
    uint64_t v4 = NSString;
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v6 = [v5 localizedStringForKey:@"PASSWORD_CHANGE_LABEL_SECONDARY_ACCOUNT" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    v9 = [v4 stringWithFormat:@"%@ %@", v6, v8];

    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    v12 = @"CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT";
  }
  else
  {
    v13 = NSString;
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"PASSWORD_CHANGE_LABEL" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CHANGE_PASSWORD_LINK" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    v9 = [v13 stringWithFormat:@"%@ %@", v15, v17];

    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    v12 = @"CHANGE_PASSWORD_LINK";
  }
  v18 = [v10 localizedStringForKey:v12 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  v25.location = [v9 rangeOfString:v18];
  uint64_t v19 = NSStringFromRange(v25);
  [v3 setProperty:v19 forKey:*MEMORY[0x263F600D0]];

  [v3 setProperty:v9 forKey:*MEMORY[0x263F600F8]];
  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  [v3 setProperty:v21 forKey:*MEMORY[0x263F600C0]];

  [v3 setProperty:v9 forKey:*MEMORY[0x263F600E8]];
  v22 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v3 setProperty:v22 forKey:*MEMORY[0x263F600E0]];

  [v3 setProperty:@"_changePasswordLinkWasTapped" forKey:*MEMORY[0x263F600C8]];

  return v3;
}

- (void)_changePasswordLinkWasTapped
{
  id v3 = [NSURL URLWithString:@"https://appleid.apple.com"];
  v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 openURL:v3 withCompletionHandler:0];
}

- (BOOL)_shouldDisableiCloudUI
{
  id v3 = [(ICSDataclassViewController *)self account];
  if (objc_msgSend(v3, "aa_needsToVerifyTerms"))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(ICSDataclassViewController *)self account];
    if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
    {
      objc_super v6 = [(ICSDataclassViewController *)self account];
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

- (id)_iCloudBackupSpecifiers
{
  v15[2] = *MEMORY[0x263EF8340];
  if (!self->_deviceBackupSpecifiers)
  {
    id v3 = [(AAUISpecifierProvider *)self->_backupSpecifierProvider specifiers];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x263F5FC40];
      objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = [v6 localizedStringForKey:@"DEVICE_BACKUP_GROUP_NAME" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      v8 = [v5 groupSpecifierWithName:v7];

      v15[0] = v8;
      v9 = [(AAUISpecifierProvider *)self->_backupSpecifierProvider specifiers];
      v10 = [v9 firstObject];
      v15[1] = v10;
      v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
      deviceBackupSpecifiers = self->_deviceBackupSpecifiers;
      self->_deviceBackupSpecifiers = v11;
    }
  }
  v13 = self->_deviceBackupSpecifiers;

  return v13;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = LogSubsystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [(ICSHomeViewControllerLegacy *)self navigationController];
    uint64_t v7 = @"NO";
    if (!v6) {
      uint64_t v7 = @"YES";
    }
    int v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_262993000, v5, OS_LOG_TYPE_DEFAULT, "shouldDeferPush? %@", (uint8_t *)&v11, 0xCu);
  }
  v8 = [(ICSHomeViewControllerLegacy *)self navigationController];
  BOOL v9 = v8 == 0;

  return v9;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  v8 = LogSubsystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[ICSHomeViewControllerLegacy handleURL:withCompletion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "%s handleURL with dictionary - %@", buf, 0x16u);
  }

  BOOL v9 = [v6 objectForKeyedSubscript:@"showiCloudDetails"];
  [(ICSHomeViewControllerLegacy *)self setShouldShowiCloudDetails:v9 != 0];

  if ([(ICSHomeViewControllerLegacy *)self _canHandleURL:v6])
  {
    v7[2](v7);
    uint64_t v10 = [(ICSHomeViewControllerLegacy *)self presentedViewController];
    if (v10)
    {
      int v11 = (void *)v10;
      v12 = [(ICSHomeViewControllerLegacy *)self presentedViewController];
      uint64_t v13 = [v12 parentViewController];

      if (!v13)
      {
        v14 = [(ICSHomeViewControllerLegacy *)self presentedViewController];
        [v14 dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
  else
  {
    v15 = LogSubsystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v15, OS_LOG_TYPE_DEFAULT, "Calling superclass handleURL.", buf, 2u);
    }

    v16.receiver = self;
    v16.super_class = (Class)ICSHomeViewControllerLegacy;
    [(ICSHomeViewControllerLegacy *)&v16 handleURL:v6 withCompletion:v7];
  }
}

- (BOOL)_canHandleURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(AAUISpecifierProvider *)self->_headerSpecifierProvider handleURL:v4])
  {
    id v5 = LogSubsystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[ICSHomeViewControllerLegacy _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s Header specifier provider handled url: %@";
LABEL_9:
      _os_log_impl(&dword_262993000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ![(AAUISpecifierProvider *)self->_dataClassSpecifierProvider handleURL:v4])
    {
      BOOL v7 = 0;
      goto LABEL_12;
    }
    id v5 = LogSubsystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[ICSHomeViewControllerLegacy _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s iCloud specifier provider handled url: %@";
      goto LABEL_9;
    }
  }

  BOOL v7 = 1;
LABEL_12:

  return v7;
}

- (BOOL)shouldShowiCloudDetails
{
  return self->_shouldShowiCloudDetails;
}

- (void)setShouldShowiCloudDetails:(BOOL)a3
{
  self->_shouldShowiCloudDetails = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainViewDataclasses, 0);
  objc_storeStrong((id *)&self->_deviceBackupSpecifiers, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_dataClassSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_backupSpecifierProvider, 0);

  objc_storeStrong((id *)&self->_headerSpecifierProvider, 0);
}

- (void)setAccountManager:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_262993000, log, OS_LOG_TYPE_DEBUG, "ICSHomeViewControllerLegacy - setting account manager", v1, 2u);
}

- (void)specifiers
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_262993000, log, OS_LOG_TYPE_ERROR, "Account is nil, not displaying account summary cell.", v1, 2u);
}

@end