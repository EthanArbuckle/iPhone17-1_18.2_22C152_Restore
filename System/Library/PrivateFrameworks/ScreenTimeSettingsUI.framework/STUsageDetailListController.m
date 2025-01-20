@interface STUsageDetailListController
+ (id)_getDevicesDropDownMenuWithCoordinator:(id)a3 viewController:(id)a4;
+ (id)_getUIActionForDevice:(id)a3 deviceIndentifier:(id)a4 coordinator:(id)a5 weakSelf:(id)a6;
+ (void)_setSelectedDeviceIdentifier:(id)a3 coordinator:(id)a4;
+ (void)_setSelectedUsageReportType:(unint64_t)a3 user:(id)a4;
+ (void)selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4 datePickerBar:(id)a5 coordinator:(id)a6;
- (BOOL)isDatePickerHidden;
- (NSLayoutConstraint)datePickerBottomConstraint;
- (NSLayoutConstraint)datePickerTopConstraint;
- (STAllowanceProgressGroupSpecifierProvider)allowancesProvider;
- (STDatePickerBar)datePickerBar;
- (STDevicePickupsUsageGroupSpecifierProvider)pickupsProvider;
- (STMostUsedGroupSpecifierProvider)mostUsedProvider;
- (STNoUsageDataView)noUsageDataView;
- (STNotificationsUsageGroupSpecifierProvider)notificationsProvider;
- (STScreenTimeUsageGroupSpecifierProvider)screenTimeProvider;
- (STSegmentedControlGroupSpecifierProvider)segmentedControlProvider;
- (STTestGroupSpecifierProvider)testProvider;
- (void)_devicesDidChangeFrom:(id)a3 to:(id)a4;
- (void)_hasUsageDataDidChange:(BOOL)a3;
- (void)_isCloudSyncEnabledDidChangeFrom:(id)a3 to:(id)a4;
- (void)_reportCoreAnalyticsEventWithUser:(id)a3 currentDate:(id)a4 calendar:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAllowancesProvider:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDatePickerBar:(id)a3;
- (void)setDatePickerBottomConstraint:(id)a3;
- (void)setDatePickerHidden:(BOOL)a3;
- (void)setDatePickerTopConstraint:(id)a3;
- (void)setMostUsedProvider:(id)a3;
- (void)setNoUsageDataView:(id)a3;
- (void)setNotificationsProvider:(id)a3;
- (void)setPickupsProvider:(id)a3;
- (void)setScreenTimeProvider:(id)a3;
- (void)setSegmentedControlProvider:(id)a3;
- (void)setTestProvider:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation STUsageDetailListController

- (void)dealloc
{
  v3 = [(STPINListViewController *)self coordinator];
  [v3 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" context:"KVOContextUsageDetailListController"];
  [v3 removeObserver:self forKeyPath:@"usageDetailsCoordinator.devices" context:"KVOContextUsageDetailListController"];
  [v3 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedItemDisplayName" context:"KVOContextUsageDetailListController"];
  [v3 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" context:"KVOContextUsageDetailListController"];
  [v3 removeObserver:self forKeyPath:@"viewModel.isCloudSyncEnabled" context:"KVOContextUsageDetailListController"];

  v4.receiver = self;
  v4.super_class = (Class)STUsageDetailListController;
  [(STListViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v46[7] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(STPINListViewController *)self coordinator];
  uint64_t v4 = +[STUsageGroupSpecifierProvider providerWithCoordinator:v3];
  [(STUsageDetailListController *)self setTestProvider:v4];
  uint64_t v5 = +[STUsageGroupSpecifierProvider providerWithCoordinator:v3];
  [(STUsageDetailListController *)self setSegmentedControlProvider:v5];
  uint64_t v6 = +[STUsageGroupSpecifierProvider providerWithCoordinator:v3];
  [(STUsageDetailListController *)self setScreenTimeProvider:v6];
  uint64_t v7 = +[STUsageGroupSpecifierProvider providerWithCoordinator:v3];
  [(STUsageDetailListController *)self setAllowancesProvider:v7];
  uint64_t v8 = +[STUsageGroupSpecifierProvider providerWithCoordinator:v3];
  [(STUsageDetailListController *)self setMostUsedProvider:v8];
  uint64_t v9 = +[STUsageGroupSpecifierProvider providerWithCoordinator:v3];
  [(STUsageDetailListController *)self setPickupsProvider:v9];
  v42 = (void *)v3;
  uint64_t v10 = +[STUsageGroupSpecifierProvider providerWithCoordinator:v3];
  [(STUsageDetailListController *)self setNotificationsProvider:v10];
  v40 = (void *)v5;
  v41 = (void *)v4;
  v46[0] = v4;
  v46[1] = v5;
  v38 = (void *)v7;
  v39 = (void *)v6;
  v46[2] = v6;
  v46[3] = v7;
  v36 = (void *)v9;
  v37 = (void *)v8;
  v46[4] = v8;
  v46[5] = v9;
  v35 = (void *)v10;
  v46[6] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:7];
  [(STListViewController *)self setSpecifierProviders:v11];

  v44.receiver = self;
  v44.super_class = (Class)STUsageDetailListController;
  [(STUsageDetailListController *)&v44 viewDidLoad];
  v12 = [STNoUsageDataView alloc];
  v13 = [(STNoUsageDataView *)v12 initWithPreferredFontTextStyle:*MEMORY[0x263F83570]];
  [(STNoUsageDataView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v34 = v13;
  [(STUsageDetailListController *)self setNoUsageDataView:v13];
  v14 = objc_opt_new();
  v15 = [(STPINListViewController *)self coordinator];
  [v14 updateWithCoordinator:v15];

  [(STUsageDetailListController *)self setDatePickerBar:v14];
  v16 = [(STUsageDetailListController *)self view];
  [v16 addSubview:v14];
  v17 = [v16 readableContentGuide];
  uint64_t v18 = [v17 topAnchor];

  v19 = [v14 topAnchor];
  uint64_t v20 = [v19 constraintEqualToAnchor:v18];

  v32 = (void *)v20;
  [(STUsageDetailListController *)self setDatePickerTopConstraint:v20];
  v21 = [v14 bottomAnchor];
  v33 = (void *)v18;
  uint64_t v22 = [v21 constraintEqualToAnchor:v18];

  [(STUsageDetailListController *)self setDatePickerBottomConstraint:v22];
  v23 = (void *)MEMORY[0x263F08938];
  v31 = (void *)v22;
  v45[0] = v22;
  v24 = [v14 leadingAnchor];
  v25 = [v16 leadingAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v45[1] = v26;
  v27 = [v14 trailingAnchor];
  v28 = [v16 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v45[2] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
  [v23 activateConstraints:v30];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewDidLoad", buf, 2u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)STUsageDetailListController;
  [(STUsageDetailListController *)&v12 viewWillAppear:a3];
  uint64_t v4 = [(STPINListViewController *)self coordinator];
  uint64_t v5 = [v4 usageDetailsCoordinator];
  [v5 startRefreshingUsageData];

  uint64_t v6 = [(STUsageDetailListController *)self mostUsedProvider];
  [v6 refreshUsageSpecifiersWithUpdates:0];

  uint64_t v7 = [(STPINListViewController *)self coordinator];
  uint64_t v8 = [(STUsageDetailListController *)self segmentedControlProvider];
  [v8 setCoordinator:v7];

  uint64_t v9 = [(STUsageDetailListController *)self screenTimeProvider];
  uint64_t v10 = [v9 groupSpecifier];
  [(STUsageDetailListController *)self performSelector:sel_reloadSpecifier_ withObject:v10 afterDelay:0.0];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewWillAppear", v11, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)STUsageDetailListController;
  [(STPINListViewController *)&v24 viewDidAppear:a3];
  uint64_t v4 = [(STPINListViewController *)self coordinator];
  uint64_t v5 = [(STUsageDetailListController *)self segmentedControlProvider];
  [v5 setCoordinator:v4];

  uint64_t v6 = [(STPINListViewController *)self coordinator];
  uint64_t v7 = [v6 viewModel];
  uint64_t v8 = [v7 me];

  uint64_t v9 = [MEMORY[0x263EFF910] now];
  uint64_t v10 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  [(STUsageDetailListController *)self _reportCoreAnalyticsEventWithUser:v8 currentDate:v9 calendar:v10];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewDidAppear", buf, 2u);
  }
  v11 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.ScreenTime/SCREEN_TIME_SUMMARY"];
  id v12 = objc_alloc(MEMORY[0x263F08DB0]);
  v13 = [MEMORY[0x263EFF960] currentLocale];
  v14 = +[STScreenTimeSettingsUIBundle bundle];
  v15 = [v14 bundleURL];
  v16 = (void *)[v12 initWithKey:@"AllDevicesTitle" table:@"Localizable" locale:v13 bundleURL:v15];

  id v17 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v18 = [MEMORY[0x263EFF960] currentLocale];
  v19 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v20 = [v19 bundleURL];
  v21 = (void *)[v17 initWithKey:@"ScreenTimeControllerTitle" table:@"Localizable" locale:v18 bundleURL:v20];

  v25[0] = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  [(STUsageDetailListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.screen-time" title:v16 localizedNavigationComponents:v22 deepLink:v11];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(STPINListViewController *)self coordinator];
  uint64_t v6 = [v5 usageDetailsCoordinator];
  [v6 stopRefreshingUsageData];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewWillDisappear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STUsageDetailListController;
  [(STUsageDetailListController *)&v7 viewWillDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)STUsageDetailListController;
  [(STUsageDetailListController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = [(STUsageDetailListController *)self datePickerBar];
  uint64_t v4 = [v3 layer];
  id v5 = [MEMORY[0x263F825C8] _barHairlineShadowColor];
  objc_msgSend(v4, "setShadowColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(v4, "setShadowOffset:", 0.0, 3.0);
  LODWORD(v6) = 1050253722;
  [v4 setShadowOpacity:v6];
  objc_super v7 = (void *)MEMORY[0x263F824C0];
  [v3 bounds];
  objc_msgSend(v7, "bezierPathWithRect:");
  id v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowPath:", objc_msgSend(v8, "CGPath"));

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewDidLayoutSubviews", v9, 2u);
  }
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" context:"KVOContextUsageDetailListController"];
  [v5 removeObserver:self forKeyPath:@"viewModel.isCloudSyncEnabled" context:"KVOContextUsageDetailListController"];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.devices" context:"KVOContextUsageDetailListController"];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedItemDisplayName" context:"KVOContextUsageDetailListController"];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" context:"KVOContextUsageDetailListController"];
  v13.receiver = self;
  v13.super_class = (Class)STUsageDetailListController;
  [(STPINListViewController *)&v13 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" options:5 context:"KVOContextUsageDetailListController"];
  [v4 addObserver:self forKeyPath:@"viewModel.isCloudSyncEnabled" options:7 context:"KVOContextUsageDetailListController"];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.devices" options:7 context:"KVOContextUsageDetailListController"];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedItemDisplayName" options:5 context:"KVOContextUsageDetailListController"];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" options:7 context:"KVOContextUsageDetailListController"];
  double v6 = [(STUsageDetailListController *)self datePickerBar];
  [v6 updateWithCoordinator:v4];

  objc_super v7 = [(STUsageDetailListController *)self segmentedControlProvider];
  [v7 setCoordinator:v4];

  id v8 = [(STUsageDetailListController *)self screenTimeProvider];
  [v8 setCoordinator:v4];

  uint64_t v9 = [(STUsageDetailListController *)self allowancesProvider];
  [v9 setCoordinator:v4];

  objc_super v10 = [(STUsageDetailListController *)self mostUsedProvider];
  [v10 setCoordinator:v4];

  v11 = [(STUsageDetailListController *)self pickupsProvider];
  [v11 setCoordinator:v4];

  id v12 = [(STUsageDetailListController *)self notificationsProvider];
  [v12 setCoordinator:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextUsageDetailListController")
  {
    [(STPINListViewController *)self coordinator];

    if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.hasUsageData"])
    {
      id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      objc_super v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        id v12 = 0;
      }
      -[STUsageDetailListController _hasUsageDataDidChange:](self, "_hasUsageDataDidChange:", [v12 BOOLValue]);
    }
    else
    {
      [(STPINListViewController *)self coordinator];

      if ([v10 isEqualToString:@"usageDetailsCoordinator.devices"])
      {
        id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        v14 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v14)
        {

          id v12 = 0;
        }
        v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v16 = [MEMORY[0x263EFF9D0] null];

        if (v15 == v16)
        {

          v15 = 0;
        }
        [(STUsageDetailListController *)self _devicesDidChangeFrom:v12 to:v15];
      }
      else
      {
        [(STPINListViewController *)self coordinator];

        if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedItemDisplayName"])
        {
          id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          id v17 = [MEMORY[0x263EFF9D0] null];

          if (v12 == v17)
          {

            id v12 = 0;
          }
          [(STUsageDetailListController *)self setTitle:v12];
          goto LABEL_18;
        }
        [(STPINListViewController *)self coordinator];

        if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedUsageReport"])
        {
          id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
          uint64_t v18 = [MEMORY[0x263EFF9D0] null];

          if (v12 == v18)
          {

            id v12 = 0;
          }
          v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          v19 = [MEMORY[0x263EFF9D0] null];

          if (v15 == v19)
          {

            v15 = 0;
          }
          uint64_t v20 = objc_opt_class();
          v21 = [(STUsageDetailListController *)self datePickerBar];
          uint64_t v22 = [(STPINListViewController *)self coordinator];
          [v20 selectedUsageReportDidChangeFrom:v12 to:v15 datePickerBar:v21 coordinator:v22];
        }
        else
        {
          [(STPINListViewController *)self coordinator];

          if (![v10 isEqualToString:@"viewModel.isCloudSyncEnabled"]) {
            goto LABEL_19;
          }
          id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
          v23 = [MEMORY[0x263EFF9D0] null];

          if (v12 == v23)
          {

            id v12 = 0;
          }
          v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          objc_super v24 = [MEMORY[0x263EFF9D0] null];

          if (v15 == v24)
          {

            v15 = 0;
          }
          [(STUsageDetailListController *)self _isCloudSyncEnabledDidChangeFrom:v12 to:v15];
        }
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  v25.receiver = self;
  v25.super_class = (Class)STUsageDetailListController;
  [(STListViewController *)&v25 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_19:
}

- (void)_hasUsageDataDidChange:(BOOL)a3
{
  int v3 = a3;
  v36[6] = *MEMORY[0x263EF8340];
  id v5 = [(STUsageDetailListController *)self view];
  double v6 = [(STUsageDetailListController *)self noUsageDataView];
  objc_super v7 = [v5 subviews];
  int v8 = [v7 containsObject:v6];

  if (v8 == v3)
  {
    if (v3)
    {
      [v6 removeFromSuperview];
      uint64_t v9 = [(STUsageDetailListController *)self table];
      [v9 setScrollEnabled:1];
    }
    else
    {
      id v10 = [(STUsageDetailListController *)self table];
      [v10 setScrollEnabled:0];

      [(STUsageDetailListController *)self setDatePickerHidden:1];
      id v11 = [(STPINListViewController *)self coordinator];
      id v12 = [v11 usageDetailsCoordinator];
      objc_super v13 = [v12 viewModel];
      objc_msgSend(v6, "setLocalDevice:", objc_msgSend(v13, "isLocalDevice"));

      [v5 addSubview:v6];
      v14 = [v5 layoutMarginsGuide];
      v26 = (void *)MEMORY[0x263F08938];
      v35 = [v6 topAnchor];
      v34 = [v5 topAnchor];
      v33 = [v35 constraintGreaterThanOrEqualToAnchor:v34];
      v36[0] = v33;
      v32 = [v6 leadingAnchor];
      v30 = v14;
      v31 = [v14 leadingAnchor];
      v29 = [v32 constraintGreaterThanOrEqualToAnchor:v31];
      v36[1] = v29;
      v28 = [v6 bottomAnchor];
      v27 = [v5 bottomAnchor];
      objc_super v25 = [v28 constraintLessThanOrEqualToAnchor:v27];
      v36[2] = v25;
      objc_super v24 = [v6 trailingAnchor];
      v23 = [v14 trailingAnchor];
      v15 = [v24 constraintLessThanOrEqualToAnchor:v23];
      v36[3] = v15;
      v16 = [v6 centerXAnchor];
      id v17 = [v5 centerXAnchor];
      uint64_t v18 = [v16 constraintEqualToAnchor:v17];
      v36[4] = v18;
      v19 = [v6 centerYAnchor];
      uint64_t v20 = [v5 centerYAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      v36[5] = v21;
      uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:6];
      [v26 activateConstraints:v22];
    }
  }
}

- (void)_devicesDidChangeFrom:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v9 = [a3 valueForKeyPath:@"identifier"];
  objc_super v7 = [v6 valueForKeyPath:@"identifier"];

  if (([v9 isEqual:v7] & 1) == 0)
  {
    int v8 = [(STPINListViewController *)self coordinator];
    +[STDevicesMenu updateWithCoordinator:v8 viewController:self];
  }
}

- (void)_isCloudSyncEnabledDidChangeFrom:(id)a3 to:(id)a4
{
  id v6 = a4;
  LODWORD(a3) = [a3 BOOLValue];
  int v7 = [v6 BOOLValue];

  if (a3 != v7)
  {
    int v8 = [(STPINListViewController *)self coordinator];
    id v9 = [v8 usageDetailsCoordinator];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__STUsageDetailListController__isCloudSyncEnabledDidChangeFrom_to___block_invoke;
    v10[3] = &unk_2647671B0;
    v10[4] = self;
    [v9 loadViewModelWithCompletionHandler:v10];
  }
}

void __67__STUsageDetailListController__isCloudSyncEnabledDidChangeFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __67__STUsageDetailListController__isCloudSyncEnabledDidChangeFrom_to___block_invoke_cold_1((uint64_t)v3);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) coordinator];
    +[STDevicesMenu updateWithCoordinator:v4 viewController:*(void *)(a1 + 32)];
  }
}

+ (void)selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4 datePickerBar:(id)a5 coordinator:(id)a6
{
  id v76 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10 && ([v76 isEqual:v10] & 1) == 0)
  {
    objc_super v13 = [v10 reportDateInterval];
    v14 = [v13 startDate];
    v15 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v16 = [v10 type];
    uint64_t v17 = v16;
    if (v16 == 1)
    {
      v23 = objc_opt_new();
      [v23 setFormattingContext:2];
      [v23 setLocalizedDateFormatFromTemplate:@"MMMMd"];
      uint64_t v24 = [v23 stringFromDate:v14];
      v71 = v13;
      v72 = v23;
      v74 = (void *)v24;
      v75 = v14;
      if ([v15 isDateInToday:v14])
      {
        objc_super v25 = +[STScreenTimeSettingsUIBundle bundle];
        v26 = [v25 localizedStringForKey:@"TodayScreenTimeFormat" value:&stru_26D9391A8 table:0];

        id v27 = [NSString alloc];
        uint64_t v28 = [MEMORY[0x263EFF960] currentLocale];
        uint64_t v29 = v24;
        v30 = (void *)v28;
        v31 = objc_msgSend(v27, "initWithFormat:locale:", v26, v28, v29);
        v32 = [v11 dateLabel];
        [v32 setText:v31];

        v33 = [v11 rightArrowButton];
        [v33 setEnabled:0];
      }
      else
      {
        if ([v15 isDateInYesterday:v14])
        {
          v35 = +[STScreenTimeSettingsUIBundle bundle];
          uint64_t v36 = [v35 localizedStringForKey:@"YesterdayScreenTimeFormat" value:&stru_26D9391A8 table:0];

          id v37 = [NSString alloc];
          [MEMORY[0x263EFF960] currentLocale];
          uint64_t v68 = v24;
          v69 = v38 = (void *)v36;
          v39 = (void *)[v37 initWithFormat:v36 locale:v68];
          v40 = [v11 dateLabel];
          [v40 setText:v39];
        }
        else
        {
          uint64_t v53 = [v15 component:512 fromDate:v14];
          v54 = [v15 standaloneWeekdaySymbols];
          uint64_t v55 = [v54 objectAtIndexedSubscript:v53 - 1];

          v56 = +[STScreenTimeSettingsUIBundle bundle];
          uint64_t v57 = [v56 localizedStringForKey:@"WeekdayScreenTimeFormat" value:&stru_26D9391A8 table:0];

          id v58 = [NSString alloc];
          v39 = [MEMORY[0x263EFF960] currentLocale];
          v69 = (void *)v57;
          v40 = objc_msgSend(v58, "initWithFormat:locale:", v57, v39, v55, v74);
          v59 = [v11 dateLabel];
          [v59 setText:v40];

          v38 = (void *)v55;
          uint64_t v17 = 1;
        }

        v26 = [v11 rightArrowButton];
        [v26 setEnabled:1];
      }

      v60 = [v12 usageDetailsCoordinator];
      objc_super v44 = [v60 viewModel];

      uint64_t v61 = [v44 selectedWeek];
      v62 = [v44 weekUsageReports];
      uint64_t v63 = [v62 count];

      uint64_t v64 = [v15 component:512 fromDate:v75];
      BOOL v65 = v63 && v61 != v63 - 1 || v64 != [v15 firstWeekday];
      v52 = v74;
      v51 = [v11 leftArrowButton];
      [v51 setEnabled:v65];
      objc_super v13 = v71;
      goto LABEL_26;
    }
    if (v16)
    {
LABEL_27:
      v66 = [v12 viewModel];
      v67 = [v66 me];
      [a1 _setSelectedUsageReportType:v17 user:v67];

      goto LABEL_28;
    }
    uint64_t v18 = objc_opt_new();
    uint64_t v19 = [v15 dateByAddingUnit:0x2000 value:-1 toDate:v18 options:0];
    v70 = v13;
    v72 = (void *)v18;
    v73 = (void *)v19;
    v75 = v14;
    if ([v15 isDate:v14 equalToDate:v18 toUnitGranularity:0x2000])
    {
      uint64_t v20 = +[STScreenTimeSettingsUIBundle bundle];
      v21 = v20;
      uint64_t v22 = @"DatePickerTitleThisWeek";
    }
    else
    {
      if (![v15 isDate:v14 equalToDate:v19 toUnitGranularity:0x2000])
      {
        v21 = objc_opt_new();
        [v21 setDateTemplate:@"MMMMddy"];
        uint64_t v34 = [v21 stringFromDateInterval:v13];
        goto LABEL_15;
      }
      uint64_t v20 = +[STScreenTimeSettingsUIBundle bundle];
      v21 = v20;
      uint64_t v22 = @"DatePickerTitleLastWeek";
    }
    uint64_t v34 = [v20 localizedStringForKey:v22 value:&stru_26D9391A8 table:0];
LABEL_15:
    v41 = (void *)v34;
    v42 = [v11 dateLabel];
    [v42 setText:v41];

    v43 = [v12 usageDetailsCoordinator];
    objc_super v44 = [v43 viewModel];

    unint64_t v45 = [v44 selectedWeek];
    v46 = [v44 weekUsageReports];
    uint64_t v47 = [v46 count];

    BOOL v48 = v45 < v47 - 1 && v47 != 0;
    v49 = [v11 leftArrowButton];
    [v49 setEnabled:v48];

    BOOL v50 = v45 != 0;
    v51 = [v11 rightArrowButton];
    [v51 setEnabled:v50];
    objc_super v13 = v70;
    v52 = v73;
LABEL_26:

    v14 = v75;
    goto LABEL_27;
  }
LABEL_28:
}

+ (void)_setSelectedUsageReportType:(unint64_t)a3 user:(id)a4
{
  id v7 = a4;
  if ([v7 isRemoteUser])
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a3];
    id v6 = [v7 dsid];
    +[STUsageDetailsViewModelCoordinator setDefaultUsageReportType:v5 childDSID:v6];
  }
  else
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a3];
    +[STUsageDetailsViewModelCoordinator setDefaultUsageReportTypeForLocalUser:v5];
  }
}

+ (id)_getDevicesDropDownMenuWithCoordinator:(id)a3 viewController:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id val = a4;
  uint64_t v28 = v5;
  v26 = [v5 usageDetailsCoordinator];
  id v6 = [v26 selectedDeviceIdentifier];
  id v7 = [v26 devices];
  int v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  objc_initWeak(&location, val);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_super v13 = [v12 identifier];
        v14 = [v12 name];
        id v15 = objc_loadWeakRetained(&location);
        uint64_t v16 = +[STUsageDetailListController _getUIActionForDevice:v14 deviceIndentifier:v13 coordinator:v28 weakSelf:v15];

        if ([v6 isEqualToString:v13]) {
          [v16 setState:1];
        }
        [v8 addObject:v16];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  uint64_t v17 = +[STScreenTimeSettingsUIBundle bundle];
  if ((unint64_t)[obj count] >= 2)
  {
    uint64_t v18 = [v26 viewModel];
    int v19 = [v18 hasAggregateUsageData];

    if (v19)
    {
      uint64_t v20 = [v17 localizedStringForKey:@"AllDevicesTitle" value:&stru_26D9391A8 table:0];
      id v21 = objc_loadWeakRetained(&location);
      uint64_t v22 = +[STUsageDetailListController _getUIActionForDevice:v20 deviceIndentifier:0 coordinator:v28 weakSelf:v21];

      if (!v6) {
        [v22 setState:1];
      }
      [v8 addObject:v22];
    }
  }
  v23 = [MEMORY[0x263F82940] menuWithChildren:v8];

  objc_destroyWeak(&location);

  return v23;
}

+ (id)_getUIActionForDevice:(id)a3 deviceIndentifier:(id)a4 coordinator:(id)a5 weakSelf:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x263F823D0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__STUsageDetailListController__getUIActionForDevice_deviceIndentifier_coordinator_weakSelf___block_invoke;
  v18[3] = &unk_264768818;
  id v19 = v11;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  uint64_t v16 = [v12 actionWithTitle:a3 image:0 identifier:0 handler:v18];

  return v16;
}

void __92__STUsageDetailListController__getUIActionForDevice_deviceIndentifier_coordinator_weakSelf___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    id v5 = v1;
    +[STUsageDetailListController _setSelectedDeviceIdentifier:v3 coordinator:v4];
    id v8 = +[STUsageDetailListController _getDevicesDropDownMenuWithCoordinator:a1[6] viewController:a1[4]];
    id v6 = [v5 navigationItem];

    id v7 = [v6 rightBarButtonItem];
    [v7 setMenu:v8];
  }
}

+ (void)_setSelectedDeviceIdentifier:(id)a3 coordinator:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = [v5 usageDetailsCoordinator];
  [v6 setSelectedDeviceIdentifier:v10];

  id v7 = [v5 viewModel];

  id v8 = [v7 me];

  if ([v8 isRemoteUser])
  {
    id v9 = [v8 dsid];
    +[STUsageDetailsViewModelCoordinator setDefaultDeviceIdentifier:v10 childDSID:v9];
  }
  else
  {
    +[STUsageDetailsViewModelCoordinator setDefaultDeviceIdentifierForLocalUser:v10];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(STUsageDetailListController *)self segmentedControlProvider];
  id v5 = [v4 groupSpecifier];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F60128]];

  uint64_t v7 = [v6 window];
  if (v7)
  {
    id v8 = (void *)v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [v6 frame];
      double MaxY = CGRectGetMaxY(v16);
      [v14 contentOffset];
      double v12 = v11;
      [v14 adjustedContentInset];
      [(STUsageDetailListController *)self setDatePickerHidden:v12 + v13 < MaxY];
    }
  }
}

- (BOOL)isDatePickerHidden
{
  uint64_t v3 = [(STUsageDetailListController *)self datePickerTopConstraint];
  if ([v3 isActive])
  {
    char v4 = 0;
  }
  else
  {
    id v5 = [(STUsageDetailListController *)self datePickerBottomConstraint];
    char v4 = [v5 isActive];
  }
  return v4;
}

- (void)setDatePickerHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(STUsageDetailListController *)self isDatePickerHidden] != a3)
  {
    id v5 = [(STUsageDetailListController *)self datePickerTopConstraint];
    [v5 setActive:v3 ^ 1];

    id v6 = [(STUsageDetailListController *)self datePickerBottomConstraint];
    [v6 setActive:v3];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__STUsageDetailListController_setDatePickerHidden___block_invoke;
    v9[3] = &unk_264766F30;
    v9[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:0x20000 delay:v9 options:0 animations:0.6 completion:0.0];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__STUsageDetailListController_setDatePickerHidden___block_invoke_2;
    v7[3] = &unk_2647674E8;
    v7[4] = self;
    BOOL v8 = v3;
    [MEMORY[0x263F82E00] animateWithDuration:0x20000 delay:v7 options:0 animations:0.2 completion:0.0];
  }
}

void __51__STUsageDetailListController_setDatePickerHidden___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __51__STUsageDetailListController_setDatePickerHidden___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) datePickerBar];
  [v2 setAlpha:v1];
}

- (void)_reportCoreAnalyticsEventWithUser:(id)a3 currentDate:(id)a4 calendar:(id)a5
{
  id v19 = a4;
  id v7 = a5;
  id v8 = a3;
  unint64_t v9 = [v8 type];
  if (v9 > 7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_225C13B20[v9];
  }
  double v11 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ScreenTimeAgent"];
  id v12 = [v11 objectForKey:@"LastViewedAllActivityDate"];
  if (!v12) {
    id v12 = v19;
  }
  [v11 setObject:v19 forKey:@"LastViewedAllActivityDate"];
  double v13 = [v7 components:16 fromDate:v12 toDate:v19 options:0];

  uint64_t v14 = [v13 day];
  id v15 = objc_alloc(MEMORY[0x263F67290]);
  uint64_t v16 = [v8 isManaged];
  uint64_t v17 = [v8 isRemoteUser];

  uint64_t v18 = (void *)[v15 initWithDaysSinceLastView:v14 & ~(v14 >> 63) userAgeGroup:v10 userIsManaged:v16 userIsRemote:v17];
  [MEMORY[0x263F67150] reportEvent:v18];
}

- (STTestGroupSpecifierProvider)testProvider
{
  return (STTestGroupSpecifierProvider *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setTestProvider:(id)a3
{
}

- (STSegmentedControlGroupSpecifierProvider)segmentedControlProvider
{
  return (STSegmentedControlGroupSpecifierProvider *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setSegmentedControlProvider:(id)a3
{
}

- (STScreenTimeUsageGroupSpecifierProvider)screenTimeProvider
{
  return (STScreenTimeUsageGroupSpecifierProvider *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setScreenTimeProvider:(id)a3
{
}

- (STAllowanceProgressGroupSpecifierProvider)allowancesProvider
{
  return (STAllowanceProgressGroupSpecifierProvider *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setAllowancesProvider:(id)a3
{
}

- (STMostUsedGroupSpecifierProvider)mostUsedProvider
{
  return (STMostUsedGroupSpecifierProvider *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setMostUsedProvider:(id)a3
{
}

- (STNotificationsUsageGroupSpecifierProvider)notificationsProvider
{
  return (STNotificationsUsageGroupSpecifierProvider *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setNotificationsProvider:(id)a3
{
}

- (STDevicePickupsUsageGroupSpecifierProvider)pickupsProvider
{
  return (STDevicePickupsUsageGroupSpecifierProvider *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setPickupsProvider:(id)a3
{
}

- (STNoUsageDataView)noUsageDataView
{
  return (STNoUsageDataView *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setNoUsageDataView:(id)a3
{
}

- (STDatePickerBar)datePickerBar
{
  return (STDatePickerBar *)objc_getProperty(self, a2, 1480, 1);
}

- (void)setDatePickerBar:(id)a3
{
}

- (NSLayoutConstraint)datePickerTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1488, 1);
}

- (void)setDatePickerTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)datePickerBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1496, 1);
}

- (void)setDatePickerBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePickerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_datePickerTopConstraint, 0);
  objc_storeStrong((id *)&self->_datePickerBar, 0);
  objc_storeStrong((id *)&self->_noUsageDataView, 0);
  objc_storeStrong((id *)&self->_pickupsProvider, 0);
  objc_storeStrong((id *)&self->_notificationsProvider, 0);
  objc_storeStrong((id *)&self->_mostUsedProvider, 0);
  objc_storeStrong((id *)&self->_allowancesProvider, 0);
  objc_storeStrong((id *)&self->_screenTimeProvider, 0);
  objc_storeStrong((id *)&self->_segmentedControlProvider, 0);

  objc_storeStrong((id *)&self->_testProvider, 0);
}

void __67__STUsageDetailListController__isCloudSyncEnabledDidChangeFrom_to___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error isCloudSyncEnabledDidChangeFrom: %@", (uint8_t *)&v1, 0xCu);
}

@end