@interface SCLPhoneSettingsViewController
- (BOOL)isObservingApplicationLifecycle;
- (BOOL)isObservingViewModel;
- (NRDevice)device;
- (SCLActiveSpecifierDataSource)activeSpecifierSource;
- (SCLScheduleSettings)scheduleSettings;
- (SCLSchoolMode)schoolMode;
- (SCLSettingsViewModel)viewModel;
- (id)viewModelForSettings:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)beginObservingViewModel:(id)a3;
- (void)dealloc;
- (void)endObservingViewModel:(id)a3;
- (void)loadSchoolModeIfNeeded;
- (void)loadSpecifierSource;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scheduleDidChange;
- (void)setActiveSpecifierSource:(id)a3;
- (void)setDevice:(id)a3;
- (void)setObservingApplicationLifecycle:(BOOL)a3;
- (void)setObservingViewModel:(BOOL)a3;
- (void)setScheduleSettings:(id)a3;
- (void)setSchoolMode:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setViewModel:(id)a3;
- (void)updateSchedule;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SCLPhoneSettingsViewController

- (void)dealloc
{
  v3 = [(SCLPhoneSettingsViewController *)self viewModel];
  [(SCLPhoneSettingsViewController *)self endObservingViewModel:v3];

  v4.receiver = self;
  v4.super_class = (Class)SCLPhoneSettingsViewController;
  [(SCLListViewController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCLPhoneSettingsViewController;
  [(SCLPhoneSettingsViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(SCLPhoneSettingsViewController *)self schoolMode];
  [v4 noteSignificantUserInteraction];

  if (![(SCLPhoneSettingsViewController *)self isObservingApplicationLifecycle])
  {
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

    [(SCLPhoneSettingsViewController *)self setObservingApplicationLifecycle:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCLPhoneSettingsViewController;
  [(SCLPhoneSettingsViewController *)&v5 viewWillDisappear:a3];
  if ([(SCLPhoneSettingsViewController *)self isObservingApplicationLifecycle])
  {
    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263F1D038] object:0];

    [(SCLPhoneSettingsViewController *)self setObservingApplicationLifecycle:0];
  }
}

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCLPhoneSettingsViewController;
  id v4 = a3;
  [(SCLPhoneSettingsViewController *)&v7 setSpecifier:v4];
  objc_super v5 = objc_msgSend(v4, "propertyForKey:", @"COSAssociatedDevice", v7.receiver, v7.super_class);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SCLPhoneSettingsViewController *)self setDevice:v5];
  }
  else if (v5)
  {
    objc_super v6 = scl_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[SCLPhoneSettingsViewController setSpecifier:]((uint64_t)v5, v6);
    }
  }
}

- (NRDevice)device
{
  device = self->_device;
  if (!device)
  {
    id v4 = [MEMORY[0x263F57730] sharedInstance];
    objc_super v5 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
    objc_super v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
    objc_super v7 = [v6 firstObject];
    v8 = self->_device;
    self->_device = v7;

    device = self->_device;
  }

  return device;
}

- (void)loadSchoolModeIfNeeded
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!self->_schoolMode)
  {
    v3 = [(SCLPhoneSettingsViewController *)self device];
    id v4 = [v3 valueForProperty:*MEMORY[0x263F575B0]];
    char v5 = [v4 BOOLValue];

    if ((v5 & 1) == 0)
    {
      objc_super v6 = [MEMORY[0x263F57730] sharedInstance];
      objc_super v7 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:&__block_literal_global_1];

      v8 = scl_framework_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v13 = [(SCLPhoneSettingsViewController *)self specifier];
        v14 = [v13 propertyForKey:@"COSAssociatedDevice"];
        int v15 = 138412802;
        v16 = v3;
        __int16 v17 = 2112;
        v18 = v14;
        __int16 v19 = 2112;
        v20 = v7;
        _os_log_fault_impl(&dword_22F0CF000, v8, OS_LOG_TYPE_FAULT, "Selected device is not a Tinker device: %@; Specifier Device: %@;\n%@",
          (uint8_t *)&v15,
          0x20u);
      }
    }
    v9 = [v3 pairingID];
    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F66F98]);
      [v10 setIdentifier:@"SchoolTimeSettings"];
      [v10 setPairingID:v9];
      [v10 setLoadsSynchronously:1];
      v11 = (SCLSchoolMode *)[objc_alloc(MEMORY[0x263F66F90]) initWithConfiguration:v10];
      schoolMode = self->_schoolMode;
      self->_schoolMode = v11;

      [(SCLSchoolMode *)self->_schoolMode resume];
    }
  }
}

uint64_t __56__SCLPhoneSettingsViewController_loadSchoolModeIfNeeded__block_invoke()
{
  return 1;
}

- (void)loadSpecifierSource
{
  v19[2] = *MEMORY[0x263EF8340];
  [(SCLPhoneSettingsViewController *)self loadSchoolModeIfNeeded];
  v3 = [(SCLPhoneSettingsViewController *)self schoolMode];

  if (v3)
  {
    id v4 = [(SCLPhoneSettingsViewController *)self schoolMode];
    char v5 = [v4 scheduleSettings];

    [(SCLPhoneSettingsViewController *)self setScheduleSettings:v5];
    objc_super v6 = [(SCLPhoneSettingsViewController *)self viewModelForSettings:v5];
    [(SCLPhoneSettingsViewController *)self setViewModel:v6];
    [(SCLPhoneSettingsViewController *)self beginObservingViewModel:v6];
    objc_super v7 = [[SCLSpecifierDataSource alloc] initWithListController:self viewModel:v6];
    [(SCLSpecifierDataSource *)v7 setActive:1];
    v8 = [[SCLActiveSpecifierDataSource alloc] initWithListController:self viewModel:v6];
    [(SCLSpecifierDataSource *)v8 setActive:1];
    [(SCLPhoneSettingsViewController *)self setActiveSpecifierSource:v8];
    v9 = [[SCLHistoryDaysDataSource alloc] initWithListController:self viewModel:v6];
    [(SCLSpecifierDataSource *)v9 setActive:1];
    v19[0] = v8;
    v19[1] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    [(SCLSpecifierDataSource *)v7 setChildDataSources:v10];

    [(SCLListViewController *)self setSpecifierSource:v7];
    v11 = [(SCLPhoneSettingsViewController *)self schoolMode];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke;
    v16[3] = &unk_2649FABE8;
    id v17 = v6;
    id v12 = v6;
    [v11 fetchRecentUnlockHistoryItemsWithCompletion:v16];
  }
  else
  {
    char v5 = objc_alloc_init(SCLSettingsViewModel);
    objc_super v7 = [[SCLSpecifierDataSource alloc] initWithListController:self viewModel:v5];
    [(SCLSpecifierDataSource *)v7 setActive:1];
    v8 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SCHOOLTIME_UNAVAILABLE_GROUP"];
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v13 localizedStringForKey:@"SCHOOLTIME_UNAVAILABLE_ERROR" value:&stru_26E283B80 table:@"SchoolTimeSettings"];

    if (os_variant_has_internal_ui())
    {
      uint64_t v14 = [(SCLHistoryDaysDataSource *)v9 stringByAppendingString:@"\n\n[Internal Only]\nBridge should have provided an NRDevice and users should not be able to reach the Schooltime settings UI in this state. See <rdar://problem/66326901>"];

      v9 = (SCLHistoryDaysDataSource *)v14;
    }
    [(SCLActiveSpecifierDataSource *)v8 setProperty:v9 forKey:*MEMORY[0x263F600F8]];
    v18 = v8;
    int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [(SCLSpecifierDataSource *)v7 setSpecifiers:v15];

    [(SCLListViewController *)self setSpecifierSource:v7];
  }
}

void __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = scl_framework_log();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = [v5 count];
    _os_log_impl(&dword_22F0CF000, v8, OS_LOG_TYPE_INFO, "Fetched %d history items", buf, 8u);
  }

  if ([v5 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke_24;
    v9[3] = &unk_2649FABC0;
    id v10 = *(id *)(a1 + 32);
    id v11 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

uint64_t __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke_24(uint64_t a1)
{
  [*(id *)(a1 + 32) setHistoryItems:*(void *)(a1 + 40)];

  return SCLLogHistoryViewed();
}

- (id)viewModelForSettings:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(SCLSettingsViewModel);
  -[SCLSettingsViewModel setEnabled:](v4, "setEnabled:", [v3 isEnabled]);
  id v5 = [v3 schedule];

  uint64_t v6 = [v5 scheduledDays];
  objc_super v7 = [v5 uniformTimeIntervals];
  v8 = v7;
  if (!v6)
  {
    int v13 = +[SCLTimeIntervalModel defaultTimeInterval];
    v28[0] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];

    int v15 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v16 = objc_msgSend(v15, "SCL_nonWeekendDays");

    [(SCLSettingsViewModel *)v4 setScheduleType:2];
    [(SCLSettingsViewModel *)v4 setRepeatSchedule:v16];
    [(SCLSettingsViewModel *)v4 setTimeIntervals:v14];
    id v17 = (void *)[objc_alloc(MEMORY[0x263F66F60]) initWithTimeIntervals:v14 repeatSchedule:v16];
    [(SCLSettingsViewModel *)v4 setCustomSchedule:v17];

    goto LABEL_12;
  }
  if (![v7 count])
  {
    [(SCLSettingsViewModel *)v4 setScheduleType:3];
    id v18 = objc_alloc(MEMORY[0x263F66F60]);
    __int16 v19 = [v5 recurrences];
    v20 = (void *)[v18 initWithRecurrences:v19];
    [(SCLSettingsViewModel *)v4 setCustomSchedule:v20];

    uint64_t v21 = +[SCLTimeIntervalModel defaultTimeInterval];
    v27 = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];

    [(SCLSettingsViewModel *)v4 setTimeIntervals:v22];
    goto LABEL_12;
  }
  v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v10 = objc_msgSend(v9, "SCL_nonWeekendDays");

  if (v6 == 127)
  {
    [(SCLSettingsViewModel *)v4 setScheduleType:1];
    id v11 = v4;
    uint64_t v12 = 127;
  }
  else
  {
    if (v6 != v10)
    {
      [(SCLSettingsViewModel *)v4 setScheduleType:3];
      goto LABEL_11;
    }
    [(SCLSettingsViewModel *)v4 setScheduleType:2];
    id v11 = v4;
    uint64_t v12 = v6;
  }
  [(SCLSettingsViewModel *)v11 setRepeatSchedule:v12];
LABEL_11:
  id v23 = objc_alloc(MEMORY[0x263F66F60]);
  v24 = [v5 recurrences];
  v25 = (void *)[v23 initWithRecurrences:v24];
  [(SCLSettingsViewModel *)v4 setCustomSchedule:v25];

  [(SCLSettingsViewModel *)v4 setTimeIntervals:v8];
LABEL_12:

  return v4;
}

- (void)beginObservingViewModel:(id)a3
{
  id v4 = a3;
  [(SCLPhoneSettingsViewController *)self setObservingViewModel:1];
  [v4 addObserver:self forKeyPath:@"enabled" options:3 context:kScheduleContext];
  [v4 addObserver:self forKeyPath:@"scheduleType" options:3 context:kScheduleContext];
  [v4 addObserver:self forKeyPath:@"customSchedule" options:3 context:kScheduleContext];
  [v4 addObserver:self forKeyPath:@"repeatSchedule" options:3 context:kScheduleContext];
  [v4 addObserver:self forKeyPath:@"timeIntervals" options:3 context:kScheduleContext];
}

- (void)endObservingViewModel:(id)a3
{
  id v4 = a3;
  if ([(SCLPhoneSettingsViewController *)self isObservingViewModel])
  {
    [(SCLPhoneSettingsViewController *)self setObservingViewModel:0];
    [v4 removeObserver:self forKeyPath:@"enabled" context:kScheduleContext];
    [v4 removeObserver:self forKeyPath:@"scheduleType" context:kScheduleContext];
    [v4 removeObserver:self forKeyPath:@"customSchedule" context:kScheduleContext];
    [v4 removeObserver:self forKeyPath:@"repeatSchedule" context:kScheduleContext];
    [v4 removeObserver:self forKeyPath:@"timeIntervals" context:kScheduleContext];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kScheduleContext == a6)
  {
    uint64_t v11 = *MEMORY[0x263F081B8];
    id v12 = a5;
    id v14 = [v12 objectForKeyedSubscript:v11];
    int v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081C8]];

    if (([v14 isEqual:v13] & 1) == 0) {
      [(SCLPhoneSettingsViewController *)self scheduleDidChange];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SCLPhoneSettingsViewController;
    id v10 = a5;
    [(SCLListViewController *)&v15 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_22F0CF000, "ApplicationDidBecomeActive", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = scl_framework_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22F0CF000, v6, OS_LOG_TYPE_DEFAULT, "ApplicationDidBecomeActive", v8, 2u);
  }

  objc_super v7 = [(SCLPhoneSettingsViewController *)self schoolMode];
  [v7 noteSignificantUserInteraction];

  os_activity_scope_leave(&state);
}

- (void)scheduleDidChange
{
  id v3 = scl_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22F0CF000, v3, OS_LOG_TYPE_DEFAULT, "Schedule did change", v4, 2u);
  }

  [(SCLPhoneSettingsViewController *)self updateSchedule];
}

- (void)updateSchedule
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = scl_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_22F0CF000, v3, OS_LOG_TYPE_DEFAULT, "Commit schedule update if needed", (uint8_t *)&buf, 2u);
  }

  id v4 = (void *)MEMORY[0x263F66F58];
  id v5 = [(SCLPhoneSettingsViewController *)self viewModel];
  uint64_t v6 = [v4 scheduleSettingsWithViewModel:v5];

  objc_super v7 = [(SCLPhoneSettingsViewController *)self scheduleSettings];
  char v8 = [v7 isEqual:v6];

  if ((v8 & 1) == 0)
  {
    v9 = scl_framework_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_22F0CF000, v9, OS_LOG_TYPE_DEFAULT, "Updated schedule: %@", (uint8_t *)&buf, 0xCu);
    }

    [(SCLPhoneSettingsViewController *)self setScheduleSettings:v6];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = *MEMORY[0x263F1D108];
    id v10 = [MEMORY[0x263F1C408] sharedApplication];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke;
    v15[3] = &unk_2649FAC10;
    v15[4] = &buf;
    uint64_t v11 = [v10 beginBackgroundTaskWithName:@"Commit Schooltime Schedule" expirationHandler:v15];
    *(void *)(*((void *)&buf + 1) + 24) = v11;

    id v12 = [(SCLPhoneSettingsViewController *)self schoolMode];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke_67;
    v14[3] = &unk_2649FAC38;
    v14[4] = &buf;
    [v12 applyScheduleSettings:v6 completion:v14];

    int v13 = [(SCLPhoneSettingsViewController *)self viewModel];
    SCLLogViewModelCommit(v13, v6);

    _Block_object_dispose(&buf, 8);
  }
}

void __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke(uint64_t a1)
{
  v2 = scl_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke_cold_1(v2);
  }

  id v3 = [MEMORY[0x263F1C408] sharedApplication];
  [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *MEMORY[0x263F1D108];
}

void __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke_67(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2) {
    os_log_type_t v6 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v6 = OS_LOG_TYPE_ERROR;
  }
  objc_super v7 = scl_framework_log();
  if (os_log_type_enabled(v7, v6))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_22F0CF000, v7, v6, "Applied settings: %{BOOL}u; %@", (uint8_t *)v9, 0x12u);
  }

  char v8 = [MEMORY[0x263F1C408] sharedApplication];
  [v8 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

- (void)setDevice:(id)a3
{
}

- (SCLSchoolMode)schoolMode
{
  return self->_schoolMode;
}

- (void)setSchoolMode:(id)a3
{
}

- (SCLActiveSpecifierDataSource)activeSpecifierSource
{
  return self->_activeSpecifierSource;
}

- (void)setActiveSpecifierSource:(id)a3
{
}

- (SCLSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (SCLScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
}

- (BOOL)isObservingViewModel
{
  return self->_observingViewModel;
}

- (void)setObservingViewModel:(BOOL)a3
{
  self->_observingViewModel = a3;
}

- (BOOL)isObservingApplicationLifecycle
{
  return self->_observingApplicationLifecycle;
}

- (void)setObservingApplicationLifecycle:(BOOL)a3
{
  self->_observingApplicationLifecycle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_activeSpecifierSource, 0);
  objc_storeStrong((id *)&self->_schoolMode, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setSpecifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22F0CF000, a2, OS_LOG_TYPE_FAULT, "Associated device is not an NRDevice: %@", (uint8_t *)&v2, 0xCu);
}

void __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22F0CF000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch items with error %@", (uint8_t *)&v2, 0xCu);
}

void __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22F0CF000, log, OS_LOG_TYPE_ERROR, "Failed to apply schedule settings before background task handler fired.", v1, 2u);
}

@end