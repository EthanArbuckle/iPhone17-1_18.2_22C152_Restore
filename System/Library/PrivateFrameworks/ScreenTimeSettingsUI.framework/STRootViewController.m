@interface STRootViewController
- (BOOL)presentedAsModal;
- (BOOL)shouldRefreshUsageData;
- (STEnableScreenTimeGroupSpecifierProvider)enableScreenTimeGroupSpecifierProvider;
- (STNoUsageReportedGroupSpecifierProvider)noUsageReportedGroupSpecifierProvider;
- (STRootViewController)initWithRootViewModelCoordinator:(id)a3;
- (STRootViewController)initWithRootViewModelCoordinator:(id)a3 presentedAsModal:(BOOL)a4;
- (STScreenTimeGroupSpecifierProvider)screenTimeGroupSpecifierProvider;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_startObservingCoordinator;
- (void)_stopObservingCoordinator;
- (void)_toggleNewUsageAction:(id)a3;
- (void)dealloc;
- (void)doneButtonAction:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setShouldRefreshUsageData:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation STRootViewController

- (STRootViewController)initWithRootViewModelCoordinator:(id)a3
{
  return [(STRootViewController *)self initWithRootViewModelCoordinator:a3 presentedAsModal:0];
}

- (STRootViewController)initWithRootViewModelCoordinator:(id)a3 presentedAsModal:(BOOL)a4
{
  v42[22] = *MEMORY[0x263EF8340];
  v6 = (STRootViewModelCoordinator *)a3;
  if (!v6)
  {
    v7 = +[STUsageDetailsViewModelCoordinator defaultDeviceIdentifierForLocalUser];
    v8 = +[STUsageDetailsViewModelCoordinator defaultUsageReportTypeForLocalUser];
    v6 = [[STRootViewModelCoordinator alloc] initWithUserDSID:0 deviceIdentifier:v7 usageReportType:v8 usageContext:0];
    if (!v6)
    {
      v9 = [MEMORY[0x263F08690] currentHandler];
      v10 = [NSString stringWithUTF8String:"-[STRootViewController initWithRootViewModelCoordinator:presentedAsModal:]"];
      [v9 handleFailureInFunction:v10 file:@"STRootViewController.m" lineNumber:74 description:@"RootViewModelCoordinator could not be created. This is a fatal error for ScreenTime."];
    }
  }
  v41.receiver = self;
  v41.super_class = (Class)STRootViewController;
  v11 = [(STPINListViewController *)&v41 initWithRootViewModelCoordinator:v6];
  if (v11)
  {
    v12 = +[STScreenTimeSettingsUIBundle bundle];
    v13 = [v12 localizedStringForKey:@"ScreenTimeControllerTitle" value:&stru_26D9391A8 table:0];
    [(STRootViewController *)v11 setTitle:v13];

    v11->_presentedAsModal = a4;
    uint64_t v14 = +[STEnableScreenTimeGroupSpecifierProvider providerWithCoordinator:v6 rootViewController:v11];
    enableScreenTimeGroupSpecifierProvider = v11->_enableScreenTimeGroupSpecifierProvider;
    v11->_enableScreenTimeGroupSpecifierProvider = (STEnableScreenTimeGroupSpecifierProvider *)v14;

    uint64_t v16 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    screenTimeGroupSpecifierProvider = v11->_screenTimeGroupSpecifierProvider;
    v11->_screenTimeGroupSpecifierProvider = (STScreenTimeGroupSpecifierProvider *)v16;

    uint64_t v18 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    noUsageReportedGroupSpecifierProvider = v11->_noUsageReportedGroupSpecifierProvider;
    v11->_noUsageReportedGroupSpecifierProvider = (STNoUsageReportedGroupSpecifierProvider *)v18;

    v40 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[0] = v40;
    v42[1] = v11->_enableScreenTimeGroupSpecifierProvider;
    v39 = +[STEnableRemoteManagementGroupSpecifierProvider providerWithCoordinator:v6 rootViewController:v11];
    v42[2] = v39;
    v42[3] = v11->_screenTimeGroupSpecifierProvider;
    v38 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[4] = v38;
    v37 = +[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider providerWithCoordinator:v6 rootViewController:v11];
    v42[5] = v37;
    v36 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[6] = v36;
    v35 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[7] = v35;
    v42[8] = v11->_noUsageReportedGroupSpecifierProvider;
    v34 = +[STLimitUsageGroupSpecifierProvider providerWithCoordinator:v6 rootViewController:v11];
    v42[9] = v34;
    v33 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[10] = v33;
    v32 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[11] = v32;
    v31 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[12] = v31;
    v30 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[13] = v30;
    v29 = +[STFamilyMemberGroupSpecifierProvider providerWithCoordinator:v6 rootViewController:v11];
    v42[14] = v29;
    v20 = +[STPasscodeGroupSpecifierProvider providerWithCoordinator:v6 listController:v11];
    v42[15] = v20;
    v21 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[16] = v21;
    v22 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[17] = v22;
    v23 = +[STSetUpForFamilyGroupSpecifierProvider providerWithCoordinator:v6 presenter:v11];
    v42[18] = v23;
    v24 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[19] = v24;
    v25 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[20] = v25;
    v26 = +[STRootGroupSpecifierProvider providerWithCoordinator:v6];
    v42[21] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:22];
    [(STListViewController *)v11 setSpecifierProviders:v27];

    [(STRootViewController *)v11 _startObservingCoordinator];
  }

  return v11;
}

- (void)dealloc
{
  [(STRootViewController *)self _stopObservingCoordinator];
  v3.receiver = self;
  v3.super_class = (Class)STRootViewController;
  [(STListViewController *)&v3 dealloc];
}

- (void)setSpecifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)STRootViewController;
  [(STRootViewController *)&v22 setSpecifier:v4];
  v5 = [v4 userInfo];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 name];
    [(STRootViewController *)self setTitle:v7];

    v8 = [v6 dsid];
    v9 = +[STUsageDetailsViewModelCoordinator defaultDeviceIdentifierForChild:v8];
    v10 = +[STUsageDetailsViewModelCoordinator defaultUsageReportTypeForChild:v8];
    v11 = [(STPINListViewController *)self coordinator];
    v12 = [v11 coordinatorForChild:v6 deviceIdentifier:v9 usageReportType:v10];

    [(STRootViewController *)self _stopObservingCoordinator];
    [(STPINListViewController *)self setCoordinator:v12];
    [(STRootViewController *)self _startObservingCoordinator];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v13 = [(STListViewController *)self specifierProviders];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v17++) setCoordinator:v12];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (void)_stopObservingCoordinator
{
  id v3 = [(STPINListViewController *)self coordinator];
  [v3 removeObserver:self forKeyPath:@"usageDetailsCoordinator" context:"STRootViewControllerObservationContext"];
}

- (void)_startObservingCoordinator
{
  id v3 = [(STPINListViewController *)self coordinator];
  [(STPINListViewController *)self coordinator];

  [v3 addObserver:self forKeyPath:@"usageDetailsCoordinator" options:2 context:"STRootViewControllerObservationContext"];
}

- (void)setShouldRefreshUsageData:(BOOL)a3
{
  if (self->_shouldRefreshUsageData != a3)
  {
    BOOL v3 = a3;
    self->_shouldRefreshUsageData = a3;
    id v6 = [(STPINListViewController *)self coordinator];
    id v4 = [v6 usageDetailsCoordinator];
    v5 = v4;
    if (v3) {
      [v4 startRefreshingUsageData];
    }
    else {
      [v4 stopRefreshingUsageData];
    }
  }
}

- (void)viewDidLoad
{
  v11[1] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)STRootViewController;
  [(STRootViewController *)&v9 viewDidLoad];
  if ([(STRootViewController *)self presentedAsModal])
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonAction_];
    v11[0] = v3;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    v5 = [(STRootViewController *)self navigationItem];
    [v5 setRightBarButtonItems:v4];
  }
  else
  {
    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v7 = [v6 BOOLForKey:@"NewUsageToggle"];

    if (!v7) {
      return;
    }
    BOOL v3 = [MEMORY[0x263F827E8] systemImageNamed:@"ant"];
    id v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v3 style:0 target:self action:sel__toggleNewUsageAction_];
    v10 = v4;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
    v8 = [(STRootViewController *)self navigationItem];
    [v8 setRightBarButtonItems:v5];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STRootViewController;
  [(STPINListViewController *)&v10 viewDidAppear:a3];
  id v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.ScreenTime"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  int v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = [v7 bundleURL];
  objc_super v9 = (void *)[v5 initWithKey:@"ScreenTimeControllerTitle" table:@"Localizable" locale:v6 bundleURL:v8];

  [(STRootViewController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.screen-time" title:v9 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STRootViewController;
  [(STRootViewController *)&v9 viewWillAppear:a3];
  [(STRootViewController *)self setShouldRefreshUsageData:1];
  id v4 = [(STPINListViewController *)self coordinator];
  if ((_os_feature_enabled_impl() & 1) == 0
    && [(STRootViewController *)self isMovingToParentViewController]
    && ([v4 hasShownMiniBuddy] & 1) == 0)
  {
    id v5 = [v4 viewModel];
    if (([v5 isScreenTimeEnabled] & 1) == 0)
    {
      id v6 = [v4 viewModel];
      int v7 = [v6 canStartScreenTime];

      if (!v7) {
        goto LABEL_8;
      }
      id v5 = [(STRootViewController *)self enableScreenTimeGroupSpecifierProvider];
      [v5 setupScreenTime:0];
    }
  }
LABEL_8:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STRootViewController.viewWillAppear", v8, 2u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STRootViewController;
  [(STRootViewController *)&v5 viewWillDisappear:a3];
  [(STRootViewController *)self setShouldRefreshUsageData:0];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STRootViewController.viewWillDisappear", v4, 2u);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == "STRootViewControllerObservationContext")
  {
    id v12 = a3;
    [(STPINListViewController *)self coordinator];

    int v13 = [v12 isEqualToString:@"usageDetailsCoordinator"];
    if (v13 && [(STRootViewController *)self shouldRefreshUsageData])
    {
      uint64_t v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      uint64_t v15 = [(STPINListViewController *)self coordinator];
      uint64_t v16 = [v15 usageDetailsCoordinator];

      uint64_t v17 = [MEMORY[0x263EFF9D0] null];
      char v18 = [v17 isEqual:v14];

      if ((v18 & 1) == 0) {
        [v14 stopRefreshingUsageData];
      }
      long long v19 = [MEMORY[0x263EFF9D0] null];
      char v20 = [v19 isEqual:v16];

      if ((v20 & 1) == 0) {
        [v16 startRefreshingUsageData];
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)STRootViewController;
    id v11 = a3;
    [(STListViewController *)&v21 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)STRootViewController;
  objc_super v5 = [(STListViewController *)&v28 tableView:a3 cellForRowAtIndexPath:a4];
  id v6 = [(STRootViewController *)self noUsageReportedGroupSpecifierProvider];
  int v7 = [v6 specifiers];
  v8 = [v7 firstObject];

  objc_super v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
  if ([v5 isEqual:v9])
  {
    id v10 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.circle"];
    id v11 = [MEMORY[0x263F825C8] systemRedColor];
    id v12 = [v10 imageWithTintColor:v11];

    int v13 = [MEMORY[0x263F82818] configurationWithScale:3];
    uint64_t v14 = [v12 imageByApplyingSymbolConfiguration:v13];

    uint64_t v15 = [MEMORY[0x263F81678] textAttachmentWithImage:v14];
    uint64_t v16 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v15];
    id v17 = objc_alloc(MEMORY[0x263F089B8]);
    char v18 = [v8 objectForKeyedSubscript:*MEMORY[0x263F602C8]];
    long long v19 = [@" " stringByAppendingString:v18];
    char v20 = (void *)[v17 initWithString:v19];

    [v20 insertAttributedString:v16 atIndex:0];
    objc_super v21 = [MEMORY[0x263F82918] cellConfiguration];
    [v21 setAttributedText:v20];
    objc_super v22 = [v21 textProperties];
    [v22 setNumberOfLines:0];

    v23 = [v21 textProperties];
    [v23 setLineBreakMode:0];

    uint64_t v24 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v25 = [v21 textProperties];
    [v25 setColor:v24];

    [v5 setContentConfiguration:v21];
  }
  if ([v5 type] == 13 || objc_msgSend(v5, "type") == 6)
  {
    v26 = [v5 titleLabel];
    [v26 setNumberOfLines:0];
    [v26 setLineBreakMode:0];
  }

  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STRootViewController *)self noUsageReportedGroupSpecifierProvider];
  objc_super v9 = [v8 specifiers];
  id v10 = [v9 firstObject];

  if (v10
    && ([(STRootViewController *)self specifierAtIndexPath:v7],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqual:v10],
        v11,
        v12))
  {
    double v13 = *MEMORY[0x263F839B8];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STRootViewController;
    [(STRootViewController *)&v16 tableView:v6 heightForRowAtIndexPath:v7];
    double v13 = v14;
  }

  return v13;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__STRootViewController_handleURL_withCompletion___block_invoke;
  v9[3] = &unk_2647681B8;
  v9[4] = self;
  id v6 = a4;
  id v7 = a3;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
  v8.receiver = self;
  v8.super_class = (Class)STRootViewController;
  [(STRootViewController *)&v8 handleURL:v7 withCompletion:v6];
}

void __49__STRootViewController_handleURL_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v12 containsString:*MEMORY[0x263F67380]])
    {
      id v6 = [*(id *)(a1 + 32) coordinator];
      id v7 = [v6 usageDetailsCoordinator];
      objc_super v8 = [v7 viewModel];
      [v8 selectToday];

      *a4 = 1;
    }
    else if ([v12 containsString:*MEMORY[0x263F67388]])
    {
      objc_super v9 = [*(id *)(a1 + 32) coordinator];
      id v10 = [v9 usageDetailsCoordinator];
      id v11 = [v10 viewModel];

      [v11 setSelectedWeek:0];
      [v11 setSelectedDay:0x7FFFFFFFFFFFFFFFLL];
      *a4 = 1;
    }
  }
}

- (void)doneButtonAction:(id)a3
{
  id v3 = [(STRootViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_toggleNewUsageAction:(id)a3
{
  objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v8 BOOLForKey:0x26D942408] ^ 1;
  [v8 setBool:v4 forKey:0x26D942408];
  objc_super v5 = [(STPINListViewController *)self coordinator];
  id v6 = [v5 usageDetailsCoordinator];

  id v7 = [v6 viewModel];
  [v7 setHasDeviceActivityData:v4];

  [v6 loadViewModelWithCompletionHandler:0];
}

- (BOOL)presentedAsModal
{
  return self->_presentedAsModal;
}

- (STEnableScreenTimeGroupSpecifierProvider)enableScreenTimeGroupSpecifierProvider
{
  return (STEnableScreenTimeGroupSpecifierProvider *)objc_getProperty(self, a2, 1424, 1);
}

- (STNoUsageReportedGroupSpecifierProvider)noUsageReportedGroupSpecifierProvider
{
  return (STNoUsageReportedGroupSpecifierProvider *)objc_getProperty(self, a2, 1432, 1);
}

- (STScreenTimeGroupSpecifierProvider)screenTimeGroupSpecifierProvider
{
  return (STScreenTimeGroupSpecifierProvider *)objc_getProperty(self, a2, 1440, 1);
}

- (BOOL)shouldRefreshUsageData
{
  return self->_shouldRefreshUsageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTimeGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_noUsageReportedGroupSpecifierProvider, 0);

  objc_storeStrong((id *)&self->_enableScreenTimeGroupSpecifierProvider, 0);
}

@end