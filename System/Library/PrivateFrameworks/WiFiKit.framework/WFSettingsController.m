@interface WFSettingsController
- (BOOL)cloudSyncRunning;
- (BOOL)isCurrentNetwork;
- (BOOL)monitorIPChanges;
- (NSOperationQueue)queue;
- (NSString)hardwareMACAddress;
- (WFAppearanceProxy)appearanceProxy;
- (WFDetailsContext)detailsContext;
- (WFIPMonitor)ipMonitor;
- (WFNetworkScanRecord)network;
- (WFNetworkSettingsConfig)config;
- (WFNetworkSettingsViewController)settingsViewController;
- (WFSettingsController)initWithDetailsContext:(id)a3;
- (WFSettingsController)initWithDetailsContext:(id)a3 appearanceProxy:(id)a4;
- (id)_baseConfigForNetwork:(id)a3 current:(BOOL)a4;
- (void)_applySetupAppearances;
- (void)_currentNetworkDidChange:(id)a3;
- (void)_ipStateDidChange:(id)a3;
- (void)_refreshSettingsConfig:(id)a3;
- (void)_startMontoringIPChanges;
- (void)_stopMonitoringIPChanges;
- (void)dealloc;
- (void)networkSettingsViewController:(id)a3 saveConfig:(id)a4 errorHandler:(id)a5;
- (void)setAppearanceProxy:(id)a3;
- (void)setCloudSyncRunning:(BOOL)a3;
- (void)setConfig:(id)a3;
- (void)setCurrentNetwork:(BOOL)a3;
- (void)setDetailsContext:(id)a3;
- (void)setHardwareMACAddress:(id)a3;
- (void)setIpMonitor:(id)a3;
- (void)setMonitorIPChanges:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSettingsViewController:(id)a3;
@end

@implementation WFSettingsController

- (WFSettingsController)initWithDetailsContext:(id)a3
{
  v4 = (void *)MEMORY[0x263F86368];
  id v5 = a3;
  v6 = [v4 defaultAppearanceProxy];
  v7 = [(WFSettingsController *)self initWithDetailsContext:v5 appearanceProxy:v6];

  return v7;
}

- (WFSettingsController)initWithDetailsContext:(id)a3 appearanceProxy:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)WFSettingsController;
  v9 = [(WFSettingsController *)&v37 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_34;
  }
  if (!v7)
  {
    v34 = WFLogForCategory(0);
    LOBYTE(v35) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v34 || !os_log_type_enabled(v34, (os_log_type_t)v35)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 136315138;
    v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
    v36 = "%s: details context is nil";
    goto LABEL_32;
  }
  objc_storeStrong((id *)&v9->_detailsContext, a3);
  objc_storeStrong((id *)&v10->_appearanceProxy, a4);
  [(WFAppearanceProxy *)v10->_appearanceProxy apply];
  v11 = [(WFDetailsContext *)v10->_detailsContext network];

  if (!v11)
  {
    v34 = WFLogForCategory(0);
    uint64_t v35 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v34 || !os_log_type_enabled(v34, (os_log_type_t)v35)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 136315138;
    v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
    v36 = "%s: network is nil";
    goto LABEL_32;
  }
  uint64_t v12 = [(WFDetailsContext *)v10->_detailsContext network];
  network = v10->_network;
  v10->_network = (WFNetworkScanRecord *)v12;

  v14 = WFLogForCategory(0);
  os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v14)
  {
    v16 = v14;
    if (os_log_type_enabled(v16, v15))
    {
      v17 = [(WFDetailsContext *)v10->_detailsContext profile];
      *(_DWORD *)buf = 136315394;
      v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
      __int16 v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_226071000, v16, v15, "%s: provided profile %@", buf, 0x16u);
    }
  }

  v18 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
  queue = v10->_queue;
  v10->_queue = v18;

  v20 = v10->_queue;
  if (!v20) {
    goto LABEL_34;
  }
  [(NSOperationQueue *)v20 setName:@"WFSettingsController Queue"];
  [(NSOperationQueue *)v10->_queue setMaxConcurrentOperationCount:1];
  [(NSOperationQueue *)v10->_queue setQualityOfService:-1];
  v10->_BOOL cloudSyncRunning = WiFiCloudSyncEngineIsRunning() != 0;
  v21 = WFLogForCategory(0);
  os_log_type_t v22 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v21 && os_log_type_enabled(v21, v22))
  {
    BOOL cloudSyncRunning = v10->_cloudSyncRunning;
    *(_DWORD *)buf = 136315394;
    v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
    __int16 v40 = 1024;
    LODWORD(v41) = cloudSyncRunning;
    _os_log_impl(&dword_226071000, v21, v22, "%s: cloudSyncRunning %d", buf, 0x12u);
  }

  uint64_t v24 = [(WFDetailsContext *)v10->_detailsContext ipMonitor];
  ipMonitor = v10->_ipMonitor;
  v10->_ipMonitor = (WFIPMonitor *)v24;

  if (!v10->_ipMonitor)
  {
    v34 = WFLogForCategory(0);
    LOBYTE(v35) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v34 || !os_log_type_enabled(v34, (os_log_type_t)v35)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 136315138;
    v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
    v36 = "%s: ipmonitor is nil";
LABEL_32:
    _os_log_impl(&dword_226071000, v34, (os_log_type_t)v35, v36, buf, 0xCu);
LABEL_33:

LABEL_34:
    v10 = 0;
    goto LABEL_19;
  }
  v10->_currentNetwork = [(WFDetailsContext *)v10->_detailsContext isCurrent];
  uint64_t v26 = [(WFSettingsController *)v10 _baseConfigForNetwork:v10->_network current:[(WFDetailsContext *)v10->_detailsContext isCurrent]];
  config = v10->_config;
  v10->_config = (WFNetworkSettingsConfig *)v26;

  if (!v10->_config) {
    goto LABEL_34;
  }
  -[WFSettingsController _refreshSettingsConfig:](v10, "_refreshSettingsConfig:");
  uint64_t v28 = [v7 hardwareMACAddress];
  hardwareMACAddress = v10->_hardwareMACAddress;
  v10->_hardwareMACAddress = (NSString *)v28;

  uint64_t v30 = [objc_alloc(MEMORY[0x263F863D0]) initWithConfig:v10->_config detailsContext:v10->_detailsContext hardwareMACAddress:v10->_hardwareMACAddress appearanceProxy:v10->_appearanceProxy];
  settingsViewController = v10->_settingsViewController;
  v10->_settingsViewController = (WFNetworkSettingsViewController *)v30;

  [(WFNetworkSettingsViewController *)v10->_settingsViewController setDeviceCapability:WFCurrentDeviceCapability()];
  [(WFNetworkSettingsViewController *)v10->_settingsViewController setDataCoordinator:v10];
  if (!v10->_settingsViewController) {
    goto LABEL_34;
  }
  v32 = [MEMORY[0x263F08A00] defaultCenter];
  [v32 addObserver:v10 selector:sel__currentNetworkDidChange_ name:@"WFInterfaceNetworkChangedNotification" object:0];

  if ([(WFDetailsContext *)v10->_detailsContext isCurrent]) {
    [(WFSettingsController *)v10 _startMontoringIPChanges];
  }
LABEL_19:

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"WFInterfaceNetworkChangedNotification" object:0];

  [(WFSettingsController *)self _stopMonitoringIPChanges];
  [(NSOperationQueue *)self->_queue cancelAllOperations];
  v4.receiver = self;
  v4.super_class = (Class)WFSettingsController;
  [(WFSettingsController *)&v4 dealloc];
}

- (void)_currentNetworkDidChange:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v10 = [v4 objectForKeyedSubscript:@"WFInterfaceNetworkKey"];

  id v5 = [(WFSettingsController *)self detailsContext];
  v6 = [v5 network];
  int v7 = [v6 isEquivalentRecord:v10];

  if (v7 != [(WFSettingsController *)self isCurrentNetwork])
  {
    self->_currentNetwork = v7;
    id v8 = [(WFSettingsController *)self network];
    v9 = [(WFSettingsController *)self _baseConfigForNetwork:v8 current:v10 != 0];

    [(WFSettingsController *)self _refreshSettingsConfig:v9];
    if (self->_currentNetwork)
    {
      if (!self->_monitorIPChanges)
      {
        [(WFSettingsController *)self _startMontoringIPChanges];
LABEL_7:

        goto LABEL_8;
      }
    }
    else if (!self->_monitorIPChanges)
    {
      goto LABEL_7;
    }
    [(WFSettingsController *)self _stopMonitoringIPChanges];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_stopMonitoringIPChanges
{
  if (self->_monitorIPChanges)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:@"WFIPMonitorStateChangedNotification" object:0];

    self->_monitorIPChanges = 0;
  }
}

- (void)_startMontoringIPChanges
{
  if (!self->_monitorIPChanges)
  {
    self->_monitorIPChanges = 1;
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    v3 = [(WFSettingsController *)self ipMonitor];
    [v4 addObserver:self selector:sel__ipStateDidChange_ name:@"WFIPMonitorStateChangedNotification" object:v3];
  }
}

- (void)_ipStateDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v5)
  {
    int v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      id v8 = [v4 userInfo];
      int v10 = 136315394;
      v11 = "-[WFSettingsController _ipStateDidChange:]";
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "%s- %@", (uint8_t *)&v10, 0x16u);
    }
  }

  if ([(WFSettingsController *)self isCurrentNetwork])
  {
    v9 = [(WFSettingsController *)self config];
    [(WFSettingsController *)self _refreshSettingsConfig:v9];
  }
}

- (id)_baseConfigForNetwork:(id)a3 current:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F863C8]);
  id v8 = [(WFSettingsController *)self detailsContext];
  if ([v8 entryContext] != 2)
  {

    goto LABEL_6;
  }
  int v9 = [v6 isHotspot20];

  if (!v9)
  {
LABEL_6:
    int v10 = [v6 ssid];
    [v7 setSsid:v10];
    goto LABEL_9;
  }
  int v10 = [(WFSettingsController *)self detailsContext];
  v11 = [v10 profile];
  __int16 v12 = [v11 displayedOperatorName];
  if (v12)
  {
    v13 = [(WFSettingsController *)self detailsContext];
    uint64_t v14 = [v13 profile];
    os_log_type_t v15 = [v14 displayedOperatorName];
    [v7 setSsid:v15];
  }
  else
  {
    v13 = [v6 ssid];
    [v7 setSsid:v13];
  }

LABEL_9:
  v16 = [(WFSettingsController *)self detailsContext];
  v17 = [v16 profile];
  v18 = [v17 displayFriendlyName];
  if (v18)
  {
    v19 = [(WFSettingsController *)self detailsContext];
    v20 = [v19 profile];
    v21 = [v20 displayFriendlyName];
    [v7 setDisplayFriendlyName:v21];
  }
  else
  {
    v19 = [v7 ssid];
    [v7 setDisplayFriendlyName:v19];
  }

  os_log_type_t v22 = [(WFSettingsController *)self ipMonitor];
  objc_msgSend(v7, "setHttpProxyConfigurable:", objc_msgSend(v22, "globalProxyIsEnabled") ^ 1);

  [v7 setCurrent:v4];
  v23 = [(WFSettingsController *)self detailsContext];
  uint64_t v24 = v23;
  if (v4)
  {
    objc_msgSend(v7, "setDiagnosable:", objc_msgSend(v23, "diagnosable"));

    v25 = [(WFSettingsController *)self detailsContext];
    uint64_t v26 = [v25 recommendations];
    [v7 setHealthRecommendations:v26];

    [v7 setForgetable:1];
    v27 = WFLogForCategory(0);
    os_log_type_t v28 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v27)
    {
      v29 = v27;
      if (os_log_type_enabled(v29, v28))
      {
        uint64_t v30 = [v7 healthRecommendations];
        *(_DWORD *)buf = 138412290;
        *(void *)v82 = v30;
        _os_log_impl(&dword_226071000, v29, v28, "Health recommendations %@", buf, 0xCu);
      }
    }
  }
  else
  {
    objc_msgSend(v7, "setJoinable:", objc_msgSend(v23, "isJoinable"));

    [v7 setCanRenewLease:0];
  }
  v31 = [(WFDetailsContext *)self->_detailsContext profile];
  v32 = WFLogForCategory(0);
  os_log_type_t v33 = OSLogForWFLogLevel(3uLL);
  BOOL v35 = (unint64_t)WFCurrentLogLevel() > 2 && v32 != 0;
  if (v31)
  {
    id v80 = v6;
    if (v35 && os_log_type_enabled(v32, v33))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v82 = v31;
      _os_log_impl(&dword_226071000, v32, v33, "Found profile %@", buf, 0xCu);
    }

    objc_msgSend(v7, "setAutoJoinConfigurable:", objc_msgSend(v31, "autoJoinConfigurable"));
    if ([v7 autoJoinConfigurable])
    {
      objc_msgSend(v7, "setAutoJoinEnabled:", objc_msgSend(v31, "isAutoJoinDisabled") ^ 1);
      if ([(WFDetailsContext *)self->_detailsContext autoJoinEnabled]) {
        [v7 setAutoJoinEnabled:1];
      }
      v36 = +[WFMetricsManager sharedManager];
      objc_super v37 = +[WFUserEvent eventWithType:7];
      [v36 processEvent:v37];

      v38 = WFLogForCategory(0);
      os_log_type_t v39 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v38)
      {
        __int16 v40 = v38;
        if (os_log_type_enabled(v40, v39))
        {
          int v41 = [v7 autoJoinEnabled];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v82 = v41;
          _os_log_impl(&dword_226071000, v40, v39, "Auto join enabled %d", buf, 8u);
        }
      }
    }
    objc_msgSend(v7, "setAutoLoginConfigurable:", objc_msgSend(v31, "autoLoginConfigurable"));
    if ([v7 autoLoginConfigurable])
    {
      objc_msgSend(v7, "setAutoLoginEnabled:", objc_msgSend(v31, "bypassCaptive") ^ 1);
      uint64_t v42 = +[WFMetricsManager sharedManager];
      v43 = +[WFUserEvent eventWithType:8];
      [v42 processEvent:v43];

      v44 = WFLogForCategory(0);
      os_log_type_t v45 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v44)
      {
        v46 = v44;
        if (os_log_type_enabled(v46, v45))
        {
          int v47 = [v7 autoLoginEnabled];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v82 = v47;
          _os_log_impl(&dword_226071000, v46, v45, "Auto login enabled %d", buf, 8u);
        }
      }
    }
    objc_msgSend(v7, "setSaveDataModeConfigurable:", objc_msgSend(v31, "saveDataModeConfigurable"));
    if ([v7 saveDataModeConfigurable])
    {
      if ([v31 lowDataMode] == 1)
      {
        BOOL v48 = 1;
      }
      else if ([v31 isPersonalHotspot])
      {
        BOOL v48 = [v31 lowDataMode] == 0;
      }
      else
      {
        BOOL v48 = 0;
      }
      [v7 setIsInSaveDataMode:v48];
      v49 = WFLogForCategory(0);
      os_log_type_t v50 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v49)
      {
        v51 = v49;
        if (os_log_type_enabled(v51, v50))
        {
          int v52 = [v7 isInSaveDataMode];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v82 = v52;
          _os_log_impl(&dword_226071000, v51, v50, "Data-saver mode enabled %d", buf, 8u);
        }
      }
    }
    v53 = [(WFSettingsController *)self detailsContext];
    objc_msgSend(v7, "setPrivacyProxyTierStatus:", objc_msgSend(v53, "privacyProxyTierStatus"));

    if ([v7 privacyProxyTierStatus])
    {
      objc_msgSend(v7, "setPrivacyProxyEnabled:", objc_msgSend(v31, "isPrivacyProxyEnabled"));
      v54 = WFLogForCategory(0);
      os_log_type_t v55 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v54)
      {
        v56 = v54;
        if (os_log_type_enabled(v56, v55))
        {
          int v57 = [v7 privacyProxyEnabled];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v82 = v57;
          _os_log_impl(&dword_226071000, v56, v55, "Privacy Proxy enabled %d", buf, 8u);
        }
      }
    }
    objc_msgSend(v7, "setNetworkQualityVisible:", objc_msgSend(v31, "networkQualityVisible"));
    if ([v7 networkQualityVisible])
    {
      [v31 networkQualityResponsiveness];
      objc_msgSend(v7, "setNetworkQualityResponsiveness:");
      v58 = [v31 networkQualityDate];
      v59 = (void *)[v58 copy];
      [v7 setNetworkQualityDate:v59];
    }
    objc_msgSend(v7, "setForgetable:", objc_msgSend(v31, "forgetable"));
    v32 = WFLogForCategory(0);
    os_log_type_t v60 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v32)
    {
      v32 = v32;
      if (os_log_type_enabled(v32, v60))
      {
        int v79 = [v7 autoJoinConfigurable];
        int v78 = [v7 autoLoginConfigurable];
        int v61 = [v7 saveDataModeConfigurable];
        int v62 = [v7 forgetable];
        uint64_t v63 = [v7 privacyProxyTierStatus];
        int v64 = [v7 networkQualityVisible];
        v65 = [(WFDetailsContext *)self->_detailsContext portalURL];
        *(_DWORD *)buf = 67110658;
        *(_DWORD *)v82 = v79;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = v78;
        *(_WORD *)v83 = 1024;
        *(_DWORD *)&v83[2] = v61;
        __int16 v84 = 1024;
        int v85 = v62;
        __int16 v86 = 2048;
        uint64_t v87 = v63;
        id v6 = v80;
        __int16 v88 = 1024;
        int v89 = v64;
        __int16 v90 = 2112;
        v91 = v65;
        _os_log_impl(&dword_226071000, v32, v60, "Network Details: Auto join configurable=%d, Auto login configurable=%d, Data-saver configurable=%d, Forgetable=%d, Privacy Proxy Configurable=%ld, Network Quality Visible=%d, portalURL='%@'", buf, 0x34u);
      }
    }
  }
  else if (v35 && os_log_type_enabled(v32, v33))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v82 = v6;
    _os_log_impl(&dword_226071000, v32, v33, "No existing profile for network %@", buf, 0xCu);
  }

  if ([v6 isAirPortBaseStation])
  {
    id v66 = v6;
    v67 = [(WFSettingsController *)self detailsContext];
    objc_msgSend(v7, "setManageable:", objc_msgSend(v67, "supportsAirportManagement"));

    v68 = WFLogForCategory(0);
    os_log_type_t v69 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v68)
    {
      v70 = v68;
      if (os_log_type_enabled(v70, v69))
      {
        int v71 = [v7 manageable];
        *(_DWORD *)buf = 136315394;
        *(void *)v82 = "-[WFSettingsController _baseConfigForNetwork:current:]";
        *(_WORD *)&v82[8] = 1024;
        *(_DWORD *)v83 = v71;
        _os_log_impl(&dword_226071000, v70, v69, "%s: airport management supported %d", buf, 0x12u);
      }
    }
    id v6 = v66;
  }
  if ([v6 isCloudSyncable]) {
    BOOL v72 = [(WFSettingsController *)self cloudSyncRunning];
  }
  else {
    BOOL v72 = 0;
  }
  [v7 setCloudSyncable:v72];
  v73 = WFLogForCategory(0);
  os_log_type_t v74 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v73)
  {
    v75 = v73;
    if (os_log_type_enabled(v75, v74))
    {
      int v76 = [v7 cloudSyncable];
      *(_DWORD *)buf = 136315394;
      *(void *)v82 = "-[WFSettingsController _baseConfigForNetwork:current:]";
      *(_WORD *)&v82[8] = 1024;
      *(_DWORD *)v83 = v76;
      _os_log_impl(&dword_226071000, v75, v74, "%s: network cloudSyncable %d", buf, 0x12u);
    }
  }
  return v7;
}

- (void)_refreshSettingsConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSettingsController *)self detailsContext];
  id v6 = [v5 interface];
  id v7 = [v6 interfaceName];

  id v8 = [WFGetSettingsOperation alloc];
  int v9 = [(WFSettingsController *)self network];
  int v10 = [v9 ssid];
  v11 = [(WFGetSettingsOperation *)v8 initWithSSID:v10 interfaceName:v7];

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__10;
  v26[4] = __Block_byref_object_dispose__10;
  __int16 v12 = v11;
  v27 = v12;
  id v13 = (id)[v4 copy];
  objc_initWeak(&location, self);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __47__WFSettingsController__refreshSettingsConfig___block_invoke;
  v19 = &unk_26478FAE0;
  v23 = v26;
  objc_copyWeak(&v24, &location);
  id v20 = v13;
  v21 = self;
  id v14 = v20;
  id v22 = v14;
  [(WFGetSettingsOperation *)v12 setCompletionBlock:&v16];
  os_log_type_t v15 = [(WFSettingsController *)self queue];
  [v15 addOperation:v12];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  _Block_object_dispose(v26, 8);
}

void __47__WFSettingsController__refreshSettingsConfig___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__WFSettingsController__refreshSettingsConfig___block_invoke_2;
  block[3] = &unk_26478FAE0;
  uint64_t v9 = *(void *)(a1 + 56);
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v10);
}

void __47__WFSettingsController__refreshSettingsConfig___block_invoke_2(uint64_t a1)
{
  uint64_t v194 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 56;
  v178 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) settings];
  uint64_t v3 = *(void *)(*(void *)v2 + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  from = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v179 = [WeakRetained ipMonitor];
  int v5 = [WeakRetained isCurrentNetwork];
  id v6 = [v178 ipv4Settings];
  v176 = v6;
  BOOL v7 = v6 != 0;
  if (v6) {
    uint64_t v8 = [v6 method];
  }
  else {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    int v9 = v5;
  }
  else {
    int v9 = 0;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = v8;
  }
  int v174 = v7;
  if (v9 == 1) {
    uint64_t v10 = [v179 ipv4ConfigMethod];
  }
  switch(v10)
  {
    case 1:
    case 3:
    case 5:
      [*(id *)(a1 + 32) setIpv4Config:v10 == 5];
      if (v10 == 5 || ![WeakRetained isCurrentNetwork])
      {
        id v14 = WFLogForCategory(0);
        os_log_type_t v15 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v14)
        {
          uint64_t v16 = v14;
          if (os_log_type_enabled(v16, v15))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_226071000, v16, v15, "IPv4 config is BootP", buf, 2u);
          }
        }
      }
      else
      {
        v11 = WFLogForCategory(0);
        os_log_type_t v12 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v11)
        {
          id v13 = v11;
          if (os_log_type_enabled(v13, v12))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_226071000, v13, v12, "IPv4 config is automatic/DHCP", buf, 2u);
          }
        }
        [*(id *)(a1 + 32) setCanRenewLease:1];
      }
      if (v5)
      {
        uint64_t v17 = [*(id *)(a1 + 40) detailsContext];
        v18 = [v17 interface];
        v19 = [v18 IPv4Addresses];

        if (v19)
        {
          id v20 = [v19 firstObject];
          [*(id *)(a1 + 32) setIpv4Address:v20];

          v21 = WFLogForCategory(0);
          os_log_type_t v22 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v21)
          {
            v23 = v21;
            if (os_log_type_enabled(v23, v22))
            {
              id v24 = [*(id *)(a1 + 32) ipv4Address];
              *(_DWORD *)buf = 138412290;
              v189 = v24;
              _os_log_impl(&dword_226071000, v23, v22, "IPv4 Address %@", buf, 0xCu);
            }
          }
        }
        v25 = [*(id *)(a1 + 40) detailsContext];
        uint64_t v26 = [v25 interface];
        v27 = [v26 IPv4RouterAddress];

        if (v27)
        {
          [*(id *)(a1 + 32) setIpv4RouterAddress:v27];
          os_log_type_t v28 = WFLogForCategory(0);
          os_log_type_t v29 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v28)
          {
            uint64_t v30 = v28;
            if (os_log_type_enabled(v30, v29))
            {
              v31 = [*(id *)(a1 + 32) ipv4RouterAddress];
              *(_DWORD *)buf = 138412290;
              v189 = v31;
              _os_log_impl(&dword_226071000, v30, v29, "IPv4 Router %@", buf, 0xCu);
            }
          }
        }
        v32 = [*(id *)(a1 + 40) detailsContext];
        os_log_type_t v33 = [v32 interface];
        v34 = [v33 IPv4SubnetMasks];

        if (v34)
        {
          BOOL v35 = [v34 firstObject];
          [*(id *)(a1 + 32) setIpv4SubnetMask:v35];

          v36 = WFLogForCategory(0);
          os_log_type_t v37 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v36)
          {
            v38 = v36;
            if (os_log_type_enabled(v38, v37))
            {
              os_log_type_t v39 = [*(id *)(a1 + 32) ipv4SubnetMask];
              *(_DWORD *)buf = 138412290;
              v189 = v39;
              _os_log_impl(&dword_226071000, v38, v37, "IPv4 Subnet Mask %@", buf, 0xCu);
            }
          }
        }
        BOOL v40 = v10 == 5;
        int v41 = [v179 ipv4DHCPClientID];
        if (!v41) {
          BOOL v40 = 1;
        }

        if (!v40)
        {
          uint64_t v42 = [v179 ipv4DHCPClientID];
          [*(id *)(a1 + 32) setDhcpClientID:v42];

          v43 = WFLogForCategory(0);
          os_log_type_t v44 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v43)
          {
            os_log_type_t v45 = v43;
            if (os_log_type_enabled(v45, v44))
            {
              v46 = [*(id *)(a1 + 32) dhcpClientID];
              *(_DWORD *)buf = 138412290;
              v189 = v46;
              _os_log_impl(&dword_226071000, v45, v44, "IPv4 DHCP Client ID %@", buf, 0xCu);
            }
          }
        }
        int v47 = [*(id *)(a1 + 40) network];
        BOOL v48 = [v47 carPlayType] == 2;

        if (v48)
        {
          v49 = [v179 DHCPLeaseExpirationDate];
          [*(id *)(a1 + 32) setDhcpLeaseExpirationDate:v49];
        }
        goto LABEL_91;
      }
      goto LABEL_92;
    case 4:
      [*(id *)(a1 + 32) setIpv4Config:2];
      os_log_type_t v50 = WFLogForCategory(0);
      os_log_type_t v51 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v50)
      {
        int v52 = v50;
        if (os_log_type_enabled(v52, v51))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226071000, v52, v51, "IPv4 config is manual", buf, 2u);
        }
      }
      if (v176)
      {
        v53 = [v176 addresses];

        if (v53)
        {
          v54 = [v176 addresses];
          v19 = [v54 firstObject];
        }
        else
        {
          v19 = 0;
        }
        int v57 = [v176 subnetMasks];

        if (v57)
        {
          v58 = [v176 subnetMasks];
          v34 = [v58 firstObject];
        }
        else
        {
          v34 = 0;
        }
        uint64_t v59 = [v176 router];
      }
      else
      {
        if (!v5)
        {
          v34 = 0;
          v27 = 0;
          v19 = 0;
          goto LABEL_83;
        }
        os_log_type_t v55 = [v179 ipv4Addresses];

        if (v55)
        {
          v56 = [v179 ipv4Addresses];
          v19 = [v56 firstObject];
        }
        else
        {
          v19 = 0;
        }
        os_log_type_t v60 = [v179 ipv4SubnetMasks];

        if (v60)
        {
          int v61 = [v179 ipv4SubnetMasks];
          v34 = [v61 firstObject];
        }
        else
        {
          v34 = 0;
        }
        uint64_t v59 = [v179 ipv4Router];
      }
      v27 = (void *)v59;
LABEL_83:
      int v62 = WFLogForCategory(0);
      os_log_type_t v63 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v62)
      {
        int v64 = v62;
        if (os_log_type_enabled(v64, v63))
        {
          v65 = @"Setup:";
          *(_DWORD *)buf = 138413058;
          if (v176) {
            v65 = @"Custom:";
          }
          v189 = (const char *)v65;
          __int16 v190 = 2112;
          v191 = v19;
          __int16 v192 = 2112;
          *(void *)v193 = v27;
          *(_WORD *)&v193[8] = 2112;
          *(void *)&v193[10] = v34;
          _os_log_impl(&dword_226071000, v64, v63, "IPv4 (%@) Manual address %@, router %@, subnet mask: %@", buf, 0x2Au);
        }
      }
      [*(id *)(a1 + 32) setIpv4AddressManual:v19];
      [*(id *)(a1 + 32) setIpv4RouterAddressManual:v27];
      [*(id *)(a1 + 32) setIpv4SubnetMaskManual:v34];
LABEL_91:

LABEL_92:
      id v66 = [v178 ipv6Settings];
      v175 = v66;
      if (v66) {
        uint64_t v67 = [v66 method];
      }
      else {
        uint64_t v67 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v67 == 0x7FFFFFFFFFFFFFFFLL) {
        int v68 = v5;
      }
      else {
        int v68 = 0;
      }
      if (v68 == 1)
      {
        uint64_t v67 = [v179 ipv6ConfigMethod];
      }
      else if (!v5)
      {
        goto LABEL_153;
      }
      if (!v67) {
        goto LABEL_153;
      }
      os_log_type_t v69 = +[WFMetricsManager sharedManager];
      v70 = +[WFUserEvent eventWithType:9];
      [v69 processEvent:v70];

      switch(v67)
      {
        case 3:
          [*(id *)(a1 + 32) setIpv6Config:1];
          v75 = WFLogForCategory(0);
          os_log_type_t v76 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v75)
          {
            v77 = v75;
            if (os_log_type_enabled(v77, v76))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v77, v76, "IPv6 config is manual", buf, 2u);
            }
          }
          if (!v175) {
            goto LABEL_134;
          }
          int v78 = [v175 addresses];

          if (v78)
          {
            int v79 = [v175 addresses];
            id v80 = [v79 firstObject];
            [*(id *)(a1 + 32) setIpv6AddressManual:v80];
          }
          v81 = [v175 router];

          if (v81)
          {
            v82 = [v175 router];
            [*(id *)(a1 + 32) setIpv6RouterAddressManual:v82];
          }
          v83 = [v175 prefixLengths];

          if (!v83) {
            goto LABEL_134;
          }
          int v71 = [v175 prefixLengths];
          v73 = [v71 firstObject];
          [*(id *)(a1 + 32) setIpv6PrefixLengthManual:v73];
          goto LABEL_132;
        case 2:
          [*(id *)(a1 + 32) setIpv6Config:2];
          int v71 = WFLogForCategory(0);
          os_log_type_t v72 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() < 4 || !v71) {
            goto LABEL_133;
          }
          v73 = v71;
          if (!os_log_type_enabled(v73, v72)) {
            goto LABEL_131;
          }
          *(_WORD *)buf = 0;
          os_log_type_t v74 = "IPv6 config is link local";
          break;
        case 1:
          [*(id *)(a1 + 32) setIpv6Config:0];
          int v71 = WFLogForCategory(0);
          os_log_type_t v72 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() < 4 || !v71) {
            goto LABEL_133;
          }
          v73 = v71;
          if (!os_log_type_enabled(v73, v72)) {
            goto LABEL_131;
          }
          *(_WORD *)buf = 0;
          os_log_type_t v74 = "IPv6 config is automatic";
          break;
        default:
          int v71 = WFLogForCategory(0);
          os_log_type_t v87 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v71) {
            goto LABEL_133;
          }
          v73 = v71;
          if (!os_log_type_enabled(v73, v87)) {
            goto LABEL_131;
          }
          uint64_t v88 = [v179 ipv6ConfigMethod];
          *(_DWORD *)buf = 134349056;
          v189 = (const char *)v88;
          os_log_type_t v74 = "Unknown IPv6 configuration method %{public}lu";
          __int16 v84 = v73;
          os_log_type_t v85 = v87;
          uint32_t v86 = 12;
          goto LABEL_130;
      }
      __int16 v84 = v73;
      os_log_type_t v85 = v72;
      uint32_t v86 = 2;
LABEL_130:
      _os_log_impl(&dword_226071000, v84, v85, v74, buf, v86);
LABEL_131:
      int v71 = v73;
LABEL_132:

LABEL_133:
LABEL_134:
      int v89 = [v179 ipv6Addresses];
      if (v89)
      {
      }
      else
      {
        __int16 v90 = [v179 ipv6Router];
        BOOL v91 = v90 == 0;

        if (v91) {
          goto LABEL_153;
        }
      }
      uint64_t v92 = [v179 ipv6Addresses];
      [*(id *)(a1 + 32) setIpv6Addresses:v92];

      v93 = [v179 ipv6PrefixLengths];
      [*(id *)(a1 + 32) setIpv6PrefixLengths:v93];

      v94 = [v179 ipv6Router];
      [*(id *)(a1 + 32) setIpv6RouterAddress:v94];

      v95 = WFLogForCategory(0);
      os_log_type_t v96 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v95)
      {
        v97 = v95;
        if (os_log_type_enabled(v97, v96))
        {
          v98 = [*(id *)(a1 + 32) ipv6Addresses];
          *(_DWORD *)buf = 138412290;
          v189 = v98;
          _os_log_impl(&dword_226071000, v97, v96, "IPv6 addresses %@", buf, 0xCu);
        }
      }

      v99 = WFLogForCategory(0);
      os_log_type_t v100 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v99)
      {
        v101 = v99;
        if (os_log_type_enabled(v101, v100))
        {
          v102 = [*(id *)(a1 + 32) ipv6PrefixLengths];
          *(_DWORD *)buf = 138412290;
          v189 = v102;
          _os_log_impl(&dword_226071000, v101, v100, "IPv6 prefix lengths %@", buf, 0xCu);
        }
      }

      v103 = WFLogForCategory(0);
      os_log_type_t v104 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v103)
      {
        v105 = v103;
        if (os_log_type_enabled(v105, v104))
        {
          v106 = [*(id *)(a1 + 32) ipv6RouterAddress];
          *(_DWORD *)buf = 138412290;
          v189 = v106;
          _os_log_impl(&dword_226071000, v105, v104, "IPv6 router address %@", buf, 0xCu);
        }
      }

LABEL_153:
      v107 = [v178 dnsSettings];
      v108 = v107;
      if (v107)
      {
        v109 = [v107 searchDomains];

        if (v109)
        {
          v173 = [v108 searchDomains];
        }
        else
        {
          v173 = 0;
        }
        v118 = [v108 serverAddresses];

        if (v118)
        {
          v172 = [v108 serverAddresses];
        }
        else
        {
          v172 = 0;
        }
        uint64_t v110 = 1;
        int v174 = 1;
        goto LABEL_180;
      }
      if (!v5)
      {
        v172 = 0;
        v173 = 0;
        uint64_t v110 = 0;
        goto LABEL_180;
      }
      LODWORD(v110) = [v179 isUsingCustomDNSSettings];
      v111 = [v179 dnsSearchDomains];
      uint64_t v112 = [v179 dnsDomainName];
      v113 = (char *)v112;
      if (v111)
      {
        id v114 = v111;

        v115 = WFLogForCategory(0);
        os_log_type_t v116 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() < 4 || !v115) {
          goto LABEL_175;
        }
        v115 = v115;
        if (!os_log_type_enabled(v115, v116))
        {
LABEL_174:

LABEL_175:
          goto LABEL_176;
        }
        *(_DWORD *)buf = 138412290;
        v189 = (const char *)v114;
        v117 = "Using dnsSearchDomains (%@) for dns info";
LABEL_173:
        _os_log_impl(&dword_226071000, v115, v116, v117, buf, 0xCu);
        goto LABEL_174;
      }
      if (v112)
      {
        uint64_t v187 = v112;
        id v114 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v187 count:1];
        v115 = WFLogForCategory(0);
        os_log_type_t v116 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() < 4 || !v115) {
          goto LABEL_175;
        }
        v115 = v115;
        if (!os_log_type_enabled(v115, v116)) {
          goto LABEL_174;
        }
        *(_DWORD *)buf = 138412290;
        v189 = v113;
        v117 = "Using dnsDomainName (%@) for dns info";
        goto LABEL_173;
      }
LABEL_176:
      v119 = [v179 dnsServerAddresses];

      if (v119)
      {
        v172 = [v179 dnsServerAddresses];
      }
      else
      {
        v172 = 0;
      }

      v173 = 0;
      uint64_t v110 = v110;
LABEL_180:
      v120 = WFLogForCategory(0);
      os_log_type_t v121 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v120)
      {
        v122 = v120;
        if (os_log_type_enabled(v122, v121))
        {
          uint64_t v123 = [*(id *)(a1 + 32) dnsConfig];
          v124 = @"Manual";
          if (!v123) {
            v124 = @"Automatic";
          }
          *(_DWORD *)buf = 138412290;
          v189 = (const char *)v124;
          _os_log_impl(&dword_226071000, v122, v121, "DNS config is %@", buf, 0xCu);
        }
      }
      [*(id *)(a1 + 32) setDnsConfig:v110];
      v125 = WFLogForCategory(0);
      os_log_type_t v126 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v125)
      {
        v127 = v125;
        if (os_log_type_enabled(v127, v126))
        {
          v128 = [*(id *)(a1 + 32) dnsSearchDomains];
          *(_DWORD *)buf = 138412290;
          v189 = v128;
          _os_log_impl(&dword_226071000, v127, v126, "DNS search domains %@", buf, 0xCu);
        }
      }

      [*(id *)(a1 + 32) setDnsSearchDomains:v173];
      v129 = WFLogForCategory(0);
      os_log_type_t v130 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v129)
      {
        v131 = v129;
        if (os_log_type_enabled(v131, v130))
        {
          v132 = [*(id *)(a1 + 32) dnsServerAddresses];
          *(_DWORD *)buf = 138412290;
          v189 = v132;
          _os_log_impl(&dword_226071000, v131, v130, "DNS server addresses %@", buf, 0xCu);
        }
      }

      [*(id *)(a1 + 32) setDnsServerAddresses:v172];
      v133 = [v178 proxySettings];
      v134 = v133;
      if (!v133)
      {
        if (!v5 || ![v179 isUsingCustomProxySetting]) {
          goto LABEL_213;
        }
        int location = [v179 httpProxyAutoConfigured];
        if (location)
        {
          v171 = [v179 httpProxyAutoConfigURL];
          v141 = WFLogForCategory(0);
          os_log_type_t v142 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v141)
          {
            v141 = v141;
            if (os_log_type_enabled(v141, v142))
            {
              *(_WORD *)buf = 0;
              uint64_t v135 = 2;
              _os_log_impl(&dword_226071000, v141, v142, "Using automatic HTTP proxy settings", buf, 2u);
            }
            else
            {
              uint64_t v135 = 2;
            }
LABEL_232:

            goto LABEL_233;
          }
          uint64_t v135 = 2;
        }
        else
        {
          v141 = WFLogForCategory(0);
          os_log_type_t v151 = OSLogForWFLogLevel(4uLL);
          v171 = 0;
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v141)
          {
            v141 = v141;
            if (os_log_type_enabled(v141, v151))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v141, v151, "Using manual HTTP proxy settings", buf, 2u);
            }
            v171 = 0;
            uint64_t v135 = 1;
            goto LABEL_232;
          }
          uint64_t v135 = 1;
        }
LABEL_233:

        v152 = [v179 httpProxyServer];

        if (v152)
        {
          v136 = [v179 httpProxyServer];
        }
        else
        {
          v136 = 0;
        }
        v153 = [v179 httpProxyPort];
        BOOL v154 = v153 == 0;

        if (v154)
        {
          v155 = [v179 httpProxyPort];
          v137 = [v155 stringValue];
        }
        else
        {
          v137 = 0;
        }
        if ([v179 httpProxyIsAuthenticated]) {
          uint64_t v138 = [v179 httpProxyIsAuthenticated];
        }
        else {
          uint64_t v138 = 0;
        }
        v139 = [v179 httpProxyUsername];

        if (v139)
        {
          v139 = [v179 httpProxyUsername];
        }
        v156 = WFLogForCategory(0);
        os_log_type_t type = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v156)
        {
          v157 = v156;
          if (os_log_type_enabled(v157, type))
          {
            int v158 = [*(id *)(a1 + 32) httpProxyAuthenticationRequired];
            *(_DWORD *)buf = 138413058;
            v189 = v136;
            __int16 v190 = 2112;
            v191 = v137;
            __int16 v192 = 1024;
            *(_DWORD *)v193 = v158;
            *(_WORD *)&v193[4] = 2112;
            *(void *)&v193[6] = v139;
            _os_log_impl(&dword_226071000, v157, type, "HTTP proxy server %@ port %@ authenticated %d username %@", buf, 0x26u);
          }
        }
        if ((v138 & (location ^ 1)) == 1)
        {
          v159 = WFLogForCategory(0);
          os_log_type_t v160 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v159)
          {
            v161 = v159;
            if (os_log_type_enabled(v161, v160))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v161, v160, "Fetching HTTP proxy password from keychain", buf, 2u);
            }
          }
          v162 = +[WFProxyKeychainOperation getPasswordOperationForHost:v136 port:v137 username:v139];
          if (v162)
          {
            objc_initWeak((id *)buf, v162);
            v180[0] = MEMORY[0x263EF8330];
            v180[1] = 3221225472;
            v180[2] = __47__WFSettingsController__refreshSettingsConfig___block_invoke_31;
            v180[3] = &unk_26478FAB8;
            objc_copyWeak(&v185, (id *)buf);
            objc_copyWeak(&v186, from);
            id v181 = *(id *)(a1 + 48);
            v182 = v136;
            id v183 = v137;
            id v184 = v139;
            [v162 setCompletionBlock:v180];
            id v163 = objc_loadWeakRetained(from);
            v164 = [v163 queue];
            [v164 addOperation:v162];

            objc_destroyWeak(&v186);
            objc_destroyWeak(&v185);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            v165 = WFLogForCategory(0);
            os_log_type_t v166 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v165)
            {
              v167 = v165;
              if (os_log_type_enabled(v167, v166))
              {
                *(_DWORD *)buf = 138412802;
                v189 = v136;
                __int16 v190 = 2112;
                v191 = v137;
                __int16 v192 = 2112;
                *(void *)v193 = v139;
                _os_log_impl(&dword_226071000, v167, v166, "Failed to create WFProxyKeychainOperation for host: %@ port: %@ username: %@", buf, 0x20u);
              }
            }
          }

          v140 = 0;
          uint64_t v138 = 1;
          uint64_t v135 = 1;
        }
        else
        {
          v140 = 0;
        }
LABEL_203:
        [*(id *)(a1 + 32) setHttpProxyConfig:v135];
        [*(id *)(a1 + 32) setHttpProxyServerAddress:v136];
        [*(id *)(a1 + 32) setHttpProxyServerPort:v137];
        [*(id *)(a1 + 32) setHttpProxyAuthenticationRequired:v138];
        [*(id *)(a1 + 32) setHttpProxyUsername:v139];
        [*(id *)(a1 + 32) setHttpProxyPassword:v140];
        [*(id *)(a1 + 32) setHttpProxyConfigPAC:v171];
        if (!v174) {
          goto LABEL_221;
        }
        goto LABEL_214;
      }
      if ([v133 customProxy])
      {
        if ([v134 isAutomatic]) {
          uint64_t v135 = 2;
        }
        else {
          uint64_t v135 = 1;
        }
        v136 = [v134 server];
        v137 = [v134 port];
        uint64_t v138 = [v134 authenticated];
        v139 = [v134 username];
        v140 = [v134 password];
        v171 = [v134 autoConfigureURL];
        int v174 = 1;
        goto LABEL_203;
      }
      LOBYTE(v174) = 1;
LABEL_213:
      [*(id *)(a1 + 32) setHttpProxyConfig:0];
      [*(id *)(a1 + 32) setHttpProxyServerAddress:0];
      [*(id *)(a1 + 32) setHttpProxyServerPort:0];
      [*(id *)(a1 + 32) setHttpProxyAuthenticationRequired:0];
      [*(id *)(a1 + 32) setHttpProxyUsername:0];
      [*(id *)(a1 + 32) setHttpProxyPassword:0];
      [*(id *)(a1 + 32) setHttpProxyConfigPAC:0];
      v140 = 0;
      v136 = 0;
      v137 = 0;
      v139 = 0;
      v171 = 0;
      if ((v174 & 1) == 0) {
        goto LABEL_221;
      }
LABEL_214:
      if ([*(id *)(a1 + 40) cloudSyncRunning])
      {
        v143 = WFLogForCategory(0);
        os_log_type_t v144 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v143)
        {
          v145 = v143;
          if (os_log_type_enabled(v145, v144))
          {
            *(_DWORD *)buf = 136315138;
            v189 = "-[WFSettingsController _refreshSettingsConfig:]_block_invoke";
            _os_log_impl(&dword_226071000, v145, v144, "%s: network has custom settings and is not cloud syncable", buf, 0xCu);
          }
        }
        v146 = [WeakRetained config];
        [v146 setCloudSyncable:0];
      }
LABEL_221:
      v147 = *(void **)(a1 + 32);
      v148 = [WeakRetained config];
      LOBYTE(v147) = [v147 isEqual:v148];

      if ((v147 & 1) == 0)
      {
        [WeakRetained setConfig:*(void *)(a1 + 32)];
        v149 = [WeakRetained settingsViewController];
        [v149 refreshConfig:*(void *)(a1 + 32)];

        v150 = [MEMORY[0x263F08A00] defaultCenter];
        [v150 postNotificationName:@"WFSettingsControllerDidRefreshConfigNotificationName" object:*(void *)(a1 + 40)];
      }
      return;
    default:
      goto LABEL_92;
  }
}

void __47__WFSettingsController__refreshSettingsConfig___block_invoke_31(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [WeakRetained error];
  if (v4)
  {

LABEL_3:
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 error];

    if (v6)
    {
      BOOL v7 = WFLogForCategory(0);
      os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v7)
      {
        int v9 = v7;
        if (os_log_type_enabled(v9, v8))
        {
          id v10 = objc_loadWeakRetained(v2);
          v11 = [v10 error];
          *(_DWORD *)buf = 138543362;
          uint64_t v26 = v11;
          _os_log_impl(&dword_226071000, v9, v8, "WFProxyKeychainOperation errro %{public}@", buf, 0xCu);
        }
      }
    }
    os_log_type_t v12 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      id v14 = *(void **)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      uint64_t v30 = v16;
      _os_log_impl(&dword_226071000, v12, v13, "Failed to get password for host: %@ port: %@ username: %@", buf, 0x20u);
    }

    return;
  }
  id v17 = objc_loadWeakRetained(v2);
  v18 = [v17 password];

  if (!v18) {
    goto LABEL_3;
  }
  v19 = WFLogForCategory(0);
  os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v19 && os_log_type_enabled(v19, v20))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226071000, v19, v20, "Successfully fetched HTTP proxy password from keychain, updating config", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__WFSettingsController__refreshSettingsConfig___block_invoke_32;
  block[3] = &unk_26478E8F0;
  objc_copyWeak(&v23, (id *)(a1 + 72));
  objc_copyWeak(&v24, v2);
  id v22 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
}

void __47__WFSettingsController__refreshSettingsConfig___block_invoke_32(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained config];
  id v5 = [v4 httpProxyPassword];
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v7 = [v6 password];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    id v10 = [v9 password];
    id v11 = objc_loadWeakRetained(v2);
    os_log_type_t v12 = [v11 config];
    [v12 setHttpProxyPassword:v10];

    id v14 = objc_loadWeakRetained(v2);
    os_log_type_t v13 = [v14 settingsViewController];
    [v13 refreshConfig:*(void *)(a1 + 32)];
  }
}

- (void)networkSettingsViewController:(id)a3 saveConfig:(id)a4 errorHandler:(id)a5
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  id v147 = a3;
  id v164 = a4;
  v156 = (void (**)(id, uint64_t))a5;
  val = self;
  char v8 = [(WFSettingsController *)self config];
  v148 = [v8 changesBetweenConfig:v164];

  if ([v148 count])
  {
    v157 = objc_msgSend(MEMORY[0x263EFF980], "array", v147);
    long long v170 = 0u;
    long long v171 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    obj = v148;
    uint64_t v162 = [obj countByEnumeratingWithState:&v168 objects:v176 count:16];
    if (v162)
    {
      v165 = 0;
      uint64_t v160 = *MEMORY[0x263F86408];
      uint64_t v161 = *(void *)v169;
      uint64_t v158 = *MEMORY[0x263F86410];
      uint64_t v155 = *MEMORY[0x263F86400];
      uint64_t v153 = *MEMORY[0x263F86418];
      int64x2_t v154 = vdupq_n_s64(2uLL);
      int8x16_t v152 = (int8x16_t)vdupq_n_s64(5uLL);
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v169 != v161) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v168 + 1) + 8 * v9);
        if ([v10 isEqualToString:v160]) {
          break;
        }
        if ([v10 isEqualToString:v158])
        {
          id v11 = [obj objectForKey:v10];
          v21 = WFLogForCategory(0);
          os_log_type_t v22 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v21 && os_log_type_enabled(v21, v22))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v178 = v11;
            _os_log_impl(&dword_226071000, v21, v22, "IPv6 changes: %@", buf, 0xCu);
          }

          if (([v164 validIPv6Configuration] & 1) == 0)
          {
            id v23 = WFLogForCategory(0);
            os_log_type_t v46 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v23 && os_log_type_enabled(v23, v46))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v178 = v11;
              _os_log_impl(&dword_226071000, v23, v46, "Disregarding ipv6 edits %@, invalid configuration", buf, 0xCu);
            }
            goto LABEL_165;
          }
          id v23 = [v11 objectForKey:@"ipv6Config"];
          if (v23 || (uint64_t v24 = [0 integerValue], v24 == -1)) {
            uint64_t v24 = [v164 ipv6Config];
          }
          switch(v24)
          {
            case 2:
              uint64_t v59 = +[WFSettingsIPV6 linkLocalConfig];
              [v157 addObject:v59];
              break;
            case 1:
              uint64_t v59 = [v164 ipv6AddressManual];
              int v61 = [v11 objectForKey:@"ipv6AddressManual"];

              if (v61)
              {
                uint64_t v62 = [v11 objectForKey:@"ipv6AddressManual"];

                uint64_t v59 = (void *)v62;
              }
              os_log_type_t v63 = [v164 ipv6PrefixLengthManual];
              int v64 = [v11 objectForKey:@"ipv6PrefixLengthManual"];

              if (v64)
              {
                uint64_t v65 = [v11 objectForKey:@"ipv6PrefixLengthManual"];

                os_log_type_t v63 = (void *)v65;
              }
              id v66 = [v164 ipv6RouterAddressManual];
              uint64_t v67 = [v11 objectForKey:@"ipv6RouterAddressManual"];

              if (v67)
              {
                uint64_t v68 = [v11 objectForKey:@"ipv6RouterAddressManual"];

                id v66 = (void *)v68;
              }
              os_log_type_t v69 = [WFSettingsIPV6 alloc];
              if (v59)
              {
                v173 = v59;
                v150 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v173 count:1];
                v70 = v150;
                if (v63) {
                  goto LABEL_94;
                }
LABEL_147:
                os_log_type_t v72 = [(WFSettingsIPV6 *)v69 initWithMethod:3 addresses:v70 prefixLengths:0 router:v66];
                if (v59) {
                  goto LABEL_148;
                }
              }
              else
              {
                v70 = 0;
                if (!v63) {
                  goto LABEL_147;
                }
LABEL_94:
                v172 = v63;
                int v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v172 count:1];
                os_log_type_t v72 = [(WFSettingsIPV6 *)v69 initWithMethod:3 addresses:v70 prefixLengths:v71 router:v66];

                if (v59) {
LABEL_148:
                }
              }
              if (v72)
              {
                [v157 addObject:v72];
              }
              else
              {
                v98 = WFLogForCategory(0);
                os_log_type_t v99 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v98 && os_log_type_enabled(v98, v99))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v178 = v11;
                  _os_log_impl(&dword_226071000, v98, v99, "Failed to create WFSettingsIPV6 from ipv6Changes %@", buf, 0xCu);
                }
              }
              break;
            case 0:
              uint64_t v59 = +[WFSettingsIPV6 automaticConfig];
              [v157 addObject:v59];
              break;
            default:
LABEL_158:
              os_log_type_t v100 = [(WFSettingsController *)val config];
              uint64_t v101 = [v100 ipv6Config];
              v102.i64[0] = v24;
              v102.i64[1] = v101;
              int64x2_t v103 = vdupq_n_s64(1uLL);
              int64x2_t v104 = vdupq_n_s64(2uLL);
              int8x16_t v105 = (int8x16_t)vcgtq_u64((uint64x2_t)v104, (uint64x2_t)vaddq_s64(v102, v103));
              int8x16_t v106 = (int8x16_t)vceqq_s64(v102, v104);
              int8x16_t v107 = vbslq_s8(v105, (int8x16_t)vdupq_n_s64(3uLL), vbslq_s8((int8x16_t)vceqq_s64(v102, v103), (int8x16_t)vdupq_n_s64(4uLL), vornq_s8(vandq_s8(v106, v152), v106)));
              uint64_t v108 = v107.i64[1];
              uint64_t v109 = v107.i64[0];
              if (v107.i64[0] == v107.i64[1])
              {
                uint64_t v110 = WFLogForCategory(0);
                os_log_type_t v111 = OSLogForWFLogLevel(4uLL);
                if ((unint64_t)WFCurrentLogLevel() >= 4 && v110 && os_log_type_enabled(v110, v111))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v178 = v109;
                  *(_WORD *)&v178[4] = 1024;
                  *(_DWORD *)&v178[6] = v109;
                  _os_log_impl(&dword_226071000, v110, v111, "Dropping IPv6 configure event as the types didn't change %d -> %d", buf, 0xEu);
                }
              }
              else
              {
                uint64_t v110 = +[WFMetricsManager sharedManager];
                uint64_t v112 = +[WFUserConfigureEvent configureEventWithType:1 new:v109 old:v108];
                [v110 processEvent:v112];
              }
LABEL_165:

              goto LABEL_166;
          }

          goto LABEL_158;
        }
        if ([v10 isEqualToString:v155])
        {
          id v11 = [obj objectForKey:v10];
          v25 = WFLogForCategory(0);
          os_log_type_t v26 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v25 && os_log_type_enabled(v25, v26))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v178 = v11;
            _os_log_impl(&dword_226071000, v25, v26, "DNS changes: %@", buf, 0xCu);
          }

          uint64_t v27 = [v164 dnsConfig];
          uint64_t v28 = [v11 objectForKey:@"dnsConfig"];

          if (v28)
          {
            __int16 v29 = [v11 objectForKey:@"dnsConfig"];
            uint64_t v27 = [v29 integerValue];
          }
          if (v27)
          {
            uint64_t v30 = [v11 objectForKey:@"dnsServerAddresses"];
            if (!v30)
            {
              uint64_t v30 = [v164 dnsServerAddresses];
            }
            uint64_t v31 = [v11 objectForKey:@"dnsSearchDomains"];
            if (!v31)
            {
              uint64_t v31 = [v164 dnsSearchDomains];
            }
            v32 = [[WFSettingsDNS alloc] initWithServerAddresses:v30 searchDomains:v31];
            if (v32)
            {
              [v157 addObject:v32];
            }
            else
            {
              v75 = WFLogForCategory(0);
              os_log_type_t v76 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v75 && os_log_type_enabled(v75, v76))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v178 = v11;
                _os_log_impl(&dword_226071000, v75, v76, "Failed to create WFSettingsDNS from dnsChanges %@", buf, 0xCu);
              }
            }
            uint64_t v60 = 7;
          }
          else
          {
            uint64_t v30 = +[WFSettingsDNS automaticConfig];
            [v157 addObject:v30];
            uint64_t v60 = 6;
          }

          v77 = [(WFSettingsController *)val config];
          if ([v77 dnsConfig]) {
            uint64_t v78 = 7;
          }
          else {
            uint64_t v78 = 6;
          }
          if (v60 == v78)
          {
            int v79 = WFLogForCategory(0);
            os_log_type_t v80 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v79 && os_log_type_enabled(v79, v80))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v178 = v60;
              *(_WORD *)&v178[4] = 1024;
              *(_DWORD *)&v178[6] = v60;
              _os_log_impl(&dword_226071000, v79, v80, "Dropping DNS configure event as the types didn't change %d -> %d", buf, 0xEu);
            }
          }
          else
          {
            int v79 = +[WFMetricsManager sharedManager];
            v81 = +[WFUserConfigureEvent configureEventWithType:2 new:v60 old:v78];
            [v79 processEvent:v81];
          }
          goto LABEL_166;
        }
        if ([v10 isEqualToString:v153])
        {
          id v11 = [obj objectForKey:v10];
          v36 = (void *)[v11 mutableCopy];
          os_log_type_t v37 = [v36 allKeys];
          int v38 = [v37 containsObject:@"httpProxyPassword"];

          if (v38) {
            [v36 setObject:@"<REDACTED>" forKey:@"httpProxyPassword"];
          }
          os_log_type_t v39 = WFLogForCategory(0);
          os_log_type_t v40 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v39 && os_log_type_enabled(v39, v40))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v178 = v36;
            _os_log_impl(&dword_226071000, v39, v40, "Proxy changes: %@", buf, 0xCu);
          }

          if (([v164 validProxyConfiguration] & 1) == 0)
          {
            v73 = WFLogForCategory(0);
            os_log_type_t v74 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v73 && os_log_type_enabled(v73, v74))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v178 = v11;
              _os_log_impl(&dword_226071000, v73, v74, "Disregarding proxy edits %@, invalid configuration", buf, 0xCu);
            }
            goto LABEL_210;
          }
          int v41 = [v11 objectForKey:@"httpProxyConfig"];

          if (!v41
            || ([v11 objectForKey:@"httpProxyConfig"],
                uint64_t v42 = objc_claimAutoreleasedReturnValue(),
                uint64_t v43 = [v42 integerValue],
                v42,
                v43 == -1))
          {
            uint64_t v43 = [v164 httpProxyConfig];
          }
          switch(v43)
          {
            case 2:
              os_log_type_t v44 = [v11 objectForKey:@"httpProxyConfigPAC"];
              if (![v44 length])
              {
                v113 = WFLogForCategory(0);
                os_log_type_t v114 = OSLogForWFLogLevel(3uLL);
                if ((unint64_t)WFCurrentLogLevel() >= 3 && v113 && os_log_type_enabled(v113, v114))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_226071000, v113, v114, "No httpProxyConfigPAC supplied, using auto discovery", buf, 2u);
                }
              }
              v115 = [[WFSettingsProxy alloc] initWithAutoConfigureURL:v44];
              [v157 addObject:v115];

              uint64_t v45 = 9;
              break;
            case 1:
              os_log_type_t v44 = [v11 objectForKey:@"httpProxyServerAddress"];
              if (!v44)
              {
                os_log_type_t v44 = [v164 httpProxyServerAddress];
              }
              v149 = [v11 objectForKey:@"httpProxyServerPort"];
              if (!v149)
              {
                v149 = [v164 httpProxyServerPort];
              }
              os_log_type_t v116 = [v11 objectForKey:@"httpProxyUsername"];
              if (!v116)
              {
                os_log_type_t v116 = [v164 httpProxyUsername];
              }
              v117 = [v11 objectForKey:@"httpProxyPassword"];
              if (!v117)
              {
                v117 = [v164 httpProxyPassword];
              }
              if (![v44 length]
                || ![v149 length]
                || [v164 httpProxyAuthenticationRequired]
                && (![v116 length] || !objc_msgSend(v117, "length")))
              {
                v145 = WFLogForCategory(0);
                os_log_type_t v146 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v145 && os_log_type_enabled(v145, v146))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_226071000, v145, v146, "Can't save proxy settings, missing fields", buf, 2u);
                }

                v133 = obj;
                goto LABEL_235;
              }
              v118 = [[WFSettingsProxy alloc] initWithManualServer:v44 port:v149 username:v116 password:v117];
              if (v157)
              {
                [v157 addObject:v118];
              }
              else
              {
                v119 = WFLogForCategory(0);
                os_log_type_t v120 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v119 && os_log_type_enabled(v119, v120))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v178 = v11;
                  _os_log_impl(&dword_226071000, v119, v120, "Failed to create WFSettingsProxy from proxyChanges %@", buf, 0xCu);
                }
              }
              uint64_t v45 = 10;
              break;
            case 0:
              os_log_type_t v44 = +[WFSettingsProxy offConfig];
              [v157 addObject:v44];
              uint64_t v45 = 8;
              break;
            default:
              uint64_t v45 = -1;
LABEL_200:
              v73 = [(WFSettingsController *)val config];
              unint64_t v121 = [v73 httpProxyConfig];
              if (v121 > 2) {
                uint64_t v122 = -1;
              }
              else {
                uint64_t v122 = qword_226113900[v121];
              }
              if (v45 == v122)
              {
                uint64_t v123 = WFLogForCategory(0);
                os_log_type_t v124 = OSLogForWFLogLevel(4uLL);
                if ((unint64_t)WFCurrentLogLevel() >= 4 && v123 && os_log_type_enabled(v123, v124))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v178 = v45;
                  *(_WORD *)&v178[4] = 1024;
                  *(_DWORD *)&v178[6] = v45;
                  _os_log_impl(&dword_226071000, v123, v124, "Dropping HTTP Proxy configure event as the types didn't change %d -> %d", buf, 0xEu);
                }
              }
              else
              {
                uint64_t v123 = +[WFMetricsManager sharedManager];
                v125 = +[WFUserConfigureEvent configureEventWithType:3 new:v45 old:v122];
                [v123 processEvent:v125];
              }
LABEL_210:

LABEL_166:
              uint64_t v35 = (uint64_t)v165;
LABEL_167:

              v165 = (void *)v35;
              goto LABEL_168;
          }

          goto LABEL_200;
        }
LABEL_168:
        if (v162 == ++v9)
        {
          uint64_t v126 = [obj countByEnumeratingWithState:&v168 objects:v176 count:16];
          uint64_t v162 = v126;
          if (v126) {
            goto LABEL_4;
          }
          goto LABEL_219;
        }
      }
      id v11 = [obj objectForKey:v10];
      os_log_type_t v12 = WFLogForCategory(0);
      os_log_type_t v13 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v12 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v178 = v11;
        _os_log_impl(&dword_226071000, v12, v13, "IPv4 changes: %@", buf, 0xCu);
      }

      if (([v164 validIPv4Configuration] & 1) == 0)
      {
        os_log_type_t v33 = WFLogForCategory(0);
        os_log_type_t v34 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v33 && os_log_type_enabled(v33, v34))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v178 = v11;
          _os_log_impl(&dword_226071000, v33, v34, "Disregarding ipv4 edits %@, invalid configuration", buf, 0xCu);
        }

        uint64_t v35 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.wifikit.error" code:1 userInfo:v11];

        v156[2](v156, v35);
        goto LABEL_167;
      }
      id v14 = [v11 objectForKey:@"ipv4Config"];
      uint64_t v15 = v14;
      if (!v14 || (uint64_t v16 = [v14 integerValue], v16 == -1)) {
        uint64_t v16 = [v164 ipv4Config];
      }
      if (v16 != 2)
      {
        if (v16 == 1)
        {
          os_log_type_t v20 = +[WFSettingsIPV4 bootPConfig];
          if (!v20)
          {
            v82 = WFLogForCategory(0);
            os_log_type_t v83 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v82 && os_log_type_enabled(v82, v83))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v178 = v11;
              _os_log_impl(&dword_226071000, v82, v83, "Failed to create WFSettingsIPV4 from ipv4Changes %@", buf, 0xCu);
            }

            goto LABEL_133;
          }
        }
        else
        {
          if (v16)
          {
LABEL_134:
            uint32_t v86 = [(WFSettingsController *)val config];
            uint64_t v87 = [v86 ipv4Config];
            v88.i64[0] = v16;
            v88.i64[1] = v87;
            int64x2_t v89 = vdupq_n_s64(1uLL);
            int8x16_t v90 = (int8x16_t)vceqq_s64(v88, v89);
            int8x16_t v91 = vbicq_s8(vbslq_s8((int8x16_t)vceqq_s64(v88, v154), (int8x16_t)v154, vornq_s8(vandq_s8(v90, (int8x16_t)v89), v90)), (int8x16_t)vcgtq_u64((uint64x2_t)v154, (uint64x2_t)vaddq_s64(v88, v89)));
            uint64_t v92 = v91.i64[1];
            uint64_t v93 = v91.i64[0];
            if (v91.i64[0] == v91.i64[1])
            {
              v94 = WFLogForCategory(0);
              os_log_type_t v95 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v94 && os_log_type_enabled(v94, v95))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v178 = v93;
                *(_WORD *)&v178[4] = 1024;
                *(_DWORD *)&v178[6] = v93;
                _os_log_impl(&dword_226071000, v94, v95, "Dropping IPv4 configure event as the types didn't change %d -> %d", buf, 0xEu);
              }
            }
            else if (v91.i64[0] == 2)
            {
              v94 = +[WFMetricsManager sharedManager];
              v97 = +[WFUserConfigureEvent configureEventWithType:2 new:2 old:v92];
              [v94 processEvent:v97];
            }
            else
            {
              if (v91.i64[0] == 1)
              {
                v94 = +[WFMetricsManager sharedManager];
                +[WFUserConfigureEvent configureEventWithType:1 new:1 old:v92];
              }
              else
              {
                v94 = +[WFMetricsManager sharedManager];
                +[WFUserConfigureEvent configureEventWithType:0 new:v93 old:v92];
              os_log_type_t v96 = };
              [v94 processEvent:v96];
            }
            goto LABEL_166;
          }
          id v17 = [v11 objectForKey:@"dhcpClientID"];

          if (v17)
          {
            v18 = [WFSettingsIPV4 alloc];
            v19 = [v11 objectForKey:@"dhcpClientID"];
            os_log_type_t v20 = [(WFSettingsIPV4 *)v18 initWithMethod:1 addresses:0 subnetMasks:0 router:0 dhcpClientID:v19];
          }
          else
          {
            os_log_type_t v20 = +[WFSettingsIPV4 automaticConfig];
          }
        }
        [v157 addObject:v20];
LABEL_133:

        goto LABEL_134;
      }
      os_log_type_t v20 = [v164 ipv4AddressManual];
      int v47 = [v11 objectForKey:@"ipv4AddressManual"];

      if (v47)
      {
        uint64_t v48 = [v11 objectForKey:@"ipv4AddressManual"];

        os_log_type_t v20 = (WFSettingsIPV4 *)v48;
      }
      v49 = [v164 ipv4SubnetMaskManual];
      os_log_type_t v50 = [v11 objectForKey:@"ipv4SubnetMaskManual"];

      if (v50)
      {
        uint64_t v51 = [v11 objectForKey:@"ipv4SubnetMaskManual"];

        v49 = (void *)v51;
      }
      int v52 = [v164 ipv4RouterAddressManual];
      v53 = [v11 objectForKey:@"ipv4RouterAddressManual"];

      if (v53)
      {
        uint64_t v54 = [v11 objectForKey:@"ipv4RouterAddressManual"];

        int v52 = (void *)v54;
      }
      os_log_type_t v55 = [WFSettingsIPV4 alloc];
      if (v20)
      {
        v175 = v20;
        os_log_type_t v151 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v175 count:1];
        v56 = v151;
        if (v49) {
          goto LABEL_75;
        }
      }
      else
      {
        v56 = 0;
        if (v49)
        {
LABEL_75:
          int v174 = v49;
          int v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v174 count:1];
          v58 = [(WFSettingsIPV4 *)v55 initWithMethod:4 addresses:v56 subnetMasks:v57 router:v52 dhcpClientID:0];

          if (!v20) {
            goto LABEL_125;
          }
          goto LABEL_124;
        }
      }
      v58 = [(WFSettingsIPV4 *)v55 initWithMethod:4 addresses:v56 subnetMasks:0 router:v52 dhcpClientID:0];
      if (!v20)
      {
LABEL_125:
        if (v58)
        {
          [v157 addObject:v58];
        }
        else
        {
          __int16 v84 = WFLogForCategory(0);
          os_log_type_t v85 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v84 && os_log_type_enabled(v84, v85))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v178 = v11;
            _os_log_impl(&dword_226071000, v84, v85, "Failed to create WFSettingsIPV4 from ipv4Changes %@", buf, 0xCu);
          }
        }
        goto LABEL_133;
      }
LABEL_124:

      goto LABEL_125;
    }
    v165 = 0;
LABEL_219:

    if ([v157 count])
    {
      v131 = [(WFSettingsController *)val detailsContext];
      v132 = [v131 interface];
      v133 = [v132 interfaceName];

      v134 = [WFSaveSettingsOperation alloc];
      uint64_t v135 = [(WFSettingsController *)val network];
      v136 = [v135 ssid];
      v137 = [(WFSaveSettingsOperation *)v134 initWithSSID:v136 interfaceName:v133 settings:v157];

      uint64_t v138 = WFLogForCategory(0);
      os_log_type_t v139 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v138)
      {
        v140 = v138;
        if (os_log_type_enabled(v140, v139))
        {
          v141 = [(WFSettingsController *)val network];
          os_log_type_t v142 = [v141 ssid];
          *(_DWORD *)buf = 138412546;
          *(void *)v178 = v157;
          *(_WORD *)&v178[8] = 2112;
          id v179 = v142;
          _os_log_impl(&dword_226071000, v140, v139, "Saving new network settings %@ for %@", buf, 0x16u);
        }
      }

      [(WFSaveSettingsOperation *)v137 setCurrentNetwork:[(WFSettingsController *)val isCurrentNetwork]];
      objc_initWeak((id *)buf, val);
      v166[0] = MEMORY[0x263EF8330];
      v166[1] = 3221225472;
      v166[2] = __78__WFSettingsController_networkSettingsViewController_saveConfig_errorHandler___block_invoke;
      v166[3] = &unk_26478E3E8;
      objc_copyWeak(&v167, (id *)buf);
      [(WFSaveSettingsOperation *)v137 setCompletionBlock:v166];
      v143 = [(WFSettingsController *)val queue];
      [v143 addOperation:v137];

      objc_destroyWeak(&v167);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v133 = WFLogForCategory(0);
      os_log_type_t v144 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v133 && os_log_type_enabled(v133, v144))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v133, v144, "Bailing of saving, no setting changes to persist", buf, 2u);
      }
    }
LABEL_235:

    v129 = v157;
    goto LABEL_236;
  }
  v127 = WFLogForCategory(0);
  os_log_type_t v128 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v127)
  {
    v129 = v127;
    if (os_log_type_enabled(v129, v128))
    {
      os_log_type_t v130 = [(WFSettingsController *)val config];
      *(_DWORD *)buf = 138412546;
      *(void *)v178 = v130;
      *(_WORD *)&v178[8] = 2112;
      id v179 = v164;
      _os_log_impl(&dword_226071000, v129, v128, "No changes between configs (existing %@, new %@), nothing to do.", buf, 0x16u);
    }
    v165 = v129;
LABEL_236:

    v127 = v165;
  }
}

void __78__WFSettingsController_networkSettingsViewController_saveConfig_errorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained config];
  [WeakRetained _refreshSettingsConfig:v1];
}

- (void)_applySetupAppearances
{
  id v3 = [MEMORY[0x263F1CA48] appearance];
  uint64_t v2 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
  [v3 setBackgroundColor:v2];
}

- (WFNetworkSettingsViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
}

- (WFNetworkSettingsConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (BOOL)monitorIPChanges
{
  return self->_monitorIPChanges;
}

- (void)setMonitorIPChanges:(BOOL)a3
{
  self->_monitorIPChanges = a3;
}

- (WFIPMonitor)ipMonitor
{
  return self->_ipMonitor;
}

- (void)setIpMonitor:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)cloudSyncRunning
{
  return self->_cloudSyncRunning;
}

- (void)setCloudSyncRunning:(BOOL)a3
{
  self->_BOOL cloudSyncRunning = a3;
}

- (WFDetailsContext)detailsContext
{
  return self->_detailsContext;
}

- (void)setDetailsContext:(id)a3
{
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (BOOL)isCurrentNetwork
{
  return self->_currentNetwork;
}

- (void)setCurrentNetwork:(BOOL)a3
{
  self->_currentNetwork = a3;
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_detailsContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ipMonitor, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
}

@end