@interface WFHealthManager
- (BOOL)currentNetworkHasNoInternetConnection;
- (BOOL)failNoInternetDiagnosticsTests;
- (BOOL)isChinaDevice;
- (BOOL)shouldFileNewMetrics;
- (CWFScanResult)network;
- (NSArray)failedTestsIDs;
- (NSSet)currentNetworkIssues;
- (NWPathEvaluator)evaluator;
- (OS_dispatch_queue)diagnosticsQueue;
- (WFDiagnosticsManager)diagnosticsManager;
- (WFHealthManager)initWithInterface:(id)a3;
- (WFInterface)interface;
- (int64_t)completedVelocityTestTimes;
- (void)_updateCurrentNetworkIssues;
- (void)currentNetworkDidChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)runNoInternetDiagnostics;
- (void)runNoInternetDiagnosticsAfter:(int64_t)a3;
- (void)setCompletedVelocityTestTimes:(int64_t)a3;
- (void)setCurrentNetworkIssues:(id)a3;
- (void)setDiagnosticsManager:(id)a3;
- (void)setDiagnosticsQueue:(id)a3;
- (void)setEvaluator:(id)a3;
- (void)setFailNoInternetDiagnosticsTests:(BOOL)a3;
- (void)setFailedTestsIDs:(id)a3;
- (void)setInterface:(id)a3;
- (void)setIsChinaDevice:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setShouldFileNewMetrics:(BOOL)a3;
@end

@implementation WFHealthManager

- (WFHealthManager)initWithInterface:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFHealthManager;
  v6 = [(WFHealthManager *)&v25 init];
  v7 = v6;
  if (!v6)
  {
    id v11 = 0;
    v23 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_interface, a3);
  interface = v7->_interface;
  if (!interface)
  {
    id v11 = 0;
LABEL_10:
    v23 = v7;
    v7 = 0;
    goto LABEL_7;
  }
  v9 = [(WFInterface *)interface currentNetwork];
  v10 = [v9 scanResult];
  [(WFHealthManager *)v7 setNetwork:v10];

  id v11 = objc_alloc_init(MEMORY[0x263F14410]);
  if (!v11) {
    goto LABEL_10;
  }
  id v12 = objc_alloc(MEMORY[0x263F14408]);
  v13 = [(WFInterface *)v7->_interface interfaceName];
  v14 = (void *)[v12 initWithInterfaceName:v13];
  [v11 setRequiredInterface:v14];

  uint64_t v15 = [objc_alloc(MEMORY[0x263F14420]) initWithEndpoint:0 parameters:v11];
  evaluator = v7->_evaluator;
  v7->_evaluator = (NWPathEvaluator *)v15;

  v17 = v7->_evaluator;
  if (!v17) {
    goto LABEL_10;
  }
  [(NWPathEvaluator *)v17 addObserver:v7 forKeyPath:@"path" options:3 context:kWFHealthManagerContext];
  dispatch_queue_t v18 = dispatch_queue_create(0, 0);
  diagnosticsQueue = v7->_diagnosticsQueue;
  v7->_diagnosticsQueue = (OS_dispatch_queue *)v18;

  if (!v7->_diagnosticsQueue) {
    goto LABEL_10;
  }
  v7->_completedVelocityTestTimes = 0;
  v20 = objc_alloc_init(WFDiagnosticsManager);
  diagnosticsManager = v7->_diagnosticsManager;
  v7->_diagnosticsManager = v20;

  v22 = [MEMORY[0x263F08A00] defaultCenter];
  [v22 addObserver:v7 selector:sel_currentNetworkDidChange_ name:@"WFInterfaceNetworkChangedNotification" object:v7->_interface];

  v23 = [MEMORY[0x263F08A00] defaultCenter];
  [v23 addObserver:v7 selector:sel_linkQualityDidChange_ name:@"WFInterfaceLinkQualityNotification" object:v7->_interface];
LABEL_7:

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(WFHealthManager *)self evaluator];
  [v4 removeObserver:self forKeyPath:@"path"];

  v5.receiver = self;
  v5.super_class = (Class)WFHealthManager;
  [(WFHealthManager *)&v5 dealloc];
}

- (void)setNetwork:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [v5 isEqual:self->_network];
  v7 = WFLogForCategory(0);
  if (v6)
  {
    os_log_type_t v8 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v7)
    {
      v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        v10 = [v5 networkName];
        int v14 = 136315394;
        uint64_t v15 = "-[WFHealthManager setNetwork:]";
        __int16 v16 = 2112;
        id v17 = v10;
        _os_log_impl(&dword_226071000, v9, v8, "%s-No change to network, current network: %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    int v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, (os_log_type_t)v11))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[WFHealthManager setNetwork:]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_226071000, v7, (os_log_type_t)v11, "%s- %@", (uint8_t *)&v14, 0x16u);
    }

    [(WFHealthManager *)self setFailNoInternetDiagnosticsTests:0];
    objc_storeStrong((id *)&self->_network, a3);
    self->_failNoInternetDiagnosticsTests = 0;
    currentNetworkIssues = self->_currentNetworkIssues;
    self->_currentNetworkIssues = 0;

    failedTestsIDs = self->_failedTestsIDs;
    self->_failedTestsIDs = (NSArray *)MEMORY[0x263EFFA68];

    [(WFHealthManager *)self _updateCurrentNetworkIssues];
  }
}

- (void)runNoInternetDiagnosticsAfter:(int64_t)a3
{
  objc_initWeak(&location, self);
  [(WFHealthManager *)self forceUpdateNetworkIssues];
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * a3);
  diagnosticsQueue = self->_diagnosticsQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__WFHealthManager_runNoInternetDiagnosticsAfter___block_invoke;
  v7[3] = &unk_26478E3E8;
  objc_copyWeak(&v8, &location);
  dispatch_after(v5, diagnosticsQueue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__WFHealthManager_runNoInternetDiagnosticsAfter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained runNoInternetDiagnostics];
}

- (void)runNoInternetDiagnostics
{
  v3 = [(WFHealthManager *)self interface];
  char v4 = [v3 isReadyForConnectionVelocityTest];

  if (v4)
  {
    dispatch_time_t v5 = [(WFHealthManager *)self interface];
    int v6 = [v5 currentNetwork];
    v7 = [v6 ssid];

    if (!v7)
    {
      id v8 = [(WFHealthManager *)self network];
      v7 = [v8 networkName];
    }
    [(WFHealthManager *)self setFailNoInternetDiagnosticsTests:0];
    v9 = [(WFHealthManager *)self network];
    char v10 = [v9 isCarPlay];

    if ((v10 & 1) == 0)
    {
      if (v7)
      {
        objc_initWeak(location, self);
        int v11 = [(WFHealthManager *)self diagnosticsManager];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __43__WFHealthManager_runNoInternetDiagnostics__block_invoke_19;
        v16[3] = &unk_26478F2F8;
        objc_copyWeak(&v17, location);
        v16[4] = self;
        [v11 runNoInternetDiagnosticsFor:v7 withUpdate:&__block_literal_global_4 result:v16];

        objc_destroyWeak(&v17);
        objc_destroyWeak(location);
      }
      else
      {
        int v14 = WFLogForCategory(0);
        os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_226071000, v14, v15, "Not running no internet test because ssid is nil!", (uint8_t *)location, 2u);
        }

        [(WFHealthManager *)self forceUpdateNetworkIssues];
      }
    }
  }
  else
  {
    id v12 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_226071000, v12, v13, "Not ready for velocity test, updating other health issues.", (uint8_t *)location, 2u);
    }

    [(WFHealthManager *)self forceUpdateNetworkIssues];
  }
}

void __43__WFHealthManager_runNoInternetDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_226071000, v3, v4, "Diagnostics event received: %@", (uint8_t *)&v5, 0xCu);
  }
}

void __43__WFHealthManager_runNoInternetDiagnostics__block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v11 = WeakRetained;
  if (!v9)
  {
    v20 = WFLogForCategory(0);
    os_log_type_t v21 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v20 || !os_log_type_enabled(v20, v21)) {
      goto LABEL_20;
    }
    LOWORD(buf[0]) = 0;
    v22 = "Not connected to a network, canceling following tests...";
    goto LABEL_19;
  }
  id v12 = [WeakRetained network];
  os_log_type_t v13 = [v12 networkName];
  char v14 = [v9 isEqualToString:v13];

  if ((v14 & 1) == 0)
  {
    v20 = WFLogForCategory(0);
    os_log_type_t v21 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v20 || !os_log_type_enabled(v20, v21)) {
      goto LABEL_20;
    }
    LOWORD(buf[0]) = 0;
    v22 = "Network has changed before no internet test result comes back! Discarding test results...";
LABEL_19:
    _os_log_impl(&dword_226071000, v20, v21, v22, (uint8_t *)buf, 2u);
LABEL_20:

    goto LABEL_21;
  }
  if (v8 && ([v8 didPassTest] & 1) == 0)
  {
    [v11 setFailNoInternetDiagnosticsTests:1];
    os_log_type_t v15 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v15 && os_log_type_enabled(v15, v16))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_226071000, v15, v16, "Velocity no internet failed, reschedule another one after 10 second!", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v11);
    dispatch_time_t v17 = dispatch_time(0, 10000000000);
    uint64_t v18 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__WFHealthManager_runNoInternetDiagnostics__block_invoke_20;
    block[3] = &unk_26478E3E8;
    objc_copyWeak(&v24, buf);
    dispatch_after(v17, v18, block);
    objc_msgSend(v11, "setCompletedVelocityTestTimes:", objc_msgSend(v11, "completedVelocityTestTimes") + 1);
    [v11 setShouldFileNewMetrics:1];
    v19 = [v8 failedTests];
    [v11 setFailedTestsIDs:v19];

    objc_destroyWeak(&v24);
    objc_destroyWeak(buf);
  }
  [v11 _updateCurrentNetworkIssues];
LABEL_21:
}

void __43__WFHealthManager_runNoInternetDiagnostics__block_invoke_20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained runNoInternetDiagnostics];
}

- (void)currentNetworkDidChange:(id)a3
{
  id v6 = [(WFHealthManager *)self interface];
  os_log_type_t v4 = [v6 currentNetwork];
  int v5 = [v4 scanResult];
  [(WFHealthManager *)self setNetwork:v5];
}

- (void)_updateCurrentNetworkIssues
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v3 = [(WFHealthManager *)self interface];
  os_log_type_t v4 = [v3 currentNetwork];
  int v5 = [v4 matchingKnownNetworkProfile];

  id v6 = [(WFHealthManager *)self network];

  if (!v6)
  {
LABEL_43:
    id v9 = 0;
    currentNetworkIssues = self->_currentNetworkIssues;
    if (!currentNetworkIssues) {
      goto LABEL_52;
    }
    goto LABEL_44;
  }
  id v7 = [(WFHealthManager *)self network];
  int v8 = [v7 supportsWiFiHealth];

  if (!v8)
  {
    if ([0 count]) {
      goto LABEL_43;
    }
    id v9 = 0;
    goto LABEL_42;
  }
  id v9 = [MEMORY[0x263EFF9C0] set];
  char v10 = [(WFHealthManager *)self network];
  int v11 = [v10 configurationIssues];

  if ([v11 count])
  {
    id v12 = [v11 allObjects];
    [v9 addObjectsFromArray:v12];
  }
  if ([(WFHealthManager *)self currentNetworkHasNoInternetConnection])
  {
    os_log_type_t v13 = [MEMORY[0x263F863A8] issueWithType:1];
    [v9 addObject:v13];
  }
  char v14 = [v5 acceptedEAPTypes];
  if ([v14 count] == 1)
  {
    os_log_type_t v15 = [v5 acceptedEAPTypes];
    int v16 = [v15 containsObject:&unk_26D9E1CD8];
  }
  else
  {
    int v16 = 0;
  }

  dispatch_time_t v17 = [(WFHealthManager *)self network];
  if (![v17 isEAP] || !v5 || objc_msgSend(v5, "addReason") != 10) {
    goto LABEL_18;
  }

  if (v16)
  {
    uint64_t v18 = [v5 TLSTrustedServerNames];

    if (!v18)
    {
      dispatch_time_t v17 = [MEMORY[0x263F863A8] issueWithType:0x40000];
      [v9 addObject:v17];
LABEL_18:
    }
  }
  v19 = [(WFHealthManager *)self interface];
  v20 = [v19 currentNetwork];
  os_log_type_t v21 = [v20 matchingKnownNetworkProfile];
  int v22 = [v21 isStandalone6G];

  if (v22)
  {
    if ([(WFHealthManager *)self isChinaDevice]) {
      objc_msgSend(MEMORY[0x263F863B8], "limitedNetwork_CH");
    }
    else {
    v23 = [MEMORY[0x263F863B8] limitedNetwork];
    }
    [v9 addObject:v23];
  }
  id v24 = [(WFHealthManager *)self interface];
  if ([v24 currentNetworkIsDirected])
  {

    goto LABEL_29;
  }
  objc_super v25 = [(WFHealthManager *)self network];
  char v26 = [v25 isHidden];

  if (v26) {
    goto LABEL_29;
  }
  v27 = [(WFHealthManager *)self interface];
  v28 = [v27 currentNetwork];
  v29 = [v28 matchingKnownNetworkProfile];

  if (v29)
  {
    v30 = [(WFHealthManager *)self interface];
    v31 = [v30 currentNetwork];
    v32 = [v31 matchingKnownNetworkProfile];
    uint64_t v33 = [v32 hiddenState];

    if (v33 == 1)
    {
LABEL_29:
      v34 = [MEMORY[0x263F863A8] issueWithType:8];
      int v35 = [v9 containsObject:v34];

      if (v35)
      {
        v36 = [MEMORY[0x263F863A8] issueWithType:128];
        [v9 addObject:v36];

        v37 = (void *)MEMORY[0x263F863A8];
        uint64_t v38 = 8;
      }
      else
      {
        v39 = [MEMORY[0x263F863A8] issueWithType:2];
        int v40 = [v9 containsObject:v39];

        if (v40)
        {
          v41 = [MEMORY[0x263F863A8] issueWithType:512];
          [v9 addObject:v41];

          v37 = (void *)MEMORY[0x263F863A8];
          uint64_t v38 = 2;
        }
        else
        {
          v42 = [MEMORY[0x263F863A8] issueWithType:4];
          int v43 = [v9 containsObject:v42];

          if (v43)
          {
            v44 = [MEMORY[0x263F863A8] issueWithType:256];
            [v9 addObject:v44];

            v37 = (void *)MEMORY[0x263F863A8];
            uint64_t v38 = 4;
          }
          else
          {
            v45 = [MEMORY[0x263F863A8] issueWithType:4096];
            int v46 = [v9 containsObject:v45];

            if (!v46)
            {
              v48 = [MEMORY[0x263F863A8] issueWithType:64];
              [v9 addObject:v48];
              goto LABEL_38;
            }
            v47 = [MEMORY[0x263F863A8] issueWithType:0x2000];
            [v9 addObject:v47];

            v37 = (void *)MEMORY[0x263F863A8];
            uint64_t v38 = 4096;
          }
        }
      }
      v48 = [v37 issueWithType:v38];
      [v9 removeObject:v48];
LABEL_38:
    }
  }

  if (![v9 count])
  {
LABEL_42:

    goto LABEL_43;
  }
  if (!v9) {
    goto LABEL_43;
  }
  currentNetworkIssues = self->_currentNetworkIssues;
LABEL_44:
  if (([v9 isEqualToSet:currentNetworkIssues] & 1) == 0)
  {
    v50 = WFLogForCategory(0);
    os_log_type_t v51 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v50 && os_log_type_enabled(v50, v51))
    {
      *(_DWORD *)buf = 136315394;
      v56 = "-[WFHealthManager _updateCurrentNetworkIssues]";
      __int16 v57 = 2112;
      v58 = v9;
      _os_log_impl(&dword_226071000, v50, v51, "%s- change to health issues %@", buf, 0x16u);
    }

    v52 = (NSSet *)[v9 count];
    if (v52) {
      v52 = v9;
    }
    v53 = self->_currentNetworkIssues;
    self->_currentNetworkIssues = v52;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__WFHealthManager__updateCurrentNetworkIssues__block_invoke;
    block[3] = &unk_26478E528;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
LABEL_52:
}

void __46__WFHealthManager__updateCurrentNetworkIssues__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFHealthManagerHealthIssuesDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)currentNetworkHasNoInternetConnection
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (![(WFHealthManager *)self failNoInternetDiagnosticsTests])
  {
    id v12 = [(WFHealthManager *)self interface];
    if ([v12 ipv4SelfAssigned])
    {
      int v11 = 1;
    }
    else
    {
      os_log_type_t v13 = [(WFHealthManager *)self interface];
      int v11 = [v13 hasNoGatewayIP];
    }
    char v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
    {
      int v16 = "yes";
      if (v11) {
        int v16 = "no";
      }
      int v36 = 136315394;
      v37 = "-[WFHealthManager currentNetworkHasNoInternetConnection]";
      __int16 v38 = 2080;
      uint64_t v39 = (uint64_t)v16;
      _os_log_impl(&dword_226071000, v14, v15, "%s using ipv4 state internet connection -> %s", (uint8_t *)&v36, 0x16u);
    }

    if ((v11 & 1) == 0)
    {
      dispatch_time_t v17 = [(WFHealthManager *)self network];
      uint64_t v18 = [v17 carPlayNetworkType];

      if (v18 != 2)
      {
        LOBYTE(v11) = 0;
        return v11;
      }
    }
    v19 = [(WFHealthManager *)self evaluator];
    v20 = [v19 path];

    uint64_t v21 = [v20 status];
    if (v21 == 2)
    {
      objc_super v25 = +[WFMetricsManager sharedManager];
      int64_t v26 = [(WFHealthManager *)self completedVelocityTestTimes];
      v27 = [(WFHealthManager *)self network];
      v28 = [v27 networkName];
      LOBYTE(v11) = 1;
      v29 = +[WFHealthUIEvent noInternetEventWithTestTimes:v26 didPassTest:1 failedVelocityTests:MEMORY[0x263EFFA68] ssid:v28];
      [v25 processEvent:v29];

      v23 = WFLogForCategory(0);
      os_log_type_t v30 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v23 || !os_log_type_enabled(v23, v30)) {
        goto LABEL_37;
      }
      int v36 = 136315650;
      v37 = "-[WFHealthManager currentNetworkHasNoInternetConnection]";
      __int16 v38 = 2048;
      uint64_t v39 = 2;
      __int16 v40 = 2112;
      v41 = v20;
      v31 = "%s NWPathEvalutaor state unsatisfied - %lu (path: %@)";
      v32 = v23;
      os_log_type_t v33 = v30;
    }
    else
    {
      uint64_t v22 = v21;
      if (v21 == 1)
      {
        v23 = WFLogForCategory(0);
        os_log_type_t v24 = OSLogForWFLogLevel(3uLL);
        LOBYTE(v11) = 0;
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v23)
        {
          if (os_log_type_enabled(v23, v24))
          {
            int v36 = 136315138;
            v37 = "-[WFHealthManager currentNetworkHasNoInternetConnection]";
            _os_log_impl(&dword_226071000, v23, v24, "%s falling back to NWPathEvaluator for internet connection -> YES", (uint8_t *)&v36, 0xCu);
          }
          LOBYTE(v11) = 0;
        }
        goto LABEL_37;
      }
      v23 = WFLogForCategory(0);
      os_log_type_t v34 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() < 3 || !v23 || !os_log_type_enabled(v23, v34))
      {
LABEL_37:

        return v11;
      }
      int v36 = 136315650;
      v37 = "-[WFHealthManager currentNetworkHasNoInternetConnection]";
      __int16 v38 = 2048;
      uint64_t v39 = v22;
      __int16 v40 = 2112;
      v41 = v20;
      v31 = "%s NWPathEvalutaor state invalid - %lu (path: %@)";
      v32 = v23;
      os_log_type_t v33 = v34;
    }
    _os_log_impl(&dword_226071000, v32, v33, v31, (uint8_t *)&v36, 0x20u);
    goto LABEL_37;
  }
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    LOWORD(v36) = 0;
    _os_log_impl(&dword_226071000, v3, v4, "No internet warning generated becuase Velocity tests failed!", (uint8_t *)&v36, 2u);
  }

  if ([(WFHealthManager *)self shouldFileNewMetrics])
  {
    int v5 = +[WFMetricsManager sharedManager];
    int64_t v6 = [(WFHealthManager *)self completedVelocityTestTimes];
    id v7 = [(WFHealthManager *)self failedTestsIDs];
    int v8 = [(WFHealthManager *)self network];
    id v9 = [v8 networkName];
    char v10 = +[WFHealthUIEvent noInternetEventWithTestTimes:v6 didPassTest:0 failedVelocityTests:v7 ssid:v9];
    [v5 processEvent:v10];
  }
  [(WFHealthManager *)self setShouldFileNewMetrics:0];
  LOBYTE(v11) = 1;
  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a5;
  if (a6 == &kWFHealthManagerContext)
  {
    if ([a3 isEqualToString:@"path"])
    {
      int v11 = [v10 valueForKey:*MEMORY[0x263F081C8]];
      id v12 = [v10 valueForKey:*MEMORY[0x263F081B8]];
      uint64_t v13 = [v11 status];
      if (v13 != [v12 status])
      {
        char v14 = WFLogForCategory(0);
        os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v14)
        {
          int v16 = v14;
          if (os_log_type_enabled(v16, v15))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v20 = [v11 status];
            __int16 v21 = 2048;
            uint64_t v22 = [v12 status];
            _os_log_impl(&dword_226071000, v16, v15, "Network Evaluator Path Changed: oldValue.status %ld, newValue.status %ld", buf, 0x16u);
          }
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __66__WFHealthManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_26478E528;
        void block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WFHealthManager;
    [(WFHealthManager *)&v18 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

uint64_t __66__WFHealthManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentNetworkIssues];
}

- (NSSet)currentNetworkIssues
{
  return self->_currentNetworkIssues;
}

- (void)setCurrentNetworkIssues:(id)a3
{
}

- (BOOL)isChinaDevice
{
  return self->_isChinaDevice;
}

- (void)setIsChinaDevice:(BOOL)a3
{
  self->_isChinaDevice = a3;
}

- (WFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (NWPathEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
}

- (CWFScanResult)network
{
  return self->_network;
}

- (OS_dispatch_queue)diagnosticsQueue
{
  return self->_diagnosticsQueue;
}

- (void)setDiagnosticsQueue:(id)a3
{
}

- (WFDiagnosticsManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
}

- (BOOL)failNoInternetDiagnosticsTests
{
  return self->_failNoInternetDiagnosticsTests;
}

- (void)setFailNoInternetDiagnosticsTests:(BOOL)a3
{
  self->_failNoInternetDiagnosticsTests = a3;
}

- (int64_t)completedVelocityTestTimes
{
  return self->_completedVelocityTestTimes;
}

- (void)setCompletedVelocityTestTimes:(int64_t)a3
{
  self->_completedVelocityTestTimes = a3;
}

- (BOOL)shouldFileNewMetrics
{
  return self->_shouldFileNewMetrics;
}

- (void)setShouldFileNewMetrics:(BOOL)a3
{
  self->_shouldFileNewMetrics = a3;
}

- (NSArray)failedTestsIDs
{
  return self->_failedTestsIDs;
}

- (void)setFailedTestsIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedTestsIDs, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsQueue, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_currentNetworkIssues, 0);
}

@end