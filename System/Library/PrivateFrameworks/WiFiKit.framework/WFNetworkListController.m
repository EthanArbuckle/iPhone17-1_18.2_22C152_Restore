@interface WFNetworkListController
- (BOOL)_canPromptForCarPlay;
- (BOOL)_canPromptForInstantHotspot;
- (BOOL)_canScanForHiddenNetwork:(id)a3;
- (BOOL)_canStartAssociationToNetwork:(id)a3;
- (BOOL)_canStartAssociationToUserSuppliedNetwork:(id)a3;
- (BOOL)_disablePersonalHotspot;
- (BOOL)_handleAccessoryDetailURL:(id)a3;
- (BOOL)_handleCurrentNetworkDetailsURL:(id)a3;
- (BOOL)_isActiveCarPlaySession;
- (BOOL)_isChannelAllowedForScanPerCurrentLocale:(int64_t)a3;
- (BOOL)_shouldPauseScanning;
- (BOOL)_shouldShowLowDataModeForProfile:(id)a3;
- (BOOL)_supportsWiFiPasswordSharing;
- (BOOL)_useLegacySettingsUI;
- (BOOL)airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:(id)a3;
- (BOOL)airportSettingsViewControllerShouldShowDiagnosticsMode:(id)a3;
- (BOOL)airportSettingsViewControllerShouldShowKnownNetworks:(id)a3;
- (BOOL)airportSettingsViewControllerShouldShowNANUI:(id)a3;
- (BOOL)associatingToOtherNetwork;
- (BOOL)canScanForPersonalHotspots;
- (BOOL)firstScanFinished;
- (BOOL)handleURL:(id)a3;
- (BOOL)isAirPortSettings;
- (BOOL)isAssociating;
- (BOOL)isHS20Supported;
- (BOOL)isRandomMACManageFeatureEnabled;
- (BOOL)isScanning;
- (BOOL)isSetup;
- (BOOL)knownNetworksContainsHS20Networks;
- (BOOL)lockdownModeEnabled;
- (BOOL)networkListViewControllerCurrentPowerState:(id)a3;
- (BOOL)networkListViewControllerIsAutoUnlockEnabled:(id)a3;
- (BOOL)networkListViewControllerIsManagedAppleID:(id)a3;
- (BOOL)networkListViewControllerLockdownModeActive:(id)a3;
- (BOOL)networkListViewControllerNetworkRestrictionActive:(id)a3;
- (BOOL)networkListViewControllerPowerModificationDisabled:(id)a3;
- (BOOL)networkListViewControllerWAPIEnabled:(id)a3;
- (BOOL)privacyProxyFeatureEnabled;
- (BOOL)removeKnownNetworks:(id)a3;
- (BOOL)scanForPersonalHotspots;
- (BOOL)shouldShowDetailTapOnCurrentNetwork;
- (BOOL)viewControllerSupportsCurrentNetworkSubtitle;
- (NSOperationQueue)backgroundQueue;
- (NSSet)knownHiddenNetworkNames;
- (NSSet)networks;
- (WFAssociationContext)associationContext;
- (WFAssociationContextQueue)associationContextQueue;
- (WFCertificateContext)certificateContext;
- (WFClient)wifiClient;
- (WFContextPresenting)visibleContext;
- (WFCredentialsContext)credentialsContext;
- (WFDetailsContext)detailsContext;
- (WFDiagnosticsManager)diagnosticsManager;
- (WFGasQueryController)gasController;
- (WFHealthIssueOverrides)healthRecommendationOverrides;
- (WFHealthManager)healthManager;
- (WFHotspotInterface)hotspotInterface;
- (WFInterface)interface;
- (WFKnownNetworksProvider)knownNetworksManager;
- (WFLinkQuality)latestLinkQuality;
- (WFNetworkListController)init;
- (WFNetworkListController)initWithViewController:(id)a3;
- (WFNetworkListController)initWithViewController:(id)a3 viewProvider:(id)a4;
- (WFNetworkListController)initWithViewController:(id)a3 viewProvider:(id)a4 client:(id)a5;
- (WFNetworkListController)initWithViewController:(id)a3 viewProvider:(id)a4 client:(id)a5 knownNetworksManager:(id)a6;
- (WFNetworkListRandomMACManager)randomMACManager;
- (WFNetworkListing)viewController;
- (WFNetworkView)contextVC;
- (WFNetworkViewProvider)viewProvider;
- (WFOtherNetworkProvider)otherNetworkVC;
- (WFScanManager)scanManager;
- (WFScanMetricsManager)scanMetricsManager;
- (WFWiFiStateMonitor)stateMonitor;
- (id)_convertToHexString:(id)a3;
- (id)_hardwareMACAddress;
- (id)_sortedHealthRecommendations;
- (id)airportSettingsViewController:(id)a3 unconfiguredAccessoriesGroupHeaderTitle:(id)a4;
- (id)editableKnownNetworks;
- (id)healthRecommendations;
- (id)keyValueDictionaryForURL:(id)a3;
- (id)managedKnownNetworks;
- (id)passwordToDisplayForSSID:(id)a3;
- (id)scanManager:(id)a3 filterScanResults:(id)a4;
- (int64_t)_defaultAuthTraits;
- (int64_t)airportSettingsViewControllerAskToJoinMode:(id)a3;
- (int64_t)networkListViewControllerAutoInstantHotspotOption:(id)a3;
- (int64_t)privacyProxyFeatureTier;
- (unint64_t)_getLockdownModeSecurityType:(id)a3;
- (unint64_t)powerState;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_associateToEnterpriseNetwork:(id)a3 profile:(id)a4;
- (void)_associateToHS20Network:(id)a3;
- (void)_associateToHotspotDevice:(id)a3;
- (void)_associateToNetwork:(id)a3 profile:(id)a4;
- (void)_associateToScanRecord:(id)a3;
- (void)_associateToScanRecord:(id)a3 profile:(id)a4;
- (void)_associateToUnconfiguredAccessory:(id)a3;
- (void)_associateToUserSuppliedNetwork:(id)a3;
- (void)_associateToUserSuppliedNetworkHelper:(id)a3 networks:(id)a4;
- (void)_associationDidFinish:(BOOL)a3 error:(id)a4 network:(id)a5;
- (void)_associationWillStart:(id)a3;
- (void)_cellularOutrankNotification:(id)a3;
- (void)_cleanUpStatesForDismissal;
- (void)_clientRestartedNotification:(id)a3;
- (void)_dismissCredentialsViewControllerWithContext:(id)a3;
- (void)_dismissDetailsViewControllerWithContext:(id)a3;
- (void)_dismissErrorViewControllerWithContext:(id)a3;
- (void)_dismissLockdownModeViewControllerWithContext:(id)a3;
- (void)_dismissOtherNetworkViewControllerWithContext:(id)a3;
- (void)_dismissTrustViewControllerWithContext:(id)a3;
- (void)_dismissViewControllerForContext:(id)a3;
- (void)_dismissVisibleContext;
- (void)_downloadHomeApp;
- (void)_handleAssociationError:(id)a3 network:(id)a4 profile:(id)a5 securityMode:(int64_t)a6 associationContext:(id)a7;
- (void)_handleAssociationResult:(BOOL)a3 error:(id)a4 network:(id)a5 profile:(id)a6 shouldSaveProfile:(BOOL)a7;
- (void)_interfaceDidBecomeAvailable:(id)a3;
- (void)_ipStateDidChange:(id)a3;
- (void)_managedAppleIDStateDidChange:(id)a3;
- (void)_networkDidChangeNotification:(id)a3;
- (void)_networkHealthIssuesDidChange:(id)a3;
- (void)_networkLinkQualityDidChangeNotification:(id)a3;
- (void)_networkRestrictionStateDidChange:(id)a3;
- (void)_openHomeAppForNetwork:(id)a3;
- (void)_openURL:(id)a3;
- (void)_pauseScanning;
- (void)_powerModificationDisableStateDidChange:(id)a3;
- (void)_powerStateChanged;
- (void)_preferredNetworksDidChange:(id)a3;
- (void)_presentCellularOutrankAlertForNetwork:(id)a3 privateCellular:(BOOL)a4;
- (void)_presentContext:(id)a3 contextType:(unint64_t)a4;
- (void)_presentDeveloperOutrankAlertForNetwork:(id)a3;
- (void)_presentHotspotErrorContextWithDevice:(id)a3 hotspotError:(id)a4 failure:(int64_t)a5;
- (void)_promptCredentialsForNetwork:(id)a3 profile:(id)a4;
- (void)_promptCredentialsForNetworkCancelled:(id)a3;
- (void)_promptForSecureWACDevice:(id)a3;
- (void)_promptToDisableCarPlayForNetworkName:(id)a3 handler:(id)a4;
- (void)_promptTrustCertificateForNetwork:(id)a3 certificateChain:(id)a4 profile:(id)a5 autoJoin:(BOOL)a6;
- (void)_refreshKnownHiddenNetworkNamesCache;
- (void)_registerForApplicationNotifications;
- (void)_resumeScanning;
- (void)_runUnconfiguredJoinOperationForNetwork:(id)a3;
- (void)_saveLogsWithComment:(id)a3 diagnosticsViewController:(id)a4;
- (void)_scanNetworkForAssociation:(id)a3 profile:(id)a4;
- (void)_setupGASControllerWithInterface:(id)a3;
- (void)_setupWithInterface:(id)a3;
- (void)_setupWithoutInterface;
- (void)_startHotspotScan;
- (void)_stateMonitorChangedStates:(int64_t)a3 oldState:(int64_t)a4;
- (void)_stopHotspotScan;
- (void)_updateCurrentNetworkIPState:(id)a3;
- (void)_updateHS20NetworksWithProfiles:(id)a3 names:(id)a4;
- (void)_updateHealthSubtitle;
- (void)_updatePowerState;
- (void)_updatePrivacyProxyFeatureEnabled;
- (void)_updateViewControllerConnectedNetwork;
- (void)_updateViewControllerConnectedNetwork:(id)a3;
- (void)_updateViewControllerDisabled;
- (void)_updateViewControllerScanResults;
- (void)_updateViewsForNetworks:(id)a3;
- (void)_wifiPropertyDidChanged:(id)a3;
- (void)airportSettingsViewController:(id)a3 setAskToJoinMode:(int64_t)a4;
- (void)airportSettingsViewControllerDidFinishEditingKnownNetworks:(id)a3;
- (void)airportSettingsViewControllerDidStartEditingKnownNetworks:(id)a3;
- (void)airportSettingsViewControllerDidTapDataUsage:(id)a3;
- (void)airportSettingsViewControllerDidTapDiagnosticsMode:(id)a3 showNANUI:(BOOL)a4;
- (void)dealloc;
- (void)gasQueryController:(id)a3 didUpdateProfiles:(id)a4 networkNames:(id)a5;
- (void)hotspotInterfaceDidUpdateNetworks:(id)a3;
- (void)networkListViewController:(id)a3 didTapRecord:(id)a4;
- (void)networkListViewController:(id)a3 setAutoInstantOption:(int64_t)a4;
- (void)networkListViewController:(id)a3 setWAPIEnabled:(BOOL)a4;
- (void)networkListViewController:(id)a3 showSettingsForNetwork:(id)a4;
- (void)networkListViewController:(id)a3 showSettingsForNetwork:(id)a4 context:(int64_t)a5;
- (void)networkListViewController:(id)a3 showSettingsForNetwork:(id)a4 context:(int64_t)a5 scrollToCellType:(unint64_t)a6;
- (void)networkListViewController:(id)a3 userDidChangePower:(BOOL)a4;
- (void)networkListViewController:(id)a3 userDidChangePowerToggle:(unint64_t)a4;
- (void)networkListViewControllerDidAppear:(id)a3;
- (void)networkListViewControllerDidDisappear:(id)a3;
- (void)networkListViewControllerDidFinish:(id)a3;
- (void)networkListViewControllerDidTapOtherNetwork:(id)a3;
- (void)pushDataUsageViewController;
- (void)removeScanCache;
- (void)scanManager:(id)a3 didFindHotspotHelperNetworks:(id)a4;
- (void)scanManager:(id)a3 didFinishScanRequest:(id)a4 results:(id)a5 error:(id)a6 timeElapsed:(double)a7;
- (void)scanManager:(id)a3 stateDidChange:(int64_t)a4;
- (void)scanManager:(id)a3 updatedPartialResults:(id)a4;
- (void)scanManager:(id)a3 willStartScanRequest:(id)a4;
- (void)scanManagerScanningDidFinish:(id)a3 withResults:(id)a4 error:(id)a5;
- (void)scanManagerScanningWillStart:(id)a3;
- (void)setAssociatingToOtherNetwork:(BOOL)a3;
- (void)setAssociationContext:(id)a3;
- (void)setAssociationContextQueue:(id)a3;
- (void)setBackgroundQueue:(id)a3;
- (void)setCanScanForPersonalHotspots:(BOOL)a3;
- (void)setCertificateContext:(id)a3;
- (void)setContextVC:(id)a3;
- (void)setCredentialsContext:(id)a3;
- (void)setDetailsContext:(id)a3;
- (void)setDiagnosticsManager:(id)a3;
- (void)setFirstScanFinished:(BOOL)a3;
- (void)setGasController:(id)a3;
- (void)setHS20Supported:(BOOL)a3;
- (void)setHealthManager:(id)a3;
- (void)setHealthRecommendationOverrides:(id)a3;
- (void)setHotspotInterface:(id)a3;
- (void)setInterface:(id)a3;
- (void)setIsRandomMACManageFeatureEnabled:(BOOL)a3;
- (void)setKnownHiddenNetworkNames:(id)a3;
- (void)setKnownNetworksContainsHS20Networks:(BOOL)a3;
- (void)setKnownNetworksManager:(id)a3;
- (void)setLatestLinkQuality:(id)a3;
- (void)setLockdownModeEnabled:(BOOL)a3;
- (void)setNetworks:(id)a3;
- (void)setOtherNetworkVC:(id)a3;
- (void)setPowerState:(unint64_t)a3;
- (void)setPrivacyProxyFeatureEnabled:(BOOL)a3;
- (void)setPrivacyProxyFeatureTier:(int64_t)a3;
- (void)setRandomMACManager:(id)a3;
- (void)setScanForPersonalHotspots:(BOOL)a3;
- (void)setScanManager:(id)a3;
- (void)setScanMetricsManager:(id)a3;
- (void)setShouldShowDetailTapOnCurrentNetwork:(BOOL)a3;
- (void)setStateMonitor:(id)a3;
- (void)setViewController:(id)a3;
- (void)setViewControllerSupportsCurrentNetworkSubtitle:(BOOL)a3;
- (void)setViewProvider:(id)a3;
- (void)setVisibleContext:(id)a3;
- (void)setWifiClient:(id)a3;
- (void)startScanning;
- (void)stopScanning;
@end

@implementation WFNetworkListController

- (WFNetworkListController)initWithViewController:(id)a3
{
  return [(WFNetworkListController *)self initWithViewController:a3 viewProvider:0 client:0];
}

- (WFNetworkListController)initWithViewController:(id)a3 viewProvider:(id)a4
{
  return [(WFNetworkListController *)self initWithViewController:a3 viewProvider:a4 client:0];
}

- (WFNetworkListController)initWithViewController:(id)a3 viewProvider:(id)a4 client:(id)a5 knownNetworksManager:(id)a6
{
  id v10 = a6;
  v11 = [(WFNetworkListController *)self initWithViewController:a3 viewProvider:a4 client:a5];
  v12 = v11;
  if (v11) {
    [(WFNetworkListController *)v11 setKnownNetworksManager:v10];
  }

  return v12;
}

- (WFNetworkListController)initWithViewController:(id)a3 viewProvider:(id)a4 client:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = (WFClient *)a5;
  v43.receiver = self;
  v43.super_class = (Class)WFNetworkListController;
  v12 = [(WFNetworkListController *)&v43 init];
  v13 = v12;
  v14 = 0;
  if (v9 && v12)
  {
    v15 = NSProtocolFromString(&cfstr_Wfnetworklisti.isa);
    char v16 = [v9 conformsToProtocol:v15];

    if (v16)
    {
      p_viewController = (id *)&v13->_viewController;
      objc_storeStrong((id *)&v13->_viewController, a3);
      [(WFNetworkListing *)v13->_viewController setListDelegate:v13];
      p_viewProvider = (void **)&v13->_viewProvider;
      objc_storeStrong((id *)&v13->_viewProvider, a4);
      v13->_shouldShowDetailTapOnCurrentNetwork = 1;
      v13->_isRandomMACManageFeatureEnabled = _os_feature_enabled_impl();
      if (!v13->_viewProvider)
      {
        v19 = NSProtocolFromString(&cfstr_Wfnetworkviewp.isa);
        char v20 = [0 conformsToProtocol:v19];

        if ((v20 & 1) == 0)
        {
          objc_opt_class();
          objc_opt_isKindOfClass();
          id v21 = objc_alloc_init((Class)objc_opt_class());
          v22 = *p_viewProvider;
          *p_viewProvider = v21;
        }
      }
      if (![*p_viewController deviceCapability]) {
        [*p_viewController setDeviceCapability:WFCurrentDeviceCapability()];
      }
      v23 = v11;
      if (!v11) {
        v23 = objc_alloc_init(WFClient);
      }
      objc_storeStrong((id *)&v13->_wifiClient, v23);
      v24 = objc_alloc_init(WFDiagnosticsManager);
      diagnosticsManager = v13->_diagnosticsManager;
      v13->_diagnosticsManager = v24;

      v26 = [[WFNetworkListRandomMACManager alloc] initWithClient:v13->_wifiClient];
      randomMACManager = v13->_randomMACManager;
      v13->_randomMACManager = v26;

      v14 = [(WFClient *)v13->_wifiClient interface];
      if (v14)
      {
        objc_storeStrong((id *)&v13->_interface, v14);
        [(WFNetworkListController *)v13 _setupWithInterface:v13->_interface];
        [(WFNetworkListController *)v13 _updateViewControllerConnectedNetwork];
      }
      else
      {
        v41 = WFLogForCategory(0);
        os_log_type_t v42 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v41 && os_log_type_enabled(v41, v42))
        {
          *(_DWORD *)buf = 136315138;
          v45 = "-[WFNetworkListController initWithViewController:viewProvider:client:]";
          _os_log_impl(&dword_226071000, v41, v42, "%s: can't get WFInterface instance", buf, 0xCu);
        }
      }
      if (!v13->_interface) {
        [(WFNetworkListController *)v13 _setupWithoutInterface];
      }
      v28 = objc_alloc_init(WFAssociationContextQueue);
      associationContextQueue = v13->_associationContextQueue;
      v13->_associationContextQueue = v28;

      v30 = [MEMORY[0x263F08A00] defaultCenter];
      [v30 addObserver:v13 selector:sel__interfaceDidBecomeAvailable_ name:@"WFClientInterfaceAvailableNotification" object:0];

      v31 = [MEMORY[0x263F08A00] defaultCenter];
      [v31 addObserver:v13 selector:sel__clientRestartedNotification_ name:@"WFClientServerRestartedNotification" object:0];

      v32 = [MEMORY[0x263F08A00] defaultCenter];
      [v32 addObserver:v13 selector:sel__cellularOutrankNotification_ name:@"WFClientCellularOutrankWiFiNotification" object:0];

      if (objc_opt_class())
      {
        v33 = [MEMORY[0x263F526E0] shared];
        v13->_lockdownModeEnabled = [v33 enabled];
      }
      p_super = WFLogForCategory(0);
      os_log_type_t v35 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && p_super && os_log_type_enabled(p_super, v35))
      {
        v36 = "enabled";
        if (!v13->_lockdownModeEnabled) {
          v36 = "disabled";
        }
        *(_DWORD *)buf = 136315394;
        v45 = "-[WFNetworkListController initWithViewController:viewProvider:client:]";
        __int16 v46 = 2080;
        v47 = v36;
        _os_log_impl(&dword_226071000, p_super, v35, "%s: Lockdown mode is %s", buf, 0x16u);
      }
    }
    else
    {
      v39 = WFLogForCategory(0);
      os_log_type_t v40 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v39 && os_log_type_enabled(v39, v40))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v39, v40, "View Controller doesn't conform to WFNetworkListing protocol", buf, 2u);
      }

      v14 = 0;
      p_super = &v13->super;
      v23 = v11;
      v13 = 0;
    }
  }
  else
  {
    p_super = &v12->super;
    v23 = v11;
    v13 = 0;
  }

  v37 = v13;
  return v37;
}

- (WFNetworkListController)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WFNetworkListController init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (void)_setupWithInterface:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v4 = (WFNetworkListing *)a3;
  v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[WFNetworkListController _setupWithInterface:]";
    __int16 v55 = 2112;
    v56 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: interface %@", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  v7 = [WFWiFiStateMonitor alloc];
  v8 = [(WFNetworkListController *)self wifiClient];
  uint64_t v47 = MEMORY[0x263EF8330];
  uint64_t v48 = 3221225472;
  v49 = __47__WFNetworkListController__setupWithInterface___block_invoke;
  v50 = &unk_26478E658;
  objc_copyWeak(&v51, &location);
  id v9 = [(WFWiFiStateMonitor *)v7 initWithClient:v8 handler:&v47];
  stateMonitor = self->_stateMonitor;
  self->_stateMonitor = v9;

  [(WFWiFiStateMonitor *)self->_stateMonitor setIdentifier:@"com.apple.WiFiSettings", v47, v48, v49, v50];
  v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v11;

  v13 = self->_backgroundQueue;
  if (v13)
  {
    [(NSOperationQueue *)v13 setQualityOfService:9];
    [(WFNetworkListController *)self _setupGASControllerWithInterface:v4];
    v14 = [WFScanManager alloc];
    v15 = [(WFNetworkListController *)self wifiClient];
    char v16 = +[WFScanProxy scanProxyWithClient:v15];
    v17 = [(WFScanManager *)v14 initWithScanProxy:v16 delegate:self];
    scanManager = self->_scanManager;
    self->_scanManager = v17;

    if (self->_scanManager)
    {
      v19 = objc_alloc_init(WFHotspotInterface);
      hotspotInterface = self->_hotspotInterface;
      self->_hotspotInterface = v19;

      id v21 = self->_hotspotInterface;
      if (v21)
      {
        [(WFHotspotInterface *)v21 setDelegate:self];
        v22 = [[WFHealthManager alloc] initWithInterface:v4];
        healthManager = self->_healthManager;
        self->_healthManager = v22;

        if (self->_healthManager)
        {
          v24 = objc_alloc_init(WFScanMetricsManager);
          scanMetricsManager = self->_scanMetricsManager;
          self->_scanMetricsManager = v24;

          if (self->_scanMetricsManager)
          {
            self->_privacyProxyFeatureTier = 0;
            if ([(WFNetworkListController *)self isAirPortSettings])
            {
              self->_scanForPersonalHotspots = 1;
              [(WFNetworkListController *)self _updatePrivacyProxyFeatureEnabled];
            }
            self->_canScanForPersonalHotspots = 1;
            v26 = [(WFNetworkListController *)self wifiClient];
            -[WFNetworkListing setShowOtherNetwork:](self->_viewController, "setShowOtherNetwork:", [v26 isNetworkRestrictionActive] ^ 1);

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [(WFNetworkListController *)self _registerForApplicationNotifications];
            }
            v27 = [MEMORY[0x263F08A00] defaultCenter];
            [v27 addObserver:self selector:sel__ipStateDidChange_ name:@"WFIPMonitorStateChangedNotification" object:0];

            v28 = [MEMORY[0x263F08A00] defaultCenter];
            [v28 addObserver:self selector:sel__powerDidChangeNotification_ name:@"WFClientPowerStateChangedNotification" object:0];

            v29 = [MEMORY[0x263F08A00] defaultCenter];
            [v29 addObserver:self selector:sel__networkDidChangeNotification_ name:@"WFInterfaceNetworkChangedNotification" object:0];

            v30 = [MEMORY[0x263F08A00] defaultCenter];
            [v30 addObserver:self selector:sel__networkLinkQualityDidChangeNotification_ name:@"WFInterfaceLinkQualityNotification" object:0];

            v31 = [MEMORY[0x263F08A00] defaultCenter];
            [v31 addObserver:self selector:sel__networkRestrictionStateDidChange_ name:@"WFClientNetworkRestrictionPolicyDidChangeNotification" object:0];

            v32 = [MEMORY[0x263F08A00] defaultCenter];
            [v32 addObserver:self selector:sel__networkHealthIssuesDidChange_ name:@"WFHealthManagerHealthIssuesDidChangeNotification" object:self->_healthManager];

            v33 = [MEMORY[0x263F08A00] defaultCenter];
            [v33 addObserver:self selector:sel__powerModificationDisableStateDidChange_ name:@"WFClientPowerModificationStateChangedNotification" object:0];

            v34 = [MEMORY[0x263F08A00] defaultCenter];
            [v34 addObserver:self selector:sel__managedAppleIDStateDidChange_ name:@"WFClientManagedAppleIDStateChangedNotification" object:0];

            os_log_type_t v35 = [MEMORY[0x263F08A00] defaultCenter];
            [v35 addObserver:self selector:sel__wifiPropertyDidChanged_ name:@"WFClientUserInterfacePropertyChangedNotification" object:0];

            v36 = [MEMORY[0x263F08A00] defaultCenter];
            [v36 addObserver:self selector:sel__preferredNetworksDidChange_ name:@"WFClientPreferredNetworksDidChangeNotification" object:0];

            v37 = [MEMORY[0x263F08A00] defaultCenter];
            [v37 addObserver:self selector:sel__ipStateDidChange_ name:@"WFInterfaceIPAddressChangedNotification" object:0];

            if (![(WFNetworkListController *)self isSetup])
            {
              v38 = WFLogForCategory(0);
              os_log_type_t v39 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v38 && os_log_type_enabled(v38, v39))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_226071000, v38, v39, "Enabling auto join", buf, 2u);
              }

              os_log_type_t v40 = [(WFNetworkListController *)self wifiClient];
              [v40 setAutoJoinEnabled:1];
            }
            [(WFNetworkListController *)self setViewControllerSupportsCurrentNetworkSubtitle:objc_opt_respondsToSelector() & 1];
            if (![(WFNetworkListController *)self viewControllerSupportsCurrentNetworkSubtitle])
            {
              v41 = WFLogForCategory(0);
              os_log_type_t v42 = OSLogForWFLogLevel(3uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 3 && v41 && os_log_type_enabled(v41, v42))
              {
                viewController = self->_viewController;
                *(_DWORD *)buf = 136315394;
                v54 = "-[WFNetworkListController _setupWithInterface:]";
                __int16 v55 = 2112;
                v56 = viewController;
                _os_log_impl(&dword_226071000, v41, v42, "%s: %@ doesn't support currentNetworkSubtitle", buf, 0x16u);
              }
            }
            v44 = [(WFNetworkListController *)self wifiClient];
            unsigned int v45 = [v44 powered];

            if (self->_powerState == 3) {
              [(WFNetworkListController *)self setPowerState:v45];
            }
            else {
              self->_powerState = v45;
            }
            __int16 v46 = [(WFNetworkListController *)self viewController];
            [v46 deviceCapability];
            [(WFHealthManager *)self->_healthManager setIsChinaDevice:WFCapabilityIsChinaDevice()];

            [(WFNetworkListController *)self _refreshKnownHiddenNetworkNamesCache];
          }
        }
      }
    }
  }
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);
}

void __47__WFNetworkListController__setupWithInterface___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stateMonitorChangedStates:a3 oldState:a2];
}

- (void)_setupWithoutInterface
{
  self->_powerState = 3;
  [(WFNetworkListController *)self setPowerState:3];
  [(WFNetworkListController *)self _updateViewControllerDisabled];
}

- (void)_setupGASControllerWithInterface:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__WFNetworkListController__setupGASControllerWithInterface___block_invoke;
  v5[3] = &unk_26478E680;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v4 asyncHS20Supported:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __60__WFNetworkListController__setupGASControllerWithInterface___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v14 = 136315394;
    v15 = "-[WFNetworkListController _setupGASControllerWithInterface:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_226071000, v4, v5, "%s: HS20Supported %d", (uint8_t *)&v14, 0x12u);
  }

  objc_copyWeak((id *)&v14, (id *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)&v14);
  [WeakRetained setHS20Supported:a2];

  if (a2)
  {
    v7 = [WFGasQueryController alloc];
    v8 = [*(id *)(a1 + 32) wifiClient];
    id v9 = [v8 cInterface];
    uint64_t v10 = [(WFGasQueryController *)v7 initWithInterface:v9];
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 112);
    *(void *)(v11 + 112) = v10;

    id v13 = objc_loadWeakRetained((id *)&v14);
    [*(id *)(*(void *)(a1 + 32) + 112) setDelegate:v13];
  }
  objc_destroyWeak((id *)&v14);
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WFNetworkListController;
  [(WFNetworkListController *)&v4 dealloc];
}

- (void)_registerForApplicationNotifications
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[WFNetworkListController _registerForApplicationNotifications]";
    _os_log_impl(&dword_226071000, v3, v4, "%s", (uint8_t *)&v9, 0xCu);
  }

  os_log_type_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__applicationWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_226071000, v4, v5, "entered foreground", v11, 2u);
  }

  id v6 = [(WFNetworkListController *)self scanMetricsManager];
  [v6 reset];

  v7 = [(WFNetworkListController *)self viewController];
  v8 = NSProtocolFromString(&cfstr_Wfknownnetwork.isa);
  if ([v7 conformsToProtocol:v8])
  {
    int v9 = [(WFNetworkListController *)self viewController];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      return;
    }
    v7 = [(WFNetworkListController *)self viewController];
    [v7 knownNetworksWillEnterForeground];
  }
  else
  {
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226071000, v5, v6, "entered background", buf, 2u);
  }

  v7 = [(WFNetworkListController *)self scanMetricsManager];
  [v7 submit];

  [(WFNetworkListController *)self _cleanUpStatesForDismissal];
  v8 = [(WFNetworkListController *)self hotspotInterface];
  int v9 = [v8 isScanning];

  if (v9)
  {
    char v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = "-[WFNetworkListController _applicationDidEnterBackground:]";
      _os_log_impl(&dword_226071000, v10, v11, "%s: creating bg task to disable hotspot scanning", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v12 = [MEMORY[0x263F1C408] sharedApplication];
    id v13 = (void *)[v12 beginBackgroundTaskWithExpirationHandler:&__block_literal_global_1];

    int v14 = dispatch_get_global_queue(21, 0);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__WFNetworkListController__applicationDidEnterBackground___block_invoke_97;
    v15[3] = &unk_26478E6C8;
    objc_copyWeak(v16, (id *)buf);
    v16[1] = v13;
    dispatch_async(v14, v15);

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }
}

void __58__WFNetworkListController__applicationDidEnterBackground___block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = WFLogForCategory(0);
  os_log_type_t v1 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v0 && os_log_type_enabled(v0, v1))
  {
    int v2 = 136315138;
    v3 = "-[WFNetworkListController _applicationDidEnterBackground:]_block_invoke";
    _os_log_impl(&dword_226071000, v0, v1, "%s: failed to stop scanning", (uint8_t *)&v2, 0xCu);
  }
}

void __58__WFNetworkListController__applicationDidEnterBackground___block_invoke_97(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopHotspotScan];

  id v3 = [MEMORY[0x263F1C408] sharedApplication];
  [v3 endBackgroundTask:*(void *)(a1 + 40)];
}

- (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl(&dword_226071000, v4, v5, "did become active", v11, 2u);
  }

  [(WFNetworkListController *)self _updatePowerState];
  os_log_type_t v6 = [(WFNetworkListController *)self wifiClient];
  [v6 reloadConfiguration];

  v7 = [(WFNetworkListController *)self viewController];
  v8 = NSProtocolFromString(&cfstr_Wfknownnetwork.isa);
  if ([v7 conformsToProtocol:v8])
  {
    int v9 = [(WFNetworkListController *)self viewController];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      return;
    }
    v7 = [(WFNetworkListController *)self viewController];
    [v7 knownNetworksDidBecomeActive];
  }
  else
  {
  }
}

- (void)_applicationWillResignActive:(id)a3
{
  uint64_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)char v10 = 0;
    _os_log_impl(&dword_226071000, v4, v5, "will resign active", v10, 2u);
  }

  if ([(WFNetworkListController *)self _shouldPauseScanning]) {
    [(WFNetworkListController *)self _pauseScanning];
  }
  [(WFNetworkListController *)self _stopHotspotScan];
  [(WFNetworkListController *)self removeScanCache];
  os_log_type_t v6 = [(WFNetworkListController *)self viewController];
  v7 = NSProtocolFromString(&cfstr_Wfknownnetwork.isa);
  if ([v6 conformsToProtocol:v7])
  {
    v8 = [(WFNetworkListController *)self viewController];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      return;
    }
    os_log_type_t v6 = [(WFNetworkListController *)self viewController];
    [v6 knownNetworksWillResignActive];
  }
  else
  {
  }
}

- (void)_cleanUpStatesForDismissal
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (![(WFNetworkListController *)self isSetup])
  {
    id v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      int v20 = 136315138;
      id v21 = "-[WFNetworkListController _cleanUpStatesForDismissal]";
      _os_log_impl(&dword_226071000, v3, v4, "%s: enabling autojoin", (uint8_t *)&v20, 0xCu);
    }

    os_log_type_t v5 = [(WFNetworkListController *)self wifiClient];
    [v5 setAutoJoinEnabled:1];

    [(WFNetworkListController *)self _dismissVisibleContext];
    os_log_type_t v6 = [(WFNetworkListController *)self associationContext];

    if (v6)
    {
      v7 = WFLogForCategory(0);
      os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v7)
      {
        char v9 = v7;
        if (os_log_type_enabled(v9, v8))
        {
          char v10 = [(WFNetworkListController *)self associationContext];
          int v20 = 136315394;
          id v21 = "-[WFNetworkListController _cleanUpStatesForDismissal]";
          __int16 v22 = 2112;
          v23 = v10;
          _os_log_impl(&dword_226071000, v9, v8, "%s: association context %@", (uint8_t *)&v20, 0x16u);
        }
      }

      os_log_type_t v11 = [(WFNetworkListController *)self associationContext];
      uint64_t v12 = [v11 state];

      if (v12 == 2)
      {
        id v13 = WFLogForCategory(0);
        os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v13)
        {
          v15 = v13;
          if (os_log_type_enabled(v15, v14))
          {
            __int16 v16 = [(WFNetworkListController *)self associationContext];
            int v17 = [v16 networkName];
            int v20 = 136315394;
            id v21 = "-[WFNetworkListController _cleanUpStatesForDismissal]";
            __int16 v22 = 2112;
            v23 = v17;
            _os_log_impl(&dword_226071000, v15, v14, "%s: canceling association to %@ waiting on user input due to backgrounding", (uint8_t *)&v20, 0x16u);
          }
        }

        uint64_t v18 = [MEMORY[0x263F087E8] associationErrorWithReason:15];
        [(WFNetworkListController *)self _associationDidFinish:1 error:v18 network:0];
      }
      uint64_t v19 = [(WFNetworkListController *)self associationContextQueue];
      [v19 removeAll];

      [(WFNetworkListController *)self setAssociationContext:0];
    }
    [(WFNetworkListController *)self setKnownHiddenNetworkNames:0];
  }
}

- (void)_networkRestrictionStateDidChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = [(WFNetworkListController *)self wifiClient];
  int v5 = [v4 isNetworkRestrictionActive];

  os_log_type_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    int v21 = 136315394;
    __int16 v22 = "-[WFNetworkListController _networkRestrictionStateDidChange:]";
    __int16 v23 = 1024;
    int v24 = v5;
    _os_log_impl(&dword_226071000, v6, v7, "%s: network restriction did change (new state: %d)", (uint8_t *)&v21, 0x12u);
  }

  uint64_t v8 = v5 ^ 1u;
  char v9 = [(WFNetworkListController *)self viewController];
  [v9 setShowOtherNetwork:v8];

  char v10 = [(WFNetworkListController *)self viewController];
  [v10 refresh];

  os_log_type_t v11 = [(WFNetworkListController *)self scanManager];
  [v11 pause];

  if (v8)
  {
    int v20 = [(WFNetworkListController *)self scanManager];
    [v20 resume];

    [(WFNetworkListController *)self setCanScanForPersonalHotspots:v8];
    [(WFNetworkListController *)self _startHotspotScan];
  }
  else
  {
    uint64_t v12 = [(WFNetworkListController *)self gasController];
    [v12 removeAllProfiles];

    id v13 = [(WFNetworkListController *)self viewController];
    [v13 setNetworks:0];

    os_log_type_t v14 = [(WFNetworkListController *)self scanManager];
    [v14 resume];

    v15 = [(WFNetworkListController *)self scanManager];
    __int16 v16 = [(WFNetworkListController *)self networks];
    int v17 = [(WFNetworkListController *)self scanManager:v15 filterScanResults:v16];
    [(WFNetworkListController *)self setNetworks:v17];

    uint64_t v18 = [(WFNetworkListController *)self viewController];
    uint64_t v19 = [(WFNetworkListController *)self networks];
    [v18 setNetworks:v19];

    [(WFNetworkListController *)self setCanScanForPersonalHotspots:v8];
    [(WFNetworkListController *)self _stopHotspotScan];
  }
}

- (void)_powerModificationDisableStateDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = [(WFNetworkListController *)self wifiClient];
  uint64_t v5 = [v4 isPowerModificationDisabled];

  os_log_type_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = "Enabled";
    if (v5) {
      uint64_t v8 = "Disabled";
    }
    int v12 = 136315394;
    id v13 = "-[WFNetworkListController _powerModificationDisableStateDidChange:]";
    __int16 v14 = 2080;
    v15 = v8;
    _os_log_impl(&dword_226071000, v6, v7, "%s: Power Modification %s", (uint8_t *)&v12, 0x16u);
  }

  char v9 = [(WFNetworkListController *)self viewController];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    os_log_type_t v11 = [(WFNetworkListController *)self viewController];
    [v11 powerModificationStateDidChange:v5];
  }
}

- (void)_managedAppleIDStateDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = [(WFNetworkListController *)self wifiClient];
  uint64_t v5 = [v4 isManagedAppleID];

  os_log_type_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = "Non-Managed";
    if (v5) {
      uint64_t v8 = "Managed";
    }
    int v12 = 136315394;
    id v13 = "-[WFNetworkListController _managedAppleIDStateDidChange:]";
    __int16 v14 = 2080;
    v15 = v8;
    _os_log_impl(&dword_226071000, v6, v7, "%s: %s Account", (uint8_t *)&v12, 0x16u);
  }

  char v9 = [(WFNetworkListController *)self viewController];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    os_log_type_t v11 = [(WFNetworkListController *)self viewController];
    [v11 managedAppleIDStateChange:v5];
  }
}

- (void)removeScanCache
{
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "removing scan cache", v8, 2u);
  }

  [(WFNetworkListController *)self setNetworks:0];
  uint64_t v5 = [(WFNetworkListController *)self viewController];
  [v5 setNetworks:0];

  os_log_type_t v6 = [(WFNetworkListController *)self viewController];
  [v6 refresh];

  os_log_type_t v7 = [(WFNetworkListController *)self gasController];
  [v7 removeAllProfiles];

  [(WFNetworkListController *)self setFirstScanFinished:0];
}

- (void)_powerStateChanged
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(WFNetworkListController *)self wifiClient];
  -[WFNetworkListController setPowerState:](self, "setPowerState:", [v3 powered]);

  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    os_log_type_t v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      [(WFNetworkListController *)self powerState];
      os_log_type_t v7 = WFPowerStateToggleToString();
      int v10 = 136315394;
      os_log_type_t v11 = "-[WFNetworkListController _powerStateChanged]";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_226071000, v6, v5, "%s: power state changed to %@", (uint8_t *)&v10, 0x16u);
    }
  }

  [(WFNetworkListController *)self setPowerState:[(WFNetworkListController *)self powerState]];
  if ([(WFNetworkListController *)self powerState] == 1)
  {
    [(WFNetworkListController *)self _resumeScanning];
  }
  else
  {
    uint64_t v8 = [(WFNetworkListController *)self scanManager];
    [v8 stop];

    [(WFNetworkListController *)self _stopHotspotScan];
    [(WFNetworkListController *)self setNetworks:0];
    [(WFNetworkListController *)self setFirstScanFinished:0];
    char v9 = [(WFNetworkListController *)self associationContextQueue];
    [v9 removeAll];
  }
}

- (void)_updatePowerState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315138;
    char v9 = "-[WFNetworkListController _updatePowerState]";
    _os_log_impl(&dword_226071000, v3, v4, "%s: updating power state", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  os_log_type_t v5 = [(WFNetworkListController *)self wifiClient];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__WFNetworkListController__updatePowerState__block_invoke;
  v6[3] = &unk_26478E680;
  objc_copyWeak(&v7, (id *)buf);
  v6[4] = self;
  [v5 asyncPowered:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __44__WFNetworkListController__updatePowerState__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_log_type_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[WFNetworkListController _updatePowerState]_block_invoke";
    __int16 v31 = 1024;
    unsigned int v32 = a2;
    _os_log_impl(&dword_226071000, v6, v7, "%s: powered %d", buf, 0x12u);
  }

  uint64_t v8 = [WeakRetained interface];
  BOOL v9 = v8 == 0;

  if (v9) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = a2;
  }
  [WeakRetained setPowerState:v10];
  os_log_type_t v11 = [WeakRetained interface];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __44__WFNetworkListController__updatePowerState__block_invoke_111;
  v27[3] = &unk_26478E710;
  objc_copyWeak(&v28, v4);
  [v11 asyncCurrentNetwork:v27];

  if (a2)
  {
    __int16 v12 = [MEMORY[0x263F1C408] sharedApplication];
    BOOL v13 = [v12 applicationState] == 0;

    if (!v13)
    {
      uint64_t v14 = WFLogForCategory(0);
      os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v14 || !os_log_type_enabled(v14, v15)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      uint64_t v16 = "WiFi application status is not active";
      goto LABEL_19;
    }
    if ([WeakRetained isAssociating])
    {
      uint64_t v14 = WFLogForCategory(0);
      os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v14 || !os_log_type_enabled(v14, v15)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      uint64_t v16 = "not resuming scans due to in progress association";
LABEL_19:
      int v17 = v14;
      os_log_type_t v18 = v15;
      uint32_t v19 = 2;
LABEL_20:
      _os_log_impl(&dword_226071000, v17, v18, v16, buf, v19);
LABEL_21:

      goto LABEL_22;
    }
    int v20 = [*(id *)(a1 + 32) viewController];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      __int16 v22 = [*(id *)(a1 + 32) viewController];
      char v23 = [v22 networkListVisible];

      if ((v23 & 1) == 0)
      {
        uint64_t v14 = WFLogForCategory(0);
        os_log_type_t v26 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() < 3 || !v14 || !os_log_type_enabled(v14, v26)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136315138;
        v30 = "-[WFNetworkListController _updatePowerState]_block_invoke";
        uint64_t v16 = "%s: Skipping scanning for setup until wifi page is visible";
        int v17 = v14;
        os_log_type_t v18 = v26;
        uint32_t v19 = 12;
        goto LABEL_20;
      }
    }
    int v24 = WFLogForCategory(0);
    os_log_type_t v25 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v24 && os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[WFNetworkListController _updatePowerState]_block_invoke";
      _os_log_impl(&dword_226071000, v24, v25, "%s: resuming scans due to power state", buf, 0xCu);
    }

    [WeakRetained _resumeScanning];
  }
LABEL_22:
  objc_destroyWeak(&v28);
}

void __44__WFNetworkListController__updatePowerState__block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [WeakRetained isHS20Supported];
  if (v3)
  {
    if (v5)
    {
      if ([v3 isHotspot20])
      {
        os_log_type_t v6 = [v3 matchingKnownNetworkProfile];

        if (!v6)
        {
          os_log_type_t v7 = WFLogForCategory(0);
          os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
          {
            int v10 = 136315394;
            os_log_type_t v11 = "-[WFNetworkListController _updatePowerState]_block_invoke";
            __int16 v12 = 2112;
            id v13 = v3;
            _os_log_impl(&dword_226071000, v7, v8, "%s: resolving profile for %@", (uint8_t *)&v10, 0x16u);
          }

          BOOL v9 = [WeakRetained gasController];
          [v9 resolveProfileForNetwork:v3 handler:&__block_literal_global_115 force:1];
        }
      }
    }
  }
}

void __44__WFNetworkListController__updatePowerState__block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  os_log_type_t v6 = WFLogForCategory(5uLL);
  os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_226071000, v6, v7, "resolved profile %@ error %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)startScanning
{
  id v3 = WFLogForCategory(6uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "start scanning", v6, 2u);
  }

  [(WFNetworkListController *)self _startHotspotScan];
  id v5 = [(WFNetworkListController *)self scanManager];
  [v5 start];
}

- (void)stopScanning
{
  id v3 = WFLogForCategory(6uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "stop scanning", v6, 2u);
  }

  [(WFNetworkListController *)self _stopHotspotScan];
  id v5 = [(WFNetworkListController *)self scanManager];
  [v5 stop];
}

- (void)_resumeScanning
{
  id v3 = WFLogForCategory(6uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "resume scans", v6, 2u);
  }

  [(WFNetworkListController *)self _startHotspotScan];
  id v5 = [(WFNetworkListController *)self scanManager];
  [v5 resume];
}

- (BOOL)_shouldPauseScanning
{
  id v3 = [(WFNetworkListController *)self scanManager];
  if ([v3 state] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(WFNetworkListController *)self scanManager];
    BOOL v4 = [v5 state] == 2;
  }
  return v4;
}

- (void)_pauseScanning
{
  id v2 = [(WFNetworkListController *)self scanManager];
  [v2 pause];
}

- (void)_startHotspotScan
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(WFNetworkListController *)self scanForPersonalHotspots]
    && [(WFNetworkListController *)self canScanForPersonalHotspots])
  {
    id v6 = [(WFNetworkListController *)self hotspotInterface];
    [v6 startBrowsing];
  }
  else
  {
    id v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
    {
      id v5 = v3;
      if (os_log_type_enabled(v5, v4))
      {
        *(_DWORD *)buf = 136315650;
        int v8 = "-[WFNetworkListController _startHotspotScan]";
        __int16 v9 = 1024;
        BOOL v10 = [(WFNetworkListController *)self scanForPersonalHotspots];
        __int16 v11 = 1024;
        BOOL v12 = [(WFNetworkListController *)self canScanForPersonalHotspots];
        _os_log_impl(&dword_226071000, v5, v4, "%s: hotspot scanning disabled (scan %d, canScan %d)", buf, 0x18u);
      }
    }
  }
}

- (void)_stopHotspotScan
{
  id v2 = [(WFNetworkListController *)self hotspotInterface];
  [v2 stopBrowsing];
}

- (void)_updateViewControllerScanResults
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__WFNetworkListController__updateViewControllerScanResults__block_invoke;
  block[3] = &unk_26478E528;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__WFNetworkListController__updateViewControllerScanResults__block_invoke(uint64_t a1)
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  os_log_type_t v1 = [*(id *)(a1 + 32) networks];

  id v2 = (void *)MEMORY[0x263EFF9C0];
  if (v1)
  {
    id v3 = *(void **)(a1 + 32);
    os_log_type_t v4 = [v3 scanManager];
    id v5 = [*(id *)(a1 + 32) networks];
    id v6 = [v3 scanManager:v4 filterScanResults:v5];
    v93 = [v2 setWithSet:v6];
  }
  else
  {
    v93 = [MEMORY[0x263EFF9C0] set];
  }
  os_log_type_t v7 = [*(id *)(a1 + 32) hotspotInterface];
  v94 = [v7 networks];

  if (v94)
  {
    v97 = (void *)[v93 mutableCopy];
    v104 = (void *)[v97 mutableCopy];
    v105 = (void *)[v94 mutableCopy];
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id obj = v94;
    uint64_t v98 = [obj countByEnumeratingWithState:&v119 objects:v133 count:16];
    if (v98)
    {
      uint64_t v96 = *(void *)v120;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v120 != v96)
          {
            uint64_t v9 = v8;
            objc_enumerationMutation(obj);
            uint64_t v8 = v9;
          }
          uint64_t v100 = v8;
          BOOL v10 = (void *)MEMORY[0x263F08A98];
          v106 = *(void **)(*((void *)&v119 + 1) + 8 * v8);
          __int16 v11 = [v106 ssid];
          BOOL v12 = [v10 predicateWithFormat:@"ssid == %@", v11];
          v101 = [v105 filteredSetUsingPredicate:v12];

          if ((unint64_t)[v101 count] >= 2)
          {
            uint64_t v13 = WFLogForCategory(0);
            os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v13, v14, "More than one HS of same name nearby!", buf, 2u);
            }

            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v130 = __Block_byref_object_copy_;
            v131 = __Block_byref_object_dispose_;
            v132 = &stru_26D9BFD58;
            v118[0] = MEMORY[0x263EF8330];
            v118[1] = 3221225472;
            v118[2] = __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_127;
            v118[3] = &unk_26478E738;
            v118[4] = buf;
            [v101 enumerateObjectsUsingBlock:v118];
            os_log_type_t v15 = WFLogForCategory(0);
            os_log_type_t v16 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v16))
            {
              int v17 = *(const char **)(*(void *)&buf[8] + 40);
              *(_DWORD *)v124 = 138412290;
              v125 = v17;
              _os_log_impl(&dword_226071000, v15, v16, "Hotspot networks: %@", v124, 0xCu);
            }

            long long v116 = 0u;
            long long v117 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            id v18 = v101;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v114 objects:v128 count:16];
            if (v19)
            {
              uint64_t v20 = 0;
              uint64_t v21 = *(void *)v115;
              do
              {
                uint64_t v22 = 0;
                uint64_t v23 = -v20;
                uint64_t v102 = v20 + v19;
                do
                {
                  if (*(void *)v115 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  int v24 = *(void **)(*((void *)&v114 + 1) + 8 * v22);
                  if (v24) {
                    BOOL v25 = v23 == v22;
                  }
                  else {
                    BOOL v25 = 1;
                  }
                  if (v25)
                  {
                    os_log_type_t v26 = WFLogForCategory(0);
                    os_log_type_t v27 = OSLogForWFLogLevel(4uLL);
                    if ((unint64_t)WFCurrentLogLevel() >= 4 && v26)
                    {
                      id v28 = v26;
                      if (os_log_type_enabled(v28, v27))
                      {
                        v29 = [v24 ssid];
                        uint64_t v30 = [v24 uniqueIdentifier];
                        *(_DWORD *)v124 = 138412546;
                        v125 = v29;
                        __int16 v126 = 2048;
                        uint64_t v127 = v30;
                        _os_log_impl(&dword_226071000, v28, v27, "Shown hotspot: %@, uniqueidentifier: %lu\n", v124, 0x16u);
                      }
                    }
                  }
                  else
                  {
                    [v105 removeObject:*(void *)(*((void *)&v114 + 1) + 8 * v22)];
                  }
                  ++v22;
                }
                while (v19 != v22);
                uint64_t v19 = [v18 countByEnumeratingWithState:&v114 objects:v128 count:16];
                uint64_t v20 = v102;
              }
              while (v19);
            }

            _Block_object_dispose(buf, 8);
          }
          __int16 v31 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v106, "uniqueIdentifier"));
          unsigned int v32 = [WFNetworkProfile alloc];
          uint64_t v33 = [*(id *)(a1 + 32) interface];
          v34 = [v33 currentNetwork];
          os_log_type_t v35 = [v34 matchingKnownNetworkProfile];
          v103 = [(WFNetworkProfile *)v32 initWithCoreWiFiProfile:v35];

          if (v106)
          {
            if (v103)
            {
              v36 = [(WFNetworkProfile *)v103 hotspotDeviceIdentifier];
              int v37 = [v36 isEqualToString:v31];

              if (v37)
              {
                v38 = WFLogForCategory(0);
                os_log_type_t v39 = OSLogForWFLogLevel(4uLL);
                if ((unint64_t)WFCurrentLogLevel() >= 4 && v38 && os_log_type_enabled(v38, v39))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_226071000, v38, v39, "Removing current connected hotspot from scan results", buf, 2u);
                }

                [v105 removeObject:v106];
              }
            }
          }
          long long v113 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v110 = 0u;
          id v40 = v97;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v110 objects:v123 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v111;
            do
            {
              for (uint64_t i = 0; i != v41; ++i)
              {
                if (*(void *)v111 != v42) {
                  objc_enumerationMutation(v40);
                }
                v44 = *(void **)(*((void *)&v110 + 1) + 8 * i);
                if (v44)
                {
                  unsigned int v45 = [*(id *)(*((void *)&v110 + 1) + 8 * i) ssid];
                  __int16 v46 = [v106 ssid];
                  if ([v45 isEqualToString:v46])
                  {
                    int v47 = [v44 iOSHotspot];

                    if (v47)
                    {
                      uint64_t v48 = WFLogForCategory(0);
                      os_log_type_t v49 = OSLogForWFLogLevel(4uLL);
                      if ((unint64_t)WFCurrentLogLevel() >= 4 && v48)
                      {
                        v50 = v48;
                        if (os_log_type_enabled(v50, v49))
                        {
                          id v51 = [v106 ssid];
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v51;
                          _os_log_impl(&dword_226071000, v50, v49, "Removing AP record for hotspot ssid: %@", buf, 0xCu);
                        }
                      }

                      [v104 removeObject:v44];
                    }
                  }
                  else
                  {
                  }
                }
              }
              uint64_t v41 = [v40 countByEnumeratingWithState:&v110 objects:v123 count:16];
            }
            while (v41);
          }

          uint64_t v8 = v100 + 1;
        }
        while (v100 + 1 != v98);
        uint64_t v98 = [obj countByEnumeratingWithState:&v119 objects:v133 count:16];
      }
      while (v98);
    }

    v52 = WFLogForCategory(0);
    os_log_type_t v53 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v52)
    {
      v54 = v52;
      if (os_log_type_enabled(v54, v53))
      {
        uint64_t v55 = [v105 count];
        uint64_t v56 = [v104 count];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v55;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v56;
        _os_log_impl(&dword_226071000, v54, v53, "Hotspots count: %lu, AP count: %lu", buf, 0x16u);
      }
    }
    uint64_t v57 = (void *)[v104 mutableCopy];
    [v57 unionSet:v105];
  }
  else
  {
    uint64_t v57 = v93;
  }
  if ([*(id *)(a1 + 32) isAssociating])
  {
    v58 = [*(id *)(a1 + 32) associationContext];
    BOOL v59 = v58 == 0;

    if (!v59)
    {
      v60 = WFLogForCategory(0);
      os_log_type_t v61 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v60 && os_log_type_enabled(v60, v61))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[WFNetworkListController _updateViewControllerScanResults]_block_invoke";
        _os_log_impl(&dword_226071000, v60, v61, "%s: update during association", buf, 0xCu);
      }

      v62 = [*(id *)(a1 + 32) associationContext];
      v63 = [v62 network];
      if (v63)
      {
        if ([*(id *)(a1 + 32) isAirPortSettings])
        {
          v64 = [*(id *)(a1 + 32) associationContext];
          v65 = [v64 network];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            goto LABEL_109;
          }
        }
        else
        {
        }
        v84 = WFLogForCategory(0);
        os_log_type_t v85 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v84)
        {
          v86 = v84;
          if (os_log_type_enabled(v86, v85))
          {
            v87 = [*(id *)(a1 + 32) associationContext];
            v88 = [v87 network];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[WFNetworkListController _updateViewControllerScanResults]_block_invoke";
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v88;
            _os_log_impl(&dword_226071000, v86, v85, "%s: removing associationCtx network %{public}@ from scan results", buf, 0x16u);
          }
        }

        v62 = [*(id *)(a1 + 32) associationContext];
        v89 = [v62 network];
        [v57 removeObject:v89];
      }
      goto LABEL_108;
    }
  }
  v67 = [*(id *)(a1 + 32) interface];
  v68 = [v67 currentNetwork];

  if (v68)
  {
    v69 = [*(id *)(a1 + 32) interface];
    v62 = [v69 currentNetwork];

    if (v62)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v130 = __Block_byref_object_copy_;
      v131 = __Block_byref_object_dispose_;
      v132 = (__CFString *)objc_opt_new();
      v109[0] = MEMORY[0x263EF8330];
      v109[1] = 3221225472;
      v109[2] = __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_138;
      v109[3] = &unk_26478E760;
      v109[4] = *(void *)(a1 + 32);
      v109[5] = buf;
      [v57 enumerateObjectsUsingBlock:v109];
      if ([*(id *)(*(void *)&buf[8] + 40) count])
      {
        v70 = WFLogForCategory(0);
        os_log_type_t v71 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v70 && os_log_type_enabled(v70, v71))
        {
          uint64_t v72 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v124 = 136315394;
          v125 = "-[WFNetworkListController _updateViewControllerScanResults]_block_invoke_2";
          __int16 v126 = 2112;
          uint64_t v127 = v72;
          _os_log_impl(&dword_226071000, v70, v71, "%s: networks to remove from scan list='%@'", v124, 0x16u);
        }
      }
      v73 = *(void **)(*(void *)&buf[8] + 40);
      v107[0] = MEMORY[0x263EF8330];
      v107[1] = 3221225472;
      v107[2] = __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_140;
      v107[3] = &unk_26478E788;
      id v108 = v57;
      [v73 enumerateObjectsUsingBlock:v107];
      if ([v62 isHotspot20])
      {
        v74 = [v62 matchingKnownNetworkProfile];
        v75 = v74;
        if (v74)
        {
          v76 = [v74 displayedOperatorName];
          v77 = [*(id *)(a1 + 32) viewController];
          v78 = [v77 currentNetwork];
          [v78 setHotspot20Name:v76];
        }
        else
        {
          v76 = WFLogForCategory(0);
          os_log_type_t v92 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v76 && os_log_type_enabled(v76, v92))
          {
            *(_DWORD *)v124 = 136315394;
            v125 = "-[WFNetworkListController _updateViewControllerScanResults]_block_invoke_2";
            __int16 v126 = 2112;
            uint64_t v127 = (uint64_t)v62;
            _os_log_impl(&dword_226071000, v76, v92, "%s: no profile for network='%@'", v124, 0x16u);
          }
        }
      }
      v79 = [*(id *)(a1 + 32) viewController];
      v80 = [v79 currentNetwork];
      char v81 = [v80 isEqual:v62];

      if ((v81 & 1) == 0)
      {
        v82 = WFLogForCategory(0);
        os_log_type_t v83 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v82 && os_log_type_enabled(v82, v83))
        {
          *(_DWORD *)v124 = 136315138;
          v125 = "-[WFNetworkListController _updateViewControllerScanResults]_block_invoke";
          _os_log_impl(&dword_226071000, v82, v83, "%s: view controller current network mismatch, force update", v124, 0xCu);
        }

        [*(id *)(a1 + 32) _updateViewControllerConnectedNetwork:v62];
      }

      _Block_object_dispose(buf, 8);
    }
LABEL_108:
  }
LABEL_109:
  v90 = [*(id *)(a1 + 32) viewController];
  [v90 setNetworks:v57];

  v91 = [*(id *)(a1 + 32) scanMetricsManager];
  [v91 ingestScanResults:v57];
}

void __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_127(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  os_log_type_t v4 = NSString;
  id v5 = a2;
  id v11 = [v5 ssid];
  uint64_t v6 = [v5 uniqueIdentifier];

  os_log_type_t v7 = [v4 stringWithFormat:@"network ssid: %@, uniqueidentifier: %lu\n", v11, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_138(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) interface];
  os_log_type_t v4 = [v3 currentNetwork];
  id v5 = [v4 ssid];

  uint64_t v6 = [v7 ssid];
  LODWORD(v4) = [v6 isEqualToString:v5];

  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

uint64_t __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_140(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObject:a2];
}

- (BOOL)_canScanForHiddenNetwork:(id)a3
{
  return 1;
}

- (void)scanManagerScanningWillStart:(id)a3
{
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "scanning started", v5, 2u);
  }
}

- (void)scanManager:(id)a3 stateDidChange:(int64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__WFNetworkListController_scanManager_stateDidChange___block_invoke;
  v4[3] = &unk_26478E500;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __54__WFNetworkListController_scanManager_stateDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    os_log_type_t v4 = *(void **)(a1 + 32);
    BOOL v5 = *(void *)(a1 + 40) == 2;
    id v6 = [v4 viewController];
    [v6 setScanning:v5];
  }
}

- (void)scanManager:(id)a3 updatedPartialResults:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a4;
  unsigned int v32 = self;
  id v6 = [(WFNetworkListController *)self networks];
  id v7 = (void *)[v6 mutableCopy];

  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF9C0] set];
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    uint64_t v13 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        os_log_type_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        os_log_type_t v16 = [v15 ssid];
        int v17 = [v8 objectForKey:v16];

        if (!v17)
        {
          id v18 = [v15 ssid];
          [v8 setObject:v13 forKey:v18];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  __int16 v31 = v7;
  uint64_t v19 = [v7 allObjects];
  uint64_t v20 = (void *)[v19 mutableCopy];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * j);
        if (v26)
        {
          os_log_type_t v27 = [*(id *)(*((void *)&v33 + 1) + 8 * j) ssid];
          id v28 = [v8 objectForKey:v27];

          if (v28) {
            [v20 removeObject:v26];
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);
  }

  v29 = [MEMORY[0x263EFF9C0] setWithArray:v20];

  uint64_t v30 = [v9 allObjects];
  [v29 addObjectsFromArray:v30];

  [(WFNetworkListController *)v32 setNetworks:v29];
  [(WFNetworkListController *)v32 _updateViewControllerScanResults];
}

- (void)scanManagerScanningDidFinish:(id)a3 withResults:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__WFNetworkListController_scanManagerScanningDidFinish_withResults_error___block_invoke;
  block[3] = &unk_26478E7B0;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__WFNetworkListController_scanManagerScanningDidFinish_withResults_error___block_invoke(id *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] viewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    os_log_type_t v4 = [a1[4] viewController];
    [v4 setScanning:0];
  }
  id v5 = a1[5];
  if ([a1[6] code] == 16 || objc_msgSend(a1[6], "code") == 37)
  {
    id v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
    {
      id v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        uint64_t v9 = [a1[6] code];
        int v32 = 136315394;
        long long v33 = "-[WFNetworkListController scanManagerScanningDidFinish:withResults:error:]_block_invoke";
        __int16 v34 = 2048;
        *(void *)long long v35 = v9;
        _os_log_impl(&dword_226071000, v8, v7, "%s: scan error (%ld), not updating UI scan list", (uint8_t *)&v32, 0x16u);
      }
    }
    id v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10)
    {
      id v12 = v10;
      if (os_log_type_enabled(v12, v11))
      {
        id v13 = [a1[4] networks];
        int v32 = 136315394;
        long long v33 = "-[WFNetworkListController scanManagerScanningDidFinish:withResults:error:]_block_invoke";
        __int16 v34 = 2112;
        *(void *)long long v35 = v13;
        _os_log_impl(&dword_226071000, v12, v11, "%s: current networks %@", (uint8_t *)&v32, 0x16u);
      }
    }

    uint64_t v14 = [a1[4] networks];

    id v5 = (id)v14;
  }
  [a1[4] setNetworks:v5];
  os_log_type_t v15 = [a1[5] hs20Networks];
  if ([a1[4] knownNetworksContainsHS20Networks])
  {
    int v16 = 1;
  }
  else
  {
    int v17 = [a1[4] wifiClient];
    int v16 = [v17 showAllHS20Networks];
  }
  int v18 = [a1[4] isHS20Supported];
  if (v15)
  {
    uint64_t v19 = WFLogForCategory(0);
    os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v19 && os_log_type_enabled(v19, v20))
    {
      int v32 = 136315906;
      long long v33 = "-[WFNetworkListController scanManagerScanningDidFinish:withResults:error:]_block_invoke";
      __int16 v34 = 1024;
      *(_DWORD *)long long v35 = v18;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = v16;
      __int16 v36 = 2112;
      long long v37 = v15;
      _os_log_impl(&dword_226071000, v19, v20, "%s: hs20Supported %d hs20ProfilesInstalled %d hs20 networks found in scan: %@", (uint8_t *)&v32, 0x22u);
    }
  }
  if (v18)
  {
    int v21 = [v15 count] ? v16 : 0;
    if (v21 == 1)
    {
      uint64_t v22 = [a1[4] gasController];
      [v22 resolveProfilesForNetworks:v15];
    }
  }
  [a1[4] _updateViewControllerScanResults];
  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1[5], "count"));
  [v23 setValue:v24 forKey:@"count"];

  BOOL v25 = [MEMORY[0x263F08A00] defaultCenter];
  [v25 postNotificationName:@"WFNetworkListControllerScanDidFinishNotification" object:a1[4] userInfo:v23];

  if (!a1[6])
  {
    uint64_t v26 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v26 && os_log_type_enabled(v26, v27))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_226071000, v26, v27, "Remove all cache request sent to random manager because of a successful full cycle of scan!", (uint8_t *)&v32, 2u);
    }

    id v28 = [a1[4] randomMACManager];
    v29 = [a1[4] interface];
    uint64_t v30 = [v29 currentNetwork];
    __int16 v31 = [v30 ssid];
    [v28 resetCacheWithCurrentNetworkName:v31];
  }
}

- (void)scanManager:(id)a3 didFindHotspotHelperNetworks:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 136315394;
    long long v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
    __int16 v34 = 2112;
    id v35 = v5;
    _os_log_impl(&dword_226071000, v6, v7, "%s: found hotspot helper networks %@", buf, 0x16u);
  }

  if (!v5)
  {
    id v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v23 || !os_log_type_enabled(v23, v24)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136315138;
    long long v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
    BOOL v25 = "%s: nil helper networks";
    goto LABEL_37;
  }
  id v8 = [(WFNetworkListController *)self networks];

  if (!v8)
  {
    id v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v23 || !os_log_type_enabled(v23, v24)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136315138;
    long long v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
    BOOL v25 = "%s: nil networks";
LABEL_37:
    _os_log_impl(&dword_226071000, v23, v24, v25, buf, 0xCu);
LABEL_38:

    uint64_t v9 = 0;
    goto LABEL_28;
  }
  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v26 = v5;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        os_log_type_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        int v16 = [(WFNetworkListController *)self networks];
        int v17 = [v15 ssid];
        int v18 = [v16 scanRecordWithSSID:v17];

        if (v18)
        {
          [v9 addObject:v18];
        }
        else
        {
          uint64_t v19 = WFLogForCategory(0);
          os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v19 && os_log_type_enabled(v19, v20))
          {
            *(_DWORD *)buf = 136315394;
            long long v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
            __int16 v34 = 2112;
            id v35 = v15;
            _os_log_impl(&dword_226071000, v19, v20, "%s no matching scan record for helper network %@", buf, 0x16u);
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    int v21 = WFLogForCategory(0);
    os_log_type_t v22 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v21 && os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 136315394;
      long long v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl(&dword_226071000, v21, v22, "%s: updating views for %@", buf, 0x16u);
    }

    [(WFNetworkListController *)self _updateViewsForNetworks:v9];
  }
  id v5 = v26;
LABEL_28:
}

- (id)scanManager:(id)a3 filterScanResults:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a4;
  __int16 v31 = self;
  id v6 = [(WFNetworkListController *)self wifiClient];
  int v7 = [v6 isNetworkRestrictionActive];

  if (v7)
  {
    long long v30 = (void *)[v5 mutableCopy];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v28 = v5;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v32 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v12 = [v11 matchingKnownNetworkProfile];
          if (!v12) {
            goto LABEL_9;
          }
          uint64_t v13 = (void *)v12;
          uint64_t v14 = [(WFNetworkListController *)v31 wifiClient];
          os_log_type_t v15 = [v14 whitelistingUUID];
          int v16 = [v11 matchingKnownNetworkProfile];
          int v17 = [v16 OSSpecificAttributes];
          int v18 = [v17 objectForKeyedSubscript:@"PolicyUUID"];
          char v19 = [v15 isEqualToString:v18];

          if ((v19 & 1) == 0)
          {
LABEL_9:
            os_log_type_t v20 = WFLogForCategory(0);
            os_log_type_t v21 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v20)
            {
              os_log_type_t v22 = v20;
              if (os_log_type_enabled(v22, v21))
              {
                id v23 = [(WFNetworkListController *)v31 wifiClient];
                os_log_type_t v24 = [v23 whitelistingUUID];
                *(_DWORD *)buf = 136315650;
                uint64_t v38 = "-[WFNetworkListController scanManager:filterScanResults:]";
                __int16 v39 = 2112;
                long long v40 = v11;
                __int16 v41 = 2112;
                uint64_t v42 = v24;
                _os_log_impl(&dword_226071000, v22, v21, "%s: disregarding network='%@' no matching policyUUID (%@)", buf, 0x20u);
              }
            }

            [v30 removeObject:v11];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v9);
    }

    id v25 = v30;
    id v26 = v25;
    id v5 = v28;
  }
  else
  {
    id v25 = 0;
    id v26 = v5;
  }

  return v26;
}

- (void)scanManager:(id)a3 willStartScanRequest:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = WFLogForCategory(6uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "scan request: %@ started", (uint8_t *)&v7, 0xCu);
  }
}

- (void)scanManager:(id)a3 didFinishScanRequest:(id)a4 results:(id)a5 error:(id)a6 timeElapsed:(double)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = WFLogForCategory(6uLL);
  os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v14)
  {
    int v16 = v14;
    if (os_log_type_enabled(v16, v15))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = v11;
      __int16 v32 = 2048;
      uint64_t v33 = [v12 count];
      __int16 v34 = 2048;
      double v35 = a7;
      _os_log_impl(&dword_226071000, v16, v15, "scan request: %@ finished with %lu results in %f sec", buf, 0x20u);
    }
  }
  int v17 = [v11 ssid];

  if (v17) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = [v11 channelListIncludesTwoFour] ^ 1;
  }
  uint64_t v28 = v18;
  char v19 = +[WFMetricsManager sharedManager];
  os_log_type_t v20 = [WFScanPerformanceEvent alloc];
  BOOL v21 = [(WFNetworkListController *)self firstScanFinished];
  uint64_t v22 = [v12 count];
  long long v29 = v12;
  id v23 = self;
  if (v13)
  {
    os_log_type_t v24 = v13;
    id v13 = (id)[v13 code];
  }
  else
  {
    os_log_type_t v24 = 0;
  }
  uint64_t v25 = [v11 lowPriorityScan];
  LOBYTE(v27) = [v11 applyRssiThresholdFilter];
  id v26 = [(WFScanPerformanceEvent *)v20 initWithScanReason:v28 timeElasped:(unint64_t)a7 firstScan:!v21 results:v22 errorCode:v13 lowPriority:v25 rssiFilter:v27];
  [v19 processEvent:v26];

  [(WFNetworkListController *)v23 setFirstScanFinished:1];
}

- (BOOL)isAssociating
{
  char v3 = [(WFNetworkListController *)self associationContext];
  if (v3)
  {
    id v4 = [(WFNetworkListController *)self associationContext];
    if ([v4 state] == 1)
    {
      BOOL v5 = 1;
    }
    else
    {
      os_log_type_t v6 = [(WFNetworkListController *)self associationContext];
      BOOL v5 = [v6 state] == 2;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_associateToScanRecord:(id)a3
{
  id v4 = a3;
  if (-[WFNetworkListController _canStartAssociationToNetwork:](self, "_canStartAssociationToNetwork:")) {
    [(WFNetworkListController *)self _associateToScanRecord:v4 profile:0];
  }
}

- (void)_associateToScanRecord:(id)a3 profile:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = WFLogForCategory(5uLL);
  os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    id v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      id v11 = [v6 ssid];
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v11;
      _os_log_impl(&dword_226071000, v10, v9, "{ASSOC+} association started to %@", buf, 0xCu);
    }
  }

  if ([(WFNetworkListController *)self isAssociating])
  {
    id v12 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v12)
    {
      uint64_t v14 = v12;
      if (os_log_type_enabled(v14, v13))
      {
        os_log_type_t v15 = [(WFNetworkListController *)self associationContext];
        int v16 = [v15 stateDescription];
        int v17 = [(WFNetworkListController *)self associationContext];
        uint64_t v18 = [v17 networkName];
        *(_DWORD *)buf = 136315650;
        uint64_t v44 = "-[WFNetworkListController _associateToScanRecord:profile:]";
        __int16 v45 = 2112;
        __int16 v46 = v16;
        __int16 v47 = 2112;
        uint64_t v48 = v18;
        _os_log_impl(&dword_226071000, v14, v13, "%s association state is <%@> with network %@", buf, 0x20u);
      }
    }
  }
  BOOL v19 = [(WFNetworkListController *)self _shouldPauseScanning];
  os_log_type_t v20 = WFLogForCategory(0);
  os_log_type_t v21 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v20 && os_log_type_enabled(v20, v21))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v44 = "-[WFNetworkListController _associateToScanRecord:profile:]";
    __int16 v45 = 1024;
    LODWORD(v46) = v19;
    _os_log_impl(&dword_226071000, v20, v21, "%s- should pause scanning %d", buf, 0x12u);
  }

  if (v19) {
    [(WFNetworkListController *)self _pauseScanning];
  }
  uint64_t v22 = [(WFNetworkListController *)self viewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  os_log_type_t v24 = [(WFNetworkListController *)self viewController];
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    __int16 v39 = __58__WFNetworkListController__associateToScanRecord_profile___block_invoke;
    long long v40 = &unk_26478E7D8;
    __int16 v41 = self;
    id v42 = v6;
    dispatch_async(MEMORY[0x263EF83A0], &v37);
  }
  else
  {
    id v26 = [(WFNetworkListController *)self viewController];
    [v26 setCurrentNetwork:v6];
  }
  if ([(WFNetworkListController *)self viewControllerSupportsCurrentNetworkSubtitle])
  {
    uint64_t v27 = [(WFNetworkListController *)self viewController];
    [v27 setCurrentNetworkSubtitle:0];
  }
  uint64_t v28 = [(WFNetworkListController *)self viewController];
  char v29 = objc_opt_respondsToSelector();

  [v6 scaledRSSI];
  int v31 = v30;
  if (v29)
  {
    uint64_t v32 = WFSignalBarsFromScaledRSSI();
    uint64_t v33 = [(WFNetworkListController *)self viewController];
    [v33 setCurrentNetworkSignalBars:v32];
  }
  else
  {
    uint64_t v33 = [(WFNetworkListController *)self viewController];
    LODWORD(v34) = v31;
    [v33 setCurrentNetworkScaledRSSI:v34];
  }

  double v35 = [(WFNetworkListController *)self viewController];
  [v35 setCurrentNetworkState:1];

LABEL_32:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(WFNetworkListController *)self _associateToHotspotDevice:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = v6;
      if ([v36 isUnconfiguredAccessory])
      {
        [(WFNetworkListController *)self _associateToUnconfiguredAccessory:v36];
      }
      else if ([v36 isHotspot20] {
             && [(WFNetworkListController *)self isHS20Supported])
      }
      {
        [(WFNetworkListController *)self _associateToHS20Network:v36];
      }
      else if ([v36 isEnterprise])
      {
        [(WFNetworkListController *)self _associateToEnterpriseNetwork:v36 profile:v7];
      }
      else
      {
        [(WFNetworkListController *)self _associateToNetwork:v36 profile:v7];
      }
    }
  }
}

void __58__WFNetworkListController__associateToScanRecord_profile___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) viewController];
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = [*(id *)(a1 + 32) interface];
  id v4 = [v3 currentNetwork];
  [v5 setCurrentNetwork:v2 previousNetwork:v4 reason:1];
}

- (BOOL)_isChannelAllowedForScanPerCurrentLocale:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(WFNetworkListController *)self interface];
  id v5 = [v4 deviceScanChannelsPerCurLocale];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) channel] == a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)_associateToHotspotDevice:(id)a3
{
  id v4 = a3;
  [(WFNetworkListController *)self _associationWillStart:v4];
  id v5 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke;
  v7[3] = &unk_26478E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__WFNetworkListController__associateToHotspotDevice___block_invoke(uint64_t a1)
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  v130 = [MEMORY[0x263EFF910] date];
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v130;
    _os_log_impl(&dword_226071000, v2, v3, "%s: TIME: start %@", buf, 0x16u);
  }

  id v4 = +[WFMetricsManager sharedManager];
  id v5 = +[WFInstantHotspotJoinEvent joinEventWithType:0 latency:0 channel:0 error:0.0];
  [v4 processEvent:v5];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v174 = __Block_byref_object_copy_;
  v175 = __Block_byref_object_dispose_;
  id v176 = 0;
  id v6 = [*(id *)(a1 + 32) hotspotInterface];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)&buf[8];
  id obj = 0;
  v131 = [v6 enableHotspot:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  os_log_type_t v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)v167 = 136315138;
    *(void *)&v167[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
    _os_log_impl(&dword_226071000, v9, v10, "%s: TIME: enabling remote hotspot", v167, 0xCu);
  }

  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id v23 = [*(id *)(a1 + 32) interface];
    os_log_type_t v24 = [v23 deviceScanChannels];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v158 objects:v172 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v159;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v159 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void **)(*((void *)&v158 + 1) + 8 * i);
          uint64_t v29 = [v28 channel];
          int v30 = [v131 channel];
          LODWORD(v29) = v29 == [v30 integerValue];

          if (v29)
          {
            id v128 = v28;
            goto LABEL_33;
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v158 objects:v172 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    id v128 = 0;
LABEL_33:

    int v31 = +[WFMetricsManager sharedManager];
    uint64_t v32 = [MEMORY[0x263EFF910] date];
    [v32 timeIntervalSinceDate:v130];
    double v34 = v33;
    if (v128) {
      uint64_t v35 = [v128 channel];
    }
    else {
      uint64_t v35 = 0;
    }
    id v36 = +[WFInstantHotspotJoinEvent joinEventWithType:1 latency:v35 channel:0 error:v34];
    [v31 processEvent:v36];

    __int16 v126 = [MEMORY[0x263EFF910] date];
    if (v128)
    {
      id v171 = v128;
      v123 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v171 count:1];
    }
    else
    {
      uint64_t v37 = [*(id *)(a1 + 32) interface];
      v123 = [v37 deviceScanChannels];
    }
    uint64_t v38 = [v131 name];
    v129 = +[WFScanRequest scanRequestForSSID:v38 channels:v123];

    if (v129)
    {
      [v129 setDwellTime:110];
      id v124 = [v123 mutableCopy];
      if (v128 && v124 && (unint64_t)[v128 channel] >= 0x24)
      {
        if ([v128 channel] != 149
          && [*(id *)(a1 + 32) _isChannelAllowedForScanPerCurrentLocale:149])
        {
          __int16 v39 = -[WFScanChannel initWithChannel:flags:]([WFScanChannel alloc], "initWithChannel:flags:", 149, [v128 flags]);
          [v124 addObject:v39];
        }
        if ([v128 channel] != 44
          && [*(id *)(a1 + 32) _isChannelAllowedForScanPerCurrentLocale:44])
        {
          long long v40 = -[WFScanChannel initWithChannel:flags:]([WFScanChannel alloc], "initWithChannel:flags:", 44, [v128 flags]);
          [v124 addObject:v40];
        }
      }
      __int16 v41 = [v131 name];
      id v42 = (void *)[v124 copy];
      long long v120 = +[WFScanRequest scanRequestForSSID:v41 channels:v42];

      if (v120)
      {
        [v120 setDwellTime:110];
        dispatch_semaphore_t v43 = dispatch_semaphore_create(0);
        id v125 = 0;
        *(void *)v167 = 0;
        *(void *)&v167[8] = v167;
        *(void *)&v167[16] = 0x3032000000;
        v168 = __Block_byref_object_copy_;
        dispatch_semaphore_t v127 = v43;
        v169 = __Block_byref_object_dispose_;
        id v170 = 0;
        do
        {
          uint64_t v44 = WFLogForCategory(0);
          os_log_type_t v45 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v44 && os_log_type_enabled(v44, v45))
          {
            *(_DWORD *)v163 = 136315138;
            v164 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
            _os_log_impl(&dword_226071000, v44, v45, "%s: TIME: scanning for remote hotspot", v163, 0xCu);
          }

          uint64_t v154 = 0;
          v155 = &v154;
          uint64_t v156 = 0x2020000000;
          char v157 = 0;
          __int16 v46 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = 0;

          __int16 v47 = [*(id *)(a1 + 32) interface];
          v146[0] = MEMORY[0x263EF8330];
          v146[1] = 3221225472;
          v146[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke_163;
          v146[3] = &unk_26478E800;
          v150 = buf;
          id v48 = v131;
          id v147 = v48;
          v151 = v167;
          v152 = &v154;
          id v49 = v130;
          id v148 = v49;
          uint64_t v153 = 0x403E000000000000;
          v50 = v127;
          v149 = v50;
          [v47 asyncScanRequest:v129 reply:v146];

          dispatch_semaphore_wait(v50, 0xFFFFFFFFFFFFFFFFLL);
          id v51 = WFLogForCategory(0);
          os_log_type_t v52 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v51 && os_log_type_enabled(v51, v52))
          {
            os_log_type_t v53 = *(void **)(*(void *)&v167[8] + 40);
            *(_DWORD *)v163 = 136315394;
            v164 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke_2";
            __int16 v165 = 2112;
            v166 = v53;
            _os_log_impl(&dword_226071000, v51, v52, "%s: TIME: directed scan for instant hotspot found %@", v163, 0x16u);
          }

          if (*((unsigned char *)v155 + 24))
          {
            v54 = WFLogForCategory(0);
            os_log_type_t v55 = OSLogForWFLogLevel(1uLL);
            int v56 = 4;
            if (WFCurrentLogLevel() && v54 && os_log_type_enabled(v54, v55))
            {
              *(_DWORD *)v163 = 136315138;
              v164 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
              _os_log_impl(&dword_226071000, v54, v55, "%s: retrying scan ", v163, 0xCu);
            }
          }
          else if (*(void *)(*(void *)&buf[8] + 40) || !*(void *)(*(void *)&v167[8] + 40))
          {
            uint64_t v57 = WFLogForCategory(0);
            os_log_type_t v58 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v57 && os_log_type_enabled(v57, v58))
            {
              BOOL v59 = *(void **)(*(void *)&buf[8] + 40);
              *(_DWORD *)v163 = 136315394;
              v164 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
              __int16 v165 = 2112;
              v166 = v59;
              _os_log_impl(&dword_226071000, v57, v58, "%s: error on directed scan for hotspot %@", v163, 0x16u);
            }

            [*(id *)(a1 + 32) _presentHotspotErrorContextWithDevice:*(void *)(a1 + 40) hotspotError:0 failure:4];
            v60 = [*(id *)(a1 + 32) wifiClient];
            [v60 setAutoJoinEnabled:1];

            os_log_type_t v61 = +[WFMetricsManager sharedManager];
            v62 = [MEMORY[0x263EFF910] date];
            [v62 timeIntervalSinceDate:v126];
            double v64 = v63;
            if (v128) {
              uint64_t v65 = [v128 channel];
            }
            else {
              uint64_t v65 = 0;
            }
            uint64_t v72 = *(void **)(*(void *)&buf[8] + 40);
            if (v72) {
              uint64_t v73 = [v72 code];
            }
            else {
              uint64_t v73 = 4;
            }
            v74 = +[WFInstantHotspotJoinEvent joinEventWithType:2 latency:v65 channel:v73 error:v64];
            [v61 processEvent:v74];

            v54 = WFLogForCategory(0);
            os_log_type_t v75 = OSLogForWFLogLevel(1uLL);
            int v56 = 1;
            if (WFCurrentLogLevel() && v54)
            {
              v54 = v54;
              if (os_log_type_enabled(v54, v75))
              {
                v76 = [MEMORY[0x263EFF910] date];
                *(_DWORD *)v163 = 136315394;
                v164 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
                __int16 v165 = 2112;
                v166 = v76;
                _os_log_impl(&dword_226071000, v54, v75, "%s: TIME: end %@", v163, 0x16u);
              }
              int v56 = 1;
            }
          }
          else
          {
            v66 = +[WFMetricsManager sharedManager];
            v67 = [MEMORY[0x263EFF910] date];
            [v67 timeIntervalSinceDate:v126];
            double v69 = v68;
            v70 = [*(id *)(*(void *)&v167[8] + 40) channel];
            if (v70)
            {
              long long v121 = [*(id *)(*(void *)&v167[8] + 40) channel];
              uint64_t v71 = [v121 unsignedIntegerValue];
            }
            else
            {
              uint64_t v71 = 0;
            }
            v77 = +[WFInstantHotspotJoinEvent joinEventWithType:2 latency:v71 channel:0 error:v69];
            [v66 processEvent:v77];

            if (v70) {
            v78 = [MEMORY[0x263EFF910] date];
            }

            v79 = [*(id *)(*(void *)&v167[8] + 40) matchingKnownNetworkProfile];

            if (v79
              && (v80 = [WFNetworkProfile alloc],
                  [*(id *)(*(void *)&v167[8] + 40) matchingKnownNetworkProfile],
                  char v81 = objc_claimAutoreleasedReturnValue(),
                  long long v122 = [(WFNetworkProfile *)v80 initWithCoreWiFiProfile:v81],
                  v81,
                  v122))
            {
              v82 = (void *)[(WFNetworkProfile *)v122 mutableCopy];
            }
            else
            {
              v82 = +[WFMutableNetworkProfile mutableProfileForNetwork:*(void *)(*(void *)&v167[8] + 40)];
              long long v122 = 0;
            }
            os_log_type_t v83 = [v48 password];
            [v82 setPassword:v83];

            [v82 setInstantHotspotJoin:1];
            v84 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier"));
            [v82 setHotspotDeviceIdentifier:v84];

            os_log_type_t v85 = WFLogForCategory(0);
            os_log_type_t v86 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v85)
            {
              v87 = v85;
              if (os_log_type_enabled(v87, v86))
              {
                v88 = [v82 ssid];
                v89 = [v82 hotspotDeviceIdentifier];
                *(_DWORD *)v163 = 138412546;
                v164 = v88;
                __int16 v165 = 2112;
                v166 = v89;
                _os_log_impl(&dword_226071000, v87, v86, "Saving device identifier for hotspot: %@, deviceID: %@", v163, 0x16u);
              }
            }

            objc_initWeak(&location, *(id *)(a1 + 32));
            uint64_t v141 = 0;
            v142 = &v141;
            uint64_t v143 = 0x2020000000;
            char v144 = 0;
            v90 = [*(id *)(a1 + 32) interface];
            uint64_t v91 = *(void *)(*(void *)&v167[8] + 40);
            v132[0] = MEMORY[0x263EF8330];
            v132[1] = 3221225472;
            v132[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke_168;
            v132[3] = &unk_26478E828;
            objc_copyWeak(v140, &location);
            v138 = &v141;
            id v133 = v49;
            v140[1] = (id)0x403E000000000000;
            id v134 = *(id *)(a1 + 40);
            id v125 = v78;
            id v135 = v125;
            v139 = v167;
            os_log_type_t v92 = v50;
            v136 = v92;
            v54 = v82;
            v137 = v54;
            [v90 asyncAssociateToNetwork:v91 profile:v54 reply:v132];

            dispatch_semaphore_wait(v92, 0xFFFFFFFFFFFFFFFFLL);
            if (*((unsigned char *)v142 + 24))
            {
              int v56 = 4;
            }
            else
            {
              v93 = WFLogForCategory(0);
              os_log_type_t v94 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v93)
              {
                v95 = v93;
                if (os_log_type_enabled(v95, v94))
                {
                  uint64_t v96 = [MEMORY[0x263EFF910] date];
                  *(_DWORD *)v163 = 136315394;
                  v164 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
                  __int16 v165 = 2112;
                  v166 = v96;
                  _os_log_impl(&dword_226071000, v95, v94, "%s: TIME: end %@", v163, 0x16u);
                }
              }

              int v56 = 0;
            }

            objc_destroyWeak(v140);
            _Block_object_dispose(&v141, 8);
            objc_destroyWeak(&location);
          }
          _Block_object_dispose(&v154, 8);
        }
        while (v56 == 4);
        _Block_object_dispose(v167, 8);
      }
      else
      {
        v105 = WFLogForCategory(0);
        os_log_type_t v106 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v105 && os_log_type_enabled(v105, v106))
        {
          *(_DWORD *)v167 = 136315138;
          *(void *)&v167[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
          _os_log_impl(&dword_226071000, v105, v106, "%s: error creating scan request for retry", v167, 0xCu);
        }

        [*(id *)(a1 + 32) _presentHotspotErrorContextWithDevice:*(void *)(a1 + 40) hotspotError:0 failure:4];
        v107 = [*(id *)(a1 + 32) wifiClient];
        [v107 setAutoJoinEnabled:1];

        id v108 = +[WFMetricsManager sharedManager];
        v109 = [MEMORY[0x263EFF910] date];
        [v109 timeIntervalSinceDate:v126];
        double v111 = v110;
        if (v128) {
          uint64_t v112 = [v128 channel];
        }
        else {
          uint64_t v112 = 0;
        }
        long long v117 = +[WFInstantHotspotJoinEvent joinEventWithType:2 latency:v112 channel:10001 error:v111];
        [v108 processEvent:v117];

        v50 = WFLogForCategory(0);
        os_log_type_t v118 = OSLogForWFLogLevel(1uLL);
        id v125 = 0;
        if (WFCurrentLogLevel() && v50)
        {
          v50 = v50;
          if (os_log_type_enabled(v50, v118))
          {
            long long v119 = [MEMORY[0x263EFF910] date];
            *(_DWORD *)v167 = 136315394;
            *(void *)&v167[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
            *(_WORD *)&v167[12] = 2112;
            *(void *)&v167[14] = v119;
            _os_log_impl(&dword_226071000, v50, v118, "%s: TIME: end %@", v167, 0x16u);
          }
          id v125 = 0;
        }
      }

      long long v115 = v120;
    }
    else
    {
      v97 = WFLogForCategory(0);
      os_log_type_t v98 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v97 && os_log_type_enabled(v97, v98))
      {
        *(_DWORD *)v167 = 136315138;
        *(void *)&v167[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
        _os_log_impl(&dword_226071000, v97, v98, "%s: error creating scan request", v167, 0xCu);
      }

      [*(id *)(a1 + 32) _presentHotspotErrorContextWithDevice:*(void *)(a1 + 40) hotspotError:0 failure:4];
      v99 = [*(id *)(a1 + 32) wifiClient];
      [v99 setAutoJoinEnabled:1];

      uint64_t v100 = +[WFMetricsManager sharedManager];
      v101 = [MEMORY[0x263EFF910] date];
      [v101 timeIntervalSinceDate:v126];
      double v103 = v102;
      if (v128) {
        uint64_t v104 = [v128 channel];
      }
      else {
        uint64_t v104 = 0;
      }
      long long v113 = +[WFInstantHotspotJoinEvent joinEventWithType:2 latency:v104 channel:10001 error:v103];
      [v100 processEvent:v113];

      WFLogForCategory(0);
      id v124 = (id)objc_claimAutoreleasedReturnValue();
      os_log_type_t v114 = OSLogForWFLogLevel(1uLL);
      id v125 = 0;
      if (!WFCurrentLogLevel() || !v124) {
        goto LABEL_133;
      }
      long long v115 = v124;
      if (os_log_type_enabled(v115, v114))
      {
        long long v116 = [MEMORY[0x263EFF910] date];
        *(_DWORD *)v167 = 136315394;
        *(void *)&v167[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
        *(_WORD *)&v167[12] = 2112;
        *(void *)&v167[14] = v116;
        _os_log_impl(&dword_226071000, v115, v114, "%s: TIME: end %@", v167, 0x16u);
      }
      id v125 = 0;
      id v124 = v115;
    }

LABEL_133:
    os_log_type_t v21 = v123;
LABEL_134:

    goto LABEL_135;
  }
  id v11 = WFLogForCategory(0);
  os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v167 = 136315394;
    *(void *)&v167[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
    *(_WORD *)&v167[12] = 2112;
    *(void *)&v167[14] = v13;
    _os_log_impl(&dword_226071000, v11, v12, "%s: error enabling hotspot: %@", v167, 0x16u);
  }

  if ([*(id *)(*(void *)&buf[8] + 40) code] == -71146) {
    uint64_t v14 = 19;
  }
  else {
    uint64_t v14 = 5;
  }
  [*(id *)(a1 + 32) _presentHotspotErrorContextWithDevice:*(void *)(a1 + 40) hotspotError:*(void *)(*(void *)&buf[8] + 40) failure:v14];
  long long v15 = [*(id *)(a1 + 32) wifiClient];
  [v15 setAutoJoinEnabled:1];

  int v16 = +[WFMetricsManager sharedManager];
  uint64_t v17 = [MEMORY[0x263EFF910] date];
  [v17 timeIntervalSinceDate:v130];
  BOOL v19 = +[WFInstantHotspotJoinEvent joinEventWithType:latency:channel:error:](WFInstantHotspotJoinEvent, "joinEventWithType:latency:channel:error:", 1, 0, [*(id *)(*(void *)&buf[8] + 40) code], v18);
  [v16 processEvent:v19];

  WFLogForCategory(0);
  id v128 = (id)objc_claimAutoreleasedReturnValue();
  os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
  id v125 = 0;
  if (WFCurrentLogLevel() && v128)
  {
    os_log_type_t v21 = v128;
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = [MEMORY[0x263EFF910] date];
      *(_DWORD *)v167 = 136315394;
      *(void *)&v167[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
      *(_WORD *)&v167[12] = 2112;
      *(void *)&v167[14] = v22;
      _os_log_impl(&dword_226071000, v21, v20, "%s: TIME: end %@", v167, 0x16u);
    }
    id v125 = 0;
    __int16 v126 = 0;
    id v128 = v21;
    goto LABEL_134;
  }
  __int16 v126 = 0;
LABEL_135:

  _Block_object_dispose(buf, 8);
}

void __53__WFNetworkListController__associateToHotspotDevice___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = v5;
    os_log_type_t v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    os_log_type_t v10 = (void *)MEMORY[0x263F08A98];
    id v11 = [*(id *)(a1 + 32) name];
    os_log_type_t v9 = [v10 predicateWithFormat:@"ssid == %@", v11];

    os_log_type_t v12 = [v6 filteredSetUsingPredicate:v9];
    uint64_t v13 = [v12 anyObject];
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    int v16 = [MEMORY[0x263EFF910] date];
    [v16 timeIntervalSinceDate:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v17 < *(double *)(a1 + 80);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    double v18 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v25 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
      _os_log_impl(&dword_226071000, v18, v19, "%s: scan failed, dispatch retry in 1 second", buf, 0xCu);
    }

    dispatch_time_t v20 = dispatch_time(0, 1000000000);
    os_log_type_t v21 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke_164;
    block[3] = &unk_26478E528;
    id v23 = *(id *)(a1 + 48);
    dispatch_after(v20, v21, block);
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

intptr_t __53__WFNetworkListController__associateToHotspotDevice___block_invoke_164(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53__WFNetworkListController__associateToHotspotDevice___block_invoke_168(uint64_t a1, char a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v8 = WeakRetained;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    if ([WeakRetained viewControllerSupportsCurrentNetworkSubtitle])
    {
      os_log_type_t v9 = [v8 viewController];
      [v9 setCurrentNetworkSubtitle:0];
    }
    [v8 _handleAssociationResult:1 error:0 network:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) profile:*(void *)(a1 + 64) shouldSaveProfile:0];
    os_log_type_t v10 = +[WFMetricsManager sharedManager];
    id v11 = [MEMORY[0x263EFF910] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 48)];
    double v13 = v12;
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) channel];
    if (v14)
    {
      os_log_type_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) channel];
      uint64_t v15 = [v3 unsignedIntegerValue];
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v26 = +[WFInstantHotspotJoinEvent joinEventWithType:3 latency:v15 channel:0 error:v13];
    [v10 processEvent:v26];

    if (v14) {
    uint64_t v27 = +[WFMetricsManager sharedManager];
    }
    uint64_t v28 = [MEMORY[0x263EFF910] date];
    [v28 timeIntervalSinceDate:*(void *)(a1 + 32)];
    double v30 = v29;
    int v31 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) channel];
    if (v31)
    {
      os_log_type_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) channel];
      uint64_t v32 = [v3 unsignedIntegerValue];
    }
    else
    {
      uint64_t v32 = 0;
    }
    uint64_t v38 = +[WFInstantHotspotJoinEvent joinEventWithType:4 latency:v32 channel:0 error:v30];
    [v27 processEvent:v38];

    if (v31) {
    __int16 v39 = WFLogForCategory(0);
    }
    os_log_type_t v40 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v39)
    {
      __int16 v41 = v39;
      if (os_log_type_enabled(v41, v40))
      {
        id v42 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) ssid];
        *(_DWORD *)buf = 136315394;
        __int16 v47 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke_2";
        __int16 v48 = 2112;
        id v49 = v42;
        _os_log_impl(&dword_226071000, v41, v40, "%s: TIME: associated to hotspot %@ sucessfully", buf, 0x16u);
      }
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  else
  {
    int v16 = [MEMORY[0x263EFF910] date];
    [v16 timeIntervalSinceDate:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v17 < *(double *)(a1 + 96);
    int v18 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    os_log_type_t v19 = WFLogForCategory(0);
    os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel()) {
      BOOL v21 = v19 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    int v22 = !v21;
    if (v18)
    {
      if (v22 && os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v47 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
        _os_log_impl(&dword_226071000, v19, v20, "%s: association failed, dispatch retry in 1 second", buf, 0xCu);
      }

      dispatch_time_t v23 = dispatch_time(0, 1000000000);
      os_log_type_t v24 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke_169;
      block[3] = &unk_26478E528;
      id v45 = *(id *)(a1 + 56);
      dispatch_after(v23, v24, block);

      uint64_t v25 = v45;
    }
    else
    {
      if (v22 && os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v47 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
        __int16 v48 = 2112;
        id v49 = v6;
        _os_log_impl(&dword_226071000, v19, v20, "%s: error on associating to hotspot %@", buf, 0x16u);
      }

      [v8 _presentHotspotErrorContextWithDevice:*(void *)(a1 + 40) hotspotError:0 failure:13];
      uint64_t v25 = +[WFMetricsManager sharedManager];
      double v33 = [MEMORY[0x263EFF910] date];
      [v33 timeIntervalSinceDate:*(void *)(a1 + 48)];
      double v35 = v34;
      id v36 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) channel];
      if (v36)
      {
        a1 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) channel];
        uint64_t v37 = [(id)a1 unsignedIntegerValue];
      }
      else
      {
        uint64_t v37 = 0;
      }
      dispatch_semaphore_t v43 = +[WFInstantHotspotJoinEvent joinEventWithType:latency:channel:error:](WFInstantHotspotJoinEvent, "joinEventWithType:latency:channel:error:", 3, v37, [v6 code], v35);
      [v25 processEvent:v43];

      if (v36) {
    }
      }
  }
}

intptr_t __53__WFNetworkListController__associateToHotspotDevice___block_invoke_169(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_associateToNetwork:(id)a3 profile:(id)a4
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(WFNetworkListController *)self _associationWillStart:v6];
  uint64_t v72 = v7;
  id v8 = (void *)[v7 mutableCopy];
  if (!v8)
  {
    os_log_type_t v9 = [v6 matchingKnownNetworkProfile];

    if (!v9
      || (os_log_type_t v10 = [WFNetworkProfile alloc],
          [v6 matchingKnownNetworkProfile],
          id v11 = objc_claimAutoreleasedReturnValue(),
          double v12 = [(WFNetworkProfile *)v10 initWithCoreWiFiProfile:v11],
          id v8 = (void *)[(WFNetworkProfile *)v12 mutableCopy],
          v12,
          v11,
          !v8))
    {
      double v13 = [[WFNetworkProfile alloc] initWithNetwork:v6];
      id v8 = (void *)[(WFNetworkProfile *)v13 mutableCopy];
    }
  }
  uint64_t v14 = [v6 ssid];
  uint64_t v15 = [(WFNetworkListController *)self randomMACManager];
  int v16 = [v15 isSSIDinCache:v14];

  if (v16)
  {
    double v17 = [(WFNetworkListController *)self randomMACManager];
    uint64_t v18 = [v17 shouldEnableRandomMACForSSID:v14];

    [v8 setRandomMACAddressEnabled:v18];
    os_log_type_t v19 = [(WFNetworkListController *)self randomMACManager];
    os_log_type_t v20 = [v19 cachedRandomMACForSSID:v14];

    [v8 setRandomMACAddress:v20];
    BOOL v21 = WFLogForCategory(8uLL);
    os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 138412802;
      v79 = v20;
      __int16 v80 = 2112;
      id v81 = v14;
      __int16 v82 = 1024;
      LODWORD(v83) = v18;
      _os_log_impl(&dword_226071000, v21, v22, "using cached address='%@' for association to '%@' (private address enabled=%d)", buf, 0x1Cu);
    }
  }
  dispatch_time_t v23 = [v8 password];
  BOOL v24 = v23 == 0;

  if (v24)
  {
    uint64_t v25 = [(WFNetworkListController *)self scanManager];
    uint64_t v26 = [v25 hotspotHelperForScanRecord:v6];

    if (v26)
    {
      uint64_t v27 = WFLogForCategory(0);
      os_log_type_t v28 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v27)
      {
        double v29 = v27;
        if (os_log_type_enabled(v29, v28))
        {
          double v30 = [v26 ssid];
          int v31 = [v26 bundleIdentifier];
          *(_DWORD *)buf = 138412546;
          v79 = v30;
          __int16 v80 = 2112;
          id v81 = v31;
          _os_log_impl(&dword_226071000, v29, v28, "Found matching hotspot plugin network ssid: %@ (bundleIdentifier %@), using supplied password", buf, 0x16u);
        }
      }

      uint64_t v32 = [v26 password];
      [v8 setPassword:v32];

      [v8 setUserProvidedPassword:1];
      double v33 = [v26 bundleIdentifier];
      [v8 setOriginatorBundleIdentifier:v33];
    }
  }
  if ([v8 shouldBeRemovedIfApplicationIsNoLongerInstalled])
  {
    double v34 = WFLogForCategory(0);
    os_log_type_t v35 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v34)
    {
      id v36 = v34;
      if (os_log_type_enabled(v36, v35))
      {
        uint64_t v37 = [v8 originatorBundleIdentifier];
        *(_DWORD *)buf = 136315650;
        v79 = "-[WFNetworkListController _associateToNetwork:profile:]";
        __int16 v80 = 2112;
        id v81 = v8;
        __int16 v82 = 2114;
        os_log_type_t v83 = v37;
        _os_log_impl(&dword_226071000, v36, v35, "%s: removing application based network (%@) as it's host application (%{public}@) not installed", buf, 0x20u);
      }
    }

    uint64_t v38 = [v6 matchingKnownNetworkProfile];

    if (v38)
    {
      __int16 v39 = [(WFNetworkListController *)self wifiClient];
      os_log_type_t v40 = [v39 cInterface];
      __int16 v41 = [v6 matchingKnownNetworkProfile];
      id v77 = 0;
      char v42 = [v40 removeKnownNetworkProfile:v41 reason:2 error:&v77];
      id v43 = v77;

      if (v42)
      {
LABEL_39:

        uint64_t v50 = [[WFNetworkProfile alloc] initWithNetwork:v6];
        uint64_t v51 = [(WFNetworkProfile *)v50 mutableCopy];

        id v8 = (void *)v51;
        goto LABEL_40;
      }
      uint64_t v44 = WFLogForCategory(0);
      os_log_type_t v45 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v44)
      {
        __int16 v46 = v44;
        if (os_log_type_enabled(v46, v45))
        {
          __int16 v47 = [v6 ssid];
          *(_DWORD *)buf = 138412546;
          v79 = v47;
          __int16 v80 = 2112;
          id v81 = v43;
          _os_log_impl(&dword_226071000, v46, v45, "Failed to remove '%@' error='%@'", buf, 0x16u);
        }
      }
    }
    else
    {
      WFLogForCategory(0);
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      os_log_type_t v48 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v43) {
        goto LABEL_39;
      }
      uint64_t v44 = v43;
      if (os_log_type_enabled(v44, v48))
      {
        id v49 = [v6 ssid];
        *(_DWORD *)buf = 138412290;
        v79 = v49;
        _os_log_impl(&dword_226071000, v44, v48, "no matching known network profile for '%@'", buf, 0xCu);
      }
      id v43 = v44;
    }

    goto LABEL_39;
  }
LABEL_40:
  if ([v6 securityMode] == 128
    && ([v8 password],
        os_log_type_t v52 = objc_claimAutoreleasedReturnValue(),
        BOOL v53 = v52 == 0,
        v52,
        v53))
  {
    uint64_t v71 = [(WFNetworkListController *)self associationContext];
    [v71 setState:2];

    [(WFNetworkListController *)self _promptCredentialsForNetwork:v6 profile:v8];
  }
  else
  {
    v54 = [(WFNetworkListController *)self otherNetworkVC];

    if (v54)
    {
      os_log_type_t v55 = WFLogForCategory(0);
      os_log_type_t v56 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v55)
      {
        uint64_t v57 = v55;
        if (os_log_type_enabled(v57, v56))
        {
          os_log_type_t v58 = [(WFNetworkListController *)self otherNetworkVC];
          *(_DWORD *)buf = 138412290;
          v79 = v58;
          _os_log_impl(&dword_226071000, v57, v56, "other network vc is visible %@", buf, 0xCu);
        }
      }

      BOOL v59 = [(WFNetworkListController *)self otherNetworkVC];
      char v60 = objc_opt_respondsToSelector();

      if (v60)
      {
        os_log_type_t v61 = [(WFNetworkListController *)self otherNetworkVC];
        [v61 setJoining:1];
      }
      v62 = [(WFNetworkListController *)self otherNetworkVC];
      char v63 = objc_opt_respondsToSelector();

      if (v63)
      {
        double v64 = NSString;
        uint64_t v65 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v66 = [v65 localizedStringForKey:@"kWFLocOtherNetworkJoiningPromptFormat" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        v67 = [v6 ssid];
        double v68 = objc_msgSend(v64, "stringWithFormat:", v66, v67);
        double v69 = [(WFNetworkListController *)self otherNetworkVC];
        [v69 setActivityString:v68];
      }
    }
    objc_initWeak((id *)buf, self);
    v70 = [(WFNetworkListController *)self interface];
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __55__WFNetworkListController__associateToNetwork_profile___block_invoke;
    v73[3] = &unk_26478E850;
    objc_copyWeak(&v76, (id *)buf);
    id v74 = v6;
    id v75 = v8;
    [v70 asyncAssociateToNetwork:v74 profile:v75 reply:v73];

    objc_destroyWeak(&v76);
    objc_destroyWeak((id *)buf);
  }
}

void __55__WFNetworkListController__associateToNetwork_profile___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleAssociationResult:a2 error:v6 network:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) shouldSaveProfile:0];
}

- (void)_associateToEnterpriseNetwork:(id)a3 profile:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(WFNetworkListController *)self _associationWillStart:v6];
  id v8 = (void *)[v7 mutableCopy];
  if (!v8)
  {
    os_log_type_t v9 = [v6 matchingKnownNetworkProfile];

    if (!v9
      || (os_log_type_t v10 = [WFNetworkProfile alloc],
          [v6 matchingKnownNetworkProfile],
          id v11 = objc_claimAutoreleasedReturnValue(),
          double v12 = [(WFNetworkProfile *)v10 initWithCoreWiFiProfile:v11],
          id v8 = (void *)[(WFNetworkProfile *)v12 mutableCopy],
          v12,
          v11,
          !v8))
    {
      double v13 = WFLogForCategory(5uLL);
      os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13)
      {
        uint64_t v15 = v13;
        if (os_log_type_enabled(v15, v14))
        {
          int v16 = [v6 ssid];
          *(_DWORD *)buf = 138412290;
          os_log_type_t v40 = v16;
          _os_log_impl(&dword_226071000, v15, v14, "no existing profile for %@", buf, 0xCu);
        }
      }

      id v8 = +[WFMutableNetworkProfile mutableProfileForNetwork:v6];
    }
  }
  if ([v8 securityMode] == 1075)
  {
    double v17 = WFLogForCategory(5uLL);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17)
    {
      os_log_type_t v19 = v17;
      if (os_log_type_enabled(v19, v18))
      {
        os_log_type_t v20 = [v6 ssid];
        uint64_t v21 = [v6 securityMode];
        *(_DWORD *)buf = 138543618;
        os_log_type_t v40 = v20;
        __int16 v41 = 2048;
        uint64_t v42 = v21;
        _os_log_impl(&dword_226071000, v19, v18, "%{public}@ security is any-encrpytion, proceeding with scanned network's security %ld", buf, 0x16u);
      }
    }

    objc_msgSend(v8, "setSecurityMode:", objc_msgSend(v6, "securityMode"));
  }
  char v22 = [v8 canAttemptJoin];
  dispatch_time_t v23 = WFLogForCategory(5uLL);
  os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v25 = v23 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  int v26 = !v25;
  if (v22)
  {
    if (v26)
    {
      uint64_t v27 = v23;
      if (os_log_type_enabled(v27, v24))
      {
        os_log_type_t v28 = [v6 ssid];
        *(_DWORD *)buf = 138412546;
        os_log_type_t v40 = v28;
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)v8;
        _os_log_impl(&dword_226071000, v27, v24, "proceeding with join for %@ (profile: %@)", buf, 0x16u);
      }
    }

    double v29 = WFLogForCategory(5uLL);
    os_log_type_t v30 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29 && os_log_type_enabled(v29, v30))
    {
      *(_DWORD *)buf = 136315650;
      os_log_type_t v40 = "-[WFNetworkListController _associateToEnterpriseNetwork:profile:]";
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v6;
      __int16 v43 = 2112;
      id v44 = v7;
      _os_log_impl(&dword_226071000, v29, v30, "%s: Invoking asyncAssociateToNetwork with network %@ profile %@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    int v31 = [(WFNetworkListController *)self interface];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __65__WFNetworkListController__associateToEnterpriseNetwork_profile___block_invoke;
    v35[3] = &unk_26478E850;
    objc_copyWeak(&v38, (id *)buf);
    id v36 = v6;
    id v37 = v8;
    [v31 asyncAssociateToNetwork:v36 profile:v37 reply:v35];

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v26)
    {
      uint64_t v32 = v23;
      if (os_log_type_enabled(v32, v24))
      {
        double v33 = [v6 ssid];
        *(_DWORD *)buf = 138412290;
        os_log_type_t v40 = v33;
        _os_log_impl(&dword_226071000, v32, v24, "user credentials prompt required for %@", buf, 0xCu);
      }
    }

    double v34 = [(WFNetworkListController *)self associationContext];
    [v34 setState:2];

    [(WFNetworkListController *)self _promptCredentialsForNetwork:v6 profile:v8];
  }
}

void __65__WFNetworkListController__associateToEnterpriseNetwork_profile___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleAssociationResult:a2 error:v6 network:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) shouldSaveProfile:0];
}

- (void)_associateToHS20Network:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(5uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "associating to HS20 network %@", buf, 0xCu);
  }

  id v7 = [v4 matchingKnownNetworkProfile];

  if (v7)
  {
    id v8 = WFLogForCategory(5uLL);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      os_log_type_t v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        id v11 = [v4 matchingKnownNetworkProfile];
        *(_DWORD *)buf = 138412290;
        id v23 = v11;
        _os_log_impl(&dword_226071000, v10, v9, "using matchingKnownNetworkProfile %@", buf, 0xCu);
      }
    }

    double v12 = [WFNetworkProfile alloc];
    double v13 = [v4 matchingKnownNetworkProfile];
    uint64_t v14 = [(WFNetworkProfile *)v12 initWithCoreWiFiProfile:v13];
  }
  else
  {
    double v13 = [(WFNetworkListController *)self gasController];
    uint64_t v14 = [v13 profileForNetwork:v4];
  }
  uint64_t v15 = (void *)v14;

  if (v15)
  {
    int v16 = WFLogForCategory(5uLL);
    os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v15;
      _os_log_impl(&dword_226071000, v16, v17, "using cached profile %@", buf, 0xCu);
    }

    [(WFNetworkListController *)self _associateToEnterpriseNetwork:v4 profile:v15];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    os_log_type_t v18 = [(WFNetworkListController *)self gasController];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__WFNetworkListController__associateToHS20Network___block_invoke;
    v19[3] = &unk_26478E878;
    objc_copyWeak(&v21, (id *)buf);
    id v20 = v4;
    [v18 resolveProfileForNetwork:v20 handler:v19 force:0];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

void __51__WFNetworkListController__associateToHS20Network___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = WFLogForCategory(5uLL);
  os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_226071000, v7, v8, "resolved profile %@ error %@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _associateToEnterpriseNetwork:*(void *)(a1 + 32) profile:v5];
}

- (void)_associateToUnconfiguredAccessory:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(5uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "associating to unconfigured accessory %@", (uint8_t *)&v7, 0xCu);
  }

  if ([v4 unconfiguredAccessoryType] == 4) {
    [(WFNetworkListController *)self _promptForSecureWACDevice:v4];
  }
  else {
    [(WFNetworkListController *)self _runUnconfiguredJoinOperationForNetwork:v4];
  }
}

- (void)_promptForSecureWACDevice:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    os_log_type_t v35 = "-[WFNetworkListController _promptForSecureWACDevice:]";
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: network %@", buf, 0x16u);
  }

  int v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  os_log_type_t v28 = [v7 localizedStringForKey:@"kWFLocSecureWACPromptTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];

  id v8 = NSString;
  uint64_t v9 = [v4 unconfiguredDeviceName];
  uint64_t v27 = objc_msgSend(v8, "stringWithFormat:", v28, v9);

  int v10 = [(WFNetworkListController *)self viewController];
  [v10 deviceCapability];
  int IsChinaDevice = WFCapabilityIsChinaDevice();

  __int16 v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = v12;
  if (IsChinaDevice) {
    uint64_t v14 = @"kWFLocSecureWACPromptMessage_CH";
  }
  else {
    uint64_t v14 = @"kWFLocSecureWACPromptMessage";
  }
  int v26 = [v12 localizedStringForKey:v14 value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];

  objc_initWeak((id *)buf, self);
  uint64_t v15 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v27 message:v26 preferredStyle:1];
  int v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (IsChinaDevice) {
    [v16 localizedStringForKey:@"kWFLocSecureWACPromptButtonAdd_CH" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  }
  else {
  os_log_type_t v17 = [v16 localizedStringForKey:@"kWFLocSecureWACPromptButtonAdd" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  }

  os_log_type_t v18 = (void *)MEMORY[0x263F1C3F0];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __53__WFNetworkListController__promptForSecureWACDevice___block_invoke;
  v31[3] = &unk_26478E8A0;
  objc_copyWeak(&v33, (id *)buf);
  id v19 = v4;
  id v32 = v19;
  id v20 = [v18 actionWithTitle:v17 style:0 handler:v31];
  [v15 addAction:v20];
  id v21 = (void *)MEMORY[0x263F1C3F0];
  char v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v23 = [v22 localizedStringForKey:@"kWFLocHomeAppRequiredButtonCancel" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __53__WFNetworkListController__promptForSecureWACDevice___block_invoke_2;
  v29[3] = &unk_26478E8C8;
  objc_copyWeak(&v30, (id *)buf);
  uint64_t v24 = [v21 actionWithTitle:v23 style:1 handler:v29];

  [v15 addAction:v24];
  BOOL v25 = [(WFNetworkListController *)self viewController];
  [v25 presentViewController:v15 animated:1 completion:0];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak((id *)buf);
}

void __53__WFNetworkListController__promptForSecureWACDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _openHomeAppForNetwork:*(void *)(a1 + 32)];
}

void __53__WFNetworkListController__promptForSecureWACDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateViewControllerConnectedNetwork];
}

- (void)_downloadHomeApp
{
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_226071000, v2, v3, "Starting Home download", v4, 2u);
  }
}

- (void)_runUnconfiguredJoinOperationForNetwork:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF9A0];
  os_log_type_t v6 = [v4 attributes];
  int v7 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x263F24B00], 0);

  if ([v4 isUnconfiguredAccessorySTAOnly])
  {
    id v8 = [MEMORY[0x263EFF980] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = [(WFNetworkListController *)self networks];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v26;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = [*(id *)(*((void *)&v25 + 1) + 8 * v12) attributes];
          [v8 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    [v7 setObject:v8 forKey:*MEMORY[0x263F24AF8]];
  }
  [(WFNetworkListController *)self _associationWillStart:v4];
  uint64_t v14 = [WFUnconfiguredJoinOperation alloc];
  uint64_t v15 = [(WFNetworkListController *)self viewController];
  int v16 = [(WFUnconfiguredJoinOperation *)v14 initWithParameters:v7 rootViewController:v15];

  objc_initWeak(&location, v16);
  objc_initWeak(&from, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__WFNetworkListController__runUnconfiguredJoinOperationForNetwork___block_invoke;
  v19[3] = &unk_26478E8F0;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  id v17 = v4;
  id v20 = v17;
  [(WFUnconfiguredJoinOperation *)v16 setCompletionBlock:v19];
  os_log_type_t v18 = [MEMORY[0x263F08A48] mainQueue];
  [v18 addOperation:v16];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __67__WFNetworkListController__runUnconfiguredJoinOperationForNetwork___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_log_type_t v3 = [WeakRetained error];

  if (v3)
  {
    id v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      os_log_type_t v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        int v7 = [WeakRetained error];
        int v11 = 138412290;
        uint64_t v12 = v7;
        _os_log_impl(&dword_226071000, v6, v5, "Error joining unconfigured network %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v9 = [WeakRetained error];
  uint64_t v10 = [WeakRetained error];
  [v8 _associationDidFinish:v9 == 0 error:v10 network:*(void *)(a1 + 32)];
}

- (void)_openHomeAppForNetwork:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    int v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      id v8 = [v4 unconfiguredDeviceID];
      int v18 = 136315650;
      id v19 = "-[WFNetworkListController _openHomeAppForNetwork:]";
      __int16 v20 = 2112;
      id v21 = v4;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "%s: network %@ (id: %{Public}@)", (uint8_t *)&v18, 0x20u);
    }
  }

  if (!v4)
  {
    uint64_t v13 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v16)) {
      goto LABEL_13;
    }
    int v18 = 136315138;
    id v19 = "-[WFNetworkListController _openHomeAppForNetwork:]";
    id v17 = "%s: nil network";
LABEL_22:
    _os_log_impl(&dword_226071000, v13, v16, v17, (uint8_t *)&v18, 0xCu);
    goto LABEL_13;
  }
  uint64_t v9 = [v4 unconfiguredDeviceID];

  if (!v9)
  {
    uint64_t v13 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v16)) {
      goto LABEL_13;
    }
    int v18 = 136315138;
    id v19 = "-[WFNetworkListController _openHomeAppForNetwork:]";
    id v17 = "%s: nil network unconfiguredDeviceID";
    goto LABEL_22;
  }
  uint64_t v10 = [NSURL URLWithString:@"com.apple.Home://reprovisionDevice/"];
  int v11 = [v4 unconfiguredDeviceID];
  uint64_t v12 = [(WFNetworkListController *)self _convertToHexString:v11];
  uint64_t v13 = [v10 URLByAppendingPathComponent:v12];

  uint64_t v14 = WFLogForCategory(0);
  os_log_type_t v15 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
  {
    int v18 = 136315394;
    id v19 = "-[WFNetworkListController _openHomeAppForNetwork:]";
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl(&dword_226071000, v14, v15, "%s: launchURL %@", (uint8_t *)&v18, 0x16u);
  }

  [(WFNetworkListController *)self _openURL:v13];
LABEL_13:
}

- (id)_convertToHexString:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 length];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i < v6; i += 2)
    {
      id v8 = objc_msgSend(v3, "substringWithRange:", i, 2);
      [v4 addObject:v8];
    }
  }
  uint64_t v9 = [v4 componentsJoinedByString:@":"];
  uint64_t v10 = [v9 uppercaseString];

  return v10;
}

- (void)_openURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F018D8]);
  [v4 setSensitive:1];
  uint64_t v5 = [MEMORY[0x263F01880] defaultWorkspace];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__WFNetworkListController__openURL___block_invoke;
  v7[3] = &unk_26478E918;
  id v8 = v3;
  id v6 = v3;
  [v5 openURL:v6 configuration:v4 completionHandler:v7];
}

void __36__WFNetworkListController__openURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      id v8 = "-[WFNetworkListController _openURL:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_226071000, v4, v5, "%s: failed to launch URL %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_associateToUserSuppliedNetwork:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    int v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      id v8 = [v4 ssid];
      *(_DWORD *)buf = 136315394;
      id v19 = "-[WFNetworkListController _associateToUserSuppliedNetwork:]";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "%s: joining other network %@", buf, 0x16u);
    }
  }

  objc_initWeak((id *)buf, self);
  __int16 v9 = [v4 ssid];
  uint64_t v10 = [(WFNetworkListController *)self interface];
  uint64_t v11 = [v10 deviceScanChannels];
  uint64_t v12 = +[WFScanRequest scanRequestForSSID:v9 channels:v11];

  uint64_t v13 = [(WFNetworkListController *)self interface];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke;
  v15[3] = &unk_26478E968;
  void v15[4] = self;
  objc_copyWeak(&v17, (id *)buf);
  id v14 = v4;
  id v16 = v14;
  [v13 asyncScanRequest:v12 reply:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 anyObject];
  id v8 = v7;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 17)
    && ([v7 scanResult],
        __int16 v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isAllowedInLockdownMode],
        v9,
        (v10 & 1) == 0))
  {
    uint64_t v12 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v12 && os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v12, v13, "In Lockdown Mode, prompting user", buf, 2u);
    }

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke_215;
    aBlock[3] = &unk_26478E940;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    id v23 = *(id *)(a1 + 40);
    id v24 = v6;
    id v14 = _Block_copy(aBlock);
    if ([*(id *)(a1 + 40) security])
    {
      if ([*(id *)(a1 + 40) security] == 1)
      {
        uint64_t v15 = 2;
      }
      else if ([*(id *)(a1 + 40) security] == 4)
      {
        uint64_t v15 = 1;
      }
      else
      {
        uint64_t v15 = 7;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    id v16 = (void *)MEMORY[0x263F863C0];
    id v17 = [*(id *)(a1 + 40) ssid];
    int v18 = [v16 lockdownModeAlertControllerWithNetworkName:v17 securityType:v15 completionHandler:v14];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke_217;
    block[3] = &unk_26478E7D8;
    void block[4] = *(void *)(a1 + 32);
    id v21 = v18;
    id v19 = v18;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v25);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _associateToUserSuppliedNetworkHelper:*(void *)(a1 + 40) networks:v6];
  }
}

void __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke_215(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _associateToUserSuppliedNetworkHelper:*(void *)(a1 + 32) networks:*(void *)(a1 + 40)];
  }
  else
  {
    id v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v3, v4, "User declined joining non-secure network in Lockdown Mode- canceling association", buf, 2u);
    }

    [MEMORY[0x263F087E8] associationErrorWithReason:6];
  }
}

void __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke_217(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) otherNetworkVC];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) otherNetworkVC];
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  [v3 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_associateToUserSuppliedNetworkHelper:(id)a3 networks:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_initWeak(&location, self);
  __int16 v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v9 && os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v36 = "-[WFNetworkListController _associateToUserSuppliedNetworkHelper:networks:]";
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl(&dword_226071000, v9, v10, "%s: scan results %@", buf, 0x16u);
  }

  uint64_t v11 = [v7 count];
  if (v11 != 1)
  {
    id v12 = 0;
LABEL_14:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke_2;
    block[3] = &unk_26478E9B8;
    char v29 = 0;
    BOOL v30 = v11 == 1;
    void block[4] = self;
    void block[5] = self;
    id v12 = v12;
    id v27 = v12;
    id v28 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    goto LABEL_20;
  }
  id v12 = [v7 anyObject];
  os_log_type_t v13 = WFLogForCategory(0);
  os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v36 = "-[WFNetworkListController _associateToUserSuppliedNetworkHelper:networks:]";
    __int16 v37 = 2112;
    id v38 = v12;
    _os_log_impl(&dword_226071000, v13, v14, "%s: found network %@", buf, 0x16u);
  }

  if (!objc_msgSend(v12, "isNetworkSecurityModeMatch:", objc_msgSend(v6, "security"))) {
    goto LABEL_14;
  }
  self->_associatingToOtherNetwork = 1;
  uint64_t v15 = [v7 anyObject];
  id v16 = [v15 matchingKnownNetworkProfile];

  if (v16)
  {
    id v17 = [WFNetworkProfile alloc];
    int v18 = [v15 matchingKnownNetworkProfile];
    id v19 = [(WFNetworkProfile *)v17 initWithCoreWiFiProfile:v18];
    __int16 v20 = (void *)[(WFNetworkProfile *)v19 mutableCopy];
  }
  else
  {
    __int16 v20 = +[WFMutableNetworkProfile mutableProfileForNetwork:v15];
  }
  [v20 setUserProvidedPassword:1];
  [v20 setHidden:1];
  if ([v15 isEnterprise])
  {
    id v21 = [v6 username];
    [v20 setUsername:v21];

    uint64_t v22 = [v6 password];
    [v20 setPassword:v22];

    objc_msgSend(v20, "setTLSIdentity:", objc_msgSend(v6, "TLSIdentity"));
  }
  else
  {
    id v23 = [v6 password];
    [v20 setPassword:v23];
  }
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke;
  v31[3] = &unk_26478E7B0;
  void v31[4] = self;
  id v32 = v15;
  id v33 = v20;
  id v24 = v20;
  id v25 = v15;
  dispatch_async(MEMORY[0x263EF83A0], v31);

LABEL_20:
  objc_destroyWeak(&location);
}

void __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) associationContext];
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) associationContext];
    id v5 = [v4 networkName];
    id v6 = [*(id *)(a1 + 40) ssid];
    char v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      __int16 v9 = [*(id *)(a1 + 32) associationContext];
      [v9 setNetwork:v8];
    }
  }
  [*(id *)(a1 + 32) _associateToScanRecord:*(void *)(a1 + 40) profile:*(void *)(a1 + 48)];
  id v10 = [*(id *)(a1 + 32) associationContext];
  [v10 setOriginator:1];
}

void __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v2 && os_log_type_enabled(v2, v3))
  {
    int v4 = *(unsigned __int8 *)(a1 + 64);
    int v5 = *(unsigned __int8 *)(a1 + 65);
    *(_DWORD *)buf = 136315650;
    id v23 = "-[WFNetworkListController _associateToUserSuppliedNetworkHelper:networks:]_block_invoke_2";
    __int16 v24 = 1024;
    *(_DWORD *)id v25 = v4;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = v5;
    _os_log_impl(&dword_226071000, v2, v3, "%s: other network not found (foundNetwork=%d mismatchedSecurity=%d)", buf, 0x18u);
  }

  if (*(unsigned char *)(a1 + 65)) {
    uint64_t v6 = 17;
  }
  else {
    uint64_t v6 = 16;
  }
  char v7 = [MEMORY[0x263F087E8] associationErrorWithReason:v6];
  uint64_t v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
  {
    id v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = [*(id *)(a1 + 32) credentialsContext];
      *(_DWORD *)buf = 136315650;
      id v23 = "-[WFNetworkListController _associateToUserSuppliedNetworkHelper:networks:]_block_invoke";
      __int16 v24 = 2112;
      *(void *)id v25 = v7;
      *(_WORD *)&v25[8] = 2112;
      long long v26 = v11;
      _os_log_impl(&dword_226071000, v10, v9, "%s: providing error %@ back to the credentials context %@", buf, 0x20u);
    }
  }

  id v12 = [*(id *)(a1 + 40) credentialsContext];
  [v12 finishWithError:v7 forNetwork:*(void *)(a1 + 48) profile:0];

  os_log_type_t v13 = [[WFErrorContext alloc] initWithAssociationError:v7 network:*(void *)(a1 + 56) diagnosticsResult:0];
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  objc_initWeak(&location, v13);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke_220;
  v18[3] = &unk_26478E990;
  objc_copyWeak(&v19, (id *)buf);
  objc_copyWeak(&v20, &location);
  [(WFErrorContext *)v13 setCompletionHandler:v18];
  [*(id *)(a1 + 40) _presentContext:v13 contextType:0];
  os_log_type_t v14 = +[WFMetricsManager sharedManager];
  uint64_t v15 = [*(id *)(a1 + 56) security];
  uint64_t v16 = [v7 code];
  id v17 = +[WFUserJoinEvent joinEventWithType:1 security:v15 error:v16 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
  [v14 processEvent:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke_220(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _dismissErrorViewControllerWithContext:v2];
}

- (void)_handleAssociationResult:(BOOL)a3 error:(id)a4 network:(id)a5 profile:(id)a6 shouldSaveProfile:(BOOL)a7
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 code] != 11
    || ([(WFNetworkListController *)self associationContext],
        os_log_type_t v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 secondaryScanCompleted],
        v14,
        (v15 & 1) != 0))
  {
    uint64_t v16 = [(WFNetworkListController *)self credentialsContext];
    if (v16)
    {
      id v17 = (void *)v16;
      int v18 = [(WFNetworkListController *)self credentialsContext];
      id v19 = [v18 network];
      int v20 = [v19 isEqual:v12];

      if (v20)
      {
        id v21 = WFLogForCategory(5uLL);
        os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v21)
        {
          id v23 = v21;
          if (os_log_type_enabled(v23, v22))
          {
            __int16 v24 = [(WFNetworkListController *)self credentialsContext];
            [(WFNetworkListController *)self associationContext];
            id v25 = v65 = v13;
            long long v26 = [v25 networkName];
            *(_DWORD *)buf = 138412546;
            double v69 = v24;
            __int16 v70 = 2112;
            uint64_t v71 = v26;
            _os_log_impl(&dword_226071000, v23, v22, "credentials context (%@) in progress for %@, reusing for association", buf, 0x16u);

            id v13 = v65;
          }
        }
        uint64_t v27 = [(WFNetworkListController *)self credentialsContext];
        [v27 finishWithError:v11 forNetwork:v12 profile:v13];
      }
    }
    if (v11) {
      uint64_t v28 = [v11 code];
    }
    else {
      uint64_t v28 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = 8;
      if (!a3) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v29 = [v12 securityMode];
      if (!a3)
      {
LABEL_16:
        BOOL v30 = WFLogForCategory(5uLL);
        os_log_type_t v31 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v30)
        {
          id v32 = v30;
          if (os_log_type_enabled(v32, v31))
          {
            id v33 = [(WFNetworkListController *)self associationContext];
            [v33 networkName];
            double v34 = v66 = v13;
            os_log_type_t v35 = [(WFNetworkListController *)self associationContext];
            *(_DWORD *)buf = 138412546;
            double v69 = v34;
            __int16 v70 = 2112;
            uint64_t v71 = v35;
            _os_log_impl(&dword_226071000, v32, v31, "association failed for %@ (context: %@)", buf, 0x16u);

            id v13 = v66;
          }
        }
        __int16 v36 = [(WFNetworkListController *)self associationContext];
        [(WFNetworkListController *)self _handleAssociationError:v11 network:v12 profile:v13 securityMode:v29 associationContext:v36];

        goto LABEL_50;
      }
    }
    __int16 v37 = [(WFNetworkListController *)self associationContext];
    uint64_t v38 = [v37 originator];

    if (v38 == 2)
    {
      uint64_t v39 = +[WFMetricsManager sharedManager];
      uint64_t v52 = MEMORY[0x263EFFA68];
      uint64_t v53 = 2;
    }
    else
    {
      if (v38 != 1)
      {
        if (v38) {
          goto LABEL_37;
        }
        uint64_t v39 = +[WFMetricsManager sharedManager];
        os_log_type_t v40 = [(WFNetworkListController *)self associationContext];
        __int16 v41 = [v40 sectionCounts];
        [(WFNetworkListController *)self associationContext];
        uint64_t v42 = v67 = v13;
        __int16 v43 = [v42 sectionNameJoined];
        id v44 = +[WFUserJoinEvent joinEventWithSecurity:v29 error:v28 sectionCounts:v41 sectionName:v43 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
        [v39 processEvent:v44];

        id v13 = v67;
LABEL_36:

LABEL_37:
        v54 = WFLogForCategory(5uLL);
        os_log_type_t v55 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v54)
        {
          os_log_type_t v56 = v54;
          if (os_log_type_enabled(v56, v55))
          {
            uint64_t v57 = [(WFNetworkListController *)self associationContext];
            os_log_type_t v58 = [v57 networkName];
            BOOL v59 = [(WFNetworkListController *)self associationContext];
            *(_DWORD *)buf = 138412546;
            double v69 = v58;
            __int16 v70 = 2112;
            uint64_t v71 = v59;
            _os_log_impl(&dword_226071000, v56, v55, "association completed for %@ (context: %@)", buf, 0x16u);
          }
        }

        if (self->_associatingToOtherNetwork)
        {
          char v60 = WFLogForCategory(5uLL);
          os_log_type_t v61 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v60)
          {
            v62 = v60;
            if (os_log_type_enabled(v62, v61))
            {
              char v63 = [(WFNetworkListController *)self credentialsContext];
              *(_DWORD *)buf = 138412290;
              double v69 = v63;
              _os_log_impl(&dword_226071000, v62, v61, "association originated from WFAssociationOriginatorOther, dismissing credentials context %@", buf, 0xCu);
            }
          }

          double v64 = [(WFNetworkListController *)self credentialsContext];
          [(WFNetworkListController *)self _dismissOtherNetworkViewControllerWithContext:v64];
        }
        [(WFNetworkListController *)self _associationDidFinish:1 error:0 network:v12];
        goto LABEL_50;
      }
      uint64_t v39 = +[WFMetricsManager sharedManager];
      uint64_t v52 = MEMORY[0x263EFFA68];
      uint64_t v53 = 1;
    }
    os_log_type_t v40 = +[WFUserJoinEvent joinEventWithType:v53 security:v29 error:v28 didRun:0 didPass:0 failedTests:v52];
    [v39 processEvent:v40];
    goto LABEL_36;
  }
  uint64_t v45 = WFLogForCategory(5uLL);
  os_log_type_t v46 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v45)
  {
    __int16 v47 = v45;
    if (os_log_type_enabled(v47, v46))
    {
      os_log_type_t v48 = [(WFNetworkListController *)self associationContext];
      id v49 = [v48 networkName];
      [(WFNetworkListController *)self credentialsContext];
      uint64_t v51 = v50 = v13;
      *(_DWORD *)buf = 138412546;
      double v69 = v49;
      __int16 v70 = 2112;
      uint64_t v71 = v51;
      _os_log_impl(&dword_226071000, v47, v46, "%@ requires a scan before associating, preempting credentialsContext(%@) completion until scan is complete.", buf, 0x16u);

      id v13 = v50;
    }
  }
  [(WFNetworkListController *)self _scanNetworkForAssociation:v12 profile:v13];
LABEL_50:
}

- (void)_handleAssociationError:(id)a3 network:(id)a4 profile:(id)a5 securityMode:(int64_t)a6 associationContext:(id)a7
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v101 = a5;
  id v13 = a7;
  if (v11) {
    os_log_type_t v14 = (void *)[v11 code];
  }
  else {
    os_log_type_t v14 = 0;
  }
  uint64_t v100 = WFAssociationErrorCodeToString([v11 code]);
  char v15 = WFLogForCategory(5uLL);
  os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)long long v119 = v12;
    *(_WORD *)&v119[8] = 2112;
    *(void *)&v119[10] = v101;
    __int16 v120 = 2112;
    id v121 = v11;
    __int16 v122 = 2112;
    v123 = v100;
    _os_log_impl(&dword_226071000, v15, v16, "handling association failure for %@ (profile: %@) error: %@ (%@)", buf, 0x2Au);
  }

  switch([v11 code])
  {
    case 0:
    case 1:
      id v17 = [(WFNetworkListController *)self associationContext];
      [v17 setState:2];

      if ([v11 code] == 1)
      {
        int v18 = [[WFErrorContext alloc] initWithAssociationError:v11 network:v12 diagnosticsResult:0];
        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v18);
        v110[0] = MEMORY[0x263EF8330];
        v110[1] = 3221225472;
        v110[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke;
        v110[3] = &unk_26478E9E0;
        id v111 = v12;
        id v112 = v101;
        id v113 = v11;
        id v114 = v100;
        objc_copyWeak(&v115, (id *)buf);
        objc_copyWeak(&v116, &location);
        [(WFErrorContext *)v18 setCompletionHandler:v110];
        [(WFNetworkListController *)self _presentContext:v18 contextType:0];
        objc_destroyWeak(&v116);
        objc_destroyWeak(&v115);

        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(WFNetworkListController *)self _promptCredentialsForNetwork:v12 profile:v101];
      }
      __int16 v43 = [(WFNetworkListController *)self associationContext];
      uint64_t v44 = [v43 originator];

      switch(v44)
      {
        case 2:
          uint64_t v53 = +[WFMetricsManager sharedManager];
          v54 = +[WFUserJoinEvent joinEventWithType:2 security:a6 error:v14 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
          [v53 processEvent:v54];

          break;
        case 1:
          os_log_type_t v55 = +[WFMetricsManager sharedManager];
          os_log_type_t v56 = +[WFUserJoinEvent joinEventWithType:1 security:a6 error:v14 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
          [v55 processEvent:v56];

          break;
        case 0:
          uint64_t v45 = +[WFMetricsManager sharedManager];
          os_log_type_t v46 = [v13 sectionCounts];
          __int16 v47 = [v13 sectionNameJoined];
          os_log_type_t v48 = +[WFUserJoinEvent joinEventWithSecurity:a6 error:v14 sectionCounts:v46 sectionName:v47 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
          [v45 processEvent:v48];

          break;
      }
      goto LABEL_75;
    case 6:
      id v19 = WFLogForCategory(5uLL);
      os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v19)
      {
        id v21 = v19;
        if (os_log_type_enabled(v21, v20))
        {
          os_log_type_t v22 = [v12 ssid];
          *(_DWORD *)buf = 138412290;
          *(void *)long long v119 = v22;
          _os_log_impl(&dword_226071000, v21, v20, "User cancelled association to %@", buf, 0xCu);
        }
      }

      id v23 = [MEMORY[0x263F087E8] associationErrorWithReason:6];
      [(WFNetworkListController *)self _associationDidFinish:0 error:v23 network:0];

      __int16 v24 = [(WFNetworkListController *)self associationContext];
      uint64_t v25 = [v24 originator];

      switch(v25)
      {
        case 2:
          __int16 v80 = +[WFMetricsManager sharedManager];
          id v81 = +[WFUserJoinEvent joinEventWithType:2 security:a6 error:v14 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
          [v80 processEvent:v81];

          break;
        case 1:
          __int16 v82 = +[WFMetricsManager sharedManager];
          os_log_type_t v83 = +[WFUserJoinEvent joinEventWithType:1 security:a6 error:v14 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
          [v82 processEvent:v83];

          break;
        case 0:
          long long v26 = +[WFMetricsManager sharedManager];
          uint64_t v27 = [v13 sectionCounts];
          uint64_t v28 = [v13 sectionNameJoined];
          uint64_t v29 = +[WFUserJoinEvent joinEventWithSecurity:a6 error:v14 sectionCounts:v27 sectionName:v28 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
          [v26 processEvent:v29];

          break;
      }
      goto LABEL_75;
    case 7:
      BOOL v30 = WFLogForCategory(5uLL);
      os_log_type_t v31 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v30)
      {
        id v32 = v30;
        if (os_log_type_enabled(v32, v31))
        {
          id v33 = [v12 ssid];
          *(_DWORD *)buf = 138412290;
          *(void *)long long v119 = v33;
          _os_log_impl(&dword_226071000, v32, v31, "User input required for %@", buf, 0xCu);
        }
      }

      double v34 = [(WFNetworkListController *)self associationContext];
      [v34 setState:2];

      if ([v12 isEnterprise])
      {
        os_log_type_t v35 = [v11 userInfo];
        __int16 v36 = [v35 objectForKey:@"kWFAssociationCertificateChainKey"];

        if (v36)
        {
          [(WFNetworkListController *)self _promptTrustCertificateForNetwork:v12 certificateChain:v36 profile:v101 autoJoin:0];
LABEL_28:

          goto LABEL_75;
        }
        uint64_t v84 = [v11 userInfo];
        os_log_type_t v85 = [v84 objectForKey:@"kWFAssociationUsernameRequiredKey"];
        if (v85)
        {
        }
        else
        {
          os_log_type_t v86 = [v11 userInfo];
          v87 = [v86 objectForKey:@"kWFAssociationPasswordRequiredKey"];
          BOOL v88 = v87 == 0;

          if (v88) {
            goto LABEL_80;
          }
        }
        [(WFNetworkListController *)self _promptCredentialsForNetwork:v12 profile:v101];
LABEL_80:
        v89 = [(WFNetworkListController *)self associationContext];
        uint64_t v90 = [v89 originator];

        switch(v90)
        {
          case 2:
            v95 = +[WFMetricsManager sharedManager];
            uint64_t v96 = +[WFUserJoinEvent joinEventWithType:2 security:a6 error:v14 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
            [v95 processEvent:v96];

            break;
          case 1:
            v97 = +[WFMetricsManager sharedManager];
            os_log_type_t v98 = +[WFUserJoinEvent joinEventWithType:1 security:a6 error:v14 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
            [v97 processEvent:v98];

            break;
          case 0:
            uint64_t v91 = +[WFMetricsManager sharedManager];
            os_log_type_t v92 = [v13 sectionCounts];
            v93 = [v13 sectionNameJoined];
            os_log_type_t v94 = +[WFUserJoinEvent joinEventWithSecurity:a6 error:v14 sectionCounts:v92 sectionName:v93 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
            [v91 processEvent:v94];

            break;
        }
        goto LABEL_28;
      }
      id v49 = WFLogForCategory(5uLL);
      os_log_type_t v50 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v49)
      {
        uint64_t v51 = v49;
        if (os_log_type_enabled(v51, v50))
        {
          uint64_t v52 = [v12 ssid];
          *(_DWORD *)buf = 138412290;
          *(void *)long long v119 = v52;
          _os_log_impl(&dword_226071000, v51, v50, "Recieved WFAssociationTrustRequiredErr for non-enterprise network %@", buf, 0xCu);
        }
      }

LABEL_75:
      return;
    case 11:
      __int16 v37 = [(WFNetworkListController *)self associationContext];
      uint64_t v38 = [v37 originator];

      if (v38 == 2)
      {
        uint64_t v39 = +[WFMetricsManager sharedManager];
        os_log_type_t v40 = +[WFUserJoinEvent joinEventWithType:2 security:a6 error:v14 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
        [v39 processEvent:v40];
      }
      else if (v38 == 1)
      {
        uint64_t v39 = +[WFMetricsManager sharedManager];
        os_log_type_t v40 = +[WFUserJoinEvent joinEventWithType:1 security:a6 error:v14 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
        [v39 processEvent:v40];
      }
      else
      {
        if (v38) {
          goto LABEL_49;
        }
        uint64_t v39 = +[WFMetricsManager sharedManager];
        os_log_type_t v40 = [v13 sectionCounts];
        __int16 v41 = [v13 sectionNameJoined];
        uint64_t v42 = +[WFUserJoinEvent joinEventWithSecurity:a6 error:v14 sectionCounts:v40 sectionName:v41 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
        [v39 processEvent:v42];
      }
LABEL_49:
      uint64_t v57 = WFLogForCategory(5uLL);
      os_log_type_t v58 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v57)
      {
        BOOL v59 = v57;
        if (os_log_type_enabled(v59, v58))
        {
          char v60 = [v12 ssid];
          *(_DWORD *)buf = 138412290;
          *(void *)long long v119 = v60;
          _os_log_impl(&dword_226071000, v59, v58, "Scan required to continue association to %@", buf, 0xCu);
        }
      }

      goto LABEL_55;
    default:
LABEL_55:
      os_log_type_t v61 = [(WFNetworkListController *)self associationContext];
      [v61 setState:2];

      v62 = WFLogForCategory(5uLL);
      os_log_type_t v63 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v62)
      {
        double v64 = v62;
        if (os_log_type_enabled(v64, v63))
        {
          int v65 = [v11 code];
          id v66 = [v12 ssid];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v119 = v65;
          *(_WORD *)&v119[4] = 2112;
          *(void *)&v119[6] = v66;
          _os_log_impl(&dword_226071000, v64, v63, "unhandled errorCode (%d) while associating to %@", buf, 0x12u);
        }
      }

      objc_initWeak(&location, self);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || [v12 iOSHotspot])
      {
        id v67 = +[WFMetricsManager sharedManager];
        double v68 = [v13 sectionCounts];
        double v69 = [v13 sectionNameJoined];
        __int16 v70 = +[WFUserJoinEvent joinEventWithSecurity:a6 error:v14 sectionCounts:v68 sectionName:v69 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
        [v67 processEvent:v70];

        uint64_t v71 = WFLogForCategory(0);
        os_log_type_t v72 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v71)
        {
          uint64_t v73 = v71;
          if (os_log_type_enabled(v73, v72))
          {
            id v74 = [v12 ssid];
            *(_DWORD *)buf = 138412290;
            *(void *)long long v119 = v74;
            _os_log_impl(&dword_226071000, v73, v72, "Skip running velocity test as joining a personal hotspot network: %@", buf, 0xCu);
          }
        }

        id v75 = [[WFErrorContext alloc] initWithAssociationError:v11 network:v12 diagnosticsResult:0];
        objc_initWeak((id *)buf, v75);
        v107[0] = MEMORY[0x263EF8330];
        v107[1] = 3221225472;
        v107[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_222;
        v107[3] = &unk_26478EA08;
        void v107[4] = self;
        objc_copyWeak(&v109, (id *)buf);
        id v108 = v11;
        [(WFErrorContext *)v75 setCompletionHandler:v107];
        [(WFNetworkListController *)self _presentContext:v75 contextType:0];

        objc_destroyWeak(&v109);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2_223;
        aBlock[3] = &unk_26478EA30;
        void aBlock[4] = self;
        v106[1] = (id)a6;
        v106[2] = v14;
        id v103 = v13;
        id v104 = v11;
        id v76 = v12;
        id v105 = v76;
        objc_copyWeak(v106, &location);
        id v77 = _Block_copy(aBlock);
        if ([v76 supportsJoinFailureDiagnostics])
        {
          v78 = [(WFNetworkListController *)self diagnosticsManager];
          v79 = [v76 ssid];
          [v78 runJoinFailureDiagnosticsFor:v79 withUpdate:&__block_literal_global_229 result:v77];
        }
        else
        {
          v78 = [v76 ssid];
          (*((void (**)(void *, void, void, void *))v77 + 2))(v77, 0, 0, v78);
        }

        objc_destroyWeak(v106);
      }
      objc_destroyWeak(&location);
      goto LABEL_75;
  }
}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke(id *a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2;
  v2[3] = &unk_26478E9E0;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  objc_copyWeak(&v7, a1 + 8);
  objc_copyWeak(&v8, a1 + 9);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = WFLogForCategory(5uLL);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    int v11 = 138413058;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_226071000, v2, v3, "Dismissing error alert and prompting credentials for %@ (profile: %@) error: %@ (%@)", (uint8_t *)&v11, 0x2Au);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _dismissErrorViewControllerWithContext:v9];

  id v10 = objc_loadWeakRetained((id *)(a1 + 64));
  [v10 _promptCredentialsForNetwork:*(void *)(a1 + 32) profile:*(void *)(a1 + 40)];
}

uint64_t __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_222(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 _dismissErrorViewControllerWithContext:WeakRetained];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _associationDidFinish:0 error:v5 network:0];
}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2_223(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v27 = a4;
  if (v7)
  {
    id v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v27;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl(&dword_226071000, v9, v10, "Diagnostics Error for ssid: %@ received: %@", buf, 0x16u);
    }
  }
  if (v8)
  {
    uint64_t v11 = [v8 didPassTest];
    uint64_t v12 = [v8 failedTests];
  }
  else
  {
    __int16 v13 = WFLogForCategory(0);
    os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v13, v14, "Empty diagnostics result returned", buf, 2u);
    }

    uint64_t v11 = 0;
    uint64_t v12 = (void *)MEMORY[0x263EFFA68];
  }
  __int16 v15 = WFLogForCategory(0);
  os_log_type_t v16 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v15 && os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v27;
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_226071000, v15, v16, "Diagnostics result for ssid: %@ received: %@", buf, 0x16u);
  }

  __int16 v17 = [*(id *)(a1 + 32) associationContext];
  uint64_t v18 = [v17 originator];

  switch(v18)
  {
    case 2:
      uint64_t v19 = +[WFMetricsManager sharedManager];
      os_log_type_t v22 = +[WFUserJoinEvent joinEventWithType:2 security:*(void *)(a1 + 72) error:*(void *)(a1 + 80) didRun:1 didPass:v11 failedTests:v12];
      [v19 processEvent:v22];
      goto LABEL_24;
    case 1:
      uint64_t v19 = +[WFMetricsManager sharedManager];
      os_log_type_t v22 = +[WFUserJoinEvent joinEventWithType:1 security:*(void *)(a1 + 72) error:*(void *)(a1 + 80) didRun:1 didPass:v11 failedTests:v12];
      [v19 processEvent:v22];
      goto LABEL_24;
    case 0:
      uint64_t v19 = +[WFMetricsManager sharedManager];
      uint64_t v21 = *(void *)(a1 + 72);
      uint64_t v20 = *(void *)(a1 + 80);
      os_log_type_t v22 = [*(id *)(a1 + 40) sectionCounts];
      id v23 = [*(id *)(a1 + 40) sectionNameJoined];
      __int16 v24 = +[WFUserJoinEvent joinEventWithSecurity:v21 error:v20 sectionCounts:v22 sectionName:v23 didRun:0 didPass:0 failedTests:MEMORY[0x263EFFA68]];
      [v19 processEvent:v24];

LABEL_24:
      break;
  }
  uint64_t v25 = [[WFErrorContext alloc] initWithAssociationError:*(void *)(a1 + 48) network:*(void *)(a1 + 56) diagnosticsResult:v8];
  objc_initWeak((id *)buf, v25);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_224;
  v28[3] = &unk_26478E8F0;
  objc_copyWeak(&v30, (id *)(a1 + 64));
  objc_copyWeak(&v31, (id *)buf);
  id v29 = *(id *)(a1 + 48);
  [(WFErrorContext *)v25 setCompletionHandler:v28];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _presentContext:v25 contextType:0];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_224(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _dismissErrorViewControllerWithContext:v4];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _associationDidFinish:0 error:*(void *)(a1 + 32) network:0];
}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2_226(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  os_log_type_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_226071000, v3, v4, "Diagnostics event received: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)_supportsWiFiPasswordSharing
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  viewController = self->_viewController;
  return [(WFNetworkListing *)viewController supportsWiFiPasswordSharing];
}

- (void)_promptCredentialsForNetwork:(id)a3 profile:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = (WFCredentialsContext *)a3;
  uint64_t v7 = (WFNetworkProfile *)a4;
  id v8 = [(WFNetworkListController *)self credentialsContext];

  if (v8)
  {
    WFLogForCategory(0);
    id v9 = (WFNetworkProfile *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v9)
    {
      id v9 = v9;
      if (os_log_type_enabled(&v9->super, v10))
      {
        uint64_t v11 = [(WFNetworkListController *)self credentialsContext];
        *(_DWORD *)buf = 136315394;
        os_log_type_t v55 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]";
        __int16 v56 = 2112;
        uint64_t v57 = v11;
        _os_log_impl(&dword_226071000, &v9->super, v10, "%s: reusing existing credentials context (%@)", buf, 0x16u);
      }
    }
  }
  else if ([(WFCredentialsContext *)v6 securityMode] == 128)
  {
    uint64_t v12 = [WFWAPICertificatePromptOperation alloc];
    __int16 v13 = [(WFNetworkListController *)self viewController];
    id v9 = [(WFWAPICertificatePromptOperation *)v12 initWithRootViewController:v13 network:v6];

    os_log_type_t v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 136315650;
      os_log_type_t v55 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]";
      __int16 v56 = 2112;
      uint64_t v57 = v6;
      __int16 v58 = 2112;
      BOOL v59 = v7;
      _os_log_impl(&dword_226071000, v14, v15, "%s: prompting WAPI cert for %@ (profile %@)", buf, 0x20u);
    }

    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, self);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke;
    v48[3] = &unk_26478EA78;
    objc_copyWeak(&v51, (id *)buf);
    objc_copyWeak(&v52, &location);
    id v49 = v7;
    os_log_type_t v50 = v6;
    [(WFNetworkProfile *)v9 setCompletionBlock:v48];
    os_log_type_t v16 = [MEMORY[0x263F08A48] mainQueue];
    [v16 addOperation:v9];

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v17 = v7;
    id v9 = v17;
    if (!v17)
    {
      uint64_t v18 = [(WFCredentialsContext *)v6 matchingKnownNetworkProfile];

      if (!v18
        || (uint64_t v19 = [WFNetworkProfile alloc],
            [(WFCredentialsContext *)v6 matchingKnownNetworkProfile],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            uint64_t v21 = [(WFNetworkProfile *)v19 initWithCoreWiFiProfile:v20],
            id v9 = (WFNetworkProfile *)[(WFNetworkProfile *)v21 mutableCopy],
            v21,
            v20,
            !v9))
      {
        id v9 = [[WFNetworkProfile alloc] initWithNetwork:v6];
        os_log_type_t v22 = WFLogForCategory(0);
        os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
        {
          *(_DWORD *)buf = 136315394;
          os_log_type_t v55 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]";
          __int16 v56 = 2112;
          uint64_t v57 = v6;
          _os_log_impl(&dword_226071000, v22, v23, "%s: no existing profile for network %@", buf, 0x16u);
        }
      }
    }
    __int16 v24 = [[WFCredentialsContext alloc] initWithNetwork:v6 profile:v9 authTraits:[(WFNetworkListController *)self _defaultAuthTraits]];
    if ([(WFNetworkListController *)self _supportsWiFiPasswordSharing])
    {
      if ([MEMORY[0x263F6C280] passwordSharingAvailability]) {
        BOOL v25 = 0;
      }
      else {
        BOOL v25 = [(WFCredentialsContext *)v6 securityMode] == 4
      }
           || [(WFCredentialsContext *)v6 securityMode] == 8
           || [(WFCredentialsContext *)v6 securityMode] == 512
           || [(WFCredentialsContext *)v6 securityMode] == 520;
      [(WFCredentialsContext *)v24 setPasswordSharingSupported:v25];
    }
    long long v26 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v26 && os_log_type_enabled(v26, v27))
    {
      *(_DWORD *)buf = 136315650;
      os_log_type_t v55 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]";
      __int16 v56 = 2112;
      uint64_t v57 = v6;
      __int16 v58 = 2112;
      BOOL v59 = v17;
      _os_log_impl(&dword_226071000, v26, v27, "%s: prompting for password (network %@ profile %@)", buf, 0x20u);
    }

    uint64_t v28 = [(WFNetworkListController *)self viewProvider];
    char v29 = objc_opt_respondsToSelector();

    id v30 = [(WFNetworkListController *)self viewProvider];
    id v31 = [v30 credentialsViewControllerWithContext:v24];

    if (v31)
    {
      [(WFCredentialsContext *)v24 setProvider:v31];
      if (v29)
      {
        id v32 = WFLogForCategory(0);
        os_log_type_t v33 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v32 && os_log_type_enabled(v32, v33))
        {
          *(_DWORD *)buf = 138412546;
          os_log_type_t v55 = v31;
          __int16 v56 = 2112;
          uint64_t v57 = v24;
          _os_log_impl(&dword_226071000, v32, v33, "viewProvider will handle presentation of %@ (context %@)", buf, 0x16u);
        }

        __int16 v34 = [(WFNetworkListController *)self viewProvider];
        [v34 presentNetworkViewController:v31 forContext:v24];
      }
      else
      {
        __int16 v34 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v31];
        [v34 setModalPresentationStyle:2];
        if ([(WFNetworkListController *)self associatingToOtherNetwork]) {
          [(WFNetworkListController *)self otherNetworkVC];
        }
        else {
        __int16 v37 = [(WFNetworkListController *)self viewController];
        }
        [v37 presentViewController:v34 animated:1 completion:0];
      }
      [(WFNetworkListController *)self setCredentialsContext:v24];
      [(WFNetworkListController *)self setVisibleContext:v24];
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v24);
      objc_initWeak(&from, v9);
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_240;
      v44[3] = &unk_26478E990;
      objc_copyWeak(&v45, (id *)buf);
      objc_copyWeak(&v46, &location);
      [(WFCredentialsContext *)v24 setCancellationHandler:v44];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_2;
      v38[3] = &unk_26478EAA0;
      objc_copyWeak(&v41, (id *)buf);
      objc_copyWeak(&v42, &from);
      uint64_t v39 = v9;
      objc_copyWeak(&v43, &location);
      os_log_type_t v40 = v6;
      [(WFCredentialsContext *)v24 setCompletionHandler:v38];

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&v46);
      objc_destroyWeak(&v45);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v35 = WFLogForCategory(0);
      os_log_type_t v36 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v35 && os_log_type_enabled(v35, v36))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v35, v36, "credentialsViewController is nil -- cancelling credentials prompt", buf, 2u);
      }

      [(WFNetworkListController *)self _promptCredentialsForNetworkCancelled:v24];
    }
  }
}

void __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = objc_loadWeakRetained(a1 + 7);
  if ([WeakRetained userCancelled])
  {
    os_log_type_t v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 136315138;
      long long v26 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]_block_invoke";
      _os_log_impl(&dword_226071000, v4, v5, "%s: User cancelled association", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_233;
    block[3] = &unk_26478E528;
    void block[4] = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v6 = (void *)[a1[4] mutableCopy];
    if (!v6)
    {
      uint64_t v7 = [a1[5] matchingKnownNetworkProfile];

      if (!v7
        || (id v8 = [WFNetworkProfile alloc],
            [a1[5] matchingKnownNetworkProfile],
            id v9 = objc_claimAutoreleasedReturnValue(),
            os_log_type_t v10 = [(WFNetworkProfile *)v8 initWithCoreWiFiProfile:v9],
            id v6 = (void *)[(WFNetworkProfile *)v10 mutableCopy],
            v10,
            v9,
            !v6))
      {
        id v6 = +[WFMutableNetworkProfile mutableProfileForNetwork:a1[5]];
      }
    }
    uint64_t v11 = (__SecCertificate *)[WeakRetained WAPIRootCertificate];
    uint64_t v12 = [WeakRetained WAPIIdentityPEMBlob];
    __int16 v13 = WFWAPICertificateBlobString(v11, v12);
    [v6 setPassword:v13];

    [v6 setUserProvidedPassword:1];
    os_log_type_t v14 = [v6 password];

    if (v14)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_234;
      v21[3] = &unk_26478E7B0;
      v21[4] = v3;
      id v22 = a1[5];
      id v23 = v6;
      dispatch_async(MEMORY[0x263EF83A0], v21);
    }
    else
    {
      os_log_type_t v15 = WFLogForCategory(0);
      uint64_t v16 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v15)
      {
        __int16 v17 = v15;
        if (os_log_type_enabled(v17, (os_log_type_t)v16))
        {
          uint64_t v18 = [WeakRetained WAPIRootCertificate];
          uint64_t v19 = [WeakRetained WAPIIdentityPEMBlob];
          *(_DWORD *)buf = 138412546;
          long long v26 = (const char *)v18;
          __int16 v27 = 2112;
          uint64_t v28 = v19;
          _os_log_impl(&dword_226071000, v17, (os_log_type_t)v16, "Unable to create WAPI password from Root: %@ IdentityBlob: %@", buf, 0x16u);
        }
      }

      uint64_t v20 = [MEMORY[0x263F087E8] associationErrorWithReason:9];
      [v3 _associationDidFinish:0 error:v20 network:0];
    }
  }
}

void __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_233(uint64_t a1)
{
  [*(id *)(a1 + 32) setOtherNetworkVC:0];
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F087E8] associationErrorWithReason:6];
  [v2 _associationDidFinish:0 error:v3 network:0];
}

uint64_t __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_234(uint64_t a1)
{
  return [*(id *)(a1 + 32) _associateToNetwork:*(void *)(a1 + 40) profile:*(void *)(a1 + 48)];
}

void __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_240(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _promptCredentialsForNetworkCancelled:v2];
}

void __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    int v21 = 136315650;
    id v22 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]_block_invoke_2";
    __int16 v23 = 2112;
    id v24 = v5;
    __int16 v25 = 1024;
    int v26 = a3;
    _os_log_impl(&dword_226071000, v7, v8, "%s: credentials prompt complete, provider %@, shouldDismiss %d", (uint8_t *)&v21, 0x1Cu);
  }

  id v9 = objc_loadWeakRetained((id *)(a1 + 56));
  os_log_type_t v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [*(id *)(a1 + 32) password];
  [v10 setPreviousPassword:v11];

  objc_msgSend(v10, "setTLSIdentity:", objc_msgSend(v5, "TLSIdentity"));
  uint64_t v12 = [v5 username];
  [v10 setUsername:v12];

  __int16 v13 = [v5 password];
  [v10 setPassword:v13];

  [v10 setUserProvidedPassword:1];
  id v14 = objc_loadWeakRetained((id *)(a1 + 64));
  int v15 = [v14 passwordReceivedFromPasswordSharing];

  if (v15)
  {
    uint64_t v16 = WFLogForCategory(0);
    os_log_type_t v17 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v16)
    {
      uint64_t v18 = v16;
      if (os_log_type_enabled(v18, v17))
      {
        uint64_t v19 = [v10 ssid];
        int v21 = 136315394;
        id v22 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]_block_invoke";
        __int16 v23 = 2112;
        id v24 = v19;
        _os_log_impl(&dword_226071000, v18, v17, "%s: password for '%@' received from password sharing", (uint8_t *)&v21, 0x16u);
      }
    }

    [v10 setAddedFromWiFiPasswordSharing:1];
  }
  [WeakRetained _associateToScanRecord:*(void *)(a1 + 40) profile:v10];
  if (a3)
  {
    id v20 = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _dismissCredentialsViewControllerWithContext:v20];
  }
}

- (void)_promptCredentialsForNetworkCancelled:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v8 = 136315138;
    id v9 = "-[WFNetworkListController _promptCredentialsForNetworkCancelled:]";
    _os_log_impl(&dword_226071000, v5, v6, "%s: user cancelled credentials prompt", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [MEMORY[0x263F087E8] associationErrorWithReason:6];
  [(WFNetworkListController *)self _associationDidFinish:0 error:v7 network:0];

  [(WFNetworkListController *)self _dismissCredentialsViewControllerWithContext:v4];
}

- (void)_promptTrustCertificateForNetwork:(id)a3 certificateChain:(id)a4 profile:(id)a5 autoJoin:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v10 = (char *)a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = [(WFNetworkListController *)self credentialsContext];
  if (v13)
  {
    BOOL v14 = [(WFNetworkListController *)self associatingToOtherNetwork];

    if (!v14)
    {
      int v15 = WFLogForCategory(0);
      os_log_type_t v16 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v15 && os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v44 = "-[WFNetworkListController _promptTrustCertificateForNetwork:certificateChain:profile:autoJoin:]";
        _os_log_impl(&dword_226071000, v15, v16, "%s: dismissing credentials view controller", buf, 0xCu);
      }

      os_log_type_t v17 = [(WFNetworkListController *)self credentialsContext];
      [(WFNetworkListController *)self _dismissCredentialsViewControllerWithContext:v17];
    }
  }
  uint64_t v18 = WFLogForCategory(5uLL);
  os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v18)
  {
    id v20 = v18;
    if (os_log_type_enabled(v20, v19))
    {
      int v21 = [(WFNetworkListController *)self associationContext];
      *(_DWORD *)buf = 138413058;
      uint64_t v44 = v10;
      __int16 v45 = 1024;
      *(_DWORD *)id v46 = v6;
      *(_WORD *)&v46[4] = 2112;
      *(void *)&v46[6] = v12;
      __int16 v47 = 2112;
      os_log_type_t v48 = v21;
      _os_log_impl(&dword_226071000, v20, v19, "prompting trust cert for %@ autojoin=%d (profile %@) - associationCtx: %@", buf, 0x26u);
    }
  }

  id v22 = [[WFCertificateContext alloc] initWithNetwork:v10 profile:v12 certificateChain:v11];
  __int16 v23 = [(WFNetworkListController *)self viewProvider];
  id v24 = [v23 certificateViewControllerWithContext:v22];

  [(WFCertificateContext *)v22 setProvider:v24];
  __int16 v25 = [(WFNetworkListController *)self viewProvider];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    uint64_t v27 = WFLogForCategory(0);
    os_log_type_t v28 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v27 && os_log_type_enabled(v27, v28))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = v24;
      __int16 v45 = 2112;
      *(void *)id v46 = v22;
      _os_log_impl(&dword_226071000, v27, v28, "viewProvider will handle presentation of %@ (context %@)", buf, 0x16u);
    }

    uint64_t v29 = [(WFNetworkListController *)self viewProvider];
    [v29 presentNetworkViewController:v24 forContext:v22];
  }
  else
  {
    id v30 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v31 = [v30 userInterfaceIdiom];

    if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      [v24 setModalPresentationStyle:2];
    }
    if ([(WFNetworkListController *)self associatingToOtherNetwork]) {
      [(WFNetworkListController *)self otherNetworkVC];
    }
    else {
    uint64_t v29 = [(WFNetworkListController *)self viewController];
    }
    [v29 presentViewController:v24 animated:1 completion:0];
  }

  [(WFNetworkListController *)self setCertificateContext:v22];
  [(WFNetworkListController *)self setVisibleContext:v22];
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v12);
  objc_initWeak(&from, v22);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __95__WFNetworkListController__promptTrustCertificateForNetwork_certificateChain_profile_autoJoin___block_invoke;
  v34[3] = &unk_26478EAC8;
  objc_copyWeak(&v37, &location);
  BOOL v40 = v6;
  objc_copyWeak(&v38, (id *)buf);
  id v32 = v11;
  id v35 = v32;
  os_log_type_t v33 = v10;
  os_log_type_t v36 = v33;
  objc_copyWeak(&v39, &from);
  [(WFCertificateContext *)v22 setCompletionHandler:v34];
  objc_destroyWeak(&v39);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __95__WFNetworkListController__promptTrustCertificateForNetwork_certificateChain_profile_autoJoin___block_invoke(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      if (*(unsigned char *)(a1 + 72))
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 56));
        BOOL v6 = [v5 wifiClient];
        [v6 dispatchCertificateTrustAction:0 profile:WeakRetained];
      }
      id v7 = (id)[WeakRetained mutableCopy];
      [v7 setCertificateChain:*(void *)(a1 + 32)];
      int v8 = WFLogForCategory(5uLL);
      os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8)
      {
        uint64_t v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          id v11 = [v7 ssid];
          int v23 = 138412290;
          id v24 = v11;
          _os_log_impl(&dword_226071000, v10, v9, "user accepted trust prompt for %@", (uint8_t *)&v23, 0xCu);
        }
      }

      id v12 = objc_loadWeakRetained((id *)(a1 + 56));
      [v12 _associateToEnterpriseNetwork:*(void *)(a1 + 40) profile:v7];
    }
    else
    {
      __int16 v13 = WFLogForCategory(5uLL);
      os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13)
      {
        int v15 = v13;
        if (os_log_type_enabled(v15, v14))
        {
          os_log_type_t v16 = [WeakRetained ssid];
          int v23 = 138412290;
          id v24 = v16;
          _os_log_impl(&dword_226071000, v15, v14, "user did not accept trust prompt for %@", (uint8_t *)&v23, 0xCu);
        }
      }

      if (*(unsigned char *)(a1 + 72))
      {
        id v17 = objc_loadWeakRetained((id *)(a1 + 56));
        uint64_t v18 = [v17 wifiClient];
        [v18 dispatchCertificateTrustAction:1 profile:WeakRetained];
      }
      id v19 = objc_loadWeakRetained((id *)(a1 + 56));
      id v20 = [MEMORY[0x263F087E8] associationErrorWithReason:6];
      [v19 _associationDidFinish:0 error:v20 network:0];

      id v7 = objc_loadWeakRetained((id *)(a1 + 56));
      id v12 = [v7 interface];
      [v12 disassociateFromCurrentNetwork];
    }

    id v21 = objc_loadWeakRetained((id *)(a1 + 56));
    id v22 = objc_loadWeakRetained((id *)(a1 + 64));
    [v21 _dismissTrustViewControllerWithContext:v22];
  }
}

- (unint64_t)_getLockdownModeSecurityType:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scanResult];
  if ([v4 isOpen])
  {

LABEL_4:
    unint64_t v7 = 0;
    goto LABEL_5;
  }
  id v5 = [v3 scanResult];
  char v6 = [v5 isOWE];

  if (v6) {
    goto LABEL_4;
  }
  os_log_type_t v9 = [v3 scanResult];
  char v10 = [v9 isWEP];

  if (v10)
  {
    unint64_t v7 = 2;
  }
  else
  {
    id v11 = [v3 scanResult];
    char v12 = [v11 isWAPI];

    if (v12)
    {
      unint64_t v7 = 3;
    }
    else
    {
      __int16 v13 = [v3 scanResult];
      char v14 = [v13 hasTKIPCipher];

      if (v14)
      {
        unint64_t v7 = 4;
      }
      else
      {
        int v15 = [v3 scanResult];
        char v16 = [v15 isPasspoint];

        if (v16)
        {
          unint64_t v7 = 5;
        }
        else
        {
          id v17 = [v3 scanResult];
          uint64_t v18 = [v17 matchingKnownNetworkProfile];
          int v19 = [v18 isCaptive];

          if (v19) {
            unint64_t v7 = 6;
          }
          else {
            unint64_t v7 = 7;
          }
        }
      }
    }
  }
LABEL_5:

  return v7;
}

- (BOOL)_canStartAssociationToNetwork:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WFNetworkListController *)self _canPromptForInstantHotspot])
  {
    id v5 = [(WFNetworkListController *)self interface];
    char v6 = [v5 ipMonitor];
    int v7 = [v6 personalHotspotHasClients];

    if (v7)
    {
      int v8 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
      {
        char v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          id v11 = [(WFNetworkListController *)self viewController];
          *(_DWORD *)buf = 138412290;
          id v85 = v11;
          _os_log_impl(&dword_226071000, v10, v9, "Personal Hotspot has clients, %@ requires user to be prompted before associating", buf, 0xCu);
        }
      }

      objc_initWeak((id *)buf, self);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke;
      aBlock[3] = &unk_26478E680;
      objc_copyWeak(&v83, (id *)buf);
      id v12 = v4;
      id v82 = v12;
      __int16 v13 = _Block_copy(aBlock);
      char v14 = (void *)MEMORY[0x263F863B0];
      int v15 = [v12 ssid];
      char v16 = [v14 hotspotAlertControllerWithNetworkName:v15 completionHandler:v13];

      id v17 = [(WFNetworkListController *)self viewController];
      [v17 presentViewController:v16 animated:1 completion:0];

      objc_destroyWeak(&v83);
      objc_destroyWeak((id *)buf);
      goto LABEL_41;
    }
  }
  if ([(WFNetworkListController *)self _canPromptForCarPlay])
  {
    if ([(WFNetworkListController *)self _isActiveCarPlaySession])
    {
      uint64_t v18 = [(WFNetworkListController *)self interface];
      int v19 = [v18 currentNetwork];
      char v20 = [v19 isEqual:v4];

      if ((v20 & 1) == 0)
      {
        id v30 = WFLogForCategory(0);
        os_log_type_t v31 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v30 && os_log_type_enabled(v30, v31))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226071000, v30, v31, "In active CarPlay session, prompting user", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        v78[2] = __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_244;
        v78[3] = &unk_26478E680;
        objc_copyWeak(&v80, (id *)buf);
        id v32 = v4;
        id v79 = v32;
        os_log_type_t v33 = _Block_copy(v78);
        __int16 v34 = [v32 ssid];
        [(WFNetworkListController *)self _promptToDisableCarPlayForNetworkName:v34 handler:v33];

        objc_destroyWeak(&v80);
        objc_destroyWeak((id *)buf);
        goto LABEL_41;
      }
    }
  }
  if (self->_lockdownModeEnabled)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v21 = [v4 scanResult];
      char v22 = [v21 isAllowedInLockdownMode];

      if ((v22 & 1) == 0)
      {
        uint64_t v25 = WFLogForCategory(0);
        os_log_type_t v26 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v25 && os_log_type_enabled(v25, v26))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226071000, v25, v26, "In Lockdown Mode, prompting user", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        v75[0] = MEMORY[0x263EF8330];
        v75[1] = 3221225472;
        v75[2] = __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_245;
        v75[3] = &unk_26478E680;
        objc_copyWeak(&v77, (id *)buf);
        id v27 = v4;
        id v76 = v27;
        os_log_type_t v28 = _Block_copy(v75);
        uint64_t v29 = [v27 scanResult];
        if ([v29 isOpen])
        {
        }
        else
        {
          os_log_type_t v50 = [v27 scanResult];
          char v51 = [v50 isOWE];

          if ((v51 & 1) == 0)
          {
            __int16 v58 = [v27 scanResult];
            char v59 = [v58 isWEP];

            if (v59)
            {
              uint64_t v52 = 2;
            }
            else
            {
              uint64_t v60 = [v27 scanResult];
              char v61 = [v60 isWAPI];

              if (v61)
              {
                uint64_t v52 = 3;
              }
              else
              {
                v62 = [v27 scanResult];
                char v63 = [v62 hasTKIPCipher];

                if (v63)
                {
                  uint64_t v52 = 4;
                }
                else
                {
                  double v64 = [v27 scanResult];
                  char v65 = [v64 isPasspoint];

                  if (v65)
                  {
                    uint64_t v52 = 5;
                  }
                  else
                  {
                    id v66 = [v27 scanResult];
                    id v67 = [v66 matchingKnownNetworkProfile];
                    int v68 = [v67 isCaptive];

                    if (v68) {
                      uint64_t v52 = 6;
                    }
                    else {
                      uint64_t v52 = 7;
                    }
                  }
                }
              }
            }
            goto LABEL_40;
          }
        }
        uint64_t v52 = 0;
LABEL_40:
        uint64_t v53 = (void *)MEMORY[0x263F863C0];
        v54 = [v27 ssid];
        os_log_type_t v55 = [v53 lockdownModeAlertControllerWithNetworkName:v54 securityType:v52 completionHandler:v28];

        __int16 v56 = [(WFNetworkListController *)self viewController];
        [v56 presentViewController:v55 animated:1 completion:0];

        objc_destroyWeak(&v77);
        objc_destroyWeak((id *)buf);
LABEL_41:
        BOOL v49 = 0;
        goto LABEL_42;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v23 = [v4 matchingKnownNetworkProfile];
    if (v23)
    {
      id v24 = [v4 matchingKnownNetworkProfile];
      if (([v24 supportedSecurityTypes] & 0x40) != 0)
      {
        uint64_t v35 = [v4 securityMode];

        if (v35 == 520)
        {
          os_log_type_t v36 = WFLogForCategory(5uLL);
          os_log_type_t v37 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v36)
          {
            id v38 = v36;
            if (os_log_type_enabled(v38, v37))
            {
              id v39 = WFStringFromWFSecurityModeExt(512);
              BOOL v40 = WFStringFromWFSecurityModeExt([v4 securityMode]);
              *(_DWORD *)buf = 138412802;
              id v85 = v4;
              __int16 v86 = 2112;
              v87 = v39;
              __int16 v88 = 2112;
              v89 = v40;
              _os_log_impl(&dword_226071000, v38, v37, "mismatched security for %@ (expected='%@', actual='%@')", buf, 0x20u);
            }
          }

          objc_initWeak((id *)buf, self);
          uint64_t v69 = MEMORY[0x263EF8330];
          uint64_t v70 = 3221225472;
          uint64_t v71 = __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_246;
          os_log_type_t v72 = &unk_26478E680;
          objc_copyWeak(&v74, (id *)buf);
          id v41 = v4;
          id v73 = v41;
          id v42 = _Block_copy(&v69);
          id v43 = WFWiFiLocalizedStringFromSecurityMode(512);
          uint64_t v44 = WFWiFiLocalizedStringFromSecurityMode(objc_msgSend(v41, "securityMode", v69, v70, v71, v72));
          __int16 v45 = (void *)MEMORY[0x263F863E8];
          id v46 = [v41 ssid];
          __int16 v47 = [v45 securityMismatchAlertControllerWithNetworkName:v46 previousSecurity:v43 newSecurity:v44 completionHandler:v42];

          os_log_type_t v48 = [(WFNetworkListController *)self viewController];
          [v48 presentViewController:v47 animated:1 completion:0];

          objc_destroyWeak(&v74);
          objc_destroyWeak((id *)buf);
          goto LABEL_41;
        }
      }
      else
      {
      }
    }
  }
  BOOL v49 = 1;
LABEL_42:

  return v49;
}

void __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (!a2)
  {
    char v6 = WFLogForCategory(0);
    int v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v6 || !os_log_type_enabled(v6, (os_log_type_t)v7)) {
      goto LABEL_13;
    }
    __int16 v10 = 0;
    int v8 = "User declined to stop personal hotspot- canceling association";
    os_log_type_t v9 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  if (![WeakRetained _disablePersonalHotspot])
  {
    char v6 = WFLogForCategory(0);
    LOBYTE(v7) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v6 || !os_log_type_enabled(v6, (os_log_type_t)v7)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    int v8 = "Failed to disable personal hotspot- canceling association";
    os_log_type_t v9 = buf;
LABEL_12:
    _os_log_impl(&dword_226071000, v6, (os_log_type_t)v7, v8, v9, 2u);
LABEL_13:

    goto LABEL_14;
  }
  [v5 _associateToScanRecord:*(void *)(a1 + 32) profile:0];
LABEL_14:
}

void __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_244(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  BOOL v8 = (unint64_t)WFCurrentLogLevel() > 2 && v5 != 0;
  if (a2)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v5, v6, "Disssociating from current CarPlay network", buf, 2u);
    }

    os_log_type_t v9 = [WeakRetained interface];
    [v9 disassociateFromCurrentNetwork];

    [WeakRetained _associateToScanRecord:*(void *)(a1 + 32) profile:0];
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)__int16 v10 = 0;
      _os_log_impl(&dword_226071000, v5, v6, "User declined to stop CarPlay session- canceling association", v10, 2u);
    }
  }
}

void __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_245(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (a2)
  {
    os_log_type_t v6 = [WeakRetained interface];
    [v6 disassociateFromCurrentNetwork];

    [v5 _associateToScanRecord:*(void *)(a1 + 32) profile:0];
  }
  else
  {
    int v7 = WFLogForCategory(0);
    int v8 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, (os_log_type_t)v8))
    {
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl(&dword_226071000, v7, (os_log_type_t)v8, "User declined joining non-secure network in Lockdown Mode- canceling association", v9, 2u);
    }
  }
}

void __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_246(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WFLogForCategory(5uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = !v7;
  if (a2)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v5, v6, "user accepted confirmation", buf, 2u);
    }

    [WeakRetained _associateToScanRecord:*(void *)(a1 + 32) profile:0];
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl(&dword_226071000, v5, v6, "user cancelled confirmation", v9, 2u);
    }
  }
}

- (BOOL)_canStartAssociationToUserSuppliedNetwork:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WFNetworkListController *)self _canPromptForInstantHotspot])
  {
    id v5 = [(WFNetworkListController *)self interface];
    os_log_type_t v6 = [v5 ipMonitor];
    int v7 = [v6 personalHotspotHasClients];

    if (v7)
    {
      int v8 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
      {
        __int16 v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          id v11 = [(WFNetworkListController *)self viewController];
          *(_DWORD *)buf = 138412290;
          id v38 = v11;
          _os_log_impl(&dword_226071000, v10, v9, "Personal Hotspot has clients, %@ requires user to be prompted before associating", buf, 0xCu);
        }
      }

      objc_initWeak((id *)buf, self);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__WFNetworkListController__canStartAssociationToUserSuppliedNetwork___block_invoke;
      aBlock[3] = &unk_26478E680;
      objc_copyWeak(&v36, (id *)buf);
      id v12 = v4;
      id v35 = v12;
      __int16 v13 = _Block_copy(aBlock);
      char v14 = (void *)MEMORY[0x263F863B0];
      int v15 = [v12 ssid];
      char v16 = [v14 hotspotAlertControllerWithNetworkName:v15 completionHandler:v13];

      id v17 = [(WFNetworkListController *)self otherNetworkVC];
      [v17 presentViewController:v16 animated:1 completion:0];

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
LABEL_18:
      BOOL v21 = 0;
      goto LABEL_19;
    }
  }
  if ([(WFNetworkListController *)self _canPromptForCarPlay])
  {
    if ([(WFNetworkListController *)self _isActiveCarPlaySession])
    {
      uint64_t v18 = [(WFNetworkListController *)self interface];
      int v19 = [v18 currentNetwork];
      char v20 = [v19 isEqual:v4];

      if ((v20 & 1) == 0)
      {
        char v22 = WFLogForCategory(0);
        os_log_type_t v23 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v22 && os_log_type_enabled(v22, v23))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226071000, v22, v23, "In active CarPlay session, prompting user", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        uint64_t v28 = MEMORY[0x263EF8330];
        uint64_t v29 = 3221225472;
        id v30 = __69__WFNetworkListController__canStartAssociationToUserSuppliedNetwork___block_invoke_248;
        os_log_type_t v31 = &unk_26478E680;
        objc_copyWeak(&v33, (id *)buf);
        id v24 = v4;
        id v32 = v24;
        uint64_t v25 = _Block_copy(&v28);
        os_log_type_t v26 = objc_msgSend(v24, "ssid", v28, v29, v30, v31);
        [(WFNetworkListController *)self _promptToDisableCarPlayForNetworkName:v26 handler:v25];

        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
        goto LABEL_18;
      }
    }
  }
  BOOL v21 = 1;
LABEL_19:

  return v21;
}

void __69__WFNetworkListController__canStartAssociationToUserSuppliedNetwork___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (!a2)
  {
    os_log_type_t v6 = WFLogForCategory(0);
    int v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v6 || !os_log_type_enabled(v6, (os_log_type_t)v7)) {
      goto LABEL_13;
    }
    __int16 v10 = 0;
    int v8 = "User declined to stop personal hotspot- canceling association";
    os_log_type_t v9 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  if (![WeakRetained _disablePersonalHotspot])
  {
    os_log_type_t v6 = WFLogForCategory(0);
    LOBYTE(v7) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v6 || !os_log_type_enabled(v6, (os_log_type_t)v7)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    int v8 = "Failed to disable personal hotspot- canceling association";
    os_log_type_t v9 = buf;
LABEL_12:
    _os_log_impl(&dword_226071000, v6, (os_log_type_t)v7, v8, v9, 2u);
LABEL_13:

    goto LABEL_14;
  }
  [v5 _associateToUserSuppliedNetwork:*(void *)(a1 + 32)];
LABEL_14:
}

void __69__WFNetworkListController__canStartAssociationToUserSuppliedNetwork___block_invoke_248(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  BOOL v8 = (unint64_t)WFCurrentLogLevel() > 2 && v5 != 0;
  if (a2)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v5, v6, "Disssociating from current CarPlay network", buf, 2u);
    }

    os_log_type_t v9 = [WeakRetained interface];
    [v9 disassociateFromCurrentNetwork];

    [WeakRetained _associateToUserSuppliedNetwork:*(void *)(a1 + 32)];
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)__int16 v10 = 0;
      _os_log_impl(&dword_226071000, v5, v6, "User declined to stop CarPlay session- canceling association", v10, 2u);
    }
  }
}

- (void)_associationWillStart:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  id v5 = WFLogForCategory(5uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "association will start for %@", buf, 0xCu);
  }

  uint64_t v7 = [(WFNetworkListController *)self associationContext];
  if (v7
    && (BOOL v8 = (void *)v7,
        [(WFNetworkListController *)self associationContext],
        os_log_type_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 state],
        v9,
        v8,
        v10 == 2))
  {
    id v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v11)
    {
      __int16 v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        char v14 = [(WFNetworkListController *)self associationContext];
        int v15 = [v14 stateDescription];
        char v16 = [(WFNetworkListController *)self associationContext];
        id v17 = [v16 networkName];
        *(_DWORD *)buf = 136315650;
        v54 = "-[WFNetworkListController _associationWillStart:]";
        __int16 v55 = 2112;
        __int16 v56 = v15;
        __int16 v57 = 2112;
        __int16 v58 = v17;
        _os_log_impl(&dword_226071000, v13, v12, "%s association already in progress current state is <%@> with network %@", buf, 0x20u);
      }
    }

    uint64_t v18 = [(WFNetworkListController *)self associationContext];
    [v18 setState:1];
  }
  else
  {
    if (v4)
    {
      char v51 = @"network";
      uint64_t v52 = v4;
      int v19 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    }
    else
    {
      int v19 = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__WFNetworkListController__associationWillStart___block_invoke;
    block[3] = &unk_26478E7D8;
    void block[4] = self;
    id v48 = v19;
    id v50 = v48;
    dispatch_async(MEMORY[0x263EF83A0], block);
    char v20 = [[WFAssociationContext alloc] initWithNetwork:v4];
    [(WFAssociationContext *)v20 setState:1];
    BOOL v21 = [(WFNetworkListController *)self scanMetricsManager];
    char v22 = [v21 sectionNameForRecord:v4];
    [(WFAssociationContext *)v20 setSectionNameJoined:v22];

    os_log_type_t v23 = [(WFNetworkListController *)self scanMetricsManager];
    id v24 = [v23 sectionCounts];
    [(WFAssociationContext *)v20 setSectionCounts:v24];

    uint64_t v25 = [(WFNetworkListController *)self associationContextQueue];
    [v25 push:v20];

    os_log_type_t v26 = [(WFNetworkListController *)self associationContextQueue];
    id v27 = [v26 peek];

    uint64_t v28 = [v27 network];
    char v29 = [v28 isEqual:v4];

    if (v29)
    {
      id v30 = v27;
    }
    else
    {
      do
      {
        os_log_type_t v31 = WFLogForCategory(0);
        os_log_type_t v32 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v31)
        {
          id v33 = v31;
          if (os_log_type_enabled(v33, v32))
          {
            __int16 v34 = [v4 ssid];
            *(_DWORD *)buf = 138412546;
            v54 = v34;
            __int16 v55 = 2112;
            __int16 v56 = v27;
            _os_log_impl(&dword_226071000, v33, v32, "top association context in queue doesn't match current association attempt network: %@, skipping context: %@", buf, 0x16u);
          }
        }

        id v35 = [(WFNetworkListController *)self associationContextQueue];
        id v36 = (id)[v35 pop];

        os_log_type_t v37 = [(WFNetworkListController *)self associationContextQueue];
        id v30 = [v37 peek];

        id v38 = [v30 network];
        int v39 = [v38 isEqual:v4];

        id v27 = v30;
      }
      while (!v39);
    }
    BOOL v40 = [(WFNetworkListController *)self associationContextQueue];
    id v41 = [v40 peek];
    [(WFNetworkListController *)self setAssociationContext:v41];

    [(WFNetworkListController *)self _pauseScanning];
    id v42 = [(WFNetworkListController *)self wifiClient];
    [v42 setAutoJoinEnabled:0];

    id v43 = WFLogForCategory(5uLL);
    os_log_type_t v44 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v43)
    {
      __int16 v45 = v43;
      if (os_log_type_enabled(v45, v44))
      {
        id v46 = [(WFNetworkListController *)self associationContext];
        __int16 v47 = [v4 ssid];
        *(_DWORD *)buf = 138412546;
        v54 = v46;
        __int16 v55 = 2112;
        __int16 v56 = v47;
        _os_log_impl(&dword_226071000, v45, v44, "association context: %@ for %@", buf, 0x16u);
      }
    }

    uint64_t v18 = v48;
  }
}

void __49__WFNetworkListController__associationWillStart___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFNetworkListControllerAssociationDidStartNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)_associationDidFinish:(BOOL)a3 error:(id)a4 network:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__WFNetworkListController__associationDidFinish_error_network___block_invoke;
  v12[3] = &unk_26478EAF0;
  BOOL v15 = a3;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __63__WFNetworkListController__associationDidFinish_error_network___block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) associationContext];
  id v3 = [v2 networkName];

  id v4 = WFLogForCategory(5uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    int v68 = v3;
    __int16 v69 = 1024;
    LODWORD(v70) = v6;
    _os_log_impl(&dword_226071000, v4, v5, "{ASSOC-} association finished for %@ - success %d", buf, 0x12u);
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = WFLogForCategory(5uLL);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7)
    {
      id v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        id v10 = WFAssociationErrorCodeToString([*(id *)(a1 + 40) code]);
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        int v68 = v10;
        __int16 v69 = 2112;
        uint64_t v70 = v11;
        _os_log_impl(&dword_226071000, v9, v8, "association failure: <%@> (error %@)", buf, 0x16u);
      }
    }
  }
  os_log_type_t v12 = [*(id *)(a1 + 32) credentialsContext];

  if (v12)
  {
    id v13 = WFLogForCategory(5uLL);
    os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      int v68 = v3;
      _os_log_impl(&dword_226071000, v13, v14, "dismissing credentials view controller for %@", buf, 0xCu);
    }

    BOOL v15 = *(void **)(a1 + 32);
    char v16 = [v15 credentialsContext];
    [v15 _dismissCredentialsViewControllerWithContext:v16];
  }
  if ([*(id *)(a1 + 32) isAssociating])
  {
    id v17 = [*(id *)(a1 + 32) associationContextQueue];
    id v18 = (id)[v17 pop];

    int v19 = [*(id *)(a1 + 32) associationContextQueue];
    char v20 = [v19 peek];
    [*(id *)(a1 + 32) setAssociationContext:v20];

    if (!*(unsigned char *)(a1 + 56))
    {
      BOOL v21 = WFLogForCategory(0);
      os_log_type_t v22 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v21 && os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)buf = 138412290;
        int v68 = v3;
        _os_log_impl(&dword_226071000, v21, v22, "failed to associate to '%@', forcing current network update", buf, 0xCu);
      }

      os_log_type_t v23 = [*(id *)(a1 + 32) interface];
      [v23 asyncCurrentNetwork:0];
    }
    id v24 = *(id *)(a1 + 40);
    uint64_t v25 = v24;
    if (!*(unsigned char *)(a1 + 56) && !v24)
    {
      uint64_t v25 = [MEMORY[0x263F087E8] associationErrorWithReason:12];
    }
    if (v25)
    {
      char v65 = @"error";
      id v66 = v25;
      os_log_type_t v26 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    }
    else
    {
      __int16 v34 = [*(id *)(a1 + 32) interface];
      id v35 = [v34 currentNetwork];

      if (v35)
      {
        id v36 = [*(id *)(a1 + 32) interface];
        os_log_type_t v37 = [v36 currentNetwork];
        id v38 = [v37 copy];

        char v63 = @"network";
        double v64 = v38;
        os_log_type_t v26 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        int v39 = WFLogForCategory(5uLL);
        os_log_type_t v40 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v39)
        {
          id v41 = v39;
          if (os_log_type_enabled(v41, v40))
          {
            id v42 = [*(id *)(a1 + 32) interface];
            id v43 = [v42 currentNetwork];
            *(_DWORD *)buf = 138412290;
            int v68 = v43;
            _os_log_impl(&dword_226071000, v41, v40, "notifying with network from WFInterface %@", buf, 0xCu);
          }
        }
      }
      else
      {
        uint64_t v55 = *(void *)(a1 + 48);
        if (!v55)
        {
          __int16 v58 = WFLogForCategory(5uLL);
          os_log_type_t v59 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v58 && os_log_type_enabled(v58, v59))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_226071000, v58, v59, "network to notify for WFNetworkListControllerAssociationNetworkKey is nil", buf, 2u);
          }

          os_log_type_t v26 = 0;
          goto LABEL_51;
        }
        char v61 = @"network";
        uint64_t v62 = v55;
        os_log_type_t v26 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        id v38 = WFLogForCategory(5uLL);
        os_log_type_t v56 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v38 && os_log_type_enabled(v38, v56))
        {
          __int16 v57 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138412290;
          int v68 = v57;
          _os_log_impl(&dword_226071000, v38, v56, "notifying with network from WFNetworkListController %@", buf, 0xCu);
        }
      }
    }
LABEL_51:
    os_log_type_t v44 = [MEMORY[0x263F08A00] defaultCenter];
    [v44 postNotificationName:@"WFNetworkListControllerAssociationDidFinishNotification" object:*(void *)(a1 + 32) userInfo:v26];

    if ([*(id *)(a1 + 32) associatingToOtherNetwork])
    {
      __int16 v45 = WFLogForCategory(5uLL);
      os_log_type_t v46 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v45)
      {
        __int16 v47 = v45;
        if (os_log_type_enabled(v47, v46))
        {
          id v48 = [*(id *)(a1 + 32) otherNetworkVC];
          *(_DWORD *)buf = 138412290;
          int v68 = v48;
          _os_log_impl(&dword_226071000, v47, v46, "association originated from otherNetworkVC: %@", buf, 0xCu);
        }
      }
    }
    [*(id *)(a1 + 32) setAssociatingToOtherNetwork:0];
    [*(id *)(a1 + 32) _updateViewControllerConnectedNetwork];
    if (*(unsigned char *)(a1 + 56)
      && [*(id *)(a1 + 32) isAirPortSettings]
      && ([*(id *)(a1 + 48) iOSHotspot] & 1) == 0)
    {
      BOOL v49 = WFLogForCategory(0);
      os_log_type_t v50 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v49 && os_log_type_enabled(v49, v50))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v68) = 5;
        _os_log_impl(&dword_226071000, v49, v50, "Scheduling a no internet test after successful association after %d seconds.", buf, 8u);
      }

      char v51 = [*(id *)(a1 + 32) healthManager];
      [v51 runNoInternetDiagnosticsAfter:5];
    }
    [*(id *)(a1 + 32) _resumeScanning];
    if ([*(id *)(a1 + 48) iOSHotspot])
    {
      uint64_t v52 = [*(id *)(a1 + 32) wifiClient];
      uint64_t v53 = [v52 interface];
      [v53 asyncCurrentNetwork:0];
    }
    v54 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__WFNetworkListController__associationDidFinish_error_network___block_invoke_251;
    block[3] = &unk_26478E528;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v54, block);

LABEL_69:
    goto LABEL_70;
  }
  id v27 = WFLogForCategory(5uLL);
  os_log_type_t v28 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v27)
  {
    char v29 = v27;
    if (os_log_type_enabled(v29, v28))
    {
      id v30 = [*(id *)(a1 + 32) associationContext];
      os_log_type_t v31 = [v30 stateDescription];
      *(_DWORD *)buf = 138412290;
      int v68 = v31;
      _os_log_impl(&dword_226071000, v29, v28, "no association in progress, current state: <%@>", buf, 0xCu);
    }
  }

  [*(id *)(a1 + 32) _updateViewControllerConnectedNetwork];
  if (*(unsigned char *)(a1 + 56)
    && [*(id *)(a1 + 32) isAirPortSettings]
    && ([*(id *)(a1 + 48) iOSHotspot] & 1) == 0)
  {
    os_log_type_t v32 = WFLogForCategory(0);
    os_log_type_t v33 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v32 && os_log_type_enabled(v32, v33))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v68) = 3;
      _os_log_impl(&dword_226071000, v32, v33, "Scheduling a no internet test after successful association after %d seconds.", buf, 8u);
    }

    uint64_t v25 = [*(id *)(a1 + 32) healthManager];
    [v25 runNoInternetDiagnosticsAfter:3];
    goto LABEL_69;
  }
LABEL_70:
}

void __63__WFNetworkListController__associationDidFinish_error_network___block_invoke_251(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) wifiClient];
  [v1 setAutoJoinEnabled:1];
}

- (void)_presentHotspotErrorContextWithDevice:(id)a3 hotspotError:(id)a4 failure:(int64_t)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    uint64_t v24 = *MEMORY[0x263F08608];
    v25[0] = v9;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  }
  else
  {
    uint64_t v11 = 0;
  }
  os_log_type_t v12 = [MEMORY[0x263F087E8] associationErrorWithReason:a5 userInfo:v11];
  id v13 = [[WFErrorContext alloc] initWithAssociationError:v12 network:v8 diagnosticsResult:0];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v13);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __86__WFNetworkListController__presentHotspotErrorContextWithDevice_hotspotError_failure___block_invoke;
  id v18 = &unk_26478E8F0;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  id v14 = v12;
  id v19 = v14;
  [(WFErrorContext *)v13 setCompletionHandler:&v15];
  -[WFNetworkListController _presentContext:contextType:](self, "_presentContext:contextType:", v13, 0, v15, v16, v17, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __86__WFNetworkListController__presentHotspotErrorContextWithDevice_hotspotError_failure___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _dismissErrorViewControllerWithContext:v4];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _associationDidFinish:0 error:*(void *)(a1 + 32) network:0];
}

- (void)_presentContext:(id)a3 contextType:(unint64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__WFNetworkListController__presentContext_contextType___block_invoke;
  block[3] = &unk_26478EB18;
  id v9 = v6;
  unint64_t v10 = a4;
  void block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__WFNetworkListController__presentContext_contextType___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) viewProvider];
  char v3 = objc_opt_respondsToSelector();

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == 1)
  {
    id v5 = *(id *)(a1 + 40);
    id v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      int v33 = 136315394;
      __int16 v34 = "-[WFNetworkListController _presentContext:contextType:]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v5;
      _os_log_impl(&dword_226071000, v14, v15, "%s: presenting lockdown mode context %@", (uint8_t *)&v33, 0x16u);
    }

    uint64_t v16 = [*(id *)(a1 + 32) viewProvider];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = [*(id *)(a1 + 32) viewProvider];
      id v19 = [v18 networkLockdownModeViewControllerWithContext:v5];
      [*(id *)(a1 + 32) setContextVC:v19];
    }
  }
  else
  {
    if (v4) {
      goto LABEL_20;
    }
    id v5 = *(id *)(a1 + 40);
    id v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      int v33 = 136315394;
      __int16 v34 = "-[WFNetworkListController _presentContext:contextType:]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v5;
      _os_log_impl(&dword_226071000, v6, v7, "%s: presenting error context %@", (uint8_t *)&v33, 0x16u);
    }

    id v8 = [*(id *)(a1 + 32) viewProvider];
    id v9 = [v8 networkErrorViewControllerWithContext:v5];
    [*(id *)(a1 + 32) setContextVC:v9];

    unint64_t v10 = [*(id *)(a1 + 32) contextVC];

    if (!v10)
    {
      uint64_t v11 = WFLogForCategory(0);
      uint64_t v12 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v11)
      {
        uint64_t v11 = v11;
        if (os_log_type_enabled(v11, (os_log_type_t)v12))
        {
          id v13 = [*(id *)(a1 + 32) viewProvider];
          int v33 = 136315650;
          __int16 v34 = "-[WFNetworkListController _presentContext:contextType:]_block_invoke";
          __int16 v35 = 2112;
          id v36 = v13;
          __int16 v37 = 2112;
          id v38 = v5;
          _os_log_impl(&dword_226071000, v11, (os_log_type_t)v12, "%s: provider (%@) did not return view for error %@", (uint8_t *)&v33, 0x20u);
        }
      }
      goto LABEL_35;
    }
  }
  id v20 = [*(id *)(a1 + 32) contextVC];
  [v5 setProvider:v20];

  [*(id *)(a1 + 32) setVisibleContext:v5];
LABEL_20:
  if ((v3 & 1) == 0)
  {
    id v27 = [*(id *)(a1 + 32) otherNetworkVC];
    if (v27 && (int v28 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 10), v27, v28))
    {
      uint64_t v29 = [*(id *)(a1 + 32) otherNetworkVC];
    }
    else
    {
      id v30 = [*(id *)(a1 + 32) credentialsContext];

      os_log_type_t v31 = *(void **)(a1 + 32);
      if (v30)
      {
        os_log_type_t v32 = [v31 credentialsContext];
        id v5 = [v32 provider];

LABEL_34:
        uint64_t v11 = [*(id *)(a1 + 32) contextVC];
        [v5 presentViewController:v11 animated:1 completion:0];
        goto LABEL_35;
      }
      uint64_t v29 = [v31 viewController];
    }
    id v5 = (id)v29;
    goto LABEL_34;
  }
  id v21 = WFLogForCategory(0);
  os_log_type_t v22 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v21)
  {
    os_log_type_t v23 = v21;
    if (os_log_type_enabled(v23, v22))
    {
      uint64_t v24 = [*(id *)(a1 + 32) contextVC];
      uint64_t v25 = [*(id *)(a1 + 32) visibleContext];
      int v33 = 138412546;
      __int16 v34 = v24;
      __int16 v35 = 2112;
      id v36 = v25;
      _os_log_impl(&dword_226071000, v23, v22, "viewProvider will handle presentation of %@ (context %@)", (uint8_t *)&v33, 0x16u);
    }
  }

  id v5 = [*(id *)(a1 + 32) viewProvider];
  uint64_t v11 = [*(id *)(a1 + 32) contextVC];
  os_log_type_t v26 = [*(id *)(a1 + 32) visibleContext];
  [v5 presentNetworkViewController:v11 forContext:v26];

LABEL_35:
}

- (void)_scanNetworkForAssociation:(id)a3 profile:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = WFLogForCategory(5uLL);
  os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_226071000, v8, v9, "scanning to associate for network='%@' profile='%@'", buf, 0x16u);
  }

  unint64_t v10 = [v6 ssid];
  uint64_t v11 = [(WFNetworkListController *)self interface];
  uint64_t v12 = [v11 deviceScanChannels];
  id v13 = +[WFScanRequest scanRequestForSSID:v10 channels:v12];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = 8;
    if (v13)
    {
LABEL_7:
      objc_initWeak((id *)buf, self);
      os_log_type_t v15 = [(WFNetworkListController *)self interface];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke;
      v20[3] = &unk_26478EB40;
      objc_copyWeak(&v23, (id *)buf);
      id v21 = v6;
      id v22 = v7;
      [v15 asyncScanRequest:v13 reply:v20];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v14 = [v6 securityMode];
    if (v13) {
      goto LABEL_7;
    }
  }
  uint64_t v16 = WFLogForCategory(5uLL);
  os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_226071000, v16, v17, "failed to create scan request for network='%@'", buf, 0xCu);
  }

  id v18 = [MEMORY[0x263F087E8] associationErrorWithReason:12];
  id v19 = [(WFNetworkListController *)self associationContext];
  [(WFNetworkListController *)self _handleAssociationError:v18 network:v6 profile:v7 securityMode:v14 associationContext:v19];

LABEL_14:
}

void __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WFLogForCategory(5uLL);
  os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_226071000, v8, v9, "scan completed for network='%@' results='%@'", buf, 0x16u);
  }

  uint64_t v11 = [WeakRetained associationContext];
  [v11 setSecondaryScanCompleted:1];

  if (!v5 && v6 && [v6 count])
  {
    uint64_t v12 = v16;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke_2;
    v16[3] = &unk_26478E7B0;
    id v13 = v6;
  }
  else
  {
    uint64_t v14 = WFLogForCategory(5uLL);
    os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_226071000, v14, v15, "scan error='%@' results='%@'", buf, 0x16u);
    }

    uint64_t v12 = v17;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke_254;
    v17[3] = &unk_26478E7B0;
    id v13 = *(void **)(a1 + 32);
  }
  v12[4] = v13;
  void v12[5] = WeakRetained;
  v12[6] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke_254(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = 8;
  }
  else {
    uint64_t v2 = [*(id *)(a1 + 32) securityMode];
  }
  char v3 = *(void **)(a1 + 40);
  id v7 = [MEMORY[0x263F087E8] associationErrorWithReason:12];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) associationContext];
  [v3 _handleAssociationError:v7 network:v5 profile:v4 securityMode:v2 associationContext:v6];
}

void __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) anyObject];
  [*(id *)(a1 + 40) _associateToScanRecord:v2 profile:*(void *)(a1 + 48)];
}

- (void)_updateViewControllerConnectedNetwork
{
  id v4 = [(WFNetworkListController *)self interface];
  char v3 = [v4 currentNetwork];
  [(WFNetworkListController *)self _updateViewControllerConnectedNetwork:v3];
}

- (void)_updateViewControllerConnectedNetwork:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__WFNetworkListController__updateViewControllerConnectedNetwork___block_invoke;
  v6[3] = &unk_26478E7D8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __65__WFNetworkListController__updateViewControllerConnectedNetwork___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  char v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    id v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      if (v2)
      {
        os_log_type_t v32 = [v2 ssid];
      }
      else
      {
        os_log_type_t v32 = @"nil";
      }
      uint64_t v6 = [v2 hash];
      id v7 = [*(id *)(a1 + 40) viewController];
      id v8 = [v7 currentNetwork];
      os_log_type_t v31 = v7;
      uint64_t v9 = v6;
      if (v8)
      {
        id v30 = [*(id *)(a1 + 40) viewController];
        uint64_t v29 = [v30 currentNetwork];
        unint64_t v10 = [v29 ssid];
      }
      else
      {
        unint64_t v10 = @"nil";
      }
      uint64_t v11 = [*(id *)(a1 + 40) viewController];
      uint64_t v12 = [v11 currentNetwork];
      *(_DWORD *)buf = 136316162;
      __int16 v34 = "-[WFNetworkListController _updateViewControllerConnectedNetwork:]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v32;
      __int16 v37 = 2048;
      uint64_t v38 = v9;
      __int16 v39 = 2112;
      os_log_type_t v40 = v10;
      __int16 v41 = 2048;
      uint64_t v42 = [v12 hash];
      _os_log_impl(&dword_226071000, v5, v4, "%s: current network is %@ (%lu), view controller current network: %@ (%lu)", buf, 0x34u);

      if (v8)
      {
      }
      if (v2) {
    }
      }
  }

  id v13 = [*(id *)(a1 + 40) viewController];
  [v13 setCurrentNetwork:v2];

  uint64_t v14 = WFLogForCategory(0);
  os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v14)
  {
    uint64_t v16 = v14;
    if (os_log_type_enabled(v16, v15))
    {
      os_log_type_t v17 = [*(id *)(a1 + 40) viewController];
      id v18 = [v17 currentNetwork];
      *(_DWORD *)buf = 136315394;
      __int16 v34 = "-[WFNetworkListController _updateViewControllerConnectedNetwork:]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v18;
      _os_log_impl(&dword_226071000, v16, v15, "%s: view controller current network updated to %@", buf, 0x16u);
    }
  }

  id v19 = [*(id *)(a1 + 40) viewController];
  uint64_t v20 = objc_opt_respondsToSelector();

  uint64_t v21 = [*(id *)(a1 + 40) latestLinkQuality];
  uint64_t v22 = (void *)v21;
  if (v20)
  {
    if (v21)
    {
      uint64_t v20 = [*(id *)(a1 + 40) latestLinkQuality];
      [(id)v20 scaledRssi];
    }
    else
    {
      [v2 scaledRSSI];
    }
    uint64_t v25 = WFSignalBarsFromScaledRSSI();
    __int16 v26 = [*(id *)(a1 + 40) viewController];
    [v26 setCurrentNetworkSignalBars:v25];

    if (!v22) {
      goto LABEL_31;
    }
LABEL_30:

    goto LABEL_31;
  }
  if (v21)
  {
    uint64_t v20 = [*(id *)(a1 + 40) latestLinkQuality];
    [(id)v20 scaledRssi];
  }
  else
  {
    [v2 scaledRSSI];
  }
  int v24 = v23;
  id v27 = [*(id *)(a1 + 40) viewController];
  LODWORD(v28) = v24;
  [v27 setCurrentNetworkScaledRSSI:v28];

  if (v22) {
    goto LABEL_30;
  }
LABEL_31:

  [*(id *)(a1 + 40) _updateCurrentNetworkIPState:v2];
  [*(id *)(a1 + 40) _updateViewControllerScanResults];
  [*(id *)(a1 + 40) _updateHealthSubtitle];
}

- (void)_ipStateDidChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(WFNetworkListController *)self interface];
  id v7 = [v6 currentNetwork];

  id v8 = WFLogForCategory(0);
  uint64_t v9 = (void *)OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
  {
    char v3 = v8;
    if (os_log_type_enabled(v3, (os_log_type_t)v9))
    {
      unint64_t v10 = [v5 userInfo];
      uint64_t v11 = [(WFNetworkListController *)self associationContext];
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = "-[WFNetworkListController _ipStateDidChange:]";
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      int v24 = v11;
      __int16 v25 = 2112;
      __int16 v26 = v7;
      _os_log_impl(&dword_226071000, v3, (os_log_type_t)v9, "%s: userInfo %@ - self.associationContext %@ - self.interface.currentNetwork %@", buf, 0x2Au);
    }
  }

  uint64_t v12 = [(WFNetworkListController *)self associationContext];
  if (v12)
  {
    uint64_t v9 = [(WFNetworkListController *)self associationContext];
    char v3 = [v9 network];
    if ([v3 isEqual:v7])
    {

      goto LABEL_17;
    }
  }
  id v13 = [(WFNetworkListController *)self associationContext];
  uint64_t v14 = [v13 network];
  if (v14) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v7 == 0;
  }
  int v16 = !v15;

  if (!v12)
  {
    if (!v16) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  if (v16)
  {
LABEL_17:
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __45__WFNetworkListController__ipStateDidChange___block_invoke;
    v17[3] = &unk_26478E7D8;
    v17[4] = self;
    id v18 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v17);
  }
LABEL_18:
}

uint64_t __45__WFNetworkListController__ipStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentNetworkIPState:*(void *)(a1 + 40)];
}

- (void)_updateCurrentNetworkIPState:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WFNetworkListController *)self isAssociating])
  {
    id v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
    {
      id v5 = v5;
      if (os_log_type_enabled(v5, v6))
      {
        id v7 = [(WFNetworkListController *)self associationContext];
        id v8 = [v7 stateDescription];
        uint64_t v9 = [(WFNetworkListController *)self associationContext];
        unint64_t v10 = [v9 networkName];
        *(_DWORD *)buf = 136315650;
        int v16 = "-[WFNetworkListController _updateCurrentNetworkIPState:]";
        __int16 v17 = 2112;
        id v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v10;
        _os_log_impl(&dword_226071000, v5, v6, "%s IP state change while association state is <%@> with network %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v11 = dispatch_get_global_queue(21, 0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__WFNetworkListController__updateCurrentNetworkIPState___block_invoke;
    v12[3] = &unk_26478E7D8;
    id v13 = v4;
    uint64_t v14 = self;
    dispatch_async(v11, v12);

    id v5 = v13;
  }
}

void __56__WFNetworkListController__updateCurrentNetworkIPState___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) interface];
    int v3 = [v2 hasValidIPAddress];

    id v4 = [*(id *)(a1 + 40) wifiClient];
    int v5 = [v4 isCellularOutrankingWiFi];

    os_log_type_t v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
    {
      id v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        uint64_t v9 = [*(id *)(a1 + 32) ssid];
        *(_DWORD *)buf = 138412802;
        uint64_t v14 = v9;
        __int16 v15 = 1024;
        int v16 = v3;
        __int16 v17 = 1024;
        int v18 = v5;
        _os_log_impl(&dword_226071000, v8, v7, "current network='%@' hasValidIP=%d wifiOutranked=%d", buf, 0x18u);
      }
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56__WFNetworkListController__updateCurrentNetworkIPState___block_invoke_258;
    v10[3] = &unk_26478EB68;
    char v11 = v5;
    v10[4] = *(void *)(a1 + 40);
    char v12 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __56__WFNetworkListController__updateCurrentNetworkIPState___block_invoke_258(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) viewController];
    id v4 = v1;
    uint64_t v2 = 0;
  }
  else
  {
    if (*(unsigned char *)(a1 + 41)) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    id v1 = [*(id *)(a1 + 32) viewController];
    id v4 = v1;
    uint64_t v2 = v3;
  }
  [v1 setCurrentNetworkState:v2];
}

- (BOOL)_canPromptForInstantHotspot
{
  uint64_t v3 = [(WFNetworkListController *)self viewController];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(WFNetworkListController *)self viewController];
    char v5 = [v4 shouldPromptWhenPersonalHotspotIsEnabled];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_disablePersonalHotspot
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[WFNetworkListController _disablePersonalHotspot]";
    _os_log_impl(&dword_226071000, v3, v4, "%s: disabling personal hotspot", buf, 0xCu);
  }

  *(void *)buf = 0;
  int v5 = _MISAttach(buf);
  if (v5)
  {
    int v6 = v5;
    os_log_type_t v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    BOOL v9 = 0;
    if (WFCurrentLogLevel() && v7)
    {
      if (os_log_type_enabled(v7, v8))
      {
        int v16 = 67109120;
        int v17 = v6;
        unint64_t v10 = "Error: Unable to attach to MobileInternetSharing (err=%d)";
LABEL_20:
        _os_log_impl(&dword_226071000, v7, v8, v10, (uint8_t *)&v16, 8u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  else
  {
    int v11 = _MISSetGlobalServiceState(*(uint64_t *)buf, 1022);
    if (v11)
    {
      int v12 = v11;
      os_log_type_t v7 = WFLogForCategory(0);
      os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
      BOOL v9 = 0;
      if (WFCurrentLogLevel() && v7)
      {
        if (os_log_type_enabled(v7, v8))
        {
          int v16 = 67109120;
          int v17 = v12;
          unint64_t v10 = "Error: Failed to turn off Personal Hotspot (err=%d)";
          goto LABEL_20;
        }
LABEL_21:
        BOOL v9 = 0;
      }
    }
    else
    {
      int v13 = _MISSetGlobalServiceState(*(uint64_t *)buf, 1023);
      if (!v13)
      {
        _MISDetach(*(uint64_t *)buf);
        os_log_type_t v7 = [(WFNetworkListController *)self wifiClient];
        [v7 setMISState:0];
        BOOL v9 = 1;
        goto LABEL_22;
      }
      int v14 = v13;
      os_log_type_t v7 = WFLogForCategory(0);
      os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
      BOOL v9 = 0;
      if (WFCurrentLogLevel() && v7)
      {
        if (os_log_type_enabled(v7, v8))
        {
          int v16 = 67109120;
          int v17 = v14;
          unint64_t v10 = "Error: Failed to re-enable Personal Hotspot (err=%d)";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:

  return v9;
}

- (BOOL)_canPromptForCarPlay
{
  uint64_t v3 = [(WFNetworkListController *)self viewController];
  if (objc_opt_respondsToSelector())
  {
    os_log_type_t v4 = [(WFNetworkListController *)self viewController];
    char v5 = [v4 shouldPromptWhenCarPlaySessionIsActive];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_promptToDisableCarPlayForNetworkName:(id)a3 handler:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  os_log_type_t v7 = [WFNetworkProfile alloc];
  os_log_type_t v8 = [(WFNetworkListController *)self interface];
  BOOL v9 = [v8 currentNetwork];
  unint64_t v10 = [v9 matchingKnownNetworkProfile];
  int v11 = [(WFNetworkProfile *)v7 initWithCoreWiFiProfile:v10];

  if (v11)
  {
    int v12 = [(WFNetworkProfile *)v11 carPlayUUID];

    if (v12)
    {
      int v13 = [(WFNetworkProfile *)v11 carPlayUUID];
      int v12 = WFGetCarNameFromCarPlayNetworkUUID(v13);
    }
  }
  else
  {
    int v12 = 0;
  }
  int v14 = [MEMORY[0x263F86378] carPlayAlertControllerWithNetworkName:v16 carName:v12 completionHandler:v6];
  __int16 v15 = [(WFNetworkListController *)self viewController];
  [v15 presentViewController:v14 animated:1 completion:0];
}

- (BOOL)_isActiveCarPlaySession
{
  uint64_t v2 = [(WFNetworkListController *)self interface];
  uint64_t v3 = [v2 currentNetwork];
  int v4 = [v3 isCarPlay];

  if (!v4) {
    return 0;
  }
  char v5 = (void *)MEMORY[0x263EFA6F8];
  return [v5 isCarPlaySessionActive];
}

- (void)_networkHealthIssuesDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WFNetworkListController *)self isAssociating])
  {
    objc_initWeak(&location, self);
    char v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
    {
      os_log_type_t v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        os_log_type_t v8 = [(WFNetworkListController *)self associationContext];
        BOOL v9 = [(WFNetworkListController *)self associationContext];
        unint64_t v10 = [v9 networkName];
        *(_DWORD *)buf = 136315650;
        int v17 = "-[WFNetworkListController _networkHealthIssuesDidChange:]";
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_impl(&dword_226071000, v7, v6, "%s health issues changed while association state is in progress <%@> with network %@", buf, 0x20u);
      }
    }

    dispatch_time_t v11 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__WFNetworkListController__networkHealthIssuesDidChange___block_invoke;
    block[3] = &unk_26478E398;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    dispatch_after(v11, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [(WFNetworkListController *)self _updateHealthSubtitle];
  }
}

void __57__WFNetworkListController__networkHealthIssuesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _networkHealthIssuesDidChange:*(void *)(a1 + 32)];
}

- (id)_sortedHealthRecommendations
{
  uint64_t v2 = [(WFNetworkListController *)self healthRecommendations];
  uint64_t v3 = [v2 allObjects];
  id v4 = [MEMORY[0x263F863A8] healthIssueSortComparator];
  char v5 = [v3 sortedArrayUsingComparator:v4];

  return v5;
}

- (id)healthRecommendations
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WFNetworkListController *)self interface];
  id v4 = [v3 currentNetwork];

  if ([(WFNetworkListController *)self isHS20Supported]
    && [v4 isHotspot20])
  {
    char v5 = [v4 matchingKnownNetworkProfile];

    if (!v5)
    {
      int v12 = [(WFNetworkListController *)self gasController];
      uint64_t v13 = [v12 profileForNetwork:v4];
      goto LABEL_12;
    }
    os_log_type_t v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
    {
      os_log_type_t v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        BOOL v9 = [v4 matchingKnownNetworkProfile];
        int v120 = 136315394;
        id v121 = "-[WFNetworkListController healthRecommendations]";
        __int16 v122 = 2112;
        v123 = v9;
        _os_log_impl(&dword_226071000, v8, v7, "%s: using matchingKnownNetworkProfile %@", (uint8_t *)&v120, 0x16u);
      }
    }

LABEL_11:
    dispatch_time_t v11 = [WFNetworkProfile alloc];
    int v12 = [v4 matchingKnownNetworkProfile];
    uint64_t v13 = [(WFNetworkProfile *)v11 initWithCoreWiFiProfile:v12];
LABEL_12:
    id v14 = (void *)v13;

    goto LABEL_18;
  }
  unint64_t v10 = [v4 matchingKnownNetworkProfile];

  if (v10) {
    goto LABEL_11;
  }
  __int16 v15 = WFLogForCategory(0);
  os_log_type_t v16 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v16))
  {
    int v120 = 138412290;
    id v121 = (const char *)v4;
    _os_log_impl(&dword_226071000, v15, v16, "Network='%@' is not a known network", (uint8_t *)&v120, 0xCu);
  }

  id v14 = 0;
LABEL_18:
  int v17 = [v4 supportsWiFiHealth];
  __int16 v18 = [(WFNetworkListController *)self viewController];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_112;
  }
  uint64_t v19 = [(WFNetworkListController *)self viewController];
  int v20 = [v19 supportsHealthRecommendations];

  if ((v20 & v17) != 1)
  {
    int v24 = 0;
    __int16 v25 = 0;
    goto LABEL_114;
  }
  uint64_t v21 = [(WFNetworkListController *)self wifiClient];
  int v22 = [v21 isWiFiHealthUIDisabled];

  if (v22)
  {
    __int16 v18 = WFLogForCategory(0);
    os_log_type_t v116 = OSLogForWFLogLevel(3uLL);
    int v24 = 0;
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v18)
    {
      __int16 v25 = 0;
      goto LABEL_113;
    }
    if (os_log_type_enabled(v18, v116))
    {
      int v120 = 136315138;
      id v121 = "-[WFNetworkListController healthRecommendations]";
      _os_log_impl(&dword_226071000, v18, v116, "%s: health ui is disabled", (uint8_t *)&v120, 0xCu);
    }
LABEL_112:
    int v24 = 0;
    __int16 v25 = 0;
LABEL_113:

    goto LABEL_114;
  }
  __int16 v23 = [(WFNetworkListController *)self healthManager];
  int v24 = [v23 currentNetworkIssues];

  __int16 v25 = [MEMORY[0x263EFF9C0] set];
  if ([v24 count])
  {
    __int16 v26 = [v24 allObjects];
    [v25 addObjectsFromArray:v26];
  }
  uint64_t v27 = [(WFNetworkListController *)self healthRecommendationOverrides];

  if (!v27) {
    goto LABEL_78;
  }
  double v28 = [(WFNetworkListController *)self healthRecommendationOverrides];
  int v29 = [v28 hiddenNetwork];

  id v30 = [(WFNetworkListController *)self healthRecommendationOverrides];
  uint64_t v31 = [v30 securityOverride];

  if (v31 == 1)
  {
    os_log_type_t v32 = (void *)MEMORY[0x263F863A8];
    BOOL v33 = v29 == 0;
    uint64_t v34 = 8;
    uint64_t v35 = 128;
  }
  else
  {
    id v36 = [(WFNetworkListController *)self healthRecommendationOverrides];
    uint64_t v37 = [v36 securityOverride];

    if (v37 == 2)
    {
      os_log_type_t v32 = (void *)MEMORY[0x263F863A8];
      BOOL v33 = v29 == 0;
      uint64_t v34 = 2;
      uint64_t v35 = 512;
    }
    else
    {
      uint64_t v38 = [(WFNetworkListController *)self healthRecommendationOverrides];
      uint64_t v39 = [v38 securityOverride];

      if (v39 != 3) {
        goto LABEL_47;
      }
      os_log_type_t v32 = (void *)MEMORY[0x263F863A8];
      BOOL v33 = v29 == 0;
      uint64_t v34 = 4;
      uint64_t v35 = 256;
    }
  }
  if (v33) {
    uint64_t v40 = v34;
  }
  else {
    uint64_t v40 = v35;
  }
  __int16 v41 = [v32 issueWithType:v40];
  [v41 setOverrideIssue:1];
  if (v41)
  {
    uint64_t v42 = [MEMORY[0x263F863A8] issueWithType:8];
    int v43 = [v25 containsObject:v42];

    if (v43)
    {
      os_log_type_t v44 = [MEMORY[0x263F863A8] issueWithType:8];
      [v25 removeObject:v44];
    }
    __int16 v45 = [MEMORY[0x263F863A8] issueWithType:2];
    int v46 = [v25 containsObject:v45];

    if (v46)
    {
      __int16 v47 = [MEMORY[0x263F863A8] issueWithType:2];
      [v25 removeObject:v47];
    }
    id v48 = [MEMORY[0x263F863A8] issueWithType:4];
    int v49 = [v25 containsObject:v48];

    if (v49)
    {
      os_log_type_t v50 = [MEMORY[0x263F863A8] issueWithType:4];
      [v25 removeObject:v50];
    }
    char v51 = [MEMORY[0x263F863A8] issueWithType:128];
    int v52 = [v25 containsObject:v51];

    if (v52)
    {
      uint64_t v53 = [MEMORY[0x263F863A8] issueWithType:128];
      [v25 removeObject:v53];
    }
    v54 = [MEMORY[0x263F863A8] issueWithType:512];
    int v55 = [v25 containsObject:v54];

    if (v55)
    {
      os_log_type_t v56 = [MEMORY[0x263F863A8] issueWithType:512];
      [v25 removeObject:v56];
    }
    __int16 v57 = [MEMORY[0x263F863A8] issueWithType:256];
    int v58 = [v25 containsObject:v57];

    if (v58)
    {
      os_log_type_t v59 = [MEMORY[0x263F863A8] issueWithType:256];
      [v25 removeObject:v59];
    }
    goto LABEL_49;
  }
LABEL_47:
  if (!v29) {
    goto LABEL_50;
  }
  __int16 v41 = [MEMORY[0x263F863A8] issueWithType:64];
  [v41 setOverrideIssue:1];
LABEL_49:
  [v25 addObject:v41];

LABEL_50:
  uint64_t v60 = [(WFNetworkListController *)self healthRecommendationOverrides];
  int v61 = [v60 noInternetConnection];

  if (v61)
  {
    uint64_t v62 = [MEMORY[0x263F863A8] issueWithType:1];
    [v62 setOverrideIssue:1];
    [v25 addObject:v62];
  }
  char v63 = [(WFNetworkListController *)self healthRecommendationOverrides];
  int v64 = [v63 legacyPHY];

  if (v64)
  {
    char v65 = [MEMORY[0x263F863A8] issueWithType:16];
    [v65 setOverrideIssue:1];
    [v25 addObject:v65];
  }
  id v66 = [(WFNetworkListController *)self healthRecommendationOverrides];
  int v67 = [v66 commonSSID];

  if (v67)
  {
    int v68 = [MEMORY[0x263F863A8] issueWithType:32];
    [v68 setOverrideIssue:1];
    [v25 addObject:v68];
  }
  __int16 v69 = [(WFNetworkListController *)self healthRecommendationOverrides];
  int v70 = [v69 carrierNetwork];

  if (v70)
  {
    uint64_t v71 = [MEMORY[0x263F863E0] carrierNetworkIssue];
    [v71 setOverrideIssue:1];
    [v25 addObject:v71];
  }
  os_log_type_t v72 = [(WFNetworkListController *)self healthRecommendationOverrides];
  int v73 = [v72 dnsFiltered];

  if (v73)
  {
    id v74 = [MEMORY[0x263F863E0] dnsFilteredNetworkIssue];
    [v74 setOverrideIssue:1];
    [v25 addObject:v74];
  }
  id v75 = [(WFNetworkListController *)self healthRecommendationOverrides];
  uint64_t v76 = [v75 privateAddressOverride];

  if (v76)
  {
    id v77 = [(WFNetworkListController *)self healthRecommendationOverrides];
    uint64_t v78 = [v77 privateAddressOverride];

    if (v78 == 1)
    {
      id v79 = [MEMORY[0x263F863E0] privateAddressDisabledBySystemIssue];
    }
    else
    {
      id v80 = [(WFNetworkListController *)self healthRecommendationOverrides];
      uint64_t v81 = [v80 privateAddressOverride];

      if (v81 == 2)
      {
        id v79 = [MEMORY[0x263F863E0] privateAddressDisabledByCarrierIssueWithCarrierName:@"Carrier"];
      }
      else
      {
        id v82 = [(WFNetworkListController *)self healthRecommendationOverrides];
        uint64_t v83 = [v82 privateAddressOverride];

        if (v83 != 3) {
          goto LABEL_68;
        }
        id v79 = [MEMORY[0x263F863E0] privateAddressDisabledByProfileIssueWithOrganizationName:@"Organization" profileName:@"ProfileName" profileUUID:@"UUID"];
      }
    }
    uint64_t v84 = v79;
    [v79 setOverrideIssue:1];
    [v25 addObject:v84];
  }
LABEL_68:
  id v85 = [(WFNetworkListController *)self healthRecommendationOverrides];
  uint64_t v86 = [v85 cellularOutrankStateOverride];

  if (v86)
  {
    v87 = [(WFNetworkListController *)self healthRecommendationOverrides];
    uint64_t v88 = [v87 cellularOutrankStateOverride];

    if (v88 == 1)
    {
      v89 = [MEMORY[0x263F86388] cellularOutrankDownload];
LABEL_77:
      uint64_t v96 = v89;
      [v89 setOverrideIssue:1];
      [v25 addObject:v96];

      goto LABEL_78;
    }
    uint64_t v90 = [(WFNetworkListController *)self healthRecommendationOverrides];
    uint64_t v91 = [v90 cellularOutrankStateOverride];

    if (v91 == 3)
    {
      v89 = [MEMORY[0x263F86388] cellularOutrankPerformance];
      goto LABEL_77;
    }
    os_log_type_t v92 = [(WFNetworkListController *)self healthRecommendationOverrides];
    uint64_t v93 = [v92 cellularOutrankStateOverride];

    if (v93 == 2)
    {
      v89 = [MEMORY[0x263F86388] cellularOutrankSecurity];
      goto LABEL_77;
    }
    os_log_type_t v94 = [(WFNetworkListController *)self healthRecommendationOverrides];
    uint64_t v95 = [v94 cellularOutrankStateOverride];

    if (v95 == 8)
    {
      v89 = [MEMORY[0x263F86388] cellularOutrankPrivateNetwork];
      goto LABEL_77;
    }
  }
LABEL_78:
  if ([v14 canExposeIMSI])
  {
    v97 = [MEMORY[0x263F863E0] carrierNetworkIssue];
    [v25 addObject:v97];
  }
  if ([v14 isDNSHeuristicsFiltered])
  {
    os_log_type_t v98 = [MEMORY[0x263F863E0] dnsFilteredNetworkIssue];
    [v25 addObject:v98];
  }
  v99 = [v4 privateAddressConfig];
  uint64_t v100 = [v99 disabledReason];

  if (v100)
  {
    id v101 = WFLogForCategory(0);
    os_log_type_t v102 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v101)
    {
      id v103 = v101;
      if (os_log_type_enabled(v103, v102))
      {
        id v104 = [v4 privateAddressConfig];
        int v120 = 136315394;
        id v121 = "-[WFNetworkListController healthRecommendations]";
        __int16 v122 = 2112;
        v123 = v104;
        _os_log_impl(&dword_226071000, v103, v102, "%s: network.privateAddressConfig %@", (uint8_t *)&v120, 0x16u);
      }
    }

    if (v14)
    {
      id v105 = [v14 originatorName];
    }
    else
    {
      id v105 = 0;
    }
    os_log_type_t v106 = [v4 privateAddressConfig];
    uint64_t v107 = [v106 disabledReason];

    switch(v107)
    {
      case 1:
        uint64_t v108 = [MEMORY[0x263F863E0] privateAddressDisabledByUserIssue];
        goto LABEL_99;
      case 2:
        uint64_t v108 = [MEMORY[0x263F863E0] privateAddressDisabledBySystemIssue];
        goto LABEL_99;
      case 3:
        uint64_t v108 = [MEMORY[0x263F863E0] privateAddressDisabledByCarrierIssueWithCarrierName:0];
        goto LABEL_99;
      case 4:
        if (v105) {
          id v109 = v105;
        }
        else {
          id v109 = 0;
        }
        uint64_t v108 = [MEMORY[0x263F863E0] privateAddressDisabledByProfileIssueWithOrganizationName:v109 profileName:0 profileUUID:0];
LABEL_99:
        double v110 = (void *)v108;
        [v25 addObject:v108];

        break;
      default:
        break;
    }
  }
  id v111 = [(WFNetworkListController *)self wifiClient];
  int v112 = [v111 isCellularOutrankingWiFi];

  if (v112)
  {
    id v113 = [(WFNetworkListController *)self wifiClient];
    uint64_t v114 = [v113 cellularOutrankState];

    switch(v114)
    {
      case 1:
        uint64_t v115 = [MEMORY[0x263F86388] cellularOutrankSecurity];
        goto LABEL_107;
      case 2:
        uint64_t v115 = [MEMORY[0x263F86388] cellularOutrankPerformance];
        goto LABEL_107;
      case 3:
      case 4:
        uint64_t v115 = [MEMORY[0x263F86388] cellularOutrankDownload];
        goto LABEL_107;
      case 5:
        uint64_t v115 = [MEMORY[0x263F86388] cellularOutrankPrivateNetwork];
LABEL_107:
        __int16 v18 = v115;
        [v25 addObject:v115];
        goto LABEL_113;
      default:
        break;
    }
  }
LABEL_114:
  if ([v25 count]) {
    long long v117 = v25;
  }
  else {
    long long v117 = 0;
  }
  id v118 = v117;

  return v118;
}

- (BOOL)_shouldShowLowDataModeForProfile:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(WFNetworkListController *)self wifiClient];
  char v6 = [v5 isCellularOutrankingWiFi];

  if (v4
    && (v6 & 1) == 0
    && ([v4 lowDataMode] == 1
     || [v4 isPersonalHotspot] && !objc_msgSend(v4, "lowDataMode")))
  {
    os_log_type_t v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(4uLL);
    BOOL v9 = 1;
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v7)
    {
      os_log_type_t v7 = v7;
      if (os_log_type_enabled(v7, v8))
      {
        unint64_t v10 = [v4 networkName];
        int v14 = 136315394;
        __int16 v15 = "-[WFNetworkListController _shouldShowLowDataModeForProfile:]";
        __int16 v16 = 2112;
        int v17 = v10;
        _os_log_impl(&dword_226071000, v7, v8, "%s: Showing low data mode for: %@", (uint8_t *)&v14, 0x16u);

        BOOL v9 = 1;
      }
      goto LABEL_15;
    }
  }
  else
  {
    os_log_type_t v7 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(4uLL);
    BOOL v9 = 0;
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v7)
    {
      os_log_type_t v7 = v7;
      if (os_log_type_enabled(v7, v11))
      {
        int v12 = [v4 networkName];
        int v14 = 136315394;
        __int16 v15 = "-[WFNetworkListController _shouldShowLowDataModeForProfile:]";
        __int16 v16 = 2112;
        int v17 = v12;
        _os_log_impl(&dword_226071000, v7, v11, "%s: Showing low data mode for: %@", (uint8_t *)&v14, 0x16u);
      }
      BOOL v9 = 0;
LABEL_15:
    }
  }

  return v9;
}

- (void)_updateHealthSubtitle
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WFNetworkListController *)self healthRecommendations];
  id v4 = (void *)MEMORY[0x263F863A8];
  char v5 = [v3 allObjects];
  char v6 = [v4 highestPriorityIssueFromIssues:v5];

  if (v6)
  {
    os_log_type_t v7 = [v6 issueTitle];
  }
  else
  {
    os_log_type_t v7 = 0;
  }
  if ([(WFNetworkListController *)self viewControllerSupportsCurrentNetworkSubtitle])
  {
    os_log_type_t v8 = [(WFNetworkListController *)self interface];
    BOOL v9 = [v8 currentNetwork];

    unint64_t v10 = [(WFNetworkListController *)self interface];
    os_log_type_t v11 = [v10 currentKnownNetworkProfile];

    if ([(WFNetworkListController *)self _shouldShowLowDataModeForProfile:v11])
    {
      int v12 = v11;
      if (v7)
      {
        uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v14 = [v13 localizedStringForKey:@"kWFLocSaveDataModeSubtitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        uint64_t v15 = [v7 stringByAppendingFormat:@" — %@", v14];

        os_log_type_t v7 = (void *)v15;
      }
      else
      {
        __int16 v16 = NSString;
        uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v14 = [v13 localizedStringForKey:@"kWFLocSaveDataModeSubtitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        os_log_type_t v7 = [v16 stringWithString:v14];
      }

      os_log_type_t v11 = v12;
    }
    int v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v17)
    {
      int v46 = v3;
      uint64_t v19 = v11;
      int v20 = v17;
      if (os_log_type_enabled(v20, v18))
      {
        [(WFNetworkListController *)self viewController];
        uint64_t v21 = v45 = v9;
        int v22 = [v21 currentNetwork];
        *(_DWORD *)buf = 138412546;
        id v48 = v7;
        __int16 v49 = 2112;
        id v50 = (id)objc_opt_class();
        id v23 = v50;
        _os_log_impl(&dword_226071000, v20, v18, "subtitle: %@, currentNetwork class: %@", buf, 0x16u);

        BOOL v9 = v45;
      }

      os_log_type_t v11 = v19;
      uint64_t v3 = v46;
    }

    if (!v7) {
      goto LABEL_22;
    }
    int v24 = [(WFNetworkListController *)self viewController];
    __int16 v25 = [v24 currentNetwork];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v27 = [(WFNetworkListController *)self viewController];
      double v28 = [v27 currentNetworkSubtitle];
      char v29 = [v28 isEqualToString:v7];

      if (v29)
      {
        id v30 = WFLogForCategory(0);
        os_log_type_t v31 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v30 && os_log_type_enabled(v30, v31))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226071000, v30, v31, "subtitle is equal to current one, not updating ", buf, 2u);
        }
        goto LABEL_28;
      }
      uint64_t v39 = [(WFNetworkListController *)self viewController];
      [v39 setCurrentNetworkSubtitle:v7];

      if ([(WFNetworkListController *)self isAirPortSettings])
      {
        if (v6)
        {
          uint64_t v40 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v6, 0);
        }
        else
        {
          uint64_t v40 = 0;
        }
        __int16 v41 = +[WFMetricsManager sharedManager];
        uint64_t v42 = [v9 ssid];
        int v43 = +[WFHealthUIEvent subtitleEventWithIssues:ssid:securityType:](WFHealthUIEvent, "subtitleEventWithIssues:ssid:securityType:", v40, v42, [v9 securityMode]);
        [v41 processEvent:v43];
      }
      id v30 = WFLogForCategory(0);
      os_log_type_t v44 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v30) {
        goto LABEL_28;
      }
      id v30 = v30;
      if (!os_log_type_enabled(v30, v44)) {
        goto LABEL_27;
      }
      uint64_t v34 = [v9 ssid];
      *(_DWORD *)buf = 138412546;
      id v48 = v34;
      __int16 v49 = 2112;
      id v50 = v7;
      uint64_t v35 = "Setting health subtitle for %@ to %@";
      id v36 = v30;
      os_log_type_t v37 = v44;
      uint32_t v38 = 22;
    }
    else
    {
LABEL_22:
      os_log_type_t v32 = [(WFNetworkListController *)self viewController];
      [v32 setCurrentNetworkSubtitle:0];

      id v30 = WFLogForCategory(0);
      os_log_type_t v33 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v30) {
        goto LABEL_28;
      }
      id v30 = v30;
      if (!os_log_type_enabled(v30, v33))
      {
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      uint64_t v34 = [v9 ssid];
      *(_DWORD *)buf = 138412290;
      id v48 = v34;
      uint64_t v35 = "Clearing health subtitle for %@";
      id v36 = v30;
      os_log_type_t v37 = v33;
      uint32_t v38 = 12;
    }
    _os_log_impl(&dword_226071000, v36, v37, v35, buf, v38);

    goto LABEL_27;
  }
LABEL_29:
}

- (void)networkListViewController:(id)a3 didTapRecord:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self->_shouldShowDetailTapOnCurrentNetwork) {
      goto LABEL_8;
    }
    os_log_type_t v8 = [(WFNetworkListController *)self associationContext];
    BOOL v9 = [v8 networkName];
    unint64_t v10 = [v7 ssid];
    int v11 = [v9 isEqualToString:v10];

    if (!v11)
    {
LABEL_8:
      os_log_type_t v18 = [(WFNetworkListController *)self interface];
      uint64_t v19 = [v18 currentNetwork];
      int v20 = [v7 isEqual:v19];

      if (v20)
      {
        uint64_t v21 = [(WFNetworkListController *)self interface];
        int v22 = [v21 currentNetwork];
        uint64_t v23 = [v22 carPlayType];

        if (v23 == 1)
        {
          int v24 = WFLogForCategory(0);
          os_log_type_t v25 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v24)
          {
            __int16 v26 = v24;
            if (os_log_type_enabled(v26, v25))
            {
              uint64_t v27 = [(WFNetworkListController *)self interface];
              double v28 = [v27 currentNetwork];
              int v51 = 136315394;
              int v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
              __int16 v53 = 2112;
              v54 = v28;
              _os_log_impl(&dword_226071000, v26, v25, "%s: tapped on carplay only network %@", (uint8_t *)&v51, 0x16u);
            }
          }
        }
        else
        {
          id v30 = [(WFNetworkListController *)self wifiClient];
          int v31 = [v30 isCellularOutrankingWiFi];

          if (v31)
          {
            os_log_type_t v32 = [(WFNetworkListController *)self wifiClient];
            uint64_t v33 = [v32 cellularOutrankState];

            uint64_t v34 = WFLogForCategory(0);
            os_log_type_t v35 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v34)
            {
              id v36 = v34;
              if (os_log_type_enabled(v36, v35))
              {
                os_log_type_t v37 = [(WFNetworkListController *)self interface];
                uint32_t v38 = [v37 currentNetwork];
                int v51 = 136315650;
                int v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
                __int16 v53 = 2112;
                v54 = v38;
                __int16 v55 = 2048;
                uint64_t v56 = v33;
                _os_log_impl(&dword_226071000, v36, v35, "%s: tapped on current network when cellular is outranking wifi %@ - state: %lu", (uint8_t *)&v51, 0x20u);
              }
            }

            if (v33 == 4)
            {
              uint64_t v39 = WFLogForCategory(0);
              os_log_type_t v40 = OSLogForWFLogLevel(3uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 3 && v39)
              {
                __int16 v41 = v39;
                if (os_log_type_enabled(v41, v40))
                {
                  uint64_t v42 = [(WFNetworkListController *)self interface];
                  int v43 = [v42 currentNetwork];
                  int v51 = 136315394;
                  int v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
                  __int16 v53 = 2112;
                  v54 = v43;
                  _os_log_impl(&dword_226071000, v41, v40, "%s: tapped on current network when developer is outranking wifi %@", (uint8_t *)&v51, 0x16u);
                }
              }

              int v12 = [(WFNetworkListController *)self interface];
              os_log_type_t v44 = [v12 currentNetwork];
              [(WFNetworkListController *)self _presentDeveloperOutrankAlertForNetwork:v44];
            }
            else
            {
              int v12 = [(WFNetworkListController *)self interface];
              id v50 = [v12 currentNetwork];
              [(WFNetworkListController *)self _presentCellularOutrankAlertForNetwork:v50 privateCellular:v33 == 5];
            }
            goto LABEL_43;
          }
          if ([(WFNetworkListController *)self shouldShowDetailTapOnCurrentNetwork])
          {
            __int16 v45 = WFLogForCategory(0);
            os_log_type_t v46 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v45)
            {
              __int16 v47 = v45;
              if (os_log_type_enabled(v47, v46))
              {
                id v48 = [(WFNetworkListController *)self interface];
                __int16 v49 = [v48 currentNetwork];
                int v51 = 136315394;
                int v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
                __int16 v53 = 2112;
                v54 = v49;
                _os_log_impl(&dword_226071000, v47, v46, "%s: showing settings for current network: %@", (uint8_t *)&v51, 0x16u);
              }
            }

            int v12 = [(WFNetworkListController *)self viewController];
            [(WFNetworkListController *)self networkListViewController:v12 showSettingsForNetwork:v7 context:1];
            goto LABEL_43;
          }
        }
      }
      [(WFNetworkListController *)self _associateToScanRecord:v7];
      int v12 = [(WFNetworkListController *)self associationContext];
      [v12 setOriginator:0];
      goto LABEL_43;
    }
    int v12 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      LOWORD(v51) = 0;
      int v14 = "Refuse repeat association request when tapping to show detail is not supported.";
      uint64_t v15 = v12;
      os_log_type_t v16 = v13;
      uint32_t v17 = 2;
LABEL_21:
      _os_log_impl(&dword_226071000, v15, v16, v14, (uint8_t *)&v51, v17);
    }
  }
  else
  {
    int v12 = WFLogForCategory(0);
    os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v29))
    {
      int v51 = 136315138;
      int v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
      int v14 = "%s- called with nil list record";
      uint64_t v15 = v12;
      os_log_type_t v16 = v29;
      uint32_t v17 = 12;
      goto LABEL_21;
    }
  }
LABEL_43:
}

- (void)networkListViewControllerDidTapOtherNetwork:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v28 = a3;
  [(WFNetworkListController *)self isAssociating];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226071000, v4, v5, "User tapped join other network", buf, 2u);
  }

  [(WFNetworkListController *)self _pauseScanning];
  id v6 = [(WFNetworkListController *)self viewProvider];
  char v7 = objc_opt_respondsToSelector();

  id v8 = objc_alloc_init(MEMORY[0x263F08C38]);
  uint64_t v27 = [v8 UUIDString];

  BOOL v9 = [(WFNetworkListController *)self wifiClient];
  os_log_type_t v29 = [v9 hardwareMACAddress];

  unint64_t v10 = [[WFOtherNetworkContext alloc] initWithType:0 authTraits:[(WFNetworkListController *)self _defaultAuthTraits] supportRandomAddress:1 useRandomAddress:1 randomMACAddress:0 hardwareMACAddress:v29];
  if (v7)
  {
    int v11 = [(WFNetworkListController *)self viewProvider];
    int v12 = [v11 otherNetworkViewControllerWithContext:v10];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263F863D8]);
    uint64_t v14 = WFCurrentDeviceCapability();
    uint64_t v15 = [MEMORY[0x263F86368] defaultAppearanceProxy];
    int v12 = (void *)[v13 initWithOtherNetworkProviderContext:v10 deviceCapability:v14 appearanceProxy:v15];

    [v12 setDelegate:v10];
  }
  if (v12)
  {
    [(WFCredentialsContext *)v10 setProvider:v12];
    [(WFNetworkListController *)self setCredentialsContext:v10];
    [(WFNetworkListController *)self setVisibleContext:v10];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v10);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke;
    v36[3] = &unk_26478EB90;
    objc_copyWeak(&v37, &location);
    objc_copyWeak(&v38, &from);
    [(WFOtherNetworkContext *)v10 setPrivateAddressModeChangeHandler:v36];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke_297;
    v33[3] = &unk_26478E990;
    objc_copyWeak(&v34, &location);
    objc_copyWeak(&v35, &from);
    [(WFCredentialsContext *)v10 setCancellationHandler:v33];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke_298;
    v30[3] = &unk_26478EBB8;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, &from);
    [(WFCredentialsContext *)v10 setCompletionHandler:v30];
    [(WFNetworkListController *)self setOtherNetworkVC:v12];
    os_log_type_t v16 = [(WFNetworkListController *)self viewProvider];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      os_log_type_t v18 = WFLogForCategory(0);
      os_log_type_t v19 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v18 && os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v42 = (const char *)v12;
        __int16 v43 = 2112;
        os_log_type_t v44 = v10;
        _os_log_impl(&dword_226071000, v18, v19, "viewProvider will handle presentation of %@ (context %@)", buf, 0x16u);
      }

      int v20 = [(WFNetworkListController *)self viewProvider];
      [v20 presentNetworkViewController:v12 forContext:v10];
    }
    else
    {
      int v20 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7F8]), "initWithRootViewController:", v12, &v37, v27);
      [v20 setModalPresentationStyle:2];
      os_log_type_t v25 = [(WFNetworkListController *)self viewController];
      [v25 presentViewController:v20 animated:1 completion:0];
    }
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v38);
    objc_destroyWeak(v26);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v21 = WFLogForCategory(0);
    os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v21)
    {
      uint64_t v23 = v21;
      if (os_log_type_enabled(v23, v22))
      {
        int v24 = [(WFNetworkListController *)self viewProvider];
        *(_DWORD *)buf = 136315650;
        uint64_t v42 = "-[WFNetworkListController networkListViewControllerDidTapOtherNetwork:]";
        __int16 v43 = 2112;
        os_log_type_t v44 = v24;
        __int16 v45 = 1024;
        int v46 = v7 & 1;
        _os_log_impl(&dword_226071000, v23, v22, "%s: otherNetworkVc is nil, view provider %@ (supportsOtherVc %d)", buf, 0x1Cu);
      }
    }
  }
}

void __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  objc_copyWeak(&to, a1 + 4);
  v3 += 5;
  id WeakRetained = objc_loadWeakRetained(v3);
  os_log_type_t v5 = [WeakRetained network];
  id v6 = objc_loadWeakRetained(v3);
  char v7 = v6;
  if (v5)
  {
    id v8 = [v6 network];
    [v8 ssid];
  }
  else
  {
    id v8 = [v6 provider];
    [v8 SSID];
  BOOL v9 = };

  if (a2 == 1)
  {
    unint64_t v10 = 0;
  }
  else
  {
    int v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
    {
      *(_WORD *)char v17 = 0;
      _os_log_impl(&dword_226071000, v11, v12, "Generating new private mac when join with random address mode", v17, 2u);
    }

    id v13 = objc_loadWeakRetained(&to);
    uint64_t v14 = [v13 wifiClient];
    unint64_t v10 = (void *)[v14 newRandomMACAddressForSSID:v9];
  }
  id v15 = objc_loadWeakRetained(&to);
  os_log_type_t v16 = [v15 wifiClient];
  [v16 setRandomAddressModeForNetwork:v9 mode:a2 randomMAC:v10];

  objc_destroyWeak(&to);
}

void __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke_297(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v2 && os_log_type_enabled(v2, v3))
  {
    int v8 = 136315138;
    BOOL v9 = "-[WFNetworkListController networkListViewControllerDidTapOtherNetwork:]_block_invoke";
    _os_log_impl(&dword_226071000, v2, v3, "%s: user cancelled credentials prompt", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_type_t v5 = [MEMORY[0x263F087E8] associationErrorWithReason:6];
  [WeakRetained _associationDidFinish:0 error:v5 network:0];

  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 _dismissOtherNetworkViewControllerWithContext:v7];
}

void __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke_298(uint64_t a1, void *a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    int v11 = 136315650;
    os_log_type_t v12 = "-[WFNetworkListController networkListViewControllerDidTapOtherNetwork:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 1024;
    int v16 = a3;
    _os_log_impl(&dword_226071000, v7, v8, "%s: credentials prompt complete, provider %@, shouldDismiss %d", (uint8_t *)&v11, 0x1Cu);
  }

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = [v9 userSuppliedNetwork];

  if ([WeakRetained _canStartAssociationToUserSuppliedNetwork:v10]) {
    [WeakRetained _associateToUserSuppliedNetwork:v10];
  }
}

- (void)networkListViewController:(id)a3 userDidChangePower:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = @"OFF";
    if (v4) {
      os_log_type_t v8 = @"ON";
    }
    int v12 = 138412290;
    __int16 v13 = v8;
    _os_log_impl(&dword_226071000, v6, v7, "User changed power state to %@", (uint8_t *)&v12, 0xCu);
  }

  id v9 = +[WFMetricsManager sharedManager];
  uint64_t v10 = +[WFUserEvent eventWithType:1 state:v4];
  [v9 processEvent:v10];

  int v11 = [(WFNetworkListController *)self wifiClient];
  [v11 setPowered:v4];

  [(WFNetworkListController *)self _powerStateChanged];
}

- (void)networkListViewController:(id)a3 userDidChangePowerToggle:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_log_type_t v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = WFPowerStateToggleToString();
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "-[WFNetworkListController networkListViewController:userDidChangePowerToggle:]";
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_226071000, v9, v8, "%s: User requested power state change to %@", buf, 0x16u);
    }
  }

  [(WFNetworkListController *)self setPowerState:2];
  [(WFNetworkListController *)self setPowerState:[(WFNetworkListController *)self powerState]];
  objc_initWeak((id *)buf, self);
  int v11 = [(WFNetworkListController *)self wifiClient];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__WFNetworkListController_networkListViewController_userDidChangePowerToggle___block_invoke;
  v12[3] = &unk_26478EBE0;
  objc_copyWeak(&v13, (id *)buf);
  [v11 setPoweredToggle:a4 == 1 handler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __78__WFNetworkListController_networkListViewController_userDidChangePowerToggle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _powerStateChanged];
}

- (void)setPowerState:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (self->_powerState != a3)
  {
    id v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
    {
      os_log_type_t v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        os_log_type_t v8 = WFPowerStateToggleToString();
        id v9 = WFPowerStateToggleToString();
        int v17 = 136315650;
        uint64_t v18 = "-[WFNetworkListController setPowerState:]";
        __int16 v19 = 2112;
        int v20 = v8;
        __int16 v21 = 2112;
        os_log_type_t v22 = v9;
        _os_log_impl(&dword_226071000, v7, v6, "%s: power state changed from %@ to %@", (uint8_t *)&v17, 0x20u);
      }
    }

    self->_powerState = a3;
    uint64_t v10 = [(WFNetworkListController *)self viewController];
    char v11 = objc_opt_respondsToSelector();

    int v12 = [(WFNetworkListController *)self viewController];
    id v13 = v12;
    if (v11)
    {
      [v12 powerStateDidChangeToggle:self->_powerState];
    }
    else
    {
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v13 = [(WFNetworkListController *)self viewController];
        [v13 powerStateDidChange:self->_powerState == 1];
      }
      else
      {
        id v13 = WFLogForCategory(0);
        os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v13)
        {
          id v13 = v13;
          if (os_log_type_enabled(v13, v15))
          {
            __int16 v16 = [(WFNetworkListController *)self viewController];
            int v17 = 136315394;
            uint64_t v18 = "-[WFNetworkListController setPowerState:]";
            __int16 v19 = 2112;
            int v20 = v16;
            _os_log_impl(&dword_226071000, v13, v15, "%s: viewController (%@) doesn't respond to power state change methods", (uint8_t *)&v17, 0x16u);
          }
        }
      }
    }
  }
}

- (BOOL)networkListViewControllerCurrentPowerState:(id)a3
{
  os_log_type_t v3 = [(WFNetworkListController *)self wifiClient];
  char v4 = [v3 powered];

  return v4;
}

- (void)networkListViewControllerDidAppear:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    os_log_type_t v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      os_log_type_t v7 = [(WFNetworkListController *)self interface];
      os_log_type_t v8 = [v7 currentNetwork];
      int v19 = 138412546;
      int v20 = v8;
      __int16 v21 = 1024;
      BOOL v22 = [(WFNetworkListController *)self isAssociating];
      _os_log_impl(&dword_226071000, v6, v5, "Network list view controller did appear, current network='%@', isAssociating=%d", (uint8_t *)&v19, 0x12u);
    }
  }

  [(WFNetworkListController *)self _refreshKnownHiddenNetworkNamesCache];
  [(WFNetworkListController *)self _updatePowerState];
  id v9 = [(WFNetworkListController *)self interface];
  uint64_t v10 = [v9 currentNetwork];
  if (!v10)
  {

    goto LABEL_15;
  }
  char v11 = (void *)v10;
  BOOL v12 = [(WFNetworkListController *)self isAssociating];

  if (v12)
  {
LABEL_15:
    [(WFNetworkListController *)self _updateViewControllerScanResults];
    goto LABEL_16;
  }
  [(WFNetworkListController *)self _updateViewControllerConnectedNetwork];
  if ([(WFNetworkListController *)self isAirPortSettings])
  {
    id v13 = WFLogForCategory(0);
    os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
    {
      int v19 = 67109120;
      LODWORD(v20) = 5;
      _os_log_impl(&dword_226071000, v13, v14, "Initial no Internet test will start after %d seconds for wifi list appearance.", (uint8_t *)&v19, 8u);
    }

    os_log_type_t v15 = [(WFNetworkListController *)self healthManager];
    [v15 runNoInternetDiagnosticsAfter:5];
  }
LABEL_16:
  __int16 v16 = +[WFMetricsManager sharedManager];
  int v17 = +[WFUserEvent eventWithType:0];
  [v16 processEvent:v17];

  uint64_t v18 = [(WFNetworkListController *)self wifiClient];
  LODWORD(v17) = [v18 isNetworkRestrictionActive];

  [(WFNetworkListController *)self setCanScanForPersonalHotspots:v17 ^ 1];
}

- (void)networkListViewControllerDidDisappear:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    os_log_type_t v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      BOOL v7 = [(WFNetworkListController *)self isAssociating];
      os_log_type_t v8 = @"NO";
      if (v7) {
        os_log_type_t v8 = @"YES";
      }
      int v15 = 138412290;
      __int16 v16 = v8;
      _os_log_impl(&dword_226071000, v6, v5, "Network list view controller did disappear - associating %@", (uint8_t *)&v15, 0xCu);
    }
  }
  [(WFNetworkListController *)self _pauseScanning];
  [(WFNetworkListController *)self _stopHotspotScan];
  id v9 = [(WFNetworkListController *)self viewController];
  uint64_t v10 = [v9 navigationController];
  char v11 = [v10 viewControllers];
  if ([v11 count] == 1)
  {
  }
  else
  {
    BOOL v12 = [(WFNetworkListController *)self viewController];
    id v13 = [v12 navigationController];

    if (v13) {
      return;
    }
  }
  os_log_type_t v14 = [(WFNetworkListController *)self scanMetricsManager];
  [v14 submit];
}

- (void)networkListViewControllerDidFinish:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    BOOL v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      BOOL v8 = [(WFNetworkListController *)self isAssociating];
      id v9 = @"NO";
      char v11 = "-[WFNetworkListController networkListViewControllerDidFinish:]";
      int v10 = 136315650;
      __int16 v12 = 2112;
      id v13 = v4;
      if (v8) {
        id v9 = @"YES";
      }
      __int16 v14 = 2112;
      int v15 = v9;
      _os_log_impl(&dword_226071000, v7, v6, "%s: %@ - associating %@", (uint8_t *)&v10, 0x20u);
    }
  }
  [(WFNetworkListController *)self _cleanUpStatesForDismissal];
}

- (void)networkListViewController:(id)a3 showSettingsForNetwork:(id)a4
{
}

- (void)networkListViewController:(id)a3 showSettingsForNetwork:(id)a4 context:(int64_t)a5
{
}

- (void)networkListViewController:(id)a3 showSettingsForNetwork:(id)a4 context:(int64_t)a5 scrollToCellType:(unint64_t)a6
{
  uint64_t v232 = *MEMORY[0x263EF8340];
  id v179 = a3;
  id v8 = a4;
  objc_opt_class();
  v185 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      val = self;
      id v9 = [(WFNetworkListController *)self interface];
      int v10 = [v9 currentNetwork];
      int v11 = [v10 isEqual:v8];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v184 = v185;
        v180 = [[WFNetworkScanRecord alloc] initWithCoreWiFiProfile:v184];
        __int16 v12 = [(WFNetworkListController *)val knownNetworksManager];
        id v13 = [(WFNetworkScanRecord *)v180 ssid];
        __int16 v14 = [v12 privateAddressConfigForNetworkName:v13];

        [(WFNetworkScanRecord *)v180 populatePrivateAddressConfig:v14];
        int v15 = [(WFNetworkListController *)val interface];
        uint64_t v16 = [v15 currentNetwork];
        char v17 = [v16 isEquivalentRecord:v180];

        if ((v17 & 1) == 0)
        {
LABEL_6:
          BOOL v18 = 0;
          goto LABEL_39;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v33 = WFLogForCategory(0);
          os_log_type_t v34 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v33)
          {
            id v35 = v33;
            if (os_log_type_enabled(v35, v34))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]";
              *(_WORD *)&v228[8] = 2112;
              *(void *)&v228[10] = 0;
              _os_log_impl(&dword_226071000, v35, v34, "%s: unknown class type for network='%@'", buf, 0x16u);
            }
          }
          v180 = 0;
          if ((v11 & 1) == 0)
          {
            BOOL v18 = 0;
            goto LABEL_42;
          }
          v184 = 0;
          goto LABEL_38;
        }
        v180 = v185;
        __int16 v21 = [(WFNetworkListController *)val gasController];
        [v21 resolveProfileForNetwork:v180 handler:&__block_literal_global_318 force:1];

        if (v11
          && ([(WFNetworkListController *)val wifiClient],
              BOOL v22 = objc_claimAutoreleasedReturnValue(),
              [v22 interface],
              uint64_t v23 = objc_claimAutoreleasedReturnValue(),
              int v24 = [v23 associatedOnIRInterface],
              v23,
              v22,
              v24))
        {
          os_log_type_t v25 = WFLogForCategory(0);
          os_log_type_t v26 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v25)
          {
            uint64_t v27 = v25;
            if (os_log_type_enabled(v27, v26))
            {
              id v28 = [(WFNetworkScanRecord *)v180 title];
              *(_DWORD *)buf = 136315394;
              *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]";
              *(_WORD *)&v228[8] = 2112;
              *(void *)&v228[10] = v28;
              _os_log_impl(&dword_226071000, v27, v26, "%s: Getting current network's(%@) profile from ir interface", buf, 0x16u);
            }
          }

          os_log_type_t v29 = [(WFNetworkListController *)val wifiClient];
          id v30 = [v29 interface];
          id v31 = [v30 irInterface];
          id v32 = [(WFNetworkScanRecord *)v180 scanResult];
          v184 = [v31 knownNetworkProfileMatchingScanResult:v32];

          if (v184) {
            goto LABEL_38;
          }
        }
        else
        {
          id v36 = [(WFNetworkListController *)val wifiClient];
          id v37 = [v36 cInterface];
          id v38 = [(WFNetworkScanRecord *)v180 scanResult];
          v184 = [v37 knownNetworkProfileMatchingScanResult:v38];

          if (v184)
          {
            if (!v11)
            {
              BOOL v18 = 0;
              goto LABEL_40;
            }
            goto LABEL_38;
          }
        }
        uint64_t v39 = WFLogForCategory(0);
        os_log_type_t v40 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v39)
        {
          __int16 v41 = v39;
          if (os_log_type_enabled(v41, v40))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_226071000, v41, v40, "cwProfile not found in known networks list", buf, 2u);
          }
        }
        v184 = [(WFNetworkScanRecord *)v180 matchingKnownNetworkProfile];
        if ((v11 & 1) == 0) {
          goto LABEL_6;
        }
      }
LABEL_38:
      uint64_t v42 = [(WFNetworkListController *)val interface];
      __int16 v43 = [v42 currentNetwork];
      BOOL v18 = [v43 carPlayType] != 1;

LABEL_39:
      if (v184)
      {
LABEL_40:
        v172 = [[WFNetworkProfile alloc] initWithCoreWiFiProfile:v184];
        uint64_t v177 = [(WFNetworkListController *)val _hardwareMACAddress];
        char v44 = 0;
        if (v18)
        {
LABEL_41:
          __int16 v45 = [(WFNetworkListController *)val interface];
          int v46 = [v45 currentNetwork];

          unsigned int v178 = 1;
LABEL_49:
          BOOL v50 = [(WFNetworkScanRecord *)v46 isRandomMACAddressEnabled];
          int v51 = WFLogForCategory(8uLL);
          os_log_type_t v52 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v51)
          {
            __int16 v53 = v51;
            if (os_log_type_enabled(v53, v52))
            {
              v54 = [(WFNetworkScanRecord *)v46 ssid];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v228 = v50;
              *(_WORD *)&v228[4] = 2112;
              *(void *)&v228[6] = v54;
              _os_log_impl(&dword_226071000, v53, v52, "private address value=%d for '%@'", buf, 0x12u);
            }
          }

          __int16 v55 = [(WFNetworkListController *)val randomMACManager];
          uint64_t v56 = [v185 ssid];
          int v57 = [v55 isSSIDinCache:v56];

          if (v57)
          {
            int v58 = [(WFNetworkListController *)val randomMACManager];
            os_log_type_t v59 = [v185 ssid];
            int v60 = [v58 shouldEnableRandomMACForSSID:v59];

            int v61 = WFLogForCategory(8uLL);
            os_log_type_t v62 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v61)
            {
              char v63 = v61;
              if (os_log_type_enabled(v63, v62))
              {
                int v64 = [(WFNetworkScanRecord *)v46 ssid];
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v228 = v60;
                *(_WORD *)&v228[4] = 1024;
                *(_DWORD *)&v228[6] = v50;
                *(_WORD *)&v228[10] = 2112;
                *(void *)&v228[12] = v64;
                _os_log_impl(&dword_226071000, v63, v62, "overriding private address from scan cache (was=%d) value=%d for '%@'", buf, 0x18u);
              }
            }
          }
          else
          {
            int v60 = v50;
          }
          if (v178)
          {
            char v65 = [(WFNetworkListController *)val interface];
            id v66 = [v65 currentNetwork];
            int v67 = [v66 isRandomMACAddressEnabled];

            int v68 = WFLogForCategory(8uLL);
            os_log_type_t v69 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v68)
            {
              int v70 = v68;
              if (os_log_type_enabled(v70, v69))
              {
                uint64_t v71 = [(WFNetworkScanRecord *)v46 ssid];
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v228 = v67;
                *(_WORD *)&v228[4] = 1024;
                *(_DWORD *)&v228[6] = v60;
                *(_WORD *)&v228[10] = 2112;
                *(void *)&v228[12] = v71;
                _os_log_impl(&dword_226071000, v70, v69, "overriding private address for current network (was=%d) value=%d for '%@'", buf, 0x18u);
              }
            }
          }
          os_log_type_t v72 = [(WFNetworkScanRecord *)v46 matchingKnownNetworkProfile];
          int v73 = [v72 NANServiceID];

          id v74 = [(WFNetworkScanRecord *)v46 randomMACAddress];
          uint64_t v75 = [v177 isEqualToString:v74];

          if ([(WFNetworkScanRecord *)v46 isSupervised]) {
            goto LABEL_81;
          }
          uint64_t v76 = [(WFNetworkScanRecord *)v46 randomMACAddress];
          if (v76)
          {
            id v77 = [(WFNetworkScanRecord *)v46 randomMACAddress];
            char v78 = [v177 isEqualToString:v77];
          }
          else
          {
            char v78 = 1;
          }

          if ((v78 & (v73 == 0)) != 1)
          {
LABEL_81:
            id v85 = WFLogForCategory(8uLL);
            os_log_type_t v89 = OSLogForWFLogLevel(1uLL);
            if (!WFCurrentLogLevel() || !v85)
            {
              v181 = v46;
              goto LABEL_88;
            }
            uint64_t v86 = v85;
            if (os_log_type_enabled(v86, v89))
            {
              BOOL v90 = [(WFNetworkScanRecord *)v46 isSupervised];
              uint64_t v91 = [(WFNetworkScanRecord *)v46 randomMACAddress];
              *(_DWORD *)buf = 136316162;
              *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]";
              *(_WORD *)&v228[8] = 1024;
              *(_DWORD *)&v228[10] = v73 == 0;
              *(_WORD *)&v228[14] = 1024;
              *(_DWORD *)&v228[16] = v90;
              *(_WORD *)v229 = 2112;
              *(void *)&v229[2] = v91;
              __int16 v230 = 2112;
              v231 = v177;
              _os_log_impl(&dword_226071000, v86, v89, "%s: privateAddressSupported: %d, networkissupervised: %d, network random address from scan: %@, hardwareMac: %@", buf, 0x2Cu);
            }
            id v85 = v86;
            v181 = v46;
          }
          else
          {
            id v79 = WFLogForCategory(8uLL);
            os_log_type_t v80 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v79)
            {
              uint64_t v81 = v79;
              if (os_log_type_enabled(v81, v80))
              {
                id v82 = [(WFNetworkScanRecord *)v46 ssid];
                uint64_t v83 = [(WFNetworkScanRecord *)v46 randomMACAddress];
                *(_DWORD *)buf = 138412802;
                *(void *)v228 = v82;
                *(_WORD *)&v228[8] = 2112;
                *(void *)&v228[10] = v83;
                *(_WORD *)&v228[18] = 1024;
                *(_DWORD *)v229 = v75;
                _os_log_impl(&dword_226071000, v81, v80, "generating private address for '%@' (currentAddress=%@, usingHWAddress=%d)", buf, 0x1Cu);
              }
            }

            uint64_t v84 = [(WFNetworkListController *)val randomMACManager];
            v181 = (WFNetworkScanRecord *)[v84 newScanRecordWithRandomMACFromScanRecord:v46];

            if (val->_isRandomMACManageFeatureEnabled)
            {
LABEL_89:
              uint64_t v92 = [(WFNetworkScanRecord *)v180 privateAddressMode];
              if (!v92) {
                uint64_t v92 = [(WFNetworkScanRecord *)v181 privateAddressMode];
              }
              uint64_t v93 = [WFDetailContextPrivateAddressConfig alloc];
              os_log_type_t v94 = [(WFNetworkScanRecord *)v181 randomMACAddress];
              v174 = [(WFDetailContextPrivateAddressConfig *)v93 initWithRandomMACAddress:v94 hardwareMACAddress:v177 privateAddressMode:v92 connectedWithHardwareAddress:v75 privateAddressSupported:v73 == 0];

              uint64_t v95 = [(WFNetworkListController *)val interface];
              uint64_t v96 = [v95 cInterface];
              int v97 = [v96 deviceSupports6E];

              if (v44) {
                uint64_t v98 = 0;
              }
              else {
                uint64_t v98 = [v184 wifiModeConfigurable] & v97;
              }
              v173 = -[WFDetailContextWiFiModeConfig initWithConfigurable:wifiMode:]([WFDetailContextWiFiModeConfig alloc], "initWithConfigurable:wifiMode:", v98, [v184 disable6EMode]);
              v99 = [WFDetailsContext alloc];
              uint64_t v100 = [(WFNetworkListController *)val interface];
              id v101 = [v100 ipMonitor];
              os_log_type_t v102 = [(WFNetworkListController *)val interface];
              id v103 = [(WFDetailsContext *)v99 initWithNetwork:v181 profile:v184 ipMonitor:v101 interface:v102 privateMACConfig:v174 wifiModeConfig:v173];

              [(WFDetailsContext *)v103 setEntryContext:a5];
              [(WFDetailsContext *)v103 setJoinable:a5 != 2];
              id v104 = [(WFNetworkListController *)val wifiClient];
              -[WFDetailsContext setDiagnosable:](v103, "setDiagnosable:", [v104 isDiagnosticsEnabled]);

              if (v178)
              {
                id v105 = [(WFNetworkListController *)val _sortedHealthRecommendations];
                os_log_type_t v106 = [v105 displayableHealthRecommendations];
                [(WFDetailsContext *)v103 setRecommendations:v106];

                uint64_t v107 = +[WFMetricsManager sharedManager];
                uint64_t v108 = [(WFNetworkListController *)val healthRecommendations];
                id v109 = [(WFNetworkScanRecord *)v181 ssid];
                double v110 = +[WFHealthUIEvent detailEventWithIssues:v108 ssid:v109 securityType:[(WFNetworkScanRecord *)v181 securityMode]];
                [v107 processEvent:v110];
              }
              id v111 = [MEMORY[0x263F863E0] privateAddressDisabledBySystemIssue];
              int v112 = [v111 issueRecommendation];
              [(WFDetailsContext *)v103 setStaticPrivateMACFooterText:v112];

              [(WFDetailsContext *)v103 setCurrent:v178];
              v183 = [v184 accessoryIdentifier];
              if (_os_feature_enabled_impl())
              {
                BOOL v113 = [(WFNetworkListController *)val isAirPortSettings];
                if (v183 && v113)
                {
                  uint64_t v115 = WFLogForCategory(0);
                  os_log_type_t v116 = OSLogForWFLogLevel(3uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 3 && v115)
                  {
                    long long v117 = v115;
                    if (os_log_type_enabled(v117, v116))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:conte"
                                        "xt:scrollToCellType:]";
                      *(_WORD *)&v228[8] = 2114;
                      *(void *)&v228[10] = v183;
                      _os_log_impl(&dword_226071000, v117, v116, "%s: looking up device for accessory identifier = '%{public}@'", buf, 0x16u);
                    }
                  }
                  id v171 = (id *)objc_alloc_init(MEMORY[0x263F397F8]);
                  id v118 = [MEMORY[0x263F397F8] getDevicesWithFlags:8 session:v171 error:0];
                  long long v119 = WFLogForCategory(0);
                  os_log_type_t v120 = OSLogForWFLogLevel(4uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v119)
                  {
                    id v121 = v119;
                    if (os_log_type_enabled(v121, v120))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:conte"
                                        "xt:scrollToCellType:]";
                      *(_WORD *)&v228[8] = 2112;
                      *(void *)&v228[10] = v118;
                      _os_log_impl(&dword_226071000, v121, v120, "%s: devices found = '%@'", buf, 0x16u);
                    }
                  }
                  long long v224 = 0u;
                  long long v225 = 0u;
                  long long v222 = 0u;
                  long long v223 = 0u;
                  id v122 = v118;
                  uint64_t v123 = [v122 countByEnumeratingWithState:&v222 objects:v226 count:16];
                  if (v123)
                  {
                    uint64_t v124 = *(void *)v223;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v123; ++i)
                      {
                        if (*(void *)v223 != v124) {
                          objc_enumerationMutation(v122);
                        }
                        __int16 v126 = *(void **)(*((void *)&v222 + 1) + 8 * i);
                        dispatch_semaphore_t v127 = WFLogForCategory(0);
                        os_log_type_t v128 = OSLogForWFLogLevel(4uLL);
                        if ((unint64_t)WFCurrentLogLevel() >= 4 && v127)
                        {
                          v129 = v127;
                          if (os_log_type_enabled(v129, v128))
                          {
                            v130 = [v126 SSID];
                            *(_DWORD *)buf = 136315650;
                            *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork"
                                              ":context:scrollToCellType:]";
                            *(_WORD *)&v228[8] = 2112;
                            *(void *)&v228[10] = v126;
                            *(_WORD *)&v228[18] = 2112;
                            *(void *)v229 = v130;
                            _os_log_impl(&dword_226071000, v129, v128, "%s: device='%@' SSID='%@'", buf, 0x20u);
                          }
                        }

                        v131 = [v126 identifier];
                        int v132 = [v131 isEqualToString:v183];

                        if (v132)
                        {
                          id v133 = WFLogForCategory(0);
                          os_log_type_t v134 = OSLogForWFLogLevel(4uLL);
                          if ((unint64_t)WFCurrentLogLevel() >= 4 && v133)
                          {
                            id v135 = v133;
                            if (os_log_type_enabled(v135, v134))
                            {
                              *(_DWORD *)buf = 136315394;
                              *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwo"
                                                "rk:context:scrollToCellType:]";
                              *(_WORD *)&v228[8] = 2112;
                              *(void *)&v228[10] = v126;
                              _os_log_impl(&dword_226071000, v135, v134, "%s: device found = '%@', setting device to detail context", buf, 0x16u);
                            }
                          }
                          if (objc_opt_respondsToSelector()) {
                            [(WFDetailsContext *)v103 setDaDevice:v126];
                          }
                          goto LABEL_132;
                        }
                      }
                      uint64_t v123 = [v122 countByEnumeratingWithState:&v222 objects:v226 count:16];
                      if (v123) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_132:
                }
              }
              v136 = [(WFNetworkListController *)val viewController];
              objc_opt_class();
              [(WFDetailsContext *)v103 setSupportsAirportManagement:(objc_opt_isKindOfClass() & 1) == 0];

              [(WFDetailsContext *)v103 setPrivacyProxyTierStatus:[(WFNetworkListController *)val privacyProxyFeatureTier]];
              v137 = [(WFNetworkListController *)val wifiClient];
              BOOL v138 = [v137 cellularOutrankState] != 0;
              v139 = [(WFNetworkListController *)val wifiClient];
              -[WFDetailsContext setWiFiOutranked:privateCellular:](v103, "setWiFiOutranked:privateCellular:", v138, [v139 cellularOutrankState] == 5);

              v140 = [(WFNetworkListController *)val wifiClient];
              -[WFDetailsContext setWiFiOutrankedDev:](v103, "setWiFiOutrankedDev:", [v140 cellularOutrankState] == 4);

              [(WFDetailsContext *)v103 setCredentialsVisible:a5 == 2];
              if ([(WFDetailsContext *)v103 shouldHideCredentials])
              {
                uint64_t v141 = WFLogForCategory(0);
                os_log_type_t v142 = OSLogForWFLogLevel(1uLL);
                if (!WFCurrentLogLevel() || !v141)
                {
LABEL_141:

                  [(WFDetailsContext *)v103 setScrollToCellType:a6];
                  v146 = WFLogForCategory(0);
                  os_log_type_t v147 = OSLogForWFLogLevel(3uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 3 && v146)
                  {
                    id v148 = v146;
                    if (os_log_type_enabled(v148, v147))
                    {
                      v149 = [(WFDetailsContext *)v103 network];
                      uint64_t v150 = [v149 signalBars];
                      *(_DWORD *)buf = 136315650;
                      *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:conte"
                                        "xt:scrollToCellType:]";
                      *(_WORD *)&v228[8] = 2112;
                      *(void *)&v228[10] = v103;
                      *(_WORD *)&v228[18] = 2048;
                      *(void *)v229 = v150;
                      _os_log_impl(&dword_226071000, v148, v147, "%s: details context='%@' signalBars=%lu", buf, 0x20u);
                    }
                  }

                  v151 = [(WFNetworkListController *)val viewProvider];
                  id v176 = [v151 networkDetailsViewControllerWithContext:v103];

                  v152 = [(WFNetworkListController *)val viewProvider];
                  char v153 = objc_opt_respondsToSelector();

                  if (v153)
                  {
                    uint64_t v154 = WFLogForCategory(0);
                    os_log_type_t v155 = OSLogForWFLogLevel(3uLL);
                    if ((unint64_t)WFCurrentLogLevel() >= 3 && v154)
                    {
                      uint64_t v156 = v154;
                      if (os_log_type_enabled(v156, v155))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(void *)v228 = v176;
                        *(_WORD *)&v228[8] = 2112;
                        *(void *)&v228[10] = v103;
                        _os_log_impl(&dword_226071000, v156, v155, "viewProvider will handle presentation of %@ (context %@)", buf, 0x16u);
                      }
                    }
                    char v157 = [(WFNetworkListController *)val viewProvider];
                    [v157 presentNetworkViewController:v176 forContext:v103];
                  }
                  else
                  {
                    long long v158 = [(WFNetworkListController *)val viewController];
                    long long v159 = [v158 navigationController];
                    BOOL v160 = v159 == 0;

                    if (v160)
                    {
LABEL_156:
                      [(WFDetailsContext *)v103 setProvider:v176];
                      v162 = +[WFMetricsManager sharedManager];
                      v163 = +[WFUserEvent eventWithType:3 state:v178];
                      [v162 processEvent:v163];

                      objc_initWeak((id *)buf, v103);
                      objc_initWeak(&location, val);
                      v217[0] = MEMORY[0x263EF8330];
                      v217[1] = 3221225472;
                      v217[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_327;
                      v217[3] = &unk_26478EC30;
                      objc_copyWeak(&v219, &location);
                      objc_copyWeak(v220, (id *)buf);
                      v164 = v184;
                      v218 = v164;
                      v220[1] = (id)a5;
                      [(WFDetailsContext *)v103 setActionHandler:v217];
                      v213[0] = MEMORY[0x263EF8330];
                      v213[1] = 3221225472;
                      v213[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_380;
                      v213[3] = &unk_26478EC58;
                      objc_copyWeak(&v215, (id *)buf);
                      objc_copyWeak(&v216, &location);
                      int v19 = v180;
                      v214 = v19;
                      [(WFDetailsContext *)v103 setPrivateMACHandler:v213];
                      v209[0] = MEMORY[0x263EF8330];
                      v209[1] = 3221225472;
                      v209[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_381;
                      v209[3] = &unk_26478EC80;
                      objc_copyWeak(&v211, (id *)buf);
                      __int16 v165 = v164;
                      v210 = v165;
                      objc_copyWeak(&v212, &location);
                      [(WFDetailsContext *)v103 setAutoJoinHandler:v209];
                      v205[0] = MEMORY[0x263EF8330];
                      v205[1] = 3221225472;
                      v205[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_382;
                      v205[3] = &unk_26478EC80;
                      objc_copyWeak(&v207, (id *)buf);
                      v166 = v165;
                      v206 = v166;
                      objc_copyWeak(&v208, &location);
                      [(WFDetailsContext *)v103 setAutoLoginHandler:v205];
                      v201[0] = MEMORY[0x263EF8330];
                      v201[1] = 3221225472;
                      v201[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_383;
                      v201[3] = &unk_26478EC80;
                      objc_copyWeak(&v203, (id *)buf);
                      v167 = v166;
                      v202 = v167;
                      objc_copyWeak(&v204, &location);
                      [(WFDetailsContext *)v103 setLowDataModeHandler:v201];
                      v197[0] = MEMORY[0x263EF8330];
                      v197[1] = 3221225472;
                      v197[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_384;
                      v197[3] = &unk_26478EC80;
                      objc_copyWeak(&v199, (id *)buf);
                      v168 = v167;
                      v198 = v168;
                      objc_copyWeak(&v200, &location);
                      [(WFDetailsContext *)v103 setPrivacyProxyHandler:v197];
                      v193[0] = MEMORY[0x263EF8330];
                      v193[1] = 3221225472;
                      v193[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_388;
                      v193[3] = &unk_26478ECD0;
                      objc_copyWeak(&v195, (id *)buf);
                      v169 = v168;
                      v194 = v169;
                      objc_copyWeak(&v196, &location);
                      [(WFDetailsContext *)v103 setNetworkQualityHandler:v193];
                      objc_initWeak(&from, v103);
                      v187[0] = MEMORY[0x263EF8330];
                      v187[1] = 3221225472;
                      v187[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_390;
                      v187[3] = &unk_26478ECF8;
                      id v170 = v169;
                      v188 = v170;
                      objc_copyWeak(&v190, &from);
                      objc_copyWeak(&v191, &location);
                      id v189 = v185;
                      [(WFDetailsContext *)v103 setWiFiModeChangedHandler:v187];
                      [(WFNetworkListController *)val setDetailsContext:v103];
                      [(WFNetworkListController *)val setVisibleContext:v103];

                      objc_destroyWeak(&v191);
                      objc_destroyWeak(&v190);

                      objc_destroyWeak(&from);
                      objc_destroyWeak(&v196);

                      objc_destroyWeak(&v195);
                      objc_destroyWeak(&v200);

                      objc_destroyWeak(&v199);
                      objc_destroyWeak(&v204);

                      objc_destroyWeak(&v203);
                      objc_destroyWeak(&v208);

                      objc_destroyWeak(&v207);
                      objc_destroyWeak(&v212);

                      objc_destroyWeak(&v211);
                      objc_destroyWeak(&v216);
                      objc_destroyWeak(&v215);

                      objc_destroyWeak(v220);
                      objc_destroyWeak(&v219);
                      objc_destroyWeak(&location);
                      objc_destroyWeak((id *)buf);

                      goto LABEL_157;
                    }
                    char v157 = [(WFNetworkListController *)val viewController];
                    long long v161 = [v157 navigationController];
                    [v161 pushViewController:v176 animated:1];
                  }
                  goto LABEL_156;
                }
                uint64_t v143 = v141;
                if (os_log_type_enabled(v143, v142))
                {
                  char v144 = [(WFNetworkScanRecord *)v181 ssid];
                  *(_DWORD *)buf = 136315394;
                  *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:s"
                                    "crollToCellType:]";
                  *(_WORD *)&v228[8] = 2112;
                  *(void *)&v228[10] = v144;
                  _os_log_impl(&dword_226071000, v143, v142, "%s: Not setting credentials for network: %@ to keep it hidden", buf, 0x16u);
                }
                uint64_t v141 = v143;
              }
              else
              {
                v145 = [(WFNetworkProfile *)v172 username];
                [(WFDetailsContext *)v103 setUsername:v145];

                uint64_t v141 = [(WFNetworkScanRecord *)v181 ssid];
                uint64_t v143 = [(WFNetworkListController *)val passwordToDisplayForSSID:v141];
                [(WFDetailsContext *)v103 setPassword:v143];
              }

              goto LABEL_141;
            }
            id v85 = [(WFNetworkListController *)val wifiClient];
            uint64_t v86 = [(WFNetworkScanRecord *)v181 ssid];
            uint64_t v87 = [(WFNetworkScanRecord *)v181 isRandomMACAddressEnabled];
            uint64_t v88 = [(WFNetworkScanRecord *)v181 randomMACAddress];
            [v85 setEnableRandomMACForNetwork:v86 enable:v87 randomMAC:v88];
          }
LABEL_88:

          goto LABEL_89;
        }
LABEL_48:
        int v46 = v180;
        unsigned int v178 = 0;
        v180 = v46;
        goto LABEL_49;
      }
LABEL_42:
      uint64_t v47 = WFLogForCategory(0);
      os_log_type_t v48 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v47)
      {
        __int16 v49 = v47;
        if (os_log_type_enabled(v49, v48))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]";
          *(_WORD *)&v228[8] = 2112;
          *(void *)&v228[10] = v180;
          _os_log_impl(&dword_226071000, v49, v48, "%s: nil CWFProfile for '%@', network is not a known network", buf, 0x16u);
        }
      }
      uint64_t v177 = [(WFNetworkListController *)val _hardwareMACAddress];
      v172 = 0;
      v184 = 0;
      char v44 = 1;
      if (v18) {
        goto LABEL_41;
      }
      goto LABEL_48;
    }
  }
  int v19 = WFLogForCategory(0);
  os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v19 && os_log_type_enabled(v19, v20))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v228 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]";
    *(_WORD *)&v228[8] = 2112;
    *(void *)&v228[10] = v185;
    _os_log_impl(&dword_226071000, v19, v20, "%s: not showing settings for in progress hotspot join %@", buf, 0x16u);
  }
LABEL_157:
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  os_log_type_t v6 = WFLogForCategory(5uLL);
  os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_226071000, v6, v7, "resolved profile %@ error %@", (uint8_t *)&v8, 0x16u);
  }
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_327(uint64_t a1, NSObject *a2)
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315394;
    id v122 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    __int16 v123 = 2048;
    uint64_t v124 = a2;
    _os_log_impl(&dword_226071000, v4, v5, "%s: performing details action=%lu", buf, 0x16u);
  }

  switch((unint64_t)a2)
  {
    case 0uLL:
      os_log_type_t v6 = +[WFMetricsManager sharedManager];
      os_log_type_t v7 = +[WFUserEvent eventWithType:4];
      [v6 processEvent:v7];

      id v8 = objc_loadWeakRetained(&to);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [v8 _dismissDetailsViewControllerWithContext:WeakRetained];

      id v10 = objc_loadWeakRetained((id *)(a1 + 48));
      id v11 = [v10 network];

      id v12 = objc_loadWeakRetained(&to);
      id v13 = [v12 interface];
      __int16 v14 = [v13 currentNetwork];
      char v15 = [v11 isEqual:v14];

      if (v15)
      {
        int v115 = 1;
LABEL_44:
        uint64_t v86 = [v11 carPlayType];
        BOOL v87 = v86 == 2;
        if (v86 != 2 && ((v115 ^ 1) & 1) == 0)
        {
          id v88 = objc_loadWeakRetained(&to);
          os_log_type_t v89 = [v88 interface];
          BOOL v90 = [v89 currentNetwork];
          BOOL v87 = [v90 carPlayType] == 2;
        }
        id v91 = objc_loadWeakRetained(&to);
        uint64_t v92 = [v91 networks];
        uint64_t v93 = (void *)[v92 mutableCopy];

        [v93 removeObject:v11];
        [v11 setKnown:0];
        id v94 = objc_loadWeakRetained(&to);
        [v94 setNetworks:v93];

        uint64_t v95 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_329;
        block[3] = &unk_26478EC08;
        objc_copyWeak(&v119, &to);
        id v117 = *(id *)(a1 + 32);
        BOOL v18 = v11;
        id v118 = v18;
        dispatch_async(v95, block);

        if (v115)
        {
          if (v87)
          {
            uint64_t v96 = WFLogForCategory(0);
            os_log_type_t v97 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v96 && os_log_type_enabled(v96, v97))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v96, v97, "Network is CarPlayUserConfigured- not disassociating, changing current network type == CarPlayOnly", buf, 2u);
            }

            id v98 = objc_loadWeakRetained(&to);
            v99 = [v98 interface];
            [v99 disassociateFromCarPlayUserConfiguredNetwork];
          }
          else
          {
            id v98 = objc_loadWeakRetained(&to);
            v99 = [v98 interface];
            [v99 disassociateFromCurrentNetwork];
          }
        }
        else
        {
          if (!v18) {
            goto LABEL_62;
          }
          uint64_t v100 = WFLogForCategory(0);
          os_log_type_t v101 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v100 && os_log_type_enabled(v100, v101))
          {
            *(_DWORD *)buf = 136315394;
            id v122 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
            __int16 v123 = 2112;
            uint64_t v124 = v18;
            _os_log_impl(&dword_226071000, v100, v101, "%s: updating view for %@", buf, 0x16u);
          }

          [v18 setHotspot20Name:0];
          [v18 setHotspotPluginLabel:0];
          id v98 = objc_loadWeakRetained(&to);
          v99 = [MEMORY[0x263EFFA08] setWithObject:v18];
          [v98 _updateViewsForNetworks:v99];
        }

LABEL_62:
        id v102 = objc_loadWeakRetained(&to);
        if ([v102 isHS20Supported])
        {
          int v103 = [v18 isHotspot20];

          if (!v103) {
            goto LABEL_70;
          }
          id v104 = WFLogForCategory(0);
          os_log_type_t v105 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v104 && os_log_type_enabled(v104, v105))
          {
            *(_DWORD *)buf = 136315138;
            id v122 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
            _os_log_impl(&dword_226071000, v104, v105, "%s: network is hotspot 20", buf, 0xCu);
          }

          id v102 = objc_loadWeakRetained(&to);
          os_log_type_t v106 = [v102 gasController];
          [v106 removeProfileForNetwork:v18];
        }
LABEL_70:
        if (*(void *)(a1 + 56) == 2)
        {
          id v107 = objc_loadWeakRetained(&to);
          uint64_t v108 = [v107 viewController];
          int v109 = [v108 conformsToProtocol:&unk_26DA147F0];

          if (v109)
          {
            double v110 = WFLogForCategory(0);
            os_log_type_t v111 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v110 && os_log_type_enabled(v110, v111))
            {
              *(_DWORD *)buf = 136315138;
              id v122 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
              _os_log_impl(&dword_226071000, v110, v111, "%s: refreshing view controller after forget network", buf, 0xCu);
            }

            id v112 = objc_loadWeakRetained(&to);
            BOOL v113 = [v112 viewController];

            [v113 refreshKnownNetworksUpdateTableView:1];
          }
        }

        objc_destroyWeak(&v119);
        goto LABEL_78;
      }
      __int16 v55 = [v11 ssid];
      uint64_t v56 = objc_loadWeakRetained(&to);
      int v57 = [v56 interface];
      int v58 = [v57 currentNetwork];
      os_log_type_t v59 = [v58 ssid];
      int v115 = [v55 isEqualToString:v59];
      if (v115)
      {
        id v60 = objc_loadWeakRetained(&to);
        int v61 = [v60 interface];
        os_log_type_t v62 = [v61 currentNetwork];
        int v114 = -[NSObject isNetworkSecurityModeMatch:](v11, "isNetworkSecurityModeMatch:", [v62 securityModeExt]);

        if (!v114)
        {
          int v115 = 0;
          goto LABEL_44;
        }
        __int16 v55 = WFLogForCategory(0);
        os_log_type_t v63 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() < 3 || !v55) {
          goto LABEL_42;
        }
        uint64_t v56 = v55;
        if (os_log_type_enabled(v56, v63))
        {
          id v64 = objc_loadWeakRetained(&to);
          char v65 = [v64 interface];
          id v66 = [v65 currentNetwork];
          *(_DWORD *)buf = 138412546;
          id v122 = v66;
          __int16 v123 = 2112;
          uint64_t v124 = v11;
          _os_log_impl(&dword_226071000, v56, v63, "current network %@ isNotEqual to network to be forgotten %@, but ssid + security type match", buf, 0x16u);
        }
        __int16 v55 = v56;
      }
      else
      {
      }
LABEL_42:

      goto LABEL_44;
    case 1uLL:
      uint64_t v16 = (id *)(a1 + 48);
      id v17 = objc_loadWeakRetained(v16);
      BOOL v18 = [v17 network];

      int v19 = WFLogForCategory(0);
      os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v19 && os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138412290;
        id v122 = (const char *)v18;
        _os_log_impl(&dword_226071000, v19, v20, "Launching AirPort Utility for network %@", buf, 0xCu);
      }

      if (v18)
      {
        __int16 v21 = +[WFMetricsManager sharedManager];
        BOOL v22 = +[WFUserEvent eventWithType:5];
        [v21 processEvent:v22];

        uint64_t v23 = (void *)MEMORY[0x263F24AF0];
        int v24 = [v18 ssid];
        os_log_type_t v25 = [v18 bssid];
        id v26 = objc_loadWeakRetained(&to);
        uint64_t v27 = [v26 viewController];
        [v23 launchAUForNetwork:v24 withMacAddress:v25 getAUFromAppStore:1 viewController:v27];
      }
      id v28 = objc_loadWeakRetained(&to);
      id v29 = objc_loadWeakRetained(v16);
      [v28 _dismissDetailsViewControllerWithContext:v29];

      goto LABEL_78;
    case 2uLL:
      id v30 = objc_loadWeakRetained(&to);
      id v31 = (id *)(a1 + 48);
      id v32 = objc_loadWeakRetained((id *)(a1 + 48));
      [v30 _dismissDetailsViewControllerWithContext:v32];

      id v33 = objc_loadWeakRetained(v31);
      BOOL v18 = [v33 network];

      id v34 = objc_loadWeakRetained(&to);
      [v34 _associateToScanRecord:v18];

      id v35 = objc_loadWeakRetained(&to);
      id v36 = [v35 associationContext];
      [v36 setOriginator:2];

      goto LABEL_78;
    case 3uLL:
      id v37 = +[WFMetricsManager sharedManager];
      id v38 = +[WFUserEvent eventWithType:6];
      [v37 processEvent:v38];

      id v39 = objc_loadWeakRetained(&to);
      os_log_type_t v40 = [v39 interface];
      __int16 v41 = [v40 ipMonitor];
      char v42 = [v41 renewLease];

      if (v42) {
        goto LABEL_79;
      }
      BOOL v18 = WFLogForCategory(0);
      os_log_type_t v43 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v43))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v18, v43, "Renew lease failed", buf, 2u);
      }
LABEL_78:

LABEL_79:
      objc_destroyWeak(&to);
      return;
    case 4uLL:
      char v44 = (id *)(a1 + 48);
      id v45 = objc_loadWeakRetained(v44);
      int v46 = [v45 recommendations];
      if (v46)
      {
        uint64_t v47 = (void *)MEMORY[0x263EFFA08];
        id v48 = objc_loadWeakRetained(v44);
        __int16 v49 = [v48 recommendations];
        BOOL v18 = [v47 setWithArray:v49];
      }
      else
      {
        BOOL v18 = 0;
      }

      id v67 = objc_loadWeakRetained(v44);
      int v68 = [v67 network];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v70 = objc_loadWeakRetained(v44);
        uint64_t v71 = [v70 network];
        uint64_t v72 = [v71 securityMode];
      }
      else
      {
        uint64_t v72 = 0;
      }
      int v73 = +[WFMetricsManager sharedManager];
      id v74 = objc_loadWeakRetained(v44);
      uint64_t v75 = [v74 network];
      uint64_t v76 = [v75 ssid];
      id v77 = +[WFHealthUIEvent tapLinkEventWithIssues:v18 ssid:v76 securityType:v72];
      [v73 processEvent:v77];

      char v78 = (void *)MEMORY[0x263F086E0];
      id v79 = objc_loadWeakRetained(&to);
      os_log_type_t v80 = [v78 bundleForClass:objc_opt_class()];
      uint64_t v81 = [v80 localizedStringForKey:@"kWFLocSettingsRecommendationLinkURL" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];

      if (v81)
      {
        id v82 = [MEMORY[0x263F1C408] sharedApplication];
        uint64_t v83 = [NSURL URLWithString:v81];
        [v82 openURL:v83 options:MEMORY[0x263EFFA78] completionHandler:0];
      }
      id v84 = objc_loadWeakRetained(&to);
      id v85 = objc_loadWeakRetained(v44);
      [v84 _dismissDetailsViewControllerWithContext:v85];

      goto LABEL_78;
    case 5uLL:
      id v50 = objc_loadWeakRetained((id *)(a1 + 48));
      BOOL v18 = [v50 network];

      id v51 = objc_loadWeakRetained(&to);
      [v51 _associateToScanRecord:v18];

      goto LABEL_78;
    case 6uLL:
      id v52 = objc_loadWeakRetained((id *)(a1 + 48));
      BOOL v18 = [v52 portalURL];

      if (v18)
      {
        __int16 v53 = [MEMORY[0x263F1C408] sharedApplication];
        v54 = [NSURL URLWithString:v18];
        [v53 openURL:v54 options:MEMORY[0x263EFFA78] completionHandler:0];
      }
      goto LABEL_78;
    default:
      goto LABEL_79;
  }
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_329(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  os_log_type_t v3 = [WeakRetained wifiClient];
  id v4 = [v3 cInterface];
  uint64_t v5 = *(void *)(a1 + 32);
  id v18 = 0;
  char v6 = [v4 removeKnownNetworkProfile:v5 reason:2 error:&v18];
  id v7 = v18;

  id v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v6)
  {
    if (v11 && os_log_type_enabled(v8, v9))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v12;
      id v13 = "Removed network='%@'";
      __int16 v14 = v8;
      os_log_type_t v15 = v9;
      uint32_t v16 = 12;
LABEL_14:
      _os_log_impl(&dword_226071000, v14, v15, v13, buf, v16);
    }
  }
  else if (v11 && os_log_type_enabled(v8, v9))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v17;
    __int16 v21 = 2112;
    id v22 = v7;
    id v13 = "Failed to remove network='%@' error='%@'";
    __int16 v14 = v8;
    os_log_type_t v15 = v9;
    uint32_t v16 = 22;
    goto LABEL_14;
  }
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_380(id *a1, uint64_t a2)
{
  id v4 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  uint64_t v6 = [WeakRetained privateAddressMode];

  if (v6 != a2)
  {
    objc_copyWeak(&to, a1 + 6);
    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 network];

    os_log_type_t v9 = [v8 randomMACAddress];
    if (v9)
    {
      id v33 = [v8 randomMACAddress];
    }
    else
    {
      id v10 = objc_loadWeakRetained(v4);
      int v11 = [v10 profile];
      id v33 = [v11 randomMACAddress];
    }
    if (v6 == 1)
    {
      uint64_t v12 = WFLogForCategory(0);
      os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v12 && os_log_type_enabled(v12, v13))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v12, v13, "Generating new private mac when switched out of off mode", buf, 2u);
      }

      id v14 = objc_loadWeakRetained(&to);
      os_log_type_t v15 = [v14 wifiClient];
      uint32_t v16 = [v8 ssid];
      uint64_t v17 = [v15 newRandomMACAddressForSSID:v16];

      id v33 = (void *)v17;
    }
    id v18 = objc_loadWeakRetained(&to);
    int v19 = [v18 wifiClient];
    uint64_t v20 = [v8 ssid];
    [v19 setRandomAddressModeForNetwork:v20 mode:a2 randomMAC:v33];

    id v21 = objc_loadWeakRetained(v4);
    if ([v21 isCurrent])
    {
    }
    else
    {
      id v22 = objc_loadWeakRetained(&to);
      uint64_t v23 = [v22 interface];
      int v24 = [v23 currentNetwork];
      os_log_type_t v25 = [v24 ssid];
      id v26 = [a1[4] ssid];
      int v27 = [v25 isEqualToString:v26];

      if (!v27)
      {
LABEL_28:

        objc_destroyWeak(&to);
        return;
      }
    }
    if (a2 == 3 && v6 == 2 || a2 == 2 && v6 == 3)
    {
      id v28 = WFLogForCategory(0);
      os_log_type_t v29 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v28 && os_log_type_enabled(v28, v29))
      {
        *(_WORD *)id v35 = 0;
        _os_log_impl(&dword_226071000, v28, v29, "Do not disassociate for current network when transit between static and rotating", v35, 2u);
      }
    }
    else
    {
      id v30 = WFLogForCategory(0);
      os_log_type_t v31 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v30 && os_log_type_enabled(v30, v31))
      {
        *(_WORD *)id v34 = 0;
        _os_log_impl(&dword_226071000, v30, v31, "Disassociate for current network when private addres mode changes", v34, 2u);
      }

      id v28 = objc_loadWeakRetained(&to);
      id v32 = [v28 interface];
      [v32 disassociateFromCurrentNetwork];
    }
    goto LABEL_28;
  }
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_381(id *a1, int a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  uint64_t v5 = [WeakRetained network];

  id v6 = a1[4];
  id v7 = v6;
  if (v6)
  {
    [v6 setAutoJoinDisabled:a2 ^ 1u];
    id v8 = objc_loadWeakRetained(a1 + 6);
    os_log_type_t v9 = [v8 wifiClient];
    id v10 = [v9 cInterface];
    id v21 = 0;
    char v11 = [v10 updateKnownNetworkProfile:v7 properties:0 error:&v21];
    uint64_t v12 = v21;

    os_log_type_t v13 = WFLogForCategory(0);
    if (v11)
    {
      os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v13) {
        goto LABEL_16;
      }
      os_log_type_t v15 = v13;
      if (os_log_type_enabled(v15, v14))
      {
        uint32_t v16 = [v5 ssid];
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v16;
        __int16 v24 = 1024;
        LODWORD(v25) = a2;
        _os_log_impl(&dword_226071000, v15, v14, "Auto join changed for '%@' set to '%d'", buf, 0x12u);
      }
    }
    else
    {
      os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v13) {
        goto LABEL_16;
      }
      int v19 = v13;
      if (os_log_type_enabled(v19, v18))
      {
        uint64_t v20 = [v5 ssid];
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v20;
        __int16 v24 = 2112;
        os_log_type_t v25 = v12;
        _os_log_impl(&dword_226071000, v19, v18, "failed saving auto join state for '%@' error='%@'", buf, 0x16u);
      }
    }

LABEL_16:
    goto LABEL_17;
  }
  uint64_t v12 = WFLogForCategory(0);
  os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v17))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    __int16 v24 = 2112;
    os_log_type_t v25 = v5;
    _os_log_impl(&dword_226071000, v12, v17, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
  }
LABEL_17:
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_382(id *a1, int a2)
{
  v29[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  uint64_t v5 = [WeakRetained network];

  id v6 = a1[4];
  if (v6)
  {
    if (a2) {
      uint64_t v7 = MEMORY[0x263EFFA80];
    }
    else {
      uint64_t v7 = MEMORY[0x263EFFA88];
    }
    uint64_t v28 = *MEMORY[0x263F55DE0];
    v29[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    [v6 setCaptiveProfile:v8];
    id v9 = objc_loadWeakRetained(a1 + 6);
    id v10 = [v9 wifiClient];
    char v11 = [v10 cInterface];
    id v25 = 0;
    char v12 = [v11 updateKnownNetworkProfile:v6 properties:0 error:&v25];
    id v13 = v25;

    os_log_type_t v14 = WFLogForCategory(0);
    if (v12)
    {
      os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v14) {
        goto LABEL_20;
      }
      uint32_t v16 = v14;
      if (!os_log_type_enabled(v16, v15))
      {
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      os_log_type_t v17 = [v5 ssid];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)int v27 = a2;
      *(_WORD *)&void v27[4] = 2112;
      *(void *)&v27[6] = v17;
      os_log_type_t v18 = "Set auto login='%d' for '%@'";
      int v19 = v16;
      os_log_type_t v20 = v15;
      uint32_t v21 = 18;
    }
    else
    {
      os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v14) {
        goto LABEL_20;
      }
      __int16 v24 = v14;
      if (!os_log_type_enabled(v24, v23)) {
        goto LABEL_19;
      }
      os_log_type_t v17 = [v5 ssid];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)int v27 = a2;
      *(_WORD *)&void v27[4] = 2112;
      *(void *)&v27[6] = v17;
      *(_WORD *)&v27[14] = 2112;
      *(void *)&v27[16] = v13;
      os_log_type_t v18 = "failed setting auto login='%d' for '%@' error='%@'";
      int v19 = v24;
      os_log_type_t v20 = v23;
      uint32_t v21 = 28;
    }
    _os_log_impl(&dword_226071000, v19, v20, v18, buf, v21);

    goto LABEL_19;
  }
  id v8 = WFLogForCategory(0);
  os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v22))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)int v27 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    *(_WORD *)&v27[8] = 2112;
    *(void *)&v27[10] = v5;
    _os_log_impl(&dword_226071000, v8, v22, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
  }
LABEL_21:
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_383(id *a1, int a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  uint64_t v5 = [WeakRetained network];

  id v6 = a1[4];
  uint64_t v7 = v6;
  if (v6)
  {
    if (a2) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    [v6 setLowDataMode:v8];
    id v9 = objc_loadWeakRetained(a1 + 6);
    id v10 = [v9 wifiClient];
    char v11 = [v10 cInterface];
    id v22 = 0;
    char v12 = [v11 updateKnownNetworkProfile:v7 properties:0 error:&v22];
    id v13 = v22;

    os_log_type_t v14 = WFLogForCategory(0);
    if (v12)
    {
      os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v14) {
        goto LABEL_19;
      }
      uint32_t v16 = v14;
      if (os_log_type_enabled(v16, v15))
      {
        os_log_type_t v17 = [v5 ssid];
        *(_DWORD *)buf = 138412546;
        __int16 v24 = v17;
        __int16 v25 = 1024;
        LODWORD(v26) = a2;
        _os_log_impl(&dword_226071000, v16, v15, "Low data mode changed for '%@' set to '%d'", buf, 0x12u);
      }
    }
    else
    {
      os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v14) {
        goto LABEL_19;
      }
      os_log_type_t v20 = v14;
      if (os_log_type_enabled(v20, v19))
      {
        uint32_t v21 = [v5 ssid];
        *(_DWORD *)buf = 138412546;
        __int16 v24 = v21;
        __int16 v25 = 2112;
        uint64_t v26 = v13;
        _os_log_impl(&dword_226071000, v20, v19, "failed saving low data mode state for '%@' error='%@'", buf, 0x16u);
      }
    }

LABEL_19:
    goto LABEL_20;
  }
  id v13 = WFLogForCategory(0);
  os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v18))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v24 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    _os_log_impl(&dword_226071000, v13, v18, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
  }
LABEL_20:
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_384(id *a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  uint64_t v5 = [WeakRetained network];

  id v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)uint64_t v28 = a2;
    _os_log_impl(&dword_226071000, v6, v7, "Setting privacy proxy %d", buf, 8u);
  }

  id v8 = a1[4];
  id v9 = v8;
  if (v8)
  {
    [v8 setPrivacyProxyEnabled:a2];
    id v10 = objc_loadWeakRetained(a1 + 6);
    char v11 = [v10 wifiClient];
    char v12 = [v11 cInterface];
    id v26 = 0;
    char v13 = [v12 updateKnownNetworkProfile:v9 properties:0 error:&v26];
    os_log_type_t v14 = v26;

    os_log_type_t v15 = WFLogForCategory(0);
    if (v13)
    {
      os_log_type_t v16 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v15)
      {
        os_log_type_t v17 = v15;
        if (os_log_type_enabled(v17, v16))
        {
          os_log_type_t v18 = [v5 ssid];
          *(_DWORD *)buf = 138412546;
          *(void *)uint64_t v28 = v18;
          *(_WORD *)&v28[8] = 1024;
          *(_DWORD *)&v28[10] = a2;
          _os_log_impl(&dword_226071000, v17, v16, "Privacy proxy changed for '%@' set to '%d'", buf, 0x12u);
        }
      }
    }
    else
    {
      os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v20))
      {
        *(_DWORD *)buf = 67240706;
        *(_DWORD *)uint64_t v28 = a2;
        *(_WORD *)&void v28[4] = 2112;
        *(void *)&v28[6] = v5;
        *(_WORD *)&v28[14] = 2112;
        *(void *)&v28[16] = v14;
        _os_log_impl(&dword_226071000, v15, v20, "Failed to set privacy proxy to=%{public}d for network='%@' error='%@'", buf, 0x1Cu);
      }
    }
  }
  else
  {
    os_log_type_t v14 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v19))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)uint64_t v28 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellTy"
                       "pe:]_block_invoke";
      *(_WORD *)&v28[8] = 2112;
      *(void *)&v28[10] = v5;
      _os_log_impl(&dword_226071000, v14, v19, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
    }
  }

  uint32_t v21 = (void *)MEMORY[0x263F58270];
  id v22 = [v5 ssid];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_386;
  v24[3] = &unk_26478ECA8;
  id v25 = v5;
  id v23 = v5;
  [v21 reportWiFiNetworkStatus:a2 networkName:v22 queue:MEMORY[0x263EF83A0] completionHandler:v24];
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_386(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    id v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      os_log_type_t v7 = [*(id *)(a1 + 32) ssid];
      int v8 = 136315650;
      id v9 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
      __int16 v10 = 2112;
      char v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_226071000, v6, v5, "%s: reporting privacy proxy status for '%@' - error %@", (uint8_t *)&v8, 0x20u);
    }
  }
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_388(id *a1, void *a2, double a3)
{
  v34[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  os_log_type_t v7 = [WeakRetained network];

  id v8 = a1[4];
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x263F55EB8];
    v33[0] = *MEMORY[0x263F55EB0];
    v33[1] = v9;
    v34[0] = v5;
    __int16 v10 = [NSNumber numberWithDouble:a3];
    v34[1] = v10;
    char v11 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

    id v12 = objc_loadWeakRetained(a1 + 6);
    id v13 = [v12 wifiClient];
    uint64_t v14 = [v13 cInterface];
    id v28 = 0;
    char v15 = [v14 updateKnownNetworkProfile:v8 OSSpecificAttributes:v11 error:&v28];
    id v16 = v28;

    os_log_type_t v17 = WFLogForCategory(0);
    if (v15)
    {
      os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v17) {
        goto LABEL_17;
      }
      os_log_type_t v19 = v17;
      if (!os_log_type_enabled(v19, v18))
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      os_log_type_t v20 = [v7 ssid];
      *(_DWORD *)buf = 138412290;
      id v30 = v20;
      uint32_t v21 = "Set network responsiveness for '%@'";
      id v22 = v19;
      os_log_type_t v23 = v18;
      uint32_t v24 = 12;
    }
    else
    {
      os_log_type_t v26 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v17) {
        goto LABEL_17;
      }
      uint64_t v27 = v17;
      if (!os_log_type_enabled(v27, v26)) {
        goto LABEL_16;
      }
      os_log_type_t v20 = [v7 ssid];
      *(_DWORD *)buf = 138412546;
      id v30 = v20;
      __int16 v31 = 2112;
      id v32 = v16;
      uint32_t v21 = "failed setting network responsiveness for '%@' error='%@'";
      id v22 = v27;
      os_log_type_t v23 = v26;
      uint32_t v24 = 22;
    }
    _os_log_impl(&dword_226071000, v22, v23, v21, buf, v24);

    goto LABEL_16;
  }
  char v11 = WFLogForCategory(0);
  os_log_type_t v25 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v25))
  {
    *(_DWORD *)buf = 136315394;
    id v30 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_226071000, v11, v25, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
  }
LABEL_18:
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_390(id *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a1[4];
  if (!v4)
  {
    id v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      os_log_type_t v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        id WeakRetained = objc_loadWeakRetained(a1 + 6);
        uint64_t v9 = [WeakRetained network];
        __int16 v10 = [v9 ssid];
        *(_DWORD *)buf = 138412290;
        os_log_type_t v25 = v10;
        _os_log_impl(&dword_226071000, v7, v6, "Trying to set wifi mode for empty profile for network: %@", buf, 0xCu);
      }
    }
  }
  [v4 setDisable6EMode:a2];
  id v11 = objc_loadWeakRetained(a1 + 7);
  id v12 = [v11 wifiClient];
  id v13 = [v12 cInterface];
  uint64_t v14 = [MEMORY[0x263EFFA08] setWithObject:&unk_26D9E1B58];
  id v23 = 0;
  char v15 = [v13 updateKnownNetworkProfile:v4 properties:v14 error:&v23];
  id v16 = v23;

  os_log_type_t v17 = WFLogForCategory(0);
  if (v15)
  {
    os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v17)
    {
      os_log_type_t v19 = v17;
      if (os_log_type_enabled(v19, v18))
      {
        os_log_type_t v20 = [a1[5] ssid];
        *(_DWORD *)buf = 138412546;
        os_log_type_t v25 = v20;
        __int16 v26 = 2048;
        id v27 = a2;
        _os_log_impl(&dword_226071000, v19, v18, "disable 6e mode changed for '%@' set to '%ld'", buf, 0x16u);
      }
    }
  }
  else
  {
    os_log_type_t v21 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v21))
    {
      id v22 = a1[5];
      *(_DWORD *)buf = 134218498;
      os_log_type_t v25 = a2;
      __int16 v26 = 2112;
      id v27 = v22;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_226071000, v17, v21, "Failed to set disable 6e mode to=%ld for network='%@' error='%@'", buf, 0x20u);
    }
  }
}

- (BOOL)networkListViewControllerWAPIEnabled:(id)a3
{
  id v3 = [(WFNetworkListController *)self wifiClient];
  char v4 = [v3 isWAPIEnabled];

  return v4;
}

- (void)networkListViewController:(id)a3 setWAPIEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_type_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_226071000, v6, v7, "User changed WAPI enabled %d", (uint8_t *)v9, 8u);
  }

  id v8 = [(WFNetworkListController *)self wifiClient];
  [v8 setWAPIEnabled:v4];
}

- (BOOL)networkListViewControllerNetworkRestrictionActive:(id)a3
{
  id v3 = [(WFNetworkListController *)self wifiClient];
  char v4 = [v3 isNetworkRestrictionActive];

  return v4;
}

- (BOOL)networkListViewControllerLockdownModeActive:(id)a3
{
  return self->_lockdownModeEnabled;
}

- (void)setShouldShowDetailTapOnCurrentNetwork:(BOOL)a3
{
  self->_shouldShowDetailTapOnCurrentNetwork = a3;
}

- (BOOL)networkListViewControllerPowerModificationDisabled:(id)a3
{
  id v3 = [(WFNetworkListController *)self wifiClient];
  char v4 = [v3 isPowerModificationDisabled];

  return v4;
}

- (id)airportSettingsViewController:(id)a3 unconfiguredAccessoriesGroupHeaderTitle:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v20 = v5;
    id v7 = objc_alloc_init(MEMORY[0x263F08760]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v13 isUnconfiguredAccessory])
          {
            uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "unconfiguredAccessoryType"));
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      if (![v7 countForObject:&unk_26D9E1B70]
        || [v7 countForObject:&unk_26D9E1B88]
        || [v7 countForObject:&unk_26D9E1BA0]
        || [v7 countForObject:&unk_26D9E1BB8])
      {
        id v5 = v20;
        if ([v7 countForObject:&unk_26D9E1B70]
          && [v7 countForObject:&unk_26D9E1B88]
          && ![v7 countForObject:&unk_26D9E1BA0]
          && ![v7 countForObject:&unk_26D9E1BB8])
        {
          char v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v16 = v15;
          os_log_type_t v17 = @"kWFUnconfiguredAirportAndAirPlaySectionTitle";
        }
        else if ([v7 countForObject:&unk_26D9E1B70] {
               || ![v7 countForObject:&unk_26D9E1B88]
        }
               || [v7 countForObject:&unk_26D9E1BA0]
               || [v7 countForObject:&unk_26D9E1BB8])
        {
          char v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v16 = v15;
          os_log_type_t v17 = @"kWFUnconfiguredDevicesSectionTitle";
        }
        else
        {
          char v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v16 = v15;
          os_log_type_t v17 = @"kWFUnconfiguredAirPlaySectionTitle";
        }
        os_log_type_t v18 = [v15 localizedStringForKey:v17 value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      }
      else
      {
        id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        os_log_type_t v18 = [v16 localizedStringForKey:@"kWFUnconfiguredAirportSectionTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        id v5 = v20;
      }
    }
    else
    {
      os_log_type_t v18 = 0;
      id v5 = v20;
    }
  }
  else
  {
    id v7 = 0;
    os_log_type_t v18 = 0;
  }

  return v18;
}

- (int64_t)networkListViewControllerAutoInstantHotspotOption:(id)a3
{
  id v3 = [(WFNetworkListController *)self wifiClient];
  int64_t v4 = [v3 autoInstantHotspotJoinOption];

  return v4;
}

- (void)networkListViewController:(id)a3 setAutoInstantOption:(int64_t)a4
{
  id v5 = [(WFNetworkListController *)self wifiClient];
  [v5 setAutoInstantHotspotJoinOption:a4];
}

- (BOOL)networkListViewControllerIsManagedAppleID:(id)a3
{
  id v3 = [(WFNetworkListController *)self wifiClient];
  char v4 = [v3 isManagedAppleID];

  return v4;
}

- (BOOL)networkListViewControllerIsAutoUnlockEnabled:(id)a3
{
  return objc_msgSend(MEMORY[0x263F6C1E8], "autoUnlockEnabled", a3);
}

- (int64_t)airportSettingsViewControllerAskToJoinMode:(id)a3
{
  char v4 = [(WFNetworkListController *)self wifiClient];
  char v5 = [v4 isNetworkRestrictionActive];

  if (v5) {
    return -1;
  }
  id v7 = [(WFNetworkListController *)self wifiClient];
  int64_t v8 = [v7 askToJoinMode];

  return v8;
}

- (void)airportSettingsViewController:(id)a3 setAskToJoinMode:(int64_t)a4
{
  id v6 = +[WFMetricsManager sharedManager];
  id v7 = +[WFUserEvent eventWithType:2 stateEnum:a4];
  [v6 processEvent:v7];

  id v8 = [(WFNetworkListController *)self wifiClient];
  [v8 setAskToJoinMode:a4];
}

- (BOOL)airportSettingsViewControllerShouldShowDiagnosticsMode:(id)a3
{
  id v3 = [(WFNetworkListController *)self wifiClient];
  char v4 = [v3 isDiagnosticsModeEnabled];

  return v4;
}

- (BOOL)airportSettingsViewControllerShouldShowNANUI:(id)a3
{
  id v3 = [(WFNetworkListController *)self wifiClient];
  if ([v3 isNANUIEnabled]) {
    char v4 = MGGetBoolAnswer();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)airportSettingsViewControllerShouldShowKnownNetworks:(id)a3
{
  id v3 = [(WFNetworkListController *)self wifiClient];
  char v4 = [v3 isKnownNetworkUIEnabled];

  return v4;
}

- (void)airportSettingsViewControllerDidTapDiagnosticsMode:(id)a3 showNANUI:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_226071000, v7, v8, "User tapped diagnostic cell", (uint8_t *)buf, 2u);
  }

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F86398]) initWithNANUI:v4];
  objc_initWeak(buf, self);
  objc_initWeak(&location, v9);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__WFNetworkListController_airportSettingsViewControllerDidTapDiagnosticsMode_showNANUI___block_invoke;
  v11[3] = &unk_26478ED20;
  objc_copyWeak(&v12, buf);
  objc_copyWeak(&v13, &location);
  [v9 setSaveHandler:v11];
  uint64_t v10 = [(WFNetworkListing *)self->_viewController navigationController];
  [v10 pushViewController:v9 animated:1];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  objc_destroyWeak(buf);
}

void __88__WFNetworkListController_airportSettingsViewControllerDidTapDiagnosticsMode_showNANUI___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _saveLogsWithComment:v4 diagnosticsViewController:v5];
}

- (BOOL)airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:(id)a3
{
  id v4 = [(WFNetworkListController *)self healthRecommendations];
  id v5 = [MEMORY[0x263F863A8] issueWithType:1];
  if ([v4 containsObject:v5])
  {
    char v6 = 0;
  }
  else
  {
    id v7 = [(WFNetworkListController *)self healthRecommendations];
    os_log_type_t v8 = [MEMORY[0x263F863A8] issueWithType:0x8000];
    char v9 = [v7 containsObject:v8];

    char v6 = v9 ^ 1;
  }

  uint64_t v10 = [(WFNetworkListController *)self interface];
  uint64_t v11 = [v10 currentNetwork];
  LOBYTE(v12) = 0;
  if (v11 && (v6 & 1) == 0)
  {
    id v13 = [(WFNetworkListController *)self interface];
    uint64_t v14 = [v13 currentNetwork];
    if ([v14 supportsWiFiHealth])
    {
      char v15 = [(WFNetworkListController *)self wifiClient];
      int v12 = [v15 isWiFiHealthUIDisabled] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (void)airportSettingsViewControllerDidTapDataUsage:(id)a3
{
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_226071000, v4, v5, "User tapped data usage cell", v6, 2u);
  }

  [(WFNetworkListController *)self pushDataUsageViewController];
}

- (id)editableKnownNetworks
{
  uint64_t v2 = [(WFNetworkListController *)self knownNetworksManager];
  id v3 = [v2 allEditableNetworkProfiles];

  return v3;
}

- (id)managedKnownNetworks
{
  uint64_t v2 = [(WFNetworkListController *)self knownNetworksManager];
  id v3 = [v2 allNonEditableNetworkProfiles];

  return v3;
}

- (BOOL)removeKnownNetworks:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [*(id *)(*((void *)&v24 + 1) + 8 * v8) ssid];
        uint64_t v10 = [(WFNetworkListController *)self interface];
        uint64_t v11 = [v10 currentNetwork];
        int v12 = [v11 ssid];
        char v13 = [v9 isEqualToString:v12];

        if (v13)
        {
          int v14 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v14 = 0;
LABEL_11:

  char v15 = [(WFNetworkListController *)self knownNetworksManager];
  char v16 = [v15 removeNetworks:v4];

  os_log_type_t v17 = +[WFMetricsManager sharedManager];
  os_log_type_t v18 = +[WFUserEvent eventWithType:stateEnum:](WFUserEvent, "eventWithType:stateEnum:", 11, [v4 count]);
  [v17 processEvent:v18];

  if (v14)
  {
    os_log_type_t v19 = [(WFNetworkListController *)self interface];
    [v19 disassociateFromCurrentNetwork];

    id v20 = WFLogForCategory(0);
    os_log_type_t v21 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v20 && os_log_type_enabled(v20, v21))
    {
      *(_WORD *)long long v23 = 0;
      _os_log_impl(&dword_226071000, v20, v21, "Disconnect from current network because user deleted it from known networks list", v23, 2u);
    }
  }
  return v16;
}

- (id)passwordToDisplayForSSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [WFKnownNetworksManager alloc];
  uint64_t v6 = [(WFNetworkListController *)self wifiClient];
  uint64_t v7 = [v6 cInterface];
  uint64_t v8 = [(WFKnownNetworksManager *)v5 initWithInterface:v7];

  char v9 = [(WFKnownNetworksManager *)v8 passwordForNetworksWithSSID:v4];

  return v9;
}

- (void)airportSettingsViewControllerDidStartEditingKnownNetworks:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[WFNetworkListController airportSettingsViewControllerDidStartEditingKnownNetworks:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s airportVC='%@'", (uint8_t *)&v9, 0x16u);
  }

  [(WFNetworkListController *)self _pauseScanning];
  uint64_t v7 = +[WFMetricsManager sharedManager];
  uint64_t v8 = +[WFUserEvent eventWithType:10];
  [v7 processEvent:v8];
}

- (void)airportSettingsViewControllerDidFinishEditingKnownNetworks:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WFNetworkListController airportSettingsViewControllerDidFinishEditingKnownNetworks:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s airportVC='%@'", (uint8_t *)&v7, 0x16u);
  }

  [(WFNetworkListController *)self _resumeScanning];
}

- (void)pushDataUsageViewController
{
  id v6 = objc_alloc_init(MEMORY[0x263F67F28]);
  id v3 = [v6 specifier];
  [v3 setProperty:@"com.apple.wifi" forKey:*MEMORY[0x263F60138]];

  id v4 = [(WFNetworkListController *)self viewController];
  uint64_t v5 = [v4 navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)_saveLogsWithComment:(id)a3 diagnosticsViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setSaving:1];
  uint64_t v8 = [[WFSaveLogsOperation alloc] initWithComments:v6];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke;
  v23[3] = &unk_26478E528;
  id v9 = v7;
  id v24 = v9;
  [(WFSaveLogsOperation *)v8 setCompletionBlock:v23];
  objc_initWeak(&location, v8);
  objc_initWeak(&from, self);
  id v10 = (void *)MEMORY[0x263F086D0];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  char v16 = __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_3;
  os_log_type_t v17 = &unk_26478ED70;
  objc_copyWeak(&v19, &location);
  os_log_type_t v18 = self;
  objc_copyWeak(&v20, &from);
  uint64_t v11 = [v10 blockOperationWithBlock:&v14];
  objc_msgSend(v11, "addDependency:", v8, v14, v15, v16, v17, v18);
  id v12 = [MEMORY[0x263F08A48] mainQueue];
  [v12 addOperation:v11];

  uint64_t v13 = [(WFNetworkListController *)self backgroundQueue];
  [v13 addOperation:v8];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_2;
  block[3] = &unk_26478E528;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSaving:0];
}

void __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = [WeakRetained error];
  BOOL v24 = v3 == 0;

  id v4 = [a1[4] viewController];
  [v4 deviceCapability];
  int IsChinaDevice = WFCapabilityIsChinaDevice();

  id v6 = (void *)MEMORY[0x263F1C3F8];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (v3)
  {
    id v9 = [v7 localizedStringForKey:@"kWFLocDiagnosticsAlertFailureTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = v10;
    id v12 = @"kWFLocDiagnosticsAlertFailureMessage";
    uint64_t v13 = @"kWFLocDiagnosticsAlertFailureMessage_CH";
  }
  else
  {
    id v9 = [v7 localizedStringForKey:@"kWFLocDiagnosticsAlertSuccessTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = v10;
    id v12 = @"kWFLocDiagnosticsAlertSuccessMessage";
    uint64_t v13 = @"kWFLocDiagnosticsAlertSuccessMessage_CH";
  }
  if (IsChinaDevice) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v12;
  }
  uint64_t v15 = [v10 localizedStringForKey:v14 value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  char v16 = [v6 alertControllerWithTitle:v9 message:v15 preferredStyle:1];

  os_log_type_t v17 = (void *)MEMORY[0x263F1C3F0];
  os_log_type_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = [v18 localizedStringForKey:@"kWFLocDiagnosticsAlertOkTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  void v25[2] = __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_4;
  v25[3] = &unk_26478ED48;
  id v20 = a1 + 6;
  objc_copyWeak(&v26, a1 + 6);
  BOOL v27 = v24;
  os_log_type_t v21 = [v17 actionWithTitle:v19 style:0 handler:v25];

  [v16 addAction:v21];
  id v22 = objc_loadWeakRetained(v20);
  long long v23 = [v22 viewController];
  [v23 presentViewController:v16 animated:1 completion:0];

  objc_destroyWeak(&v26);
}

void __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    id v10 = WeakRetained;
    id v3 = [WeakRetained viewController];
    id v4 = [v3 navigationController];
    uint64_t v5 = [v4 visibleViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id WeakRetained = v10;
    if (isKindOfClass)
    {
      id v7 = [v10 viewController];
      uint64_t v8 = [v7 navigationController];
      id v9 = (id)[v8 popViewControllerAnimated:1];

      id WeakRetained = v10;
    }
  }
}

- (void)_networkDidChangeNotification:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"WFInterfaceNetworkKey"];

  id v7 = [v4 userInfo];
  uint64_t v8 = [v7 objectForKey:@"WFInterfacePreviousNetworkKey"];

  id v9 = [v4 userInfo];

  id v10 = [v9 objectForKey:@"WFInterfaceNetworkChangeReason"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  id v12 = WFLogForCategory(0);
  os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v12 && os_log_type_enabled(v12, v13))
  {
    int v38 = 136315906;
    *(void *)id v39 = "-[WFNetworkListController _networkDidChangeNotification:]";
    *(_WORD *)&v39[8] = 2048;
    *(void *)&v39[10] = v11;
    __int16 v40 = 2112;
    __int16 v41 = v6;
    __int16 v42 = 2112;
    os_log_type_t v43 = v8;
    _os_log_impl(&dword_226071000, v12, v13, "%s: reason %lu network %@ previous %@", (uint8_t *)&v38, 0x2Au);
  }

  if (v11 == 1)
  {
    uint64_t v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      int v38 = 136315138;
      *(void *)id v39 = "-[WFNetworkListController _networkDidChangeNotification:]";
      _os_log_impl(&dword_226071000, v14, v15, "%s: network changed due to captive network detection", (uint8_t *)&v38, 0xCu);
    }
  }
  char v16 = [(WFNetworkListController *)self detailsContext];

  if (v16)
  {
    os_log_type_t v17 = [(WFNetworkListController *)self detailsContext];
    os_log_type_t v18 = [v17 network];
    uint64_t v19 = [v18 isEquivalentRecord:v6];

    id v20 = [(WFNetworkListController *)self detailsContext];
    [v20 setCurrent:v19];

    os_log_type_t v21 = WFLogForCategory(0);
    os_log_type_t v22 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v21 && os_log_type_enabled(v21, v22))
    {
      int v38 = 67109120;
      *(_DWORD *)id v39 = v19;
      _os_log_impl(&dword_226071000, v21, v22, "updating details context currentNetwork %d", (uint8_t *)&v38, 8u);
    }

    if (v19)
    {
      long long v23 = [(WFNetworkListController *)self _sortedHealthRecommendations];
    }
    else
    {
      long long v23 = 0;
    }
    BOOL v24 = [(WFNetworkListController *)self detailsContext];
    [v24 setRecommendations:v23];

    if (v19) {
  }
    }
  long long v25 = WFLogForCategory(0);
  os_log_type_t v26 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v25 && os_log_type_enabled(v25, v26))
  {
    int v38 = 138412290;
    *(void *)id v39 = v6;
    _os_log_impl(&dword_226071000, v25, v26, "network changed: %@", (uint8_t *)&v38, 0xCu);
  }

  BOOL v27 = WFLogForCategory(0);
  os_log_type_t v28 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v27)
  {
    uint64_t v29 = v27;
    if (os_log_type_enabled(v29, v28))
    {
      BOOL v30 = [(WFNetworkListController *)self isAssociating];
      __int16 v31 = [(WFNetworkListController *)self associationContext];
      id v32 = [v31 network];
      int v38 = 67109378;
      *(_DWORD *)id v39 = v30;
      *(_WORD *)&v39[4] = 2112;
      *(void *)&v39[6] = v32;
      _os_log_impl(&dword_226071000, v29, v28, "isAssociating: %d associating network %@", (uint8_t *)&v38, 0x12u);
    }
  }

  if ([(WFNetworkListController *)self isAssociating])
  {
    id v33 = WFLogForCategory(0);
    os_log_type_t v34 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v33 && os_log_type_enabled(v33, v34))
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_226071000, v33, v34, "networkChanged callback during association with nil network", (uint8_t *)&v38, 2u);
    }
LABEL_44:

    goto LABEL_45;
  }
  [(WFNetworkListController *)self _updateViewControllerConnectedNetwork:v6];
  if ([(WFNetworkListController *)self isHS20Supported])
  {
    if (v6)
    {
      if ([v6 isHotspot20])
      {
        id v35 = [v6 matchingKnownNetworkProfile];

        if (!v35)
        {
          id v36 = WFLogForCategory(0);
          os_log_type_t v37 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v36 && os_log_type_enabled(v36, v37))
          {
            int v38 = 136315138;
            *(void *)id v39 = "-[WFNetworkListController _networkDidChangeNotification:]";
            _os_log_impl(&dword_226071000, v36, v37, "%s: new network is HS20, resolving profile", (uint8_t *)&v38, 0xCu);
          }

          id v33 = [(WFNetworkListController *)self gasController];
          [v33 resolveProfileForNetwork:v6 handler:&__block_literal_global_449 force:1];
          goto LABEL_44;
        }
      }
    }
  }
LABEL_45:
}

void __57__WFNetworkListController__networkDidChangeNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = WFLogForCategory(5uLL);
  os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_226071000, v6, v7, "resolved profile %@ error %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_networkLinkQualityDidChangeNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"WFInterfaceLinkQualityKey"];

  if (v5)
  {
    [(WFNetworkListController *)self setLatestLinkQuality:v5];
    id v6 = [(WFNetworkListController *)self viewController];
    os_log_type_t v7 = [v6 currentNetwork];

    if (v7)
    {
      int v8 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
      {
        __int16 v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          [v5 scaledRssi];
          double v12 = v11;
          [v5 scaledRssi];
          int v24 = 136315650;
          long long v25 = "-[WFNetworkListController _networkLinkQualityDidChangeNotification:]";
          __int16 v26 = 2048;
          double v27 = v12;
          __int16 v28 = 2048;
          uint64_t v29 = WFSignalBarsFromScaledRSSI();
          _os_log_impl(&dword_226071000, v10, v9, "%s: linkQuality.scaledRssi %f bars %ld", (uint8_t *)&v24, 0x20u);
        }
      }
      os_log_type_t v13 = [(WFNetworkListController *)self viewController];
      char v14 = objc_opt_respondsToSelector();

      [v5 scaledRssi];
      int v16 = v15;
      if (v14)
      {
        uint64_t v17 = WFSignalBarsFromScaledRSSI();
        os_log_type_t v18 = [(WFNetworkListController *)self viewController];
        [v18 setCurrentNetworkSignalBars:v17];
      }
      else
      {
        os_log_type_t v18 = [(WFNetworkListController *)self viewController];
        LODWORD(v19) = v16;
        [v18 setCurrentNetworkScaledRSSI:v19];
      }
    }
    id v20 = [(WFNetworkListController *)self viewController];
    if ([v20 currentNetworkState] == 1)
    {
      os_log_type_t v21 = [(WFNetworkListController *)self interface];
      char v22 = [v21 ipv4SelfAssigned];

      if (v22)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v20 = [(WFNetworkListController *)self interface];
      long long v23 = [v20 currentNetwork];
      [(WFNetworkListController *)self _updateCurrentNetworkIPState:v23];
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)_interfaceDidBecomeAvailable:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [(WFNetworkListController *)self wifiClient];
  id v5 = [v4 interface];

  if (!v5)
  {
    float v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v11 || !os_log_type_enabled(v11, v12)) {
      goto LABEL_14;
    }
    int v14 = 136315138;
    int v15 = "-[WFNetworkListController _interfaceDidBecomeAvailable:]";
    os_log_type_t v13 = "%s: nil interface provided by WFClient";
    goto LABEL_13;
  }
  id v6 = [(WFNetworkListController *)self interface];

  if (!v6) {
    [(WFNetworkListController *)self _setupWithInterface:v5];
  }
  [(WFNetworkListController *)self setInterface:v5];
  [(WFNetworkListController *)self _updateViewControllerDisabled];
  [(WFNetworkListController *)self _updatePowerState];
  if ([(WFNetworkListController *)self isSetup])
  {
    os_log_type_t v7 = [(WFNetworkListController *)self viewController];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      os_log_type_t v9 = [(WFNetworkListController *)self viewController];
      char v10 = [v9 networkListVisible];

      if ((v10 & 1) == 0)
      {
        float v11 = WFLogForCategory(0);
        os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() < 3 || !v11 || !os_log_type_enabled(v11, v12)) {
          goto LABEL_14;
        }
        int v14 = 136315138;
        int v15 = "-[WFNetworkListController _interfaceDidBecomeAvailable:]";
        os_log_type_t v13 = "%s: Skipping scanning for setup until wifi page is visible";
LABEL_13:
        _os_log_impl(&dword_226071000, v11, v12, v13, (uint8_t *)&v14, 0xCu);
LABEL_14:

        goto LABEL_8;
      }
    }
  }
  [(WFNetworkListController *)self startScanning];
LABEL_8:
}

- (void)_clientRestartedNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    id v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      int v7 = 136315394;
      char v8 = "-[WFNetworkListController _clientRestartedNotification:]";
      __int16 v9 = 2048;
      unint64_t v10 = [(WFNetworkListController *)self powerState];
      _os_log_impl(&dword_226071000, v6, v5, "%s: power state %lu", (uint8_t *)&v7, 0x16u);
    }
  }
  [(WFNetworkListController *)self _updatePowerState];
}

- (void)_wifiPropertyDidChanged:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v26 = a3;
  id obj = [v26 userInfo];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v28;
    *(void *)&long long v5 = 134217984;
    long long v24 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        __int16 v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", @"kWFClientUserInterfacePropertyATJKey", v24))
        {
          unint64_t v10 = [v26 userInfo];
          uint64_t v11 = [v10 objectForKey:@"kWFClientUserInterfacePropertyATJKey"];

          uint64_t v12 = [v11 integerValue];
          os_log_type_t v13 = [(WFNetworkListController *)self viewController];
          char v14 = objc_opt_respondsToSelector();

          if (v14)
          {
            int v15 = WFLogForCategory(0);
            os_log_type_t v16 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v15 && os_log_type_enabled(v15, v16))
            {
              *(_DWORD *)buf = v24;
              uint64_t v32 = v12;
              _os_log_impl(&dword_226071000, v15, v16, "setting ask to join mode to %ld", buf, 0xCu);
            }

            uint64_t v17 = [(WFNetworkListController *)self viewController];
            [v17 setAskToJoinMode:v12];
LABEL_20:
          }
        }
        else
        {
          if (![v9 isEqualToString:@"kWFClientUserInterfacePropertyHotspotAJKey"]) {
            continue;
          }
          os_log_type_t v18 = [v26 userInfo];
          uint64_t v11 = [v18 objectForKey:@"kWFClientUserInterfacePropertyHotspotAJKey"];

          uint64_t v19 = [v11 integerValue];
          id v20 = [(WFNetworkListController *)self viewController];
          char v21 = objc_opt_respondsToSelector();

          if (v21)
          {
            char v22 = WFLogForCategory(0);
            os_log_type_t v23 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v22 && os_log_type_enabled(v22, v23))
            {
              *(_DWORD *)buf = v24;
              uint64_t v32 = v19;
              _os_log_impl(&dword_226071000, v22, v23, "setting auto hotspot join option to %ld", buf, 0xCu);
            }

            uint64_t v17 = [(WFNetworkListController *)self viewController];
            [v17 setAutoInstantHotspotJoinOption:v19];
            goto LABEL_20;
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }
}

- (void)_preferredNetworksDidChange:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F386B8]];

  uint64_t v7 = [v4 userInfo];

  char v8 = [v7 objectForKey:*MEMORY[0x263F386B0]];
  uint64_t v9 = [v8 integerValue];

  if ([(WFNetworkListController *)self viewControllerSupportsCurrentNetworkSubtitle])
  {
    unint64_t v10 = [(WFNetworkListController *)self interface];
    uint64_t v11 = [v10 currentNetwork];

    if (v11)
    {
      if ([(WFNetworkListController *)self isAssociating]
        || (unint64_t)(v9 - 3) < 0xFFFFFFFFFFFFFFFELL)
      {
        char v14 = WFLogForCategory(0);
        os_log_type_t v21 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v21))
        {
          int v33 = 136315138;
          uint64_t v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
          _os_log_impl(&dword_226071000, v14, v21, "%s: preferred network change, do not update health subtitle while associating", (uint8_t *)&v33, 0xCu);
        }
      }
      else
      {
        uint64_t v12 = [(WFNetworkListController *)self interface];
        os_log_type_t v13 = [v12 currentNetwork];
        char v14 = [v13 ssid];

        int v15 = [v6 networkName];
        int v16 = [v15 isEqualToString:v14];

        uint64_t v17 = WFLogForCategory(0);
        os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
        BOOL v20 = (unint64_t)WFCurrentLogLevel() > 2 && v17 != 0;
        if (v16)
        {
          if (v20 && os_log_type_enabled(v17, v18))
          {
            int v33 = 136315138;
            uint64_t v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
            _os_log_impl(&dword_226071000, v17, v18, "%s: preferred network modified, updating health subtitle", (uint8_t *)&v33, 0xCu);
          }

          [(WFNetworkListController *)self _updateHealthSubtitle];
        }
        else
        {
          if (v20 && os_log_type_enabled(v17, v18))
          {
            int v33 = 136315138;
            uint64_t v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
            _os_log_impl(&dword_226071000, v17, v18, "%s: preferred network modified, will not update health subtitle ", (uint8_t *)&v33, 0xCu);
          }
        }
      }
    }
  }
  char v22 = [v6 accessoryIdentifier];

  if (v22) {
    BOOL v23 = v9 == 2;
  }
  else {
    BOOL v23 = 0;
  }
  if (v23)
  {
    long long v24 = [(WFNetworkListController *)self networks];
    long long v25 = [v6 networkName];
    id v26 = [v24 scanRecordWithSSID:v25];

    long long v27 = WFLogForCategory(0);
    os_log_type_t v28 = OSLogForWFLogLevel(3uLL);
    BOOL v30 = (unint64_t)WFCurrentLogLevel() > 2 && v27 != 0;
    if (v26)
    {
      if (v30)
      {
        __int16 v31 = v27;
        if (os_log_type_enabled(v31, v28))
        {
          uint64_t v32 = [v6 displayFriendlyName];
          int v33 = 136315650;
          uint64_t v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
          __int16 v35 = 2112;
          id v36 = v32;
          __int16 v37 = 2112;
          int v38 = v6;
          _os_log_impl(&dword_226071000, v31, v28, "%s found matching scan result, displayName='%@' profile='%@'", (uint8_t *)&v33, 0x20u);
        }
      }

      [v26 setMatchingKnownNetworkProfile:v6];
      long long v27 = [MEMORY[0x263EFFA08] setWithObject:v26];
      [(WFNetworkListController *)self _updateViewsForNetworks:v27];
    }
    else if (v30 && os_log_type_enabled(v27, v28))
    {
      int v33 = 136315394;
      uint64_t v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl(&dword_226071000, v27, v28, "%s updated network was an accessory but was not found in the scan results profile='%@'", (uint8_t *)&v33, 0x16u);
    }
  }
}

- (void)hotspotInterfaceDidUpdateNetworks:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(WFNetworkListController *)self scanForPersonalHotspots]
    && [(WFNetworkListController *)self canScanForPersonalHotspots])
  {
    [(WFNetworkListController *)self _updateViewControllerScanResults];
  }
  else
  {
    id v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
    {
      uint64_t v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        int v7 = 136315650;
        char v8 = "-[WFNetworkListController hotspotInterfaceDidUpdateNetworks:]";
        __int16 v9 = 1024;
        BOOL v10 = [(WFNetworkListController *)self scanForPersonalHotspots];
        __int16 v11 = 1024;
        BOOL v12 = [(WFNetworkListController *)self canScanForPersonalHotspots];
        _os_log_impl(&dword_226071000, v6, v5, "%s: hotspot scanning disabled (scan %d, canScan %d)", (uint8_t *)&v7, 0x18u);
      }
    }
    [(WFNetworkListController *)self _stopHotspotScan];
  }
}

- (BOOL)isAirPortSettings
{
  id v2 = [(WFNetworkListController *)self viewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isSetup
{
  id v2 = [(WFNetworkListController *)self viewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_useLegacySettingsUI
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"WiFiDisableNewSettingsUI", @"com.apple.settings.airport", &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat && AppBooleanValue == 0;
}

- (void)_updateViewControllerDisabled
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(WFNetworkListController *)self viewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    os_log_type_t v5 = [(WFNetworkListController *)self interface];

    uint64_t v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
    {
      char v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        __int16 v9 = [(WFNetworkListController *)self viewController];
        int v14 = 136315650;
        int v15 = "-[WFNetworkListController _updateViewControllerDisabled]";
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        __int16 v18 = 1024;
        BOOL v19 = v5 == 0;
        _os_log_impl(&dword_226071000, v8, v7, "%s: setting view controller %@ disabled %d", (uint8_t *)&v14, 0x1Cu);
      }
    }
    BOOL v10 = v5 == 0;

    __int16 v11 = [(WFNetworkListController *)self viewController];
    [v11 setDisabled:v10];
  }
  else
  {
    __int16 v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v11)
    {
      __int16 v11 = v11;
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = [(WFNetworkListController *)self viewController];
        int v14 = 136315394;
        int v15 = "-[WFNetworkListController _updateViewControllerDisabled]";
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_impl(&dword_226071000, v11, v12, "%s: view controller %@ doesn't support disabled state", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)_updateViewsForNetworks:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    os_log_type_t v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
    {
      int v9 = 136315138;
      BOOL v10 = "-[WFNetworkListController _updateViewsForNetworks:]";
      _os_log_impl(&dword_226071000, v7, v8, "%s: nil networks", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_4;
  }
  os_log_type_t v5 = [(WFNetworkListController *)self viewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    os_log_type_t v7 = [(WFNetworkListController *)self viewController];
    [v7 updateViewsForNetworks:v4];
LABEL_4:
  }
}

- (void)gasQueryController:(id)a3 didUpdateProfiles:(id)a4 networkNames:(id)a5
{
}

- (void)_updateHS20NetworksWithProfiles:(id)a3 names:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  int v15 = __65__WFNetworkListController__updateHS20NetworksWithProfiles_names___block_invoke;
  __int16 v16 = &unk_26478EDC0;
  uint64_t v17 = self;
  id v8 = v6;
  id v18 = v8;
  [v7 enumerateObjectsUsingBlock:&v13];
  int v9 = [(WFNetworkListController *)self viewController];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(WFNetworkListController *)self viewController];
    os_log_type_t v12 = [MEMORY[0x263EFFA08] setWithArray:v7];
    [v11 reloadCellsForNetworkNames:v12];
  }
}

void __65__WFNetworkListController__updateHS20NetworksWithProfiles_names___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) networks];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__WFNetworkListController__updateHS20NetworksWithProfiles_names___block_invoke_2;
  v8[3] = &unk_26478ED98;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a3;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __65__WFNetworkListController__updateHS20NetworksWithProfiles_names___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 ssid];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) objectAtIndex:*(void *)(a1 + 48)];
    id v6 = [v5 HS20Badge];
    [v7 setHotspot20Name:v6];
  }
}

- (void)_stateMonitorChangedStates:(int64_t)a3 oldState:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v10 = WFWiFiStateMonitorStringForState(a4);
      uint64_t v11 = WFWiFiStateMonitorStringForState(a3);
      int v21 = 136315650;
      char v22 = "-[WFNetworkListController _stateMonitorChangedStates:oldState:]";
      __int16 v23 = 2112;
      long long v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_226071000, v9, v8, "%s: %@ to %@", (uint8_t *)&v21, 0x20u);
    }
  }

  os_log_type_t v12 = [(WFNetworkListController *)self viewController];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v14 = [(WFNetworkListController *)self interface];
    int v15 = [v14 currentNetwork];
    if ([v15 carPlayType] == 1)
    {
    }
    else
    {
      __int16 v16 = [(WFNetworkListController *)self wifiClient];
      char v17 = [v16 isCellularOutrankingWiFi];

      if ((v17 & 1) == 0)
      {
        id v18 = [(WFNetworkListController *)self viewController];
        BOOL v19 = v18;
        BOOL v20 = a3 != 2;
        goto LABEL_12;
      }
    }
    id v18 = [(WFNetworkListController *)self viewController];
    BOOL v19 = v18;
    BOOL v20 = 1;
LABEL_12:
    [v18 setUserAutoJoinEnabled:v20];
  }
}

- (void)_dismissCredentialsViewControllerWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    id v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      os_log_type_t v8 = [v4 provider];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "Dismissing credentials view controller %@", (uint8_t *)&v9, 0xCu);
    }
  }

  [(WFNetworkListController *)self _dismissViewControllerForContext:v4];
  [(WFNetworkListController *)self setCredentialsContext:0];
}

- (void)_dismissTrustViewControllerWithContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "Dismissing trust view controller %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[WFNetworkListController _dismissTrustViewControllerWithContext:]";
    __int16 v11 = 2112;
    os_log_type_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_226071000, v7, v8, "%s: presentingVc %@ credentialsVc %@", (uint8_t *)&v9, 0x20u);
  }

  [(WFNetworkListController *)self _dismissViewControllerForContext:v4];
  [(WFNetworkListController *)self setCertificateContext:0];
}

- (void)_dismissDetailsViewControllerWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    id v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      os_log_type_t v8 = [v4 provider];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "Dismissing details view controller %@", (uint8_t *)&v9, 0xCu);
    }
  }

  [(WFNetworkListController *)self _dismissViewControllerForContext:v4];
  [(WFNetworkListController *)self setDetailsContext:0];
}

- (void)_dismissErrorViewControllerWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    id v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      os_log_type_t v8 = [v4 provider];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "Dismissing error view controller %@", (uint8_t *)&v9, 0xCu);
    }
  }

  [(WFNetworkListController *)self _dismissViewControllerForContext:v4];
}

- (void)_dismissLockdownModeViewControllerWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    id v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      os_log_type_t v8 = [v4 provider];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "Dismissing lockdown mode view controller %@", (uint8_t *)&v9, 0xCu);
    }
  }

  [(WFNetworkListController *)self _dismissViewControllerForContext:v4];
}

- (void)_dismissOtherNetworkViewControllerWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    id v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      os_log_type_t v8 = [v4 provider];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "Dismissing other network view controller %@", (uint8_t *)&v9, 0xCu);
    }
  }

  [(WFNetworkListController *)self _dismissViewControllerForContext:v4];
  [(WFNetworkListController *)self _resumeScanning];
  [(WFNetworkListController *)self setCredentialsContext:0];
}

- (void)_dismissViewControllerForContext:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFNetworkListController *)self viewProvider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
    {
      int v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        id v10 = [(WFNetworkListController *)self viewProvider];
        int v44 = 136315394;
        id v45 = "-[WFNetworkListController _dismissViewControllerForContext:]";
        __int16 v46 = 2112;
        uint64_t v47 = v10;
        _os_log_impl(&dword_226071000, v9, v8, "%s: provider (%@) handling dismissal", (uint8_t *)&v44, 0x16u);
      }
    }

    uint64_t v11 = [(WFNetworkListController *)self viewProvider];
    os_log_type_t v12 = [v4 provider];
    [v11 dismissNetworkViewController:v12 forContext:v4];
  }
  else
  {
    if (![v4 needsDismissal]) {
      goto LABEL_31;
    }
    __int16 v13 = [v4 provider];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      uint64_t v15 = [v4 provider];
      int v16 = [v15 wantsModalPresentation];

      if (v16)
      {
        char v17 = [v4 provider];
        char v18 = objc_opt_respondsToSelector();

        BOOL v19 = WFLogForCategory(0);
        os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
        BOOL v22 = (unint64_t)WFCurrentLogLevel() > 2 && v19 != 0;
        if (v18)
        {
          if (v22)
          {
            __int16 v23 = v19;
            if (os_log_type_enabled(v23, v20))
            {
              long long v24 = [v4 provider];
              int v44 = 138412290;
              id v45 = v24;
              _os_log_impl(&dword_226071000, v23, v20, "dismissing provider: %@", (uint8_t *)&v44, 0xCu);
            }
          }

          __int16 v25 = [v4 provider];
        }
        else
        {
          if (v22)
          {
            __int16 v42 = v19;
            if (os_log_type_enabled(v42, v20))
            {
              os_log_type_t v43 = [(WFNetworkListController *)self viewController];
              int v44 = 138412290;
              id v45 = v43;
              _os_log_impl(&dword_226071000, v42, v20, "dismissing view controller: %@", (uint8_t *)&v44, 0xCu);
            }
          }

          __int16 v25 = [(WFNetworkListController *)self viewController];
        }
        uint64_t v11 = v25;
        [v25 dismissViewControllerAnimated:1 completion:0];
        goto LABEL_30;
      }
    }
    id v26 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v26)
    {
      os_log_type_t v28 = v26;
      if (os_log_type_enabled(v28, v27))
      {
        long long v29 = [v4 provider];
        BOOL v30 = [(WFNetworkListController *)self viewController];
        __int16 v31 = [v30 navigationController];
        int v44 = 138412546;
        id v45 = v29;
        __int16 v46 = 2112;
        uint64_t v47 = v31;
        _os_log_impl(&dword_226071000, v28, v27, "dismissing non-modal: %@ (navigationController: %@)", (uint8_t *)&v44, 0x16u);
      }
    }

    uint64_t v11 = [(WFNetworkListController *)self viewController];
    os_log_type_t v12 = [v11 navigationController];
    id v32 = (id)[v12 popViewControllerAnimated:1];
  }

LABEL_30:
LABEL_31:
  int v33 = [(WFNetworkListController *)self viewProvider];
  char v34 = objc_opt_respondsToSelector();

  if (v34)
  {
    __int16 v35 = [(WFNetworkListController *)self viewProvider];
    id v36 = [v4 provider];
    [v35 didDismissNetworkViewController:v36 forContext:v4];
  }
  [(WFNetworkListController *)self setVisibleContext:0];
  __int16 v37 = [(WFNetworkListController *)self detailsContext];

  if (v37)
  {
    int v38 = WFLogForCategory(0);
    os_log_type_t v39 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v38)
    {
      __int16 v40 = v38;
      if (os_log_type_enabled(v40, v39))
      {
        __int16 v41 = [(WFNetworkListController *)self detailsContext];
        int v44 = 138412290;
        id v45 = v41;
        _os_log_impl(&dword_226071000, v40, v39, "clearing detailsContext='%@'", (uint8_t *)&v44, 0xCu);
      }
    }

    [(WFNetworkListController *)self setDetailsContext:0];
  }
}

- (void)_dismissVisibleContext
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(WFNetworkListController *)self visibleContext];

  if (v3)
  {
    id v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
    {
      char v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        id v7 = [(WFNetworkListController *)self visibleContext];
        int v9 = 136315394;
        id v10 = "-[WFNetworkListController _dismissVisibleContext]";
        __int16 v11 = 2112;
        os_log_type_t v12 = v7;
        _os_log_impl(&dword_226071000, v6, v5, "%s: dismissing context %@", (uint8_t *)&v9, 0x16u);
      }
    }

    os_log_type_t v8 = [(WFNetworkListController *)self visibleContext];
    [(WFNetworkListController *)self _dismissViewControllerForContext:v8];
  }
}

- (BOOL)handleURL:(id)a3
{
  *(void *)&v86[13] = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    id v84 = "-[WFNetworkListController handleURL:]";
    __int16 v85 = 2112;
    *(void *)uint64_t v86 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: handling URL %@", buf, 0x16u);
  }

  id v7 = [(WFNetworkListController *)self keyValueDictionaryForURL:v4];
  os_log_type_t v8 = v7;
  if (!v7)
  {
    int v61 = WFLogForCategory(0);
    os_log_type_t v62 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v61 || !os_log_type_enabled(v61, v62)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136315394;
    id v84 = "-[WFNetworkListController handleURL:]";
    __int16 v85 = 2112;
    *(void *)uint64_t v86 = v4;
    os_log_type_t v63 = "%s: missing path items (url %@)";
    goto LABEL_69;
  }
  int v9 = [v7 objectForKey:@"path"];
  if (!v9)
  {
    int v61 = WFLogForCategory(0);
    os_log_type_t v62 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v61 || !os_log_type_enabled(v61, v62)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136315394;
    id v84 = "-[WFNetworkListController handleURL:]";
    __int16 v85 = 2112;
    *(void *)uint64_t v86 = v4;
    os_log_type_t v63 = "%s: missing path param (url %@)";
LABEL_69:
    _os_log_impl(&dword_226071000, v61, v62, v63, buf, 0x16u);
LABEL_70:

    char v17 = 0;
    id v79 = 0;
    os_log_type_t v80 = 0;
    uint64_t v15 = 0;
    int v16 = 0;
    char v18 = 0;
    BOOL v19 = 0;
    os_log_type_t v20 = 0;
    int v21 = 0;
    id v10 = 0;
    BOOL v14 = 0;
    goto LABEL_46;
  }
  id v10 = v9;
  __int16 v11 = [v9 componentsSeparatedByString:@"#"];
  os_log_type_t v12 = [v11 firstObject];
  uint64_t v13 = [v11 lastObject];
  id v79 = v11;
  os_log_type_t v80 = v12;
  if (![v12 isEqualToString:@"NetworkDetails"] || !v13)
  {
    char v78 = (void *)v13;
    if ([v10 isEqualToString:@"NetworkDetails"])
    {
      BOOL v14 = [(WFNetworkListController *)self _handleCurrentNetworkDetailsURL:0];
      uint64_t v15 = 0;
      int v16 = 0;
      char v18 = 0;
      BOOL v19 = 0;
      os_log_type_t v20 = 0;
      int v21 = 0;
LABEL_12:
      char v17 = v78;
      goto LABEL_46;
    }
    id v77 = v8;
    if ([v10 isEqualToString:@"WiFiPower"])
    {
      BOOL v22 = [(WFNetworkListController *)self viewController];
      char v23 = objc_opt_respondsToSelector();

      if (v23)
      {
        long long v24 = [(WFNetworkListController *)self viewController];
        [v24 scrollToAirportCell:1];
      }
    }
    if ([v10 isEqualToString:@"AskToJoin"])
    {
      __int16 v25 = [(WFNetworkListController *)self viewController];
      char v26 = objc_opt_respondsToSelector();

      if (v26)
      {
        os_log_type_t v27 = [(WFNetworkListController *)self viewController];
        [v27 scrollToAirportCell:2];
      }
    }
    if ([v10 isEqualToString:@"AutoJoinHotspot"])
    {
      os_log_type_t v28 = [(WFNetworkListController *)self viewController];
      char v29 = objc_opt_respondsToSelector();

      if (v29)
      {
        BOOL v30 = [(WFNetworkListController *)self viewController];
        [v30 scrollToAirportCell:3];
      }
    }
    if (([v10 isEqualToString:@"Credentials"] & 1) != 0
      || [v10 isEqualToString:@"TrustEnterprise"])
    {
      id v82 = 0;
      uint64_t v31 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:@"/var/mobile/Library/Caches/com.apple.wifi/LastEnterpriseNetwork.plist" options:0 error:&v82];
      id v32 = v82;
      int v33 = v32;
      if (v31)
      {
        uint64_t v34 = [MEMORY[0x263F08AC0] propertyListWithData:v31 options:0 format:0 error:0];
        uint64_t v35 = WiFiNetworkCreate();
        if (v35)
        {
          id v36 = (const void *)v35;
          BOOL v19 = [[WFNetworkScanRecord alloc] initWithNetworkRef:v35];
          __int16 v37 = [[WFNetworkProfile alloc] initWithNetworkRef:v36];
          char v18 = v37;
          id v74 = (void *)v31;
          uint64_t v75 = (void *)v34;
          CFTypeRef cf = v36;
          if (!v19)
          {
            id v73 = v33;
            id v68 = v4;
            id v50 = WFLogForCategory(0);
            os_log_type_t v69 = OSLogForWFLogLevel(1uLL);
            BOOL v14 = 0;
            uint64_t v15 = 0;
            if (WFCurrentLogLevel() && v50)
            {
              if (os_log_type_enabled(v50, v69))
              {
                *(_DWORD *)buf = 136315394;
                id v84 = "-[WFNetworkListController handleURL:]";
                __int16 v85 = 2112;
                *(void *)uint64_t v86 = cf;
                _os_log_impl(&dword_226071000, v50, v69, "%s: unable to create scan record for enterprise networkRef %@", buf, 0x16u);
              }
              uint64_t v15 = 0;
              BOOL v14 = 0;
            }
            id v4 = v68;
            goto LABEL_96;
          }
          id v72 = v4;
          if (v37)
          {
            int v38 = [(WFNetworkListController *)self networks];
            uint64_t v15 = (void *)[v38 mutableCopy];

            if (!v15)
            {
              uint64_t v15 = [MEMORY[0x263EFF9C0] set];
            }
            [v15 addObject:v19];
            [(WFNetworkListController *)self setNetworks:v15];
            [(WFNetworkListController *)self _updateViewControllerScanResults];
            os_log_type_t v39 = [(WFNetworkListController *)self viewController];
            char v40 = objc_opt_respondsToSelector();

            __int16 v41 = [(WFNetworkListController *)self viewController];
            __int16 v42 = v41;
            if (v40) {
              [v41 setCurrentNetwork:v19 previousNetwork:0 reason:0];
            }
            else {
              [v41 setCurrentNetwork:v19];
            }

            if ([v10 isEqualToString:@"Credentials"])
            {
              os_log_type_t v43 = [(WFNetworkListController *)self credentialsContext];

              if (v43)
              {
                int v44 = [(WFNetworkListController *)self credentialsContext];
                [v44 cancel];
              }
              [(WFNetworkListController *)self _associationWillStart:v19];
              id v45 = [(WFNetworkListController *)self associationContext];
              [v45 setState:2];

              [(WFNetworkListController *)self _promptCredentialsForNetwork:v19 profile:v18];
              goto LABEL_40;
            }
            if (![v10 isEqualToString:@"TrustEnterprise"])
            {
LABEL_40:
              int v49 = WFScanRecordDeleteEnterprisePath();
              id v81 = v33;
              id v50 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:@"/var/mobile/Library/Caches/com.apple.wifi/LastEnterpriseNetwork.plist" options:0 error:&v81];
              id v51 = v81;

              id v52 = WFLogForCategory(0);
              os_log_type_t v53 = OSLogForWFLogLevel(3uLL);
              os_log_type_t v8 = v77;
              if ((unint64_t)WFCurrentLogLevel() >= 3 && v52 && os_log_type_enabled(v52, v53))
              {
                *(_DWORD *)buf = 136315650;
                id v84 = "-[WFNetworkListController handleURL:]";
                __int16 v85 = 1024;
                *(_DWORD *)uint64_t v86 = v49;
                v86[2] = 2112;
                *(void *)&v86[3] = v50;
                _os_log_impl(&dword_226071000, v52, v53, "%s: LastEnterpriseNetwork deletion successful: %d data: %@", buf, 0x1Cu);
              }

              BOOL v14 = 1;
              id v73 = v51;
              id v4 = v72;
              goto LABEL_45;
            }
            __int16 v46 = [(WFNetworkProfile *)v18 certificateChain];

            if (v46)
            {
              [(WFNetworkListController *)self _associationWillStart:v19];
              uint64_t v47 = [(WFNetworkListController *)self associationContext];
              [v47 setState:2];

              uint64_t v48 = [(WFNetworkProfile *)v18 certificateChain];
              [(WFNetworkListController *)self _promptTrustCertificateForNetwork:v19 certificateChain:v48 profile:v18 autoJoin:1];

              goto LABEL_40;
            }
            id v73 = v33;
            id v50 = WFLogForCategory(0);
            os_log_type_t v71 = OSLogForWFLogLevel(1uLL);
            BOOL v14 = 0;
            if (!WFCurrentLogLevel() || !v50) {
              goto LABEL_95;
            }
            if (os_log_type_enabled(v50, v71))
            {
              *(_DWORD *)buf = 136315394;
              id v84 = "-[WFNetworkListController handleURL:]";
              __int16 v85 = 2112;
              *(void *)uint64_t v86 = v18;
              _os_log_impl(&dword_226071000, v50, v71, "%s: certificate chain is nil for profile %@", buf, 0x16u);
            }
          }
          else
          {
            id v73 = v33;
            id v50 = WFLogForCategory(0);
            uint64_t v70 = OSLogForWFLogLevel(1uLL);
            BOOL v14 = 0;
            uint64_t v15 = 0;
            if (!WFCurrentLogLevel() || !v50)
            {
              char v18 = 0;
              goto LABEL_95;
            }
            if (os_log_type_enabled(v50, (os_log_type_t)v70))
            {
              *(_DWORD *)buf = 136315394;
              id v84 = "-[WFNetworkListController handleURL:]";
              __int16 v85 = 2112;
              *(void *)uint64_t v86 = cf;
              _os_log_impl(&dword_226071000, v50, (os_log_type_t)v70, "%s: unable to create network profile for enterprise networkRef %@", buf, 0x16u);
            }
            uint64_t v15 = 0;
            char v18 = 0;
          }
          BOOL v14 = 0;
LABEL_95:
          id v4 = v72;
LABEL_96:
          os_log_type_t v8 = v77;
LABEL_45:

          CFRelease(cf);
          char v17 = v78;
          int v21 = v74;
          os_log_type_t v20 = v75;
          int v16 = v73;
          goto LABEL_46;
        }
        int v16 = v33;
        int v21 = (void *)v31;
        os_log_type_t v20 = (void *)v34;
        id v66 = WFLogForCategory(0);
        os_log_type_t v67 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v66 && os_log_type_enabled(v66, v67))
        {
          *(_DWORD *)buf = 136315394;
          id v84 = "-[WFNetworkListController handleURL:]";
          __int16 v85 = 2112;
          *(void *)uint64_t v86 = v34;
          _os_log_impl(&dword_226071000, v66, v67, "%s: unable to create WiFiNetworkRef from scan dictionary: %@", buf, 0x16u);
        }

        uint64_t v15 = 0;
        char v18 = 0;
        BOOL v19 = 0;
      }
      else
      {
        int v16 = v32;
        id v64 = WFLogForCategory(0);
        os_log_type_t v65 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v64 && os_log_type_enabled(v64, v65))
        {
          *(_DWORD *)buf = 136315394;
          id v84 = "-[WFNetworkListController handleURL:]";
          __int16 v85 = 2112;
          *(void *)uint64_t v86 = v33;
          _os_log_impl(&dword_226071000, v64, v65, "%s: Unable to serialize LastEnterpriseNetwork.plist (error %@)", buf, 0x16u);
        }

        uint64_t v15 = 0;
        char v18 = 0;
        BOOL v19 = 0;
        os_log_type_t v20 = 0;
        int v21 = 0;
      }
      BOOL v14 = 0;
    }
    else
    {
      if (![v10 isEqualToString:@"AccessoryDetails"])
      {
        if ([v10 isEqualToString:@"proxycredentials"])
        {
          uint64_t v15 = 0;
          int v16 = 0;
          char v18 = 0;
          BOOL v19 = 0;
          os_log_type_t v20 = 0;
          int v21 = 0;
          BOOL v14 = 1;
        }
        else
        {
          os_log_type_t v59 = WFLogForCategory(0);
          os_log_type_t v60 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v59 && os_log_type_enabled(v59, v60))
          {
            *(_DWORD *)buf = 136315394;
            id v84 = "-[WFNetworkListController handleURL:]";
            __int16 v85 = 2112;
            *(void *)uint64_t v86 = v10;
            _os_log_impl(&dword_226071000, v59, v60, "%s: unknown path param %@", buf, 0x16u);
          }

          uint64_t v15 = 0;
          int v16 = 0;
          char v18 = 0;
          BOOL v19 = 0;
          os_log_type_t v20 = 0;
          int v21 = 0;
          BOOL v14 = 0;
        }
        goto LABEL_12;
      }
      id v55 = v4;
      uint64_t v56 = [v77 objectForKey:@"identifier"];
      int v57 = WFLogForCategory(0);
      os_log_type_t v58 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v57 && os_log_type_enabled(v57, v58))
      {
        *(_DWORD *)buf = 138412290;
        id v84 = v56;
        _os_log_impl(&dword_226071000, v57, v58, "Trying to open Detail settings for accessory: %@", buf, 0xCu);
      }

      [(WFNetworkListController *)self _handleAccessoryDetailURL:v56];
      uint64_t v15 = 0;
      int v16 = 0;
      char v18 = 0;
      BOOL v19 = 0;
      os_log_type_t v20 = 0;
      int v21 = 0;
      BOOL v14 = 1;
      id v4 = v55;
    }
    os_log_type_t v8 = v77;
    goto LABEL_12;
  }
  BOOL v14 = [(WFNetworkListController *)self _handleCurrentNetworkDetailsURL:v13];
  uint64_t v15 = 0;
  int v16 = 0;
  char v17 = (void *)v13;
  char v18 = 0;
  BOOL v19 = 0;
  os_log_type_t v20 = 0;
  int v21 = 0;
LABEL_46:

  return v14;
}

- (BOOL)_handleAccessoryDetailURL:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  if (_os_feature_enabled_impl())
  {
    os_log_type_t v5 = [(WFNetworkListController *)self knownNetworksManager];
    os_log_type_t v6 = [v5 allEditableNetworkProfiles];
    id v7 = [(WFNetworkListController *)self knownNetworksManager];
    os_log_type_t v8 = [v7 allNonEditableNetworkProfiles];
    int v9 = [v6 setByAddingObjectsFromSet:v8];
    id v10 = [v9 allObjects];

    __int16 v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v11)
    {
      uint64_t v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        *(_DWORD *)buf = 134217984;
        __int16 v42 = (const char *)[v10 count];
        _os_log_impl(&dword_226071000, v13, v12, "All profile count: %lu", buf, 0xCu);
      }
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    BOOL v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
LABEL_9:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        BOOL v19 = *(void **)(*((void *)&v37 + 1) + 8 * v18);
        os_log_type_t v20 = objc_msgSend(v19, "accessoryIdentifier", (void)v37);
        int v21 = [v20 isEqualToString:v4];

        if (v21) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
          if (v16) {
            goto LABEL_9;
          }
          goto LABEL_15;
        }
      }
      long long v24 = WFLogForCategory(0);
      os_log_type_t v25 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v24)
      {
        char v26 = v24;
        if (os_log_type_enabled(v26, v25))
        {
          os_log_type_t v27 = [v19 networkName];
          *(_DWORD *)buf = 138412546;
          __int16 v42 = v4;
          __int16 v43 = 2112;
          int v44 = v27;
          _os_log_impl(&dword_226071000, v26, v25, "Found matching accessory network profile for %@, network name: %@", buf, 0x16u);
        }
      }

      id v28 = v19;
      if (v28)
      {
        char v29 = WFLogForCategory(0);
        os_log_type_t v30 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v29)
        {
          uint64_t v31 = v29;
          if (os_log_type_enabled(v31, v30))
          {
            id v32 = [v28 networkName];
            *(_DWORD *)buf = 136315650;
            __int16 v42 = "-[WFNetworkListController _handleAccessoryDetailURL:]";
            __int16 v43 = 2112;
            int v44 = v32;
            __int16 v45 = 2112;
            __int16 v46 = v4;
            _os_log_impl(&dword_226071000, v31, v30, "%s: successfully opened network detail for %@:  id:%@", buf, 0x20u);
          }
        }

        int v33 = [(WFNetworkListController *)self viewController];
        [(WFNetworkListController *)self networkListViewController:v33 showSettingsForNetwork:v28];
        BOOL v23 = 1;
        goto LABEL_38;
      }
    }
    else
    {
LABEL_15:
    }
    WFLogForCategory(0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    os_log_type_t v34 = OSLogForWFLogLevel(1uLL);
    BOOL v23 = 0;
    if (WFCurrentLogLevel() && v28)
    {
      int v33 = v28;
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = [v14 count];
        *(_DWORD *)buf = 136315650;
        __int16 v42 = "-[WFNetworkListController _handleAccessoryDetailURL:]";
        __int16 v43 = 2112;
        int v44 = v4;
        __int16 v45 = 2048;
        __int16 v46 = (char *)v35;
        _os_log_impl(&dword_226071000, v33, v34, "%s: Not found matching profile for %@ in all known %lu profiles, unable to show detail page", buf, 0x20u);
      }
      BOOL v23 = 0;
      id v28 = v33;
LABEL_38:
    }
  }
  else
  {
    BOOL v14 = WFLogForCategory(0);
    os_log_type_t v22 = OSLogForWFLogLevel(3uLL);
    BOOL v23 = 0;
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v14)
    {
      if (os_log_type_enabled(v14, v22))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v14, v22, "failed to open accessoryView url: DeviceAccess FF in AccessorySetupKit is not enabled", buf, 2u);
      }
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (BOOL)_handleCurrentNetworkDetailsURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToString:@"AutoJoin"])
  {
    uint64_t v5 = 4;
  }
  else if ([v4 isEqualToString:@"LowDataMode"])
  {
    uint64_t v5 = 5;
  }
  else if ([v4 isEqualToString:@"PrivateWiFiAddress"])
  {
    uint64_t v5 = 6;
  }
  else if ([v4 isEqualToString:@"LimitIPAddress"])
  {
    uint64_t v5 = 7;
  }
  else
  {
    uint64_t v5 = 0;
  }
  os_log_type_t v6 = [(WFNetworkListController *)self interface];
  id v7 = [v6 currentNetwork];

  if (v7)
  {
    os_log_type_t v8 = [(WFNetworkListController *)self viewController];
    int v9 = [(WFNetworkListController *)self interface];
    id v10 = [v9 currentNetwork];
    [(WFNetworkListController *)self networkListViewController:v8 showSettingsForNetwork:v10 context:0 scrollToCellType:v5];

    __int16 v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v11)
    {
      __int16 v11 = v11;
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = [(WFNetworkListController *)self interface];
        BOOL v14 = [v13 currentNetwork];
        int v17 = 136315394;
        uint64_t v18 = "-[WFNetworkListController _handleCurrentNetworkDetailsURL:]";
        __int16 v19 = 2112;
        os_log_type_t v20 = v14;
        _os_log_impl(&dword_226071000, v11, v12, "%s: handling URL for current network (%@) details", (uint8_t *)&v17, 0x16u);
      }
    }
  }
  else
  {
    __int16 v11 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v16))
    {
      int v17 = 136315138;
      uint64_t v18 = "-[WFNetworkListController _handleCurrentNetworkDetailsURL:]";
      _os_log_impl(&dword_226071000, v11, v16, "%s: current network is nil", (uint8_t *)&v17, 0xCu);
    }
  }

  return v7 != 0;
}

- (id)keyValueDictionaryForURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [v3 resourceSpecifier];
  os_log_type_t v6 = [v5 componentsSeparatedByString:@"&"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        os_log_type_t v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "componentsSeparatedByString:", @"=", (void)v17);
        if ([v12 count] == 2)
        {
          uint64_t v13 = [v12 objectAtIndex:1];
          BOOL v14 = [v13 stringByRemovingPercentEncoding];

          uint64_t v15 = [v12 objectAtIndex:0];
          [v4 setObject:v14 forKey:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v4;
}

- (id)_hardwareMACAddress
{
  id v2 = [(WFNetworkListController *)self wifiClient];
  id v3 = [v2 hardwareMACAddress];

  return v3;
}

- (void)_cellularOutrankNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[WFNetworkListController _cellularOutrankNotification:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: received cellular outrank notification %@", (uint8_t *)&v9, 0x16u);
  }

  [(WFNetworkListController *)self _updateHealthSubtitle];
  id v7 = [(WFNetworkListController *)self interface];
  uint64_t v8 = [v7 currentNetwork];
  [(WFNetworkListController *)self _updateCurrentNetworkIPState:v8];
}

- (void)_presentCellularOutrankAlertForNetwork:(id)a3 privateCellular:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__WFNetworkListController__presentCellularOutrankAlertForNetwork_privateCellular___block_invoke;
  aBlock[3] = &unk_26478E680;
  objc_copyWeak(&v18, &location);
  id v7 = v6;
  id v17 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  int v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v9 && os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[WFNetworkListController _presentCellularOutrankAlertForNetwork:privateCellular:]";
    _os_log_impl(&dword_226071000, v9, v10, "%s: showing cellular outrank prompt", buf, 0xCu);
  }

  __int16 v11 = (void *)MEMORY[0x263F86380];
  id v12 = [v7 ssid];
  uint64_t v13 = [(WFNetworkListController *)self viewController];
  [v13 deviceCapability];
  BOOL v14 = [v11 cellularOutrankAlertControllerWithNetworkName:v12 chinaDevice:WFCapabilityIsChinaDevice() privateCellular:v4 completionHandler:v8];

  uint64_t v15 = [(WFNetworkListController *)self viewController];
  [v15 presentViewController:v14 animated:1 completion:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __82__WFNetworkListController__presentCellularOutrankAlertForNetwork_privateCellular___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  BOOL v8 = (unint64_t)WFCurrentLogLevel() > 2 && v5 != 0;
  if (a2)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v5, v6, "User accepted cellular outrank prompt", buf, 2u);
    }

    [WeakRetained _associateToScanRecord:*(void *)(a1 + 32)];
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_226071000, v5, v6, "User declined cellular outrank prompt", v9, 2u);
    }
  }
}

- (void)_presentDeveloperOutrankAlertForNetwork:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[WFNetworkListController _presentDeveloperOutrankAlertForNetwork:]";
    _os_log_impl(&dword_226071000, v5, v6, "%s: showing developer outrank prompt", (uint8_t *)&v12, 0xCu);
  }

  id v7 = (void *)MEMORY[0x263F86390];
  BOOL v8 = [v4 ssid];

  int v9 = [(WFNetworkListController *)self viewController];
  [v9 deviceCapability];
  os_log_type_t v10 = [v7 developerOutrankAlertControllerWithNetworkName:v8 chinaDevice:WFCapabilityIsChinaDevice() completionHandler:&__block_literal_global_535];

  __int16 v11 = [(WFNetworkListController *)self viewController];
  [v11 presentViewController:v10 animated:1 completion:0];
}

void __67__WFNetworkListController__presentDeveloperOutrankAlertForNetwork___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v5 = [MEMORY[0x263F5FCE8] sharedManager];
    id v2 = [NSURL URLWithString:@"prefs:root=DEVELOPER_SETTINGS&path=NCO"];
    [v5 processURL:v2 animated:1 fromSearch:0 withCompletion:&__block_literal_global_541];
  }
  else
  {
    id v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v3, v4, "User bypassed option to go to developer settings", buf, 2u);
    }
  }
}

void __67__WFNetworkListController__presentDeveloperOutrankAlertForNetwork___block_invoke_2()
{
  v0 = WFLogForCategory(0);
  os_log_type_t v1 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v0 && os_log_type_enabled(v0, v1))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_226071000, v0, v1, "User taken to developer settings", v2, 2u);
  }
}

- (int64_t)_defaultAuthTraits
{
  id v3 = [(WFNetworkListController *)self wifiClient];
  int v4 = [v3 isWPA3PersonalEnabled];

  if (v4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  os_log_type_t v6 = [(WFNetworkListController *)self wifiClient];
  int v7 = [v6 isWPA3EnterpriseEnabled];

  if (v7) {
    v5 |= 4uLL;
  }
  BOOL v8 = [(WFNetworkListController *)self wifiClient];
  int v9 = [v8 isMfpCapable];

  if (v9) {
    int64_t v10 = v5 | 8;
  }
  else {
    int64_t v10 = v5;
  }
  if (WFHasWAPICapability())
  {
    __int16 v11 = [(WFNetworkListController *)self wifiClient];
    unsigned int v12 = [v11 isWAPIEnabled];

    return v10 | v12;
  }
  return v10;
}

- (void)_updatePrivacyProxyFeatureEnabled
{
  id v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke;
  block[3] = &unk_26478E528;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = (void *)MEMORY[0x263F58270];
  int v4 = dispatch_get_global_queue(33, 0);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_2;
  v17[3] = &unk_26478EE08;
  long long v19 = &v20;
  uint64_t v5 = v2;
  id v18 = v5;
  [v3 getStatus:v4 completionHandler:v17];

  dispatch_time_t v6 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v5, v6);
  if (*((_DWORD *)v21 + 6))
  {
    int v7 = (void *)MEMORY[0x263F58270];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_2_544;
    v13[3] = &unk_26478EE30;
    uint64_t v15 = &v20;
    BOOL v8 = v5;
    uint64_t v14 = v8;
    [v7 getUserTier:v4 completionHandler:v13];

    dispatch_time_t v9 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v8, v9);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_546;
    block[3] = &unk_26478EE58;
    void block[4] = *(void *)(a1 + 32);
    void block[5] = &v20;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    int64_t v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315138;
      os_log_type_t v25 = "-[WFNetworkListController _updatePrivacyProxyFeatureEnabled]_block_invoke";
      _os_log_impl(&dword_226071000, v10, v11, "%s: privacy proxy feature is disabled", buf, 0xCu);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_543;
    v16[3] = &unk_26478E528;
    v16[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v16);
  }

  _Block_object_dispose(&v20, 8);
}

void __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_time_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    int v8 = 136315650;
    dispatch_time_t v9 = "-[WFNetworkListController _updatePrivacyProxyFeatureEnabled]_block_invoke_2";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_226071000, v6, v7, "%s: privacy proxy status=%d (error=%@)", (uint8_t *)&v8, 0x1Cu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_543(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPrivacyProxyFeatureTier:0];
}

void __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_2_544(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 == 1)
  {
    int v6 = 1;
    goto LABEL_5;
  }
  if (a2 == 2)
  {
    int v6 = 2;
LABEL_5:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
  os_log_type_t v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    __int16 v10 = "-[WFNetworkListController _updatePrivacyProxyFeatureEnabled]_block_invoke_2";
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_226071000, v7, v8, "%s: privacy proxy user tier=%ld (error=%@)", (uint8_t *)&v9, 0x20u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_546(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPrivacyProxyFeatureTier:*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (void)_refreshKnownHiddenNetworkNamesCache
{
  id v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__WFNetworkListController__refreshKnownHiddenNetworkNamesCache__block_invoke;
  block[3] = &unk_26478E528;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __63__WFNetworkListController__refreshKnownHiddenNetworkNamesCache__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = [MEMORY[0x263EFF980] array];
  id v3 = [*(id *)(a1 + 32) wifiClient];
  int v4 = [v3 cInterface];
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26D9E1B70, &unk_26D9E1BD0, &unk_26D9E1B88, &unk_26D9E1BE8, &unk_26D9E1C00, 0);
  int v6 = [v4 knownNetworkProfilesWithProperties:v5];

  os_log_type_t v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226071000, v7, v8, "refreshing known hidden network name cache", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__WFNetworkListController__refreshKnownHiddenNetworkNamesCache__block_invoke_553;
  block[3] = &unk_26478E7B0;
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v6;
  uint64_t v14 = v9;
  id v15 = v2;
  id v10 = v2;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__WFNetworkListController__refreshKnownHiddenNetworkNamesCache__block_invoke_553(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    char v6 = 0;
    uint64_t v7 = *(void *)v27;
    *(void *)&long long v4 = 136315394;
    long long v25 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v9, "hiddenState", v25, (void)v26) == 1)
        {
          uint64_t v10 = [v9 networkName];
          if (v10)
          {
            id v11 = (void *)v10;
            int v12 = [*(id *)(a1 + 40) _canScanForHiddenNetwork:v9];

            if (v12)
            {
              id v13 = WFLogForCategory(0);
              os_log_type_t v14 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v13 && os_log_type_enabled(v13, v14))
              {
                *(_DWORD *)buf = v25;
                uint64_t v31 = "-[WFNetworkListController _refreshKnownHiddenNetworkNamesCache]_block_invoke";
                __int16 v32 = 2112;
                int v33 = v9;
                _os_log_impl(&dword_226071000, v13, v14, "%s: hidden network profile='%@'", buf, 0x16u);
              }

              id v15 = *(void **)(a1 + 48);
              os_log_type_t v16 = [v9 networkName];
              [v15 addObject:v16];
            }
          }
        }
        if ([v9 isPasspoint])
        {
          id v17 = WFLogForCategory(0);
          os_log_type_t v18 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v17 && os_log_type_enabled(v17, v18))
          {
            *(_DWORD *)buf = v25;
            uint64_t v31 = "-[WFNetworkListController _refreshKnownHiddenNetworkNamesCache]_block_invoke";
            __int16 v32 = 2112;
            int v33 = v9;
            _os_log_impl(&dword_226071000, v17, v18, "%s: passpoint network profile='%@'", buf, 0x16u);
          }

          char v6 = 1;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  long long v19 = WFLogForCategory(0);
  os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v19 && os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = *(const char **)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = v21;
    __int16 v32 = 1024;
    LODWORD(v33) = v6 & 1;
    _os_log_impl(&dword_226071000, v19, v20, "hidden known network names='%@' HS20NetworksFound='%d'", buf, 0x12u);
  }

  uint64_t v22 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 48)];
  uint64_t v23 = *(void *)(a1 + 40);
  long long v24 = *(void **)(v23 + 240);
  *(void *)(v23 + 240) = v22;

  *(unsigned char *)(*(void *)(a1 + 40) + 16) = v6 & 1;
}

- (WFKnownNetworksProvider)knownNetworksManager
{
  knownNetworksManager = self->_knownNetworksManager;
  if (!knownNetworksManager)
  {
    long long v4 = [WFKnownNetworksManager alloc];
    uint64_t v5 = [(WFNetworkListController *)self wifiClient];
    char v6 = [v5 cInterface];
    uint64_t v7 = [(WFKnownNetworksManager *)v4 initWithInterface:v6];
    os_log_type_t v8 = self->_knownNetworksManager;
    self->_knownNetworksManager = v7;

    knownNetworksManager = self->_knownNetworksManager;
  }
  return knownNetworksManager;
}

- (WFNetworkListing)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (BOOL)scanForPersonalHotspots
{
  return self->_scanForPersonalHotspots;
}

- (void)setScanForPersonalHotspots:(BOOL)a3
{
  self->_scanForPersonalHotspots = a3;
}

- (BOOL)isScanning
{
  return self->_scanning;
}

- (WFHotspotInterface)hotspotInterface
{
  return self->_hotspotInterface;
}

- (void)setHotspotInterface:(id)a3
{
}

- (NSSet)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
}

- (WFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (BOOL)associatingToOtherNetwork
{
  return self->_associatingToOtherNetwork;
}

- (void)setAssociatingToOtherNetwork:(BOOL)a3
{
  self->_associatingToOtherNetwork = a3;
}

- (WFOtherNetworkProvider)otherNetworkVC
{
  return self->_otherNetworkVC;
}

- (void)setOtherNetworkVC:(id)a3
{
}

- (NSOperationQueue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
}

- (WFHealthIssueOverrides)healthRecommendationOverrides
{
  return self->_healthRecommendationOverrides;
}

- (void)setHealthRecommendationOverrides:(id)a3
{
}

- (WFScanManager)scanManager
{
  return self->_scanManager;
}

- (void)setScanManager:(id)a3
{
}

- (WFLinkQuality)latestLinkQuality
{
  return self->_latestLinkQuality;
}

- (void)setLatestLinkQuality:(id)a3
{
}

- (WFHealthManager)healthManager
{
  return self->_healthManager;
}

- (void)setHealthManager:(id)a3
{
}

- (BOOL)viewControllerSupportsCurrentNetworkSubtitle
{
  return self->_viewControllerSupportsCurrentNetworkSubtitle;
}

- (void)setViewControllerSupportsCurrentNetworkSubtitle:(BOOL)a3
{
  self->_viewControllerSupportsCurrentNetworkSubtitle = a3;
}

- (unint64_t)powerState
{
  return self->_powerState;
}

- (BOOL)canScanForPersonalHotspots
{
  return self->_canScanForPersonalHotspots;
}

- (void)setCanScanForPersonalHotspots:(BOOL)a3
{
  self->_canScanForPersonalHotspots = a3;
}

- (WFGasQueryController)gasController
{
  return self->_gasController;
}

- (void)setGasController:(id)a3
{
}

- (WFWiFiStateMonitor)stateMonitor
{
  return self->_stateMonitor;
}

- (void)setStateMonitor:(id)a3
{
}

- (WFClient)wifiClient
{
  return self->_wifiClient;
}

- (void)setWifiClient:(id)a3
{
}

- (WFNetworkViewProvider)viewProvider
{
  return self->_viewProvider;
}

- (void)setViewProvider:(id)a3
{
}

- (WFDetailsContext)detailsContext
{
  return self->_detailsContext;
}

- (void)setDetailsContext:(id)a3
{
}

- (WFCredentialsContext)credentialsContext
{
  return self->_credentialsContext;
}

- (void)setCredentialsContext:(id)a3
{
}

- (WFCertificateContext)certificateContext
{
  return self->_certificateContext;
}

- (void)setCertificateContext:(id)a3
{
}

- (WFNetworkView)contextVC
{
  return self->_contextVC;
}

- (void)setContextVC:(id)a3
{
}

- (WFContextPresenting)visibleContext
{
  return self->_visibleContext;
}

- (void)setVisibleContext:(id)a3
{
}

- (WFAssociationContext)associationContext
{
  return self->_associationContext;
}

- (void)setAssociationContext:(id)a3
{
}

- (WFAssociationContextQueue)associationContextQueue
{
  return self->_associationContextQueue;
}

- (void)setAssociationContextQueue:(id)a3
{
}

- (WFScanMetricsManager)scanMetricsManager
{
  return self->_scanMetricsManager;
}

- (void)setScanMetricsManager:(id)a3
{
}

- (BOOL)isHS20Supported
{
  return self->_HS20Supported;
}

- (void)setHS20Supported:(BOOL)a3
{
  self->_HS20Supported = a3;
}

- (WFNetworkListRandomMACManager)randomMACManager
{
  return self->_randomMACManager;
}

- (void)setRandomMACManager:(id)a3
{
}

- (WFDiagnosticsManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
}

- (BOOL)firstScanFinished
{
  return self->_firstScanFinished;
}

- (void)setFirstScanFinished:(BOOL)a3
{
  self->_firstScanFinished = a3;
}

- (void)setKnownNetworksManager:(id)a3
{
}

- (int64_t)privacyProxyFeatureTier
{
  return self->_privacyProxyFeatureTier;
}

- (void)setPrivacyProxyFeatureTier:(int64_t)a3
{
  self->_privacyProxyFeatureTier = a3;
}

- (BOOL)privacyProxyFeatureEnabled
{
  return self->_privacyProxyFeatureEnabled;
}

- (void)setPrivacyProxyFeatureEnabled:(BOOL)a3
{
  self->_privacyProxyFeatureEnabled = a3;
}

- (NSSet)knownHiddenNetworkNames
{
  return self->_knownHiddenNetworkNames;
}

- (void)setKnownHiddenNetworkNames:(id)a3
{
}

- (BOOL)knownNetworksContainsHS20Networks
{
  return self->_knownNetworksContainsHS20Networks;
}

- (void)setKnownNetworksContainsHS20Networks:(BOOL)a3
{
  self->_knownNetworksContainsHS20Networks = a3;
}

- (BOOL)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(BOOL)a3
{
  self->_lockdownModeEnabled = a3;
}

- (BOOL)shouldShowDetailTapOnCurrentNetwork
{
  return self->_shouldShowDetailTapOnCurrentNetwork;
}

- (BOOL)isRandomMACManageFeatureEnabled
{
  return self->_isRandomMACManageFeatureEnabled;
}

- (void)setIsRandomMACManageFeatureEnabled:(BOOL)a3
{
  self->_isRandomMACManageFeatureEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownHiddenNetworkNames, 0);
  objc_storeStrong((id *)&self->_knownNetworksManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_randomMACManager, 0);
  objc_storeStrong((id *)&self->_scanMetricsManager, 0);
  objc_storeStrong((id *)&self->_associationContextQueue, 0);
  objc_storeStrong((id *)&self->_associationContext, 0);
  objc_storeStrong((id *)&self->_visibleContext, 0);
  objc_storeStrong((id *)&self->_contextVC, 0);
  objc_storeStrong((id *)&self->_certificateContext, 0);
  objc_storeStrong((id *)&self->_credentialsContext, 0);
  objc_storeStrong((id *)&self->_detailsContext, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
  objc_storeStrong((id *)&self->_wifiClient, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_gasController, 0);
  objc_storeStrong((id *)&self->_healthManager, 0);
  objc_storeStrong((id *)&self->_latestLinkQuality, 0);
  objc_storeStrong((id *)&self->_scanManager, 0);
  objc_storeStrong((id *)&self->_healthRecommendationOverrides, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_otherNetworkVC, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_hotspotInterface, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end