@interface WFAirportViewController
- (BOOL)_askToJoinShouldBeVisible;
- (BOOL)_isChinaDevice;
- (BOOL)_refreshATJShownStateIfChanged;
- (BOOL)_shouldContinueUpdateNetworkList;
- (BOOL)askToJoinShown;
- (BOOL)disablePowerModification;
- (BOOL)isAuthenticating;
- (BOOL)isInEditingMode;
- (BOOL)isManagedAppleID;
- (BOOL)isUsingSwiftList;
- (BOOL)networkResultsChangedWhileUIUpdates;
- (BOOL)powered;
- (BOOL)shouldPromptWhenCarPlaySessionIsActive;
- (BOOL)shouldPromptWhenPersonalHotspotIsEnabled;
- (BOOL)showDiagnostics;
- (BOOL)showDiagnosticsCell;
- (BOOL)showKnownNetworks;
- (BOOL)showNANUI;
- (BOOL)showOtherNetwork;
- (BOOL)supportsHealthRecommendations;
- (BOOL)supportsWiFiPasswordSharing;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableViewIsUpdating;
- (BOOL)usePlacardCell;
- (BOOL)userAutoJoinEnabled;
- (NSArray)adhocNetworks;
- (NSArray)infraNetworks;
- (NSArray)knownNetworks;
- (NSArray)managedKnownNetworks;
- (NSArray)networksToBeDeleted;
- (NSArray)popularNetworks;
- (NSArray)unconfiguredNetworks;
- (NSMutableArray)editableKnownNetworks;
- (NSOrderedSet)previousSections;
- (NSOrderedSet)sections;
- (NSSet)allNetworks;
- (NSSet)pendingNetworks;
- (NSString)currentInfraHeaderText;
- (NSString)currentKnownHeaderText;
- (NSString)currentNetworkSubtitle;
- (NSString)currentUnconfiguredHeaderText;
- (NSString)powerOffLocationWarning;
- (NSString)userAutoJoinDisabledWarning;
- (OS_dispatch_queue)internalQueue;
- (UIBarButtonItem)originalBackButtonItem;
- (WFAirportViewController)init;
- (WFAirportViewControllerDelegate)listDelegate;
- (WFLockView)screenProtector;
- (WFNetworkListRecord)currentNetwork;
- (WFNetworkListRecord)joiningHotspot;
- (WFNetworkRowConfig)currentNetworkRowConfig;
- (WFPendingNetworkUpdate)pendingCurrentNetworkUpdate;
- (WFTableViewHeaderView)chooseNetworkHeader;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (float)currentNetworkScaledRSSI;
- (id)_askToJoinFooterString;
- (id)_askToJoinFooterStringForMode:(int64_t)a3;
- (id)_askToJoinStateStringForATJMode:(int64_t)a3;
- (id)_currentNetworkCell;
- (id)_currentNetworkCellIndexPath;
- (id)_defaultSectionsForEditing;
- (id)_defaultSectionsForPowerState:(BOOL)a3;
- (id)_getAutoHotspotOptionText:(int64_t)a3;
- (id)_indexPathForNetworkName:(id)a3;
- (id)_nameOfSection:(unint64_t)a3;
- (id)_passcodePromptForViewingKnownNetworksIsChinaDevice:(BOOL)a3;
- (id)_sectionNameAtIndex:(unint64_t)a3;
- (id)_sortedProfilesFromSet:(id)a3;
- (id)_tableCellForKnownNetwork:(id)a3 tableView:(id)a4 indexPath:(id)a5 extraLeadingPadding:(BOOL)a6;
- (id)_tableCellForNetwork:(id)a3 tableView:(id)a4 indexPath:(id)a5;
- (id)_touchIDPromptForKnownNetworksIsChinaDevice:(BOOL)a3;
- (id)_wifiKnownNetworkContextOptionsIsChinaDevice:(BOOL)a3;
- (id)headerIdentifierForSectionType:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)titleForHeaderInSection:(int64_t)a3;
- (int64_t)_askToJoinMode;
- (int64_t)_askToJoinModeFromString:(id)a3;
- (int64_t)currentNetworkState;
- (int64_t)deviceCapability;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowCountWithPlacardCell:(int64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_sectionTypeAtSection:(int64_t)a3;
- (unint64_t)powerState;
- (void)_adjustNavigationItemsForEditingMode;
- (void)_dumpSections;
- (void)_enableWAPISwitchChanged:(id)a3;
- (void)_loadEditButton;
- (void)_powerSwitchChanged:(id)a3;
- (void)_processPendingCurrentNetworkUpdate;
- (void)_promptAuthToViewKnownNetworkList;
- (void)_promptToJoinAdhoc:(id)a3;
- (void)_pushAskToJoinModeSelectionViewController;
- (void)_pushAutoInstantHotspotOptionSelectionViewController;
- (void)_reloadCurrentNetworkCell;
- (void)_reloadPowerSection;
- (void)_reloadSectionForHotspotChange;
- (void)_removeScreenProtector;
- (void)_submitDeletion;
- (void)_transitionToKnownNetworksList;
- (void)_transitionToScanList;
- (void)_updateAskToJoinMode:(int64_t)a3;
- (void)_updateCellsWithNewData:(id)a3 oldData:(id)a4 inSection:(unint64_t)a5 insertSection:(BOOL)a6 datasourceSection:(unint64_t)a7;
- (void)_updateKnownNetworksDoneButtonForEditability;
- (void)_updateNetworkRestrictionHeader;
- (void)cancelEditing;
- (void)editKnownNetworks;
- (void)finishEditing;
- (void)knownNetworksDidBecomeActive;
- (void)knownNetworksWillEnterForeground;
- (void)knownNetworksWillResignActive;
- (void)loadView;
- (void)managedAppleIDStateChange:(BOOL)a3;
- (void)powerModificationStateDidChange:(BOOL)a3;
- (void)powerStateDidChange:(BOOL)a3;
- (void)powerStateDidChangeToggle:(unint64_t)a3;
- (void)promptConfirmAlert;
- (void)refresh;
- (void)refreshKnownNetworksUpdateTableView:(BOOL)a3;
- (void)reloadCellsForNetworkNames:(id)a3;
- (void)scrollToAirportCell:(unint64_t)a3;
- (void)setAdhocNetworks:(id)a3;
- (void)setAllNetworks:(id)a3;
- (void)setAskToJoinMode:(int64_t)a3;
- (void)setAskToJoinShown:(BOOL)a3;
- (void)setAutoInstantHotspotJoinOption:(int64_t)a3;
- (void)setChooseNetworkHeader:(id)a3;
- (void)setCurrentInfraHeaderText:(id)a3;
- (void)setCurrentKnownHeaderText:(id)a3;
- (void)setCurrentNetwork:(id)a3;
- (void)setCurrentNetwork:(id)a3 previousNetwork:(id)a4 reason:(unint64_t)a5;
- (void)setCurrentNetworkRowConfig:(id)a3;
- (void)setCurrentNetworkScaledRSSI:(float)a3;
- (void)setCurrentNetworkState:(int64_t)a3;
- (void)setCurrentNetworkSubtitle:(id)a3;
- (void)setCurrentUnconfiguredHeaderText:(id)a3;
- (void)setDeviceCapability:(int64_t)a3;
- (void)setDisablePowerModification:(BOOL)a3;
- (void)setEditableKnownNetworks:(id)a3;
- (void)setInfraNetworks:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsAuthenticating:(BOOL)a3;
- (void)setIsInEditingMode:(BOOL)a3;
- (void)setIsManagedAppleID:(BOOL)a3;
- (void)setIsUsingSwiftList:(BOOL)a3;
- (void)setJoiningHotspot:(id)a3;
- (void)setKnownNetworks:(id)a3;
- (void)setListDelegate:(id)a3;
- (void)setManagedKnownNetworks:(id)a3;
- (void)setNetworkResultsChangedWhileUIUpdates:(BOOL)a3;
- (void)setNetworks:(id)a3;
- (void)setNetworksToBeDeleted:(id)a3;
- (void)setOriginalBackButtonItem:(id)a3;
- (void)setPendingCurrentNetworkUpdate:(id)a3;
- (void)setPendingNetworks:(id)a3;
- (void)setPopularNetworks:(id)a3;
- (void)setPowerOffLocationWarning:(id)a3;
- (void)setPreviousSections:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setScreenProtector:(id)a3;
- (void)setSections:(id)a3;
- (void)setShowDiagnostics:(BOOL)a3;
- (void)setShowKnownNetworks:(BOOL)a3;
- (void)setShowNANUI:(BOOL)a3;
- (void)setShowOtherNetwork:(BOOL)a3;
- (void)setTableViewIsUpdating:(BOOL)a3;
- (void)setUnconfiguredNetworks:(id)a3;
- (void)setUsePlacardCell:(BOOL)a3;
- (void)setUserAutoJoinDisabledWarning:(id)a3;
- (void)setUserAutoJoinEnabled:(BOOL)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateAutoInstantHotspotSetting:(int64_t)a3;
- (void)updateViewsForNetworks:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation WFAirportViewController

- (WFAirportViewController)init
{
  if (WFShouldUseInsetTableView()) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  v14.receiver = self;
  v14.super_class = (Class)WFAirportViewController;
  v4 = [(WFAirportViewController *)&v14 initWithStyle:v3];
  if (v4
    && (dispatch_queue_t v5 = dispatch_queue_create(0, 0),
        internalQueue = v4->_internalQueue,
        v4->_internalQueue = (OS_dispatch_queue *)v5,
        internalQueue,
        v4->_internalQueue))
  {
    uint64_t v7 = [MEMORY[0x263EFF9D8] orderedSet];
    sections = v4->_sections;
    v4->_sections = (NSOrderedSet *)v7;

    v4->_showOtherNetwork = 1;
    v4->_userAutoJoinEnabled = 1;
    v4->_currentNetworkScaledRSSI = 1.0;
    v4->_askToJoinShown = [(WFAirportViewController *)v4 _askToJoinShouldBeVisible];
    v9 = [(WFAirportViewController *)v4 listDelegate];
    v4->_disablePowerModification = [v9 networkListViewControllerPowerModificationDisabled:v4];

    v10 = [(WFAirportViewController *)v4 listDelegate];
    v4->_isManagedAppleID = [v10 networkListViewControllerIsManagedAppleID:v4];

    v4->_isInEditingMode = 0;
    v4->_tableViewIsUpdating = 0;
    v4->_networkResultsChangedWhileUIUpdates = 0;
    uint64_t v11 = +[WFNetworkRowConfig settingsNetworkRowConfig];
    currentNetworkRowConfig = v4->_currentNetworkRowConfig;
    v4->_currentNetworkRowConfig = (WFNetworkRowConfig *)v11;

    v4->_isUsingSwiftList = 0;
    v4->_isAuthenticating = 0;
    v4->_usePlacardCell = _os_feature_enabled_impl();
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)loadView
{
  v33.receiver = self;
  v33.super_class = (Class)WFAirportViewController;
  [(WFInsetTableViewController *)&v33 loadView];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [MEMORY[0x263F829D0] nibWithNibName:@"WFNetworkListCell" bundle:v3];
  dispatch_queue_t v5 = [(WFAirportViewController *)self tableView];
  [v5 registerNib:v4 forCellReuseIdentifier:@"WFNetworkCell"];

  v6 = [MEMORY[0x263F829D0] nibWithNibName:@"WFHotspotCell" bundle:v3];
  uint64_t v7 = [(WFAirportViewController *)self tableView];
  [v7 registerNib:v6 forCellReuseIdentifier:@"WFHotspotCell"];

  v8 = [(WFAirportViewController *)self tableView];
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFWiFiPlacardCell"];

  v9 = [(WFAirportViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFOtherNetworkCell"];

  v10 = [(WFAirportViewController *)self tableView];
  [v10 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFPowerCell"];

  uint64_t v11 = [(WFAirportViewController *)self tableView];
  [v11 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFUnconfiguredNetworkCell"];

  v12 = [(WFAirportViewController *)self tableView];
  [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFDiagnosticsCell"];

  v13 = [(WFAirportViewController *)self tableView];
  [v13 registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFNetworkDataUsageCellIdentifier"];

  objc_super v14 = [(WFAirportViewController *)self tableView];
  [v14 registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFNetworkWAPICellIdentifier"];

  v15 = [(WFAirportViewController *)self tableView];
  [v15 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFNetworkKnownNetworksCellIdentifier"];

  v16 = [(WFAirportViewController *)self tableView];
  [v16 registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFNetworkEditableNetworksListCellIdentifier"];

  v17 = [(WFAirportViewController *)self tableView];
  [v17 registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFNetworkProfileNetworksListCellIdentifier"];

  v18 = [(WFAirportViewController *)self tableView];
  [v18 registerClass:objc_opt_class() forCellReuseIdentifier:@"kWFNetworkAlternativeCellIdentifier"];

  v19 = [(WFAirportViewController *)self tableView];
  [v19 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kWFTableKnownHeaderIdentifier"];

  v20 = [(WFAirportViewController *)self tableView];
  [v20 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kWFTableInfraHeaderIdentifier"];

  v21 = [(WFAirportViewController *)self tableView];
  [v21 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kWFTablePopularHeaderIdentifier"];

  v22 = [(WFAirportViewController *)self tableView];
  [v22 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kWFTableAdhocHeaderIdentifier"];

  v23 = [(WFAirportViewController *)self tableView];
  [v23 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kWFTableEditableHeaderIdentifier"];

  v24 = [(WFAirportViewController *)self tableView];
  [v24 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kWFTableManagedHeaderIdentifier"];

  v25 = [(WFAirportViewController *)self tableView];
  [v25 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kWFTableUnconfiguredHeaderIdentifier"];

  double v26 = *MEMORY[0x263F839B8];
  v27 = [(WFAirportViewController *)self tableView];
  [v27 setRowHeight:v26];

  v28 = [(WFAirportViewController *)self tableView];
  [v28 setEstimatedRowHeight:v26];

  v29 = [(WFAirportViewController *)self tableView];
  [v29 setEstimatedSectionFooterHeight:0.0];

  v30 = [(WFAirportViewController *)self tableView];
  [v30 setEstimatedSectionHeaderHeight:0.0];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WFAirportViewController_loadView__block_invoke;
  block[3] = &unk_2647561B8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __35__WFAirportViewController_loadView__block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) listDelegate];
  objc_msgSend(*(id *)(a1 + 32), "setShowDiagnostics:", objc_msgSend(v9, "airportSettingsViewControllerShouldShowDiagnosticsMode:", *(void *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "setShowKnownNetworks:", objc_msgSend(v9, "airportSettingsViewControllerShouldShowKnownNetworks:", *(void *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "setShowNANUI:", objc_msgSend(v9, "airportSettingsViewControllerShouldShowNANUI:", *(void *)(a1 + 32)));
  v2 = objc_msgSend(*(id *)(a1 + 32), "_defaultSectionsForPowerState:", objc_msgSend(*(id *)(a1 + 32), "powered"));
  [*(id *)(a1 + 32) setSections:v2];

  if ([*(id *)(a1 + 32) showKnownNetworks])
  {
    uint64_t v3 = [*(id *)(a1 + 32) sections];
    v4 = (void *)[v3 mutableCopy];

    [v4 addObject:&unk_26D911AE8];
    [*(id *)(a1 + 32) setSections:v4];
  }
  dispatch_queue_t v5 = [*(id *)(a1 + 32) listDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) listDelegate];
    *(void *)(*(void *)(a1 + 32) + 1080) = [v7 networkListViewControllerOverrideDeviceCapability:*(void *)(a1 + 32)];
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 1080) = WFCurrentDeviceCapability();
  }
  [*(id *)(a1 + 32) _loadEditButton];
  v8 = [*(id *)(a1 + 32) tableView];
  [v8 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAirportViewController;
  [(WFAirportViewController *)&v5 viewWillAppear:a3];
  [(WFAirportViewController *)self refresh];
  v4 = [(WFAirportViewController *)self listDelegate];
  [v4 networkListViewControllerDidAppear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAirportViewController;
  [(WFAirportViewController *)&v5 viewDidDisappear:a3];
  v4 = [(WFAirportViewController *)self listDelegate];
  [v4 networkListViewControllerDidDisappear:self];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WFAirportViewController;
  [(WFAirportViewController *)&v3 viewDidLoad];
  [(WFAirportViewController *)self _updateNetworkRestrictionHeader];
}

- (void)willMoveToParentViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFAirportViewController;
  -[WFAirportViewController willMoveToParentViewController:](&v8, sel_willMoveToParentViewController_);
  if (!a3)
  {
    objc_super v5 = [(WFAirportViewController *)self parentViewController];
    char v6 = [v5 navigationItem];
    [v6 setTitleView:0];

    uint64_t v7 = [(WFAirportViewController *)self navigationItem];
    [v7 setTitleView:0];
  }
}

- (void)setDeviceCapability:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  self->_deviceCapability = a3;
  v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    char v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      uint64_t v7 = WFStringFromDeviceCapability(a3);
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_2257EC000, v6, v5, "Device Capability: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (BOOL)showDiagnosticsCell
{
  if ([(WFAirportViewController *)self showDiagnostics]) {
    return 1;
  }
  return [(WFAirportViewController *)self showNANUI];
}

- (void)setCurrentNetworkState:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(WFAirportViewController *)self isInEditingMode])
  {
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2257EC000, v5, v6, "Not setting current network state for current network in edit mode", buf, 2u);
    }
  }
  else
  {
    if (self->_currentNetworkState == a3) {
      return;
    }
    self->_currentNetworkState = a3;
    uint64_t v7 = [(WFAirportViewController *)self listDelegate];
    uint64_t v8 = [v7 airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:self];

    id v9 = [(WFAirportViewController *)self currentNetworkRowConfig];
    [v9 setConnectionState:a3];

    uint64_t v10 = [(WFAirportViewController *)self currentNetworkRowConfig];
    [v10 setProblematicConnection:v8];

    os_log_type_t v5 = [(WFAirportViewController *)self joiningHotspot];
    if (v5)
    {
      uint64_t v11 = WFLogForCategory(0);
      os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[WFAirportViewController setCurrentNetworkState:]";
        __int16 v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_2257EC000, v11, v12, "%s: joining hotspot %@", buf, 0x16u);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__WFAirportViewController_setCurrentNetworkState___block_invoke;
      block[3] = &unk_2647561B8;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    v13 = [(WFAirportViewController *)self _currentNetworkCell];
    objc_super v14 = v13;
    if (v13)
    {
      [v13 setConnectionError:v8];
      [v14 setState:self->_currentNetworkState];
    }
    else
    {
      v15 = WFLogForCategory(0);
      os_log_type_t v16 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v15 && os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[WFAirportViewController setCurrentNetworkState:]";
        _os_log_impl(&dword_2257EC000, v15, v16, "%s: nil currentNetwork cell", buf, 0xCu);
      }
    }
  }
}

uint64_t __50__WFAirportViewController_setCurrentNetworkState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadSectionForHotspotChange];
}

- (void)setCurrentNetworkScaledRSSI:(float)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(WFAirportViewController *)self isInEditingMode])
  {
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_2257EC000, v5, v6, "Not setting RSSI for current network in edit mode", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    if (self->_currentNetworkScaledRSSI == a3) {
      return;
    }
    self->_currentNetworkScaledRSSI = a3;
    uint64_t v7 = [(WFAirportViewController *)self listDelegate];
    uint64_t v8 = [v7 airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:self];

    uint64_t v9 = WFSignalBarsFromScaledRSSI(self->_currentNetworkScaledRSSI);
    uint64_t v10 = [(WFAirportViewController *)self currentNetworkRowConfig];
    [v10 setSignalBars:v9];

    uint64_t v11 = [(WFAirportViewController *)self currentNetworkRowConfig];
    [v11 setProblematicConnection:v8];

    os_log_type_t v12 = [(WFAirportViewController *)self _currentNetworkCell];
    os_log_type_t v5 = v12;
    if (v12)
    {
      if (v8)
      {
        [v12 setConnectionError:1];
      }
      else
      {
        [v12 setConnectionError:0];
        [v5 setBars:WFSignalBarsFromScaledRSSI(self->_currentNetworkScaledRSSI)];
      }
    }
    else
    {
      v13 = WFLogForCategory(0);
      os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
      {
        int v15 = 136315138;
        os_log_type_t v16 = "-[WFAirportViewController setCurrentNetworkScaledRSSI:]";
        _os_log_impl(&dword_2257EC000, v13, v14, "%s: nil currentNetwork cell", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)setCurrentNetwork:(id)a3
{
  id v4 = a3;
  if ([(WFAirportViewController *)self isInEditingMode])
  {
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_2257EC000, v5, v6, "Not updating current network in edit mode", v7, 2u);
    }
  }
  else
  {
    [(WFAirportViewController *)self setCurrentNetwork:v4 previousNetwork:0 reason:0];
  }
}

- (void)setCurrentNetwork:(id)a3 previousNetwork:(id)a4 reason:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__WFAirportViewController_setCurrentNetwork_previousNetwork_reason___block_invoke;
  v13[3] = &unk_2647561E0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(internalQueue, v13);
}

void __68__WFAirportViewController_setCurrentNetwork_previousNetwork_reason___block_invoke(uint64_t a1)
{
  *(void *)&v226[11] = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(a1 + 32) joiningHotspot];
  if (v4)
  {
    [*(id *)(a1 + 32) setJoiningHotspot:0];
    os_log_type_t v5 = WFLogForCategory(0);
    v1 = (void *)OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
    {
      v2 = v5;
      if (os_log_type_enabled(v2, (os_log_type_t)v1))
      {
        *(_DWORD *)buf = 136315394;
        v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        __int16 v222 = 2112;
        *(void *)v223 = v4;
        _os_log_impl(&dword_2257EC000, v2, (os_log_type_t)v1, "%s: joining hotspot %@, clearing and resetting state", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 32) _reloadSectionForHotspotChange];
  }
  os_log_type_t v6 = [*(id *)(a1 + 32) currentNetwork];
  if (v6 && *(void *)(a1 + 40))
  {
    v1 = [*(id *)(a1 + 32) currentNetwork];
    if ([v1 isEqual:*(void *)(a1 + 40)])
    {
      v2 = [*(id *)(a1 + 32) currentNetwork];
      int v7 = [v2 canBeDisplayedAsCurrent];
      if (v7 == [*(id *)(a1 + 40) canBeDisplayedAsCurrent])
      {

        goto LABEL_41;
      }
      int v8 = 1;
      int v9 = 1;
    }
    else
    {
      int v8 = 0;
      int v9 = 1;
    }
  }
  else
  {
    int v8 = 0;
    int v9 = 0;
  }
  uint64_t v10 = [*(id *)(a1 + 32) currentNetwork];
  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = *(void *)(a1 + 40) == 0;
  }

  if (v8)
  {

    if ((v9 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if (v9)
  {
LABEL_23:

    if (!v11) {
      goto LABEL_24;
    }
LABEL_41:
    id v15 = WFLogForCategory(0);
    os_log_type_t v33 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15)
    {
      id v15 = v15;
      if (os_log_type_enabled(v15, v33))
      {
        v34 = [*(id *)(a1 + 32) currentNetwork];
        v35 = [*(id *)(a1 + 32) currentNetwork];
        uint64_t v36 = [v35 hash];
        *(_DWORD *)buf = 136315650;
        v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        __int16 v222 = 2112;
        *(void *)v223 = v34;
        *(_WORD *)&v223[8] = 2048;
        uint64_t v224 = v36;
        _os_log_impl(&dword_2257EC000, v15, v33, "%s: no change to current network (%@ - %lu)", buf, 0x20u);
      }
    }
    goto LABEL_46;
  }
LABEL_20:

  if (v11) {
    goto LABEL_41;
  }
LABEL_24:
  int v12 = [*(id *)(a1 + 32) _refreshATJShownStateIfChanged];
  int v13 = [*(id *)(a1 + 32) powered];
  uint64_t v14 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v14 + 1042))
  {
    id v15 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v16)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    uint64_t v17 = "Trying to set current network in editing mode, discard operation.";
    v18 = v15;
    os_log_type_t v19 = v16;
    uint32_t v20 = 2;
LABEL_39:
    _os_log_impl(&dword_2257EC000, v18, v19, v17, buf, v20);
LABEL_46:

    goto LABEL_47;
  }
  int v21 = v13;
  int v22 = *(unsigned __int8 *)(v14 + 1040);
  v23 = WFLogForCategory(0);
  if (v22)
  {
    os_log_type_t v24 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v23)
    {
      v25 = v23;
      if (os_log_type_enabled(v25, v24))
      {
        double v26 = *(const char **)(a1 + 40);
        v27 = [*(id *)(a1 + 32) currentNetwork];
        *(_DWORD *)buf = 138412546;
        v221 = v26;
        __int16 v222 = 2112;
        *(void *)v223 = v27;
        _os_log_impl(&dword_2257EC000, v25, v24, "table view update in progress, pending network update to '%@' current network='%@'", buf, 0x16u);
      }
    }

    v28 = [[WFPendingNetworkUpdate alloc] initWithNetwork:*(void *)(a1 + 40)];
    uint64_t v29 = *(void *)(a1 + 32);
    v30 = *(void **)(v29 + 1200);
    *(void *)(v29 + 1200) = v28;

    id v15 = WFLogForCategory(0);
    os_log_type_t v31 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v31)) {
      goto LABEL_46;
    }
    uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 1200);
    *(_DWORD *)buf = 136315394;
    v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    __int16 v222 = 2112;
    *(void *)v223 = v32;
    uint64_t v17 = "%s: pending network update initialized %@";
    v18 = v15;
    os_log_type_t v19 = v31;
    uint32_t v20 = 22;
    goto LABEL_39;
  }
  os_log_type_t v37 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v23)
  {
    v38 = v23;
    if (os_log_type_enabled(v38, v37))
    {
      v39 = [*(id *)(a1 + 48) ssid];
      [*(id *)(a1 + 40) ssid];
      v40 = int v214 = v12;
      __WFNetworkListNetworkChangeReasonToString(*(void *)(a1 + 56));
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      __int16 v222 = 2112;
      *(void *)v223 = v39;
      *(_WORD *)&v223[8] = 2112;
      uint64_t v224 = (uint64_t)v40;
      __int16 v225 = 1024;
      *(_DWORD *)v226 = v21;
      v226[2] = 2112;
      *(void *)&v226[3] = v41;
      _os_log_impl(&dword_2257EC000, v38, v37, "%s: old: %@ new: %@ powered: %d reason: %@", buf, 0x30u);

      int v12 = v214;
    }
  }
  v42 = [*(id *)(a1 + 32) tableView];
  [v42 beginUpdates];

  v43 = *(void **)(a1 + 40);
  if (!v43)
  {
    id v15 = WFLogForCategory(0);
    os_log_type_t v49 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v49)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136315138;
    v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    v50 = "%s: current network is nil";
    goto LABEL_61;
  }
  if (![v43 isAdhoc])
  {
    if ([*(id *)(a1 + 40) isUnconfiguredAccessory])
    {
      v51 = [*(id *)(a1 + 32) unconfiguredNetworks];

      if (v51)
      {
        v52 = [*(id *)(a1 + 32) unconfiguredNetworks];
        id v15 = [v52 indexOfObject:*(void *)(a1 + 40)];

        v46 = [*(id *)(a1 + 32) sections];
        v47 = v46;
        v48 = &unk_26D911B18;
        goto LABEL_74;
      }
      id v15 = WFLogForCategory(0);
      os_log_type_t v49 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v49))
      {
        *(_DWORD *)buf = 136315138;
        v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v50 = "%s: no unconfigured networks";
LABEL_61:
        _os_log_impl(&dword_2257EC000, v15, v49, v50, buf, 0xCu);
      }
    }
    else if ([*(id *)(a1 + 40) isPopular])
    {
      v53 = [*(id *)(a1 + 32) popularNetworks];

      if (v53)
      {
        v54 = [*(id *)(a1 + 32) popularNetworks];
        id v15 = [v54 indexOfObject:*(void *)(a1 + 40)];

        v46 = [*(id *)(a1 + 32) sections];
        v47 = v46;
        v48 = &unk_26D911B30;
        goto LABEL_74;
      }
      id v15 = WFLogForCategory(0);
      os_log_type_t v49 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v49))
      {
        *(_DWORD *)buf = 136315138;
        v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v50 = "%s: no popular networks";
        goto LABEL_61;
      }
    }
    else
    {
      int v55 = [*(id *)(a1 + 40) isKnown];
      v56 = *(void **)(a1 + 32);
      if (v55)
      {
        v57 = [v56 knownNetworks];

        if (v57)
        {
          v58 = [*(id *)(a1 + 32) knownNetworks];
          id v15 = [v58 indexOfObject:*(void *)(a1 + 40)];

          v46 = [*(id *)(a1 + 32) sections];
          v47 = v46;
          v48 = &unk_26D911B48;
          goto LABEL_74;
        }
        id v15 = WFLogForCategory(0);
        os_log_type_t v49 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v49))
        {
          *(_DWORD *)buf = 136315138;
          v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          v50 = "%s: no known networks";
          goto LABEL_61;
        }
      }
      else
      {
        v59 = [v56 infraNetworks];

        if (v59)
        {
          v60 = [*(id *)(a1 + 32) infraNetworks];
          id v15 = [v60 indexOfObject:*(void *)(a1 + 40)];

          v46 = [*(id *)(a1 + 32) sections];
          v47 = v46;
          v48 = &unk_26D911B60;
          goto LABEL_74;
        }
        id v15 = WFLogForCategory(0);
        os_log_type_t v49 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v49))
        {
          *(_DWORD *)buf = 136315138;
          v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          v50 = "%s: no infrastructure networks";
          goto LABEL_61;
        }
      }
    }
LABEL_62:

    goto LABEL_132;
  }
  v44 = [*(id *)(a1 + 32) adhocNetworks];

  if (!v44)
  {
    id v15 = WFLogForCategory(0);
    os_log_type_t v49 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() < 4 || !v15 || !os_log_type_enabled(v15, v49)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136315138;
    v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    v50 = "%s: no adhoc networks";
    goto LABEL_61;
  }
  v45 = [*(id *)(a1 + 32) adhocNetworks];
  id v15 = [v45 indexOfObject:*(void *)(a1 + 40)];

  v46 = [*(id *)(a1 + 32) sections];
  v47 = v46;
  v48 = &unk_26D911B00;
LABEL_74:
  uint64_t v61 = [v46 indexOfObject:v48];

  v62 = WFLogForCategory(0);
  if (v61 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_log_type_t v69 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v62)
    {
      int v70 = v12;
      v71 = v62;
      if (os_log_type_enabled(v71, v69))
      {
        uint64_t v72 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        __int16 v222 = 2114;
        *(void *)v223 = v72;
        *(_WORD *)&v223[8] = 2050;
        uint64_t v224 = v61;
        __int16 v225 = 2050;
        *(void *)v226 = v15;
        _os_log_impl(&dword_2257EC000, v71, v69, "%s: can't find new current network in data %{public}@ (%{public}lu,%{public}lu)", buf, 0x2Au);
      }

      int v12 = v70;
    }

    [*(id *)(a1 + 32) _dumpSections];
  }
  else
  {
    os_log_type_t v63 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v62)
    {
      int v215 = v12;
      v64 = v62;
      if (os_log_type_enabled(v64, v63))
      {
        id v65 = [*(id *)(a1 + 32) _nameOfSection:v61];
        *(_DWORD *)buf = 136315906;
        v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        __int16 v222 = 2112;
        *(void *)v223 = v65;
        *(_WORD *)&v223[8] = 2048;
        uint64_t v224 = v61;
        __int16 v225 = 2048;
        *(void *)v226 = v15;
        _os_log_impl(&dword_2257EC000, v64, v63, "%s: removing from section %@ (%lu) at row %lu", buf, 0x2Au);
      }
      int v12 = v215;
    }

    v66 = [*(id *)(a1 + 32) pendingNetworks];
    id v15 = [v66 mutableCopy];

    [v15 removeObject:*(void *)(a1 + 40)];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1208), v15);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 1040))
    {
      v67 = WFLogForCategory(0);
      os_log_type_t v68 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v67 && os_log_type_enabled(v67, v68))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2257EC000, v67, v68, "table is updating while setting the current network", buf, 2u);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 1;
      goto LABEL_46;
    }
    if ([*(id *)(a1 + 40) isAdhoc])
    {
      int v73 = v12;
      v74 = WFLogForCategory(0);
      os_log_type_t v75 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v74)
      {
        v76 = v74;
        if (os_log_type_enabled(v76, v75))
        {
          *(_DWORD *)buf = 136315138;
          v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2257EC000, v76, v75, "%s: removing from adhoc", buf, 0xCu);
        }
      }
      v77 = [*(id *)(a1 + 32) adhocNetworks];
      v78 = (void *)[v77 mutableCopy];

      v79 = [*(id *)(a1 + 32) adhocNetworks];
      v80 = (void *)[v79 mutableCopy];

      [v78 removeObject:*(void *)(a1 + 40)];
      v81 = *(void **)(a1 + 32);
      v82 = [v81 sections];
      uint64_t v83 = [v82 indexOfObject:&unk_26D911B00];
      v84 = v81;
      v85 = v78;
      v86 = v80;
      uint64_t v87 = 4;
    }
    else if ([*(id *)(a1 + 40) isUnconfiguredAccessory])
    {
      int v73 = v12;
      v88 = WFLogForCategory(0);
      os_log_type_t v89 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v88)
      {
        v90 = v88;
        if (os_log_type_enabled(v90, v89))
        {
          *(_DWORD *)buf = 136315138;
          v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2257EC000, v90, v89, "%s: removing from accessory", buf, 0xCu);
        }
      }
      v91 = [*(id *)(a1 + 32) unconfiguredNetworks];
      v78 = (void *)[v91 mutableCopy];

      v92 = [*(id *)(a1 + 32) unconfiguredNetworks];
      v80 = (void *)[v92 mutableCopy];

      [v78 removeObject:*(void *)(a1 + 40)];
      v93 = *(void **)(a1 + 32);
      v82 = [v93 sections];
      uint64_t v83 = [v82 indexOfObject:&unk_26D911B18];
      v84 = v93;
      v85 = v78;
      v86 = v80;
      uint64_t v87 = 5;
    }
    else if ([*(id *)(a1 + 40) isPopular])
    {
      int v73 = v12;
      v94 = WFLogForCategory(0);
      os_log_type_t v95 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v94)
      {
        v96 = v94;
        if (os_log_type_enabled(v96, v95))
        {
          *(_DWORD *)buf = 136315138;
          v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2257EC000, v96, v95, "%s: removing from popular", buf, 0xCu);
        }
      }
      v97 = [*(id *)(a1 + 32) popularNetworks];
      v78 = (void *)[v97 mutableCopy];

      v98 = [*(id *)(a1 + 32) popularNetworks];
      v80 = (void *)[v98 mutableCopy];

      [v78 removeObject:*(void *)(a1 + 40)];
      v99 = *(void **)(a1 + 32);
      v82 = [v99 sections];
      uint64_t v83 = [v82 indexOfObject:&unk_26D911B30];
      v84 = v99;
      v85 = v78;
      v86 = v80;
      uint64_t v87 = 2;
    }
    else
    {
      int v100 = [*(id *)(a1 + 40) isKnown];
      v101 = WFLogForCategory(0);
      os_log_type_t v102 = OSLogForWFLogLevel(3uLL);
      BOOL v104 = (unint64_t)WFCurrentLogLevel() > 2 && v101 != 0;
      int v73 = v12;
      if (v100)
      {
        if (v104)
        {
          v105 = v101;
          if (os_log_type_enabled(v105, v102))
          {
            *(_DWORD *)buf = 136315138;
            v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
            _os_log_impl(&dword_2257EC000, v105, v102, "%s: removing from known", buf, 0xCu);
          }
        }
        v106 = [*(id *)(a1 + 32) knownNetworks];
        v78 = (void *)[v106 mutableCopy];

        v107 = [*(id *)(a1 + 32) knownNetworks];
        v80 = (void *)[v107 mutableCopy];

        [v78 removeObject:*(void *)(a1 + 40)];
        v108 = *(void **)(a1 + 32);
        v82 = [v108 sections];
        uint64_t v83 = [v82 indexOfObject:&unk_26D911B48];
        v84 = v108;
        v85 = v78;
        v86 = v80;
        uint64_t v87 = 1;
      }
      else
      {
        if (v104)
        {
          v109 = v101;
          if (os_log_type_enabled(v109, v102))
          {
            *(_DWORD *)buf = 136315138;
            v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
            _os_log_impl(&dword_2257EC000, v109, v102, "%s: removing from infra", buf, 0xCu);
          }
        }
        v110 = [*(id *)(a1 + 32) infraNetworks];
        v78 = (void *)[v110 mutableCopy];

        v111 = [*(id *)(a1 + 32) infraNetworks];
        v80 = (void *)[v111 mutableCopy];

        [v78 removeObject:*(void *)(a1 + 40)];
        v112 = *(void **)(a1 + 32);
        v82 = [v112 sections];
        uint64_t v83 = [v82 indexOfObject:&unk_26D911B60];
        v84 = v112;
        v85 = v78;
        v86 = v80;
        uint64_t v87 = 3;
      }
    }
    [v84 _updateCellsWithNewData:v85 oldData:v86 inSection:v83 insertSection:0 datasourceSection:v87];

    int v12 = v73;
  }
LABEL_132:
  uint64_t v113 = *(void *)(a1 + 32);
  unint64_t v114 = 0x268107000uLL;
  if (!v21)
  {
    if (*(unsigned char *)(v113 + 1043)) {
      goto LABEL_224;
    }
    if (*(void *)(a1 + 40)) {
      goto LABEL_224;
    }
    v128 = *(void **)(v113 + 1056);
    if (!v128 || ![v128 canBeDisplayedAsCurrent]) {
      goto LABEL_224;
    }
    if ([*(id *)(a1 + 32) showDiagnosticsCell]) {
      uint64_t v129 = 2;
    }
    else {
      uint64_t v129 = 1;
    }
    uint64_t v130 = [*(id *)(a1 + 32) rowCountWithPlacardCell:v129];
    v131 = [*(id *)(a1 + 32) sections];
    uint64_t v132 = [v131 indexOfObject:&unk_26D911B78];

    v133 = WFLogForCategory(0);
    os_log_type_t v134 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v133)
    {
      v135 = v133;
      if (os_log_type_enabled(v135, v134))
      {
        [*(id *)(a1 + 32) _nameOfSection:v132];
        v137 = int v136 = v12;
        *(_DWORD *)buf = 136315906;
        v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        __int16 v222 = 2112;
        *(void *)v223 = v137;
        *(_WORD *)&v223[8] = 2048;
        uint64_t v224 = v132;
        __int16 v225 = 2048;
        *(void *)v226 = v130;
        _os_log_impl(&dword_2257EC000, v135, v134, "%s: not powered, removing current network cell at section: %@ (%lu) row: %lu", buf, 0x2Au);

        int v12 = v136;
      }

      unint64_t v114 = 0x268107000uLL;
    }

    if (v132 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v174 = [MEMORY[0x263F088C8] indexPathForRow:v130 inSection:v132];
      v175 = [*(id *)(a1 + 32) tableView];
      v176 = [v175 cellForRowAtIndexPath:v174];

      if (v176)
      {
        v177 = [*(id *)(a1 + 32) tableView];
        v216 = v174;
        v178 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v216 count:1];
        [v177 deleteRowsAtIndexPaths:v178 withRowAnimation:100];
      }
      else
      {
        v177 = WFLogForCategory(0);
        uint64_t v213 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v177 && os_log_type_enabled(v177, (os_log_type_t)v213))
        {
          *(_DWORD *)buf = 136315138;
          v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2257EC000, v177, (os_log_type_t)v213, "%s: Tried to delete current network row when not it wasn't visible", buf, 0xCu);
        }
      }

      goto LABEL_224;
    }
    v125 = WFLogForCategory(0);
    os_log_type_t v138 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v125 || !os_log_type_enabled(v125, v138)) {
      goto LABEL_219;
    }
    *(_DWORD *)buf = 136315138;
    v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    v139 = v125;
    os_log_type_t v140 = v138;
LABEL_188:
    _os_log_impl(&dword_2257EC000, v139, v140, "%s: WFAirportSectionPower section not found", buf, 0xCu);
LABEL_219:

    [*(id *)(a1 + 32) _dumpSections];
    goto LABEL_224;
  }
  if (*(unsigned char *)(v113 + 1043)) {
    goto LABEL_134;
  }
  v141 = [(id)v113 currentNetwork];
  if (!v141 && ([*(id *)(a1 + 40) canBeDisplayedAsCurrent] & 1) != 0) {
    goto LABEL_299;
  }
  id v15 = [*(id *)(a1 + 32) currentNetwork];
  if ([v15 canBeDisplayedAsCurrent])
  {

    goto LABEL_134;
  }
  int v143 = [*(id *)(a1 + 40) canBeDisplayedAsCurrent];

  if (v143)
  {
LABEL_299:
    if ([*(id *)(a1 + 32) showDiagnosticsCell]) {
      uint64_t v144 = 2;
    }
    else {
      uint64_t v144 = 1;
    }
    uint64_t v145 = [*(id *)(a1 + 32) rowCountWithPlacardCell:v144];
    v146 = [*(id *)(a1 + 32) sections];
    uint64_t v147 = [v146 indexOfObject:&unk_26D911B78];

    v125 = WFLogForCategory(0);
    os_log_type_t v148 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel()) {
      BOOL v149 = v125 == 0;
    }
    else {
      BOOL v149 = 1;
    }
    int v150 = !v149;
    if (v147 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v150)
      {
        v151 = v125;
        if (os_log_type_enabled(v151, v148))
        {
          [*(id *)(a1 + 32) _nameOfSection:v147];
          v153 = int v152 = v12;
          *(_DWORD *)buf = 136315906;
          v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          __int16 v222 = 2112;
          *(void *)v223 = v153;
          *(_WORD *)&v223[8] = 2048;
          uint64_t v224 = v147;
          __int16 v225 = 2048;
          *(void *)v226 = v145;
          _os_log_impl(&dword_2257EC000, v151, v148, "%s: inserting into section: %@ (%lu) row: %lu", buf, 0x2Au);

          int v12 = v152;
        }

        unint64_t v114 = 0x268107000;
      }

      v154 = [*(id *)(a1 + 32) tableView];
      v155 = [MEMORY[0x263F088C8] indexPathForRow:v145 inSection:v147];
      v219 = v155;
      v156 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v219 count:1];
      [v154 insertRowsAtIndexPaths:v156 withRowAnimation:3];

LABEL_197:
      [*(id *)(a1 + 32) setUserAutoJoinEnabled:1];
      goto LABEL_224;
    }
    if (!v150 || !os_log_type_enabled(v125, v148)) {
      goto LABEL_219;
    }
    *(_DWORD *)buf = 136315138;
    v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    v139 = v125;
    os_log_type_t v140 = v148;
    goto LABEL_188;
  }
LABEL_134:
  v115 = *(unsigned char **)(a1 + 32);
  if (!v115[1043])
  {
    uint64_t v142 = *(void *)(a1 + 40);
    if (v142)
    {
      if ([*(id *)(a1 + 40) canBeDisplayedAsCurrent]) {
        goto LABEL_135;
      }
    }
    else
    {
      id v15 = [v115 currentNetwork];
      if ([v15 canBeDisplayedAsCurrent])
      {

        goto LABEL_204;
      }
      if ([*(id *)(a1 + 40) canBeDisplayedAsCurrent])
      {

        goto LABEL_135;
      }
    }
    v160 = [*(id *)(a1 + 32) currentNetwork];
    int v161 = [v160 canBeDisplayedAsCurrent];

    if (v142)
    {
      if (!v161) {
        goto LABEL_135;
      }
    }
    else
    {

      if ((v161 & 1) == 0) {
        goto LABEL_135;
      }
    }
LABEL_204:
    if ([*(id *)(a1 + 32) showDiagnosticsCell]) {
      uint64_t v162 = 2;
    }
    else {
      uint64_t v162 = 1;
    }
    uint64_t v163 = [*(id *)(a1 + 32) rowCountWithPlacardCell:v162];
    v164 = [*(id *)(a1 + 32) sections];
    uint64_t v165 = [v164 indexOfObject:&unk_26D911B78];

    v166 = WFLogForCategory(0);
    os_log_type_t v167 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v166)
    {
      v168 = v166;
      if (os_log_type_enabled(v168, v167))
      {
        [*(id *)(a1 + 32) _nameOfSection:v165];
        int v169 = v12;
        id v170 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        __int16 v222 = 2112;
        *(void *)v223 = v170;
        *(_WORD *)&v223[8] = 2048;
        uint64_t v224 = v165;
        __int16 v225 = 2048;
        *(void *)v226 = v163;
        _os_log_impl(&dword_2257EC000, v168, v167, "%s: removing from section: %@ (%lu) row: %lu", buf, 0x2Au);

        int v12 = v169;
      }

      unint64_t v114 = 0x268107000;
    }

    if (v165 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v171 = [*(id *)(a1 + 32) tableView];
      v172 = [MEMORY[0x263F088C8] indexPathForRow:v163 inSection:v165];
      v218 = v172;
      v173 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v218 count:1];
      [v171 deleteRowsAtIndexPaths:v173 withRowAnimation:100];

      goto LABEL_224;
    }
    v125 = WFLogForCategory(0);
    os_log_type_t v126 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v125) {
      goto LABEL_219;
    }
    v127 = v125;
    if (!os_log_type_enabled(v127, v126)) {
      goto LABEL_218;
    }
    *(_DWORD *)buf = 136315138;
    v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
LABEL_217:
    _os_log_impl(&dword_2257EC000, v127, v126, "%s: WFAirportSectionPower section not found", buf, 0xCu);
LABEL_218:

    goto LABEL_219;
  }
LABEL_135:
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 1043)
    && [*(id *)(a1 + 40) canBeDisplayedAsCurrent])
  {
    if ([*(id *)(a1 + 32) showDiagnosticsCell]) {
      uint64_t v116 = 2;
    }
    else {
      uint64_t v116 = 1;
    }
    uint64_t v117 = [*(id *)(a1 + 32) rowCountWithPlacardCell:v116];
    v118 = [*(id *)(a1 + 32) sections];
    uint64_t v119 = [v118 indexOfObject:&unk_26D911B78];

    v120 = WFLogForCategory(0);
    os_log_type_t v121 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v120)
    {
      v122 = v120;
      if (os_log_type_enabled(v122, v121))
      {
        [*(id *)(a1 + 32) _nameOfSection:v119];
        int v123 = v12;
        id v124 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        __int16 v222 = 2112;
        *(void *)v223 = v124;
        *(_WORD *)&v223[8] = 2048;
        uint64_t v224 = v119;
        __int16 v225 = 2048;
        *(void *)v226 = v117;
        _os_log_impl(&dword_2257EC000, v122, v121, "%s: reloading at section: %@ (%lu) row: %lu", buf, 0x2Au);

        int v12 = v123;
      }

      unint64_t v114 = 0x268107000;
    }

    if (v119 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v125 = WFLogForCategory(0);
      os_log_type_t v126 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v125) {
        goto LABEL_219;
      }
      v127 = v125;
      if (!os_log_type_enabled(v127, v126)) {
        goto LABEL_218;
      }
      *(_DWORD *)buf = 136315138;
      v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      goto LABEL_217;
    }
    v157 = [*(id *)(a1 + 32) tableView];
    v158 = [MEMORY[0x263F088C8] indexPathForRow:v117 inSection:v119];
    v217 = v158;
    v159 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v217 count:1];
    [v157 reloadRowsAtIndexPaths:v159 withRowAnimation:100];

    goto LABEL_197;
  }
LABEL_224:
  v179 = WFLogForCategory(0);
  os_log_type_t v180 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v179)
  {
    v181 = v179;
    if (os_log_type_enabled(v181, v180))
    {
      int v182 = [*(id *)(a1 + 32) askToJoinShown];
      *(_DWORD *)buf = 136315650;
      v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      __int16 v222 = 1024;
      *(_DWORD *)v223 = v12;
      *(_WORD *)&v223[4] = 1024;
      *(_DWORD *)&v223[6] = v182;
      _os_log_impl(&dword_2257EC000, v181, v180, "%s: atjShownStateDidChange %d askToJoinShown %d", buf, 0x18u);
    }
  }
  v183 = *(unsigned char **)(a1 + 32);
  if (v183[1043]) {
    int v184 = 0;
  }
  else {
    int v184 = v12;
  }
  if (v184 == 1)
  {
    v185 = [v183 sections];
    v186 = (void *)[v185 mutableCopy];

    if ([*(id *)(a1 + 32) askToJoinShown])
    {
      [v186 addObject:&unk_26D911B90];
      [*(id *)(a1 + 32) setSections:v186];
      unint64_t v187 = [v186 indexOfObject:&unk_26D911B90];
      if (v187 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_258;
      }
      unint64_t v188 = v187;
      if (v187 >= [*(id *)(*(void *)(a1 + 32) + 1112) count]) {
        goto LABEL_258;
      }
      v189 = WFLogForCategory(0);
      os_log_type_t v190 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v189)
      {
        v191 = v189;
        if (os_log_type_enabled(v191, v190))
        {
          *(_DWORD *)buf = 136315394;
          v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          __int16 v222 = 2048;
          *(void *)v223 = v188;
          _os_log_impl(&dword_2257EC000, v191, v190, "%s: inserting section at %lu", buf, 0x16u);
        }
      }
      v192 = [*(id *)(a1 + 32) tableView];
      v193 = [MEMORY[0x263F088D0] indexSetWithIndex:v188];
      [v192 insertSections:v193 withRowAnimation:3];
    }
    else
    {
      v194 = *(unsigned char **)(a1 + 32);
      if (v194[1043])
      {
LABEL_258:

        v183 = *(unsigned char **)(a1 + 32);
        goto LABEL_259;
      }
      v195 = [v194 sections];
      unint64_t v196 = [v195 indexOfObject:&unk_26D911B90];

      [v186 removeObject:&unk_26D911B90];
      [*(id *)(a1 + 32) setSections:v186];
      if (v196 == 0x7FFFFFFFFFFFFFFFLL
        || ([*(id *)(a1 + 32) sections],
            v197 = objc_claimAutoreleasedReturnValue(),
            unint64_t v198 = [v197 count],
            v197,
            v196 >= v198))
      {
        v192 = WFLogForCategory(0);
        os_log_type_t v202 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() < 4 || !v192) {
          goto LABEL_257;
        }
        v193 = v192;
        if (os_log_type_enabled(v193, v202))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2257EC000, v193, v202, "ATJ seciton is already deleted", buf, 2u);
        }
        v192 = v193;
      }
      else
      {
        v199 = WFLogForCategory(0);
        os_log_type_t v200 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v199)
        {
          v201 = v199;
          if (os_log_type_enabled(v201, v200))
          {
            *(_DWORD *)buf = 136315394;
            v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
            __int16 v222 = 2048;
            *(void *)v223 = v196;
            _os_log_impl(&dword_2257EC000, v201, v200, "%s: removing section at %lu", buf, 0x16u);
          }
        }
        v192 = [*(id *)(a1 + 32) tableView];
        v193 = [MEMORY[0x263F088D0] indexSetWithIndex:v196];
        [v192 deleteSections:v193 withRowAnimation:0];
      }
    }

LABEL_257:
    goto LABEL_258;
  }
LABEL_259:
  objc_storeStrong((id *)&v183[*(int *)(v114 + 2680)], *(id *)(a1 + 40));
  v203 = WFLogForCategory(0);
  os_log_type_t v204 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v203)
  {
    v205 = v203;
    if (os_log_type_enabled(v205, v204))
    {
      v206 = *(void **)(a1 + 40);
      uint64_t v207 = [v206 hash];
      *(_DWORD *)buf = 136315650;
      v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      __int16 v222 = 2112;
      *(void *)v223 = v206;
      *(_WORD *)&v223[8] = 2048;
      uint64_t v224 = v207;
      _os_log_impl(&dword_2257EC000, v205, v204, "%s: currentNetwork %@ (%lu)", buf, 0x20u);
    }
  }
  v208 = [*(id *)(a1 + 32) tableView];
  [v208 endUpdates];

  if (*(void *)(a1 + 56) == 1)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 1043))
    {
      id v15 = [MEMORY[0x263F08A00] defaultCenter];
      [v15 postNotificationName:@"networkListScrollToTopNotification" object:0];
    }
    else
    {
      v209 = WFLogForCategory(0);
      os_log_type_t v210 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v209)
      {
        v211 = v209;
        if (os_log_type_enabled(v211, v210))
        {
          *(_DWORD *)buf = 136315138;
          v221 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2257EC000, v211, v210, "%s: scrolling to top", buf, 0xCu);
        }
      }
      id v15 = [*(id *)(a1 + 32) tableView];
      v212 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
      [v15 scrollToRowAtIndexPath:v212 atScrollPosition:1 animated:1];
    }
    goto LABEL_46;
  }
LABEL_47:
}

- (void)setCurrentNetworkSubtitle:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  if ([(WFAirportViewController *)self isInEditingMode])
  {
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_2257EC000, v5, v6, "Not setting current network subtitle in edit mode", (uint8_t *)&v19, 2u);
    }
LABEL_26:

    goto LABEL_27;
  }
  currentNetworkSubtitle = self->_currentNetworkSubtitle;
  if (currentNetworkSubtitle != v4)
  {
    if (v4)
    {
      int v8 = (NSString *)[(NSString *)v4 copy];
      currentNetworkSubtitle = self->_currentNetworkSubtitle;
    }
    else
    {
      int v8 = 0;
    }
    self->_currentNetworkSubtitle = v8;

    int v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      int v19 = 138412290;
      uint32_t v20 = (const char *)v4;
      _os_log_impl(&dword_2257EC000, v9, v10, "Setting current network subtitle: %@", (uint8_t *)&v19, 0xCu);
    }

    BOOL v11 = [(WFAirportViewController *)self currentNetworkRowConfig];
    [v11 setSubtitle:v4];

    int v12 = [(WFAirportViewController *)self _currentNetworkCell];
    os_log_type_t v5 = v12;
    if (v12)
    {
      if (self->_currentNetworkSubtitle)
      {
        -[NSObject setSubtitle:](v12, "setSubtitle:");
      }
      else
      {
        id v15 = [(WFAirportViewController *)self currentNetwork];
        os_log_type_t v16 = [v15 subtitle];
        [v5 setSubtitle:v16];
      }
      uint64_t v17 = [(WFAirportViewController *)self listDelegate];
      int v18 = [v17 airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:self];

      if (v18)
      {
        [v5 setConnectionError:1];
      }
      else
      {
        [v5 setConnectionError:0];
        [v5 setBars:WFSignalBarsFromScaledRSSI(self->_currentNetworkScaledRSSI)];
      }
    }
    else
    {
      int v13 = WFLogForCategory(0);
      os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
      {
        int v19 = 136315138;
        uint32_t v20 = "-[WFAirportViewController setCurrentNetworkSubtitle:]";
        _os_log_impl(&dword_2257EC000, v13, v14, "%s: nil currentNetwork cell", (uint8_t *)&v19, 0xCu);
      }
    }
    goto LABEL_26;
  }
LABEL_27:
}

- (void)setScanning:(BOOL)a3
{
  BOOL v3 = a3;
  os_log_type_t v5 = [(WFAirportViewController *)self chooseNetworkHeader];
  int v6 = [v5 animating];

  if (v6 != v3)
  {
    id v7 = [(WFAirportViewController *)self chooseNetworkHeader];
    [v7 setAnimating:v3];
  }
}

- (BOOL)_refreshATJShownStateIfChanged
{
  BOOL v3 = [(WFAirportViewController *)self listDelegate];
  int v4 = [v3 airportSettingsViewControllerAskToJoinMode:self] != -1;
  int askToJoinShown = self->_askToJoinShown;
  if (askToJoinShown != v4) {
    self->_int askToJoinShown = [v3 airportSettingsViewControllerAskToJoinMode:self] != -1;
  }

  return askToJoinShown != v4;
}

- (void)setNetworks:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__WFAirportViewController_setNetworks___block_invoke;
  v7[3] = &unk_264756208;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __39__WFAirportViewController_setNetworks___block_invoke(uint64_t a1)
{
  uint64_t v250 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) powered] & 1) == 0)
  {
    v2 = WFLogForCategory(0);
    os_log_type_t v3 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() < 2 || !v2 || !os_log_type_enabled(v2, v3)) {
      goto LABEL_219;
    }
    *(_WORD *)buf = 0;
    id v4 = "Tried to set networks while powered off...";
LABEL_11:
    _os_log_impl(&dword_2257EC000, v2, v3, v4, buf, 2u);
LABEL_219:

    return;
  }
  if ([*(id *)(a1 + 32) isInEditingMode])
  {
    v2 = WFLogForCategory(0);
    os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v2 || !os_log_type_enabled(v2, v3)) {
      goto LABEL_219;
    }
    *(_WORD *)buf = 0;
    id v4 = "In Editing mode, not updating table";
    goto LABEL_11;
  }
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v2 = *(id *)(a1 + 40);
    id v5 = [v2 copy];
    [*(id *)(a1 + 32) setAllNetworks:v5];

    id v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      id v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        int v9 = [*(id *)(a1 + 32) currentNetwork];
        *(_DWORD *)buf = 136315394;
        v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
        __int16 v246 = 2112;
        uint64_t v247 = (uint64_t)v9;
        _os_log_impl(&dword_2257EC000, v8, v7, "%s: current network: %@", buf, 0x16u);
      }
    }

    uint64_t v10 = [*(id *)(a1 + 32) currentNetwork];
    if (v10)
    {
      BOOL v11 = (void *)v10;
      int v12 = [*(id *)(a1 + 32) currentNetwork];
      char v13 = [v12 canBeDisplayedAsCurrent];

      if ((v13 & 1) == 0)
      {
        os_log_type_t v14 = [MEMORY[0x263EFF9C0] setWithSet:v2];
        id v15 = [*(id *)(a1 + 32) currentNetwork];
        [v14 addObject:v15];

        v2 = v14;
      }
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1208), v2);
    os_log_type_t v16 = [v2 knownNetworks];
    if ([v16 count])
    {
      uint64_t v17 = WFLogForCategory(0);
      os_log_type_t v18 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v17)
      {
        int v19 = v17;
        if (os_log_type_enabled(v19, v18))
        {
          uint64_t v20 = [v16 count];
          *(_DWORD *)buf = 136315394;
          v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
          __int16 v246 = 2048;
          uint64_t v247 = v20;
          _os_log_impl(&dword_2257EC000, v19, v18, "%s: known network count: %lu", buf, 0x16u);
        }
      }
      uint64_t v21 = [v16 allObjects];
      int v22 = WFScanRecordAlphaSortCompartor();
      v23 = [v21 sortedArrayUsingComparator:v22];

      if (([v23 isEqualToArray:*(void *)(*(void *)(a1 + 32) + 1152)] & 1) == 0)
      {
        uint64_t v38 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v38 + 1040))
        {
          objc_storeStrong((id *)(v38 + 1208), v2);
          *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 1;
        }
        else
        {
          v66 = WFLogForCategory(0);
          os_log_type_t v67 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v66 && os_log_type_enabled(v66, v67))
          {
            *(_DWORD *)buf = 136315394;
            v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
            __int16 v246 = 2112;
            uint64_t v247 = (uint64_t)v16;
            _os_log_impl(&dword_2257EC000, v66, v67, "%s: known networks %@", buf, 0x16u);
          }

          os_log_type_t v68 = [*(id *)(a1 + 32) sections];
          int v69 = [v68 containsObject:&unk_26D911B48];

          if ((v69 & 1) == 0)
          {
            int v70 = [*(id *)(a1 + 32) sections];
            v71 = (void *)[v70 mutableCopy];

            uint64_t v72 = [v71 indexOfObject:&unk_26D911B78];
            if (v72 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v73 = 0;
            }
            else {
              uint64_t v73 = v72 + 1;
            }
            [v71 insertObject:&unk_26D911B48 atIndex:v73];
            [*(id *)(a1 + 32) setSections:v71];
            v74 = WFLogForCategory(0);
            os_log_type_t v75 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v74)
            {
              v236 = v23;
              v76 = v16;
              v77 = v74;
              if (os_log_type_enabled(v77, v75))
              {
                v239 = [*(id *)(a1 + 32) _nameOfSection:1];
                *(_DWORD *)buf = 136315650;
                v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
                __int16 v246 = 2112;
                uint64_t v247 = (uint64_t)v239;
                __int16 v248 = 2048;
                uint64_t v249 = v73;
                _os_log_impl(&dword_2257EC000, v77, v75, "%s: inserting section %@ (at index %lu)", buf, 0x20u);
              }
              os_log_type_t v16 = v76;
              v23 = v236;
            }
          }
          v78 = (void *)[*(id *)(*(void *)(a1 + 32) + 1152) copy];
          v79 = *(void **)(a1 + 32);
          v80 = [v79 sections];
          objc_msgSend(v79, "_updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:", v23, v78, objc_msgSend(v80, "indexOfObject:", &unk_26D911B48), v69 ^ 1u, 1);
        }
        goto LABEL_218;
      }
      os_log_type_t v24 = WFLogForCategory(0);
      os_log_type_t v25 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v24)
      {
        double v26 = v24;
        if (os_log_type_enabled(v26, v25))
        {
          uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 1152) count];
          *(_DWORD *)buf = 136315394;
          v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
          __int16 v246 = 2048;
          uint64_t v247 = v27;
          _os_log_impl(&dword_2257EC000, v26, v25, "%s: no change to known (count: %lu)", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v30 = *(void *)(a1 + 32);
      os_log_type_t v31 = *(void **)(v30 + 1152);
      if (!v31) {
        goto LABEL_54;
      }
      *(void *)(v30 + 1152) = 0;

      uint64_t v32 = [*(id *)(a1 + 32) sections];
      v23 = (void *)[v32 mutableCopy];

      uint64_t v33 = [v23 indexOfObject:&unk_26D911B48];
      if (v33 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v34 = WFLogForCategory(0);
        os_log_type_t v35 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v34)
        {
          uint64_t v36 = v34;
          if (os_log_type_enabled(v36, v35))
          {
            os_log_type_t v37 = [*(id *)(a1 + 32) _nameOfSection:1];
            *(_DWORD *)buf = 136315394;
            v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
            __int16 v246 = 2112;
            uint64_t v247 = (uint64_t)v37;
            _os_log_impl(&dword_2257EC000, v36, v35, "%s: %@ section does not exist in sections", buf, 0x16u);
          }
        }

        [*(id *)(a1 + 32) _dumpSections];
      }
      else
      {
        uint64_t v39 = v33;
        [v23 removeObject:&unk_26D911B48];
        [*(id *)(a1 + 32) setSections:v23];
        v40 = [*(id *)(a1 + 32) tableView];
        id v41 = [MEMORY[0x263F088D0] indexSetWithIndex:v39];
        [v40 deleteSections:v41 withRowAnimation:0];

        v42 = WFLogForCategory(0);
        os_log_type_t v43 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v42)
        {
          v44 = v42;
          if (os_log_type_enabled(v44, v43))
          {
            v45 = [*(id *)(a1 + 32) _nameOfSection:1];
            *(_DWORD *)buf = 136315650;
            v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
            __int16 v246 = 2112;
            uint64_t v247 = (uint64_t)v45;
            __int16 v248 = 2048;
            uint64_t v249 = v39;
            _os_log_impl(&dword_2257EC000, v44, v43, "%s: removing section %@ (index %lu)", buf, 0x20u);
          }
        }
      }
    }

LABEL_54:
    v23 = [v2 popularNetworks];
    if ([v23 count])
    {
      v46 = WFLogForCategory(0);
      os_log_type_t v47 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v46)
      {
        v48 = v46;
        if (os_log_type_enabled(v48, v47))
        {
          uint64_t v49 = [v23 count];
          *(_DWORD *)buf = 136315394;
          v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
          __int16 v246 = 2048;
          uint64_t v247 = v49;
          _os_log_impl(&dword_2257EC000, v48, v47, "%s: popular network count: %lu", buf, 0x16u);
        }
      }
      v50 = [v23 allObjects];
      v51 = WFScanRecordAlphaSortCompartor();
      v52 = [v50 sortedArrayUsingComparator:v51];

      if (([v52 isEqualToArray:*(void *)(*(void *)(a1 + 32) + 1144)] & 1) == 0)
      {
        uint64_t v65 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v65 + 1040))
        {
          objc_storeStrong((id *)(v65 + 1208), v2);
          *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 1;
        }
        else
        {
          v141 = WFLogForCategory(0);
          os_log_type_t v142 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v141 && os_log_type_enabled(v141, v142))
          {
            *(_DWORD *)buf = 136315394;
            v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
            __int16 v246 = 2112;
            uint64_t v247 = (uint64_t)v23;
            _os_log_impl(&dword_2257EC000, v141, v142, "%s: popular networks %@", buf, 0x16u);
          }

          int v143 = [*(id *)(a1 + 32) sections];
          int v144 = [v143 containsObject:&unk_26D911B30];

          if ((v144 & 1) == 0)
          {
            uint64_t v145 = [*(id *)(a1 + 32) sections];
            v146 = (void *)[v145 mutableCopy];

            uint64_t v147 = [v146 indexOfObject:&unk_26D911B48];
            if (v147 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v148 = [v146 indexOfObject:&unk_26D911B60];
            }
            else {
              uint64_t v148 = v147 + 1;
            }
            int v242 = v148;
            [v146 insertObject:&unk_26D911B30 atIndex:v148];
            [*(id *)(a1 + 32) setSections:v146];
            v217 = WFLogForCategory(0);
            os_log_type_t v218 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v217)
            {
              v235 = v52;
              v238 = v23;
              v219 = v16;
              v220 = v217;
              os_log_type_t v221 = v218;
              if (os_log_type_enabled(v220, v218))
              {
                __int16 v222 = [*(id *)(a1 + 32) _nameOfSection:2];
                *(_DWORD *)buf = 136315650;
                v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
                __int16 v246 = 2112;
                uint64_t v247 = (uint64_t)v222;
                __int16 v248 = 1024;
                LODWORD(v249) = v242;
                _os_log_impl(&dword_2257EC000, v220, v221, "%s: inserting section %@ (at index %d)", buf, 0x1Cu);
              }
              os_log_type_t v16 = v219;
              v52 = v235;
              v23 = v238;
            }
          }
          v223 = (void *)[*(id *)(*(void *)(a1 + 32) + 1144) copy];
          uint64_t v224 = *(void **)(a1 + 32);
          __int16 v225 = [v224 sections];
          objc_msgSend(v224, "_updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:", v52, v223, objc_msgSend(v225, "indexOfObject:", &unk_26D911B30), v144 ^ 1u, 2);
        }
        goto LABEL_217;
      }
      v53 = WFLogForCategory(0);
      os_log_type_t v54 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v53)
      {
        int v55 = v53;
        if (os_log_type_enabled(v55, v54))
        {
          uint64_t v56 = [*(id *)(*(void *)(a1 + 32) + 1144) count];
          *(_DWORD *)buf = 136315394;
          v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
          __int16 v246 = 2048;
          uint64_t v247 = v56;
          _os_log_impl(&dword_2257EC000, v55, v54, "%s: no change to popular (count: %lu)", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v57 = *(void *)(a1 + 32);
      v58 = *(void **)(v57 + 1144);
      if (!v58) {
        goto LABEL_99;
      }
      *(void *)(v57 + 1144) = 0;

      v59 = [*(id *)(a1 + 32) sections];
      v52 = (void *)[v59 mutableCopy];

      uint64_t v60 = [v52 indexOfObject:&unk_26D911B30];
      if (v60 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v61 = WFLogForCategory(0);
        os_log_type_t v62 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v61)
        {
          os_log_type_t v63 = v61;
          if (os_log_type_enabled(v63, v62))
          {
            v64 = [*(id *)(a1 + 32) _nameOfSection:2];
            *(_DWORD *)buf = 136315394;
            v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
            __int16 v246 = 2112;
            uint64_t v247 = (uint64_t)v64;
            _os_log_impl(&dword_2257EC000, v63, v62, "%s: %@ section does not exist in sections", buf, 0x16u);
          }
        }

        [*(id *)(a1 + 32) _dumpSections];
      }
      else
      {
        uint64_t v81 = v60;
        [v52 removeObject:&unk_26D911B30];
        [*(id *)(a1 + 32) setSections:v52];
        v82 = [*(id *)(a1 + 32) tableView];
        uint64_t v83 = [MEMORY[0x263F088D0] indexSetWithIndex:v81];
        [v82 deleteSections:v83 withRowAnimation:0];

        v84 = WFLogForCategory(0);
        os_log_type_t v85 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v84)
        {
          v86 = v84;
          if (os_log_type_enabled(v86, v85))
          {
            [*(id *)(a1 + 32) _nameOfSection:2];
            v88 = uint64_t v87 = v16;
            *(_DWORD *)buf = 136315650;
            v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
            __int16 v246 = 2112;
            uint64_t v247 = (uint64_t)v88;
            __int16 v248 = 1024;
            LODWORD(v249) = v81;
            _os_log_impl(&dword_2257EC000, v86, v85, "%s: removing section %@ (index %d)", buf, 0x1Cu);

            os_log_type_t v16 = v87;
          }
        }
      }
    }

LABEL_99:
    v52 = [v2 infrastructureNetworks];
    os_log_type_t v89 = [*(id *)(a1 + 32) sections];
    uint64_t v90 = [v89 indexOfObject:&unk_26D911B60];

    v237 = v23;
    if ([v52 count])
    {
      v91 = WFLogForCategory(0);
      os_log_type_t v92 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v91)
      {
        v93 = v91;
        if (os_log_type_enabled(v93, v92))
        {
          uint64_t v94 = [v52 count];
          *(_DWORD *)buf = 136315394;
          v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
          __int16 v246 = 2048;
          uint64_t v247 = v94;
          _os_log_impl(&dword_2257EC000, v93, v92, "%s: infraNetworks network count: %lu", buf, 0x16u);
        }
      }
      os_log_type_t v95 = [v52 allObjects];
      v96 = WFScanRecordAlphaSortCompartor();
      v97 = [v95 sortedArrayUsingComparator:v96];

      if (([v97 isEqualToArray:*(void *)(*(void *)(a1 + 32) + 1136)] & 1) == 0)
      {
        uint64_t v130 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v130 + 1040))
        {
          objc_storeStrong((id *)(v130 + 1208), v2);
          *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 1;
        }
        else
        {
          BOOL v149 = (void *)[*(id *)(v130 + 1136) copy];
          [*(id *)(a1 + 32) _updateCellsWithNewData:v97 oldData:v149 inSection:v90 insertSection:0 datasourceSection:3];
        }
        goto LABEL_216;
      }
      v98 = WFLogForCategory(0);
      os_log_type_t v99 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v98 && os_log_type_enabled(v98, v99))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2257EC000, v98, v99, "No change to infra section", buf, 2u);
      }
    }
    else
    {
      if (!*(void *)(*(void *)(a1 + 32) + 1136))
      {
LABEL_124:
        uint64_t v116 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v116 + 1032))
        {
          uint64_t v117 = [*(id *)(v116 + 1136) count];
          if (v90 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v118 = [MEMORY[0x263F088C8] indexPathForRow:v117 inSection:v90];
            uint64_t v119 = [*(id *)(a1 + 32) tableView];
            v243 = v118;
            v120 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v243 count:1];
            [v119 reloadRowsAtIndexPaths:v120 withRowAnimation:5];
          }
        }
        v97 = [v2 adhocNetworks];
        if ([v97 count])
        {
          os_log_type_t v121 = WFLogForCategory(0);
          os_log_type_t v122 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v121)
          {
            int v123 = v121;
            if (os_log_type_enabled(v123, v122))
            {
              uint64_t v124 = [v97 count];
              *(_DWORD *)buf = 136315394;
              v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
              __int16 v246 = 2048;
              uint64_t v247 = v124;
              _os_log_impl(&dword_2257EC000, v123, v122, "%s: adhoc network count: %lu", buf, 0x16u);
            }
          }
          v125 = [v97 allObjects];
          os_log_type_t v126 = WFScanRecordAlphaSortCompartor();
          v127 = [v125 sortedArrayUsingComparator:v126];

          if (([v127 isEqualToArray:*(void *)(*(void *)(a1 + 32) + 1160)] & 1) == 0)
          {
            uint64_t v140 = *(void *)(a1 + 32);
            if (*(unsigned char *)(v140 + 1040))
            {
              objc_storeStrong((id *)(v140 + 1208), v2);
              *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 1;
            }
            else
            {
              v240 = (void *)[*(id *)(v140 + 1160) copy];
              v183 = [*(id *)(a1 + 32) sections];
              int v184 = [v183 containsObject:&unk_26D911B00];

              if ((v184 & 1) == 0)
              {
                v232 = v16;
                v185 = [*(id *)(a1 + 32) sections];
                v186 = (void *)[v185 mutableCopy];

                uint64_t v187 = [v186 indexOfObject:&unk_26D911B60];
                int v188 = v187;
                [v186 insertObject:&unk_26D911B00 atIndex:v187 + 1];
                [*(id *)(a1 + 32) setSections:v186];
                v189 = WFLogForCategory(0);
                os_log_type_t v190 = OSLogForWFLogLevel(3uLL);
                if ((unint64_t)WFCurrentLogLevel() >= 3 && v189)
                {
                  log = v189;
                  if (os_log_type_enabled(log, v190))
                  {
                    uint64_t v191 = [*(id *)(a1 + 32) _nameOfSection:4];
                    int v192 = v188;
                    v193 = (void *)v191;
                    *(_DWORD *)buf = 136315650;
                    v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
                    __int16 v246 = 2112;
                    uint64_t v247 = v191;
                    __int16 v248 = 1024;
                    LODWORD(v249) = v192 + 1;
                    _os_log_impl(&dword_2257EC000, log, v190, "%s: inserting section %@ (at index %d)", buf, 0x1Cu);
                  }
                }

                os_log_type_t v16 = v232;
                v23 = v237;
              }
              uint64_t v194 = v184 ^ 1u;
              v195 = [*(id *)(a1 + 32) sections];
              uint64_t v196 = [v195 indexOfObject:&unk_26D911B00];

              [*(id *)(a1 + 32) _updateCellsWithNewData:v127 oldData:v240 inSection:v196 insertSection:v194 datasourceSection:4];
            }
            goto LABEL_215;
          }
          v128 = WFLogForCategory(0);
          os_log_type_t v129 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v128 && os_log_type_enabled(v128, v129))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2257EC000, v128, v129, "No change to adhoc section", buf, 2u);
          }
        }
        else
        {
          uint64_t v131 = *(void *)(a1 + 32);
          uint64_t v132 = *(void **)(v131 + 1160);
          if (!v132) {
            goto LABEL_166;
          }
          *(void *)(v131 + 1160) = 0;

          v133 = [*(id *)(a1 + 32) sections];
          v127 = (void *)[v133 mutableCopy];

          uint64_t v134 = [v127 indexOfObject:&unk_26D911B00];
          if (v134 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v135 = WFLogForCategory(0);
            os_log_type_t v136 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v135)
            {
              v137 = v16;
              os_log_type_t v138 = v135;
              if (os_log_type_enabled(v138, v136))
              {
                v139 = [*(id *)(a1 + 32) _nameOfSection:4];
                *(_DWORD *)buf = 136315394;
                v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
                __int16 v246 = 2112;
                uint64_t v247 = (uint64_t)v139;
                _os_log_impl(&dword_2257EC000, v138, v136, "%s: %@ section does not exist in sections", buf, 0x16u);
              }
              os_log_type_t v16 = v137;
              v23 = v237;
            }

            [*(id *)(a1 + 32) _dumpSections];
          }
          else
          {
            uint64_t v150 = v134;
            [v127 removeObject:&unk_26D911B00];
            [*(id *)(a1 + 32) setSections:v127];
            v151 = [*(id *)(a1 + 32) tableView];
            int v152 = [MEMORY[0x263F088D0] indexSetWithIndex:v150];
            [v151 deleteSections:v152 withRowAnimation:0];

            v153 = WFLogForCategory(0);
            os_log_type_t v154 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v153)
            {
              v155 = v16;
              v156 = v153;
              if (os_log_type_enabled(v156, v154))
              {
                uint64_t v157 = [*(id *)(a1 + 32) _nameOfSection:4];
                os_log_type_t v158 = v154;
                v159 = (void *)v157;
                *(_DWORD *)buf = 136315650;
                v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
                __int16 v246 = 2112;
                uint64_t v247 = v157;
                __int16 v248 = 1024;
                LODWORD(v249) = v150;
                _os_log_impl(&dword_2257EC000, v156, v158, "%s: removing section %@ (index %d)", buf, 0x1Cu);
              }
              os_log_type_t v16 = v155;
              v23 = v237;
            }
          }
        }

LABEL_166:
        v127 = [v2 unconfiguredNetworks];
        if ([v127 count])
        {
          v160 = WFLogForCategory(0);
          os_log_type_t v161 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v160)
          {
            uint64_t v162 = v16;
            uint64_t v163 = v160;
            if (os_log_type_enabled(v163, v161))
            {
              uint64_t v164 = [v127 count];
              *(_DWORD *)buf = 136315394;
              v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
              __int16 v246 = 2048;
              uint64_t v247 = v164;
              _os_log_impl(&dword_2257EC000, v163, v161, "%s: unconfigured network count: %lu", buf, 0x16u);
            }

            os_log_type_t v16 = v162;
          }

          uint64_t v165 = [v127 allObjects];
          v166 = WFScanRecordAlphaSortCompartor();
          os_log_type_t v167 = [v165 sortedArrayUsingComparator:v166];

          if (([v167 isEqualToArray:*(void *)(*(void *)(a1 + 32) + 1168)] & 1) == 0)
          {
            uint64_t v182 = *(void *)(a1 + 32);
            if (*(unsigned char *)(v182 + 1040))
            {
              objc_storeStrong((id *)(v182 + 1208), v2);
              *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 1;
            }
            else
            {
              v234 = v16;
              v241 = (void *)[*(id *)(v182 + 1168) copy];
              v206 = [*(id *)(a1 + 32) sections];
              int v207 = [v206 containsObject:&unk_26D911B18];

              if ((v207 & 1) == 0)
              {
                int loga = v207;
                v208 = [*(id *)(a1 + 32) sections];
                v209 = (void *)[v208 mutableCopy];

                uint64_t v210 = [v209 indexOfObject:&unk_26D911B00];
                if (v210 == 0x7FFFFFFFFFFFFFFFLL) {
                  uint64_t v210 = [v209 indexOfObject:&unk_26D911B60];
                }
                [v209 insertObject:&unk_26D911B18 atIndex:v210 + 1];
                [*(id *)(a1 + 32) setSections:v209];
                v211 = WFLogForCategory(0);
                os_log_type_t v212 = OSLogForWFLogLevel(3uLL);
                if ((unint64_t)WFCurrentLogLevel() >= 3 && v211)
                {
                  v227 = v211;
                  if (os_log_type_enabled(v227, v212))
                  {
                    [*(id *)(a1 + 32) _nameOfSection:5];
                    uint64_t v213 = v226 = v211;
                    *(_DWORD *)buf = 136315650;
                    v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
                    __int16 v246 = 2112;
                    uint64_t v247 = (uint64_t)v213;
                    __int16 v248 = 1024;
                    LODWORD(v249) = v210;
                    _os_log_impl(&dword_2257EC000, v227, v212, "%s: inserting section %@ (at index %d)", buf, 0x1Cu);

                    v211 = v226;
                  }
                }
                int v207 = loga;
              }
              uint64_t v214 = v207 ^ 1u;
              int v215 = objc_msgSend(*(id *)(a1 + 32), "sections", v226);
              uint64_t v216 = [v215 indexOfObject:&unk_26D911B18];

              [*(id *)(a1 + 32) _updateCellsWithNewData:v167 oldData:v241 inSection:v216 insertSection:v214 datasourceSection:5];
              os_log_type_t v16 = v234;
              v23 = v237;
            }

            goto LABEL_215;
          }
          v168 = v16;
          int v169 = WFLogForCategory(0);
          os_log_type_t v170 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v169 && os_log_type_enabled(v169, v170))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2257EC000, v169, v170, "No change to unconfigured section", buf, 2u);
          }

          os_log_type_t v16 = v168;
        }
        else
        {
          uint64_t v171 = *(void *)(a1 + 32);
          v172 = *(void **)(v171 + 1168);
          if (!v172)
          {
LABEL_203:
            [*(id *)(a1 + 32) _processPendingCurrentNetworkUpdate];
LABEL_215:

LABEL_216:
LABEL_217:

LABEL_218:
            goto LABEL_219;
          }
          *(void *)(v171 + 1168) = 0;

          v173 = [*(id *)(a1 + 32) sections];
          os_log_type_t v167 = (void *)[v173 mutableCopy];

          uint64_t v174 = [v167 indexOfObject:&unk_26D911B18];
          if (v174 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v175 = WFLogForCategory(0);
            os_log_type_t v176 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v175)
            {
              v177 = v16;
              v178 = v175;
              if (os_log_type_enabled(v178, v176))
              {
                uint64_t v179 = [*(id *)(a1 + 32) _nameOfSection:5];
                os_log_type_t v180 = v176;
                v181 = (void *)v179;
                *(_DWORD *)buf = 136315394;
                v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
                __int16 v246 = 2112;
                uint64_t v247 = v179;
                _os_log_impl(&dword_2257EC000, v178, v180, "%s: %@ section does not exist in sections", buf, 0x16u);
              }
              os_log_type_t v16 = v177;
              v23 = v237;
            }

            [*(id *)(a1 + 32) _dumpSections];
          }
          else
          {
            uint64_t v197 = v174;
            v233 = v16;
            [v167 removeObject:&unk_26D911B18];
            [*(id *)(a1 + 32) setSections:v167];
            unint64_t v198 = [*(id *)(a1 + 32) tableView];
            v199 = [MEMORY[0x263F088D0] indexSetWithIndex:v197];
            [v198 deleteSections:v199 withRowAnimation:0];

            os_log_type_t v200 = WFLogForCategory(0);
            os_log_type_t v201 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v200)
            {
              os_log_type_t v202 = v200;
              if (os_log_type_enabled(v202, v201))
              {
                uint64_t v203 = [*(id *)(a1 + 32) _nameOfSection:5];
                os_log_type_t v204 = v201;
                v205 = (void *)v203;
                *(_DWORD *)buf = 136315650;
                v245 = "-[WFAirportViewController setNetworks:]_block_invoke";
                __int16 v246 = 2112;
                uint64_t v247 = v203;
                __int16 v248 = 1024;
                LODWORD(v249) = v197;
                _os_log_impl(&dword_2257EC000, v202, v204, "%s: removing section %@ (index %d)", buf, 0x1Cu);
              }
            }

            os_log_type_t v16 = v233;
            v23 = v237;
          }
        }

        goto LABEL_203;
      }
      v97 = [MEMORY[0x263EFF980] array];
      for (unint64_t i = 0; i < [*(id *)(*(void *)(a1 + 32) + 1136) count]; ++i)
      {
        v101 = [MEMORY[0x263F088C8] indexPathForRow:i inSection:v90];
        [v97 addObject:v101];
      }
      os_log_type_t v102 = *(unsigned char **)(a1 + 32);
      if (!v102[1032])
      {
        v103 = [v102 tableView];
        v230 = v2;
        BOOL v104 = v16;
        uint64_t v105 = [v103 numberOfRowsInSection:v90];
        uint64_t v106 = [v97 count];

        BOOL v107 = v105 <= v106;
        os_log_type_t v16 = v104;
        v2 = v230;
        if (!v107)
        {
          v108 = [MEMORY[0x263F088C8] indexPathForRow:i inSection:v90];
          [v97 addObject:v108];
        }
      }
      v109 = WFLogForCategory(0);
      os_log_type_t v110 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v109)
      {
        v231 = v16;
        v111 = v109;
        if (os_log_type_enabled(v111, v110))
        {
          v112 = [*(id *)(a1 + 32) _nameOfSection:3];
          uint64_t v113 = [v97 count];
          *(_DWORD *)buf = 138412546;
          v245 = v112;
          __int16 v246 = 2048;
          uint64_t v247 = v113;
          _os_log_impl(&dword_2257EC000, v111, v110, "Section %@- Deleting %lu rows", buf, 0x16u);
        }
        os_log_type_t v16 = v231;
      }

      uint64_t v114 = *(void *)(a1 + 32);
      v115 = *(void **)(v114 + 1136);
      *(void *)(v114 + 1136) = 0;

      v98 = [*(id *)(a1 + 32) tableView];
      [v98 deleteRowsAtIndexPaths:v97 withRowAnimation:0];
    }

    goto LABEL_124;
  }
  v28 = *(void **)(a1 + 32);
  uint64_t v29 = *(void *)(a1 + 40);
  [v28 performSelectorOnMainThread:sel_setNetworks_ withObject:v29 waitUntilDone:0];
}

- (void)_updateCellsWithNewData:(id)a3 oldData:(id)a4 inSection:(unint64_t)a5 insertSection:(BOOL)a6 datasourceSection:(unint64_t)a7
{
  BOOL v7 = a6;
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (v7)
  {
    BOOL v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v11)
    {
      char v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        os_log_type_t v14 = [(WFAirportViewController *)self _sectionNameAtIndex:a5];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2048;
        unint64_t v97 = a5;
        _os_log_impl(&dword_2257EC000, v13, v12, "%s: inserting section %@ at index %lu", buf, 0x20u);
      }
    }

    id v15 = [(WFAirportViewController *)self tableView];
    os_log_type_t v16 = [MEMORY[0x263F088D0] indexSetWithIndex:a5];
    [v15 insertSections:v16 withRowAnimation:0];
  }
  uint64_t v57 = objc_msgSend(v10, "mutableCopy", a7);
  id obj = (id)[v9 mutableCopy];
  if ((unint64_t)[v10 count] >= 2 && (unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    int v17 = 0;
    uint64_t v18 = 1;
    do
    {
      int v19 = [v10 objectAtIndexedSubscript:v18];
      uint64_t v20 = [v19 ssid];
      uint64_t v21 = v18 - 1;
      int v22 = [v10 objectAtIndexedSubscript:v18 - 1];
      v23 = [v22 ssid];
      int v24 = [v20 isEqualToString:v23];

      if (v24) {
        [v57 removeObjectAtIndex:v18 - v17++];
      }
      ++v18;
    }
    while ([v10 count] > (unint64_t)(v21 + 2));
  }
  if ((unint64_t)[v9 count] >= 2 && (unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    int v25 = 0;
    uint64_t v26 = 1;
    do
    {
      uint64_t v27 = [v9 objectAtIndexedSubscript:v26];
      v28 = [v27 ssid];
      uint64_t v29 = v26 - 1;
      uint64_t v30 = [v9 objectAtIndexedSubscript:v26 - 1];
      os_log_type_t v31 = [v30 ssid];
      int v32 = [v28 isEqualToString:v31];

      if (v32) {
        [obj removeObjectAtIndex:v26 - v25++];
      }
      ++v26;
    }
    while ([v9 count] > (unint64_t)(v29 + 2));
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  unint64_t v97 = (unint64_t)__Block_byref_object_copy__0;
  v98 = __Block_byref_object_dispose__0;
  os_log_type_t v99 = &stru_26D8F6070;
  v87[0] = MEMORY[0x263EF8330];
  v87[1] = 3221225472;
  v87[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke;
  v87[3] = &unk_264756230;
  v87[4] = buf;
  [v57 enumerateObjectsUsingBlock:v87];
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__0;
  os_log_type_t v85 = __Block_byref_object_dispose__0;
  v86 = &stru_26D8F6070;
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2;
  v80[3] = &unk_264756230;
  v80[4] = &v81;
  [obj enumerateObjectsUsingBlock:v80];
  uint64_t v33 = WFLogForCategory(0);
  os_log_type_t v34 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v33 && os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = *(void *)(*(void *)&buf[8] + 40);
    uint64_t v36 = v82[5];
    *(_DWORD *)v88 = 138412546;
    uint64_t v89 = v35;
    __int16 v90 = 2112;
    uint64_t v91 = v36;
    _os_log_impl(&dword_2257EC000, v33, v34, "Old filtered networks: %@\n New filtered networks: %@", v88, 0x16u);
  }

  os_log_type_t v37 = WFLogForCategory(0);
  os_log_type_t v38 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v37)
  {
    uint64_t v39 = v37;
    if (os_log_type_enabled(v39, v38))
    {
      uint64_t v40 = [v10 count];
      uint64_t v41 = [v57 count];
      uint64_t v42 = [v9 count];
      uint64_t v43 = [obj count];
      *(_DWORD *)v88 = 134218752;
      uint64_t v89 = v40;
      __int16 v90 = 2048;
      uint64_t v91 = v41;
      __int16 v92 = 2048;
      uint64_t v93 = v42;
      __int16 v94 = 2048;
      uint64_t v95 = v43;
      _os_log_impl(&dword_2257EC000, v39, v38, "Old Network count: %lu, old filtered network count: %lu, new network count: %lu, new filtered network count: %lu", v88, 0x2Au);
    }
  }
  v44 = objc_opt_new();
  v45 = objc_opt_new();
  v46 = objc_opt_new();
  os_log_type_t v47 = objc_opt_new();
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_128;
  v78[3] = &unk_264756258;
  id v48 = v47;
  id v79 = v48;
  [v57 enumerateObjectsUsingBlock:v78];
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2_133;
  v73[3] = &unk_264756280;
  id v49 = v48;
  id v74 = v49;
  unint64_t v77 = a5;
  id v50 = v46;
  id v75 = v50;
  id v51 = v45;
  id v76 = v51;
  [obj enumerateObjectsUsingBlock:v73];
  if ([v49 count])
  {
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_3;
    v69[3] = &unk_2647562A8;
    id v70 = v49;
    id v71 = v44;
    unint64_t v72 = a5;
    [v70 enumerateKeysAndObjectsUsingBlock:v69];
  }
  if ([v44 count] || objc_msgSend(v51, "count") || objc_msgSend(v50, "count"))
  {
    v52 = [(WFAirportViewController *)self tableView];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_4;
    v60[3] = &unk_2647562D0;
    v60[4] = self;
    uint64_t v67 = v54;
    id v61 = v51;
    id v62 = v50;
    id v63 = v44;
    id v64 = obj;
    unint64_t v68 = a5;
    id v65 = v10;
    id v66 = v9;
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_138;
    v59[3] = &unk_2647562F8;
    v59[4] = self;
    v59[5] = v54;
    [v52 performBatchUpdates:v60 completion:v59];
  }
  else
  {
    switch(v54)
    {
      case 1:
        objc_storeStrong((id *)&self->_knownNetworks, obj);
        break;
      case 2:
        objc_storeStrong((id *)&self->_popularNetworks, obj);
        break;
      case 3:
        objc_storeStrong((id *)&self->_infraNetworks, obj);
        break;
      case 4:
        objc_storeStrong((id *)&self->_adhocNetworks, obj);
        break;
      case 5:
        objc_storeStrong((id *)&self->_unconfiguredNetworks, obj);
        break;
      default:
        break;
    }
  }

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(buf, 8);
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  BOOL v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  BOOL v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_128(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(a2, "uniqueIdentifier"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setValue:v6 forKey:v7];
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2_133(uint64_t a1, void *a2, uint64_t a3)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(a2, "uniqueIdentifier"));
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
    char v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      id v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v10, "integerValue"), *(void *)(a1 + 56));
      os_log_type_t v12 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:*(void *)(a1 + 56)];
      char v13 = *(void **)(a1 + 40);
      v17[0] = v11;
      v17[1] = v12;
      os_log_type_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
      [v13 addObject:v14];
    }
    [*(id *)(a1 + 32) removeObjectForKey:v5];
  }
  else
  {
    id v15 = *(void **)(a1 + 48);
    os_log_type_t v16 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:*(void *)(a1 + 56)];
    [v15 addObject:v16];
  }
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  os_log_type_t v3 = *(void **)(a1 + 40);
  id v4 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v5, "integerValue"), *(void *)(a1 + 48));
  [v3 addObject:v4];
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_4(uint64_t a1)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2)
  {
    id v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      id v5 = [*(id *)(a1 + 32) _nameOfSection:*(void *)(a1 + 88)];
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 88);
      uint64_t v7 = [*(id *)(a1 + 40) count];
      uint64_t v8 = [*(id *)(a1 + 48) count];
      uint64_t v9 = [*(id *)(a1 + 56) count];
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceS"
                           "ection:]_block_invoke_4";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v93 = v6;
      *(_WORD *)__int16 v94 = 2048;
      *(void *)&v94[2] = v7;
      *(_WORD *)&v94[10] = 2048;
      *(void *)&v94[12] = v8;
      __int16 v95 = 2048;
      uint64_t v96 = v9;
      _os_log_impl(&dword_2257EC000, v4, v3, "%s: tableView updating started for section %@ (%lu) - insert %lu move %lu delete %lu", buf, 0x3Eu);
    }
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1040) = 1;
  switch(*(void *)(a1 + 88))
  {
    case 1:
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 1152), *(id *)(a1 + 64));
      id v10 = *(void **)(a1 + 32);
      id v11 = [v10 tableView];
      os_log_type_t v12 = [*(id *)(a1 + 32) sections];
      char v13 = objc_msgSend(v10, "tableView:viewForHeaderInSection:", v11, objc_msgSend(v12, "indexOfObject:", &unk_26D911B48));

      os_log_type_t v14 = [v13 title];
      int v15 = [*(id *)(*(void *)(a1 + 32) + 1216) isEqualToString:v14];
      if ((v15 & 1) == 0)
      {
        uint64_t v16 = [v14 copy];
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void **)(v17 + 1216);
        *(void *)(v17 + 1216) = v16;
      }
      goto LABEL_23;
    case 2:
      uint64_t v21 = *(void **)(a1 + 64);
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = 1144;
      goto LABEL_20;
    case 3:
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 1136), *(id *)(a1 + 64));
      char v13 = [*(id *)(a1 + 32) chooseNetworkHeader];
      os_log_type_t v14 = [v13 title];
      int v15 = [*(id *)(*(void *)(a1 + 32) + 1224) isEqualToString:v14];
      if ((v15 & 1) == 0)
      {
        uint64_t v24 = [v14 copy];
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(void **)(v25 + 1224);
        *(void *)(v25 + 1224) = v24;

        uint64_t v27 = [*(id *)(a1 + 32) tableView];
        v28 = [MEMORY[0x263F088D0] indexSetWithIndex:*(void *)(a1 + 96)];
        [v27 _reloadSectionHeaderFooters:v28 withRowAnimation:100];
      }
      goto LABEL_23;
    case 4:
      uint64_t v21 = *(void **)(a1 + 64);
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = 1160;
LABEL_20:
      id v29 = v21;
      int v20 = 0;
      char v13 = *(NSObject **)(v22 + v23);
      *(void *)(v22 + v23) = v29;
      break;
    case 5:
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 1168), *(id *)(a1 + 64));
      uint64_t v30 = *(void **)(a1 + 32);
      os_log_type_t v31 = [v30 tableView];
      int v32 = [*(id *)(a1 + 32) sections];
      char v13 = objc_msgSend(v30, "tableView:viewForHeaderInSection:", v31, objc_msgSend(v32, "indexOfObject:", &unk_26D911B18));

      os_log_type_t v14 = [v13 title];
      int v15 = [*(id *)(*(void *)(a1 + 32) + 1232) isEqualToString:v14];
      if ((v15 & 1) == 0)
      {
        uint64_t v33 = [v14 copy];
        uint64_t v34 = *(void *)(a1 + 32);
        uint64_t v35 = *(void **)(v34 + 1232);
        *(void *)(v34 + 1232) = v33;
      }
LABEL_23:

      int v20 = v15 ^ 1;
      break;
    default:
      char v13 = WFLogForCategory(0);
      os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
      int v20 = 0;
      if (WFCurrentLogLevel() && v13)
      {
        if (os_log_type_enabled(v13, v19))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasou"
                               "rceSection:]_block_invoke";
          _os_log_impl(&dword_2257EC000, v13, v19, "%s: unexpected section update", buf, 0xCu);
        }
        int v20 = 0;
      }
      break;
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v93 = __Block_byref_object_copy__0;
  *(void *)__int16 v94 = __Block_byref_object_dispose__0;
  *(void *)&v94[8] = &stru_26D8F6070;
  uint64_t v36 = *(void **)(a1 + 72);
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_136;
  v83[3] = &unk_264756230;
  v83[4] = buf;
  [v36 enumerateObjectsUsingBlock:v83];
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__0;
  uint64_t v81 = __Block_byref_object_dispose__0;
  v82 = &stru_26D8F6070;
  os_log_type_t v37 = *(void **)(a1 + 80);
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2_137;
  v76[3] = &unk_264756230;
  v76[4] = &v77;
  [v37 enumerateObjectsUsingBlock:v76];
  os_log_type_t v38 = WFLogForCategory(0);
  os_log_type_t v39 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v38 && os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = *(const char **)(*(void *)&buf[8] + 40);
    uint64_t v41 = v78[5];
    *(_DWORD *)os_log_type_t v85 = 138412546;
    v86 = v40;
    __int16 v87 = 2112;
    uint64_t v88 = v41;
    _os_log_impl(&dword_2257EC000, v38, v39, "Old networks: %@\n New networks: %@", v85, 0x16u);
  }

  uint64_t v42 = [*(id *)(a1 + 32) tableView];
  [v42 deleteRowsAtIndexPaths:*(void *)(a1 + 56) withRowAnimation:0];

  uint64_t v43 = [*(id *)(a1 + 32) tableView];
  [v43 insertRowsAtIndexPaths:*(void *)(a1 + 40) withRowAnimation:0];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v44 = *(id *)(a1 + 48);
  uint64_t v45 = [v44 countByEnumeratingWithState:&v72 objects:v91 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v73 != v46) {
          objc_enumerationMutation(v44);
        }
        id v48 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        id v49 = objc_msgSend(v48, "objectAtIndexedSubscript:", 0, (void)v72);
        id v50 = [v48 objectAtIndexedSubscript:1];
        id v51 = [*(id *)(a1 + 32) tableView];
        [v51 moveRowAtIndexPath:v49 toIndexPath:v50];
      }
      uint64_t v45 = [v44 countByEnumeratingWithState:&v72 objects:v91 count:16];
    }
    while (v45);
  }

  v52 = *(unsigned char **)(a1 + 32);
  if (!v52[1032])
  {
    uint64_t v53 = *(void *)(a1 + 96);
    uint64_t v54 = [v52 sections];
    if (v53 == [v54 indexOfObject:&unk_26D911B60])
    {
      int v55 = [*(id *)(a1 + 32) tableView];
      uint64_t v56 = [v55 numberOfRowsInSection:*(void *)(a1 + 96)];
      LODWORD(v56) = v56 > [*(id *)(*(void *)(a1 + 32) + 1136) count];

      if (!v56) {
        goto LABEL_44;
      }
      uint64_t v57 = [*(id *)(a1 + 32) tableView];
      uint64_t v58 = [v57 numberOfRowsInSection:*(void *)(a1 + 96)];

      v59 = WFLogForCategory(0);
      os_log_type_t v60 = OSLogForWFLogLevel(3uLL);
      uint64_t v61 = v58 - 1;
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v59 && os_log_type_enabled(v59, v60))
      {
        uint64_t v62 = *(void *)(a1 + 96);
        *(_DWORD *)os_log_type_t v85 = 136315650;
        v86 = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:]_block_invoke";
        __int16 v87 = 2048;
        uint64_t v88 = v61;
        __int16 v89 = 2048;
        uint64_t v90 = v62;
        _os_log_impl(&dword_2257EC000, v59, v60, "%s: deleting other network row at row: %lu section: %lu", v85, 0x20u);
      }

      uint64_t v54 = [*(id *)(a1 + 32) tableView];
      id v63 = [MEMORY[0x263F088C8] indexPathForRow:v61 inSection:*(void *)(a1 + 96)];
      v84 = v63;
      id v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
      [v54 deleteRowsAtIndexPaths:v64 withRowAnimation:0];
    }
  }
LABEL_44:
  if (v20)
  {
    id v65 = WFLogForCategory(0);
    os_log_type_t v66 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v65)
    {
      uint64_t v67 = v65;
      if (os_log_type_enabled(v67, v66))
      {
        unint64_t v68 = [*(id *)(a1 + 32) _sectionNameAtIndex:*(void *)(a1 + 96)];
        uint64_t v69 = *(void *)(a1 + 96);
        *(_DWORD *)os_log_type_t v85 = 136315650;
        v86 = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:]_block_invoke";
        __int16 v87 = 2112;
        uint64_t v88 = (uint64_t)v68;
        __int16 v89 = 2048;
        uint64_t v90 = v69;
        _os_log_impl(&dword_2257EC000, v67, v66, "%s: reloading header at section %@ (%lu)", v85, 0x20u);
      }
    }

    id v70 = [*(id *)(a1 + 32) tableView];
    id v71 = [MEMORY[0x263F088D0] indexSetWithIndex:*(void *)(a1 + 96)];
    [v70 _reloadSectionHeaderFooters:v71 withRowAnimation:100];
  }
  _Block_object_dispose(&v77, 8);

  _Block_object_dispose(buf, 8);
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_136(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  uint64_t v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2_137(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  uint64_t v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_138(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2)
  {
    id v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      id v5 = [*(id *)(a1 + 32) _nameOfSection:*(void *)(a1 + 40)];
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:]_block_invoke";
      __int16 v22 = 2112;
      uint64_t v23 = v5;
      __int16 v24 = 2048;
      uint64_t v25 = v6;
      _os_log_impl(&dword_2257EC000, v4, v3, "%s: tableView updating finished for section %@ (%lu)", buf, 0x20u);
    }
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1040) = 0;
  int v7 = [*(id *)(a1 + 32) _shouldContinueUpdateNetworkList];
  uint64_t v8 = *(id **)(a1 + 32);
  if (v7)
  {
    uint64_t v9 = (void *)[v8[151] copy];
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = *(void *)(a1 + 32);
    os_log_type_t v12 = *(void **)(v11 + 1208);
    *(void *)(v11 + 1208) = v10;

    *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 0;
    char v13 = WFLogForCategory(0);
    os_log_type_t v14 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v13)
    {
      int v15 = v13;
      if (os_log_type_enabled(v15, v14))
      {
        uint64_t v16 = [v9 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = (const char *)v16;
        _os_log_impl(&dword_2257EC000, v15, v14, "continuing with pending network update (count %lu)", buf, 0xCu);
      }
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_140;
    v18[3] = &unk_264756208;
    v18[4] = *(void *)(a1 + 32);
    id v19 = v9;
    id v17 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v18);
  }
  else
  {
    [v8 _processPendingCurrentNetworkUpdate];
  }
}

uint64_t __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_140(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNetworks:*(void *)(a1 + 40)];
}

- (BOOL)_shouldContinueUpdateNetworkList
{
  os_log_type_t v3 = [(WFAirportViewController *)self sections];
  char v4 = [v3 containsObject:&unk_26D911B48];
  char v5 = v4 ^ ([(NSArray *)self->_knownNetworks count] != 0);

  uint64_t v6 = [(WFAirportViewController *)self sections];
  int v7 = [v6 containsObject:&unk_26D911B30];
  NSUInteger v8 = [(NSArray *)self->_popularNetworks count];

  uint64_t v9 = [(WFAirportViewController *)self sections];
  int v10 = [v9 containsObject:&unk_26D911B60];
  BOOL v11 = [(NSArray *)self->_infraNetworks count] != 0;

  os_log_type_t v12 = [(WFAirportViewController *)self sections];
  int v13 = [v12 containsObject:&unk_26D911B00];
  BOOL v14 = [(NSArray *)self->_unconfiguredNetworks count] != 0;

  BOOL result = 1;
  if ((v5 & 1) == 0 && ((v7 ^ (v8 != 0)) & 1) == 0 && ((v10 ^ v11) & 1) == 0 && ((v13 ^ v14) & 1) == 0) {
    return self->_networkResultsChangedWhileUIUpdates;
  }
  return result;
}

- (void)refresh
{
  if (![(WFAirportViewController *)self isInEditingMode])
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__WFAirportViewController_refresh__block_invoke;
    block[3] = &unk_2647561B8;
    block[4] = self;
    dispatch_sync(internalQueue, block);
  }
}

void __34__WFAirportViewController_refresh__block_invoke(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) listDelegate];
  objc_msgSend(*(id *)(a1 + 32), "setShowDiagnostics:", objc_msgSend(v14, "airportSettingsViewControllerShouldShowDiagnosticsMode:", *(void *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "setShowNANUI:", objc_msgSend(v14, "airportSettingsViewControllerShouldShowNANUI:", *(void *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "setShowKnownNetworks:", objc_msgSend(v14, "airportSettingsViewControllerShouldShowKnownNetworks:", *(void *)(a1 + 32)));
  if (([*(id *)(a1 + 32) isInEditingMode] & 1) == 0)
  {
    if ([*(id *)(a1 + 32) showKnownNetworks])
    {
      v2 = [*(id *)(a1 + 32) sections];
      char v3 = [v2 containsObject:&unk_26D911AE8];

      if ((v3 & 1) == 0)
      {
        NSUInteger v8 = [*(id *)(a1 + 32) sections];
        int v7 = (void *)[v8 mutableCopy];

        [v7 addObject:&unk_26D911AE8];
        goto LABEL_8;
      }
    }
  }
  if (([*(id *)(a1 + 32) showKnownNetworks] & 1) == 0)
  {
    char v4 = [*(id *)(a1 + 32) sections];
    int v5 = [v4 containsObject:&unk_26D911AE8];

    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) sections];
      int v7 = (void *)[v6 mutableCopy];

      [v7 removeObject:&unk_26D911B18];
LABEL_8:
      [*(id *)(a1 + 32) setSections:v7];
    }
  }
  if ([*(id *)(a1 + 32) _refreshATJShownStateIfChanged])
  {
    uint64_t v9 = [*(id *)(a1 + 32) sections];
    int v10 = (void *)[v9 mutableCopy];

    if ([*(id *)(a1 + 32) askToJoinShown]) {
      [v10 addObject:&unk_26D911B90];
    }
    else {
      [v10 removeObject:&unk_26D911B90];
    }
    [*(id *)(a1 + 32) setSections:v10];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (([v14 networkListViewControllerNetworkRestrictionActive:*(void *)(a1 + 32)] & 1) != 0
     || [v14 networkListViewControllerIsManagedAppleID:*(void *)(a1 + 32)]))
  {
    BOOL v11 = [*(id *)(a1 + 32) sections];
    os_log_type_t v12 = (void *)[v11 mutableCopy];

    [v12 removeObject:&unk_26D911BA8];
    [*(id *)(a1 + 32) setSections:v12];
  }
  [*(id *)(a1 + 32) performSelectorOnMainThread:sel__updateNetworkRestrictionHeader withObject:0 waitUntilDone:1];
  int v13 = [*(id *)(a1 + 32) tableView];
  [v13 reloadData];
}

- (void)powerStateDidChange:(BOOL)a3
{
  int v5 = -[WFAirportViewController _defaultSectionsForPowerState:](self, "_defaultSectionsForPowerState:");
  [(WFAirportViewController *)self setSections:v5];

  if (!a3)
  {
    infraNetworks = self->_infraNetworks;
    self->_infraNetworks = 0;

    adhocNetworks = self->_adhocNetworks;
    self->_adhocNetworks = 0;

    unconfiguredNetworks = self->_unconfiguredNetworks;
    self->_unconfiguredNetworks = 0;

    popularNetworks = self->_popularNetworks;
    self->_popularNetworks = 0;

    knownNetworks = self->_knownNetworks;
    self->_knownNetworks = 0;

    currentNetwork = self->_currentNetwork;
    self->_currentNetwork = 0;

    self->_currentNetworkState = 0;
    currentNetworkSubtitle = self->_currentNetworkSubtitle;
    self->_currentNetworkSubtitle = 0;
  }
  [(WFAirportViewController *)self refresh];
}

- (void)powerStateDidChangeToggle:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v5 = [(WFAirportViewController *)self _defaultSectionsForPowerState:a3 == 1];
  [(WFAirportViewController *)self setSections:v5];

  uint64_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
  {
    NSUInteger v8 = v6;
    if (os_log_type_enabled(v8, v7))
    {
      uint64_t v9 = WFPowerStateToggleToString(a3);
      int v21 = 136315394;
      __int16 v22 = "-[WFAirportViewController powerStateDidChangeToggle:]";
      __int16 v23 = 2112;
      __int16 v24 = v9;
      _os_log_impl(&dword_2257EC000, v8, v7, "%s: power state is now %@", (uint8_t *)&v21, 0x16u);
    }
  }

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    infraNetworks = self->_infraNetworks;
    self->_infraNetworks = 0;

    adhocNetworks = self->_adhocNetworks;
    self->_adhocNetworks = 0;

    unconfiguredNetworks = self->_unconfiguredNetworks;
    self->_unconfiguredNetworks = 0;

    popularNetworks = self->_popularNetworks;
    self->_popularNetworks = 0;

    knownNetworks = self->_knownNetworks;
    self->_knownNetworks = 0;

    currentNetwork = self->_currentNetwork;
    self->_currentNetwork = 0;

    self->_currentNetworkState = 0;
    currentNetworkSubtitle = self->_currentNetworkSubtitle;
    self->_currentNetworkSubtitle = 0;

    pendingNetworks = self->_pendingNetworks;
    self->_pendingNetworks = 0;

    pendingCurrentNetworkUpdate = self->_pendingCurrentNetworkUpdate;
    self->_pendingCurrentNetworkUpdate = 0;

    id v19 = +[WFNetworkRowConfig settingsNetworkRowConfig];
    currentNetworkRowConfig = self->_currentNetworkRowConfig;
    self->_currentNetworkRowConfig = v19;

    [(WFNetworkRowConfig *)self->_currentNetworkRowConfig setSubtitle:0];
  }
  [(WFAirportViewController *)self refresh];
}

- (BOOL)powered
{
  return [(WFAirportViewController *)self powerState] == 1;
}

- (unint64_t)powerState
{
  char v3 = [(WFAirportViewController *)self listDelegate];
  unint64_t v4 = [v3 networkListViewControllerCurrentPowerStateToggle:self];

  return v4;
}

- (BOOL)shouldPromptWhenPersonalHotspotIsEnabled
{
  return 1;
}

- (BOOL)shouldPromptWhenCarPlaySessionIsActive
{
  return 1;
}

- (BOOL)supportsWiFiPasswordSharing
{
  return 1;
}

- (BOOL)supportsHealthRecommendations
{
  return 1;
}

- (void)powerModificationStateDidChange:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_disablePowerModification == a3)
  {
    char v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[WFAirportViewController powerModificationStateDidChange:]";
      _os_log_impl(&dword_2257EC000, v3, v4, "%s: No change", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    self->_disablePowerModification = a3;
    [(WFAirportViewController *)self _reloadPowerSection];
  }
}

- (void)managedAppleIDStateChange:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_isManagedAppleID == a3)
  {
    char v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[WFAirportViewController managedAppleIDStateChange:]";
      _os_log_impl(&dword_2257EC000, v3, v4, "%s: No change", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    self->_isManagedAppleID = a3;
    [(WFAirportViewController *)self refresh];
  }
}

- (void)reloadCellsForNetworkNames:(id)a3
{
  os_log_type_t v4 = (objc_class *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  os_log_type_t v12 = __54__WFAirportViewController_reloadCellsForNetworkNames___block_invoke;
  int v13 = &unk_264756320;
  id v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  NSUInteger v8 = [(WFAirportViewController *)self tableView];
  uint64_t v9 = [v7 allObjects];
  [v8 reloadRowsAtIndexPaths:v9 withRowAnimation:5];
}

void __54__WFAirportViewController_reloadCellsForNetworkNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  os_log_type_t v4 = [*(id *)(a1 + 32) _indexPathForNetworkName:v3];
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    id v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_2257EC000, v5, v6, "Cannot find indexpath for network: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)scrollToAirportCell:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      os_log_type_t v4 = (void *)MEMORY[0x263F088C8];
      id v5 = [(WFAirportViewController *)self sections];
      os_log_type_t v6 = v5;
      int v7 = &unk_26D911BA8;
      break;
    case 2uLL:
      os_log_type_t v4 = (void *)MEMORY[0x263F088C8];
      id v5 = [(WFAirportViewController *)self sections];
      os_log_type_t v6 = v5;
      int v7 = &unk_26D911B90;
      break;
    case 1uLL:
      os_log_type_t v4 = (void *)MEMORY[0x263F088C8];
      id v5 = [(WFAirportViewController *)self sections];
      os_log_type_t v6 = v5;
      int v7 = &unk_26D911B78;
      break;
    default:
      return;
  }
  objc_msgSend(v4, "indexPathForRow:inSection:", 0, objc_msgSend(v5, "indexOfObject:", v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [(WFAirportViewController *)self tableView];
  [v8 scrollToRowAtIndexPath:v9 atScrollPosition:1 animated:1];
}

- (id)_indexPathForNetworkName:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAirportViewController *)self currentNetwork];
  os_log_type_t v6 = [v5 ssid];
  int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    id v8 = [(WFAirportViewController *)self sections];
    uint64_t v9 = [v8 indexOfObject:&unk_26D911B78];

    id v10 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:v9];
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = [(WFAirportViewController *)self knownNetworks];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __52__WFAirportViewController__indexPathForNetworkName___block_invoke;
    v32[3] = &unk_264756348;
    id v12 = v4;
    id v33 = v12;
    uint64_t v34 = &v35;
    [v11 enumerateObjectsUsingBlock:v32];

    if (v36[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v13 = [(WFAirportViewController *)self popularNetworks];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __52__WFAirportViewController__indexPathForNetworkName___block_invoke_2;
      v29[3] = &unk_264756348;
      id v14 = v12;
      id v30 = v14;
      os_log_type_t v31 = &v35;
      [v13 enumerateObjectsUsingBlock:v29];

      if (v36[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v15 = [(WFAirportViewController *)self infraNetworks];
        uint64_t v23 = MEMORY[0x263EF8330];
        uint64_t v24 = 3221225472;
        uint64_t v25 = __52__WFAirportViewController__indexPathForNetworkName___block_invoke_3;
        uint64_t v26 = &unk_264756348;
        id v27 = v14;
        v28 = &v35;
        [v15 enumerateObjectsUsingBlock:&v23];

        if (v36[3] == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v10 = 0;
        }
        else
        {
          int v20 = [(WFAirportViewController *)self sections];
          uint64_t v21 = [v20 indexOfObject:&unk_26D911B60];

          id v10 = [MEMORY[0x263F088C8] indexPathForRow:v36[3] inSection:v21];
        }
      }
      else
      {
        uint64_t v18 = [(WFAirportViewController *)self sections];
        uint64_t v19 = [v18 indexOfObject:&unk_26D911B30];

        id v10 = [MEMORY[0x263F088C8] indexPathForRow:v36[3] inSection:v19];
      }
    }
    else
    {
      uint64_t v16 = [(WFAirportViewController *)self sections];
      uint64_t v17 = [v16 indexOfObject:&unk_26D911B48];

      id v10 = [MEMORY[0x263F088C8] indexPathForRow:v36[3] inSection:v17];
    }

    _Block_object_dispose(&v35, 8);
  }

  return v10;
}

void __52__WFAirportViewController__indexPathForNetworkName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 ssid];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

void __52__WFAirportViewController__indexPathForNetworkName___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 ssid];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

void __52__WFAirportViewController__indexPathForNetworkName___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 ssid];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (void)updateViewsForNetworks:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[WFAirportViewController updateViewsForNetworks:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_2257EC000, v5, v6, "%s: updating views for %@", buf, 0x16u);
    }

    if (v4)
    {
      internalQueue = self->_internalQueue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __50__WFAirportViewController_updateViewsForNetworks___block_invoke;
      v10[3] = &unk_264756208;
      id v11 = v4;
      id v12 = self;
      dispatch_sync(internalQueue, v10);
    }
    else
    {
      id v8 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 136315138;
        id v14 = "-[WFAirportViewController updateViewsForNetworks:]";
        _os_log_impl(&dword_2257EC000, v8, v9, "%s: nil networks", buf, 0xCu);
      }
    }
  }
  else
  {
    [(WFAirportViewController *)self performSelectorOnMainThread:sel_updateViewsForNetworks_ withObject:v4 waitUntilDone:0];
  }
}

void __50__WFAirportViewController_updateViewsForNetworks___block_invoke(uint64_t a1)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  uint64_t v69 = [MEMORY[0x263EFF980] array];
  v2 = [*(id *)(a1 + 32) infrastructureNetworks];
  id v3 = [*(id *)(a1 + 40) sections];
  uint64_t v4 = [v3 indexOfObject:&unk_26D911B60];

  uint64_t v5 = [*(id *)(a1 + 40) infraNetworks];
  uint64_t v70 = a1;
  unint64_t v68 = v2;
  if (v5 && (v6 = (void *)v5, uint64_t v7 = [v2 count], v6, v7))
  {
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 136315138;
        os_log_type_t v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
        _os_log_impl(&dword_2257EC000, v8, v9, "%s: infra section is not found", buf, 0xCu);
      }

      [*(id *)(a1 + 40) _dumpSections];
    }
    else
    {
      id v12 = [*(id *)(a1 + 40) infraNetworks];
      int v13 = (void *)[v12 mutableCopy];

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v14 = v2;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v80 objects:v94 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v81 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            int v20 = [*(id *)(a1 + 40) infraNetworks];
            uint64_t v21 = [v20 indexOfObject:v19];

            if (v21 == 0x7FFFFFFFFFFFFFFFLL)
            {
              __int16 v22 = WFLogForCategory(0);
              os_log_type_t v23 = OSLogForWFLogLevel(3uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 3 && v22 && os_log_type_enabled(v22, v23))
              {
                *(_DWORD *)buf = 136315394;
                os_log_type_t v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
                __int16 v86 = 2112;
                __int16 v87 = v19;
                _os_log_impl(&dword_2257EC000, v22, v23, "%s: unknown row for record %@", buf, 0x16u);
              }
            }
            else
            {
              uint64_t v24 = [MEMORY[0x263F088C8] indexPathForRow:v21 inSection:v4];
              [v69 addObject:v24];

              [v13 replaceObjectAtIndex:v21 withObject:v19];
            }
            a1 = v70;
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v80 objects:v94 count:16];
        }
        while (v16);
      }

      [*(id *)(a1 + 40) setInfraNetworks:v13];
    }
  }
  else
  {
    id v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315138;
      os_log_type_t v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
      _os_log_impl(&dword_2257EC000, v10, v11, "%s: no infra networks", buf, 0xCu);
    }
  }
  uint64_t v25 = [*(id *)(a1 + 32) knownNetworks];
  uint64_t v26 = [*(id *)(a1 + 40) sections];
  uint64_t v27 = [v26 indexOfObject:&unk_26D911B48];

  uint64_t v28 = [*(id *)(a1 + 40) knownNetworks];
  os_log_type_t v66 = v25;
  if (v28 && (id v29 = (void *)v28, v30 = objc_msgSend(v25, "count", v25, v68), v29, v30))
  {
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      os_log_type_t v31 = WFLogForCategory(0);
      os_log_type_t v32 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v31 && os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 136315138;
        os_log_type_t v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
        _os_log_impl(&dword_2257EC000, v31, v32, "%s: known section is not found", buf, 0xCu);
      }

      [*(id *)(a1 + 40) _dumpSections];
    }
    else
    {
      uint64_t v35 = [*(id *)(a1 + 40) knownNetworks];
      uint64_t v36 = (void *)[v35 mutableCopy];

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v37 = v25;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v76 objects:v93 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v77;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v77 != v40) {
              objc_enumerationMutation(v37);
            }
            uint64_t v42 = *(void **)(*((void *)&v76 + 1) + 8 * j);
            uint64_t v43 = [*(id *)(v70 + 40) knownNetworks];
            uint64_t v44 = [v43 indexOfObject:v42];

            if (v44 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v45 = WFLogForCategory(0);
              os_log_type_t v46 = OSLogForWFLogLevel(3uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 3 && v45 && os_log_type_enabled(v45, v46))
              {
                *(_DWORD *)buf = 136315394;
                os_log_type_t v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
                __int16 v86 = 2112;
                __int16 v87 = v42;
                _os_log_impl(&dword_2257EC000, v45, v46, "%s: unknown row for record %@", buf, 0x16u);
              }
            }
            else
            {
              os_log_type_t v47 = [MEMORY[0x263F088C8] indexPathForRow:v44 inSection:v27];
              [v69 addObject:v47];

              [v36 replaceObjectAtIndex:v44 withObject:v42];
            }
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v76 objects:v93 count:16];
        }
        while (v39);
      }

      a1 = v70;
      [*(id *)(v70 + 40) setKnownNetworks:v36];
    }
  }
  else
  {
    id v33 = WFLogForCategory(0);
    os_log_type_t v34 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v33 && os_log_type_enabled(v33, v34))
    {
      *(_DWORD *)buf = 136315138;
      os_log_type_t v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
      _os_log_impl(&dword_2257EC000, v33, v34, "%s: no knownNetworks networks", buf, 0xCu);
    }
  }
  if (objc_msgSend(v69, "count", v66))
  {
    id v48 = WFLogForCategory(0);
    os_log_type_t v49 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v48 && os_log_type_enabled(v48, v49))
    {
      *(_DWORD *)buf = 136315394;
      os_log_type_t v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
      __int16 v86 = 2112;
      __int16 v87 = v69;
      _os_log_impl(&dword_2257EC000, v48, v49, "%s: updating paths='%@'", buf, 0x16u);
    }

    id v50 = [*(id *)(a1 + 40) tableView];
    [v50 reloadRowsAtIndexPaths:v69 withRowAnimation:5];
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v51 = [obj countByEnumeratingWithState:&v72 objects:v92 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v73;
    do
    {
      for (uint64_t k = 0; k != v52; ++k)
      {
        if (*(void *)v73 != v53) {
          objc_enumerationMutation(obj);
        }
        int v55 = *(void **)(*((void *)&v72 + 1) + 8 * k);
        uint64_t v56 = [*(id *)(a1 + 40) currentNetwork];
        if ([v55 isEqual:v56])
        {
          uint64_t v57 = [*(id *)(*(void *)(a1 + 40) + 1056) title];
          uint64_t v58 = [v55 title];
          char v59 = [v57 isEqualToString:v58];

          if ((v59 & 1) == 0)
          {
            os_log_type_t v60 = WFLogForCategory(0);
            os_log_type_t v61 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v60)
            {
              uint64_t v62 = v60;
              if (os_log_type_enabled(v62, v61))
              {
                id v63 = [*(id *)(*(void *)(a1 + 40) + 1056) title];
                id v64 = [v55 title];
                *(_DWORD *)buf = 136315906;
                os_log_type_t v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
                __int16 v86 = 2112;
                __int16 v87 = v63;
                __int16 v88 = 2112;
                __int16 v89 = v64;
                __int16 v90 = 2112;
                uint64_t v91 = v55;
                _os_log_impl(&dword_2257EC000, v62, v61, "%s: updating current network view (title='%@' -> '%@' with ='%@'", buf, 0x2Au);

                a1 = v70;
              }
            }
            objc_storeStrong((id *)(*(void *)(a1 + 40) + 1056), v55);
            id v65 = [*(id *)(a1 + 40) currentNetworkRowConfig];
            [v65 setNetwork:v55];

            [*(id *)(a1 + 40) _reloadCurrentNetworkCell];
          }
        }
        else
        {
        }
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v72 objects:v92 count:16];
    }
    while (v52);
  }
}

- (void)setAskToJoinMode:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v18 = 136315394;
    uint64_t v19 = "-[WFAirportViewController setAskToJoinMode:]";
    __int16 v20 = 2048;
    int64_t v21 = a3;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: setting atj mode to %ld", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v7 = [(WFAirportViewController *)self sections];
  uint64_t v8 = [v7 indexOfObject:&unk_26D911B90];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_log_type_t v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[WFAirportViewController setAskToJoinMode:]";
      _os_log_impl(&dword_2257EC000, v9, v10, "%s: unable to find WFAirportSectionAskToJoin in sections", (uint8_t *)&v18, 0xCu);
    }

    [(WFAirportViewController *)self _dumpSections];
  }
  else
  {
    os_log_type_t v11 = [(WFAirportViewController *)self tableView];
    id v12 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:v8];
    int v13 = [v11 cellForRowAtIndexPath:v12];

    if (v13)
    {
      id v14 = [(WFAirportViewController *)self _askToJoinStateStringForATJMode:a3];
      uint64_t v15 = [v13 detailTextLabel];
      [v15 setText:v14];
    }
    uint64_t v16 = [(WFAirportViewController *)self tableView];
    uint64_t v17 = [MEMORY[0x263F088D0] indexSetWithIndex:v8];
    [v16 _reloadSectionHeaderFooters:v17 withRowAnimation:5];
  }
}

- (void)setAutoInstantHotspotJoinOption:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v20 = 136315394;
    int64_t v21 = "-[WFAirportViewController setAutoInstantHotspotJoinOption:]";
    __int16 v22 = 2048;
    int64_t v23 = a3;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: setting auto hotspot option to %ld", (uint8_t *)&v20, 0x16u);
  }

  uint64_t v7 = [(WFAirportViewController *)self sections];
  uint64_t v8 = [v7 indexOfObject:&unk_26D911BA8];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_log_type_t v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      int v20 = 136315138;
      int64_t v21 = "-[WFAirportViewController setAutoInstantHotspotJoinOption:]";
      _os_log_impl(&dword_2257EC000, v9, v10, "%s: unable to find WFAirportSectionAutoInstantHotspot in sections", (uint8_t *)&v20, 0xCu);
    }

    [(WFAirportViewController *)self _dumpSections];
  }
  else
  {
    os_log_type_t v11 = [(WFAirportViewController *)self tableView];
    id v12 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:v8];
    int v13 = [v11 cellForRowAtIndexPath:v12];

    if (v13)
    {
      id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v15 = [(WFAirportViewController *)self _getAutoHotspotOptionText:a3];
      uint64_t v16 = [v14 localizedStringForKey:v15 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      uint64_t v17 = [v13 detailTextLabel];
      [v17 setText:v16];
    }
    int v18 = [(WFAirportViewController *)self tableView];
    uint64_t v19 = [MEMORY[0x263F088D0] indexSetWithIndex:v8];
    [v18 _reloadSectionHeaderFooters:v19 withRowAnimation:5];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(WFAirportViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  switch([(WFAirportViewController *)self _sectionTypeAtSection:a4])
  {
    case 0uLL:
      showOtherNetworuint64_t k = [(WFAirportViewController *)self rowCountWithPlacardCell:1];
      uint64_t v6 = [(WFAirportViewController *)self currentNetwork];
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        uint64_t v8 = [(WFAirportViewController *)self currentNetwork];
        if ([v8 canBeDisplayedAsCurrent])
        {
          BOOL v9 = [(WFAirportViewController *)self powered];

          showOtherNetwork += v9;
        }
        else
        {
        }
      }
      if ([(WFAirportViewController *)self showDiagnosticsCell]) {
        showOtherNetwork += [(WFAirportViewController *)self powered];
      }
      goto LABEL_24;
    case 1uLL:
      uint64_t v10 = 1152;
      goto LABEL_17;
    case 2uLL:
      uint64_t v10 = 1144;
      goto LABEL_17;
    case 3uLL:
      showOtherNetworuint64_t k = self->_showOtherNetwork;
      if ([(NSArray *)self->_infraNetworks count]) {
        showOtherNetwork += [(NSArray *)self->_infraNetworks count];
      }
      goto LABEL_24;
    case 4uLL:
      uint64_t v11 = 1160;
      goto LABEL_12;
    case 5uLL:
      uint64_t v11 = 1168;
LABEL_12:
      if (![*(id *)((char *)&self->super.super.super.super.super.isa + v11) count]) {
        goto LABEL_14;
      }
      id v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
      goto LABEL_18;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 10uLL:
      showOtherNetworuint64_t k = 1;
      goto LABEL_24;
    case 11uLL:
      uint64_t v10 = 1240;
      goto LABEL_17;
    case 12uLL:
      uint64_t v10 = 1248;
LABEL_17:
      id v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
LABEL_18:
      int64_t result = [v12 count];
      break;
    default:
LABEL_14:
      showOtherNetworuint64_t k = 0;
LABEL_24:
      int64_t result = showOtherNetwork;
      break;
  }
  return result;
}

- (int64_t)rowCountWithPlacardCell:(int64_t)a3
{
  return a3 + [(WFAirportViewController *)self usePlacardCell];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = -[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", [v8 section]);
  uint64_t v10 = [v8 row];
  uint64_t v11 = [(WFAirportViewController *)self listDelegate];
  switch(v9)
  {
    case 0uLL:
      id v12 = 0;
      if ([(WFAirportViewController *)self usePlacardCell] && !v10)
      {
        id v12 = [v7 dequeueReusableCellWithIdentifier:@"WFWiFiPlacardCell"];
        int64_t v4 = [(WFAirportViewController *)self parentViewController];
        int v13 = [v4 navigationItem];
        [v12 setNavigationItem:v13];
      }
      if (v10 != [(WFAirportViewController *)self rowCountWithPlacardCell:0])
      {
        if (v10 == [(WFAirportViewController *)self rowCountWithPlacardCell:1]
          && [(WFAirportViewController *)self showDiagnosticsCell])
        {
          id v14 = [v7 dequeueReusableCellWithIdentifier:@"WFDiagnosticsCell"];

          uint64_t v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v37 = v36;
          uint64_t v38 = @"kWFLocWiFiDiagnosticsTitle";
          goto LABEL_40;
        }
        int64_t v60 = [(WFAirportViewController *)self rowCountWithPlacardCell:1];
        if (v10 == v60)
        {
          uint64_t v61 = [(WFAirportViewController *)self currentNetwork];
          if (v61)
          {
            long long v74 = (void *)v61;
            int64_t v4 = [(WFAirportViewController *)self currentNetwork];
            if ([v4 canBeDisplayedAsCurrent]
              && ![(WFAirportViewController *)self showDiagnosticsCell])
            {

              goto LABEL_82;
            }
            int v62 = 1;
          }
          else
          {
            int v62 = 0;
            long long v74 = 0;
          }
        }
        else
        {
          int v62 = 0;
        }
        if (v10 == [(WFAirportViewController *)self rowCountWithPlacardCell:2])
        {
          char v73 = v62;
          uint64_t v64 = [(WFAirportViewController *)self currentNetwork];
          if (v64)
          {
            id v65 = (void *)v64;
            long long v72 = v4;
            os_log_type_t v66 = [(WFAirportViewController *)self currentNetwork];
            if ([v66 canBeDisplayedAsCurrent])
            {
              BOOL v67 = [(WFAirportViewController *)self showDiagnosticsCell];
            }
            else
            {

              BOOL v67 = 0;
            }
            int64_t v4 = v72;
          }
          else
          {
            BOOL v67 = 0;
          }
          if ((v73 & 1) == 0) {
            goto LABEL_71;
          }
        }
        else
        {
          BOOL v67 = 0;
          if (!v62)
          {
LABEL_71:
            if (v10 == v60)
            {

              if (v67) {
                goto LABEL_82;
              }
LABEL_75:
              id v14 = v12;
              goto LABEL_47;
            }
            if (!v67) {
              goto LABEL_75;
            }
LABEL_82:
            char v59 = [(WFAirportViewController *)self currentNetwork];
            if (v11) {
              uint64_t v68 = [v11 airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:self];
            }
            else {
              uint64_t v68 = 0;
            }
            uint64_t v69 = [(WFAirportViewController *)self currentNetworkSubtitle];

            if (v69) {
              [(WFAirportViewController *)self currentNetworkSubtitle];
            }
            else {
            uint64_t v70 = [v59 subtitle];
            }
            id v14 = [v7 dequeueReusableCellWithIdentifier:@"WFNetworkCell" forIndexPath:v8];
            id v71 = [v59 title];
            [v14 setTitle:v71];

            [v14 setSubtitle:v70];
            objc_msgSend(v14, "setSecure:", objc_msgSend(v59, "isSecure"));
            [v14 setConnectionError:v68];
            if ((v68 & 1) == 0) {
              [v14 setBars:WFSignalBarsFromScaledRSSI(self->_currentNetworkScaledRSSI)];
            }
            [v14 setState:self->_currentNetworkState];
            objc_msgSend(v14, "setPersonalHotspot:", objc_msgSend(v59, "iOSHotspot"));
            [v14 setAccessoryType:4];

            goto LABEL_51;
          }
        }

        goto LABEL_71;
      }
      id v14 = [v7 dequeueReusableCellWithIdentifier:@"WFPowerCell"];

      uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if ([(WFAirportViewController *)self _isChinaDevice]) {
        uint64_t v16 = @"kWFLocWiFiPowerTitleCH";
      }
      else {
        uint64_t v16 = @"kWFLocWiFiPowerTitle";
      }
      uint64_t v17 = [v15 localizedStringForKey:v16 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      int v18 = [v14 textLabel];
      [v18 setText:v17];

      id v19 = objc_alloc(MEMORY[0x263F82C40]);
      int v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [v20 addTarget:self action:sel__powerSwitchChanged_ forControlEvents:4096];
      unint64_t v21 = [(WFAirportViewController *)self powerState];
      __int16 v22 = WFLogForCategory(0);
      os_log_type_t v23 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v22)
      {
        uint64_t v24 = v22;
        if (os_log_type_enabled(v24, v23))
        {
          long long v75 = WFPowerStateToggleToString(v21);
          *(_DWORD *)buf = 136315394;
          long long v77 = "-[WFAirportViewController tableView:cellForRowAtIndexPath:]";
          __int16 v78 = 2112;
          long long v79 = v75;
          _os_log_impl(&dword_2257EC000, v24, v23, "%s: set power state UI to %@", buf, 0x16u);
        }
      }

      if (v21 == 3)
      {
        [v20 setEnabled:0];
        uint64_t v25 = v20;
        uint64_t v26 = 0;
        goto LABEL_31;
      }
      objc_msgSend(v20, "setEnabled:", -[WFAirportViewController disablePowerModification](self, "disablePowerModification") ^ 1);
      objc_msgSend(v20, "setOn:", -[WFAirportViewController powered](self, "powered"));
      if (v21 == 2)
      {
        id v63 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
        [v63 startAnimating];
        [v14 setAccessoryView:v63];

        goto LABEL_33;
      }
LABEL_32:
      [v14 setAccessoryView:v20];
LABEL_33:
      [v14 setSelectionStyle:0];
LABEL_46:

LABEL_47:
      return v14;
    case 1uLL:
      uint64_t v27 = 1152;
      goto LABEL_24;
    case 2uLL:
      uint64_t v27 = 1144;
      goto LABEL_24;
    case 3uLL:
      infraNetworks = self->_infraNetworks;
      if (!infraNetworks || v10 == [(NSArray *)infraNetworks count] && self->_showOtherNetwork)
      {
        id v14 = [v7 dequeueReusableCellWithIdentifier:@"WFOtherNetworkCell"];
        id v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v30 = [v29 localizedStringForKey:@"kWFLocOtherNetworkTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        os_log_type_t v31 = [v14 textLabel];
        [v31 setText:v30];

LABEL_37:
LABEL_38:

        goto LABEL_47;
      }
      os_log_type_t v32 = self->_infraNetworks;
LABEL_25:
      int v20 = [(NSArray *)v32 objectAtIndex:v10];
      uint64_t v33 = [(WFAirportViewController *)self _tableCellForNetwork:v20 tableView:v7 indexPath:v8];
LABEL_45:
      id v14 = (void *)v33;
      goto LABEL_46;
    case 4uLL:
      uint64_t v27 = 1160;
LABEL_24:
      os_log_type_t v32 = *(NSArray **)((char *)&self->super.super.super.super.super.isa + v27);
      goto LABEL_25;
    case 5uLL:
      id v29 = [(NSArray *)self->_unconfiguredNetworks objectAtIndex:v10];
      id v14 = [v7 dequeueReusableCellWithIdentifier:@"WFUnconfiguredNetworkCell" forIndexPath:v8];
      os_log_type_t v34 = [v29 title];
      uint64_t v35 = [v14 textLabel];
      [v35 setText:v34];

      [v14 setAccessoryType:1];
      goto LABEL_38;
    case 6uLL:
      id v14 = [v7 dequeueReusableCellWithIdentifier:@"kWFNetworkDataUsageCellIdentifier"];
      uint64_t v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v37 = v36;
      uint64_t v38 = @"kWFLocDataUsageTitle";
      goto LABEL_40;
    case 7uLL:
      id v14 = [v7 dequeueReusableCellWithIdentifier:@"kWFNetworkWAPICellIdentifier"];
      uint64_t v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v40 = [v39 localizedStringForKey:@"kWFLocEnableWAPITitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      uint64_t v41 = [v14 textLabel];
      [v41 setText:v40];

      uint64_t v42 = [v14 textLabel];
      [v42 setNumberOfLines:0];

      id v43 = objc_alloc(MEMORY[0x263F82C40]);
      int v20 = objc_msgSend(v43, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [v20 addTarget:self action:sel__enableWAPISwitchChanged_ forControlEvents:4096];
      if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v26 = [v11 networkListViewControllerWAPIEnabled:self];
        uint64_t v25 = v20;
LABEL_31:
        [v25 setOn:v26];
      }
      goto LABEL_32;
    case 8uLL:
      id v14 = [v7 dequeueReusableCellWithIdentifier:@"WFAskToJoinCell"];
      if (!v14) {
        id v14 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFAskToJoinCell"];
      }
      uint64_t v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v45 = [v44 localizedStringForKey:@"kWFLocAskToJoinTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      os_log_type_t v46 = [v14 textLabel];
      [v46 setText:v45];

      [v14 setAccessoryType:1];
      id v29 = [(WFAirportViewController *)self _askToJoinStateStringForATJMode:[(WFAirportViewController *)self _askToJoinMode]];
      uint64_t v30 = [v14 detailTextLabel];
      [v30 setText:v29];
      goto LABEL_37;
    case 9uLL:
      id v14 = [v7 dequeueReusableCellWithIdentifier:@"WFNetworkKnownNetworksCellIdentifier"];
      uint64_t v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v37 = v36;
      uint64_t v38 = @"kWFLocKnownNetworksTitle";
LABEL_40:
      os_log_type_t v47 = [v36 localizedStringForKey:v38 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      id v48 = [v14 textLabel];
      [v48 setText:v47];

      [v14 setAccessoryType:1];
      goto LABEL_47;
    case 0xAuLL:
      id v14 = [v7 dequeueReusableCellWithIdentifier:@"WFAutoInstantHotspotCell"];
      if (!v14) {
        id v14 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFAutoInstantHotspotCell"];
      }
      os_log_type_t v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v50 = [v49 localizedStringForKey:@"kWFLocAutoInstantHotspotTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      uint64_t v51 = [v14 textLabel];
      [v51 setText:v50];

      [v14 setAccessoryType:1];
      uint64_t v52 = [v11 networkListViewControllerAutoInstantHotspotOption:self];
      uint64_t v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v54 = [(WFAirportViewController *)self _getAutoHotspotOptionText:v52];
      int v55 = [v53 localizedStringForKey:v54 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      uint64_t v56 = [v14 detailTextLabel];
      [v56 setText:v55];

      goto LABEL_47;
    case 0xBuLL:
      int v20 = [(NSMutableArray *)self->_editableKnownNetworks objectAtIndex:v10];
      uint64_t v33 = [(WFAirportViewController *)self _tableCellForKnownNetwork:v20 tableView:v7 indexPath:v8 extraLeadingPadding:0];
      goto LABEL_45;
    case 0xCuLL:
      uint64_t v58 = [(WFAirportViewController *)self managedKnownNetworks];
      char v59 = [v58 objectAtIndex:v10];

      id v14 = [(WFAirportViewController *)self _tableCellForKnownNetwork:v59 tableView:v7 indexPath:v8 extraLeadingPadding:1];
LABEL_51:

      goto LABEL_47;
    default:
      id v14 = 0;
      goto LABEL_47;
  }
}

- (id)_tableCellForKnownNetwork:(id)a3 tableView:(id)a4 indexPath:(id)a5 extraLeadingPadding:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  if (v6) {
    uint64_t v11 = @"kWFNetworkProfileNetworksListCellIdentifier";
  }
  else {
    uint64_t v11 = @"kWFNetworkEditableNetworksListCellIdentifier";
  }
  id v12 = [a4 dequeueReusableCellWithIdentifier:v11 forIndexPath:v10];
  int v13 = v12;
  if (!v12)
  {
    uint64_t v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18)) {
      goto LABEL_19;
    }
    int v24 = 138543618;
    id v25 = v10;
    __int16 v26 = 2114;
    id v27 = v9;
    id v19 = "Unable to create cell at indexPath %{public}@ for network %{public}@";
    int v20 = v17;
    os_log_type_t v21 = v18;
    uint32_t v22 = 22;
    goto LABEL_18;
  }
  if (v9)
  {
    [v12 setHasLeadingPadding:v6];
    id v14 = [v9 title];
    [v13 setNetworkName:v14];

    objc_msgSend(v13, "setShowLock:", objc_msgSend(v9, "isSecure"));
    [v13 setAccessoryType:4];
    [v13 setEditingAccessoryType:4];
    id v15 = v13;
    goto LABEL_7;
  }
  uint64_t v17 = WFLogForCategory(0);
  os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v23))
  {
    int v24 = 138543362;
    id v25 = v10;
    id v19 = "nil network for indexPath %{public}@";
    int v20 = v17;
    os_log_type_t v21 = v23;
    uint32_t v22 = 12;
LABEL_18:
    _os_log_impl(&dword_2257EC000, v20, v21, v19, (uint8_t *)&v24, v22);
  }
LABEL_19:

  id v15 = 0;
LABEL_7:

  return v15;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", objc_msgSend(a4, "section", a3))- 13 < 0xFFFFFFFFFFFFFFFELL;
}

- (id)_tableCellForNetwork:(id)a3 tableView:(id)a4 indexPath:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  if ([v7 isInstantHotspot])
  {
    id v10 = [v9 dequeueReusableCellWithIdentifier:@"WFHotspotCell" forIndexPath:v8];

    if (v10)
    {
      if (v7)
      {
        uint64_t v11 = [v7 title];
        [v10 setTitle:v11];

        id v12 = [v10 hotspotDetails];

        if (!v12)
        {
          int v13 = objc_alloc_init(WFHotspotDetails);
          id v14 = [v7 hotspotBatteryLife];
          [(WFHotspotDetails *)v13 setBatteryLife:v14];

          id v15 = [v7 hotspotCellularProtocol];
          [(WFHotspotDetails *)v13 setCellularProtocolString:v15];

          uint64_t v16 = [v7 hotspotSignalStrength];
          [(WFHotspotDetails *)v13 setSignalStrength:v16];

          [v10 setHotspotDetails:v13];
        }
        uint64_t v17 = v10;
        uint64_t v18 = 0;
        goto LABEL_10;
      }
      os_log_type_t v23 = WFLogForCategory(0);
      os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v29))
      {
        int v30 = 138543362;
        id v31 = v8;
        id v25 = "nil network for indexPath %{public}@";
LABEL_30:
        __int16 v26 = v23;
        os_log_type_t v27 = v29;
        uint32_t v28 = 12;
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    os_log_type_t v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24)) {
      goto LABEL_32;
    }
LABEL_21:
    int v30 = 138543618;
    id v31 = v8;
    __int16 v32 = 2114;
    id v33 = v7;
    id v25 = "Unable to create cell at indexPath %{public}@ for network %{public}@";
    __int16 v26 = v23;
    os_log_type_t v27 = v24;
    uint32_t v28 = 22;
LABEL_31:
    _os_log_impl(&dword_2257EC000, v26, v27, v25, (uint8_t *)&v30, v28);
    goto LABEL_32;
  }
  id v10 = [v9 dequeueReusableCellWithIdentifier:@"WFNetworkCell" forIndexPath:v8];

  if (!v10)
  {
    os_log_type_t v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24)) {
      goto LABEL_32;
    }
    goto LABEL_21;
  }
  if (v7)
  {
    id v19 = [v7 title];
    [v10 setTitle:v19];

    int v20 = [v7 subtitle];
    [v10 setSubtitle:v20];

    objc_msgSend(v10, "setSecure:", objc_msgSend(v7, "isSecure"));
    [v7 scaledRSSI];
    [v10 setBars:WFSignalBarsFromScaledRSSI(v21)];
    objc_msgSend(v10, "setPersonalHotspot:", objc_msgSend(v7, "iOSHotspot"));
    uint64_t v17 = v10;
    uint64_t v18 = 4;
LABEL_10:
    [v17 setAccessoryType:v18];
    objc_msgSend(v10, "setSeparatorInset:", 0.0, 40.0, 0.0, 0.0);
    goto LABEL_11;
  }
  os_log_type_t v23 = WFLogForCategory(0);
  os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v29))
  {
    int v30 = 138543362;
    id v31 = v8;
    id v25 = "nil network for indexPath %{public}@";
    goto LABEL_30;
  }
LABEL_32:

  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5 = [(WFAirportViewController *)self _sectionTypeAtSection:a4];
  if (v5 == 10)
  {
    BOOL v7 = [(WFAirportViewController *)self _isChinaDevice];
    id v8 = @"kWFLocAutoInstantHotspotFooter";
    if (v7) {
      id v8 = @"kWFLocAutoInstantHotspotFooterCH";
    }
    id v9 = (void *)MEMORY[0x263F086E0];
    id v10 = v8;
    uint64_t v11 = [v9 bundleForClass:objc_opt_class()];
    BOOL v6 = [v11 localizedStringForKey:v10 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  else
  {
    if (v5 != 8)
    {
      if (v5)
      {
LABEL_6:
        BOOL v6 = 0;
        goto LABEL_16;
      }
      if ([(WFAirportViewController *)self powered])
      {
        if ([(WFAirportViewController *)self userAutoJoinEnabled]) {
          goto LABEL_6;
        }
        uint64_t v13 = [(WFAirportViewController *)self userAutoJoinDisabledWarning];
      }
      else
      {
        uint64_t v13 = [(WFAirportViewController *)self powerOffLocationWarning];
      }
      goto LABEL_15;
    }
    BOOL v12 = [(WFAirportViewController *)self _askToJoinShouldBeVisible];
    BOOL v6 = 0;
    if ([(WFAirportViewController *)self userAutoJoinEnabled] && v12)
    {
      uint64_t v13 = [(WFAirportViewController *)self _askToJoinFooterString];
LABEL_15:
      BOOL v6 = (void *)v13;
    }
  }
LABEL_16:
  return v6;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int64_t v4 = 0;
  switch([(WFAirportViewController *)self _sectionTypeAtSection:a3])
  {
    case 1uLL:
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      unint64_t v5 = self->_knownNetworks;
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v21;
        int v9 = 1;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v5);
            }
            v9 &= objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "isInstantHotspot", (void)v20);
          }
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v7);

        if ((v9 & 1) == 0)
        {
          uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          BOOL v12 = v11;
          uint64_t v13 = @"kWFLocMyNetworksSectionTitle";
          goto LABEL_26;
        }
      }
      else
      {
      }
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v12 = v11;
      uint64_t v13 = @"kWFLocHotspotsSectionTitle";
      goto LABEL_26;
    case 2uLL:
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v12 = v11;
      uint64_t v13 = @"kWFLocPublicSectionTitle";
      goto LABEL_26;
    case 3uLL:
      id v14 = [(WFAirportViewController *)self sections];
      uint64_t v15 = [v14 indexOfObject:&unk_26D911B48];

      uint64_t v16 = [(WFAirportViewController *)self sections];
      uint64_t v17 = [v16 indexOfObject:&unk_26D911B30];

      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v12 = v11;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL && v17 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v13 = @"kWFLocChooseNetworkSectionSingleTitle";
      }
      else {
        uint64_t v13 = @"kWFLocChooseNetworkSectionTitle";
      }
      goto LABEL_26;
    case 4uLL:
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v12 = v11;
      uint64_t v13 = @"kWFLocAdhocSectionTitle";
      goto LABEL_26;
    case 5uLL:
      uint64_t v18 = [(WFAirportViewController *)self listDelegate];
      if (v18 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        int64_t v4 = [v18 airportSettingsViewController:self unconfiguredAccessoriesGroupHeaderTitle:self->_unconfiguredNetworks];
      }
      else
      {
        int64_t v4 = 0;
      }

      break;
    case 11uLL:
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v12 = v11;
      uint64_t v13 = @"kWFLocAllEditableKnownSectionTitle";
      goto LABEL_26;
    case 12uLL:
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v12 = v11;
      uint64_t v13 = @"kFWLocAllProfileKnownSectionTitle";
LABEL_26:
      int64_t v4 = objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_26D8F6070, @"WiFiKitUILocalizableStrings", (void)v20);

      break;
    default:
      break;
  }
  return v4;
}

- (id)headerIdentifierForSectionType:(unint64_t)a3
{
  if (a3 - 1 > 0xB) {
    return 0;
  }
  else {
    return off_2647564F0[a3 - 1];
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(WFAirportViewController *)self _sectionTypeAtSection:a4];
  uint64_t v8 = [(WFAirportViewController *)self headerIdentifierForSectionType:v7];
  if (v8)
  {
    int v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v8];
  }
  else
  {
    int v9 = 0;
  }
  if (v7 == 3) {
    [(WFAirportViewController *)self setChooseNetworkHeader:v9];
  }
  id v10 = [(WFAirportViewController *)self titleForHeaderInSection:a4];
  if (v10) {
    [v9 setTitle:v10];
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 || (double v7 = 0.0, [(WFAirportViewController *)self isInEditingMode]))
  {
    v16[0] = *MEMORY[0x263F81500];
    uint64_t v8 = [MEMORY[0x263F825C8] systemBlueColor];
    v17[0] = v8;
    v16[1] = *MEMORY[0x263F814F0];
    int v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    v17[1] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

    uint64_t v11 = [(WFAirportViewController *)self titleForHeaderInSection:a4];
    [v11 sizeWithAttributes:v10];
    double v13 = v12;
    [@"A" sizeWithAttributes:v10];
    double v7 = ceil(v13 + v14 * 2.0);
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (char *)a4;
  double v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v115 = 2112;
    uint64_t v116 = v6;
    _os_log_impl(&dword_2257EC000, v7, v8, "%s: indexPath %@", buf, 0x16u);
  }
  uint64_t v105 = v5;
  uint64_t v106 = v6;

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  int v9 = self;
  id obj = [(WFAirportViewController *)self sections];
  uint64_t v10 = [obj countByEnumeratingWithState:&v109 objects:v119 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v110;
    double v13 = &stru_26D8F6070;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v13;
      do
      {
        if (*(void *)v110 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v109 + 1) + 8 * v14);
        uint64_t v17 = NSString;
        uint64_t v18 = -[WFAirportViewController _nameOfSection:](v9, "_nameOfSection:", (int)[v16 intValue]);
        id v19 = [(WFAirportViewController *)v9 tableView];
        long long v20 = [(WFAirportViewController *)v9 sections];
        long long v21 = [v17 stringWithFormat:@"section: %@ has %ld items", v18, objc_msgSend(v19, "numberOfRowsInSection:", objc_msgSend(v20, "indexOfObject:", v16))];
        double v13 = [(__CFString *)v15 stringByAppendingString:v21];

        int v9 = self;
        ++v14;
        uint64_t v15 = v13;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v109 objects:v119 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = &stru_26D8F6070;
  }

  long long v22 = WFLogForCategory(0);
  os_log_type_t v23 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v22 && os_log_type_enabled(v22, v23))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v114 = (const char *)v13;
    _os_log_impl(&dword_2257EC000, v22, v23, "%@", buf, 0xCu);
  }

  os_log_type_t v24 = v106;
  unint64_t v25 = [v106 row];
  __int16 v26 = [(WFAirportViewController *)v9 joiningHotspot];
  os_log_type_t v27 = [(WFAirportViewController *)v9 listDelegate];
  if (v26)
  {
    uint32_t v28 = WFLogForCategory(0);
    os_log_type_t v29 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v28 && os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v115 = 2112;
      uint64_t v116 = v26;
      _os_log_impl(&dword_2257EC000, v28, v29, "%s: hotspot joining in progress %@", buf, 0x16u);
    }

    int v30 = [(WFAirportViewController *)v9 knownNetworks];
    uint64_t v31 = [v30 indexOfObject:v26];

    __int16 v32 = [(WFAirportViewController *)v9 sections];
    uint64_t v33 = [v32 indexOfObject:&unk_26D911B48];

    if (v31 == 0x7FFFFFFFFFFFFFFFLL || v33 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_39:
        [(WFAirportViewController *)v9 setJoiningHotspot:0];
        goto LABEL_40;
      }
      uint64_t v35 = WFLogForCategory(0);
      os_log_type_t v38 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v35)
      {
        uint64_t v35 = v35;
        if (os_log_type_enabled(v35, v38))
        {
          uint64_t v39 = [(WFAirportViewController *)v9 knownNetworks];
          *(_DWORD *)buf = 138543618;
          uint64_t v114 = v26;
          __int16 v115 = 2114;
          uint64_t v116 = v39;
          _os_log_impl(&dword_2257EC000, v35, v38, "Joining hotspot %{public}@ can't be found in set %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v34 = [MEMORY[0x263F088C8] indexPathForRow:v31 inSection:v33];
      uint64_t v35 = [v105 cellForRowAtIndexPath:v34];

      uint64_t v36 = WFLogForCategory(0);
      os_log_type_t v37 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v36 && os_log_type_enabled(v36, v37))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        __int16 v115 = 2112;
        uint64_t v116 = (char *)v35;
        _os_log_impl(&dword_2257EC000, v36, v37, "%s: updating state for cell %@", buf, 0x16u);
      }

      if (v35) {
        [v35 setState:0];
      }
      os_log_type_t v24 = v106;
    }

    goto LABEL_39;
  }
LABEL_40:
  switch(-[WFAirportViewController _sectionTypeAtSection:](v9, "_sectionTypeAtSection:", [v24 section]))
  {
    case 0uLL:
      if ([(WFAirportViewController *)v9 showDiagnosticsCell])
      {
        uint64_t v40 = [v24 row];
        if (v40 == [(WFAirportViewController *)v9 rowCountWithPlacardCell:1])
        {
          objc_msgSend(v27, "airportSettingsViewControllerDidTapDiagnosticsMode:showNANUI:", v9, -[WFAirportViewController showNANUI](v9, "showNANUI"));
          goto LABEL_112;
        }
      }
      uint64_t v80 = [(WFAirportViewController *)v9 currentNetwork];
      if (!v80) {
        goto LABEL_112;
      }
      long long v81 = (void *)v80;
      uint64_t v82 = [v24 row];
      if (v82 == [(WFAirportViewController *)v9 rowCountWithPlacardCell:1])
      {
      }
      else
      {
        uint64_t v97 = [v24 row];
        uint64_t v98 = [(WFAirportViewController *)v9 rowCountWithPlacardCell:2];

        BOOL v99 = v97 == v98;
        int v9 = self;
        if (!v99) {
          goto LABEL_112;
        }
      }
      uint64_t v100 = WFLogForCategory(0);
      os_log_type_t v101 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v100)
      {
        os_log_type_t v102 = v100;
        if (os_log_type_enabled(v102, v101))
        {
          v103 = [(WFAirportViewController *)v9 currentNetwork];
          *(_DWORD *)buf = 136315394;
          uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
          __int16 v115 = 2112;
          uint64_t v116 = v103;
          _os_log_impl(&dword_2257EC000, v102, v101, "%s: tapped on current network %@", buf, 0x16u);
        }
      }

      BOOL v104 = [(WFAirportViewController *)v9 currentNetwork];
      [v27 networkListViewController:v9 didTapRecord:v104];

LABEL_112:
      [v105 deselectRowAtIndexPath:v24 animated:1];

      return;
    case 1uLL:
      uint64_t v41 = [(WFAirportViewController *)v9 knownNetworks];
      uint64_t v42 = v9;
      unint64_t v43 = [v41 count];

      if (v25 >= v43)
      {
        uint64_t v58 = WFLogForCategory(0);
        os_log_type_t v83 = OSLogForWFLogLevel(1uLL);
        if (!WFCurrentLogLevel() || !v58) {
          goto LABEL_111;
        }
        v84 = v58;
        if (!os_log_type_enabled(v84, v83)) {
          goto LABEL_110;
        }
        uint64_t v85 = [v24 row];
        __int16 v86 = [(WFAirportViewController *)self knownNetworks];
        uint64_t v87 = [v86 count];
        *(_DWORD *)buf = 136315650;
        uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        __int16 v115 = 2050;
        uint64_t v116 = (char *)v85;
        __int16 v117 = 2050;
        uint64_t v118 = v87;
        __int16 v88 = "%s: cannot find known network at index %{public}lu networks %{public}lu";
        goto LABEL_109;
      }
      uint64_t v44 = [(WFAirportViewController *)v42 knownNetworks];
      uint64_t v45 = [v44 objectAtIndex:v25];

      os_log_type_t v46 = v42;
      if ([v45 isInstantHotspot])
      {
        os_log_type_t v47 = [(WFAirportViewController *)v42 knownNetworks];
        id v48 = [v47 objectAtIndex:v25];

        objc_storeWeak((id *)&self->_joiningHotspot, v48);
        os_log_type_t v49 = [v105 cellForRowAtIndexPath:v24];
        [v49 setState:1];

        os_log_type_t v46 = self;
      }
      id v50 = WFLogForCategory(0);
      os_log_type_t v51 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v50)
      {
        uint64_t v52 = v50;
        if (os_log_type_enabled(v52, v51))
        {
          int v53 = [v45 isInstantHotspot];
          *(_DWORD *)buf = 136315650;
          uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
          __int16 v115 = 2112;
          uint64_t v116 = (char *)v45;
          __int16 v117 = 1024;
          LODWORD(v118) = v53;
          _os_log_impl(&dword_2257EC000, v52, v51, "%s: tapped on known record %@ (hotspot %d)", buf, 0x1Cu);
        }

        os_log_type_t v24 = v106;
      }

      [v27 networkListViewController:v46 didTapRecord:v45];
      goto LABEL_112;
    case 2uLL:
      uint64_t v54 = [(WFAirportViewController *)v9 popularNetworks];
      int v55 = v9;
      unint64_t v56 = [v54 count];

      if (v25 < v56)
      {
        uint64_t v57 = [(WFAirportViewController *)v55 popularNetworks];
        uint64_t v58 = [v57 objectAtIndex:v25];

        char v59 = WFLogForCategory(0);
        os_log_type_t v60 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v59 && os_log_type_enabled(v59, v60))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
          __int16 v115 = 2112;
          uint64_t v116 = (char *)v58;
          uint64_t v61 = "%s: tapped on popular record %@";
          int v62 = v59;
          os_log_type_t v63 = v60;
          goto LABEL_102;
        }
        goto LABEL_103;
      }
      uint64_t v58 = WFLogForCategory(0);
      os_log_type_t v83 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v58) {
        goto LABEL_111;
      }
      v84 = v58;
      if (!os_log_type_enabled(v84, v83)) {
        goto LABEL_110;
      }
      uint64_t v89 = [v24 row];
      __int16 v86 = [(WFAirportViewController *)self popularNetworks];
      uint64_t v90 = [v86 count];
      *(_DWORD *)buf = 136315650;
      uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v115 = 2050;
      uint64_t v116 = (char *)v89;
      __int16 v117 = 2050;
      uint64_t v118 = v90;
      __int16 v88 = "%s: cannot find popular network at index %{public}lu networks %{public}lu";
      goto LABEL_109;
    case 3uLL:
      uint64_t v64 = [(WFAirportViewController *)v9 infraNetworks];
      int v55 = v9;
      uint64_t v65 = [v64 count];

      if (v25 == v65)
      {
        os_log_type_t v66 = WFLogForCategory(0);
        os_log_type_t v67 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v66 && os_log_type_enabled(v66, v67))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
          __int16 v115 = 2112;
          uint64_t v116 = v24;
          _os_log_impl(&dword_2257EC000, v66, v67, "%s: tapped other network cell %@", buf, 0x16u);
        }

        [v105 deselectRowAtIndexPath:v24 animated:1];
        [v27 networkListViewControllerDidTapOtherNetwork:self];
      }
      else
      {
        uint64_t v91 = [(WFAirportViewController *)v55 infraNetworks];
        unint64_t v92 = [v91 count];

        if (v25 >= v92)
        {
          uint64_t v58 = WFLogForCategory(0);
          os_log_type_t v83 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v58)
          {
            v84 = v58;
            if (os_log_type_enabled(v84, v83))
            {
              uint64_t v95 = [v24 row];
              __int16 v86 = [(WFAirportViewController *)self infraNetworks];
              uint64_t v96 = [v86 count];
              *(_DWORD *)buf = 136315650;
              uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
              __int16 v115 = 2050;
              uint64_t v116 = (char *)v95;
              __int16 v117 = 2050;
              uint64_t v118 = v96;
              __int16 v88 = "%s: cannot find infra network at index %{public}lu networks %{public}lu";
LABEL_109:
              _os_log_impl(&dword_2257EC000, v84, v83, v88, buf, 0x20u);
            }
LABEL_110:
          }
        }
        else
        {
          uint64_t v93 = [(WFAirportViewController *)v55 infraNetworks];
          uint64_t v58 = [v93 objectAtIndex:v25];

          char v59 = WFLogForCategory(0);
          os_log_type_t v94 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v59 && os_log_type_enabled(v59, v94))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
            __int16 v115 = 2112;
            uint64_t v116 = (char *)v58;
            uint64_t v61 = "%s: tapped on infra record %@";
            int v62 = v59;
            os_log_type_t v63 = v94;
LABEL_102:
            _os_log_impl(&dword_2257EC000, v62, v63, v61, buf, 0x16u);
          }
LABEL_103:

          long long v74 = v27;
          long long v75 = v55;
LABEL_104:
          [v74 networkListViewController:v75 didTapRecord:v58];
        }
LABEL_111:
      }
      goto LABEL_112;
    case 4uLL:
      uint64_t v68 = [(WFAirportViewController *)v9 adhocNetworks];
      uint64_t v58 = [v68 objectAtIndex:v25];

      uint64_t v69 = WFLogForCategory(0);
      os_log_type_t v70 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v69 && os_log_type_enabled(v69, v70))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        __int16 v115 = 2112;
        uint64_t v116 = (char *)v58;
        _os_log_impl(&dword_2257EC000, v69, v70, "%s: tapped on adhoc record %@", buf, 0x16u);
      }

      [(WFAirportViewController *)v9 _promptToJoinAdhoc:v58];
      goto LABEL_111;
    case 5uLL:
      id v71 = [(WFAirportViewController *)v9 unconfiguredNetworks];
      uint64_t v58 = [v71 objectAtIndex:v25];

      long long v72 = WFLogForCategory(0);
      os_log_type_t v73 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v72 && os_log_type_enabled(v72, v73))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        __int16 v115 = 2112;
        uint64_t v116 = (char *)v58;
        _os_log_impl(&dword_2257EC000, v72, v73, "%s: tapped on unconfigured record %@", buf, 0x16u);
      }

      long long v74 = v27;
      long long v75 = v9;
      goto LABEL_104;
    case 6uLL:
      [v27 airportSettingsViewControllerDidTapDataUsage:v9];
      goto LABEL_112;
    case 8uLL:
      long long v76 = WFLogForCategory(0);
      os_log_type_t v77 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v76 && os_log_type_enabled(v76, v77))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        _os_log_impl(&dword_2257EC000, v76, v77, "%s: tapped on ask to join row", buf, 0xCu);
      }

      [(WFAirportViewController *)v9 _pushAskToJoinModeSelectionViewController];
      goto LABEL_112;
    case 9uLL:
      [v27 airportSettingsViewControllerDidTapKnownNetworks:v9];
      goto LABEL_112;
    case 10uLL:
      __int16 v78 = WFLogForCategory(0);
      os_log_type_t v79 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v78 && os_log_type_enabled(v78, v79))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        _os_log_impl(&dword_2257EC000, v78, v79, "%s: tapped on auto hotspot row", buf, 0xCu);
      }

      [(WFAirportViewController *)v9 _pushAutoInstantHotspotOptionSelectionViewController];
      goto LABEL_112;
    default:
      goto LABEL_112;
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(WFAirportViewController *)self sections];
  uint64_t v7 = [v6 indexOfObject:&unk_26D911BC0];

  uint64_t v8 = [v5 section];
  return v8 == v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t v8 = [(WFAirportViewController *)self networksToBeDeleted];
  uint64_t v9 = [v8 count];
  uint64_t v10 = (void *)MEMORY[0x263EFF980];
  if (v9)
  {
    uint64_t v11 = [(WFAirportViewController *)self networksToBeDeleted];
    uint64_t v12 = [v10 arrayWithArray:v11];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }

  if (a4 == 1)
  {
    uint64_t v13 = [v7 section];
    uint64_t v14 = [(WFAirportViewController *)self sections];
    uint64_t v15 = [v14 indexOfObject:&unk_26D911BC0];

    if (v13 == v15)
    {
      uint64_t v16 = -[NSMutableArray objectAtIndex:](self->_editableKnownNetworks, "objectAtIndex:", [v7 row]);
      [v12 addObject:v16];

      -[NSMutableArray removeObjectAtIndex:](self->_editableKnownNetworks, "removeObjectAtIndex:", [v7 row]);
      uint64_t v17 = [(WFAirportViewController *)self tableView];
      v19[0] = v7;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      [v17 deleteRowsAtIndexPaths:v18 withRowAnimation:0];
    }
    [(WFAirportViewController *)self setNetworksToBeDeleted:v12];
    [(WFAirportViewController *)self _updateKnownNetworksDoneButtonForEditability];
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a4;
  unint64_t v6 = -[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", [v5 section]);
  unint64_t v7 = [v5 row];
  switch(v6)
  {
    case 0uLL:
      uint64_t v8 = [(WFAirportViewController *)self currentNetwork];
      goto LABEL_16;
    case 1uLL:
      uint64_t v9 = [(WFAirportViewController *)self knownNetworks];
      unint64_t v10 = [v9 count];

      if (v7 >= v10) {
        goto LABEL_25;
      }
      uint64_t v11 = [(WFAirportViewController *)self knownNetworks];
      break;
    case 2uLL:
      uint64_t v14 = [(WFAirportViewController *)self popularNetworks];
      unint64_t v15 = [v14 count];

      if (v7 >= v15) {
        goto LABEL_25;
      }
      uint64_t v11 = [(WFAirportViewController *)self popularNetworks];
      break;
    case 3uLL:
      uint64_t v16 = [(WFAirportViewController *)self infraNetworks];
      unint64_t v17 = [v16 count];

      if (v7 >= v17) {
        goto LABEL_25;
      }
      uint64_t v11 = [(WFAirportViewController *)self infraNetworks];
      break;
    case 4uLL:
      uint64_t v18 = [(WFAirportViewController *)self adhocNetworks];
      unint64_t v19 = [v18 count];

      if (v7 >= v19) {
        goto LABEL_25;
      }
      uint64_t v11 = [(WFAirportViewController *)self adhocNetworks];
      break;
    case 0xBuLL:
      uint64_t v12 = [(WFAirportViewController *)self editableKnownNetworks];
      unint64_t v13 = [v12 count];

      if (v7 >= v13) {
        goto LABEL_25;
      }
      uint64_t v11 = [(WFAirportViewController *)self editableKnownNetworks];
      break;
    case 0xCuLL:
      long long v20 = [(WFAirportViewController *)self managedKnownNetworks];
      unint64_t v21 = [v20 count];

      if (v7 >= v21) {
        goto LABEL_25;
      }
      uint64_t v11 = [(WFAirportViewController *)self managedKnownNetworks];
      break;
    default:
      goto LABEL_25;
  }
  long long v22 = v11;
  uint64_t v8 = [v11 objectAtIndex:v7];

LABEL_16:
  if (v6 - 11 >= 2) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = 2;
  }
  if (v8)
  {
    os_log_type_t v24 = WFLogForCategory(0);
    os_log_type_t v25 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v24 && os_log_type_enabled(v24, v25))
    {
      int v28 = 136315906;
      os_log_type_t v29 = "-[WFAirportViewController tableView:accessoryButtonTappedForRowWithIndexPath:]";
      __int16 v30 = 2112;
      uint64_t v31 = v8;
      __int16 v32 = 2112;
      id v33 = v5;
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      _os_log_impl(&dword_2257EC000, v24, v25, "%s: tapped on accessory for record %@ at indexPath %@, context: %ld", (uint8_t *)&v28, 0x2Au);
    }

    __int16 v26 = [(WFAirportViewController *)self listDelegate];
    [v26 networkListViewController:self showSettingsForNetwork:v8 context:v23];
  }
  else
  {
LABEL_25:
    uint64_t v8 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v27))
    {
      int v28 = 138543362;
      os_log_type_t v29 = (const char *)v5;
      _os_log_impl(&dword_2257EC000, v8, v27, "Accessory button tapped nil record at indexPath %{public}@", (uint8_t *)&v28, 0xCu);
    }
  }
}

- (void)_promptToJoinAdhoc:(id)a3
{
  id v4 = a3;
  id v5 = NSString;
  unint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v7 = [v6 localizedStringForKey:@"kWFLocAdhocJoinTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  uint64_t v8 = [v4 title];
  uint64_t v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8);

  unint64_t v10 = (void *)MEMORY[0x263F82418];
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"kWFLocAdhocJoinBody" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  unint64_t v13 = [v10 alertControllerWithTitle:v9 message:v12 preferredStyle:1];

  uint64_t v14 = (void *)MEMORY[0x263F82400];
  unint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"kWFLocAdhocJoinConfirmButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__WFAirportViewController__promptToJoinAdhoc___block_invoke;
  v23[3] = &unk_264756370;
  v23[4] = self;
  id v24 = v4;
  id v17 = v4;
  uint64_t v18 = [v14 actionWithTitle:v16 style:0 handler:v23];
  [v13 addAction:v18];

  unint64_t v19 = (void *)MEMORY[0x263F82400];
  long long v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v21 = [v20 localizedStringForKey:@"kWFLocAdhocJoinCancelButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  long long v22 = [v19 actionWithTitle:v21 style:1 handler:0];
  [v13 addAction:v22];

  [(WFAirportViewController *)self presentViewController:v13 animated:1 completion:0];
}

void __46__WFAirportViewController__promptToJoinAdhoc___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) listDelegate];
  [v2 networkListViewController:*(void *)(a1 + 32) didTapRecord:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) tableView];
  id v3 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  [v4 scrollToRowAtIndexPath:v3 atScrollPosition:1 animated:1];
}

- (id)_defaultSectionsForPowerState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &unk_26D911B78, &unk_26D911B60, 0);
  if ([(WFAirportViewController *)self _isChinaDevice])
  {
    if ([(WFAirportViewController *)self deviceCapability] == 3) {
      [v5 addObjectsFromArray:&unk_26D912190];
    }
    if ([(WFAirportViewController *)self deviceCapability] != 4) {
      [v5 addObjectsFromArray:&unk_26D9121A8];
    }
  }
  if ([(WFAirportViewController *)self _askToJoinShouldBeVisible])
  {
    [v5 addObject:&unk_26D911B90];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }
  self->_int askToJoinShown = v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  char v8 = [WeakRetained networkListViewControllerNetworkRestrictionActive:self];

  if ((v8 & 1) == 0) {
    [v5 addObject:&unk_26D911BA8];
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &unk_26D911B78, 0);
  if ([(WFAirportViewController *)self _isChinaDevice])
  {
    if ([(WFAirportViewController *)self deviceCapability] == 3) {
      [v9 addObjectsFromArray:&unk_26D9121C0];
    }
    if ([(WFAirportViewController *)self deviceCapability] != 4) {
      [v9 addObjectsFromArray:&unk_26D9121D8];
    }
  }
  if (v3) {
    unint64_t v10 = v5;
  }
  else {
    unint64_t v10 = v9;
  }
  uint64_t v11 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v10];

  return v11;
}

- (unint64_t)_sectionTypeAtSection:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(WFAirportViewController *)self sections];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    uint64_t v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v11 && os_log_type_enabled(v11, v12))
    {
      int v13 = 136315394;
      uint64_t v14 = "-[WFAirportViewController _sectionTypeAtSection:]";
      __int16 v15 = 1024;
      int v16 = a3;
      _os_log_impl(&dword_2257EC000, v11, v12, "%s: invalid section index %d", (uint8_t *)&v13, 0x12u);
    }

    [(WFAirportViewController *)self _dumpSections];
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = [(WFAirportViewController *)self sections];
    char v8 = [v7 objectAtIndex:a3];
    unint64_t v9 = [v8 integerValue];

    return v9;
  }
}

- (void)_powerSwitchChanged:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v4 = [a3 isOn];
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    unint64_t v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      char v8 = WFPowerStateToggleToString(v4);
      int v10 = 136315394;
      uint64_t v11 = "-[WFAirportViewController _powerSwitchChanged:]";
      __int16 v12 = 2112;
      int v13 = v8;
      _os_log_impl(&dword_2257EC000, v7, v6, "%s: user toggled power to %@", (uint8_t *)&v10, 0x16u);
    }
  }

  unint64_t v9 = [(WFAirportViewController *)self listDelegate];
  if (objc_opt_respondsToSelector()) {
    [v9 networkListViewController:self userDidChangePowerToggle:v4];
  }
}

- (void)_updateAskToJoinMode:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v12 = 136315394;
    int v13 = "-[WFAirportViewController _updateAskToJoinMode:]";
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: ask to join state changed %d", (uint8_t *)&v12, 0x12u);
  }

  unint64_t v7 = [(WFAirportViewController *)self listDelegate];
  [v7 airportSettingsViewController:self setAskToJoinMode:a3];

  char v8 = [(WFAirportViewController *)self sections];
  uint64_t v9 = [v8 indexOfObject:&unk_26D911B90];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v10 = [(WFAirportViewController *)self tableView];
    uint64_t v11 = [MEMORY[0x263F088D0] indexSetWithIndex:v9];
    [v10 _reloadSectionHeaderFooters:v11 withRowAnimation:100];
  }
}

- (void)_enableWAPISwitchChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    unint64_t v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      int v9 = 136315394;
      int v10 = "-[WFAirportViewController _enableWAPISwitchChanged:]";
      __int16 v11 = 1024;
      int v12 = [v4 isOn];
      _os_log_impl(&dword_2257EC000, v7, v6, "%s: wapi state changed %d", (uint8_t *)&v9, 0x12u);
    }
  }
  char v8 = [(WFAirportViewController *)self listDelegate];
  objc_msgSend(v8, "networkListViewController:setWAPIEnabled:", self, objc_msgSend(v4, "isOn"));
}

- (id)_sectionNameAtIndex:(unint64_t)a3
{
  id v5 = [(WFAirportViewController *)self sections];
  os_log_type_t v6 = [v5 objectAtIndexedSubscript:a3];

  if (v6)
  {
    -[WFAirportViewController _nameOfSection:](self, "_nameOfSection:", [v6 unsignedIntegerValue]);
    unint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v7 = @"Unknown section";
  }

  return v7;
}

- (id)_nameOfSection:(unint64_t)a3
{
  if (a3 > 0xC) {
    return @"<unknown>";
  }
  else {
    return off_264756550[a3];
  }
}

- (void)_dumpSections
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(WFAirportViewController *)self sections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        char v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v9 = WFLogForCategory(0);
        os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v9)
        {
          __int16 v11 = v9;
          if (os_log_type_enabled(v11, v10))
          {
            int v12 = -[WFAirportViewController _nameOfSection:](self, "_nameOfSection:", [v8 integerValue]);
            *(_DWORD *)buf = 134218242;
            uint64_t v19 = v5 + i;
            __int16 v20 = 2114;
            unint64_t v21 = v12;
            _os_log_impl(&dword_2257EC000, v11, v10, "%lu- %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
      v5 += i;
    }
    while (v4);
  }
}

- (BOOL)_isChinaDevice
{
  uint64_t v2 = [(WFAirportViewController *)self deviceCapability];
  return WFCapabilityIsChinaDevice(v2);
}

- (void)_pushAutoInstantHotspotOptionSelectionViewController
{
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"kWFLocAutoInstantHotspotJoinNeverTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v7 = [v6 localizedStringForKey:@"kWFLocAutoInstantHotspotJoinAskTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v9 = [v8 localizedStringForKey:@"kWFLocAutoInstantHotspotJoinAutoTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  os_log_type_t v10 = objc_msgSend(v3, "arrayWithObjects:", v5, v7, v9, 0);

  __int16 v11 = [[WFValueListViewController alloc] initWithTitles:v10 switchTitle:0];
  int v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"kWFLocAutoInstantHotspotTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  long long v14 = [(WFValueListViewController *)v11 navigationItem];
  [v14 setTitle:v13];

  long long v15 = [(WFAirportViewController *)self listDelegate];
  long long v16 = -[WFAirportViewController _getAutoHotspotOptionText:](self, "_getAutoHotspotOptionText:", [v15 networkListViewControllerAutoInstantHotspotOption:self]);
  [(WFValueListViewController *)v11 setSelectedTitle:v16];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__WFAirportViewController__pushAutoInstantHotspotOptionSelectionViewController__block_invoke;
  v18[3] = &unk_264756398;
  v18[4] = self;
  [(WFValueListViewController *)v11 setCompletionHandler:v18];
  long long v17 = [(WFAirportViewController *)self navigationController];
  [v17 pushViewController:v11 animated:1];
}

void __79__WFAirportViewController__pushAutoInstantHotspotOptionSelectionViewController__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"kWFLocAutoInstantHotspotJoinAutoTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v5 = [v13 isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = 2;
  }
  else
  {
    unint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v8 = [v7 localizedStringForKey:@"kWFLocAutoInstantHotspotJoinAskTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    char v9 = [v13 isEqualToString:v8];

    if (v9)
    {
      uint64_t v6 = 1;
    }
    else
    {
      os_log_type_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      __int16 v11 = [v10 localizedStringForKey:@"kWFLocAutoInstantHotspotJoinNeverTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      int v12 = [v13 isEqualToString:v11];

      if (!v12) {
        goto LABEL_8;
      }
      uint64_t v6 = 0;
    }
  }
  [*(id *)(a1 + 32) updateAutoInstantHotspotSetting:v6];
LABEL_8:
}

- (void)_pushAskToJoinModeSelectionViewController
{
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"kWFLocAskToJoinDetailOff" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v7 = [v6 localizedStringForKey:@"kWFLocAskToJoinDetailNotify" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v9 = [v8 localizedStringForKey:@"kWFLocAskToJoinDetailAsk" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  os_log_type_t v10 = objc_msgSend(v3, "arrayWithObjects:", v5, v7, v9, 0);

  __int16 v11 = [[WFValueListViewController alloc] initWithTitles:v10 switchTitle:0];
  int v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"kWFLocAskToJoinTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  long long v14 = [(WFValueListViewController *)v11 navigationItem];
  [v14 setTitle:v13];

  long long v15 = [(WFAirportViewController *)self _askToJoinStateStringForATJMode:[(WFAirportViewController *)self _askToJoinMode]];
  [(WFValueListViewController *)v11 setSelectedTitle:v15];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__WFAirportViewController__pushAskToJoinModeSelectionViewController__block_invoke;
  v18[3] = &unk_264756398;
  v18[4] = self;
  [(WFValueListViewController *)v11 setCompletionHandler:v18];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__WFAirportViewController__pushAskToJoinModeSelectionViewController__block_invoke_2;
  void v17[3] = &unk_2647563C0;
  v17[4] = self;
  [(WFValueListViewController *)v11 setFooterHandler:v17];
  long long v16 = [(WFAirportViewController *)self navigationController];
  [v16 pushViewController:v11 animated:1];
}

uint64_t __68__WFAirportViewController__pushAskToJoinModeSelectionViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 _askToJoinModeFromString:a2];
  return [v2 _updateAskToJoinMode:v3];
}

uint64_t __68__WFAirportViewController__pushAskToJoinModeSelectionViewController__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 _askToJoinModeFromString:a2];
  return [v2 _askToJoinFooterStringForMode:v3];
}

- (void)_updateNetworkRestrictionHeader
{
  id v25 = [(WFAirportViewController *)self listDelegate];
  if (([v25 networkListViewControllerNetworkRestrictionActive:self] & 1) != 0
    || ([(WFAirportViewController *)self tableView],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 tableHeaderView],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    if ([v25 networkListViewControllerNetworkRestrictionActive:self]
      && ![(WFAirportViewController *)self isInEditingMode])
    {
      uint64_t v6 = [(WFAirportViewController *)self tableView];
      [v6 bounds];
      double v8 = v7;

      char v5 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, v8, 0.0);
      char v9 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 0.0, 0.0, v8, 100.0);
      os_log_type_t v10 = [MEMORY[0x263F825C8] colorWithRed:0.427450985 green:0.427450985 blue:0.447058827 alpha:1.0];
      [v9 setTextColor:v10];

      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v9 setNumberOfLines:0];
      [v9 setTextAlignment:1];
      if ([(WFAirportViewController *)self _isChinaDevice])
      {
        __int16 v11 = [@"kWFLocNetworkRestrictionActive" stringByAppendingString:@"_CH"];
      }
      else
      {
        __int16 v11 = @"kWFLocNetworkRestrictionActive";
      }
      int v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:v11 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      long long v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
      [v9 setFont:v14];

      [v9 setText:v13];
      [v5 addSubview:v9];
      long long v15 = (void *)MEMORY[0x263F08938];
      long long v16 = _NSDictionaryOfVariableBindings(&cfstr_Headerlabel.isa, v9, 0);
      long long v17 = [v15 constraintsWithVisualFormat:@"V:|-20-[headerLabel]-20-|" options:0 metrics:0 views:v16];
      [v5 addConstraints:v17];

      uint64_t v18 = (void *)MEMORY[0x263F08938];
      uint64_t v19 = _NSDictionaryOfVariableBindings(&cfstr_Headerlabel.isa, v9, 0);
      __int16 v20 = [v18 constraintsWithVisualFormat:@"|-40-[headerLabel]-40-|" options:0 metrics:0 views:v19];
      [v5 addConstraints:v20];

      unint64_t v21 = [MEMORY[0x263F08938] constraintWithItem:v5 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v8];
      [v5 addConstraint:v21];
      objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
      double v23 = v22 + 40.0;
      [v5 removeConstraint:v21];
      objc_msgSend(v5, "setFrame:", 0.0, 0.0, v8, v23);
      [v5 setTranslatesAutoresizingMaskIntoConstraints:1];
      [v9 setPreferredMaxLayoutWidth:v8];
      id v24 = [(WFAirportViewController *)self tableView];
      [v24 setTableHeaderView:v5];
    }
    else
    {
      char v5 = [(WFAirportViewController *)self tableView];
      [v5 setTableHeaderView:0];
    }
  }
}

- (id)_askToJoinStateStringForATJMode:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      char v5 = @"kWFLocAskToJoinDetailAsk";
      goto LABEL_7;
    case 1:
      uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      char v5 = @"kWFLocAskToJoinDetailNotify";
      goto LABEL_7;
    case 0:
      uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      char v5 = @"kWFLocAskToJoinDetailOff";
LABEL_7:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_9:
  return v6;
}

- (id)_askToJoinFooterString
{
  int64_t v3 = [(WFAirportViewController *)self _askToJoinMode];
  return [(WFAirportViewController *)self _askToJoinFooterStringForMode:v3];
}

- (id)_askToJoinFooterStringForMode:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      int64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      char v5 = @"kWFLocAskToJoinAskFooter";
      goto LABEL_7;
    case 1:
      int64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      char v5 = @"kWFLocAskToJoinNotifyFooter";
      goto LABEL_7;
    case 0:
      int64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      char v5 = @"kWFLocAskToJoinOffFooter";
LABEL_7:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_9:
  return v6;
}

- (int64_t)_askToJoinMode
{
  int64_t v3 = [(WFAirportViewController *)self listDelegate];
  int64_t v4 = [v3 airportSettingsViewControllerAskToJoinMode:self];

  return v4;
}

- (BOOL)_askToJoinShouldBeVisible
{
  return [(WFAirportViewController *)self _askToJoinMode] != -1;
}

- (void)_reloadCurrentNetworkCell
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int64_t v3 = [(WFAirportViewController *)self _currentNetworkCellIndexPath];
  if (v3)
  {
    int64_t v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 136315138;
      os_log_type_t v10 = "-[WFAirportViewController _reloadCurrentNetworkCell]";
      _os_log_impl(&dword_2257EC000, v4, v5, "%s: reloading current network index path", buf, 0xCu);
    }

    uint64_t v6 = [(WFAirportViewController *)self tableView];
    double v8 = v3;
    double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
    [v6 reloadRowsAtIndexPaths:v7 withRowAnimation:5];
  }
}

- (id)_currentNetworkCellIndexPath
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(WFAirportViewController *)self showDiagnosticsCell]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  int64_t v4 = [(WFAirportViewController *)self rowCountWithPlacardCell:v3];
  os_log_type_t v5 = [(WFAirportViewController *)self sections];
  uint64_t v6 = [v5 indexOfObject:&unk_26D911B78];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9)
    {
      uint64_t v11 = v9;
      if (os_log_type_enabled(v11, v10))
      {
        int v12 = [(WFAirportViewController *)self _nameOfSection:0];
        int v13 = 136315394;
        long long v14 = "-[WFAirportViewController _currentNetworkCellIndexPath]";
        __int16 v15 = 2114;
        long long v16 = v12;
        _os_log_impl(&dword_2257EC000, v11, v10, "%s: index for %{public}@ not found in sections", (uint8_t *)&v13, 0x16u);
      }
    }

    double v7 = 0;
  }
  else
  {
    double v7 = [MEMORY[0x263F088C8] indexPathForRow:v4 inSection:v6];
  }
  return v7;
}

- (id)_currentNetworkCell
{
  uint64_t v3 = [(WFAirportViewController *)self _currentNetworkCellIndexPath];
  if (v3)
  {
    int64_t v4 = [(WFAirportViewController *)self tableView];
    os_log_type_t v5 = [v4 cellForRowAtIndexPath:v3];
  }
  else
  {
    os_log_type_t v5 = 0;
  }

  return v5;
}

- (void)_reloadSectionForHotspotChange
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WFAirportViewController *)self tableView];
  [v3 beginUpdates];

  int64_t v4 = [(WFAirportViewController *)self sections];
  uint64_t v5 = [v4 indexOfObject:&unk_26D911B48];

  uint64_t v6 = WFLogForCategory(0);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
    {
      int v11 = 136315138;
      int v12 = "-[WFAirportViewController _reloadSectionForHotspotChange]";
      _os_log_impl(&dword_2257EC000, v6, v7, "%s: hotspot section not found", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    os_log_type_t v8 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v6 && os_log_type_enabled(v6, v8))
    {
      int v11 = 136315394;
      int v12 = "-[WFAirportViewController _reloadSectionForHotspotChange]";
      __int16 v13 = 1024;
      int v14 = v5;
      _os_log_impl(&dword_2257EC000, v6, v8, "%s: reloading hotspot in section %d", (uint8_t *)&v11, 0x12u);
    }

    uint64_t v6 = [(WFAirportViewController *)self tableView];
    char v9 = [MEMORY[0x263F088D0] indexSetWithIndex:v5];
    [v6 reloadSections:v9 withRowAnimation:5];
  }
  os_log_type_t v10 = [(WFAirportViewController *)self tableView];
  [v10 endUpdates];
}

- (void)_reloadPowerSection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WFAirportViewController__reloadPowerSection__block_invoke;
  block[3] = &unk_2647561B8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __46__WFAirportViewController__reloadPowerSection__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) sections];
  uint64_t v3 = [v2 indexOfObject:&unk_26D911B78];

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 136315138;
      char v9 = "-[WFAirportViewController _reloadPowerSection]_block_invoke";
      _os_log_impl(&dword_2257EC000, v4, v5, "%s: power section not found", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) tableView];
    uint64_t v6 = [MEMORY[0x263F088D0] indexSetWithIndex:v3];
    [v7 reloadSections:v6 withRowAnimation:5];
  }
}

- (void)setUserAutoJoinEnabled:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_userAutoJoinEnabled != a3)
  {
    BOOL v3 = a3;
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
    {
      int v18 = 136315394;
      uint64_t v19 = "-[WFAirportViewController setUserAutoJoinEnabled:]";
      __int16 v20 = 1024;
      BOOL v21 = v3;
      _os_log_impl(&dword_2257EC000, v5, v6, "%s: userAutoJoinEnabled %d", (uint8_t *)&v18, 0x12u);
    }

    self->_userAutoJoinEnabled = v3;
    id v7 = [(WFAirportViewController *)self sections];
    uint64_t v8 = [v7 indexOfObject:&unk_26D911B78];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      char v9 = WFLogForCategory(0);
      os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
      {
        int v18 = 136315138;
        uint64_t v19 = "-[WFAirportViewController setUserAutoJoinEnabled:]";
        _os_log_impl(&dword_2257EC000, v9, v10, "%s: power section not found", (uint8_t *)&v18, 0xCu);
      }

      [(WFAirportViewController *)self _dumpSections];
    }
    else
    {
      int v11 = [MEMORY[0x263F089C8] indexSet];
      [v11 addIndex:v8];
      int v12 = [(WFAirportViewController *)self sections];
      uint64_t v13 = [v12 indexOfObject:&unk_26D911B90];

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int v14 = [(WFAirportViewController *)self tableView];
        uint64_t v15 = [(WFAirportViewController *)self sections];
        uint64_t v16 = objc_msgSend(v14, "numberOfRowsInSection:", objc_msgSend(v15, "indexOfObject:", &unk_26D911B90));

        if (v16) {
          [v11 addIndex:v13];
        }
      }
      uint64_t v17 = [(WFAirportViewController *)self tableView];
      [v17 _reloadSectionHeaderFooters:v11 withRowAnimation:100];
    }
  }
}

- (void)updateAutoInstantHotspotSetting:(int64_t)a3
{
  id v5 = [(WFAirportViewController *)self listDelegate];
  [v5 networkListViewController:self setAutoInstantOption:a3];
}

- (id)_getAutoHotspotOptionText:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int64_t v4 = v3;
      id v5 = @"kWFLocAutoInstantHotspotJoinNeverTitle";
      goto LABEL_7;
    case 2:
      BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int64_t v4 = v3;
      id v5 = @"kWFLocAutoInstantHotspotJoinAutoTitle";
      goto LABEL_7;
    case 1:
      BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int64_t v4 = v3;
      id v5 = @"kWFLocAutoInstantHotspotJoinAskTitle";
LABEL_7:
      os_log_type_t v6 = [v3 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      goto LABEL_9;
  }
  os_log_type_t v6 = 0;
LABEL_9:
  return v6;
}

- (NSString)userAutoJoinDisabledWarning
{
  userAutoJoinDisabledWarning = self->_userAutoJoinDisabledWarning;
  if (!userAutoJoinDisabledWarning)
  {
    int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if ([(WFAirportViewController *)self _isChinaDevice]) {
      id v5 = @"kWFLocUserAutoJoinDisabledWarningCH";
    }
    else {
      id v5 = @"kWFLocUserAutoJoinDisabledWarning";
    }
    os_log_type_t v6 = [v4 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    id v7 = self->_userAutoJoinDisabledWarning;
    self->_userAutoJoinDisabledWarning = v6;

    userAutoJoinDisabledWarning = self->_userAutoJoinDisabledWarning;
  }
  return userAutoJoinDisabledWarning;
}

- (NSString)powerOffLocationWarning
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  powerOffLocationWarning = self->_powerOffLocationWarning;
  if (!powerOffLocationWarning)
  {
    BOOL v4 = [(WFAirportViewController *)self _isChinaDevice];
    int v5 = MGGetBoolAnswer();
    os_log_type_t v6 = [(WFAirportViewController *)self listDelegate];
    int v7 = [v6 networkListViewControllerIsAutoUnlockEnabled:self];

    uint64_t v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
    {
      int v19 = 136315906;
      __int16 v20 = "-[WFAirportViewController powerOffLocationWarning]";
      __int16 v21 = 1024;
      BOOL v22 = v4;
      __int16 v23 = 1024;
      int v24 = v5;
      __int16 v25 = 1024;
      int v26 = v7;
      _os_log_impl(&dword_2257EC000, v8, v9, "%s: chinaDevice: %d, cellularDevice: %d, autoUnlockEnabled: %d", (uint8_t *)&v19, 0x1Eu);
    }

    os_log_type_t v10 = @"kWFLocLocationServicesWarning";
    if (v4) {
      os_log_type_t v10 = @"kWFLocLocationServicesWarningCH";
    }
    int v11 = @"kWFLocLocationServicesCellularWarning";
    if (v4) {
      int v11 = @"kWFLocLocationServicesCellularWarningCH";
    }
    int v12 = @"kWFLocAutoUnlockLocationServicesWarning";
    if (v5) {
      os_log_type_t v10 = v11;
    }
    uint64_t v13 = @"kWFLocAutoUnlockLocationServicesCellularWarning";
    if (v4)
    {
      int v12 = @"kWFLocAutoUnlockLocationServicesWarningCH";
      uint64_t v13 = @"kWFLocAutoUnlockLocationServicesCellularWarningCH";
    }
    if (!v5) {
      uint64_t v13 = v12;
    }
    if (v7) {
      os_log_type_t v10 = v13;
    }
    int v14 = v10;
    uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:v14 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    uint64_t v17 = self->_powerOffLocationWarning;
    self->_powerOffLocationWarning = v16;

    powerOffLocationWarning = self->_powerOffLocationWarning;
  }
  return powerOffLocationWarning;
}

- (int64_t)_askToJoinModeFromString:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"kWFLocAskToJoinDetailOff" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  char v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    int64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    os_log_type_t v9 = [v8 localizedStringForKey:@"kWFLocAskToJoinDetailNotify" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    char v10 = [v3 isEqualToString:v9];

    if (v10)
    {
      int64_t v7 = 1;
    }
    else
    {
      int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v12 = [v11 localizedStringForKey:@"kWFLocAskToJoinDetailAsk" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      int v13 = [v3 isEqualToString:v12];

      if (v13) {
        int64_t v7 = 2;
      }
      else {
        int64_t v7 = 0;
      }
    }
  }

  return v7;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)WFAirportViewController;
  id v7 = a4;
  -[WFAirportViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__WFAirportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_2647563E8;
  v9[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__WFAirportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_2647563E8;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

void __78__WFAirportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

uint64_t __78__WFAirportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadPowerSection];
}

- (void)_processPendingCurrentNetworkUpdate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_pendingCurrentNetworkUpdate)
  {
    id v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      pendingCurrentNetworkUpdate = self->_pendingCurrentNetworkUpdate;
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[WFAirportViewController _processPendingCurrentNetworkUpdate]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = pendingCurrentNetworkUpdate;
      _os_log_impl(&dword_2257EC000, v3, v4, "%s: pending update='%@'", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    int v11 = __Block_byref_object_copy__0;
    int v12 = __Block_byref_object_dispose__0;
    char v6 = [(WFPendingNetworkUpdate *)self->_pendingCurrentNetworkUpdate network];
    if (v6)
    {
      id v7 = [(WFPendingNetworkUpdate *)self->_pendingCurrentNetworkUpdate network];
      id v13 = (id)[v7 copyWithZone:0];
    }
    else
    {
      id v13 = 0;
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__WFAirportViewController__processPendingCurrentNetworkUpdate__block_invoke;
    v9[3] = &unk_264756410;
    v9[4] = self;
    void v9[5] = buf;
    dispatch_async(MEMORY[0x263EF83A0], v9);
    uint64_t v8 = self->_pendingCurrentNetworkUpdate;
    self->_pendingCurrentNetworkUpdate = 0;

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __62__WFAirportViewController__processPendingCurrentNetworkUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentNetwork:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)knownNetworksWillResignActive
{
  if ([(WFAirportViewController *)self isInEditingMode])
  {
    screenProtector = self->_screenProtector;
    if (!screenProtector)
    {
      os_log_type_t v4 = [WFLockView alloc];
      int v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v6 = [v5 localizedStringForKey:@"kWFLocKnownNetworksLockTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      id v7 = [(WFAirportViewController *)self navigationController];
      uint64_t v8 = [v7 topViewController];
      os_log_type_t v9 = [v8 view];
      objc_super v10 = [(WFLockView *)v4 initWithTitle:v6 viewToCover:v9];
      int v11 = self->_screenProtector;
      self->_screenProtector = v10;

      int v12 = [(WFAirportViewController *)self navigationController];
      [(WFLockView *)self->_screenProtector setBelongedNavigationController:v12];

      screenProtector = self->_screenProtector;
    }
    id v13 = [(WFLockView *)screenProtector superview];
    uint64_t v14 = [(WFAirportViewController *)self view];
    char v15 = [v13 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = WFLogForCategory(0);
      os_log_type_t v17 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v16 && os_log_type_enabled(v16, v17))
      {
        *(_WORD *)__int16 v21 = 0;
        _os_log_impl(&dword_2257EC000, v16, v17, "Showing screen protector when preferences resign active in edit mode.", v21, 2u);
      }

      int v18 = [(WFAirportViewController *)self navigationController];
      int v19 = [v18 topViewController];
      __int16 v20 = [v19 view];
      [v20 addSubview:self->_screenProtector];
    }
  }
}

- (void)knownNetworksDidBecomeActive
{
  if ([(WFAirportViewController *)self isInEditingMode])
  {
    id v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_2257EC000, v3, v4, "Trying to prompt authentication to remove screen protector.", v5, 2u);
    }

    [(WFAirportViewController *)self _promptAuthToViewKnownNetworkList];
  }
}

- (void)knownNetworksWillEnterForeground
{
  if ([(WFAirportViewController *)self isInEditingMode])
  {
    id v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_2257EC000, v3, v4, "Trying to prompt authentication to remove screen protector.", v5, 2u);
    }

    [(WFAirportViewController *)self _promptAuthToViewKnownNetworkList];
  }
}

- (void)_promptAuthToViewKnownNetworkList
{
  if (self->_isAuthenticating)
  {
    uint64_t v2 = WFLogForCategory(0);
    os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
    {
      LOWORD(buf[0]) = 0;
      os_log_type_t v4 = "Authentication in progress, do not prompt again.";
LABEL_25:
      _os_log_impl(&dword_2257EC000, v2, v3, v4, (uint8_t *)buf, 2u);
    }
  }
  else if ([(WFAirportViewController *)self isInEditingMode])
  {
    screenProtector = self->_screenProtector;
    uint64_t v2 = WFLogForCategory(0);
    if (screenProtector)
    {
      os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v2 && os_log_type_enabled(v2, v7))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2257EC000, v2, v7, "Start Authentication process for known network list.", (uint8_t *)buf, 2u);
      }

      self->_isAuthenticating = 1;
      uint64_t v8 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2257EC000, v8, v9, "Showing auth to unlock known network list.", (uint8_t *)buf, 2u);
      }

      uint64_t v2 = objc_alloc_init(MEMORY[0x263F10470]);
      objc_initWeak(buf, self);
      objc_super v10 = [(WFAirportViewController *)self _wifiKnownNetworkContextOptionsIsChinaDevice:[(WFAirportViewController *)self _isChinaDevice]];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke;
      v11[3] = &unk_264756460;
      objc_copyWeak(&v12, buf);
      v11[4] = self;
      [v2 evaluatePolicy:2 options:v10 reply:v11];

      objc_destroyWeak(&v12);
      objc_destroyWeak(buf);
    }
    else
    {
      os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
      {
        LOWORD(buf[0]) = 0;
        os_log_type_t v4 = "Screen protector is empty, no need to authenticate to remove.";
        goto LABEL_25;
      }
    }
  }
  else
  {
    uint64_t v2 = WFLogForCategory(0);
    os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
    {
      LOWORD(buf[0]) = 0;
      os_log_type_t v4 = "Not in editing mode, do not prompt authentication.";
      goto LABEL_25;
    }
  }
}

void __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke_2;
  block[3] = &unk_264756438;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v10);
}

void __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke_2(id *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2257EC000, v2, v3, "Finishing Authentication process for known network list.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setIsAuthenticating:0];

  if (!a1[4])
  {
LABEL_14:
    [a1[5] _removeScreenProtector];
    return;
  }
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    id v7 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_2257EC000, v5, v6, "Authentication Error: %@", buf, 0xCu);
  }

  if ([a1[4] code] != -9)
  {
    if ([a1[4] code] == -2 || objc_msgSend(a1[4], "code") == -4)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke_400;
      block[3] = &unk_2647561B8;
      void block[4] = a1[5];
      dispatch_async(MEMORY[0x263EF83A0], block);
      return;
    }
    goto LABEL_14;
  }
}

void __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke_400(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1272) belongedNavigationController];
  uint64_t v2 = [v5 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    id v4 = (id)[v5 popViewControllerAnimated:0];
  }
  [*(id *)(a1 + 32) _transitionToScanList];
  [*(id *)(a1 + 32) _removeScreenProtector];
}

- (void)_removeScreenProtector
{
  if (self->_screenProtector)
  {
    os_log_type_t v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_2257EC000, v3, v4, "Removing screen protector", v6, 2u);
    }

    [(WFLockView *)self->_screenProtector removeFromSuperview];
    screenProtector = self->_screenProtector;
    self->_screenProtector = 0;
  }
}

- (void)_loadEditButton
{
  if (_os_feature_enabled_impl())
  {
    os_log_type_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v3 localizedStringForKey:@"kWFLocEditListButtonTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    os_log_type_t v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v7 style:0 target:self action:sel_editKnownNetworks];
    id v5 = [(WFAirportViewController *)self parentViewController];
    os_log_type_t v6 = [v5 navigationItem];
    [v6 setRightBarButtonItem:v4];

    [v4 setEnabled:1];
  }
}

- (void)editKnownNetworks
{
  [(WFAirportViewController *)self setNetworksToBeDeleted:0];
  id v3 = objc_alloc_init(MEMORY[0x263F10470]);
  os_log_type_t v4 = [(WFAirportViewController *)self _wifiKnownNetworkContextOptionsIsChinaDevice:[(WFAirportViewController *)self _isChinaDevice]];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__WFAirportViewController_editKnownNetworks__block_invoke;
  v5[3] = &unk_264756488;
  v5[4] = self;
  [v3 evaluatePolicy:2 options:v4 reply:v5];
}

void __44__WFAirportViewController_editKnownNetworks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WFAirportViewController_editKnownNetworks__block_invoke_2;
  v7[3] = &unk_264756208;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __44__WFAirportViewController_editKnownNetworks__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = WFLogForCategory(0);
    os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v4;
      _os_log_impl(&dword_2257EC000, v2, v3, "Authentication Error: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t result = [v5 code];
    if (result != -5)
    {
      if (v5) {
        return result;
      }
      return [*(id *)(a1 + 40) _transitionToKnownNetworksList];
    }
    goto LABEL_10;
  }
  if ([0 code] == -5)
  {
LABEL_10:
    id v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2257EC000, v7, v8, "User turned off passcode", (uint8_t *)&v9, 2u);
    }
  }
  return [*(id *)(a1 + 40) _transitionToKnownNetworksList];
}

- (void)_transitionToKnownNetworksList
{
  [(WFAirportViewController *)self setIsInEditingMode:1];
  os_log_type_t v3 = [(WFAirportViewController *)self tableView];
  [v3 setAllowsSelectionDuringEditing:1];

  [(WFAirportViewController *)self refreshKnownNetworksUpdateTableView:0];
  [(WFAirportViewController *)self _adjustNavigationItemsForEditingMode];
  [(WFAirportViewController *)self _updateNetworkRestrictionHeader];
  uint64_t v4 = [(WFAirportViewController *)self listDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFAirportViewController *)self listDelegate];
    [v6 airportSettingsViewControllerDidStartEditingKnownNetworks:self];
  }
  id v7 = [(WFAirportViewController *)self tableView];
  [v7 setEditing:1];

  os_log_type_t v8 = [(WFAirportViewController *)self tableView];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__WFAirportViewController__transitionToKnownNetworksList__block_invoke;
  v9[3] = &unk_2647561B8;
  v9[4] = self;
  [v8 performBatchUpdates:v9 completion:0];
}

void __57__WFAirportViewController__transitionToKnownNetworksList__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _defaultSectionsForEditing];
  uint64_t v2 = [*(id *)(a1 + 32) sections];
  [*(id *)(a1 + 32) setPreviousSections:v2];
  os_log_type_t v3 = [*(id *)(a1 + 32) tableView];
  uint64_t v4 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v2, "count"));
  [v3 deleteSections:v4 withRowAnimation:0];

  [*(id *)(a1 + 32) setSections:v7];
  char v5 = [*(id *)(a1 + 32) tableView];
  id v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  [v5 insertSections:v6 withRowAnimation:4];
}

- (id)_sortedProfilesFromSet:(id)a3
{
  os_log_type_t v3 = [a3 allObjects];
  uint64_t v4 = WFScanRecordAlphaSortCompartor();
  char v5 = [v3 sortedArrayUsingComparator:v4];

  return v5;
}

- (id)_defaultSectionsForEditing
{
  if ([(NSArray *)self->_managedKnownNetworks count])
  {
    os_log_type_t v3 = [MEMORY[0x263EFF980] array];
    if ([(NSMutableArray *)self->_editableKnownNetworks count]) {
      [v3 addObject:&unk_26D911BC0];
    }
    if ([(NSArray *)self->_managedKnownNetworks count]) {
      [v3 addObject:&unk_26D911C08];
    }
  }
  else
  {
    os_log_type_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &unk_26D911BC0, 0);
  }
  uint64_t v4 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v3];

  return v4;
}

- (void)_adjustNavigationItemsForEditingMode
{
  os_log_type_t v3 = [(WFAirportViewController *)self parentViewController];
  uint64_t v4 = [v3 navigationItem];
  char v5 = [v4 leftBarButtonItem];
  [(WFAirportViewController *)self setOriginalBackButtonItem:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelEditing];
  id v7 = [(WFAirportViewController *)self parentViewController];
  os_log_type_t v8 = [v7 navigationItem];
  [v8 setLeftBarButtonItem:v6];

  int v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_finishEditing];
  uint64_t v10 = [(WFAirportViewController *)self parentViewController];
  uint64_t v11 = [v10 navigationItem];
  [v11 setRightBarButtonItem:v9];

  [(WFAirportViewController *)self _updateKnownNetworksDoneButtonForEditability];
}

- (void)finishEditing
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_log_type_t v3 = [(WFAirportViewController *)self networksToBeDeleted];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    char v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      id v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        os_log_type_t v8 = [(WFAirportViewController *)self networksToBeDeleted];
        int v11 = 134217984;
        uint64_t v12 = [v8 count];
        _os_log_impl(&dword_2257EC000, v7, v6, "Deleting %lu known networks,", (uint8_t *)&v11, 0xCu);
      }
    }

    [(WFAirportViewController *)self promptConfirmAlert];
  }
  else
  {
    [(WFAirportViewController *)self _transitionToScanList];
    int v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v9 && os_log_type_enabled(v9, v10))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_2257EC000, v9, v10, "No change to known network lists, bring back network list.", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)cancelEditing
{
  os_log_type_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_2257EC000, v3, v4, "cancel known networks editing", v5, 2u);
  }

  [(WFAirportViewController *)self _transitionToScanList];
  [(WFAirportViewController *)self _updateKnownNetworksDoneButtonForEditability];
}

- (void)promptConfirmAlert
{
  objc_initWeak(&location, self);
  if ([(WFAirportViewController *)self _isChinaDevice])
  {
    os_log_type_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"kWFLocDeleteConfirmPromptAlertTitle_CH" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  else
  {
    os_log_type_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"kWFLocDeleteConfirmPromptAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  os_log_type_t v4 = };

  if ([(WFAirportViewController *)self _isChinaDevice])
  {
    char v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v5 localizedStringForKey:@"kWFLocDeleteConfirmPromptAlertMessage_CH" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  else
  {
    char v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v5 localizedStringForKey:@"kWFLocDeleteConfirmPromptAlertMessage" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  os_log_type_t v6 = };

  id v7 = [MEMORY[0x263F82418] alertControllerWithTitle:v4 message:v6 preferredStyle:1];
  os_log_type_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v9 = [v8 localizedStringForKey:@"kWFLocDeleteConfirmPromptRemoveTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  os_log_type_t v10 = (void *)MEMORY[0x263F82400];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  os_log_type_t v17 = __45__WFAirportViewController_promptConfirmAlert__block_invoke;
  int v18 = &unk_2647564B0;
  objc_copyWeak(&v19, &location);
  int v11 = [v10 actionWithTitle:v9 style:0 handler:&v15];
  objc_msgSend(v7, "addAction:", v11, v15, v16, v17, v18);
  uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"kWFLocDeleteConfirmPromptCancelTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  uint64_t v14 = [MEMORY[0x263F82400] actionWithTitle:v13 style:1 handler:&__block_literal_global_0];
  [v7 addAction:v14];
  [(WFAirportViewController *)self presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __45__WFAirportViewController_promptConfirmAlert__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _submitDeletion];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _transitionToScanList];

  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_2257EC000, v4, v5, "user tapped on confirm in the removal prompt", v6, 2u);
  }
}

void __45__WFAirportViewController_promptConfirmAlert__block_invoke_436()
{
  v0 = WFLogForCategory(0);
  os_log_type_t v1 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v0 && os_log_type_enabled(v0, v1))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_2257EC000, v0, v1, "User tapped cancel in confirmation prompt.", v2, 2u);
  }
}

- (void)_transitionToScanList
{
  id v3 = [(WFAirportViewController *)self originalBackButtonItem];
  uint64_t v4 = [(WFAirportViewController *)self parentViewController];
  os_log_type_t v5 = [(id)v4 navigationItem];
  [v5 setLeftBarButtonItem:v3];

  os_log_type_t v6 = [(WFAirportViewController *)self tableView];
  [v6 setAllowsSelectionDuringEditing:0];

  [(WFAirportViewController *)self _loadEditButton];
  id v7 = [(WFAirportViewController *)self listDelegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    os_log_type_t v8 = [(WFAirportViewController *)self listDelegate];
    [v8 airportSettingsViewControllerDidFinishEditingKnownNetworks:self];
  }
  int v9 = [(WFAirportViewController *)self tableView];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__WFAirportViewController__transitionToScanList__block_invoke;
  v11[3] = &unk_2647561B8;
  v11[4] = self;
  [v9 performBatchUpdates:v11 completion:0];

  [(WFAirportViewController *)self setIsInEditingMode:0];
  [(WFAirportViewController *)self _updateNetworkRestrictionHeader];
  os_log_type_t v10 = [(WFAirportViewController *)self tableView];
  [v10 setEditing:0];

  [(WFAirportViewController *)self setNetworksToBeDeleted:0];
}

void __48__WFAirportViewController__transitionToScanList__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) previousSections];
  if (v2) {
    [*(id *)(a1 + 32) previousSections];
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "_defaultSectionsForPowerState:", objc_msgSend(*(id *)(a1 + 32), "powered"));
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = [*(id *)(a1 + 32) sections];
  uint64_t v4 = [*(id *)(a1 + 32) tableView];
  os_log_type_t v5 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  [v4 deleteSections:v5 withRowAnimation:0];

  [*(id *)(a1 + 32) setSections:v8];
  os_log_type_t v6 = [*(id *)(a1 + 32) tableView];
  id v7 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  [v6 insertSections:v7 withRowAnimation:4];
}

- (void)_submitDeletion
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(WFAirportViewController *)self networksToBeDeleted];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
    os_log_type_t v6 = [(WFAirportViewController *)self networksToBeDeleted];
    int v7 = [WeakRetained removeKnownNetworks:v6];

    id v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel()) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    int v11 = !v10;
    if (v7)
    {
      if (v11)
      {
        uint64_t v12 = v8;
        if (os_log_type_enabled(v12, v9))
        {
          uint64_t v13 = [(WFAirportViewController *)self networksToBeDeleted];
          int v15 = 138412290;
          uint64_t v16 = (uint64_t)v13;
          uint64_t v14 = "Error occurred when trying to delete networks:%@";
LABEL_15:
          _os_log_impl(&dword_2257EC000, v12, v9, v14, (uint8_t *)&v15, 0xCu);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (v11)
    {
      uint64_t v12 = v8;
      if (os_log_type_enabled(v12, v9))
      {
        uint64_t v13 = [(WFAirportViewController *)self networksToBeDeleted];
        int v15 = 134217984;
        uint64_t v16 = [v13 count];
        uint64_t v14 = "User deleted %lu networks successfully";
        goto LABEL_15;
      }
LABEL_16:
    }
  }
}

- (void)_updateKnownNetworksDoneButtonForEditability
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(WFAirportViewController *)self isInEditingMode])
  {
    id v3 = [(WFAirportViewController *)self networksToBeDeleted];
    BOOL v4 = [v3 count] != 0;
  }
  else
  {
    BOOL v4 = 1;
  }
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v10 = 136315394;
    int v11 = "-[WFAirportViewController _updateKnownNetworksDoneButtonForEditability]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: done button enabled=%d", (uint8_t *)&v10, 0x12u);
  }

  int v7 = [(WFAirportViewController *)self parentViewController];
  id v8 = [v7 navigationItem];
  os_log_type_t v9 = [v8 rightBarButtonItem];
  [v9 setEnabled:v4];
}

- (id)_wifiKnownNetworkContextOptionsIsChinaDevice:(BOOL)a3
{
  BOOL v3 = a3;
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = &unk_26D911C20;
  os_log_type_t v5 = -[WFAirportViewController _passcodePromptForViewingKnownNetworksIsChinaDevice:](self, "_passcodePromptForViewingKnownNetworksIsChinaDevice:");
  v9[1] = &unk_26D911C38;
  v10[0] = v5;
  os_log_type_t v6 = [(WFAirportViewController *)self _touchIDPromptForKnownNetworksIsChinaDevice:v3];
  v10[1] = v6;
  int v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)_touchIDPromptForKnownNetworksIsChinaDevice:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  os_log_type_t v5 = v4;
  if (v3) {
    os_log_type_t v6 = @"kWFLocTouchIDConfirmationKnownNetworks_CH";
  }
  else {
    os_log_type_t v6 = @"kWFLocTouchIDConfirmationKnownNetworks";
  }
  int v7 = [v4 localizedStringForKey:v6 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v7;
}

- (id)_passcodePromptForViewingKnownNetworksIsChinaDevice:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = [@"kWFLocPasswordConfirmationKnownNetworks" stringByAppendingString:@"_CH"];
  }
  else
  {
    BOOL v3 = @"kWFLocPasswordConfirmationKnownNetworks";
  }
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  os_log_type_t v5 = [v4 localizedStringForKey:v3 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v5;
}

- (void)refreshKnownNetworksUpdateTableView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  os_log_type_t v5 = [(WFAirportViewController *)self listDelegate];
  os_log_type_t v6 = [v5 managedKnownNetworks];
  int v7 = [(WFAirportViewController *)self _sortedProfilesFromSet:v6];
  [(WFAirportViewController *)self setManagedKnownNetworks:v7];

  id v8 = (void *)MEMORY[0x263EFF980];
  os_log_type_t v9 = [(WFAirportViewController *)self listDelegate];
  int v10 = [v9 editableKnownNetworks];
  int v11 = [(WFAirportViewController *)self _sortedProfilesFromSet:v10];
  __int16 v12 = [v8 arrayWithArray:v11];
  [(WFAirportViewController *)self setEditableKnownNetworks:v12];

  BOOL v13 = WFLogForCategory(0);
  os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v13)
  {
    int v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      uint64_t v16 = [(WFAirportViewController *)self managedKnownNetworks];
      uint64_t v17 = [v16 count];
      int v18 = [(WFAirportViewController *)self editableKnownNetworks];
      int v20 = 134218240;
      uint64_t v21 = v17;
      __int16 v22 = 2048;
      uint64_t v23 = [v18 count];
      _os_log_impl(&dword_2257EC000, v15, v14, "managed networks=%lu editable networks=%lu", (uint8_t *)&v20, 0x16u);
    }
  }

  if (v3)
  {
    id v19 = [(WFAirportViewController *)self tableView];
    [v19 reloadData];
  }
}

- (WFNetworkListRecord)currentNetwork
{
  return (WFNetworkListRecord *)objc_getProperty(self, a2, 1056, 1);
}

- (int64_t)currentNetworkState
{
  return self->_currentNetworkState;
}

- (float)currentNetworkScaledRSSI
{
  return self->_currentNetworkScaledRSSI;
}

- (WFAirportViewControllerDelegate)listDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  return (WFAirportViewControllerDelegate *)WeakRetained;
}

- (void)setListDelegate:(id)a3
{
}

- (BOOL)showOtherNetwork
{
  return self->_showOtherNetwork;
}

- (void)setShowOtherNetwork:(BOOL)a3
{
  self->_showOtherNetworuint64_t k = a3;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (NSString)currentNetworkSubtitle
{
  return self->_currentNetworkSubtitle;
}

- (BOOL)userAutoJoinEnabled
{
  return self->_userAutoJoinEnabled;
}

- (BOOL)askToJoinShown
{
  return self->_askToJoinShown;
}

- (void)setAskToJoinShown:(BOOL)a3
{
  self->_int askToJoinShown = a3;
}

- (BOOL)disablePowerModification
{
  return self->_disablePowerModification;
}

- (void)setDisablePowerModification:(BOOL)a3
{
  self->_disablePowerModification = a3;
}

- (BOOL)isManagedAppleID
{
  return self->_isManagedAppleID;
}

- (void)setIsManagedAppleID:(BOOL)a3
{
  self->_isManagedAppleID = a3;
}

- (void)setPowerOffLocationWarning:(id)a3
{
}

- (void)setUserAutoJoinDisabledWarning:(id)a3
{
}

- (BOOL)showDiagnostics
{
  return self->_showDiagnostics;
}

- (void)setShowDiagnostics:(BOOL)a3
{
  self->_showDiagnostics = a3;
}

- (BOOL)showNANUI
{
  return self->_showNANUI;
}

- (void)setShowNANUI:(BOOL)a3
{
  self->_showNANUI = a3;
}

- (BOOL)showKnownNetworks
{
  return self->_showKnownNetworks;
}

- (void)setShowKnownNetworks:(BOOL)a3
{
  self->_showKnownNetworks = a3;
}

- (NSOrderedSet)sections
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setSections:(id)a3
{
}

- (NSOrderedSet)previousSections
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setPreviousSections:(id)a3
{
}

- (NSSet)allNetworks
{
  return self->_allNetworks;
}

- (void)setAllNetworks:(id)a3
{
}

- (NSArray)infraNetworks
{
  return self->_infraNetworks;
}

- (void)setInfraNetworks:(id)a3
{
}

- (NSArray)popularNetworks
{
  return self->_popularNetworks;
}

- (void)setPopularNetworks:(id)a3
{
}

- (NSArray)knownNetworks
{
  return self->_knownNetworks;
}

- (void)setKnownNetworks:(id)a3
{
}

- (NSArray)adhocNetworks
{
  return self->_adhocNetworks;
}

- (void)setAdhocNetworks:(id)a3
{
}

- (NSArray)unconfiguredNetworks
{
  return self->_unconfiguredNetworks;
}

- (void)setUnconfiguredNetworks:(id)a3
{
}

- (WFTableViewHeaderView)chooseNetworkHeader
{
  return self->_chooseNetworkHeader;
}

- (void)setChooseNetworkHeader:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (WFNetworkListRecord)joiningHotspot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_joiningHotspot);
  return (WFNetworkListRecord *)WeakRetained;
}

- (void)setJoiningHotspot:(id)a3
{
}

- (WFPendingNetworkUpdate)pendingCurrentNetworkUpdate
{
  return self->_pendingCurrentNetworkUpdate;
}

- (void)setPendingCurrentNetworkUpdate:(id)a3
{
}

- (BOOL)tableViewIsUpdating
{
  return self->_tableViewIsUpdating;
}

- (void)setTableViewIsUpdating:(BOOL)a3
{
  self->_tableViewIsUpdating = a3;
}

- (BOOL)networkResultsChangedWhileUIUpdates
{
  return self->_networkResultsChangedWhileUIUpdates;
}

- (void)setNetworkResultsChangedWhileUIUpdates:(BOOL)a3
{
  self->_networkResultsChangedWhileUIUpdates = a3;
}

- (NSSet)pendingNetworks
{
  return self->_pendingNetworks;
}

- (void)setPendingNetworks:(id)a3
{
}

- (NSString)currentKnownHeaderText
{
  return self->_currentKnownHeaderText;
}

- (void)setCurrentKnownHeaderText:(id)a3
{
}

- (NSString)currentInfraHeaderText
{
  return self->_currentInfraHeaderText;
}

- (void)setCurrentInfraHeaderText:(id)a3
{
}

- (NSString)currentUnconfiguredHeaderText
{
  return self->_currentUnconfiguredHeaderText;
}

- (void)setCurrentUnconfiguredHeaderText:(id)a3
{
}

- (NSMutableArray)editableKnownNetworks
{
  return self->_editableKnownNetworks;
}

- (void)setEditableKnownNetworks:(id)a3
{
}

- (NSArray)managedKnownNetworks
{
  return self->_managedKnownNetworks;
}

- (void)setManagedKnownNetworks:(id)a3
{
}

- (NSArray)networksToBeDeleted
{
  return self->_networksToBeDeleted;
}

- (void)setNetworksToBeDeleted:(id)a3
{
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (void)setIsInEditingMode:(BOOL)a3
{
  self->_isInEditingMode = a3;
}

- (UIBarButtonItem)originalBackButtonItem
{
  return self->_originalBackButtonItem;
}

- (void)setOriginalBackButtonItem:(id)a3
{
}

- (WFLockView)screenProtector
{
  return self->_screenProtector;
}

- (void)setScreenProtector:(id)a3
{
}

- (WFNetworkRowConfig)currentNetworkRowConfig
{
  return self->_currentNetworkRowConfig;
}

- (void)setCurrentNetworkRowConfig:(id)a3
{
}

- (BOOL)isUsingSwiftList
{
  return self->_isUsingSwiftList;
}

- (void)setIsUsingSwiftList:(BOOL)a3
{
  self->_isUsingSwiftList = a3;
}

- (BOOL)usePlacardCell
{
  return self->_usePlacardCell;
}

- (void)setUsePlacardCell:(BOOL)a3
{
  self->_usePlacardCell = a3;
}

- (BOOL)isAuthenticating
{
  return self->_isAuthenticating;
}

- (void)setIsAuthenticating:(BOOL)a3
{
  self->_isAuthenticating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNetworkRowConfig, 0);
  objc_storeStrong((id *)&self->_screenProtector, 0);
  objc_storeStrong((id *)&self->_originalBackButtonItem, 0);
  objc_storeStrong((id *)&self->_networksToBeDeleted, 0);
  objc_storeStrong((id *)&self->_managedKnownNetworks, 0);
  objc_storeStrong((id *)&self->_editableKnownNetworks, 0);
  objc_storeStrong((id *)&self->_currentUnconfiguredHeaderText, 0);
  objc_storeStrong((id *)&self->_currentInfraHeaderText, 0);
  objc_storeStrong((id *)&self->_currentKnownHeaderText, 0);
  objc_storeStrong((id *)&self->_pendingNetworks, 0);
  objc_storeStrong((id *)&self->_pendingCurrentNetworkUpdate, 0);
  objc_destroyWeak((id *)&self->_joiningHotspot);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_chooseNetworkHeader, 0);
  objc_storeStrong((id *)&self->_unconfiguredNetworks, 0);
  objc_storeStrong((id *)&self->_adhocNetworks, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_popularNetworks, 0);
  objc_storeStrong((id *)&self->_infraNetworks, 0);
  objc_storeStrong((id *)&self->_allNetworks, 0);
  objc_storeStrong((id *)&self->_previousSections, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_userAutoJoinDisabledWarning, 0);
  objc_storeStrong((id *)&self->_powerOffLocationWarning, 0);
  objc_storeStrong((id *)&self->_currentNetworkSubtitle, 0);
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
}

@end