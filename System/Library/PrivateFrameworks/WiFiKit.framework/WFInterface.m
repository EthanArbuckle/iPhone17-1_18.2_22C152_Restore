@interface WFInterface
- (BOOL)associatedOnIRInterface;
- (BOOL)currentNetworkIsDirected;
- (BOOL)hasNoGatewayIP;
- (BOOL)hasValidIPAddress;
- (BOOL)ipv4SelfAssigned;
- (BOOL)isReadyForConnectionVelocityTest;
- (BOOL)monitoringEvents;
- (BOOL)scanning;
- (CWFInterface)cInterface;
- (CWFInterface)irInterface;
- (NSArray)deviceScanChannels;
- (NSArray)deviceScanChannelsPerCurLocale;
- (NSOperationQueue)joinQueue;
- (NSRunLoop)callbackRunLoop;
- (NSSet)currentNetworkIssues;
- (NSString)interfaceName;
- (NSThread)callbackThread;
- (OS_dispatch_queue)currentNetworkQueue;
- (OS_dispatch_queue)networkProcessingQueue;
- (WFClient)wifiClient;
- (WFIPMonitor)ipMonitor;
- (WFInterface)initWithDevice:(__WiFiDeviceClient *)a3;
- (WFInterface)initWithDevice:(__WiFiDeviceClient *)a3 coreWiFiInterface:(id)a4;
- (WFInterface)initWithDevice:(__WiFiDeviceClient *)a3 coreWiFiInterface:(id)a4 interfaceName:(id)a5;
- (WFNetworkScanRecord)coreWiFiCurrentNetwork;
- (WFNetworkScanRecord)currentNetwork;
- (__WiFiDeviceClient)device;
- (id)IPv4ARPResolvedIPAddress;
- (id)IPv4Addresses;
- (id)IPv4RouterAddress;
- (id)IPv4SubnetMasks;
- (id)IPv6Addresses;
- (id)IPv6RouterAddress;
- (id)_currentInterface;
- (id)_debugLQMString:(id)a3;
- (id)currentKnownNetworkProfile;
- (int)ipState;
- (void)_carPlayNetworkTypeChangedCallback:(int)a3;
- (void)_currentNetworkDidChangeWithReason:(unint64_t)a3 previousNetwork:(id)a4;
- (void)_hostAPStateDidChange:(id)a3;
- (void)_initCurrentNetwork;
- (void)_linkChangedWithInfo:(id)a3;
- (void)_linkQualityChanged:(id)a3;
- (void)_resetCurrentNetworkStates;
- (void)_startMonitoringWiFiEvents;
- (void)_stopMonitoringWiFiEvents;
- (void)_updateCurrentNetworkWithNetwork:(__WiFiNetwork *)a3 callback:(id)a4;
- (void)_updateCurrentNetworkWithNetwork:(__WiFiNetwork *)a3 forceUpdateNetwork:(BOOL)a4 callback:(id)a5 userInfo:(id)a6;
- (void)_wifiManagerRestarted:(id)a3;
- (void)asyncAssociateToNetwork:(id)a3 password:(id)a4 reply:(id)a5;
- (void)asyncAssociateToNetwork:(id)a3 profile:(id)a4 reply:(id)a5;
- (void)asyncCurrentNetwork:(id)a3;
- (void)asyncCurrentScanResult:(id)a3;
- (void)asyncHS20Supported:(id)a3;
- (void)asyncScanRequest:(id)a3 reply:(id)a4;
- (void)createNANInterface;
- (void)dealloc;
- (void)disassociateFromCarPlayUserConfiguredNetwork;
- (void)disassociateFromCurrentNetwork;
- (void)disassociateFromCurrentNetworkWithCompletion:(id)a3;
- (void)notifyNoNetworksFound;
- (void)setAssociatedOnIRInterface:(BOOL)a3;
- (void)setCInterface:(id)a3;
- (void)setCallbackRunLoop:(id)a3;
- (void)setCallbackThread:(id)a3;
- (void)setCoreWiFiCurrentNetwork:(id)a3;
- (void)setCurrentNetwork:(id)a3;
- (void)setCurrentNetworkIsDirected:(BOOL)a3;
- (void)setCurrentNetworkIssues:(id)a3;
- (void)setCurrentNetworkQueue:(id)a3;
- (void)setDevice:(__WiFiDeviceClient *)a3;
- (void)setDeviceScanChannels:(id)a3;
- (void)setDeviceScanChannelsPerCurLocale:(id)a3;
- (void)setHasNoGatewayIP:(BOOL)a3;
- (void)setInterfaceName:(id)a3;
- (void)setIpMonitor:(id)a3;
- (void)setIpState:(int)a3;
- (void)setIpv4SelfAssigned:(BOOL)a3;
- (void)setIrInterface:(id)a3;
- (void)setJoinQueue:(id)a3;
- (void)setMonitoringEvents:(BOOL)a3;
- (void)setNetworkProcessingQueue:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setWifiClient:(id)a3;
- (void)updateDeviceScanChannelsPerCurLocale;
@end

@implementation WFInterface

void __35__WFInterface_asyncCurrentNetwork___block_invoke_60(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) coreWiFiCurrentNetwork];
  if (v4)
  {
    v1 = [*(id *)(a1 + 32) coreWiFiCurrentNetwork];
    v3 = (void *)[v1 copy];
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (v4)
  {
  }
}

uint64_t __29__WFInterface_currentNetwork__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) coreWiFiCurrentNetwork];
  return MEMORY[0x270F9A758]();
}

- (WFNetworkScanRecord)coreWiFiCurrentNetwork
{
  return self->_coreWiFiCurrentNetwork;
}

uint64_t __35__WFInterface_asyncCurrentNetwork___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCoreWiFiCurrentNetwork:*(void *)(a1 + 40)];
}

- (void)setCoreWiFiCurrentNetwork:(id)a3
{
}

void __35__WFInterface_asyncCurrentNetwork___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained cInterface];
  id v4 = [v3 currentScanResult];

  v5 = [WeakRetained irInterface];
  v6 = [v5 currentScanResult];

  v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[WFInterface asyncCurrentNetwork:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v45 = v6;
    _os_log_impl(&dword_226071000, v7, v8, "%s: infraScanResult='%@' nanScanResult='%@'", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  id v47 = 0;
  v9 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WFInterface_asyncCurrentNetwork___block_invoke_60;
  block[3] = &unk_26478EF18;
  block[4] = WeakRetained;
  block[5] = buf;
  dispatch_sync(v9, block);
  if (v4)
  {
    v10 = [WFCurrentNetworkScanRecord alloc];
    v11 = [WeakRetained cInterface];
    v12 = [v11 currentKnownNetworkProfile];
    v13 = [(WFCurrentNetworkScanRecord *)v10 initWithScanResult:v4 knownNetworkProfile:v12];
    char v14 = 0;
  }
  else
  {
    if (!v6)
    {
      v13 = 0;
      goto LABEL_10;
    }
    v15 = [WFCurrentNetworkScanRecord alloc];
    v11 = [WeakRetained irInterface];
    v12 = [v11 currentKnownNetworkProfile];
    v13 = [(WFCurrentNetworkScanRecord *)v15 initWithScanResult:v6 knownNetworkProfile:v12];
    char v14 = 1;
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 13) = v14;
LABEL_10:
  v16 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __35__WFInterface_asyncCurrentNetwork___block_invoke_2;
  v35[3] = &unk_26478E7D8;
  v35[4] = WeakRetained;
  v17 = v13;
  v36 = v17;
  dispatch_sync(v16, v35);
  uint64_t v18 = *(void *)&buf[8];
  v19 = *(void **)(*(void *)&buf[8] + 40);
  if (!v19 || !v17)
  {
    BOOL v21 = v19 == 0;
    if (!v19 || v17) {
      goto LABEL_17;
    }
LABEL_16:
    int v22 = 1;
    goto LABEL_20;
  }
  int v20 = [v19 isEqual:v17];
  uint64_t v18 = *(void *)&buf[8];
  if (!v20) {
    goto LABEL_16;
  }
  BOOL v21 = *(void *)(*(void *)&buf[8] + 40) == 0;
LABEL_17:
  if (v17) {
    int v22 = v21;
  }
  else {
    int v22 = 0;
  }
LABEL_20:
  v23 = [*(id *)(v18 + 40) matchingKnownNetworkProfile];
  int v24 = [v23 isStandalone6G];
  v25 = [(WFNetworkScanRecord *)v17 matchingKnownNetworkProfile];
  int v26 = [v25 isStandalone6G];

  if (v22 | v24 ^ v26)
  {
    v27 = WFLogForCategory(0);
    os_log_type_t v28 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v27 && os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)v38 = 136315650;
      v39 = "-[WFInterface asyncCurrentNetwork:]_block_invoke_3";
      __int16 v40 = 2112;
      v41 = v17;
      __int16 v42 = 2112;
      uint64_t v43 = v29;
      _os_log_impl(&dword_226071000, v27, v28, "%s: network changed to: '%@' from: '%@'", v38, 0x20u);
    }

    [WeakRetained _resetCurrentNetworkStates];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __35__WFInterface_asyncCurrentNetwork___block_invoke_63;
    v34[3] = &unk_26478EF40;
    v34[4] = WeakRetained;
    v34[5] = buf;
    v34[6] = 0;
    dispatch_async(MEMORY[0x263EF83A0], v34);
  }
  else
  {
    v30 = WFLogForCategory(0);
    os_log_type_t v31 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v30 && os_log_type_enabled(v30, v31))
    {
      v32 = *(WFCurrentNetworkScanRecord **)(*(void *)&buf[8] + 40);
      *(_DWORD *)v38 = 136315394;
      v39 = "-[WFInterface asyncCurrentNetwork:]_block_invoke_2";
      __int16 v40 = 2112;
      v41 = v32;
      _os_log_impl(&dword_226071000, v30, v31, "%s: no change to network '%@'", v38, 0x16u);
    }
  }
  uint64_t v33 = *(void *)(a1 + 40);
  if (v33) {
    (*(void (**)(uint64_t, WFCurrentNetworkScanRecord *))(v33 + 16))(v33, v17);
  }

  _Block_object_dispose(buf, 8);
}

- (CWFInterface)cInterface
{
  return self->_cInterface;
}

- (WFNetworkScanRecord)currentNetwork
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  currentNetworkQueue = self->_currentNetworkQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__WFInterface_currentNetwork__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(currentNetworkQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WFNetworkScanRecord *)v3;
}

- (CWFInterface)irInterface
{
  return self->_irInterface;
}

- (void)asyncCurrentNetwork:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  networkProcessingQueue = self->_networkProcessingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__WFInterface_asyncCurrentNetwork___block_invoke;
  v7[3] = &unk_26478EF68;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(networkProcessingQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __34__WFInterface__initCurrentNetwork__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentNetworkDidChangeWithReason:0 previousNetwork:0];
}

- (void)_currentNetworkDidChangeWithReason:(unint64_t)a3 previousNetwork:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a4;
  v7 = [(WFInterface *)self currentNetwork];
  uint64_t v8 = [v7 copy];

  if (v6 | v8)
  {
    id v9 = [MEMORY[0x263EFF9A0] dictionary];
    v10 = v9;
    if (v8) {
      [v9 setObject:v8 forKey:@"WFInterfaceNetworkKey"];
    }
    if (v6) {
      [v10 setObject:v6 forKey:@"WFInterfacePreviousNetworkKey"];
    }
    id v11 = [NSNumber numberWithUnsignedInteger:a3];
    [v10 setObject:v11 forKey:@"WFInterfaceNetworkChangeReason"];

    v12 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v12 && os_log_type_enabled(v12, v13))
    {
      int v16 = 138412802;
      v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      _os_log_impl(&dword_226071000, v12, v13, "%@: Current network changed, %@ (reason %lu)", (uint8_t *)&v16, 0x20u);
    }

    char v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 postNotificationName:@"WFInterfaceNetworkChangedNotification" object:self userInfo:v10];
  }
  else
  {
    v10 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v15))
    {
      int v16 = 136315138;
      v17 = (WFInterface *)"-[WFInterface _currentNetworkDidChangeWithReason:previousNetwork:]";
      _os_log_impl(&dword_226071000, v10, v15, "%s: current/previous network are both nil", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)setWifiClient:(id)a3
{
}

- (WFInterface)initWithDevice:(__WiFiDeviceClient *)a3 coreWiFiInterface:(id)a4 interfaceName:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a4;
  v10 = (NSString *)a5;
  if (!a3)
  {
    os_log_type_t v15 = WFLogForCategory(0);
    os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v29)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 136315138;
    v34 = "-[WFInterface initWithDevice:coreWiFiInterface:interfaceName:]";
    v30 = "%s: nil WiFiDeviceClientRef";
    goto LABEL_32;
  }
  v32.receiver = self;
  v32.super_class = (Class)WFInterface;
  id v11 = [(WFInterface *)&v32 init];
  self = v11;
  if (!v11) {
    goto LABEL_34;
  }
  [(WFInterface *)v11 setDevice:a3];
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v12 = [v9 interfaceName];
  }
  v10 = v12;
  interfaceName = self->_interfaceName;
  self->_interfaceName = v12;

  char v14 = self->_interfaceName;
  os_log_type_t v15 = WFLogForCategory(0);
  if (!v14)
  {
    os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v29)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 136315138;
    v34 = "-[WFInterface initWithDevice:coreWiFiInterface:interfaceName:]";
    v30 = "%s: nil interface name";
LABEL_32:
    _os_log_impl(&dword_226071000, v15, v29, v30, buf, 0xCu);
LABEL_33:

    goto LABEL_34;
  }
  os_log_type_t v16 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v15 && os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[WFInterface initWithDevice:coreWiFiInterface:interfaceName:]";
    __int16 v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_226071000, v15, v16, "%s: interface name %@", buf, 0x16u);
  }

  v17 = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
  currentNetworkQueue = self->_currentNetworkQueue;
  self->_currentNetworkQueue = v17;

  if (self->_currentNetworkQueue)
  {
    uint64_t v19 = (OS_dispatch_queue *)dispatch_queue_create(0, MEMORY[0x263EF83A8]);
    networkProcessingQueue = self->_networkProcessingQueue;
    self->_networkProcessingQueue = v19;

    if (self->_networkProcessingQueue)
    {
      unint64_t v21 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
      joinQueue = self->_joinQueue;
      self->_joinQueue = v21;

      v23 = self->_joinQueue;
      if (v23)
      {
        [(NSOperationQueue *)v23 setQualityOfService:25];
        int v24 = [[WFIPMonitor alloc] initWithInterfaceName:self->_interfaceName];
        ipMonitor = self->_ipMonitor;
        self->_ipMonitor = v24;

        if (self->_ipMonitor)
        {
          objc_storeStrong((id *)&self->_cInterface, a4);
          if (v9)
          {
            [(WFInterface *)self createNANInterface];
          }
          else
          {
            int v26 = WFLogForCategory(0);
            os_log_type_t v27 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v26 && os_log_type_enabled(v26, v27))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v26, v27, "CoreWiFi Interface is Missing while initializing WFInterface", buf, 2u);
            }
          }
          [(WFInterface *)self _startMonitoringWiFiEvents];
          [(WFInterface *)self _initCurrentNetwork];
          goto LABEL_23;
        }
      }
    }
  }
LABEL_34:
  device = self->_device;
  if (device)
  {
    CFRelease(device);
    self->_device = 0;
  }

  self = 0;
LABEL_23:

  return self;
}

- (void)setDevice:(__WiFiDeviceClient *)a3
{
  device = self->_device;
  if (device) {
    CFRelease(device);
  }
  self->_device = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (WFInterface)initWithDevice:(__WiFiDeviceClient *)a3 coreWiFiInterface:(id)a4
{
  return [(WFInterface *)self initWithDevice:a3 coreWiFiInterface:a4 interfaceName:0];
}

- (void)createNANInterface
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(WFInterface *)self cInterface];
  id v4 = [v3 NANData];
  irInterface = self->_irInterface;
  self->_irInterface = v4;

  self->_associatedOnIRInterface = 0;
  unint64_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = self->_irInterface;
    int v9 = 136315394;
    v10 = "-[WFInterface createNANInterface]";
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_226071000, v6, v7, "%s: NAN interface: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_startMonitoringWiFiEvents
{
  if ([(WFInterface *)self monitoringEvents])
  {
    id v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v3, v4, "Already monitoring wifi events.", buf, 2u);
    }
  }
  else
  {
    [(WFInterface *)self setMonitoringEvents:1];
    WiFiDeviceClientRegisterHostApStateChangedCallback();
    WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback();
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel__wifiManagerRestarted_ name:@"WFClientServerRestartedNotification" object:0];
  }
}

- (void)setMonitoringEvents:(BOOL)a3
{
  self->_monitoringEvents = a3;
}

- (BOOL)monitoringEvents
{
  return self->_monitoringEvents;
}

- (void)_initCurrentNetwork
{
  objc_initWeak(&location, self);
  networkProcessingQueue = self->_networkProcessingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WFInterface__initCurrentNetwork__block_invoke;
  block[3] = &unk_26478E398;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(networkProcessingQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __34__WFInterface__initCurrentNetwork__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  return MEMORY[0x270F9A758]();
}

void __34__WFInterface__initCurrentNetwork__block_invoke_2(uint64_t a1)
{
  v2 = [WFCurrentNetworkScanRecord alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) cInterface];
  os_log_type_t v4 = [v8 currentKnownNetworkProfile];
  uint64_t v5 = [(WFCurrentNetworkScanRecord *)v2 initWithScanResult:v3 knownNetworkProfile:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  os_log_type_t v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v5;
}

void __34__WFInterface__initCurrentNetwork__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 136) currentScanResult];
  os_log_type_t v4 = [*(id *)(*(void *)(a1 + 32) + 144) currentScanResult];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 136) currentKnownNetworkProfile];
  uint64_t v6 = v5;
  if (v3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 80);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__WFInterface__initCurrentNetwork__block_invoke_2;
    block[3] = &unk_26478E7B0;
    block[4] = v7;
    int v9 = (id *)v24;
    v24[0] = v3;
    v24[1] = WeakRetained;
    dispatch_sync(v8, block);
    *(unsigned char *)(*(void *)(a1 + 32) + 13) = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__0;
    v21[4] = __Block_byref_object_dispose__0;
    uint64_t v22 = 0;
    uint64_t v10 = *(void *)(a1 + 32);
    __int16 v11 = *(NSObject **)(v10 + 80);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __34__WFInterface__initCurrentNetwork__block_invoke_3;
    v20[3] = &unk_26478EF18;
    v20[4] = v10;
    v20[5] = v21;
    dispatch_sync(v11, v20);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __34__WFInterface__initCurrentNetwork__block_invoke_4;
    v19[3] = &unk_26478E528;
    v19[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v19);
    _Block_object_dispose(v21, 8);
    v12 = v22;
LABEL_5:

    goto LABEL_6;
  }
  if (v4)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    char v14 = *(NSObject **)(v13 + 80);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __34__WFInterface__initCurrentNetwork__block_invoke_5;
    v16[3] = &unk_26478E7B0;
    int v9 = (id *)&v17;
    v16[4] = v13;
    uint64_t v17 = 0;
    id v18 = v5;
    dispatch_sync(v14, v16);
    *(unsigned char *)(*(void *)(a1 + 32) + 13) = 1;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __34__WFInterface__initCurrentNetwork__block_invoke_6;
    v15[3] = &unk_26478E528;
    v15[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v15);
    v12 = v18;
    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)isReadyForConnectionVelocityTest
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WFInterface *)self cInterface];

  if (v3)
  {
    os_log_type_t v4 = [(WFInterface *)self cInterface];
    uint64_t v5 = [v4 IPv4RouterAddress];
    if (v5)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v10 = [(WFInterface *)self cInterface];
      __int16 v11 = [v10 IPv6RouterAddress];
      BOOL v6 = v11 != 0;
    }
    v12 = [(WFInterface *)self cInterface];
    uint64_t v13 = [v12 DHCPLeaseStartedAt];

    char v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
    {
      v16[0] = 67109376;
      v16[1] = v6;
      __int16 v17 = 1024;
      BOOL v18 = v13 != 0;
      _os_log_impl(&dword_226071000, v14, v15, "network has valid IP: %d, network has DHCP Lease: %d", (uint8_t *)v16, 0xEu);
    }

    return v13 && v6;
  }
  else
  {
    uint64_t v7 = WFLogForCategory(0);
    uint64_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, (os_log_type_t)v8))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_226071000, v7, (os_log_type_t)v8, "Unable to get core wifi interface!", (uint8_t *)v16, 2u);
    }

    return 0;
  }
}

- (WFInterface)initWithDevice:(__WiFiDeviceClient *)a3
{
  return [(WFInterface *)self initWithDevice:a3 coreWiFiInterface:0];
}

- (void)dealloc
{
  if (self->_device)
  {
    WiFiDeviceClientRegisterHostApStateChangedCallback();
    WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback();
    device = self->_device;
    if (device)
    {
      CFRelease(device);
      self->_device = 0;
    }
  }
  [(WFInterface *)self _stopMonitoringWiFiEvents];
  v4.receiver = self;
  v4.super_class = (Class)WFInterface;
  [(WFInterface *)&v4 dealloc];
}

- (void)_stopMonitoringWiFiEvents
{
  if ([(WFInterface *)self monitoringEvents])
  {
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self];
  }
  else
  {
    uint64_t v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v3, v4, "Unable to stop monitoring wifi events, currently not monitoring.", buf, 2u);
    }
  }
}

- (void)_wifiManagerRestarted:(id)a3
{
  os_log_type_t v4 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WFInterface__wifiManagerRestarted___block_invoke;
  block[3] = &unk_26478E528;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __37__WFInterface__wifiManagerRestarted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentNetworkWithNetwork:0 callback:0];
}

- (void)asyncHS20Supported:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __34__WFInterface_asyncHS20Supported___block_invoke;
    v6[3] = &unk_26478EEF0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __34__WFInterface_asyncHS20Supported___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [NSNumber numberWithInt:12];
  v2 = (void *)WiFiDeviceClientCopyProperty();
  uint64_t v3 = [NSNumber numberWithInteger:45];
  int v4 = [v2 containsObject:v3];

  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[WFInterface asyncHS20Supported:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: _deviceSupportsHS20 %d", buf, 0x12u);
  }

  if (v2) {
    CFRelease(v2);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__WFInterface_asyncHS20Supported___block_invoke_47;
  v7[3] = &unk_26478EEC8;
  id v8 = *(id *)(a1 + 40);
  char v9 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __34__WFInterface_asyncHS20Supported___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (NSString)interfaceName
{
  if (self->_associatedOnIRInterface)
  {
    v2 = [(WFInterface *)self irInterface];
    uint64_t v3 = [v2 interfaceName];
  }
  else
  {
    uint64_t v3 = self->_interfaceName;
  }
  return v3;
}

- (void)_linkChangedWithInfo:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "Link change with info %@", (uint8_t *)&v7, 0xCu);
  }

  [v4 objectForKey:@"LINK_CHANGED_NETWORK"];
  [(WFInterface *)self _updateCurrentNetworkWithNetwork:objc_claimAutoreleasedReturnValue() forceUpdateNetwork:0 callback:0 userInfo:v4];
}

- (void)_linkQualityChanged:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  if (v4)
  {
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
    {
      int v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        id v8 = [(WFInterface *)self _debugLQMString:v4];
        *(_DWORD *)buf = 136315394;
        v30 = "-[WFInterface _linkQualityChanged:]";
        __int16 v31 = 2112;
        objc_super v32 = v8;
        _os_log_impl(&dword_226071000, v7, v6, "%s %@", buf, 0x16u);
      }
    }

    id v5 = [(WFInterface *)self currentNetwork];

    if (!v5) {
      goto LABEL_21;
    }
    uint64_t v9 = [v4 objectForKey:@"RSSI"];
    uint64_t v10 = [v4 objectForKey:@"SCALED_RSSI"];
    __int16 v11 = (void *)v10;
    id v5 = 0;
    if (v9 && v10)
    {
      __int16 v12 = [(WFInterface *)self currentNetwork];
      int v13 = [v12 matchingKnownNetworkProfile];
      uint64_t v14 = [v13 displayFriendlyName];

      if (!v14)
      {
        os_log_type_t v15 = [(WFInterface *)self currentNetwork];
        uint64_t v14 = [v15 ssid];
      }
      os_log_type_t v16 = [WFLinkQuality alloc];
      uint64_t v17 = [v9 integerValue];
      [v11 floatValue];
      id v5 = -[WFLinkQuality initWithSSID:rssi:scaledRSSI:](v16, "initWithSSID:rssi:scaledRSSI:", v14, v17);
    }
    BOOL v18 = [v4 objectForKey:*MEMORY[0x263F55E58]];
    uint64_t v19 = v18;
    if (v18)
    {
      int ipState = self->_ipState;
      if (ipState != [v18 intValue])
      {
        int v21 = [v19 intValue];
        self->_int ipState = v21;
        self->_ipv4SelfAssigned = v21 == 1;
      }
    }
    uint64_t v22 = [v4 objectForKey:*MEMORY[0x263F55E48]];
    v23 = v22;
    if (v22 && self->_hasNoGatewayIP != [v22 BOOLValue]) {
      self->_hasNoGatewayIP = [v23 BOOLValue];
    }

    if (v5)
    {
      os_log_type_t v27 = @"WFInterfaceLinkQualityKey";
      os_log_type_t v28 = v5;
      int v24 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    }
    else
    {
LABEL_21:
      int v24 = 0;
    }
    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 postNotificationName:@"WFInterfaceLinkQualityNotification" object:self userInfo:v24];
  }
  else
  {
    os_log_type_t v26 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v26))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[WFInterface _linkQualityChanged:]";
      _os_log_impl(&dword_226071000, v5, v26, "%s: linkQualityChanged is nil", buf, 0xCu);
    }
  }
}

uint64_t __35__WFInterface_asyncCurrentNetwork___block_invoke_63(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentNetworkDidChangeWithReason:*(void *)(a1 + 48) previousNetwork:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)asyncCurrentScanResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__WFInterface_asyncCurrentScanResult___block_invoke;
  v6[3] = &unk_26478EF90;
  id v7 = v4;
  id v5 = v4;
  [(WFInterface *)self asyncCurrentNetwork:v6];
}

void __38__WFInterface_asyncCurrentScanResult___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    a2 = [a2 scanResult];
  }
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateCurrentNetworkWithNetwork:(__WiFiNetwork *)a3 forceUpdateNetwork:(BOOL)a4 callback:(id)a5 userInfo:(id)a6
{
  BOOL v7 = a4;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  if (!a3 && v7)
  {
    a3 = (__WiFiNetwork *)WiFiDeviceClientCopyCurrentNetwork();
    if (a3)
    {
      __int16 v12 = (void *)WiFiNetworkCopyRecord();
      WiFiNetworkGetSSID();
      uint64_t v37 = (char *)objc_claimAutoreleasedReturnValue();
      int v13 = [v12 objectForKey:@"PRIVATE_MAC_ADDRESS"];
      uint64_t v14 = v13;
      if (v13)
      {
        CFDataRef v15 = (const __CFData *)[v13 objectForKey:@"PRIVATE_MAC_ADDRESS_VALUE"];
        if (v15)
        {
          WFConvertEthernetNetworkAddressToString(v15);
          os_log_type_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          os_log_type_t v16 = &stru_26D9BFD58;
        }
        id v17 = v11;
        uint64_t v19 = [v14 objectForKey:@"PRIVATE_MAC_ADDRESS_TYPE"];
        BOOL v18 = ([v19 intValue] & 0xFFFFFFFE) == 2;
      }
      else
      {
        id v17 = v11;
        BOOL v18 = 0;
        os_log_type_t v16 = &stru_26D9BFD58;
      }
      __int16 v20 = WFLogForCategory(0);
      os_log_type_t v21 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v20 && os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138412802;
        v45 = v37;
        __int16 v46 = 2112;
        id v47 = v16;
        __int16 v48 = 1024;
        BOOL v49 = v18;
        _os_log_impl(&dword_226071000, v20, v21, "RANDOM DICT FROM copyCurrentNetwork: SSID: %@, random address: %@, enabled :%d", buf, 0x1Cu);
      }

      id v11 = v17;
    }
  }
  uint64_t v22 = [(WFInterface *)self currentNetwork];
  if (v22)
  {
    v23 = [(WFInterface *)self currentNetwork];
    int v24 = (void *)[v23 copy];
  }
  else
  {
    int v24 = 0;
  }

  if (a3) {
    v25 = [[WFNetworkScanRecord alloc] initWithNetworkRef:a3];
  }
  else {
    v25 = 0;
  }
  uint64_t v26 = [(WFInterface *)self currentNetwork];
  os_log_type_t v27 = (void *)v26;
  if (!a3 || v26)
  {
    os_log_type_t v28 = [(WFInterface *)self currentNetwork];
    BOOL IsEqualToNetwork = NetworkRefIsEqualToNetwork(a3, v28);

    if (!a3 || IsEqualToNetwork)
    {
      uint64_t v33 = [(WFInterface *)self currentNetwork];

      if (a3) {
        BOOL v34 = 1;
      }
      else {
        BOOL v34 = v33 == 0;
      }
      int v30 = !v34;
      goto LABEL_38;
    }
  }
  if (v25)
  {
    int v30 = 1;
LABEL_38:
    __int16 v35 = WFLogForCategory(0);
    os_log_type_t v36 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v35 && os_log_type_enabled(v35, v36))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[WFInterface _updateCurrentNetworkWithNetwork:forceUpdateNetwork:callback:userInfo:]";
      __int16 v46 = 1024;
      LODWORD(v47) = v30;
      _os_log_impl(&dword_226071000, v35, v36, "%s: network change %d", buf, 0x12u);
    }

    if (v30)
    {
      [(WFInterface *)self _resetCurrentNetworkStates];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __85__WFInterface__updateCurrentNetworkWithNetwork_forceUpdateNetwork_callback_userInfo___block_invoke;
      block[3] = &unk_26478EB18;
      block[4] = self;
      uint64_t v43 = 0;
      id v42 = v24;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    if (v10)
    {
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __85__WFInterface__updateCurrentNetworkWithNetwork_forceUpdateNetwork_callback_userInfo___block_invoke_2;
      v38[3] = &unk_26478EEF0;
      v39 = v25;
      id v40 = v10;
      dispatch_async(MEMORY[0x263EF83A0], v38);
    }
    if (a3) {
      CFRelease(a3);
    }
    goto LABEL_48;
  }
  __int16 v31 = WFLogForCategory(0);
  os_log_type_t v32 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v31 && os_log_type_enabled(v31, v32))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[WFInterface _updateCurrentNetworkWithNetwork:forceUpdateNetwork:callback:userInfo:]";
    _os_log_impl(&dword_226071000, v31, v32, "%s: failed to create network", buf, 0xCu);
  }

LABEL_48:
}

uint64_t __85__WFInterface__updateCurrentNetworkWithNetwork_forceUpdateNetwork_callback_userInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentNetworkDidChangeWithReason:*(void *)(a1 + 48) previousNetwork:*(void *)(a1 + 40)];
}

void __85__WFInterface__updateCurrentNetworkWithNetwork_forceUpdateNetwork_callback_userInfo___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateCurrentNetworkWithNetwork:(__WiFiNetwork *)a3 callback:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void))a4;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  id v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  currentNetworkQueue = self->_currentNetworkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke;
  block[3] = &unk_26478EF18;
  block[4] = self;
  void block[5] = &v38;
  dispatch_sync(currentNetworkQueue, block);
  BOOL v7 = [(WFInterface *)self cInterface];
  id v8 = [v7 currentScanResult];

  uint64_t v9 = [(WFInterface *)self irInterface];
  id v10 = [v9 currentScanResult];

  coreWiFiCurrentNetwork = self->_coreWiFiCurrentNetwork;
  self->_coreWiFiCurrentNetwork = 0;

  if (v8)
  {
    __int16 v12 = self->_currentNetworkQueue;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_2;
    v35[3] = &unk_26478E7D8;
    v35[4] = self;
    id v36 = v8;
    dispatch_sync(v12, v35);
    self->_associatedOnIRInterface = 0;
  }
  else if (v10)
  {
    int v13 = self->_currentNetworkQueue;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_3;
    v33[3] = &unk_26478E7D8;
    v33[4] = self;
    id v34 = v10;
    dispatch_sync(v13, v33);
    self->_associatedOnIRInterface = 1;
  }
  else
  {
    self->_associatedOnIRInterface = 0;
  }
  uint64_t v27 = 0;
  os_log_type_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  int v30 = __Block_byref_object_copy__0;
  __int16 v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  uint64_t v14 = self->_currentNetworkQueue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_4;
  v26[3] = &unk_26478EF18;
  v26[4] = self;
  v26[5] = &v27;
  dispatch_sync(v14, v26);
  CFDataRef v15 = (void *)v39[5];
  os_log_type_t v16 = v28;
  if (v15)
  {
    if (!v28[5]) {
      goto LABEL_10;
    }
    if (!objc_msgSend(v15, "isEqual:")) {
      goto LABEL_16;
    }
    os_log_type_t v16 = v28;
    if (v39[5])
    {
LABEL_10:
      uint64_t v17 = v16[5];
      if (v17)
      {
        int v18 = 0;
        goto LABEL_13;
      }
LABEL_16:
      int v19 = 1;
      goto LABEL_17;
    }
  }
  uint64_t v17 = v16[5];
  int v18 = 1;
LABEL_13:
  if (v17) {
    int v19 = v18;
  }
  else {
    int v19 = 0;
  }
LABEL_17:
  __int16 v20 = WFLogForCategory(0);
  os_log_type_t v21 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v20 && os_log_type_enabled(v20, v21))
  {
    *(_DWORD *)buf = 136315906;
    v45 = "-[WFInterface _updateCurrentNetworkWithNetwork:callback:]";
    __int16 v46 = 1024;
    int v47 = v19;
    __int16 v48 = 2112;
    BOOL v49 = v8;
    __int16 v50 = 2112;
    v51 = v10;
    _os_log_impl(&dword_226071000, v20, v21, "%s: network change=%d, infraScanResult='%@' nanScanResult='%@'", buf, 0x26u);
  }

  if (v19)
  {
    [(WFInterface *)self _resetCurrentNetworkStates];
    uint64_t v22 = (void *)[(id)v39[5] copy];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    void v24[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_79;
    v24[3] = &unk_26478E7D8;
    v24[4] = self;
    id v25 = v22;
    id v23 = v22;
    dispatch_async(MEMORY[0x263EF83A0], v24);
  }
  if (v5) {
    v5[2](v5, v28[5]);
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v38, 8);
}

void __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) coreWiFiCurrentNetwork];
  if (v4)
  {
    v1 = [*(id *)(a1 + 32) coreWiFiCurrentNetwork];
    id v3 = (void *)[v1 copy];
  }
  else
  {
    id v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (v4)
  {
  }
}

void __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_2(uint64_t a1)
{
  id v2 = [WFCurrentNetworkScanRecord alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) cInterface];
  id v4 = [v8 currentKnownNetworkProfile];
  uint64_t v5 = [(WFCurrentNetworkScanRecord *)v2 initWithScanResult:v3 knownNetworkProfile:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v5;
}

void __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_3(uint64_t a1)
{
  id v2 = [WFCurrentNetworkScanRecord alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) irInterface];
  id v4 = [v8 currentKnownNetworkProfile];
  uint64_t v5 = [(WFCurrentNetworkScanRecord *)v2 initWithScanResult:v3 knownNetworkProfile:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v5;
}

void __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) coreWiFiCurrentNetwork];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_79(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentNetworkDidChangeWithReason:0 previousNetwork:*(void *)(a1 + 40)];
}

- (void)_resetCurrentNetworkStates
{
  self->_int ipState = 0;
  *(_WORD *)&self->_ipv4SelfAssigned = 0;
  self->_currentNetworkIssues = 0;
  MEMORY[0x270F9A758]();
}

uint64_t __34__WFInterface__initCurrentNetwork__block_invoke_5(void *a1)
{
  *(void *)(a1[4] + 72) = [[WFCurrentNetworkScanRecord alloc] initWithScanResult:a1[5] knownNetworkProfile:a1[6]];
  return MEMORY[0x270F9A758]();
}

uint64_t __34__WFInterface__initCurrentNetwork__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _currentNetworkDidChangeWithReason:0 previousNetwork:0];
}

- (id)currentKnownNetworkProfile
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_associatedOnIRInterface)
  {
    uint64_t v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      int v10 = 136315394;
      id v11 = "-[WFInterface currentKnownNetworkProfile]";
      __int16 v12 = 2112;
      int v13 = 0;
      _os_log_impl(&dword_226071000, v3, v4, "%s: using ir0 profile='%@'", (uint8_t *)&v10, 0x16u);
    }

    id v5 = [(WFInterface *)self irInterface];
    uint64_t v6 = [v5 currentKnownNetworkProfile];
  }
  else
  {
    id v8 = [(WFInterface *)self cInterface];
    uint64_t v6 = [v8 currentKnownNetworkProfile];

    id v5 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v9))
    {
      int v10 = 136315394;
      id v11 = "-[WFInterface currentKnownNetworkProfile]";
      __int16 v12 = 2112;
      int v13 = v6;
      _os_log_impl(&dword_226071000, v5, v9, "%s: using en0 profile='%@'", (uint8_t *)&v10, 0x16u);
    }
  }

  return v6;
}

- (void)asyncScanRequest:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = WFLogForCategory(6uLL);
  os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    int v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      id v11 = [v6 cScanParameters];
      *(_DWORD *)buf = 138412290;
      int v18 = v11;
      _os_log_impl(&dword_226071000, v10, v9, "starting wifi scan with parameters: %@", buf, 0xCu);
    }
  }

  __int16 v12 = [(WFInterface *)self cInterface];
  int v13 = [v6 cScanParameters];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__WFInterface_asyncScanRequest_reply___block_invoke;
  v15[3] = &unk_26478EFB8;
  id v16 = v7;
  id v14 = v7;
  [v12 performScanWithParameters:v13 reply:v15];
}

void __38__WFInterface_asyncScanRequest_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v16 = a2;
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        __int16 v12 = [[WFNetworkScanRecord alloc] initWithScanResults:v11];
        if (v12)
        {
          [v5 addObject:v12];
        }
        else
        {
          int v13 = WFLogForCategory(0);
          os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v22 = "-[WFInterface asyncScanRequest:reply:]_block_invoke";
            __int16 v23 = 2112;
            uint64_t v24 = v11;
            _os_log_impl(&dword_226071000, v13, v14, "%s: failed to convert CWFScanResult (%@) to WFNetworkScanRecord", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)deviceScanChannels
{
  uint64_t v2 = self;
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (self->_deviceScanChannels) {
    goto LABEL_19;
  }
  if (!self->_device)
  {
    id v25 = WFLogForCategory(0);
    os_log_type_t v26 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v25 || !os_log_type_enabled(v25, v26)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "failed to get WiFiDeviceClientRef";
    goto LABEL_30;
  }
  [NSNumber numberWithInt:254];
  uint64_t v3 = WiFiDeviceClientCopyProperty();
  if (!v3)
  {
    id v25 = WFLogForCategory(0);
    os_log_type_t v26 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v25 || !os_log_type_enabled(v25, v26)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "Failed to get support IOC channels from WiFiDeviceClient";
LABEL_30:
    _os_log_impl(&dword_226071000, v25, v26, v27, buf, 2u);
LABEL_31:

    goto LABEL_19;
  }
  id v4 = (void *)v3;
  os_log_type_t v28 = v2;
  __int16 v31 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    uint64_t v8 = @"SUP_CHANNEL";
    uint64_t v9 = @"SUP_CHANNEL_FLAGS";
    unint64_t v10 = 0x26478D000uLL;
    do
    {
      uint64_t v11 = 0;
      uint64_t v29 = v6;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        __int16 v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        int v13 = [v12 objectForKey:v8];
        os_log_type_t v14 = [v12 objectForKey:v9];
        CFDataRef v15 = objc_msgSend(objc_alloc(*(Class *)(v10 + 3080)), "initWithChannel:flags:", objc_msgSend(v13, "integerValue"), objc_msgSend(v14, "integerValue"));
        if (v15)
        {
          [(NSArray *)v31 addObject:v15];
        }
        else
        {
          uint64_t v16 = v7;
          unint64_t v17 = v10;
          long long v18 = v9;
          long long v19 = v8;
          long long v20 = WFLogForCategory(0);
          os_log_type_t v21 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v20 && os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = v13;
            __int16 v38 = 2112;
            v39 = v14;
            _os_log_impl(&dword_226071000, v20, v21, "Unable to create scan channel for channel %@ flags %@", buf, 0x16u);
          }

          uint64_t v8 = v19;
          uint64_t v9 = v18;
          unint64_t v10 = v17;
          uint64_t v7 = v16;
          uint64_t v6 = v29;
        }

        ++v11;
      }
      while (v6 != v11);
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v6);
  }

  uint64_t v2 = v28;
  deviceScanChannels = v28->_deviceScanChannels;
  v28->_deviceScanChannels = v31;

  CFRelease(obj);
LABEL_19:
  __int16 v23 = v2->_deviceScanChannels;
  return v23;
}

- (void)updateDeviceScanChannelsPerCurLocale
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (!self->_device)
  {
    __int16 v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    long long v35 = "-[WFInterface updateDeviceScanChannelsPerCurLocale]";
    id v25 = "%s: Failed to get WiFiDeviceClientRef";
    goto LABEL_26;
  }
  [NSNumber numberWithInt:27];
  uint64_t v3 = WiFiDeviceClientCopyProperty();
  if (!v3)
  {
    __int16 v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    long long v35 = "-[WFInterface updateDeviceScanChannelsPerCurLocale]";
    id v25 = "%s: Failed to get IOC supported channels from WiFiDeviceClient";
LABEL_26:
    _os_log_impl(&dword_226071000, v23, v24, v25, buf, 0xCu);
LABEL_27:

    return;
  }
  id v4 = (void *)v3;
  os_log_type_t v26 = self;
  uint64_t v29 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    uint64_t v8 = @"SUP_CHANNEL";
    uint64_t v9 = @"SUP_CHANNEL_FLAGS";
    unint64_t v10 = 0x26478D000uLL;
    do
    {
      uint64_t v11 = 0;
      uint64_t v27 = v6;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        __int16 v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        int v13 = [v12 objectForKey:v8];
        os_log_type_t v14 = [v12 objectForKey:v9];
        CFDataRef v15 = objc_msgSend(objc_alloc(*(Class *)(v10 + 3080)), "initWithChannel:flags:", objc_msgSend(v13, "integerValue"), objc_msgSend(v14, "integerValue"));
        if (v15)
        {
          [(NSArray *)v29 addObject:v15];
        }
        else
        {
          uint64_t v16 = v7;
          unint64_t v17 = v10;
          long long v18 = v9;
          long long v19 = v8;
          long long v20 = WFLogForCategory(0);
          os_log_type_t v21 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v20 && os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)buf = 138412546;
            long long v35 = (const char *)v13;
            __int16 v36 = 2112;
            uint64_t v37 = v14;
            _os_log_impl(&dword_226071000, v20, v21, "Unable to create scan channel for channel %@ flags %@", buf, 0x16u);
          }

          uint64_t v8 = v19;
          uint64_t v9 = v18;
          unint64_t v10 = v17;
          uint64_t v7 = v16;
          uint64_t v6 = v27;
        }

        ++v11;
      }
      while (v6 != v11);
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v6);
  }

  deviceScanChannelsPerCurLocale = v26->_deviceScanChannelsPerCurLocale;
  v26->_deviceScanChannelsPerCurLocale = v29;

  CFRelease(obj);
}

- (NSArray)deviceScanChannelsPerCurLocale
{
  deviceScanChannelsPerCurLocale = self->_deviceScanChannelsPerCurLocale;
  if (!deviceScanChannelsPerCurLocale)
  {
    [(WFInterface *)self updateDeviceScanChannelsPerCurLocale];
    deviceScanChannelsPerCurLocale = self->_deviceScanChannelsPerCurLocale;
  }
  return deviceScanChannelsPerCurLocale;
}

- (void)asyncAssociateToNetwork:(id)a3 password:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[WFMutableNetworkProfile alloc] initWithNetwork:v10];
  [(WFMutableNetworkProfile *)v11 setPassword:v9];
  [(WFInterface *)self asyncAssociateToNetwork:v10 password:v9 reply:v8];
}

- (void)asyncAssociateToNetwork:(id)a3 profile:(id)a4 reply:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 requiresPassword]) {
    goto LABEL_13;
  }
  if ([v8 isEnterprise])
  {
    uint64_t v11 = WFLogForCategory(5uLL);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11)
    {
      int v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v36 = "-[WFInterface asyncAssociateToNetwork:profile:reply:]";
        __int16 v37 = 1024;
        *(_DWORD *)__int16 v38 = [v9 canAttemptJoin];
        *(_WORD *)&void v38[4] = 1024;
        *(_DWORD *)&v38[6] = [v9 isHS20Network];
        _os_log_impl(&dword_226071000, v13, v12, "%s: enterprise and requires password (canAttemptJoin %d, hs20Network %d)", buf, 0x18u);
      }
    }
    if ([v9 canAttemptJoin] & 1) != 0 || (objc_msgSend(v9, "isHS20Network")) {
      goto LABEL_13;
    }
  }
  os_log_type_t v14 = [v8 matchingKnownNetworkProfile];
  if (v14)
  {

    goto LABEL_13;
  }
  CFDataRef v15 = [v9 password];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
LABEL_13:
    objc_initWeak(&location, self);
    unint64_t v17 = [MEMORY[0x263F386C8] associationParametersFromScanRecord:v8 profile:v9];
    long long v18 = WFLogForCategory(5uLL);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v36 = "-[WFInterface asyncAssociateToNetwork:profile:reply:]";
      __int16 v37 = 2112;
      *(void *)__int16 v38 = v8;
      *(_WORD *)&v38[8] = 2112;
      uint64_t v39 = v17;
      _os_log_impl(&dword_226071000, v18, v19, "%s: associating to %@ with params %@", buf, 0x20u);
    }

    [v8 isEnterprise];
    id v20 = objc_alloc((Class)objc_opt_class());
    os_log_type_t v21 = [(WFInterface *)self cInterface];
    uint64_t v22 = (void *)[v20 initWithAssocParameters:v17 interface:v21];

    objc_initWeak((id *)buf, v22);
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __53__WFInterface_asyncAssociateToNetwork_profile_reply___block_invoke;
    long long v30 = &unk_26478F008;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, (id *)buf);
    id v31 = v10;
    [v22 setCompletionBlock:&v27];
    __int16 v23 = objc_msgSend(MEMORY[0x263F08A48], "mainQueue", v27, v28, v29, v30);
    [v23 addOperation:v22];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);

    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  os_log_type_t v24 = [MEMORY[0x263F087E8] associationErrorWithReason:0];
  id v25 = WFLogForCategory(5uLL);
  os_log_type_t v26 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226071000, v25, v26, "unable to find password in keychain", buf, 2u);
  }

  (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v24);
LABEL_18:
}

void __53__WFInterface_asyncAssociateToNetwork_profile_reply___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = [v3 error];
  if (!v4)
  {
    uint64_t v5 = WFLogForCategory(5uLL);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 136315138;
      int v13 = "-[WFInterface asyncAssociateToNetwork:profile:reply:]_block_invoke";
      _os_log_impl(&dword_226071000, v5, v6, "%s: forcing network update for successful association", buf, 0xCu);
    }

    [WeakRetained _updateCurrentNetworkWithNetwork:0 callback:0];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__WFInterface_asyncAssociateToNetwork_profile_reply___block_invoke_94;
  v9[3] = &unk_26478EFE0;
  id v7 = a1[4];
  id v10 = v4;
  id v11 = v7;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __53__WFInterface_asyncAssociateToNetwork_profile_reply___block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (void)disassociateFromCurrentNetwork
{
}

- (void)disassociateFromCurrentNetworkWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(WFInterface *)self wifiClient];
  os_log_type_t v6 = [v5 cInterface];

  id v7 = WFLogForCategory(5uLL);
  os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v6)
  {
    if (v10 && os_log_type_enabled(v7, v8))
    {
      int v12 = 136315138;
      int v13 = "-[WFInterface disassociateFromCurrentNetworkWithCompletion:]";
      _os_log_impl(&dword_226071000, v7, v8, "%s: disassociating from current network", (uint8_t *)&v12, 0xCu);
    }

    id v7 = [(WFInterface *)self wifiClient];
    id v11 = [v7 cInterface];
    [v11 disassociateWithReason:2];
  }
  else if (v10 && os_log_type_enabled(v7, v8))
  {
    int v12 = 136315138;
    int v13 = "-[WFInterface disassociateFromCurrentNetworkWithCompletion:]";
    _os_log_impl(&dword_226071000, v7, v8, "%s: failed to get CWFInterface", (uint8_t *)&v12, 0xCu);
  }

  if (v4) {
    v4[2](v4);
  }
}

- (void)disassociateFromCarPlayUserConfiguredNetwork
{
  id v4 = [(WFInterface *)self currentNetwork];
  if ([v4 carPlayType] == 2)
  {
    uint64_t v3 = WiFiDeviceClientCopyCurrentNetwork();
    WiFiNetworkSetAssociationDate();
    [(WFInterface *)self _updateCurrentNetworkWithNetwork:v3 callback:0];
  }
}

- (id)_debugLQMString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F089D8] string];
  uint64_t v5 = [v3 objectForKey:@"RSSI"];
  os_log_type_t v6 = [v3 objectForKey:@"SCALED_RSSI"];
  [v4 appendFormat:@"RSSI %@, Scaled RSSI: %@", v5, v6];

  id v7 = [v3 objectForKey:*MEMORY[0x263F55E58]];
  uint64_t v8 = [v3 objectForKey:*MEMORY[0x263F55E48]];
  BOOL v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    [v4 appendFormat:@", ipState: %@, noGatewayIP: %@", v7, v8];
  }
  uint64_t v11 = [v3 objectForKey:@"DIRECTED_NETWORK"];
  int v12 = (void *)v11;
  if (v11) {
    [v4 appendFormat:@", directed %@", v11];
  }

  return v4;
}

- (id)_currentInterface
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(WFInterface *)self cInterface];
  BOOL associatedOnIRInterface = self->_associatedOnIRInterface;
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  BOOL v8 = (unint64_t)WFCurrentLogLevel() > 2 && v5 != 0;
  if (associatedOnIRInterface)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[WFInterface _currentInterface]";
      _os_log_impl(&dword_226071000, v5, v6, "%s: querying current network's IP from ir0.", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v5 = v3;
    id v3 = self->_irInterface;
  }
  else if (v8 && os_log_type_enabled(v5, v6))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[WFInterface _currentInterface]";
    _os_log_impl(&dword_226071000, v5, v6, "%s: querying current network's IP from en0.", (uint8_t *)&v10, 0xCu);
  }

  return v3;
}

- (id)IPv4Addresses
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WFInterface *)self _currentInterface];
  id v3 = [v2 IPv4Addresses];

  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    BOOL v8 = "-[WFInterface IPv4Addresses]";
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: addresses='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv4ARPResolvedIPAddress
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WFInterface *)self _currentInterface];
  id v3 = [v2 IPv4ARPResolvedIPAddress];

  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    BOOL v8 = "-[WFInterface IPv4ARPResolvedIPAddress]";
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: addresses='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv4SubnetMasks
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WFInterface *)self _currentInterface];
  id v3 = [v2 IPv4SubnetMasks];

  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    BOOL v8 = "-[WFInterface IPv4SubnetMasks]";
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: subnetMasks='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv4RouterAddress
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WFInterface *)self _currentInterface];
  id v3 = [v2 IPv4RouterAddress];

  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    BOOL v8 = "-[WFInterface IPv4RouterAddress]";
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: address='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv6Addresses
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WFInterface *)self _currentInterface];
  id v3 = [v2 IPv6Addresses];

  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    BOOL v8 = "-[WFInterface IPv6Addresses]";
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: addresses='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv6RouterAddress
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WFInterface *)self _currentInterface];
  id v3 = [v2 IPv6RouterAddress];

  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    BOOL v8 = "-[WFInterface IPv6RouterAddress]";
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: address='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (BOOL)hasValidIPAddress
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(WFInterface *)self ipMonitor];
  if ([v3 ipv4ConfigMethod] == 4)
  {
    id v4 = [(WFInterface *)self IPv4RouterAddress];

    if (v4)
    {
      os_log_type_t v5 = WFLogForCategory(0);
      os_log_type_t v6 = OSLogForWFLogLevel(4uLL);
      BOOL v7 = 1;
      if ((unint64_t)WFCurrentLogLevel() < 4 || !v5 || !os_log_type_enabled(v5, v6)) {
        goto LABEL_29;
      }
      int v22 = 136315138;
      __int16 v23 = "-[WFInterface hasValidIPAddress]";
      BOOL v8 = "%s: manual config with valid router address";
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v9 = [(WFInterface *)self IPv4Addresses];
  if (v9)
  {
    int v10 = (void *)v9;
    uint64_t v11 = [(WFInterface *)self IPv4RouterAddress];
    if (v11)
    {

      goto LABEL_12;
    }
    uint64_t v12 = [(WFInterface *)self IPv4ARPResolvedIPAddress];

    if (v12)
    {
LABEL_12:
      os_log_type_t v5 = WFLogForCategory(0);
      os_log_type_t v6 = OSLogForWFLogLevel(4uLL);
      BOOL v7 = 1;
      if ((unint64_t)WFCurrentLogLevel() < 4 || !v5 || !os_log_type_enabled(v5, v6)) {
        goto LABEL_29;
      }
      int v22 = 136315138;
      __int16 v23 = "-[WFInterface hasValidIPAddress]";
      BOOL v8 = "%s: valid client and router IPv4 address";
      goto LABEL_22;
    }
  }
  uint64_t v13 = [(WFInterface *)self IPv6Addresses];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    CFDataRef v15 = [(WFInterface *)self IPv6RouterAddress];

    if (v15)
    {
      os_log_type_t v5 = WFLogForCategory(0);
      os_log_type_t v6 = OSLogForWFLogLevel(4uLL);
      BOOL v7 = 1;
      if ((unint64_t)WFCurrentLogLevel() < 4 || !v5 || !os_log_type_enabled(v5, v6)) {
        goto LABEL_29;
      }
      int v22 = 136315138;
      __int16 v23 = "-[WFInterface hasValidIPAddress]";
      BOOL v8 = "%s: valid client and router IPv6 address";
LABEL_22:
      _os_log_impl(&dword_226071000, v5, v6, v8, (uint8_t *)&v22, 0xCu);
      goto LABEL_29;
    }
  }
  BOOL v16 = [(WFInterface *)self currentNetwork];
  int v17 = [v16 isAdhoc];

  if (!v17) {
    return 0;
  }
  long long v18 = WFLogForCategory(0);
  os_log_type_t v19 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v18 && os_log_type_enabled(v18, v19))
  {
    int v22 = 136315138;
    __int16 v23 = "-[WFInterface hasValidIPAddress]";
    _os_log_impl(&dword_226071000, v18, v19, "%s: adhoc network", (uint8_t *)&v22, 0xCu);
  }

  os_log_type_t v5 = [(WFInterface *)self currentNetwork];
  id v20 = [v5 matchingKnownNetworkProfile];
  BOOL v7 = v20 != 0;

LABEL_29:
  return v7;
}

- (void)notifyNoNetworksFound
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [NSNumber numberWithInt:2];
  [v3 setObject:v4 forKey:@"APPLE80211KEY_SOFT_ERROR_EVENT_TYPE"];

  if (!v3)
  {
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v5 || !os_log_type_enabled(v5, v6)) {
      goto LABEL_9;
    }
    int v8 = 136315138;
    uint64_t v9 = "-[WFInterface notifyNoNetworksFound]";
    BOOL v7 = "%s: paramDictionary alloc failed!";
    goto LABEL_8;
  }
  if (!self->_device)
  {
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v5 || !os_log_type_enabled(v5, v6)) {
      goto LABEL_9;
    }
    int v8 = 136315138;
    uint64_t v9 = "-[WFInterface notifyNoNetworksFound]";
    BOOL v7 = "%s- Failed to get WiFiDeviceClientRef";
LABEL_8:
    _os_log_impl(&dword_226071000, v5, v6, v7, (uint8_t *)&v8, 0xCu);
LABEL_9:

    goto LABEL_10;
  }
  WiFiDeviceClientNotifySoftError();
LABEL_10:
}

- (void)_hostAPStateDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[WFInterface _hostAPStateDidChange:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: eventData %@", (uint8_t *)&v11, 0x16u);
  }

  if (v4)
  {
    BOOL v7 = [v4 objectForKey:@"HostApEnabled"];

    int v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[WFInterface _hostAPStateDidChange:]";
      __int16 v13 = 1024;
      LODWORD(v14) = v7 != 0;
      _os_log_impl(&dword_226071000, v8, v9, "%s: host ap state is %d", (uint8_t *)&v11, 0x12u);
    }
  }
  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"WFInterfaceHostAPStateChangeNotification" object:self userInfo:0];
}

- (void)_carPlayNetworkTypeChangedCallback:(int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v8 = 136315394;
    os_log_type_t v9 = "-[WFInterface _carPlayNetworkTypeChangedCallback:]";
    __int16 v10 = 1024;
    int v11 = a3;
    _os_log_impl(&dword_226071000, v5, v6, "%s: networkType: %d", (uint8_t *)&v8, 0x12u);
  }

  if ((a3 - 1) <= 1)
  {
    BOOL v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"WFInterfaceCarPlayNetworkTypeDidChangeNotification" object:self userInfo:0];
  }
}

- (void)setInterfaceName:(id)a3
{
}

- (void)setCurrentNetwork:(id)a3
{
}

- (WFIPMonitor)ipMonitor
{
  return self->_ipMonitor;
}

- (void)setIpMonitor:(id)a3
{
}

- (void)setDeviceScanChannels:(id)a3
{
}

- (void)setDeviceScanChannelsPerCurLocale:(id)a3
{
}

- (NSSet)currentNetworkIssues
{
  return self->_currentNetworkIssues;
}

- (void)setCurrentNetworkIssues:(id)a3
{
}

- (OS_dispatch_queue)currentNetworkQueue
{
  return self->_currentNetworkQueue;
}

- (void)setCurrentNetworkQueue:(id)a3
{
}

- (OS_dispatch_queue)networkProcessingQueue
{
  return self->_networkProcessingQueue;
}

- (void)setNetworkProcessingQueue:(id)a3
{
}

- (__WiFiDeviceClient)device
{
  return self->_device;
}

- (NSOperationQueue)joinQueue
{
  return self->_joinQueue;
}

- (void)setJoinQueue:(id)a3
{
}

- (int)ipState
{
  return self->_ipState;
}

- (void)setIpState:(int)a3
{
  self->_int ipState = a3;
}

- (BOOL)ipv4SelfAssigned
{
  return self->_ipv4SelfAssigned;
}

- (void)setIpv4SelfAssigned:(BOOL)a3
{
  self->_ipv4SelfAssigned = a3;
}

- (BOOL)hasNoGatewayIP
{
  return self->_hasNoGatewayIP;
}

- (void)setHasNoGatewayIP:(BOOL)a3
{
  self->_hasNoGatewayIP = a3;
}

- (BOOL)currentNetworkIsDirected
{
  return self->_currentNetworkIsDirected;
}

- (void)setCurrentNetworkIsDirected:(BOOL)a3
{
  self->_currentNetworkIsDirected = a3;
}

- (NSThread)callbackThread
{
  return self->_callbackThread;
}

- (void)setCallbackThread:(id)a3
{
}

- (NSRunLoop)callbackRunLoop
{
  return self->_callbackRunLoop;
}

- (void)setCallbackRunLoop:(id)a3
{
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (WFClient)wifiClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wifiClient);
  return (WFClient *)WeakRetained;
}

- (void)setCInterface:(id)a3
{
}

- (void)setIrInterface:(id)a3
{
}

- (BOOL)associatedOnIRInterface
{
  return self->_associatedOnIRInterface;
}

- (void)setAssociatedOnIRInterface:(BOOL)a3
{
  self->_BOOL associatedOnIRInterface = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irInterface, 0);
  objc_storeStrong((id *)&self->_cInterface, 0);
  objc_destroyWeak((id *)&self->_wifiClient);
  objc_storeStrong((id *)&self->_callbackRunLoop, 0);
  objc_storeStrong((id *)&self->_callbackThread, 0);
  objc_storeStrong((id *)&self->_joinQueue, 0);
  objc_storeStrong((id *)&self->_networkProcessingQueue, 0);
  objc_storeStrong((id *)&self->_currentNetworkQueue, 0);
  objc_storeStrong((id *)&self->_coreWiFiCurrentNetwork, 0);
  objc_storeStrong((id *)&self->_currentNetworkIssues, 0);
  objc_storeStrong((id *)&self->_deviceScanChannelsPerCurLocale, 0);
  objc_storeStrong((id *)&self->_deviceScanChannels, 0);
  objc_storeStrong((id *)&self->_ipMonitor, 0);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end