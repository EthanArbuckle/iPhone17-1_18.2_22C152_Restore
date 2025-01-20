@interface WFBuddyViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)networkListVisible;
- (BOOL)networkResultsChangedWhileUIUpdates;
- (BOOL)showAdditionalSetupInfo;
- (BOOL)showNetworkSettings;
- (BOOL)showOtherNetwork;
- (BOOL)supportsCellularActivation;
- (BOOL)tableReloadRequestQueued;
- (BOOL)tableViewIsUpdating;
- (NSArray)pendingNetworks;
- (NSArray)sortedNetworks;
- (NSOrderedSet)sections;
- (NSString)alternateSetupFooter;
- (NSString)alternateSetupTitle;
- (OBAnimationController)animationController;
- (UISwitch)enableWAPISwitch;
- (UIView)buddyIPadContainerView;
- (WFBuddyViewController)init;
- (WFBuddyViewControllerDelegate)buddyDelegate;
- (WFNetworkListDelegate)listDelegate;
- (WFNetworkListRecord)currentNetwork;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (float)currentNetworkScaledRSSI;
- (id)_cellForNetworkRecord:(id)a3 tableView:(id)a4 indexPath:(id)a5;
- (id)_debugSectionStringFromSections:(id)a3;
- (id)_nameOfSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)currentNetworkState;
- (int64_t)deviceCapability;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_chooseOtherNetworkTapped:(id)a3;
- (void)_enableWAPISwitchChanged:(id)a3;
- (void)_notifyBuddyWiFiPickerIsVisble:(BOOL)a3;
- (void)_refreshSections;
- (void)_updateCellsWithNewData:(id)a3 oldData:(id)a4 inSection:(int64_t)a5;
- (void)networkListDelegateWillPresentAccessoryViewController:(id)a3;
- (void)powerStateDidChange:(BOOL)a3;
- (void)refresh;
- (void)setAlternateSetupFooter:(id)a3;
- (void)setAlternateSetupTitle:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setBuddyDelegate:(id)a3;
- (void)setBuddyIPadContainerView:(id)a3;
- (void)setCurrentNetwork:(id)a3;
- (void)setCurrentNetworkScaledRSSI:(float)a3;
- (void)setCurrentNetworkState:(int64_t)a3;
- (void)setDeviceCapability:(int64_t)a3;
- (void)setEnableWAPISwitch:(id)a3;
- (void)setListDelegate:(id)a3;
- (void)setNetworkListVisible:(BOOL)a3;
- (void)setNetworkResultsChangedWhileUIUpdates:(BOOL)a3;
- (void)setNetworks:(id)a3;
- (void)setPendingNetworks:(id)a3;
- (void)setSections:(id)a3;
- (void)setShowAdditionalSetupInfo:(BOOL)a3;
- (void)setShowNetworkSettings:(BOOL)a3;
- (void)setShowOtherNetwork:(BOOL)a3;
- (void)setSortedNetworks:(id)a3;
- (void)setSupportsCellularActivation:(BOOL)a3;
- (void)setTableReloadRequestQueued:(BOOL)a3;
- (void)setTableViewIsUpdating:(BOOL)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFBuddyViewController

- (WFBuddyViewController)init
{
  int64_t v3 = WFCurrentDeviceCapability();
  self->_deviceCapability = v3;
  BOOL IsChinaDevice = WFCapabilityIsChinaDevice(v3);
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (IsChinaDevice) {
    v7 = @"kWFLocBuddyHeaderViewTitleCH";
  }
  else {
    v7 = @"kWFLocBuddyHeaderViewTitle";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v11.receiver = self;
  v11.super_class = (Class)WFBuddyViewController;
  v9 = [(OBTableWelcomeController *)&v11 initWithTitle:v8 detailText:0 icon:0 adoptTableViewScrollView:1];

  return v9;
}

- (void)viewDidLoad
{
  v37[2] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)WFBuddyViewController;
  [(OBTableWelcomeController *)&v36 viewDidLoad];
  objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", &unk_26D9120D0, 0);
  int64_t v3 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  sections = self->_sections;
  self->_sections = v3;

  self->_tableViewIsUpdating = 0;
  self->_networkResultsChangedWhileUIUpdates = 0;
  self->_tableReloadRequestQueued = 0;
  id v5 = objc_alloc(MEMORY[0x263F82C78]);
  v6 = objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = (void *)MEMORY[0x263F829D0];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v7 nibWithNibName:@"WFBuddyNetworkListCell" bundle:v8];

  if (!v9)
  {
    v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2257EC000, v10, v11, "Missing WFBuddyNetworkListCell nib!", buf, 2u);
    }
  }
  [v6 registerNib:v9 forCellReuseIdentifier:@"WFBuddyNetworkListCell"];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFBuddyOtherNetworkCell"];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFBuddyWAPICell"];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFNetworkAlternativeCellIdentifier"];
  v12 = (void *)MEMORY[0x263F829D0];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v12 nibWithNibName:@"WFAdditionalSetupTableViewCell" bundle:v13];

  if (!v14)
  {
    v15 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2257EC000, v15, v16, "Missing WFAdditionalSetupTableViewCell nib!", buf, 2u);
    }
  }
  [v6 registerNib:v14 forCellReuseIdentifier:@"WFBuddyAdditionalSetupCell"];
  [v6 setDelegate:self];
  [v6 setDataSource:self];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 _setDrawsSeparatorAtTopOfSections:1];
  v17 = [(WFBuddyViewController *)self view];
  [v17 addSubview:v6];

  [(OBTableWelcomeController *)self setTableView:v6];
  v18 = [(WFBuddyViewController *)self buttonTray];
  [v18 setHidden:1];

  [(WFBuddyViewController *)self setSupportsCellularActivation:0];
  v19 = [(WFBuddyViewController *)self listDelegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v21 = [(WFBuddyViewController *)self listDelegate];
    [v21 setShouldShowDetailTapOnCurrentNetwork:0];
  }
  v22 = [(WFBuddyViewController *)self listDelegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    v24 = [(WFBuddyViewController *)self listDelegate];
    self->_deviceCapability = [v24 networkListViewControllerOverrideDeviceCapability:self];
  }
  v25 = (void *)[objc_alloc(MEMORY[0x263F5B888]) initWithStateName:@"State 1" transitionDuration:0.01 transitionSpeed:1.0];
  v37[0] = v25;
  v26 = (void *)[objc_alloc(MEMORY[0x263F5B888]) initWithStateName:@"State 2" transitionDuration:1.0 transitionSpeed:0.5];
  v37[1] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];

  v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v29 = [v28 URLForResource:@"WIFI" withExtension:@"ca"];

  id v30 = objc_alloc(MEMORY[0x263F5B880]);
  v31 = [(WFBuddyViewController *)self headerView];
  v32 = [v31 animationView];
  v33 = [v27 firstObject];
  v34 = (void *)[v30 initWithUrlToPackage:v29 animationView:v32 animatedStates:v27 startAtFirstState:v33];
  [(WFBuddyViewController *)self setAnimationController:v34];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFBuddyViewController;
  [(OBTableWelcomeController *)&v9 viewWillAppear:a3];
  v4 = [(WFBuddyViewController *)self listDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFBuddyViewController *)self listDelegate];
    [v6 setShouldShowDetailTapOnCurrentNetwork:0];
  }
  [(WFBuddyViewController *)self _refreshSections];
  [(WFBuddyViewController *)self refresh];
  v7 = [(WFBuddyViewController *)self listDelegate];
  [v7 networkListViewControllerDidAppear:self];

  v8 = [(WFBuddyViewController *)self animationController];
  [v8 startAnimation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFBuddyViewController;
  [(OBBaseWelcomeController *)&v8 viewDidAppear:a3];
  self->_networkListVisible = 1;
  v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2257EC000, v4, v5, "Network list appears on screen", v7, 2u);
  }

  v6 = [(WFBuddyViewController *)self listDelegate];
  [v6 networkListViewControllerDidAppear:self];

  [(WFBuddyViewController *)self _notifyBuddyWiFiPickerIsVisble:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFBuddyViewController;
  [(WFBuddyViewController *)&v8 viewDidDisappear:a3];
  self->_networkListVisible = 0;
  v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2257EC000, v4, v5, "Network list disappears from screen", v7, 2u);
  }

  v6 = [(WFBuddyViewController *)self listDelegate];
  [v6 networkListViewControllerDidDisappear:self];

  [(WFBuddyViewController *)self _notifyBuddyWiFiPickerIsVisble:0];
}

- (void)setShowNetworkSettings:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_showNetworkSettings != a3)
  {
    BOOL v3 = a3;
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
    {
      int v9 = 136315394;
      v10 = "-[WFBuddyViewController setShowNetworkSettings:]";
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl(&dword_2257EC000, v5, v6, "%s: showNetworkSettings %d", (uint8_t *)&v9, 0x12u);
    }

    self->_showNetworkSettings = v3;
    v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
    {
      int v9 = 136315138;
      v10 = "-[WFBuddyViewController setShowNetworkSettings:]";
      _os_log_impl(&dword_2257EC000, v7, v8, "%s: Calling [self refresh]", (uint8_t *)&v9, 0xCu);
    }

    [(WFBuddyViewController *)self refresh];
  }
}

- (void)setSupportsCellularActivation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_supportsCellularActivation != a3 || !self->_alternateSetupTitle || !self->_alternateSetupFooter)
  {
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
    {
      int v16 = 136315394;
      v17 = "-[WFBuddyViewController setSupportsCellularActivation:]";
      __int16 v18 = 1024;
      BOOL v19 = v3;
      _os_log_impl(&dword_2257EC000, v5, v6, "%s: supports %d", (uint8_t *)&v16, 0x12u);
    }

    self->_BOOL supportsCellularActivation = v3;
    BOOL IsChinaDevice = WFCapabilityIsChinaDevice([(WFBuddyViewController *)self deviceCapability]);
    BOOL supportsCellularActivation = self->_supportsCellularActivation;
    int v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = v9;
    __int16 v11 = @"kWFLocBuddyUseCellularConnection";
    if (IsChinaDevice) {
      __int16 v11 = @"kWFLocBuddyUseCellularConnection_CH";
    }
    if (supportsCellularActivation) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = @"kWFLocBuddyConnectToTunes";
    }
    uint64_t v13 = [v9 localizedStringForKey:v12 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    [(WFBuddyViewController *)self setAlternateSetupTitle:v13];
    v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v14 && os_log_type_enabled(v14, v15))
    {
      int v16 = 136315138;
      v17 = "-[WFBuddyViewController setSupportsCellularActivation:]";
      _os_log_impl(&dword_2257EC000, v14, v15, "%s: Calling [self refresh]", (uint8_t *)&v16, 0xCu);
    }

    [(WFBuddyViewController *)self refresh];
  }
}

- (void)setNetworks:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__WFBuddyViewController_setNetworks___block_invoke;
  v6[3] = &unk_264756208;
  id v7 = v4;
  os_log_type_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __37__WFBuddyViewController_setNetworks___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  v49 = &stru_26D8F6070;
  v2 = *(void **)(a1 + 32);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __37__WFBuddyViewController_setNetworks___block_invoke_71;
  v43[3] = &unk_264756E00;
  v43[4] = &v44;
  [v2 enumerateObjectsUsingBlock:v43];
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3 && os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = v45[5];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v5;
    _os_log_impl(&dword_2257EC000, v3, v4, "networks to be set: %@", buf, 0xCu);
  }

  os_log_type_t v6 = (void *)[*(id *)(a1 + 32) mutableCopy];
  id v7 = [*(id *)(a1 + 40) currentNetwork];

  if (v7)
  {
    os_log_type_t v8 = [*(id *)(a1 + 40) currentNetwork];
    [v6 addObject:v8];
  }
  int v9 = [v6 adhocNetworks];
  v10 = v9;
  if (v9 && [v9 count]) {
    [v6 minusSet:v10];
  }
  __int16 v11 = [v6 unconfiguredNetworks];
  BOOL v12 = v11;
  if (v11 && [v11 count]) {
    [v6 minusSet:v12];
  }
  uint64_t v13 = WFScanRecordDefaultSortCompartor();
  v34 = (void *)[*(id *)(*(void *)(a1 + 40) + 1280) copy];
  v14 = WFLogForCategory(0);
  os_log_type_t v15 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
  {
    int v16 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 1237);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    _os_log_impl(&dword_2257EC000, v14, v15, "TableView is currently updating %d", buf, 8u);
  }

  if (*(unsigned char *)(*(void *)(a1 + 40) + 1237))
  {
    v17 = [v6 allObjects];
    uint64_t v18 = [v17 sortedArrayUsingComparator:v13];
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void **)(v19 + 1336);
    *(void *)(v19 + 1336) = v18;

    *(unsigned char *)(*(void *)(a1 + 40) + 1238) = 1;
  }
  else
  {
    v21 = [v6 allObjects];
    v33 = [v21 sortedArrayUsingComparator:v13];

    v22 = WFLogForCategory(0);
    os_log_type_t v23 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v22)
    {
      v24 = v22;
      if (os_log_type_enabled(v24, v23))
      {
        uint64_t v25 = [v34 count];
        uint64_t v26 = [*(id *)(*(void *)(a1 + 40) + 1280) count];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v26;
        _os_log_impl(&dword_2257EC000, v24, v23, "Set Networks from %lu to %lu", buf, 0x16u);
      }
    }
    v27 = [*(id *)(a1 + 40) tableView];
    int v28 = [v27 _isInAWindow];

    if (v28)
    {
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v55 = __Block_byref_object_copy__2;
      v56 = __Block_byref_object_dispose__2;
      v57 = &stru_26D8F6070;
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __37__WFBuddyViewController_setNetworks___block_invoke_77;
      v42[3] = &unk_264756230;
      v42[4] = buf;
      [v34 enumerateObjectsUsingBlock:v42];
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__2;
      v40 = __Block_byref_object_dispose__2;
      v41 = &stru_26D8F6070;
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __37__WFBuddyViewController_setNetworks___block_invoke_2;
      v35[3] = &unk_264756230;
      v35[4] = &v36;
      [v33 enumerateObjectsUsingBlock:v35];
      v29 = WFLogForCategory(0);
      os_log_type_t v30 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v29 && os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = *(void *)(*(void *)&buf[8] + 40);
        uint64_t v32 = v37[5];
        *(_DWORD *)v50 = 138412546;
        uint64_t v51 = v31;
        __int16 v52 = 2112;
        uint64_t v53 = v32;
        _os_log_impl(&dword_2257EC000, v29, v30, "Old networks: %@\n New networks: %@", v50, 0x16u);
      }

      [*(id *)(a1 + 40) _updateCellsWithNewData:v33 oldData:v34 inSection:0];
      _Block_object_dispose(&v36, 8);

      _Block_object_dispose(buf, 8);
    }
  }
  _Block_object_dispose(&v44, 8);
}

void __37__WFBuddyViewController_setNetworks___block_invoke_71(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  os_log_type_t v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  id v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __37__WFBuddyViewController_setNetworks___block_invoke_77(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  os_log_type_t v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  id v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __37__WFBuddyViewController_setNetworks___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  os_log_type_t v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  id v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)_updateCellsWithNewData:(id)a3 oldData:(id)a4 inSection:(int64_t)a5
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v46 = objc_opt_new();
  v42 = objc_opt_new();
  uint64_t v40 = objc_opt_new();
  v43 = objc_opt_new();
  v47 = (void *)[v7 mutableCopy];
  v48 = (void *)[v6 mutableCopy];
  if ((unint64_t)[v7 count] >= 2 && (unint64_t)objc_msgSend(v7, "count", v40, v42) >= 2)
  {
    int v8 = 0;
    uint64_t v9 = 1;
    do
    {
      v10 = [v7 objectAtIndexedSubscript:v9];
      id v11 = [v10 ssid];
      uint64_t v12 = v9 - 1;
      uint64_t v13 = [v7 objectAtIndexedSubscript:v9 - 1];
      v14 = [v13 ssid];
      int v15 = [v11 isEqualToString:v14];

      if (v15) {
        [v47 removeObjectAtIndex:v9 - v8++];
      }
      ++v9;
    }
    while ([v7 count] > (unint64_t)(v12 + 2));
  }
  if ((unint64_t)objc_msgSend(v6, "count", v40) >= 2 && (unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    int v16 = 0;
    uint64_t v17 = 1;
    do
    {
      uint64_t v18 = [v6 objectAtIndexedSubscript:v17];
      uint64_t v19 = [v18 ssid];
      uint64_t v20 = v17 - 1;
      v21 = [v6 objectAtIndexedSubscript:v17 - 1];
      v22 = [v21 ssid];
      int v23 = [v19 isEqualToString:v22];

      if (v23) {
        [v48 removeObjectAtIndex:v17 - v16++];
      }
      ++v17;
    }
    while ([v6 count] > (unint64_t)(v20 + 2));
  }
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__2;
  v79 = __Block_byref_object_dispose__2;
  v80 = &stru_26D8F6070;
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke;
  v74[3] = &unk_264756230;
  v74[4] = &v75;
  [v47 enumerateObjectsUsingBlock:v74];
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__2;
  v72 = __Block_byref_object_dispose__2;
  v73 = &stru_26D8F6070;
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_2;
  v67[3] = &unk_264756230;
  v67[4] = &v68;
  [v48 enumerateObjectsUsingBlock:v67];
  v24 = WFLogForCategory(0);
  os_log_type_t v25 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v24 && os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = v76[5];
    uint64_t v27 = v69[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v82 = v26;
    __int16 v83 = 2112;
    uint64_t v84 = v27;
    _os_log_impl(&dword_2257EC000, v24, v25, "Old filtered networks: %@\n New filtered networks: %@", buf, 0x16u);
  }

  int v28 = WFLogForCategory(0);
  os_log_type_t v29 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v28)
  {
    os_log_type_t v30 = v28;
    if (os_log_type_enabled(v30, v29))
    {
      uint64_t v31 = [v7 count];
      uint64_t v32 = [v47 count];
      uint64_t v33 = [v6 count];
      uint64_t v34 = [v48 count];
      *(_DWORD *)buf = 134218752;
      uint64_t v82 = v31;
      __int16 v83 = 2048;
      uint64_t v84 = v32;
      __int16 v85 = 2048;
      uint64_t v86 = v33;
      __int16 v87 = 2048;
      uint64_t v88 = v34;
      _os_log_impl(&dword_2257EC000, v30, v29, "Old Network count: %lu, old filtered network count: %lu, new network count: %lu, new filtered network count: %lu", buf, 0x2Au);
    }
  }
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_82;
  v65[3] = &unk_264756258;
  id v35 = v43;
  id v66 = v35;
  [v47 enumerateObjectsUsingBlock:v65];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_2_84;
  v60[3] = &unk_264756280;
  id v36 = v35;
  id v61 = v36;
  int64_t v64 = a5;
  id v37 = v41;
  id v62 = v37;
  id v38 = v42;
  id v63 = v38;
  [v48 enumerateObjectsUsingBlock:v60];
  if ([v36 count])
  {
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_86;
    v56[3] = &unk_2647562A8;
    id v57 = v36;
    id v58 = v46;
    int64_t v59 = a5;
    [v57 enumerateKeysAndObjectsUsingBlock:v56];
  }
  if ([v46 count] || objc_msgSend(v38, "count") || objc_msgSend(v37, "count"))
  {
    v39 = [(OBTableWelcomeController *)self tableView];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_88;
    v50[3] = &unk_264756E28;
    id v51 = v38;
    id v52 = v37;
    id v53 = v46;
    v54 = self;
    id v55 = v48;
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_89;
    v49[3] = &unk_264756E50;
    v49[4] = self;
    [v39 performBatchUpdates:v50 completion:v49];
  }
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v75, 8);
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  os_log_type_t v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  id v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  os_log_type_t v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  id v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_82(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 ssid];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setValue:v6 forKey:v7];
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_2_84(uint64_t a1, void *a2, uint64_t a3)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [v5 ssid];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    char v10 = [v8 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
      uint64_t v12 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v11, "integerValue"), *(void *)(a1 + 56));
      uint64_t v13 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:*(void *)(a1 + 56)];
      v14 = *(void **)(a1 + 40);
      v24[0] = v12;
      v24[1] = v13;
      int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
      [v14 addObject:v15];
    }
    [*(id *)(a1 + 32) removeObjectForKey:v6];
  }
  else
  {
    int v16 = WFLogForCategory(0);
    os_log_type_t v17 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v16 && os_log_type_enabled(v16, v17))
    {
      int v20 = 138412546;
      id v21 = v5;
      __int16 v22 = 2048;
      uint64_t v23 = a3;
      _os_log_impl(&dword_2257EC000, v16, v17, "inserting %@ at indexpath:%lu, ", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v18 = *(void **)(a1 + 48);
    uint64_t v19 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:*(void *)(a1 + 56)];
    [v18 addObject:v19];
  }
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  os_log_type_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    id v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2048;
      uint64_t v13 = [v4 longValue];
      _os_log_impl(&dword_2257EC000, v7, v6, "deleting %@ at indexpath:%lu", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v4, "integerValue"), *(void *)(a1 + 48));
  [v8 addObject:v9];
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_88(id *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2)
  {
    os_log_type_t v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v5 = [a1[4] count];
      uint64_t v6 = [a1[5] count];
      uint64_t v7 = [a1[6] count];
      *(_DWORD *)buf = 136315906;
      os_log_type_t v25 = "-[WFBuddyViewController _updateCellsWithNewData:oldData:inSection:]_block_invoke";
      __int16 v26 = 2048;
      uint64_t v27 = v5;
      __int16 v28 = 2048;
      uint64_t v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = v7;
      _os_log_impl(&dword_2257EC000, v4, v3, "%s: tableView updating started - insert %lu move %lu delete %lu", buf, 0x2Au);
    }
  }
  *((unsigned char *)a1[7] + 1237) = 1;
  uint64_t v8 = [a1[7] tableView];
  [v8 deleteRowsAtIndexPaths:a1[6] withRowAnimation:0];

  uint64_t v9 = [a1[7] tableView];
  [v9 insertRowsAtIndexPaths:a1[4] withRowAnimation:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = a1[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", 0, (void)v19);
        os_log_type_t v17 = [v15 objectAtIndexedSubscript:1];
        uint64_t v18 = [a1[7] tableView];
        [v18 moveRowAtIndexPath:v16 toIndexPath:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  objc_storeStrong((id *)a1[7] + 160, a1[8]);
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_89(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFBuddyViewController _updateCellsWithNewData:oldData:inSection:]_block_invoke";
    _os_log_impl(&dword_2257EC000, v2, v3, "%s: tableView updating finished", (uint8_t *)&buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1237) = 0;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    os_log_type_t v4 = [*(id *)(a1 + 32) tableView];
    [v4 invalidateIntrinsicContentSize];

    uint64_t v5 = [*(id *)(a1 + 32) tableView];
    [v5 updateConstraintsIfNeeded];

    uint64_t v6 = [*(id *)(a1 + 32) tableView];
    [v6 layoutIfNeeded];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 1238))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = (void *)[*(id *)(v7 + 1336) copy];
    id v25 = [v8 setWithArray:v9];

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 1336);
    *(void *)(v10 + 1336) = MEMORY[0x263EFFA68];

    *(unsigned char *)(*(void *)(a1 + 32) + 1238) = 0;
    uint64_t v12 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v12)
    {
      uint64_t v14 = v12;
      if (os_log_type_enabled(v14, v13))
      {
        uint64_t v15 = [*(id *)(*((void *)&buf + 1) + 40) count];
        *(_DWORD *)os_log_type_t v17 = 136315394;
        uint64_t v18 = "-[WFBuddyViewController _updateCellsWithNewData:oldData:inSection:]_block_invoke";
        __int16 v19 = 2048;
        uint64_t v20 = v15;
        _os_log_impl(&dword_2257EC000, v14, v13, "%s: continuing with pending network update (count %lu)", v17, 0x16u);
      }
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_92;
    v16[3] = &unk_264756410;
    v16[4] = *(void *)(a1 + 32);
    v16[5] = &buf;
    dispatch_async(MEMORY[0x263EF83A0], v16);
    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_92(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNetworks:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)setCurrentNetworkScaledRSSI:(float)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_currentNetworkScaledRSSI = a3;
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[WFBuddyViewController setCurrentNetworkScaledRSSI:]";
    _os_log_impl(&dword_2257EC000, v4, v5, "%s: Calling [self refresh]", (uint8_t *)&v6, 0xCu);
  }

  [(WFBuddyViewController *)self refresh];
}

- (void)setCurrentNetwork:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentNetwork, a3);
  [v5 scaledRSSI];
  self->_currentNetworkScaledRSSI = v6;
  self->_currentNetworkState = 0;
  uint64_t v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[WFBuddyViewController setCurrentNetwork:]";
    _os_log_impl(&dword_2257EC000, v7, v8, "%s: Calling [self refresh]", (uint8_t *)&v9, 0xCu);
  }

  [(WFBuddyViewController *)self refresh];
}

- (void)setCurrentNetworkState:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_currentNetworkState = a3;
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[WFBuddyViewController setCurrentNetworkState:]";
    _os_log_impl(&dword_2257EC000, v4, v5, "%s: Calling [self refresh]", (uint8_t *)&v6, 0xCu);
  }

  [(WFBuddyViewController *)self refresh];
}

- (void)setDeviceCapability:(int64_t)a3
{
  if (self->_deviceCapability != a3)
  {
    self->_deviceCapability = a3;
    [(WFBuddyViewController *)self _refreshSections];
    alternateSetupTitle = self->_alternateSetupTitle;
    self->_alternateSetupTitle = 0;

    alternateSetupFooter = self->_alternateSetupFooter;
    self->_alternateSetupFooter = 0;

    BOOL supportsCellularActivation = self->_supportsCellularActivation;
    [(WFBuddyViewController *)self setSupportsCellularActivation:supportsCellularActivation];
  }
}

- (void)setShowAdditionalSetupInfo:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_showAdditionalSetupInfo != a3)
  {
    BOOL v3 = a3;
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
    {
      int v7 = 136315394;
      uint64_t v8 = "-[WFBuddyViewController setShowAdditionalSetupInfo:]";
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_2257EC000, v5, v6, "%s: showAdditionalSetupInfo %d", (uint8_t *)&v7, 0x12u);
    }

    self->_showAdditionalSetupInfo = v3;
    [(WFBuddyViewController *)self _refreshSections];
  }
}

- (void)refresh
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    BOOL v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      BOOL tableViewIsUpdating = self->_tableViewIsUpdating;
      BOOL tableReloadRequestQueued = self->_tableReloadRequestQueued;
      *(_DWORD *)long long buf = 136315650;
      uint64_t v14 = "-[WFBuddyViewController refresh]";
      __int16 v15 = 1024;
      BOOL v16 = tableViewIsUpdating;
      __int16 v17 = 1024;
      BOOL v18 = tableReloadRequestQueued;
      _os_log_impl(&dword_2257EC000, v3, v4, "%s: _tableViewIsUpdating: %d _tableReloadRequestQueued: %d", buf, 0x18u);
    }

    if (self->_tableViewIsUpdating)
    {
      if (!self->_tableReloadRequestQueued)
      {
        int v7 = WFLogForCategory(0);
        os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
        {
          *(_DWORD *)long long buf = 136315138;
          uint64_t v14 = "-[WFBuddyViewController refresh]";
          _os_log_impl(&dword_2257EC000, v7, v8, "%s: Queueing a table reload request.", buf, 0xCu);
        }

        self->_BOOL tableReloadRequestQueued = 1;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __32__WFBuddyViewController_refresh__block_invoke;
        block[3] = &unk_2647561B8;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
    else
    {
      __int16 v9 = [(OBTableWelcomeController *)self tableView];
      [v9 reloadData];

      BOOL v10 = [(OBTableWelcomeController *)self tableView];
      [v10 setNeedsLayout];

      uint64_t v11 = [(OBTableWelcomeController *)self tableView];
      [v11 layoutIfNeeded];
    }
  }
  else
  {
    [(WFBuddyViewController *)self performSelectorOnMainThread:sel_refresh withObject:0 waitUntilDone:0];
  }
}

uint64_t __32__WFBuddyViewController_refresh__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) refresh];
  *(unsigned char *)(*(void *)(a1 + 32) + 1239) = 0;
  return result;
}

- (void)_refreshSections
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_tableViewIsUpdating)
  {
    BOOL v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v15 = "-[WFBuddyViewController _refreshSections]";
      _os_log_impl(&dword_2257EC000, v3, v4, "%s: tried to refresh settings while table update is in progress, deferring until update is finished", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__WFBuddyViewController__refreshSections__block_invoke;
    block[3] = &unk_2647561B8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    os_log_type_t v5 = [MEMORY[0x263EFF9B0] orderedSetWithObject:&unk_26D9120D0];
    if (WFCapabilityIsChinaDevice([(WFBuddyViewController *)self deviceCapability])
      && [(WFBuddyViewController *)self deviceCapability] != 4)
    {
      [v5 addObject:&unk_26D9120E8];
    }
    if ([(WFBuddyViewController *)self showAdditionalSetupInfo]) {
      [v5 addObject:&unk_26D912100];
    }
    os_log_type_t v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
    {
      os_log_type_t v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        __int16 v9 = [(WFBuddyViewController *)self sections];
        BOOL v10 = [(WFBuddyViewController *)self _debugSectionStringFromSections:v9];
        uint64_t v11 = [(WFBuddyViewController *)self _debugSectionStringFromSections:v5];
        *(_DWORD *)long long buf = 136315650;
        __int16 v15 = "-[WFBuddyViewController _refreshSections]";
        __int16 v16 = 2112;
        __int16 v17 = v10;
        __int16 v18 = 2112;
        uint64_t v19 = v11;
        _os_log_impl(&dword_2257EC000, v8, v7, "%s: old sections [%@], new sections [%@]", buf, 0x20u);
      }
    }

    uint64_t v12 = [MEMORY[0x263EFF9D8] orderedSetWithOrderedSet:v5];
    [(WFBuddyViewController *)self setSections:v12];

    [(WFBuddyViewController *)self refresh];
  }
}

uint64_t __41__WFBuddyViewController__refreshSections__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshSections];
}

- (void)powerStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v7 = 136315394;
    os_log_type_t v8 = "-[WFBuddyViewController powerStateDidChange:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: state %d", (uint8_t *)&v7, 0x12u);
  }

  [(WFBuddyViewController *)self refresh];
}

- (void)networkListDelegateWillPresentAccessoryViewController:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F825C8];
  id v4 = a3;
  id v5 = [v3 defaultBgColor];
  [v4 setBackgroundColor:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v3 = [(WFBuddyViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  os_log_type_t v6 = [(WFBuddyViewController *)self sections];
  int v7 = [v6 objectAtIndexedSubscript:a4];

  uint64_t v8 = [v7 integerValue];
  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (v8)
    {
      int64_t v9 = 0;
    }
    else
    {
      BOOL v10 = [(WFBuddyViewController *)self sortedNetworks];
      uint64_t v11 = [v10 count];

      int64_t v9 = v11 + [(WFBuddyViewController *)self showOtherNetwork];
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 section];
  int64_t v9 = [(WFBuddyViewController *)self sections];
  unint64_t v10 = [v9 count];

  if (v8 < v10)
  {
    uint64_t v11 = [(WFBuddyViewController *)self sections];
    uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

    uint64_t v13 = [v12 integerValue];
    if (v13 == 2)
    {
      __int16 v17 = [v6 dequeueReusableCellWithIdentifier:@"WFBuddyAdditionalSetupCell"];
      if (!v17) {
        __int16 v17 = [[WFAdditionalSetupTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"WFBuddyAdditionalSetupCell"];
      }
      id v35 = [(WFBuddyViewController *)self alternateSetupTitle];
      id v36 = [(WFAdditionalSetupTableViewCell *)v17 label];
      [v36 setText:v35];
    }
    else
    {
      if (v13 != 1)
      {
        if (v13)
        {
          __int16 v17 = 0;
LABEL_28:
          uint64_t v34 = v17;

          goto LABEL_29;
        }
        uint64_t v14 = [v7 row];
        __int16 v15 = [(WFBuddyViewController *)self sortedNetworks];
        if (v14 == [v15 count])
        {
          BOOL v16 = [(WFBuddyViewController *)self showOtherNetwork];

          if (v16)
          {
            __int16 v17 = [v6 dequeueReusableCellWithIdentifier:@"WFBuddyOtherNetworkCell"];
            if (!v17) {
              __int16 v17 = (WFAdditionalSetupTableViewCell *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"WFBuddyOtherNetworkCell"];
            }
            __int16 v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v19 = [v18 localizedStringForKey:@"kWFLocBuddyFooterViewTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
            uint64_t v20 = [(WFAdditionalSetupTableViewCell *)v17 textLabel];
            [v20 setText:v19];

            long long v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
            uint64_t v22 = (void *)MEMORY[0x263F81708];
            [v21 pointSize];
            uint64_t v23 = objc_msgSend(v22, "boldSystemFontOfSize:");
            v24 = [(WFAdditionalSetupTableViewCell *)v17 textLabel];
            [v24 setFont:v23];

            id v25 = [MEMORY[0x263F825C8] defaultButtonColor];
            uint64_t v26 = [(WFAdditionalSetupTableViewCell *)v17 textLabel];
            [v26 setTextColor:v25];

            uint64_t v27 = [(WFAdditionalSetupTableViewCell *)v17 textLabel];
            [v27 setNumberOfLines:0];

            goto LABEL_26;
          }
        }
        else
        {
        }
        id v52 = [(WFBuddyViewController *)self sortedNetworks];
        long long v21 = objc_msgSend(v52, "objectAtIndex:", objc_msgSend(v7, "row"));

        __int16 v17 = [(WFBuddyViewController *)self _cellForNetworkRecord:v21 tableView:v6 indexPath:v7];
LABEL_26:

        -[WFAdditionalSetupTableViewCell setSeparatorInset:](v17, "setSeparatorInset:", 0.0, 40.0, 0.0, 0.0);
        id v35 = [MEMORY[0x263F825C8] listPlatterBgColor];
        [(WFAdditionalSetupTableViewCell *)v17 setBackgroundColor:v35];
        goto LABEL_27;
      }
      __int16 v17 = [v6 dequeueReusableCellWithIdentifier:@"WFBuddyWAPICell"];
      if (!v17) {
        __int16 v17 = (WFAdditionalSetupTableViewCell *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"WFBuddyWAPICell"];
      }
      id v37 = [(WFAdditionalSetupTableViewCell *)v17 textLabel];
      [v37 setNumberOfLines:0];

      id v38 = [(WFBuddyViewController *)self alternateSetupTitle];
      v39 = [(WFAdditionalSetupTableViewCell *)v17 textLabel];
      [v39 setText:v38];

      id v35 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      uint64_t v40 = (void *)MEMORY[0x263F81708];
      [v35 pointSize];
      v41 = objc_msgSend(v40, "boldSystemFontOfSize:");
      v42 = [(WFAdditionalSetupTableViewCell *)v17 textLabel];
      [v42 setFont:v41];

      v43 = [MEMORY[0x263F825C8] defaultButtonColor];
      uint64_t v44 = [(WFAdditionalSetupTableViewCell *)v17 textLabel];
      [v44 setTextColor:v43];

      v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v46 = [v45 localizedStringForKey:@"kWFLocEnableWAPITitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v47 = [(WFAdditionalSetupTableViewCell *)v17 textLabel];
      [v47 setText:v46];

      v48 = [(WFBuddyViewController *)self enableWAPISwitch];
      [(WFAdditionalSetupTableViewCell *)v17 setAccessoryView:v48];

      v49 = [(WFBuddyViewController *)self listDelegate];
      uint64_t v50 = [v49 networkListViewControllerWAPIEnabled:self];
      id v51 = [(WFBuddyViewController *)self enableWAPISwitch];
      [v51 setOn:v50];

      id v36 = [MEMORY[0x263F825C8] listPlatterBgColor];
      [(WFAdditionalSetupTableViewCell *)v17 setBackgroundColor:v36];
    }

LABEL_27:
    goto LABEL_28;
  }
  __int16 v28 = WFLogForCategory(0);
  os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v28)
  {
    __int16 v30 = v28;
    if (os_log_type_enabled(v30, v29))
    {
      uint64_t v31 = [v7 section];
      uint64_t v32 = [(WFBuddyViewController *)self sections];
      uint64_t v33 = [(WFBuddyViewController *)self _debugSectionStringFromSections:v32];
      int v54 = 136315650;
      id v55 = "-[WFBuddyViewController tableView:cellForRowAtIndexPath:]";
      __int16 v56 = 2048;
      uint64_t v57 = v31;
      __int16 v58 = 2112;
      int64_t v59 = v33;
      _os_log_impl(&dword_2257EC000, v30, v29, "%s: requested section (%lu) is not in expected sections [%@], returning default cell", (uint8_t *)&v54, 0x20u);
    }
  }

  uint64_t v34 = (WFAdditionalSetupTableViewCell *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
LABEL_29:

  return v34;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  v27[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(WFBuddyViewController *)self sections];
  id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  uint64_t v8 = [v7 integerValue];
  if (v8)
  {
    if (v8 == 2)
    {
      unint64_t v10 = [(WFBuddyViewController *)self alternateSetupTitle];
    }
    else if (v8 == 1)
    {
      int64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      unint64_t v10 = [v9 localizedStringForKey:@"kWFLocEnableWAPITitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    }
    else
    {
      unint64_t v10 = 0;
    }
LABEL_12:
    v26[0] = *MEMORY[0x263F81500];
    uint64_t v19 = [MEMORY[0x263F825C8] systemBlueColor];
    v27[0] = v19;
    v26[1] = *MEMORY[0x263F814F0];
    uint64_t v20 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v27[1] = v20;
    long long v21 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

    [v10 sizeWithAttributes:v21];
    double v23 = v22;
    [@"A" sizeWithAttributes:v21];
    double v18 = ceil(v23 + v24 * 2.0);

    goto LABEL_13;
  }
  uint64_t v11 = [v5 row];
  uint64_t v12 = [(WFBuddyViewController *)self sortedNetworks];
  uint64_t v13 = [v12 count];

  if (v11 == v13)
  {
    uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v10 = [v14 localizedStringForKey:@"kWFLocBuddyFooterViewTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v15 = [v5 row];
  BOOL v16 = [(WFBuddyViewController *)self sortedNetworks];
  unint64_t v17 = [v16 count];

  if (v15 >= v17) {
    goto LABEL_12;
  }
  double v18 = *MEMORY[0x263F839B8];
LABEL_13:

  return v18;
}

- (id)_cellForNetworkRecord:(id)a3 tableView:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  int64_t v9 = [a4 dequeueReusableCellWithIdentifier:@"WFBuddyNetworkListCell" forIndexPath:a5];
  unint64_t v10 = [v8 title];
  [v9 setTitle:v10];

  [v9 setSubtitle:0];
  objc_msgSend(v9, "setPersonalHotspot:", objc_msgSend(v8, "iOSHotspot"));
  objc_msgSend(v9, "setSecure:", objc_msgSend(v8, "isSecure"));
  [v8 scaledRSSI];
  [v9 setBars:WFSignalBarsFromScaledRSSI(v11)];
  uint64_t v12 = [v8 ssid];

  uint64_t v13 = [(WFBuddyViewController *)self currentNetwork];
  uint64_t v14 = [v13 ssid];
  int v15 = [v12 isEqualToString:v14];

  if (v15)
  {
    [(WFBuddyViewController *)self currentNetworkScaledRSSI];
    [v9 setBars:WFSignalBarsFromScaledRSSI(v16)];
    [v9 setState:self->_currentNetworkState];
  }
  if ([(WFBuddyViewController *)self showNetworkSettings]) {
    uint64_t v17 = 4;
  }
  else {
    uint64_t v17 = 0;
  }
  [v9 setAccessoryType:v17];
  double v18 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  uint64_t v19 = (void *)MEMORY[0x263F81708];
  [v18 pointSize];
  uint64_t v20 = objc_msgSend(v19, "boldSystemFontOfSize:");
  long long v21 = [v9 nameLabel];
  [v21 setFont:v20];

  double v22 = [MEMORY[0x263F825C8] defaultTextColor];
  double v23 = [v9 textLabel];
  [v23 setTextColor:v22];

  id v24 = v9;
  return v24;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v8 = a4;
  if (![v8 section])
  {
    id v5 = [(WFBuddyViewController *)self sortedNetworks];
    id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v8, "row"));

    id v7 = [(WFBuddyViewController *)self listDelegate];
    [v7 networkListViewController:self showSettingsForNetwork:v6 context:1];
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    id v6 = [(WFBuddyViewController *)self alternateSetupFooter];
    if (v6)
    {
      id v7 = v6;
      BOOL v8 = [(WFBuddyViewController *)self showAdditionalSetupInfo];

      if (v8)
      {
        id v6 = [(WFBuddyViewController *)self alternateSetupFooter];
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x263F839B8];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x263F839B8];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
  {
    int v20 = 136315394;
    long long v21 = "-[WFBuddyViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_2257EC000, v8, v9, "%s: indexPath %@", (uint8_t *)&v20, 0x16u);
  }

  unint64_t v10 = [(WFBuddyViewController *)self sections];
  float v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

  uint64_t v12 = [v11 integerValue];
  if (v12 == 2)
  {
    float v16 = [(WFBuddyViewController *)self buddyDelegate];
    [v16 buddyViewControllerDidPressAlternateSetupButton:self];
  }
  else if (!v12)
  {
    uint64_t v13 = [v7 row];
    uint64_t v14 = [(WFBuddyViewController *)self sortedNetworks];
    uint64_t v15 = [v14 count];

    if (v13 == v15)
    {
      [(WFBuddyViewController *)self _chooseOtherNetworkTapped:0];
    }
    else
    {
      uint64_t v17 = [(WFBuddyViewController *)self sortedNetworks];
      double v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v7, "row"));

      uint64_t v19 = [(WFBuddyViewController *)self listDelegate];
      [v19 networkListViewController:self didTapRecord:v18];
    }
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a4;
  if (a5 == 1)
  {
    id v14 = v7;
    BOOL v8 = [(WFBuddyViewController *)self alternateSetupFooter];
    id v7 = v14;
    if (v8)
    {
      BOOL v9 = [(WFBuddyViewController *)self showAdditionalSetupInfo];

      id v7 = v14;
      if (v9)
      {
        unint64_t v10 = (void *)MEMORY[0x263F825C8];
        id v11 = v14;
        uint64_t v12 = [v10 altTextColor];
        uint64_t v13 = [v11 textLabel];

        [v13 setTextColor:v12];
        id v7 = v14;
      }
    }
  }
}

- (void)_chooseOtherNetworkTapped:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v8 = 136315394;
    BOOL v9 = "-[WFBuddyViewController _chooseOtherNetworkTapped:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: sender %@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(WFBuddyViewController *)self listDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 networkListViewControllerDidTapOtherNetwork:self];
  }
}

- (void)_enableWAPISwitchChanged:(id)a3
{
  id v4 = a3;
  id v6 = [(WFBuddyViewController *)self listDelegate];
  uint64_t v5 = [v4 isOn];

  [v6 networkListViewController:self setWAPIEnabled:v5];
}

- (UISwitch)enableWAPISwitch
{
  enableWAPISwitch = self->_enableWAPISwitch;
  if (!enableWAPISwitch)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C40]);
    uint64_t v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->_enableWAPISwitch;
    self->_enableWAPISwitch = v5;
    id v7 = v5;

    [(UISwitch *)self->_enableWAPISwitch addTarget:self action:sel__enableWAPISwitchChanged_ forControlEvents:4096];
    enableWAPISwitch = self->_enableWAPISwitch;
  }
  return enableWAPISwitch;
}

- (void)_notifyBuddyWiFiPickerIsVisble:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    int v8 = "-[WFBuddyViewController _notifyBuddyWiFiPickerIsVisble:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_2257EC000, v4, v5, "%s: visible %d", (uint8_t *)&v7, 0x12u);
  }

  int v6 = _notifyBuddyWiFiPickerIsVisble__token;
  if (_notifyBuddyWiFiPickerIsVisble__token != -1
    || (notify_register_check("com.apple.airportsettingsvisible", &_notifyBuddyWiFiPickerIsVisble__token),
        int v6 = _notifyBuddyWiFiPickerIsVisble__token,
        _notifyBuddyWiFiPickerIsVisble__token != -1))
  {
    notify_set_state(v6, v3);
    notify_post("com.apple.airportsettingsvisible");
  }
}

- (id)_nameOfSection:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"invalid section";
  }
  else {
    return off_264756E70[a3];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_debugSectionStringFromSections:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = [MEMORY[0x263F089D8] string];
  uint64_t v6 = [v4 count];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = -[WFBuddyViewController _nameOfSection:](self, "_nameOfSection:", [*(id *)(*((void *)&v15 + 1) + 8 * i) integerValue]);
        [v5 appendFormat:@"%lu: %@", v9 + i, v12];

        if (1 - v6 + v9 + i) {
          [v5 appendString:@", "];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      v9 += i;
    }
    while (v8);
  }

  return v5;
}

- (WFNetworkListRecord)currentNetwork
{
  return (WFNetworkListRecord *)objc_getProperty(self, a2, 1248, 1);
}

- (int64_t)currentNetworkState
{
  return self->_currentNetworkState;
}

- (float)currentNetworkScaledRSSI
{
  return self->_currentNetworkScaledRSSI;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (BOOL)showOtherNetwork
{
  return self->showOtherNetwork;
}

- (void)setShowOtherNetwork:(BOOL)a3
{
  self->showOtherNetwork = a3;
}

- (BOOL)showNetworkSettings
{
  return self->_showNetworkSettings;
}

- (BOOL)networkListVisible
{
  return self->_networkListVisible;
}

- (void)setNetworkListVisible:(BOOL)a3
{
  self->_networkListVisible = a3;
}

- (BOOL)showAdditionalSetupInfo
{
  return self->_showAdditionalSetupInfo;
}

- (BOOL)supportsCellularActivation
{
  return self->_supportsCellularActivation;
}

- (WFBuddyViewControllerDelegate)buddyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buddyDelegate);
  return (WFBuddyViewControllerDelegate *)WeakRetained;
}

- (void)setBuddyDelegate:(id)a3
{
}

- (NSArray)sortedNetworks
{
  return self->_sortedNetworks;
}

- (void)setSortedNetworks:(id)a3
{
}

- (WFNetworkListDelegate)listDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  return (WFNetworkListDelegate *)WeakRetained;
}

- (void)setListDelegate:(id)a3
{
}

- (NSString)alternateSetupTitle
{
  return self->_alternateSetupTitle;
}

- (void)setAlternateSetupTitle:(id)a3
{
}

- (NSString)alternateSetupFooter
{
  return self->_alternateSetupFooter;
}

- (void)setAlternateSetupFooter:(id)a3
{
}

- (UIView)buddyIPadContainerView
{
  return self->_buddyIPadContainerView;
}

- (void)setBuddyIPadContainerView:(id)a3
{
}

- (NSOrderedSet)sections
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1320, 1);
}

- (void)setSections:(id)a3
{
}

- (void)setEnableWAPISwitch:(id)a3
{
}

- (BOOL)tableViewIsUpdating
{
  return self->_tableViewIsUpdating;
}

- (void)setTableViewIsUpdating:(BOOL)a3
{
  self->_BOOL tableViewIsUpdating = a3;
}

- (BOOL)networkResultsChangedWhileUIUpdates
{
  return self->_networkResultsChangedWhileUIUpdates;
}

- (void)setNetworkResultsChangedWhileUIUpdates:(BOOL)a3
{
  self->_networkResultsChangedWhileUIUpdates = a3;
}

- (BOOL)tableReloadRequestQueued
{
  return self->_tableReloadRequestQueued;
}

- (void)setTableReloadRequestQueued:(BOOL)a3
{
  self->_BOOL tableReloadRequestQueued = a3;
}

- (NSArray)pendingNetworks
{
  return self->_pendingNetworks;
}

- (void)setPendingNetworks:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_pendingNetworks, 0);
  objc_storeStrong((id *)&self->_enableWAPISwitch, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_buddyIPadContainerView, 0);
  objc_storeStrong((id *)&self->_alternateSetupFooter, 0);
  objc_storeStrong((id *)&self->_alternateSetupTitle, 0);
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_sortedNetworks, 0);
  objc_destroyWeak((id *)&self->_buddyDelegate);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
}

@end