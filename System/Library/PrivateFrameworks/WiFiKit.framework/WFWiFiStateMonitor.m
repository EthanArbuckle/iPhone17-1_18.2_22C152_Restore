@interface WFWiFiStateMonitor
- (BOOL)associatedToCarPlayOnly;
- (BOOL)monitoring;
- (CWFScanResult)currentNetwork;
- (NSRunLoop)callbackRunLoop;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NSThread)callbackThread;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)wifiUIStateFlagsQueue;
- (WFClient)client;
- (WFLinkQuality)linkQuality;
- (WFWiFiStateMonitor)init;
- (WFWiFiStateMonitor)initWithClient:(id)a3 handler:(id)a4;
- (id)description;
- (id)handler;
- (int64_t)state;
- (void)_asyncGetCurrentNetwork:(id)a3;
- (void)_autoJoinStateChanged:(id)a3;
- (void)_carPlayNetworkTypeDidChange:(id)a3;
- (void)_clientConnectionRestarted:(id)a3;
- (void)_hostAPStateChanged:(id)a3;
- (void)_interfaceBecameAvailable:(id)a3;
- (void)_linkDidChange:(id)a3;
- (void)_linkQualityDidChange:(id)a3;
- (void)_notifyStateChanged:(int64_t)a3 newState:(int64_t)a4;
- (void)_outrankStateDidChange:(id)a3;
- (void)_powerStateDidChange:(id)a3;
- (void)_registerInterfaceObserversForInterface:(id)a3;
- (void)_runManagerCallbackThread;
- (void)_spawnManagerCallbackThread;
- (void)_updateState;
- (void)_updateState:(id)a3;
- (void)_updateWiFiUIState:(id)a3;
- (void)dealloc;
- (void)setAssociatedToCarPlayOnly:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCallbackRunLoop:(id)a3;
- (void)setCallbackThread:(id)a3;
- (void)setClient:(id)a3;
- (void)setCurrentNetwork:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setLinkQuality:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setWifiUIStateFlagsQueue:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation WFWiFiStateMonitor

- (int64_t)state
{
  return self->_state;
}

void __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 interface];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke_2;
  v4[3] = &unk_26478EF90;
  id v5 = *(id *)(a1 + 40);
  [v3 asyncCurrentNetwork:v4];
}

void __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke_3;
  v6[3] = &unk_26478EFE0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void)_linkDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%@: link change", (uint8_t *)&v6, 0xCu);
  }

  [(WFWiFiStateMonitor *)self _updateState];
}

uint64_t __37__WFWiFiStateMonitor_startMonitoring__block_invoke_13(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateState];
  v2 = *(void **)(a1 + 32);
  return [v2 setMonitoring:1];
}

- (void)_updateState
{
}

void __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) scanResult];
  id v3 = [*(id *)(a1 + 32) matchingKnownNetworkProfile];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

void __35__WFWiFiStateMonitor__updateState___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [*(id *)(a1 + 32) currentNetwork];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412802;
    v75 = v11;
    __int16 v76 = 2112;
    v77 = v12;
    __int16 v78 = 2112;
    id v79 = v7;
    _os_log_impl(&dword_226071000, v9, v10, "%@: network %@ profile %@", buf, 0x20u);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if ([v7 carPlayNetworkType] == 1)
    {
      v13 = WFLogForCategory(0);
      os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
      {
        v15 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v75 = v15;
        _os_log_impl(&dword_226071000, v13, v14, "%@: associated to CarPlay only network", buf, 0xCu);
      }

      [*(id *)(a1 + 32) setState:2];
      [*(id *)(a1 + 32) setAssociatedToCarPlayOnly:1];
      v16 = [*(id *)(a1 + 32) linkQuality];

      if (v16)
      {
        v17 = WFLogForCategory(0);
        os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v17)
        {
          v19 = v17;
          if (os_log_type_enabled(v19, v18))
          {
            v20 = *(void **)(a1 + 32);
            v21 = [v20 linkQuality];
            *(_DWORD *)buf = 138412546;
            v75 = v20;
            __int16 v76 = 2112;
            v77 = v21;
            _os_log_impl(&dword_226071000, v19, v18, "%@: clearing out link quality='%@' due to CarPlay only network", buf, 0x16u);
          }
        }

        [*(id *)(a1 + 32) setLinkQuality:0];
      }
      goto LABEL_63;
    }
    [*(id *)(a1 + 32) setAssociatedToCarPlayOnly:0];
    uint64_t v29 = [*(id *)(a1 + 32) linkQuality];
    if (!v29) {
      goto LABEL_26;
    }
    v30 = (void *)v29;
    v31 = [*(id *)(a1 + 32) linkQuality];
    v32 = [v31 ssid];
    v33 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
    char v34 = [v32 isEqualToString:v33];

    if ((v34 & 1) == 0)
    {
LABEL_26:
      v35 = WFLogForCategory(0);
      os_log_type_t v36 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v35)
      {
        v37 = v35;
        if (os_log_type_enabled(v37, v36))
        {
          v38 = *(void **)(a1 + 32);
          v39 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
          *(_DWORD *)buf = 138412546;
          v75 = v38;
          __int16 v76 = 2112;
          v77 = v39;
          _os_log_impl(&dword_226071000, v37, v36, "%@: creating link quality for network %@", buf, 0x16u);
        }
      }

      v40 = [v7 displayFriendlyName];
      if (!v40)
      {
        v40 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
      }
      v41 = [WFLinkQuality alloc];
      LODWORD(v42) = 1.0;
      v43 = [(WFLinkQuality *)v41 initWithSSID:v40 rssi:0 scaledRSSI:v42];
      [*(id *)(a1 + 32) setLinkQuality:v43];
    }
    v44 = [*(id *)(a1 + 32) client];
    int v45 = [v44 isCellularOutrankingWiFi];

    if (v45)
    {
      v46 = WFLogForCategory(0);
      os_log_type_t v47 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v46)
      {
        v48 = v46;
        if (os_log_type_enabled(v48, v47))
        {
          v49 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
          *(_DWORD *)buf = 138412290;
          v75 = v49;
          _os_log_impl(&dword_226071000, v48, v47, "associated to '%@' but cellular is outranking WiFi", buf, 0xCu);
        }
      }

      [*(id *)(a1 + 32) setState:2];
      goto LABEL_63;
    }
    [*(id *)(a1 + 32) setState:4];
    v50 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v50 && v8)
    {
      uint64_t v51 = [v50 networkName];
      if (!v51) {
        goto LABEL_62;
      }
      v52 = (void *)v51;
      uint64_t v53 = [v8 networkName];
      if (!v53)
      {

        goto LABEL_62;
      }
      v54 = (void *)v53;
      v55 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
      v56 = [v8 networkName];
      char v57 = [v55 isEqual:v56];

      if (v57)
      {
LABEL_62:
        [*(id *)(a1 + 32) setCurrentNetwork:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
LABEL_63:
        uint64_t v71 = *(void *)(a1 + 40);
        if (v71) {
          (*(void (**)(uint64_t, uint64_t))(v71 + 16))(v71, [*(id *)(a1 + 32) state]);
        }
        goto LABEL_65;
      }
      v58 = WFLogForCategory(0);
      os_log_type_t v59 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v58)
      {
        v60 = v58;
        if (os_log_type_enabled(v60, v59))
        {
          v61 = *(void **)(a1 + 32);
          v62 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
          v63 = [v8 networkName];
          *(_DWORD *)buf = 138412802;
          v75 = v61;
          __int16 v76 = 2112;
          v77 = v62;
          __int16 v78 = 2112;
          id v79 = v63;
          _os_log_impl(&dword_226071000, v60, v59, "%@: network changed (was %@, is %@), calling state change handler", buf, 0x20u);
        }
      }

      v64 = *(void **)(a1 + 32);
      uint64_t v65 = 4;
    }
    else
    {
      if (!v50 || v8) {
        goto LABEL_62;
      }
      v66 = WFLogForCategory(0);
      os_log_type_t v67 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v66)
      {
        v68 = v66;
        if (os_log_type_enabled(v68, v67))
        {
          v69 = *(void **)(a1 + 32);
          v70 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
          *(_DWORD *)buf = 138412546;
          v75 = v69;
          __int16 v76 = 2112;
          v77 = v70;
          _os_log_impl(&dword_226071000, v68, v67, "%@: network changed to %@, calling state change handler", buf, 0x16u);
        }
      }

      v64 = *(void **)(a1 + 32);
      uint64_t v65 = 3;
    }
    [v64 _notifyStateChanged:v65 newState:4];
    goto LABEL_62;
  }
  [*(id *)(a1 + 32) setAssociatedToCarPlayOnly:0];
  [*(id *)(a1 + 32) setCurrentNetwork:0];
  [*(id *)(a1 + 32) setLinkQuality:0];
  v22 = WFLogForCategory(0);
  os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v22)
  {
    v24 = v22;
    if (os_log_type_enabled(v24, v23))
    {
      v25 = *(void **)(a1 + 32);
      v26 = [v25 linkQuality];
      *(_DWORD *)buf = 138412546;
      v75 = v25;
      __int16 v76 = 2112;
      v77 = v26;
      _os_log_impl(&dword_226071000, v24, v23, "%@: no network, cleared out link quality %@", buf, 0x16u);
    }
  }

  v27 = [*(id *)(a1 + 32) client];
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __35__WFWiFiStateMonitor__updateState___block_invoke_41;
  v72[3] = &unk_26478F5C8;
  v28 = *(void **)(a1 + 40);
  v72[4] = *(void *)(a1 + 32);
  id v73 = v28;
  [v27 asyncMISState:v72];

LABEL_65:
}

- (WFLinkQuality)linkQuality
{
  return self->_linkQuality;
}

- (void)setState:(int64_t)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__WFWiFiStateMonitor_setState___block_invoke;
  v4[3] = &unk_26478E500;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

- (void)setCurrentNetwork:(id)a3
{
}

- (void)setAssociatedToCarPlayOnly:(BOOL)a3
{
  self->_associatedToCarPlayOnly = a3;
}

- (CWFScanResult)currentNetwork
{
  return self->_currentNetwork;
}

void __37__WFWiFiStateMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) _spawnManagerCallbackThread];
    id v3 = [WFClient alloc];
    id v4 = [*(id *)(a1 + 32) callbackRunLoop];
    os_log_type_t v5 = [(WFClient *)v3 initWithCallbackRunLoop:v4];
    [WeakRetained setClient:v5];

    id v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      uint64_t v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        v9 = *(void **)(a1 + 32);
        os_log_type_t v10 = [v9 client];
        *(_DWORD *)buf = 138412546;
        v15 = v9;
        __int16 v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_226071000, v8, v7, "%@: client %@", buf, 0x16u);
      }
    }

    v11 = [WeakRetained client];
    v12 = [v11 interface];
    [WeakRetained _registerInterfaceObserversForInterface:v12];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__WFWiFiStateMonitor_startMonitoring__block_invoke_13;
    block[3] = &unk_26478E528;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)_updateState:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_226071000, v5, v6, "%@: updating state", buf, 0xCu);
  }

  os_log_type_t v7 = [(WFWiFiStateMonitor *)self client];
  uint64_t v8 = [v7 cInterface];

  if (v8)
  {
    v9 = [(WFWiFiStateMonitor *)self client];

    if (v9)
    {
      if (_os_feature_enabled_impl())
      {
        [(WFWiFiStateMonitor *)self _updateWiFiUIState:v4];
      }
      else
      {
        v13 = [(WFWiFiStateMonitor *)self client];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __35__WFWiFiStateMonitor__updateState___block_invoke;
        v14[3] = &unk_26478F5C8;
        v14[4] = self;
        id v15 = v4;
        [v13 asyncPowered:v14];
      }
      goto LABEL_21;
    }
    os_log_type_t v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      v12 = "%@: client is unavailable";
      goto LABEL_17;
    }
  }
  else
  {
    os_log_type_t v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      v12 = "%@: interface is unavailable";
LABEL_17:
      _os_log_impl(&dword_226071000, v10, v11, v12, buf, 0xCu);
    }
  }

  [(WFWiFiStateMonitor *)self setState:0];
  [(WFWiFiStateMonitor *)self setAssociatedToCarPlayOnly:0];
  if (v4) {
    (*((void (**)(id, int64_t))v4 + 2))(v4, [(WFWiFiStateMonitor *)self state]);
  }
LABEL_21:
}

- (WFClient)client
{
  return self->_client;
}

- (void)setLinkQuality:(id)a3
{
}

- (void)setClient:(id)a3
{
}

- (NSRunLoop)callbackRunLoop
{
  return self->_callbackRunLoop;
}

- (void)_spawnManagerCallbackThread
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F08B88]) initWithTarget:self selector:sel__runManagerCallbackThread object:0];
  [v3 start];
  [(WFWiFiStateMonitor *)self setCallbackThread:v3];
  [(WFWiFiStateMonitor *)self performSelector:sel_class onThread:v3 withObject:0 waitUntilDone:1];
}

- (void)setCallbackThread:(id)a3
{
}

- (WFWiFiStateMonitor)initWithClient:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFWiFiStateMonitor;
  v9 = [(WFWiFiStateMonitor *)&v21 init];
  os_log_type_t v10 = v9;
  if (!v9)
  {
    os_log_type_t v11 = 0;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v9->_client, a3);
  os_log_type_t v11 = (__CFString *)WFCopyProcessIdentifier();
  if (![(__CFString *)v11 isEqualToString:@"com.apple.TVRemote"])
  {
    dispatch_queue_t v13 = dispatch_queue_create("WFWiFiStateMonitor-Queue", 0);
    os_log_type_t v14 = (void *)*((void *)v10 + 6);
    *((void *)v10 + 6) = v13;

    if (*((void *)v10 + 6))
    {
      dispatch_queue_t v15 = dispatch_queue_create("WiFiUIStateFlags-Queue", 0);
      __int16 v16 = (void *)*((void *)v10 + 7);
      *((void *)v10 + 7) = v15;

      if (*((void *)v10 + 7))
      {
        objc_storeStrong((id *)v10 + 12, v11);
        *((void *)v10 + 2) = 0;
        v17 = _Block_copy(v8);
        uint64_t v18 = (void *)*((void *)v10 + 3);
        *((void *)v10 + 3) = v17;

        [v10 startMonitoring];
LABEL_7:
        v12 = v10;
        os_log_type_t v10 = v12;
        goto LABEL_8;
      }
    }
LABEL_10:

    os_log_type_t v10 = 0;
    goto LABEL_7;
  }
  v12 = [[WFMobileWiFiStateMonitor alloc] initWithHandler:v8];
LABEL_8:
  v19 = (WFWiFiStateMonitor *)v12;

  return v19;
}

- (void)startMonitoring
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(WFWiFiStateMonitor *)self monitoring])
  {
    id v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v16 = self;
      _os_log_impl(&dword_226071000, v3, v4, "%@: already monitoring", buf, 0xCu);
    }
  }
  else
  {
    os_log_type_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel__powerStateDidChange_ name:@"WFClientPowerStateChangedNotification" object:0];

    os_log_type_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel__clientConnectionRestarted_ name:@"WFClientServerRestartedNotification" object:0];

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:self selector:sel__interfaceBecameAvailable_ name:@"WFClientInterfaceAvailableNotification" object:0];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel__autoJoinStateChanged_ name:@"WFClientUserAutoJoinStateChangedNotification" object:0];

    v9 = [(WFWiFiStateMonitor *)self client];

    if (v9)
    {
      os_log_type_t v10 = [(WFWiFiStateMonitor *)self client];
      os_log_type_t v11 = [v10 interface];
      [(WFWiFiStateMonitor *)self _registerInterfaceObserversForInterface:v11];

      [(WFWiFiStateMonitor *)self _updateState];
      [(WFWiFiStateMonitor *)self setMonitoring:1];
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v12 = [(WFWiFiStateMonitor *)self internalQueue];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __37__WFWiFiStateMonitor_startMonitoring__block_invoke;
      v13[3] = &unk_26478E398;
      objc_copyWeak(&v14, (id *)buf);
      v13[4] = self;
      dispatch_async(v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)_registerInterfaceObserversForInterface:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    int v16 = 138412546;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%@: using interface %@", (uint8_t *)&v16, 0x16u);
  }

  if (!v4)
  {
    id v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7)
    {
      v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        os_log_type_t v10 = [(WFWiFiStateMonitor *)self client];
        int v16 = 138412546;
        uint64_t v17 = self;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_impl(&dword_226071000, v9, v8, "%@: nil interface (client %@)", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  os_log_type_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel__hostAPStateChanged_ name:@"WFInterfaceHostAPStateChangeNotification" object:0];

  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel__linkDidChange_ name:@"WFInterfaceNetworkChangedNotification" object:v4];

  dispatch_queue_t v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel__linkQualityDidChange_ name:@"WFInterfaceLinkQualityNotification" object:v4];

  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:self selector:sel__outrankStateDidChange_ name:@"WFClientCellularOutrankWiFiNotification" object:0];

  dispatch_queue_t v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel__carPlayNetworkTypeDidChange_ name:@"WFInterfaceCarPlayNetworkTypeDidChangeNotification" object:0];
}

- (void)_runManagerCallbackThread
{
  id v3 = (void *)MEMORY[0x22A645F80](self, a2);
  id v4 = [MEMORY[0x263F08B88] currentThread];
  [v4 setName:@"WFWiFiStateMonitor callback thread"];

  self->_callbackRunLoop = (NSRunLoop *)(id)[MEMORY[0x263EFF9F0] currentRunLoop];
  os_log_type_t v5 = [MEMORY[0x263EFF968] port];
  os_log_type_t v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v5 scheduleInRunLoop:v6 forMode:*MEMORY[0x263EFF588]];

  id v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v7 run];
}

- (void)_linkQualityDidChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = [MEMORY[0x263F08B88] currentThread];
  os_log_type_t v6 = [(WFWiFiStateMonitor *)self callbackThread];

  if (v5 == v6)
  {
    id v7 = [v4 userInfo];
    os_log_type_t v8 = [v7 objectForKey:@"WFInterfaceLinkQualityKey"];
    v9 = (WFLinkQuality *)[v8 copy];
    linkQuality = self->_linkQuality;
    self->_linkQuality = v9;

    os_log_type_t v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11)
    {
      dispatch_queue_t v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        id v14 = [(WFWiFiStateMonitor *)self linkQuality];
        unint64_t v15 = [(WFWiFiStateMonitor *)self state];
        if (v15 > 5) {
          int v16 = @"Unknown";
        }
        else {
          int v16 = off_26478F688[v15];
        }
        int v17 = 138412802;
        __int16 v18 = self;
        __int16 v19 = 2112;
        uint64_t v20 = v14;
        __int16 v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_226071000, v13, v12, "%@: link quality changed %@ (current state %@)", (uint8_t *)&v17, 0x20u);
      }
    }
  }
}

- (NSThread)callbackThread
{
  return self->_callbackThread;
}

void __31__WFWiFiStateMonitor_setState___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if (v2 == v3)
  {
    if (v7 && os_log_type_enabled(v4, v5))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      unint64_t v9 = *(void *)(v8 + 16);
      if (v9 > 5) {
        os_log_type_t v10 = @"Unknown";
      }
      else {
        os_log_type_t v10 = off_26478F688[v9];
      }
      int v18 = 138412546;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v10;
      _os_log_impl(&dword_226071000, v4, v5, "%@: no change to state (%@)", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    if (v7 && os_log_type_enabled(v4, v5))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      unint64_t v12 = *(void *)(v11 + 16);
      if (v12 > 5) {
        dispatch_queue_t v13 = @"Unknown";
      }
      else {
        dispatch_queue_t v13 = off_26478F688[v12];
      }
      unint64_t v14 = *(void *)(a1 + 40);
      if (v14 > 5) {
        unint64_t v15 = @"Unknown";
      }
      else {
        unint64_t v15 = off_26478F688[v14];
      }
      int v18 = 138412802;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      __int16 v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_impl(&dword_226071000, v4, v5, "%@: old state %@ new state %@", (uint8_t *)&v18, 0x20u);
    }

    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(v16 + 16);
    *(void *)(v16 + 16) = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) _notifyStateChanged:v17 newState:*(void *)(a1 + 40)];
  }
}

- (void)_notifyStateChanged:(int64_t)a3 newState:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v7 = [(WFWiFiStateMonitor *)self handler];

  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__WFWiFiStateMonitor__notifyStateChanged_newState___block_invoke;
    block[3] = &unk_26478F640;
    block[4] = self;
    void block[5] = a3;
    block[6] = a4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    uint64_t v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v12 = self;
      _os_log_impl(&dword_226071000, v8, v9, "%@: handler is nil, can't call state changed handler", buf, 0xCu);
    }
  }
}

void __51__WFWiFiStateMonitor__notifyStateChanged_newState___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) handler];

  uint64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v2)
  {
    if (v6 && os_log_type_enabled((os_log_t)v3, v4))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_226071000, (os_log_t)v3, v4, "%@: calling state changed handler", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v3 = [*(id *)(a1 + 32) handler];
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  else if (v6 && os_log_type_enabled((os_log_t)v3, v4))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_226071000, (os_log_t)v3, v4, "%@: handler is nil, can't call state changed handler", (uint8_t *)&v9, 0xCu);
  }
}

- (id)handler
{
  return objc_getProperty(self, a2, 24, 1);
}

void __35__WFWiFiStateMonitor__updateState___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__5;
    unint64_t v14 = __Block_byref_object_dispose__5;
    id v15 = 0;
    uint64_t v3 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__WFWiFiStateMonitor__updateState___block_invoke_39;
    v8[3] = &unk_26478F5F0;
    v8[4] = v3;
    p_long long buf = &buf;
    id v9 = *(id *)(a1 + 40);
    [v3 _asyncGetCurrentNetwork:v8];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    os_log_type_t v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_226071000, v4, v5, "%@: power is off", (uint8_t *)&buf, 0xCu);
    }

    [*(id *)(a1 + 32) setState:1];
    [*(id *)(a1 + 32) setLinkQuality:0];
    [*(id *)(a1 + 32) setAssociatedToCarPlayOnly:0];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, [*(id *)(a1 + 32) state]);
    }
  }
}

- (void)_asyncGetCurrentNetwork:(id)a3
{
  id v4 = a3;
  os_log_type_t v5 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke;
  v7[3] = &unk_26478EEF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (WFWiFiStateMonitor)init
{
  return [(WFWiFiStateMonitor *)self initWithClient:0 handler:0];
}

- (void)stopMonitoring
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(WFWiFiStateMonitor *)self monitoring])
  {
    uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self];

    self->_state = 0;
    [(WFWiFiStateMonitor *)self setMonitoring:0];
  }
  else
  {
    id v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_226071000, v4, v5, "%@: not monitoring", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)dealloc
{
  [(WFWiFiStateMonitor *)self stopMonitoring];
  uint64_t v3 = [(WFWiFiStateMonitor *)self callbackThread];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)WFWiFiStateMonitor;
  [(WFWiFiStateMonitor *)&v4 dealloc];
}

void __35__WFWiFiStateMonitor__updateState___block_invoke_41(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 setState:5];
    objc_super v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v13 = v6;
      _os_log_impl(&dword_226071000, v4, v5, "%@: not associated, MIS=1", buf, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, [*(id *)(a1 + 32) state]);
    }
  }
  else
  {
    uint64_t v8 = [v3 client];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__WFWiFiStateMonitor__updateState___block_invoke_42;
    v10[3] = &unk_26478F5C8;
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v8 asyncUserAutoJoinState:v10];
  }
}

void __35__WFWiFiStateMonitor__updateState___block_invoke_42(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v4 = [*(id *)(a1 + 32) currentNetwork];

  if (v4) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (a2) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 2;
    }
    uint64_t v7 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      uint64_t v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = [v11 currentNetwork];
        int v17 = 138412546;
        int v18 = v11;
        __int16 v19 = 2112;
        __int16 v20 = v12;
        _os_log_impl(&dword_226071000, v10, v9, "%@: became associated during _updateState, self.currentNetwork is not nil %@", (uint8_t *)&v17, 0x16u);
      }
    }

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v6 = 4;
  }
  [v7 setState:v6];
  uint64_t v13 = WFLogForCategory(0);
  os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
  {
    id v15 = *(void **)(a1 + 32);
    int v17 = 138412546;
    int v18 = v15;
    __int16 v19 = 1024;
    LODWORD(v20) = a2;
    _os_log_impl(&dword_226071000, v13, v14, "%@: not associated, userAutoJoin state=%d", (uint8_t *)&v17, 0x12u);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, [*(id *)(a1 + 32) state]);
  }
}

- (void)_updateWiFiUIState:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  BOOL v5 = [(WFWiFiStateMonitor *)self wifiUIStateFlagsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke;
  block[3] = &unk_26478EF18;
  block[4] = self;
  void block[5] = &v21;
  dispatch_sync(v5, block);

  uint64_t v6 = v22[3];
  if (v6)
  {
    if ((v6 & 2) != 0)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__5;
      v28 = __Block_byref_object_dispose__5;
      id v29 = 0;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_46;
      v15[3] = &unk_26478F618;
      v15[4] = self;
      p_long long buf = &buf;
      id v16 = v4;
      int v18 = &v21;
      [(WFWiFiStateMonitor *)self _asyncGetCurrentNetwork:v15];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v7 = WFLogForCategory(0);
      os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_226071000, v7, v8, "%@: power is off", (uint8_t *)&buf, 0xCu);
      }

      [(WFWiFiStateMonitor *)self setState:1];
      [(WFWiFiStateMonitor *)self setLinkQuality:0];
      [(WFWiFiStateMonitor *)self setAssociatedToCarPlayOnly:0];
    }
    id v11 = v14;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    uint64_t v12 = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_49;
  }
  else
  {
    os_log_type_t v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_226071000, v9, v10, "%@: wifi UI status is unavailable", (uint8_t *)&buf, 0xCu);
    }

    [(WFWiFiStateMonitor *)self setState:0];
    [(WFWiFiStateMonitor *)self setAssociatedToCarPlayOnly:0];
    id v11 = v19;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    uint64_t v12 = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_45;
  }
  v11[2] = v12;
  v11[3] = &unk_26478EFE0;
  v11[4] = self;
  v11[5] = v4;
  id v13 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v11);

  _Block_object_dispose(&v21, 8);
}

void __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client];
  uint64_t v2 = [v3 cInterface];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 wifiUIStateFlags];
}

uint64_t __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_45(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(result + 32) state];
    id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return v3(v1, v2);
  }
  return result;
}

void __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  os_log_type_t v8 = [*(id *)(a1 + 32) currentNetwork];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  os_log_type_t v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)long long buf = 138412802;
    v82 = v11;
    __int16 v83 = 2112;
    v84 = v12;
    __int16 v85 = 2112;
    id v86 = v7;
    _os_log_impl(&dword_226071000, v9, v10, "%@: network %@ profile %@", buf, 0x20u);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    [*(id *)(a1 + 32) setAssociatedToCarPlayOnly:0];
    [*(id *)(a1 + 32) setCurrentNetwork:0];
    [*(id *)(a1 + 32) setLinkQuality:0];
    uint64_t v24 = WFLogForCategory(0);
    os_log_type_t v25 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v24)
    {
      uint64_t v26 = v24;
      if (os_log_type_enabled(v26, v25))
      {
        v27 = *(void **)(a1 + 32);
        v28 = [v27 linkQuality];
        *(_DWORD *)long long buf = 138412546;
        v82 = v27;
        __int16 v83 = 2112;
        v84 = v28;
        _os_log_impl(&dword_226071000, v26, v25, "%@: no network, cleared out link quality %@", buf, 0x16u);
      }
    }

    uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if ((v29 & 8) != 0)
    {
      [*(id *)(a1 + 32) setState:5];
      uint64_t v53 = WFLogForCategory(0);
      os_log_type_t v54 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v53 || !os_log_type_enabled(v53, v54)) {
        goto LABEL_65;
      }
      v55 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      v82 = v55;
      v56 = "%@: not associated, MIS=1";
      char v57 = v53;
      os_log_type_t v58 = v54;
      uint32_t v59 = 12;
    }
    else
    {
      uint64_t v30 = *(void **)(a1 + 32);
      if ((v29 & 1) == 0)
      {
        [v30 setState:3];
        goto LABEL_68;
      }
      [v30 setState:2];
      uint64_t v53 = WFLogForCategory(0);
      os_log_type_t v74 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v53 || !os_log_type_enabled(v53, v74))
      {
LABEL_65:

        goto LABEL_68;
      }
      v75 = *(void **)(a1 + 32);
      BOOL v76 = (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) & 1) == 0;
      *(_DWORD *)long long buf = 138412546;
      v82 = v75;
      __int16 v83 = 1024;
      LODWORD(v84) = v76;
      v56 = "%@: not associated, userAutoJoin state=%d";
      char v57 = v53;
      os_log_type_t v58 = v74;
      uint32_t v59 = 18;
    }
    _os_log_impl(&dword_226071000, v57, v58, v56, buf, v59);
    goto LABEL_65;
  }
  if ([v7 carPlayNetworkType] == 1)
  {
    id v13 = WFLogForCategory(0);
    os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
    {
      id v15 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      v82 = v15;
      _os_log_impl(&dword_226071000, v13, v14, "%@: associated to CarPlay only network", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setState:2];
    [*(id *)(a1 + 32) setAssociatedToCarPlayOnly:1];
    id v16 = [*(id *)(a1 + 32) linkQuality];

    if (v16)
    {
      int v17 = WFLogForCategory(0);
      os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v17)
      {
        __int16 v19 = v17;
        if (os_log_type_enabled(v19, v18))
        {
          __int16 v20 = *(void **)(a1 + 32);
          uint64_t v21 = [v20 linkQuality];
          *(_DWORD *)long long buf = 138412546;
          v82 = v20;
          __int16 v83 = 2112;
          v84 = v21;
          _os_log_impl(&dword_226071000, v19, v18, "%@: clearing out link quality='%@' due to CarPlay only network", buf, 0x16u);
        }
      }

      [*(id *)(a1 + 32) setLinkQuality:0];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_47;
    block[3] = &unk_26478EFE0;
    id v22 = *(id *)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v80 = v22;
    dispatch_async(MEMORY[0x263EF83A0], block);
    uint64_t v23 = v80;
LABEL_44:

    goto LABEL_68;
  }
  [*(id *)(a1 + 32) setAssociatedToCarPlayOnly:0];
  uint64_t v31 = [*(id *)(a1 + 32) linkQuality];
  if (!v31) {
    goto LABEL_29;
  }
  v32 = (void *)v31;
  v33 = [*(id *)(a1 + 32) linkQuality];
  char v34 = [v33 ssid];
  v35 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
  char v36 = [v34 isEqualToString:v35];

  if ((v36 & 1) == 0)
  {
LABEL_29:
    v37 = WFLogForCategory(0);
    os_log_type_t v38 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v37)
    {
      v39 = v37;
      if (os_log_type_enabled(v39, v38))
      {
        v40 = *(void **)(a1 + 32);
        v41 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
        *(_DWORD *)long long buf = 138412546;
        v82 = v40;
        __int16 v83 = 2112;
        v84 = v41;
        _os_log_impl(&dword_226071000, v39, v38, "%@: creating link quality for network %@", buf, 0x16u);
      }
    }

    double v42 = [v7 displayFriendlyName];
    if (!v42)
    {
      double v42 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
    }
    v43 = [WFLinkQuality alloc];
    LODWORD(v44) = 1.0;
    int v45 = [(WFLinkQuality *)v43 initWithSSID:v42 rssi:0 scaledRSSI:v44];
    [*(id *)(a1 + 32) setLinkQuality:v45];
  }
  v46 = [*(id *)(a1 + 32) client];
  int v47 = [v46 isCellularOutrankingWiFi];

  if (v47)
  {
    v48 = WFLogForCategory(0);
    os_log_type_t v49 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v48)
    {
      v50 = v48;
      if (os_log_type_enabled(v50, v49))
      {
        uint64_t v51 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
        *(_DWORD *)long long buf = 138412290;
        v82 = v51;
        _os_log_impl(&dword_226071000, v50, v49, "associated to '%@' but cellular is outranking WiFi", buf, 0xCu);
      }
    }

    [*(id *)(a1 + 32) setState:2];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_48;
    v77[3] = &unk_26478EFE0;
    id v52 = *(id *)(a1 + 40);
    v77[4] = *(void *)(a1 + 32);
    id v78 = v52;
    dispatch_async(MEMORY[0x263EF83A0], v77);
    uint64_t v23 = v78;
    goto LABEL_44;
  }
  [*(id *)(a1 + 32) setState:4];
  v60 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v60)
  {
    if (v8)
    {
      uint64_t v61 = [v60 networkName];
      if (v61)
      {
        v62 = (void *)v61;
        uint64_t v63 = [v8 networkName];
        if (v63)
        {
          v64 = (void *)v63;
          uint64_t v65 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
          v66 = [v8 networkName];
          char v67 = [v65 isEqual:v66];

          if ((v67 & 1) == 0)
          {
            v68 = WFLogForCategory(0);
            os_log_type_t v69 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v68)
            {
              v70 = v68;
              if (os_log_type_enabled(v70, v69))
              {
                uint64_t v71 = *(void **)(a1 + 32);
                v72 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) networkName];
                id v73 = [v8 networkName];
                *(_DWORD *)long long buf = 138412802;
                v82 = v71;
                __int16 v83 = 2112;
                v84 = v72;
                __int16 v85 = 2112;
                id v86 = v73;
                _os_log_impl(&dword_226071000, v70, v69, "%@: network changed (was %@, is %@), calling state change handler", buf, 0x20u);
              }
            }

            [*(id *)(a1 + 32) _notifyStateChanged:4 newState:4];
          }
        }
        else
        {
        }
      }
    }
  }
  [*(id *)(a1 + 32) setCurrentNetwork:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
LABEL_68:
}

uint64_t __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_47(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(result + 32) state];
    id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return v3(v1, v2);
  }
  return result;
}

uint64_t __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_48(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(result + 32) state];
    id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return v3(v1, v2);
  }
  return result;
}

uint64_t __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_49(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(result + 32) state];
    id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return v3(v1, v2);
  }
  return result;
}

- (void)_powerStateDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    id v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      os_log_type_t v8 = [v4 object];
      int v9 = 138412546;
      os_log_type_t v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "%@: (sender: %@) power state changed", (uint8_t *)&v9, 0x16u);
    }
  }

  [(WFWiFiStateMonitor *)self _updateState];
}

- (void)_clientConnectionRestarted:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)long long buf = 138412290;
    int v9 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%@: client connection restarted", buf, 0xCu);
  }

  int64_t v6 = [(WFWiFiStateMonitor *)self state];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__WFWiFiStateMonitor__clientConnectionRestarted___block_invoke;
  v7[3] = &unk_26478F668;
  v7[4] = self;
  void v7[5] = v6;
  [(WFWiFiStateMonitor *)self _updateState:v7];
}

uint64_t __49__WFWiFiStateMonitor__clientConnectionRestarted___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [v1 state];
  return [v1 _notifyStateChanged:v2 newState:v3];
}

- (void)_hostAPStateChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%@: host ap state change", (uint8_t *)&v6, 0xCu);
  }

  [(WFWiFiStateMonitor *)self _updateState];
}

- (void)_interfaceBecameAvailable:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)long long buf = 138412290;
    __int16 v11 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%@: interface became available", buf, 0xCu);
  }

  int64_t v6 = [(WFWiFiStateMonitor *)self state];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__WFWiFiStateMonitor__interfaceBecameAvailable___block_invoke;
  v9[3] = &unk_26478F668;
  v9[4] = self;
  v9[5] = v6;
  [(WFWiFiStateMonitor *)self _updateState:v9];
  id v7 = [(WFWiFiStateMonitor *)self client];
  uint64_t v8 = [v7 interface];
  [(WFWiFiStateMonitor *)self _registerInterfaceObserversForInterface:v8];
}

uint64_t __48__WFWiFiStateMonitor__interfaceBecameAvailable___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [v1 state];
  return [v1 _notifyStateChanged:v2 newState:v3];
}

- (void)_autoJoinStateChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%@: auto join state changed", (uint8_t *)&v6, 0xCu);
  }

  [(WFWiFiStateMonitor *)self _updateState];
}

- (void)_outrankStateDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%@: cellular outrank state changed", (uint8_t *)&v6, 0xCu);
  }

  [(WFWiFiStateMonitor *)self _updateState];
}

- (void)_carPlayNetworkTypeDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%@: car play network type did change", (uint8_t *)&v6, 0xCu);
  }

  [(WFWiFiStateMonitor *)self _updateState];
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (identifier)
  {
    uint64_t v3 = identifier;
  }
  else
  {
    os_log_type_t v5 = [(WFWiFiStateMonitor *)self bundleIdentifier];

    if (v5)
    {
      uint64_t v3 = [(WFWiFiStateMonitor *)self bundleIdentifier];
    }
    else
    {
      uint64_t v3 = @"UNKNOWN";
    }
  }
  return (NSString *)v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  os_log_type_t v5 = NSStringFromClass(v4);
  int v6 = [(WFWiFiStateMonitor *)self identifier];
  unint64_t v7 = [(WFWiFiStateMonitor *)self state];
  if (v7 > 5) {
    uint64_t v8 = @"Unknown";
  }
  else {
    uint64_t v8 = off_26478F688[v7];
  }
  int v9 = [(WFWiFiStateMonitor *)self currentNetwork];
  uint64_t v10 = [v9 networkName];
  if (v10)
  {
    __int16 v11 = [(WFWiFiStateMonitor *)self currentNetwork];
    uint64_t v12 = [v11 networkName];
    uint64_t v13 = [v3 stringWithFormat:@"<%@ : %p identifier='%@' state='%@' network='%@'>", v5, self, v6, v8, v12];
  }
  else
  {
    uint64_t v13 = [v3 stringWithFormat:@"<%@ : %p identifier='%@' state='%@' network='%@'>", v5, self, v6, v8, &stru_26D9BFD58];
  }

  return v13;
}

- (void)setHandler:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)wifiUIStateFlagsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWifiUIStateFlagsQueue:(id)a3
{
}

- (BOOL)associatedToCarPlayOnly
{
  return self->_associatedToCarPlayOnly;
}

- (void)setCallbackRunLoop:(id)a3
{
  self->_callbackRunLoop = (NSRunLoop *)a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callbackThread, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
  objc_storeStrong((id *)&self->_wifiUIStateFlagsQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_linkQuality, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end