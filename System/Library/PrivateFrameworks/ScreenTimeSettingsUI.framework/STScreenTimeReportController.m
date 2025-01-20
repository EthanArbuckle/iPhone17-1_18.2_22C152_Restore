@interface STScreenTimeReportController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)isDatePickerHidden;
- (NSLayoutConstraint)datePickerBottomConstraint;
- (NSLayoutConstraint)datePickerTopConstraint;
- (STDatePickerBar)datePickerBar;
- (STDebouncer)datePickerHiddenDebouncer;
- (STNotificationSettingsGateway)notificationSettingsGateway;
- (STPINListViewController)pinControllerDelegate;
- (STRootViewModelCoordinator)coordinator;
- (STScreenTimeReportController)initWithTitle:(id)a3 coordinator:(id)a4 pinControllerDelegate:(id)a5;
- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)appAndWebsiteActivityViewController;
- (id)parentController;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (void)_dateModeDidChange:(id)a3;
- (void)_dateModePickerDidAppear;
- (void)_dateModePickerDidDisappear;
- (void)_devicesDidChangeFrom:(id)a3 to:(id)a4;
- (void)_didPressAddApplicationLimitButton:(id)a3;
- (void)_didPressAddCategoryLimitButton:(id)a3;
- (void)_didPressAddWebDomainLimitButton:(id)a3;
- (void)_didTapBarMark:(id)a3;
- (void)_didTapEditLimitLink:(id)a3;
- (void)_didTapNotificationsLink:(id)a3;
- (void)_didTapShowThisWeekButton:(id)a3;
- (void)_didTapShowTodayButton:(id)a3;
- (void)_editLimit:(id)a3 isNewLimit:(BOOL)a4;
- (void)_selectedCoreDuetIdentifierDidChange:(id)a3;
- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4;
- (void)allowanceDetailController:(id)a3 didDeleteAllowance:(id)a4;
- (void)allowanceDetailController:(id)a3 didSaveAllowance:(id)a4;
- (void)allowanceDetailControllerDidCancel:(id)a3;
- (void)dealloc;
- (void)debouncer:(id)a3 didDebounce:(id)a4;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setDatePickerBottomConstraint:(id)a3;
- (void)setDatePickerHidden:(BOOL)a3;
- (void)setDatePickerTopConstraint:(id)a3;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation STScreenTimeReportController

- (STScreenTimeReportController)initWithTitle:(id)a3 coordinator:(id)a4 pinControllerDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)STScreenTimeReportController;
  v11 = [(STScreenTimeReportController *)&v26 initWithNibName:0 bundle:0];
  [(STScreenTimeReportController *)v11 setTitle:v8];
  objc_initWeak(&location, v11);
  v12 = [_TtC20ScreenTimeSettingsUI27STAllActivityViewController alloc];
  v13 = [v9 viewModel];
  v14 = [v13 me];
  v15 = [v14 altDSID];
  uint64_t v16 = [(STAllActivityViewController *)v12 initWithUserAltDSID:v15 deviceIdentifier:0];
  appAndWebsiteActivityViewController = v11->_appAndWebsiteActivityViewController;
  v11->_appAndWebsiteActivityViewController = (_TtC20ScreenTimeSettingsUI27STAllActivityViewController *)v16;

  objc_storeStrong((id *)&v11->_pinControllerDelegate, a5);
  uint64_t v18 = objc_opt_new();
  notificationSettingsGateway = v11->_notificationSettingsGateway;
  v11->_notificationSettingsGateway = (STNotificationSettingsGateway *)v18;

  uint64_t v20 = objc_opt_new();
  datePickerBar = v11->_datePickerBar;
  v11->_datePickerBar = (STDatePickerBar *)v20;

  [(STDatePickerBar *)v11->_datePickerBar updateWithCoordinator:v9];
  uint64_t v22 = [objc_alloc(MEMORY[0x263F67170]) initWithMinCoalescenceInterval:0.1 maxCoalescenceInterval:1.0];
  datePickerHiddenDebouncer = v11->_datePickerHiddenDebouncer;
  v11->_datePickerHiddenDebouncer = (STDebouncer *)v22;

  [(STDebouncer *)v11->_datePickerHiddenDebouncer setDelegate:v11];
  [(STScreenTimeReportController *)v11 setCoordinator:v9];
  [(STAllActivityViewController *)v11->_appAndWebsiteActivityViewController loadViewIfNeeded];
  [MEMORY[0x263F087C8] defaultCenter];

  objc_destroyWeak(&location);
  return v11;
}

- (void)dealloc
{
  [(STScreenTimeReportController *)self setCoordinator:0];
  v3.receiver = self;
  v3.super_class = (Class)STScreenTimeReportController;
  [(STScreenTimeReportController *)&v3 dealloc];
}

- (void)setCoordinator:(id)a3
{
  v4 = (STRootViewModelCoordinator *)a3;
  [(STRootViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedCoreDuetIdentifier" context:"KVOContextScreenTimeReportController"];
  [(STRootViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" context:"KVOContextScreenTimeReportController"];
  [(STRootViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"usageDetailsCoordinator.devices" context:"KVOContextScreenTimeReportController"];
  [(STRootViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedItemDisplayName" context:"KVOContextScreenTimeReportController"];
  coordinator = self->_coordinator;
  self->_coordinator = v4;
  v6 = v4;

  [(STRootViewModelCoordinator *)self->_coordinator addObserver:self forKeyPath:@"usageDetailsCoordinator.devices" options:7 context:"KVOContextScreenTimeReportController"];
  [(STRootViewModelCoordinator *)self->_coordinator addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedItemDisplayName" options:5 context:"KVOContextScreenTimeReportController"];
  [(STRootViewModelCoordinator *)self->_coordinator addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedCoreDuetIdentifier" options:5 context:"KVOContextScreenTimeReportController"];
  [(STRootViewModelCoordinator *)self->_coordinator addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" options:7 context:"KVOContextScreenTimeReportController"];
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)STScreenTimeReportController;
  [(STScreenTimeReportController *)&v33 viewDidLoad];
  objc_super v3 = [(STScreenTimeReportController *)self appAndWebsiteActivityViewController];
  [(STScreenTimeReportController *)self addChildViewController:v3];
  v4 = [v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(STScreenTimeReportController *)self view];
  [v5 addSubview:v4];
  v6 = _NSDictionaryOfVariableBindings(&cfstr_Contentview.isa, v4, 0);
  unint64_t v7 = 0x263F08000uLL;
  id v8 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:0 views:v6];
  id v9 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:0 views:v6];
  id v10 = [(STScreenTimeReportController *)self datePickerBar];
  v31 = v5;
  if (v10)
  {
    [v5 addSubview:v10];
    [v5 readableContentGuide];
    v11 = v28 = v6;
    uint64_t v12 = [v11 topAnchor];

    v13 = [v10 topAnchor];
    v25 = (void *)v12;
    objc_super v26 = [v13 constraintEqualToAnchor:v12];

    [(STScreenTimeReportController *)self setDatePickerTopConstraint:v26];
    v14 = [v10 bottomAnchor];
    [v14 constraintEqualToAnchor:v12];
    v15 = v27 = v8;

    [(STScreenTimeReportController *)self setDatePickerBottomConstraint:v15];
    id v16 = objc_alloc(MEMORY[0x263EFF980]);
    v24 = [v10 leadingAnchor];
    v17 = [v5 leadingAnchor];
    [v24 constraintEqualToAnchor:v17];
    uint64_t v18 = v30 = v3;
    [v10 trailingAnchor];
    v19 = v29 = v4;
    [v5 trailingAnchor];
    v21 = uint64_t v20 = v9;
    uint64_t v22 = [v19 constraintEqualToAnchor:v21];
    v23 = objc_msgSend(v16, "initWithObjects:", v15, v18, v22, 0);

    id v9 = v20;
    unint64_t v7 = 0x263F08000;

    v4 = v29;
    objc_super v3 = v30;

    v6 = v28;
    id v8 = v27;
  }
  else
  {
    v23 = objc_opt_new();
  }
  [v23 addObjectsFromArray:v8];
  [v23 addObjectsFromArray:v9];
  [*(id *)(v7 + 2360) activateConstraints:v23];
  [v3 didMoveToParentViewController:self];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STScreenTimeReportController.viewDidLoad", buf, 2u);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextScreenTimeReportController")
  {
    [(STScreenTimeReportController *)self coordinator];

    if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedUsageReport"])
    {
      uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        uint64_t v12 = 0;
      }
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      [(STScreenTimeReportController *)self _selectedUsageReportDidChangeFrom:v12 to:v14];
    }
    else
    {
      [(STScreenTimeReportController *)self coordinator];

      if (![v10 isEqualToString:@"usageDetailsCoordinator.devices"])
      {
        [(STScreenTimeReportController *)self coordinator];

        if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedItemDisplayName"])
        {
          uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          uint64_t v18 = [MEMORY[0x263EFF9D0] null];

          if (v12 == v18)
          {

            uint64_t v12 = 0;
          }
          [(STScreenTimeReportController *)self setTitle:v12];
        }
        else
        {
          [(STScreenTimeReportController *)self coordinator];

          if (![v10 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedCoreDuetIdentifier"])goto LABEL_17; {
          uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          }
          v19 = [MEMORY[0x263EFF9D0] null];

          if (v12 == v19)
          {

            uint64_t v12 = 0;
          }
          [(STScreenTimeReportController *)self _selectedCoreDuetIdentifierDidChange:v12];
        }
        goto LABEL_16;
      }
      uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      id v16 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v16)
      {

        uint64_t v12 = 0;
      }
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v17 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v17)
      {

        v14 = 0;
      }
      [(STScreenTimeReportController *)self _devicesDidChangeFrom:v12 to:v14];
    }

LABEL_16:
    goto LABEL_17;
  }
  v20.receiver = self;
  v20.super_class = (Class)STScreenTimeReportController;
  [(STScreenTimeReportController *)&v20 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_17:
}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v16 != v6)
  {
    char v7 = [v16 isEqual:v6];
    if (v6)
    {
      if ((v7 & 1) == 0)
      {
        [v6 type];
        id v8 = [v6 reportDateInterval];
        id v9 = [v8 startDate];
        [v9 timeIntervalSinceReferenceDate];
        uint64_t v11 = v10;

        uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%f", v11);
        v13 = [MEMORY[0x263F087C8] defaultCenter];
        [v13 postNotificationName:*MEMORY[0x263F67450] object:v12];
        v14 = [(STScreenTimeReportController *)self datePickerBar];
        v15 = [(STScreenTimeReportController *)self coordinator];
        [v14 updateWithCoordinator:v15];
      }
    }
  }
}

- (void)_devicesDidChangeFrom:(id)a3 to:(id)a4
{
  id v6 = a4;
  BOOL v7 = (unint64_t)[a3 count] < 2;
  unint64_t v8 = [v6 count];

  if (((v7 ^ (v8 > 1)) & 1) == 0)
  {
    id v9 = [(STScreenTimeReportController *)self coordinator];
    +[STDevicesMenu updateWithCoordinator:v9 viewController:self];
  }
}

- (void)_selectedCoreDuetIdentifierDidChange:(id)a3
{
  v4 = [(STScreenTimeReportController *)self coordinator];
  v5 = [v4 viewModel];
  id v6 = [v5 me];
  id v11 = [v6 altDSID];

  BOOL v7 = [(STScreenTimeReportController *)self appAndWebsiteActivityViewController];
  if (v11)
  {
    unint64_t v8 = [(STScreenTimeReportController *)self coordinator];
    id v9 = [v8 usageDetailsCoordinator];
    uint64_t v10 = [v9 selectedDeviceIdentifier];
    [v7 updateWithUserAltDSID:v11 deviceIdentifier:v10];
  }
  else
  {
    [v7 updateWithUserAltDSID:0 deviceIdentifier:0];
  }
}

- (void)_dateModeDidChange:(id)a3
{
  v4 = [a3 object];
  uint64_t v5 = (int)[v4 intValue];

  id v6 = [(STScreenTimeReportController *)self coordinator];
  BOOL v7 = [v6 usageDetailsCoordinator];
  id v8 = [v7 viewModel];

  if (v5)
  {
    if (v5 == 1) {
      [v8 setSelectedDay:0x7FFFFFFFFFFFFFFFLL];
    }
  }
  else
  {
    [v8 selectToday];
  }
}

- (void)_dateModePickerDidAppear
{
  id v2 = [(STScreenTimeReportController *)self datePickerHiddenDebouncer];
  [v2 bounce:MEMORY[0x263EFFA88]];
}

- (void)_dateModePickerDidDisappear
{
  id v2 = [(STScreenTimeReportController *)self datePickerHiddenDebouncer];
  [v2 bounce:MEMORY[0x263EFFA80]];
}

- (void)_didTapShowTodayButton:(id)a3
{
  id v5 = [(STScreenTimeReportController *)self coordinator];
  objc_super v3 = [v5 usageDetailsCoordinator];
  v4 = [v3 viewModel];
  [v4 selectToday];
}

- (void)_didTapShowThisWeekButton:(id)a3
{
  id v5 = [(STScreenTimeReportController *)self coordinator];
  objc_super v3 = [v5 usageDetailsCoordinator];
  v4 = [v3 viewModel];
  [v4 setSelectedWeek:0];
}

- (void)_didTapNotificationsLink:(id)a3
{
  id v16 = [a3 object];
  v4 = [(STScreenTimeReportController *)self notificationSettingsGateway];
  id v5 = [v4 notificationSettingsForBundleIdentifier:v16];

  if (v5)
  {
    id v6 = [MEMORY[0x263F670A8] sharedCache];
    BOOL v7 = [v6 appInfoForBundleIdentifier:v16];

    id v8 = (void *)MEMORY[0x263F5FC40];
    id v9 = [v7 displayName];
    uint64_t v10 = [(STScreenTimeReportController *)self pinControllerDelegate];
    id v11 = [v8 preferenceSpecifierNamed:v9 target:v10 set:0 get:0 detail:0 cell:2 edit:0];

    uint64_t v12 = PSBundlePathForPreferenceBundle();
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60180]];

    [v11 setObject:*MEMORY[0x263F67448] forKeyedSubscript:*MEMORY[0x263F60080]];
    [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FF60]];
    [v11 setControllerLoadAction:sel_lazyLoadBundle_];
    [v11 setObject:v5 forKeyedSubscript:*MEMORY[0x263F67458]];
    [v11 setIdentifier:v16];
    v13 = [(STScreenTimeReportController *)self pinControllerDelegate];
    v14 = [v13 selectSpecifier:v11];

    [v14 setParentController:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);
    [v14 setRootController:WeakRetained];

    [v14 setSpecifier:v11];
    [(STScreenTimeReportController *)self showController:v14 animate:1];
  }
}

- (void)_didTapEditLimitLink:(id)a3
{
  id v12 = a3;
  v4 = [(STScreenTimeReportController *)self viewIfLoaded];
  id v5 = [v4 window];

  if (v5)
  {
    id v6 = [v12 object];
    BOOL v7 = [(STScreenTimeReportController *)self coordinator];
    id v8 = [v7 timeAllowancesCoordinator];
    id v9 = [v8 viewModel];
    uint64_t v10 = [v9 allowancesByIdentifier];
    id v11 = [v10 objectForKeyedSubscript:v6];

    [(STScreenTimeReportController *)self _editLimit:v11 isNewLimit:0];
  }
}

- (void)_didPressAddApplicationLimitButton:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(STScreenTimeReportController *)self viewIfLoaded];
  id v6 = [v5 window];

  if (v6)
  {
    BOOL v7 = [v4 object];
    id v8 = [(STScreenTimeReportController *)self coordinator];
    unsigned int v9 = [v8 isPasscodeEnabled];
    id v10 = v7;
    id v11 = objc_opt_new();
    [v11 setBehaviorType:v9];
    if (v10)
    {
      v13[0] = v10;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
      [v11 setBundleIdentifiers:v12];
    }
    [(STScreenTimeReportController *)self _editLimit:v11 isNewLimit:1];
  }
}

- (void)_didPressAddCategoryLimitButton:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(STScreenTimeReportController *)self viewIfLoaded];
  id v6 = [v5 window];

  if (v6)
  {
    BOOL v7 = [v4 object];
    id v8 = [(STScreenTimeReportController *)self coordinator];
    unsigned int v9 = [v8 isPasscodeEnabled];
    id v10 = v7;
    id v11 = objc_opt_new();
    [v11 setBehaviorType:v9];
    if (v10)
    {
      v13[0] = v10;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
      [v11 setCategoryIdentifiers:v12];
    }
    [(STScreenTimeReportController *)self _editLimit:v11 isNewLimit:1];
  }
}

- (void)_didPressAddWebDomainLimitButton:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(STScreenTimeReportController *)self viewIfLoaded];
  id v6 = [v5 window];

  if (v6)
  {
    BOOL v7 = [v4 object];
    id v8 = [(STScreenTimeReportController *)self coordinator];
    unsigned int v9 = [v8 isPasscodeEnabled];
    id v10 = v7;
    id v11 = objc_opt_new();
    [v11 setBehaviorType:v9];
    if (v10)
    {
      v13[0] = v10;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
      [v11 setWebDomains:v12];
    }
    [(STScreenTimeReportController *)self _editLimit:v11 isNewLimit:1];
  }
}

- (void)_didTapBarMark:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 alloc];
  BOOL v7 = [v5 object];

  [v7 doubleValue];
  id v14 = (id)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");

  id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  unsigned int v9 = [v8 components:512 fromDate:v14];
  uint64_t v10 = [v9 weekday];

  id v11 = [(STScreenTimeReportController *)self coordinator];
  id v12 = [v11 usageDetailsCoordinator];
  v13 = [v12 viewModel];

  [v13 setSelectedDay:v10];
}

- (void)_editLimit:(id)a3 isNewLimit:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(STScreenTimeReportController *)self coordinator];
  id v8 = [(STScreenTimeReportController *)self pinControllerDelegate];
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode])
  {
    unsigned int v9 = [MEMORY[0x263F82418] alertControllerForFeatureNotAvailable];
    [(STScreenTimeReportController *)self presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    if ([v7 isPasscodeEnabled]
      && ([v7 hasAlreadyEnteredPINForSession] & 1) == 0)
    {
      id v16 = (void *)MEMORY[0x263F5FC40];
      v17 = objc_opt_new();
      uint64_t v18 = [v17 UUIDString];
      uint64_t v10 = [v16 preferenceSpecifierNamed:v18 target:v8 set:0 get:0 detail:0 cell:13 edit:objc_opt_class()];

      v19 = (objc_class *)objc_opt_class();
      objc_super v20 = NSStringFromClass(v19);
      [(STAllowanceDetailListController *)v10 setObject:v20 forKeyedSubscript:*MEMORY[0x263F60228]];

      [(STAllowanceDetailListController *)v10 setObject:&unk_26D966E38 forKeyedSubscript:*MEMORY[0x263F60320]];
      [(STAllowanceDetailListController *)v10 setObject:v8 forKeyedSubscript:*MEMORY[0x263F60318]];
      [(STAllowanceDetailListController *)v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __54__STScreenTimeReportController__editLimit_isNewLimit___block_invoke;
      aBlock[3] = &unk_2647674C0;
      aBlock[4] = self;
      id v27 = v6;
      BOOL v28 = v4;
      v21 = _Block_copy(aBlock);
      [(STAllowanceDetailListController *)v10 setObject:v21 forKeyedSubscript:0x26D93FF08];

      uint64_t v22 = objc_opt_new();
      [v22 setParentController:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);
      [v22 setRootController:WeakRetained];

      [v22 setSpecifier:v10];
      v24 = objc_opt_new();
      [v24 setPinDelegate:v8];
      [v24 setParentController:v22];
      v25 = [v22 rootController];
      [v24 setRootController:v25];

      [v24 setSpecifier:v10];
      [v8 showController:v22 animate:1];
    }
    else
    {
      uint64_t v10 = [[STAllowanceDetailListController alloc] initWithCoordinator:v7];
      [(STAllowanceDetailListController *)v10 setAllowance:v6];
      [(STAllowanceDetailListController *)v10 setDelegate:self];
      [(STAllowanceDetailListController *)v10 setIsSetupController:v4];
      [(STAllowanceDetailListController *)v10 setCreatingNewAllowance:v4];
      if (v4)
      {
        id v11 = objc_opt_new();
        [v11 setParentController:v8];
        id v12 = objc_loadWeakRetained((id *)&self->_rootController);
        [v11 setRootController:v12];

        [v11 setSpecifier:self->_specifier];
        [(STAllowanceDetailListController *)v10 setParentController:v11];
        v13 = [v11 rootController];
        [(STAllowanceDetailListController *)v10 setRootController:v13];

        id v14 = [v11 specifier];
        [(STAllowanceDetailListController *)v10 setSpecifier:v14];

        [v11 showController:v10];
        [v8 showController:v11 animate:1];
      }
      else
      {
        [(STAllowanceDetailListController *)v10 setParentController:self];
        id v15 = objc_loadWeakRetained((id *)&self->_rootController);
        [(STAllowanceDetailListController *)v10 setRootController:v15];

        [(STAllowanceDetailListController *)v10 setSpecifier:self->_specifier];
        [(STScreenTimeReportController *)self showController:v10 animate:1];
      }
    }
  }
}

uint64_t __54__STScreenTimeReportController__editLimit_isNewLimit___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _editLimit:*(void *)(result + 40) isNewLimit:*(unsigned __int8 *)(result + 48)];
  }
  return result;
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "BOOLValue", a3);

  [(STScreenTimeReportController *)self setDatePickerHidden:v5];
}

- (BOOL)isDatePickerHidden
{
  objc_super v3 = [(STScreenTimeReportController *)self datePickerTopConstraint];
  if ([v3 isActive])
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v5 = [(STScreenTimeReportController *)self datePickerBottomConstraint];
    char v4 = [v5 isActive];
  }
  return v4;
}

- (void)setDatePickerHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(STScreenTimeReportController *)self viewIfLoaded];
  uint64_t v5 = [v10 window];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = [(STScreenTimeReportController *)self isDatePickerHidden];

    if (v7 != v3)
    {
      id v8 = [(STScreenTimeReportController *)self datePickerTopConstraint];
      [v8 setActive:v3 ^ 1];

      unsigned int v9 = [(STScreenTimeReportController *)self datePickerBottomConstraint];
      [v9 setActive:v3];

      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      void v13[2] = __52__STScreenTimeReportController_setDatePickerHidden___block_invoke;
      v13[3] = &unk_264766F30;
      v13[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:0x20000 delay:v13 options:0 animations:0.6 completion:0.0];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __52__STScreenTimeReportController_setDatePickerHidden___block_invoke_2;
      v11[3] = &unk_2647674E8;
      v11[4] = self;
      BOOL v12 = v3;
      [MEMORY[0x263F82E00] animateWithDuration:0x20000 delay:v11 options:0 animations:0.2 completion:0.0];
    }
  }
  else
  {
  }
}

void __52__STScreenTimeReportController_setDatePickerHidden___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __52__STScreenTimeReportController_setDatePickerHidden___block_invoke_2(uint64_t a1)
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

- (void)allowanceDetailController:(id)a3 didSaveAllowance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STScreenTimeReportController *)self coordinator];
  unsigned int v9 = [v8 timeAllowancesCoordinator];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__STScreenTimeReportController_allowanceDetailController_didSaveAllowance___block_invoke;
  v11[3] = &unk_264767160;
  id v12 = v6;
  v13 = self;
  id v10 = v6;
  [v9 saveAllowance:v7 completionHandler:v11];
}

void __75__STScreenTimeReportController_allowanceDetailController_didSaveAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = +[STUILog persistence];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__STScreenTimeReportController_allowanceDetailController_didSaveAllowance___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  if ([*(id *)(a1 + 32) isSetupController]) {
    [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)allowanceDetailController:(id)a3 didDeleteAllowance:(id)a4
{
  id v5 = a4;
  id v6 = [(STScreenTimeReportController *)self coordinator];
  id v7 = [v6 timeAllowancesCoordinator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__STScreenTimeReportController_allowanceDetailController_didDeleteAllowance___block_invoke;
  v8[3] = &unk_2647671B0;
  v8[4] = self;
  [v7 deleteAllowance:v5 completionHandler:v8];
}

void __77__STScreenTimeReportController_allowanceDetailController_didDeleteAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = +[STUILog persistence];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__STScreenTimeReportController_allowanceDetailController_didDeleteAllowance___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  [*(id *)(a1 + 32) popViewControllerAnimated:1];
}

- (void)allowanceDetailControllerDidCancel:(id)a3
{
}

- (void)setParentController:(id)a3
{
}

- (id)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  return WeakRetained;
}

- (void)setRootController:(id)a3
{
}

- (id)rootController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);

  return WeakRetained;
}

- (void)setSpecifier:(id)a3
{
  id v5 = (PSSpecifier *)a3;
  p_specifier = &self->_specifier;
  if (self->_specifier != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_specifier, a3);
    id v5 = v7;
  }

  MEMORY[0x270F9A758](p_specifier, v5);
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
}

- (id)readPreferenceValue:(id)a3
{
  return (id)[MEMORY[0x263F5FC20] readPreferenceValue:a3];
}

- (void)showController:(id)a3
{
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v4)
  {
    [(STScreenTimeReportController *)self showViewController:v8 sender:self];
    id v6 = v8;
  }
  else
  {
    id v7 = [(STScreenTimeReportController *)self navigationController];
    [v7 pushViewController:v8 animated:0];

    id v6 = v7;
  }
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)appAndWebsiteActivityViewController
{
  return (_TtC20ScreenTimeSettingsUI27STAllActivityViewController *)objc_getProperty(self, a2, 1008, 1);
}

- (STPINListViewController)pinControllerDelegate
{
  return (STPINListViewController *)objc_getProperty(self, a2, 1016, 1);
}

- (STDatePickerBar)datePickerBar
{
  return (STDatePickerBar *)objc_getProperty(self, a2, 1024, 1);
}

- (STDebouncer)datePickerHiddenDebouncer
{
  return (STDebouncer *)objc_getProperty(self, a2, 1032, 1);
}

- (NSLayoutConstraint)datePickerTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setDatePickerTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)datePickerBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setDatePickerBottomConstraint:(id)a3
{
}

- (STNotificationSettingsGateway)notificationSettingsGateway
{
  return self->_notificationSettingsGateway;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettingsGateway, 0);
  objc_storeStrong((id *)&self->_datePickerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_datePickerTopConstraint, 0);
  objc_storeStrong((id *)&self->_datePickerHiddenDebouncer, 0);
  objc_storeStrong((id *)&self->_datePickerBar, 0);
  objc_storeStrong((id *)&self->_pinControllerDelegate, 0);
  objc_storeStrong((id *)&self->_appAndWebsiteActivityViewController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_rootController);

  objc_destroyWeak((id *)&self->_parentController);
}

void __75__STScreenTimeReportController_allowanceDetailController_didSaveAllowance___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Failed to save limit: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __77__STScreenTimeReportController_allowanceDetailController_didDeleteAllowance___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Failed to delete limit: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end