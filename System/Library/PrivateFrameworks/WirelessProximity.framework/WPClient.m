@interface WPClient
+ (BOOL)isAppleTV;
+ (BOOL)isHomePod;
+ (BOOL)isHomePodOrIOS;
+ (BOOL)supportsRanging;
+ (id)stateAsString:(int64_t)a3;
+ (int64_t)holdVouchers;
+ (void)initialize;
- (BOOL)isBubbleTestClient;
- (BOOL)isTestClient;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)needsToRegister;
- (BOOL)peerTrackingSlotsAvailable;
- (BOOL)registering;
- (BOOL)servicesAdded;
- (NSString)description;
- (NSString)machName;
- (NSXPCConnection)xpcConnection;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)daemonDeliveryQueue;
- (OS_dispatch_semaphore)daemonRegisteredSemaphore;
- (WPClient)initWithQueue:(id)a3 machName:(id)a4;
- (id)clientAsString;
- (id)connection;
- (int64_t)advertiserState;
- (int64_t)connectionUseCase;
- (int64_t)maxAllowedConnectionDelayMs;
- (int64_t)pipeState;
- (int64_t)scannerState;
- (int64_t)state;
- (unsigned)type;
- (void)addServices;
- (void)allowlistConnectionMethods:(id)a3;
- (void)checkAllowDuplicates:(id)a3;
- (void)clearDuplicateFilterCache:(id)a3;
- (void)connectToPeer:(id)a3;
- (void)connectToPeer:(id)a3 withOptions:(id)a4;
- (void)dealloc;
- (void)destroyConnection;
- (void)disableScanning;
- (void)disconnectFromPeer:(id)a3;
- (void)discoverCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4;
- (void)dispatchAdvertisement:(id)a3;
- (void)dumpDaemonState;
- (void)enableBubbleTestMode;
- (void)enableRanging:(BOOL)a3 reply:(id)a4;
- (void)enableTestMode;
- (void)establishConnection;
- (void)getAllTrackedZones;
- (void)getPowerLogStats:(id)a3;
- (void)isRangingEnabledReply:(id)a3;
- (void)listenToBandwidthNotifications;
- (void)notifyNotApprovedUseCase:(id)a3;
- (void)overrideAdvTimeout:(double)a3;
- (void)overrideScanTimeout:(double)a3;
- (void)peerTrackingAvailable;
- (void)peerTrackingFull;
- (void)populateClientGATT:(id)a3;
- (void)receivedTestResponse:(id)a3;
- (void)registerEndpoint:(id)a3 requireAck:(BOOL)a4 requireEncryption:(BOOL)a5;
- (void)registerForAnyScanResults:(BOOL)a3;
- (void)registeredWithDaemonAndContinuingSession:(BOOL)a3;
- (void)sendDataToCharacteristic:(id)a3 inService:(id)a4 forPeer:(id)a5;
- (void)sendDatatoLePipe:(id)a3 forPeer:(id)a4;
- (void)sendTestRequest:(id)a3;
- (void)setAdvertiserState:(int64_t)a3;
- (void)setClientQueue:(id)a3;
- (void)setConnectionUseCase:(int64_t)a3;
- (void)setDaemonDeliveryQueue:(id)a3;
- (void)setDaemonRegisteredSemaphore:(id)a3;
- (void)setIsBubbleTestClient:(BOOL)a3;
- (void)setIsTestClient:(BOOL)a3;
- (void)setMachName:(id)a3;
- (void)setMaxAllowedConnectionDelayMs:(int64_t)a3;
- (void)setNeedsToRegister:(BOOL)a3;
- (void)setPeerTrackingSlotsAvailable:(BOOL)a3;
- (void)setRegistering:(BOOL)a3;
- (void)setScannerState:(int64_t)a3;
- (void)setServicesAdded:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setType:(unsigned __int8)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)setupMachXPCService;
- (void)shouldSubscribe:(BOOL)a3 toPeer:(id)a4 withCharacteristic:(id)a5 inService:(id)a6;
- (void)startAdvertising:(id)a3;
- (void)startScanning:(id)a3;
- (void)startScanning:(id)a3 andAdvertising:(id)a4;
- (void)startTrackingPeerWithRequest:(id)a3;
- (void)startTrackingZone:(id)a3;
- (void)stateDidChange:(int64_t)a3;
- (void)stopAdvertising:(id)a3;
- (void)stopScanning:(id)a3;
- (void)stopTrackingAllZones;
- (void)stopTrackingPeerWithRequest:(id)a3;
- (void)stopTrackingZones:(id)a3;
- (void)unregisterEndpoint:(id)a3;
- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4;
- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4;
@end

@implementation WPClient

- (int64_t)state
{
  return self->_state;
}

- (void)stopAdvertising:(id)a3
{
  id v4 = a3;
  if (![v4 clientType] || objc_msgSend(v4, "clientType") >= 0x1B) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Unknown client type", @"Trying to stop advertising for an unknown client type %ld", objc_msgSend(v4, "clientType"));
  }
  id location = 0;
  objc_initWeak(&location, self);
  v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__WPClient_stopAdvertising___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)dispatchAdvertisement:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WPClient_dispatchAdvertisement___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)daemonDeliveryQueue
{
  return self->_daemonDeliveryQueue;
}

- (void)startAdvertising:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 clientType] || objc_msgSend(v4, "clientType") >= 0x1B) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Unknown client type", @"Trying to start advertising for an unknown client type %ld", objc_msgSend(v4, "clientType"));
  }
  v5 = [v4 advertisingData];

  if (!v5)
  {
    id v8 = NSString;
    id v9 = [(WPClient *)self clientAsString];
    v10 = [v8 stringWithFormat:@"WPClient %@ advertising data is nil", v9];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_429);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = v10;
    v12 = NSDictionary;
    v13 = (void **)v23;
    v14 = &v22;
    goto LABEL_38;
  }
  BOOL v6 = [v4 advertisingRate] == 32
    || [v4 advertisingRate] == 48
    || [v4 advertisingRate] == 192
    || [v4 advertisingRate] == 96
    || [v4 advertisingRate] == 290
    || [v4 advertisingRate] == 432
    || [v4 advertisingRate] == 996
    || [v4 advertisingRate] == 1636
    || [v4 advertisingRate] == 3200
    || [v4 advertisingRate] == 0x4000;
  unsigned int v7 = [v4 clientType];
  if (v7 > 0x1A) {
    goto LABEL_29;
  }
  if (((1 << v7) & 0x56C0000) == 0)
  {
    if (v7 == 2)
    {
      if (+[WPClient isHomePodOrIOS]) {
        BOOL v15 = [v4 advertisingRate] == 160;
      }
      else {
        BOOL v15 = 0;
      }
      if (v15 || v6) {
        goto LABEL_17;
      }
LABEL_33:
      v16 = NSString;
      v17 = [(WPClient *)self clientAsString];
      v10 = [v16 stringWithFormat:@"WPClient %@ advertising rate 0x%lx is not valid", v17, objc_msgSend(v4, "advertisingRate")];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_435);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
      }
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F08320];
      v21 = v10;
      v12 = NSDictionary;
      v13 = &v21;
      v14 = &v20;
LABEL_38:
      v18 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
      v19 = [v11 errorWithDomain:@"WPErrorDomain" code:13 userInfo:v18];

      -[WPClient advertisingFailedToStart:ofType:](self, "advertisingFailedToStart:ofType:", v19, [v4 clientType]);
      goto LABEL_39;
    }
    if (v7 == 8)
    {
      if ((v6 | +[WPClient isHomePodOrIOS])) {
        goto LABEL_17;
      }
      goto LABEL_33;
    }
LABEL_29:
    if (v6) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_17:
  [(WPClient *)self dispatchAdvertisement:v4];
LABEL_39:
}

- (void)stopScanning:(id)a3
{
  id v4 = a3;
  if (![v4 clientType] || objc_msgSend(v4, "clientType") >= 0x1B) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Unknown client type", @"Trying to stop scanning for an unknown client type %ld", objc_msgSend(v4, "clientType"));
  }
  id location = 0;
  objc_initWeak(&location, self);
  v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__WPClient_stopScanning___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)startScanning:(id)a3
{
  id v4 = a3;
  if (![v4 clientType] || objc_msgSend(v4, "clientType") >= 0x1B) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Unknown client type", @"Trying to start scanning for an unknown client type %ld", objc_msgSend(v4, "clientType"));
  }
  id location = 0;
  objc_initWeak(&location, self);
  v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__WPClient_startScanning___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __26__WPClient_startScanning___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connection];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __26__WPClient_startScanning___block_invoke_2;
    id v9 = &unk_26420EA98;
    v10 = v3;
    id v11 = *(id *)(a1 + 32);
    v5 = [v4 remoteObjectProxyWithErrorHandler:&v6];
    objc_msgSend(v5, "startScanning:", *(void *)(a1 + 32), v6, v7, v8, v9, v10);
  }
}

void __28__WPClient_stopAdvertising___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_440];
    [v4 stopAdvertising:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void __34__WPClient_dispatchAdvertisement___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connection];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __34__WPClient_dispatchAdvertisement___block_invoke_2;
    id v9 = &unk_26420EA98;
    v10 = v3;
    id v11 = *(id *)(a1 + 32);
    id v5 = [v4 remoteObjectProxyWithErrorHandler:&v6];
    objc_msgSend(v5, "startAdvertising:", *(void *)(a1 + 32), v6, v7, v8, v9, v10);
  }
}

- (id)connection
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(WPClient *)v2 xpcConnection];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.wirelessproxd" options:4096];
    [(WPClient *)v2 allowlistConnectionMethods:v4];
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__0;
    v13[4] = __Block_byref_object_dispose__0;
    v14 = 0;
    id v5 = v2;
    v14 = v5;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __22__WPClient_connection__block_invoke;
    v12[3] = &unk_26420E9D8;
    v12[4] = v5;
    v12[5] = v13;
    [v4 setInterruptionHandler:v12];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __22__WPClient_connection__block_invoke_178;
    v11[3] = &unk_26420E9D8;
    v11[4] = v5;
    v11[5] = v13;
    [v4 setInvalidationHandler:v11];
    uint64_t v6 = [(WPClient *)v5 clientQueue];

    if (v6)
    {
      uint64_t v7 = [(WPClient *)v5 clientQueue];
      [v4 _setQueue:v7];
    }
    [(WPClient *)v5 setXpcConnection:v4];
    id v8 = [(WPClient *)v5 xpcConnection];
    [v8 resume];

    _Block_object_dispose(v13, 8);
  }
  if ([(WPClient *)v2 needsToRegister] && ![(WPClient *)v2 registering]) {
    [(WPClient *)v2 establishConnection];
  }
  objc_sync_exit(v2);

  id v9 = [(WPClient *)v2 xpcConnection];

  return v9;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (BOOL)needsToRegister
{
  return self->_needsToRegister;
}

void __25__WPClient_stopScanning___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connection];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __25__WPClient_stopScanning___block_invoke_2;
    id v9 = &unk_26420EA98;
    v10 = v3;
    id v11 = *(id *)(a1 + 32);
    id v5 = [v4 remoteObjectProxyWithErrorHandler:&v6];
    objc_msgSend(v5, "stopScanning:", *(void *)(a1 + 32), v6, v7, v8, v9, v10);
  }
}

+ (BOOL)isHomePod
{
  return _MergedGlobals;
}

+ (BOOL)isAppleTV
{
  return byte_26AA74E31;
}

+ (BOOL)isHomePodOrIOS
{
  return 1;
}

+ (BOOL)supportsRanging
{
  if (supportsRanging_onceToken != -1) {
    dispatch_once(&supportsRanging_onceToken, &__block_literal_global_14);
  }
  return supportsRanging_supportsRanging;
}

uint64_t __27__WPClient_supportsRanging__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportsRanging_supportsRanging = result;
  return result;
}

+ (void)initialize
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 67109376;
  v1[1] = _MergedGlobals;
  __int16 v2 = 1024;
  int v3 = byte_26AA74E31;
  _os_log_debug_impl(&dword_2144AA000, log, OS_LOG_TYPE_DEBUG, "WPClient _isHomePod: %d _isAppleTV: %d", (uint8_t *)v1, 0xEu);
}

+ (int64_t)holdVouchers
{
  return 0;
}

- (WPClient)initWithQueue:(id)a3 machName:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v51.receiver = self;
  v51.super_class = (Class)WPClient;
  id v9 = [(WPClient *)&v51 init];
  v10 = v9;
  if (v9)
  {
    p_clientQueue = (NSObject **)&v9->_clientQueue;
    v9->_state = 0;
    v9->_advertiserState = 0;
    v9->_scannerState = 0;
    objc_storeStrong((id *)&v9->_clientQueue, a3);
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.wiproxd.daemonMessageQueue.%lu", -[WPClient hash](v10, "hash"));
    if ([(id)objc_opt_class() holdVouchers] && (v13 = *p_clientQueue) != 0)
    {
      int relative_priority_ptr = 0;
      dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v13, &relative_priority_ptr);
      BOOL v15 = dispatch_queue_attr_make_with_qos_class(0, qos_class, relative_priority_ptr);
      id v16 = v12;
      dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], v15);
      daemonDeliveryQueue = v10->_daemonDeliveryQueue;
      v10->_daemonDeliveryQueue = (OS_dispatch_queue *)v17;

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_153);
      }
      v19 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = v19;
        [(WPClient *)v10 clientAsString];
        id v21 = v8;
        id v22 = a4;
        v23 = v12;
        v25 = id v24 = v7;
        v26 = qos2string(qos_class);
        *(_DWORD *)buf = 134219010;
        v54 = v10;
        __int16 v55 = 2112;
        v56 = v25;
        __int16 v57 = 2112;
        id v58 = v16;
        __int16 v59 = 2080;
        v60 = v26;
        __int16 v61 = 1024;
        dispatch_qos_class_t v62 = qos_class;
        _os_log_impl(&dword_2144AA000, v20, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %@) created queue %@ with client QOS class %s (%d)", buf, 0x30u);

        id v7 = v24;
        v12 = v23;
        a4 = v22;
        id v8 = v21;
      }
    }
    else
    {
      id v27 = v12;
      v28 = (const char *)[v27 UTF8String];
      v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v30 = dispatch_queue_create(v28, v29);
      v31 = v10->_daemonDeliveryQueue;
      v10->_daemonDeliveryQueue = (OS_dispatch_queue *)v30;

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_156_0);
      }
      v32 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        v34 = [(WPClient *)v10 clientAsString];
        *(_DWORD *)buf = 134218498;
        v54 = v10;
        __int16 v55 = 2112;
        v56 = v34;
        __int16 v57 = 2112;
        id v58 = v27;
        _os_log_impl(&dword_2144AA000, v33, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %@) created queue %@ (default)", buf, 0x20u);
      }
    }
    dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
    daemonRegisteredSemaphore = v10->_daemonRegisteredSemaphore;
    v10->_daemonRegisteredSemaphore = (OS_dispatch_semaphore *)v35;

    v37 = v10->_daemonDeliveryQueue;
    v38 = v10;
    v39 = v37;
    int relative_priority_ptr = 0;
    dispatch_qos_class_t v40 = dispatch_queue_get_qos_class(v39, &relative_priority_ptr);
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_824);
    }
    v41 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      [(WPClient *)v38 clientAsString];
      id v50 = v8;
      id v43 = a4;
      v44 = v12;
      v46 = id v45 = v7;
      v47 = [v39 description];
      v48 = qos2string(v40);
      *(_DWORD *)buf = 134219266;
      v54 = v38;
      __int16 v55 = 2112;
      v56 = v46;
      __int16 v57 = 2112;
      id v58 = v47;
      __int16 v59 = 2080;
      v60 = v48;
      __int16 v61 = 1024;
      dispatch_qos_class_t v62 = v40;
      __int16 v63 = 1024;
      int v64 = relative_priority_ptr;
      _os_log_impl(&dword_2144AA000, v42, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %@) queue %@ with QOS class %s (%d) rel priority %d", buf, 0x36u);

      id v7 = v45;
      v12 = v44;
      a4 = v43;
      id v8 = v50;
    }
    *(_DWORD *)&v38->_isTestClient = 0x10000;
    v38->_registering = 0;
    if (v8)
    {
      objc_storeStrong((id *)&v38->_machName, a4);
      [(WPClient *)v38 setupMachXPCService];
    }
    [(WPClient *)v38 establishConnection];
    v38->_servicesAdded = 0;
    v38->_connectionUseCase = 0;
    v38->_maxAllowedConnectionDelayMs = 0;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_158);
  }
  int v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    id v5 = [(WPClient *)self clientAsString];
    *(_DWORD *)buf = 134218242;
    v12 = self;
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "WPClient deallocing (%p - %{public}@)", buf, 0x16u);
  }
  [(WPClient *)self destroyConnection];
  uint64_t v6 = [(WPClient *)self daemonRegisteredSemaphore];

  if (v6) {
    [(WPClient *)self setDaemonRegisteredSemaphore:0];
  }
  id v7 = [(WPClient *)self xpcListener];

  if (v7)
  {
    id v8 = [(WPClient *)self xpcListener];
    [v8 setDelegate:0];

    id v9 = [(WPClient *)self xpcListener];
    [v9 invalidate];

    [(WPClient *)self setXpcListener:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)WPClient;
  [(WPClient *)&v10 dealloc];
}

- (void)setupMachXPCService
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [(WPClient *)self machName];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v3];
  [(WPClient *)self setXpcListener:v4];

  id v5 = [(WPClient *)self xpcListener];
  [v5 setDelegate:self];

  uint64_t v6 = [(WPClient *)self xpcListener];
  [v6 resume];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_163_0);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = [(WPClient *)self clientAsString];
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_INFO, "WPClient started listening for mach service %@ for client (%p - %@)", (uint8_t *)&v10, 0x20u);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_165_0);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)MEMORY[0x263F08AB0];
    id v9 = v7;
    int v10 = [v8 processInfo];
    id v11 = [v10 processName];
    int v13 = 138412290;
    __int16 v14 = v11;
    _os_log_impl(&dword_2144AA000, v9, OS_LOG_TYPE_INFO, "WPClient Process %@ was woken up from mach port tickle", (uint8_t *)&v13, 0xCu);
  }
  return 0;
}

- (void)establishConnection
{
  int v3 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WPClient_establishConnection__block_invoke;
  block[3] = &unk_26420E9B0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __31__WPClient_establishConnection__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setRegistering:1];
  __int16 v2 = [*(id *)(a1 + 32) clientAsString];
  int v3 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v4 = [v3 processName];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_168);
  }
  id v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v16 = 134218498;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    v19 = v2;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %@) establishing new XPC Connection for process %@", (uint8_t *)&v16, 0x20u);
  }
  uint64_t v7 = [(id)objc_opt_class() holdVouchers];
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxy];
  int v10 = [*(id *)(a1 + 32) machName];
  [v9 registerWithDaemon:v2 forProcess:v4 machName:v10 holdVouchers:v7];

  id v11 = [*(id *)(a1 + 32) daemonRegisteredSemaphore];
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  intptr_t v13 = dispatch_semaphore_wait(v11, v12);

  if (v13)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_171_0);
    }
    __int16 v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 134218498;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      v19 = v2;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_error_impl(&dword_2144AA000, v14, OS_LOG_TYPE_ERROR, "WPClient (%p - %@) registering with daemon timed out for client %@", (uint8_t *)&v16, 0x20u);
    }
    [*(id *)(a1 + 32) setRegistering:0];
  }
}

uint64_t __22__WPClient_connection__block_invoke(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_177_0);
    }
    __int16 v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(void **)(v1 + 32);
      uint64_t v4 = v2;
      id v5 = [v3 clientAsString];
      int v6 = 134218242;
      uint64_t v7 = v3;
      __int16 v8 = 2114;
      id v9 = v5;
      _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %{public}@) XPC Connection interrupted", (uint8_t *)&v6, 0x16u);
    }
    [*(id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) stateDidChange:1];
    return [*(id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) establishConnection];
  }
  return result;
}

void __22__WPClient_connection__block_invoke_178(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_181_0);
    }
    __int16 v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(void **)(a1 + 32);
      uint64_t v4 = v2;
      id v5 = [v3 clientAsString];
      *(_DWORD *)buf = 134218242;
      id v9 = v3;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %{public}@) XPC Connection invalidated", buf, 0x16u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stateDidChange:0];
    int v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) daemonDeliveryQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __22__WPClient_connection__block_invoke_182;
    block[3] = &unk_26420EA00;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(v6, block);
  }
}

uint64_t __22__WPClient_connection__block_invoke_182(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNeedsToRegister:1];
  __int16 v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v2 setXpcConnection:0];
}

- (void)allowlistConnectionMethods:(id)a3
{
  v35[5] = *MEMORY[0x263EF8340];
  int v3 = (void *)MEMORY[0x263F08D80];
  id v27 = a3;
  uint64_t v4 = [v3 interfaceWithProtocol:&unk_26C53FD90];
  id v5 = (void *)MEMORY[0x263EFFA08];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  v35[3] = objc_opt_class();
  v35[4] = objc_opt_class();
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:5];
  v26 = [v5 setWithArray:v6];

  [v4 setClasses:v26 forSelector:sel_deviceDiscovered_ argumentIndex:0 ofReply:0];
  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  __int16 v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  v25 = [v7 setWithArray:v8];

  [v4 setClasses:v25 forSelector:sel_failedToRegisterZones_withError_ argumentIndex:0 ofReply:0];
  id v9 = (void *)MEMORY[0x263EFFA08];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];
  id v24 = [v9 setWithArray:v10];

  [v4 setClasses:v24 forSelector:sel_discoveredCharacteristicsAndServices_forPeripheral_ argumentIndex:0 ofReply:0];
  id v11 = (void *)MEMORY[0x263EFFA08];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  v32[4] = objc_opt_class();
  v32[5] = objc_opt_class();
  v32[6] = objc_opt_class();
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:7];
  v23 = [v11 setWithArray:v12];

  [v4 setClasses:v23 forSelector:sel_fetchedCurrentlyTrackedZones_ argumentIndex:0 ofReply:0];
  intptr_t v13 = (void *)MEMORY[0x263EFFA08];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  v31[3] = objc_opt_class();
  v31[4] = objc_opt_class();
  __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:5];
  uint64_t v15 = [v13 setWithArray:v14];

  [v4 setClasses:v15 forSelector:sel_anyDiscoveredDevice_ argumentIndex:0 ofReply:0];
  int v16 = (void *)MEMORY[0x263EFFA08];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v30[3] = objc_opt_class();
  v30[4] = objc_opt_class();
  v30[5] = objc_opt_class();
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:6];
  __int16 v18 = [v16 setWithArray:v17];

  [v4 setClasses:v18 forSelector:sel_devicesDiscovered_ argumentIndex:0 ofReply:0];
  v19 = (void *)MEMORY[0x263EFFA08];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  v29[3] = objc_opt_class();
  v29[4] = objc_opt_class();
  v29[5] = objc_opt_class();
  __int16 v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:6];
  id v21 = [v19 setWithArray:v20];

  [v4 setClasses:v21 forSelector:sel_receivedTestResponse_ argumentIndex:0 ofReply:0];
  uint64_t v22 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C540238];
  [v27 setExportedInterface:v4];
  [v27 setExportedObject:self];
  [v27 setRemoteObjectInterface:v22];
}

- (void)destroyConnection
{
  id v2 = [(WPClient *)self xpcConnection];
  [v2 invalidate];
}

- (void)registeredWithDaemonAndContinuingSession:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3) {
    [(WPClient *)self setServicesAdded:1];
  }
  [(WPClient *)self setNeedsToRegister:0];
  [(WPClient *)self setRegistering:0];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_383);
  }
  uint64_t v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    int v6 = [(WPClient *)self clientAsString];
    int v8 = 134218242;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_INFO, "WPClient (%p - %@) registered with daemon, continuing any messages", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(WPClient *)self daemonRegisteredSemaphore];
  dispatch_semaphore_signal(v7);
}

- (NSString)description
{
  int v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = +[WPClient stateAsString:[(WPClient *)self state]];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p state = %@>", v5, self, v6];

  return (NSString *)v7;
}

- (id)clientAsString
{
  return @"WPClient-Superclass";
}

+ (id)stateAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_26420EC98[a3 - 1];
  }
}

- (void)populateClientGATT:(id)a3
{
}

- (void)addServices
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __23__WPClient_addServices__block_invoke;
  v2[3] = &unk_26420EA70;
  v2[4] = self;
  [(WPClient *)self populateClientGATT:v2];
}

void __23__WPClient_addServices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_403);
    }
    int v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      __int16 v10 = v8;
      id v11 = [v9 clientAsString];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "Adding services for %{public}@", buf, 0xCu);
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    uint64_t v12 = [*(id *)(a1 + 32) daemonDeliveryQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __23__WPClient_addServices__block_invoke_404;
    block[3] = &unk_26420EA48;
    objc_copyWeak(&v16, (id *)buf);
    id v14 = v5;
    id v15 = v7;
    dispatch_async(v12, block);

    [*(id *)(a1 + 32) setServicesAdded:1];
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __23__WPClient_addServices__block_invoke_404(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v3 = [WeakRetained connection];
    uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_408];
    [v4 addCharacteristic:*(void *)(a1 + 32) forService:*(void *)(a1 + 40)];

    id WeakRetained = v5;
  }
}

void __23__WPClient_addServices__block_invoke_2_405(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_410);
  }
  int v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __23__WPClient_addServices__block_invoke_2_405_cold_1(v3);
  }
}

void __34__WPClient_dispatchAdvertisement___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  int v3 = NSString;
  uint64_t v4 = [a2 localizedDescription];
  id v5 = [v3 stringWithFormat:@"WPClient can't reach bluetoothd to start advertising. ERROR: %@", v4];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_416);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  }
  id v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = v5;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v8 = [v6 errorWithDomain:@"WPErrorDomain" code:5 userInfo:v7];

  objc_msgSend(*(id *)(a1 + 32), "advertisingFailedToStart:ofType:", v8, objc_msgSend(*(id *)(a1 + 40), "clientType"));
}

void __28__WPClient_stopAdvertising___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_442);
  }
  int v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __28__WPClient_stopAdvertising___block_invoke_2_cold_1(v3);
  }
}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_444);
    }
    uint64_t v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPClient updateAdvertisingRequest:withUpdate:](v7, v5);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_447);
    }
    int v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPClient updateAdvertisingRequest:withUpdate:](v8);
    }
  }
}

- (void)registerForAnyScanResults:(BOOL)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WPClient_registerForAnyScanResults___block_invoke;
  block[3] = &unk_26420EAE8;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__WPClient_registerForAnyScanResults___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v3 = [WeakRetained connection];
    uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_449];
    [v4 registerForAnyScanResults:*(unsigned __int8 *)(a1 + 40)];

    id WeakRetained = v5;
  }
}

void __38__WPClient_registerForAnyScanResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSString;
  int v3 = [a2 localizedDescription];
  uint64_t v4 = [v2 stringWithFormat:@"WPClint can't reach bluetoothd to register for any scan results. ERROR: %@", v3];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_454);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  }
}

void __26__WPClient_startScanning___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  int v3 = NSString;
  uint64_t v4 = [a2 localizedDescription];
  id v5 = [v3 stringWithFormat:@"WPClient can't reach bluetoothd to start scanning. ERROR: %@", v4];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_462);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  }
  id v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  BOOL v8 = [v6 errorWithDomain:@"WPErrorDomain" code:5 userInfo:v7];

  objc_msgSend(*(id *)(a1 + 32), "scanningFailedToStart:ofType:", v8, objc_msgSend(*(id *)(a1 + 40), "clientType"));
}

void __25__WPClient_stopScanning___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  int v3 = NSString;
  uint64_t v4 = [a2 localizedDescription];
  id v5 = [v3 stringWithFormat:@"WPClient can't reach bluetoothd to stop scanning. ERROR: %@", v4];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_470);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  }
  id v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  BOOL v8 = [v6 errorWithDomain:@"WPErrorDomain" code:5 userInfo:v7];

  objc_msgSend(*(id *)(a1 + 32), "scanningFailedToStart:ofType:", v8, objc_msgSend(*(id *)(a1 + 40), "clientType"));
}

- (void)clearDuplicateFilterCache:(id)a3
{
  id v4 = a3;
  if (![v4 clientType] || objc_msgSend(v4, "clientType") >= 0x1B) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Unknown client type", @"Trying to clear duplicate filter cache for an unknown client type %ld", objc_msgSend(v4, "clientType"));
  }
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WPClient_clearDuplicateFilterCache___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__WPClient_clearDuplicateFilterCache___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_475];
    [v4 clearDuplicateFilterCache:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void __38__WPClient_clearDuplicateFilterCache___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSString;
  int v3 = [a2 localizedDescription];
  id v4 = [v2 stringWithFormat:@"WPClient can't reach bluetoothd to removeDupFilterPerType. ERROR: %@", v3];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_480);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  }
}

- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_482);
    }
    id v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPClient updateScanningRequest:withUpdate:](v7, v5);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_485);
    }
    id v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPClient updateScanningRequest:withUpdate:](v8);
    }
  }
}

- (void)startScanning:(id)a3 andAdvertising:(id)a4
{
  id v6 = a3;
  [(WPClient *)self startAdvertising:a4];
  [(WPClient *)self startScanning:v6];
}

- (void)registerEndpoint:(id)a3 requireAck:(BOOL)a4 requireEncryption:(BOOL)a5
{
  id v8 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v9 = [(WPClient *)self daemonDeliveryQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__WPClient_registerEndpoint_requireAck_requireEncryption___block_invoke;
  v11[3] = &unk_26420EB10;
  objc_copyWeak(&v13, &location);
  id v12 = v8;
  BOOL v14 = a4;
  BOOL v15 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __58__WPClient_registerEndpoint_requireAck_requireEncryption___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_487];
    [v4 registerEndpoint:*(void *)(a1 + 32) requireAck:*(unsigned __int8 *)(a1 + 48) requireEncryption:*(unsigned __int8 *)(a1 + 49)];

    id WeakRetained = v5;
  }
}

void __58__WPClient_registerEndpoint_requireAck_requireEncryption___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSString;
  int v3 = [a2 localizedDescription];
  id v4 = [v2 stringWithFormat:@"WPClient can't reach bluetoothd to register endpoint. ERROR: %@", v3];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_492);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  }
}

- (void)unregisterEndpoint:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WPClient_unregisterEndpoint___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __31__WPClient_unregisterEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_494];
    [v4 unregisterEndpoint:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void __31__WPClient_unregisterEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSString;
  int v3 = [a2 localizedDescription];
  id v4 = [v2 stringWithFormat:@"WPClint can't reach bluetoothd to unregister endpoint. ERROR: %@", v3];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_499);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  }
}

- (void)sendDatatoLePipe:(id)a3 forPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  id v8 = [(WPClient *)self daemonDeliveryQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__WPClient_sendDatatoLePipe_forPeer___block_invoke;
  v11[3] = &unk_26420EA48;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __37__WPClient_sendDatatoLePipe_forPeer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connection];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2;
    v6[3] = &unk_26420EB38;
    id v7 = *(id *)(a1 + 32);
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
    [v5 sendDatatoLePipe:*(void *)(a1 + 40) forPeer:*(void *)(a1 + 32)];
  }
}

void __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_501);
  }
  id v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)startTrackingPeerWithRequest:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = @"Peer tracking is unsupported as the platform is not OS X";
  id v5 = NSDictionary;
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [v4 errorWithDomain:@"WPErrorDomain" code:5 userInfo:v7];

  [(WPClient *)self failedToStartTrackingPeer:v6 error:v8];
}

- (void)stopTrackingPeerWithRequest:(id)a3
{
  id v4 = a3;
  id v6 = [v4 peerUUID];
  uint64_t v5 = [v4 clientType];

  [(WPClient *)self stoppedTrackingPeer:v6 ofType:v5];
}

- (void)peerTrackingFull
{
}

- (void)peerTrackingAvailable
{
}

- (void)connectToPeer:(id)a3
{
}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  v37[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v9 = *MEMORY[0x263EFEE20];
  id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFEE20]];

  if (!v10) {
    goto LABEL_9;
  }
  id v11 = [v8 objectForKeyedSubscript:v9];
  int v12 = [v11 BOOLValue];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_506);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPClient connectToPeer:withOptions:]();
  }
  if (v12 && ([(WPClient *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v26 = [(WPClient *)self daemonDeliveryQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__WPClient_connectToPeer_withOptions___block_invoke_508;
    block[3] = &unk_26420EAC0;
    objc_copyWeak(&v34, &location);
    id v33 = v6;
    id v27 = v6;
    dispatch_async(v26, block);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_9:
    id v13 = (void *)MEMORY[0x2166A2110]();
    v36[0] = *MEMORY[0x263EFEE18];
    id v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[WPClient connectionUseCase](self, "connectionUseCase"));
    v37[0] = v14;
    v36[1] = *MEMORY[0x263EFEE30];
    BOOL v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[WPClient maxAllowedConnectionDelayMs](self, "maxAllowedConnectionDelayMs"));
    v37[1] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

    if (v8)
    {
      uint64_t v17 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v16];
      uint64_t v18 = [v8 objectForKeyedSubscript:@"WPNearbyKeyUseCaseList"];
      if ([v18 count])
      {
        v19 = (void *)MEMORY[0x263EFF8C0];
        __int16 v20 = [v18 allObjects];
        id v21 = [v19 arrayWithArray:v20];
        [v17 setObject:v21 forKey:@"kCBOptionUseCaseList"];
      }
      [v17 addEntriesFromDictionary:v8];
      uint64_t v22 = [NSDictionary dictionaryWithDictionary:v17];

      id v16 = (void *)v22;
    }
    id location = 0;
    objc_initWeak(&location, self);
    v23 = [(WPClient *)self daemonDeliveryQueue];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __38__WPClient_connectToPeer_withOptions___block_invoke_518;
    v28[3] = &unk_26420EA48;
    objc_copyWeak(&v31, &location);
    id v29 = v6;
    id v30 = v16;
    id v24 = v6;
    id v25 = v16;
    dispatch_async(v23, v28);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

void __38__WPClient_connectToPeer_withOptions___block_invoke_508(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_513);
    }
    id v3 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __38__WPClient_connectToPeer_withOptions___block_invoke_508_cold_1(v3, v4, v5);
    }
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08320];
    v10[0] = @"Connection option not allowed.";
    id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v8 = [v6 errorWithDomain:@"WPErrorDomain" code:29 userInfo:v7];

    [WeakRetained connectedDevice:*(void *)(a1 + 32) withError:v8 shouldDiscover:0];
  }
}

void __38__WPClient_connectToPeer_withOptions___block_invoke_518(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained connection];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__WPClient_connectToPeer_withOptions___block_invoke_2_519;
    v6[3] = &unk_26420EB38;
    id v7 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
    [v5 connectToPeer:*(void *)(a1 + 32) withOptions:*(void *)(a1 + 40)];
  }
}

void __38__WPClient_connectToPeer_withOptions___block_invoke_2_519(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_521);
  }
  uint64_t v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __38__WPClient_connectToPeer_withOptions___block_invoke_2_519_cold_1(a1, v4);
  }
}

- (void)disconnectFromPeer:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WPClient_disconnectFromPeer___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __31__WPClient_disconnectFromPeer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connection];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __31__WPClient_disconnectFromPeer___block_invoke_2;
    v6[3] = &unk_26420EB38;
    id v7 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
    [v5 disconnectFromPeer:*(void *)(a1 + 32)];
  }
}

void __31__WPClient_disconnectFromPeer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_523);
  }
  id v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __31__WPClient_disconnectFromPeer___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)discoverCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  id v8 = [(WPClient *)self daemonDeliveryQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke;
  v11[3] = &unk_26420EA48;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connection];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke_2;
    v6[3] = &unk_26420EB38;
    id v7 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
    [v5 discoverCharacteristicsAndServices:*(void *)(a1 + 40) forPeripheral:*(void *)(a1 + 32)];
  }
}

void __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_525);
  }
  id v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)shouldSubscribe:(BOOL)a3 toPeer:(id)a4 withCharacteristic:(id)a5 inService:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id location = 0;
  objc_initWeak(&location, self);
  id v13 = [(WPClient *)self daemonDeliveryQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke;
  v17[3] = &unk_26420EB60;
  objc_copyWeak(&v21, &location);
  BOOL v22 = a3;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connection];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke_2;
    v6[3] = &unk_26420EB38;
    id v7 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
    [v5 shouldSubscribe:*(unsigned __int8 *)(a1 + 64) toPeer:*(void *)(a1 + 32) withCharacteristic:*(void *)(a1 + 40) inService:*(void *)(a1 + 48)];
  }
}

void __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_527);
  }
  id v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)sendDataToCharacteristic:(id)a3 inService:(id)a4 forPeer:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_529);
  }
  id v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_2144AA000, v11, OS_LOG_TYPE_INFO, "Sending data to %@", buf, 0xCu);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v12 = [(WPClient *)self daemonDeliveryQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__WPClient_sendDataToCharacteristic_inService_forPeer___block_invoke_530;
  v16[3] = &unk_26420EB88;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(v12, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __55__WPClient_sendDataToCharacteristic_inService_forPeer___block_invoke_530(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connection];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__WPClient_sendDataToCharacteristic_inService_forPeer___block_invoke_2;
    v6[3] = &unk_26420EB38;
    id v7 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
    [v5 sendDataToCharacteristic:*(void *)(a1 + 40) inService:*(void *)(a1 + 48) forPeer:*(void *)(a1 + 32)];
  }
}

void __55__WPClient_sendDataToCharacteristic_inService_forPeer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_532);
  }
  id v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)startTrackingZone:(id)a3
{
  id v4 = a3;
  if (![v4 clientType] || objc_msgSend(v4, "clientType") >= 0x1B) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Unknown client type", @"Trying to start tracking a zone for an unknown client type %ld", objc_msgSend(v4, "clientType"));
  }
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__WPClient_startTrackingZone___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__WPClient_startTrackingZone___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_537);
    }
    id v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __30__WPClient_startTrackingZone___block_invoke_cold_1(v3);
    }
    id v4 = [WeakRetained connection];
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_540];
    [v5 startTrackingZone:*(void *)(a1 + 32)];
  }
}

void __30__WPClient_startTrackingZone___block_invoke_538(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_543);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __30__WPClient_startTrackingZone___block_invoke_538_cold_1(v3);
  }
}

- (void)stopTrackingZones:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__WPClient_stopTrackingZones___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__WPClient_stopTrackingZones___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_545);
    }
    id v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __30__WPClient_stopTrackingZones___block_invoke_cold_1(a1, v3);
    }
    id v4 = [WeakRetained connection];
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_548];
    [v5 stopTrackingZones:*(void *)(a1 + 32)];
  }
}

void __30__WPClient_stopTrackingZones___block_invoke_546(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_551);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __30__WPClient_stopTrackingZones___block_invoke_546_cold_1(v3);
  }
}

- (void)stopTrackingAllZones
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(WPClient *)self daemonDeliveryQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__WPClient_stopTrackingAllZones__block_invoke;
  v4[3] = &unk_26420EBB0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__WPClient_stopTrackingAllZones__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_553);
    }
    id v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __32__WPClient_stopTrackingAllZones__block_invoke_cold_1(v2);
    }
    id v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_556];
    [v4 stopTrackingAllZones];
  }
}

void __32__WPClient_stopTrackingAllZones__block_invoke_554(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_559);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __32__WPClient_stopTrackingAllZones__block_invoke_554_cold_1(v3);
  }
}

- (void)getAllTrackedZones
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(WPClient *)self daemonDeliveryQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__WPClient_getAllTrackedZones__block_invoke;
  v4[3] = &unk_26420EBB0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__WPClient_getAllTrackedZones__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_561);
    }
    id v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __30__WPClient_getAllTrackedZones__block_invoke_cold_1(v2);
    }
    id v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_564];
    [v4 getAllTrackedZones];
  }
}

void __30__WPClient_getAllTrackedZones__block_invoke_562(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_567);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __30__WPClient_getAllTrackedZones__block_invoke_562_cold_1(v3);
  }
}

- (void)enableRanging:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  id v7 = [(WPClient *)self daemonDeliveryQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__WPClient_enableRanging_reply___block_invoke;
  v9[3] = &unk_26420EBD8;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __32__WPClient_enableRanging_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_569];
    [v4 enableRanging:*(unsigned __int8 *)(a1 + 48) reply:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void __32__WPClient_enableRanging_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_571);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __32__WPClient_enableRanging_reply___block_invoke_2_cold_1(v3);
  }
}

- (void)isRangingEnabledReply:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WPClient_isRangingEnabledReply___block_invoke;
  block[3] = &unk_26420EC00;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __34__WPClient_isRangingEnabledReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_573];
    [v4 isRangingEnabledReply:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void __34__WPClient_isRangingEnabledReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_575);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __34__WPClient_isRangingEnabledReply___block_invoke_2_cold_1(v3);
  }
}

- (void)listenToBandwidthNotifications
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(WPClient *)self daemonDeliveryQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__WPClient_listenToBandwidthNotifications__block_invoke;
  v4[3] = &unk_26420EBB0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__WPClient_listenToBandwidthNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_577);
    }
    id v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __42__WPClient_listenToBandwidthNotifications__block_invoke_cold_1(v2);
    }
    id v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_580];
    [v4 listenToBandwidthNotifications];
  }
}

void __42__WPClient_listenToBandwidthNotifications__block_invoke_578(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_583);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __42__WPClient_listenToBandwidthNotifications__block_invoke_578_cold_1(v3);
  }
}

- (void)stateDidChange:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_585);
  }
  id v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v15 = 134218240;
    int64_t v16 = a3;
    __int16 v17 = 2048;
    int64_t v18 = [(WPClient *)self state];
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "State changed to %ld from %ld", (uint8_t *)&v15, 0x16u);
  }
  if ([(WPClient *)self state] != a3)
  {
    [(WPClient *)self setState:a3];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_588);
    }
    id v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      int64_t v9 = [(WPClient *)self advertiserState];
      int v15 = 134218240;
      int64_t v16 = a3;
      __int16 v17 = 2048;
      int64_t v18 = v9;
      _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_DEFAULT, "Advertiser state changed to %ld from %ld", (uint8_t *)&v15, 0x16u);
    }
    if ([(WPClient *)self advertiserState] != a3)
    {
      [(WPClient *)self setAdvertiserState:a3];
      if ([(WPClient *)self advertiserState] == 1)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_591);
        }
        id v10 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "State is resetting, need to re-add services when asked to re-advertise", (uint8_t *)&v15, 2u);
        }
        [(WPClient *)self setServicesAdded:0];
      }
      if ([(WPClient *)self advertiserState] == 3)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_594);
        }
        id v11 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_2144AA000, v11, OS_LOG_TYPE_DEFAULT, "State is on, adding services if necessary", (uint8_t *)&v15, 2u);
        }
        if (![(WPClient *)self servicesAdded]) {
          [(WPClient *)self addServices];
        }
      }
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_597);
    }
    BOOL v12 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      int64_t v14 = [(WPClient *)self scannerState];
      int v15 = 134218240;
      int64_t v16 = a3;
      __int16 v17 = 2048;
      int64_t v18 = v14;
      _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "Scanner state changed to %ld from %ld", (uint8_t *)&v15, 0x16u);
    }
    [(WPClient *)self setScannerState:a3];
  }
}

- (void)receivedTestResponse:(id)a3
{
  id v3 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_599);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPClient receivedTestResponse:]();
  }
}

- (void)checkAllowDuplicates:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__WPClient_checkAllowDuplicates___block_invoke;
  block[3] = &unk_26420EC00;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__WPClient_checkAllowDuplicates___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_601);
    }
    id v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __33__WPClient_checkAllowDuplicates___block_invoke_cold_1(v3);
    }
    id v4 = [WeakRetained connection];
    id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_604];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __33__WPClient_checkAllowDuplicates___block_invoke_608;
    v6[3] = &unk_26420EC28;
    id v7 = *(id *)(a1 + 32);
    [v5 checkAllowDuplicates:v6];
  }
}

void __33__WPClient_checkAllowDuplicates___block_invoke_602(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_607);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __33__WPClient_checkAllowDuplicates___block_invoke_602_cold_1(v3);
  }
}

uint64_t __33__WPClient_checkAllowDuplicates___block_invoke_608(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableTestMode
{
  [(WPClient *)self setIsTestClient:1];
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(WPClient *)self daemonDeliveryQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__WPClient_enableTestMode__block_invoke;
  v4[3] = &unk_26420EBB0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __26__WPClient_enableTestMode__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_611);
    }
    id v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __26__WPClient_enableTestMode__block_invoke_cold_1(v2);
    }
    id v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_614];
    [v4 enableTestMode];
  }
}

void __26__WPClient_enableTestMode__block_invoke_612(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_617);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __26__WPClient_enableTestMode__block_invoke_612_cold_1(v3);
  }
}

- (void)enableBubbleTestMode
{
  [(WPClient *)self setIsTestClient:1];
  [(WPClient *)self setIsBubbleTestClient:1];
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(WPClient *)self daemonDeliveryQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__WPClient_enableBubbleTestMode__block_invoke;
  v4[3] = &unk_26420EBB0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__WPClient_enableBubbleTestMode__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_619);
    }
    id v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __32__WPClient_enableBubbleTestMode__block_invoke_cold_1(v2);
    }
    id v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_622];
    [v4 enableTestMode];
  }
}

void __32__WPClient_enableBubbleTestMode__block_invoke_620(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_625);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __32__WPClient_enableBubbleTestMode__block_invoke_620_cold_1(v3);
  }
}

- (void)overrideScanTimeout:(double)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__WPClient_overrideScanTimeout___block_invoke;
  block[3] = &unk_26420EC50;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __32__WPClient_overrideScanTimeout___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_627);
    }
    id v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "Setting scan timeout for class %@", (uint8_t *)&v9, 0xCu);
    }
    id v7 = [WeakRetained connection];
    id v8 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_630];
    [v8 overrideScanTimeout:*(double *)(a1 + 40)];
  }
}

void __32__WPClient_overrideScanTimeout___block_invoke_628(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_633);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __32__WPClient_overrideScanTimeout___block_invoke_628_cold_1(v3);
  }
}

- (void)overrideAdvTimeout:(double)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WPClient_overrideAdvTimeout___block_invoke;
  block[3] = &unk_26420EC50;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __31__WPClient_overrideAdvTimeout___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_635);
    }
    id v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "Setting adv timeout for class %@", (uint8_t *)&v9, 0xCu);
    }
    id v7 = [WeakRetained connection];
    id v8 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_638];
    [v8 overrideAdvTimeout:*(double *)(a1 + 40)];
  }
}

void __31__WPClient_overrideAdvTimeout___block_invoke_636(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_641);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __31__WPClient_overrideAdvTimeout___block_invoke_636_cold_1(v3);
  }
}

- (void)getPowerLogStats:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__WPClient_getPowerLogStats___block_invoke;
  block[3] = &unk_26420EC00;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __29__WPClient_getPowerLogStats___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_643);
    }
    id v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __29__WPClient_getPowerLogStats___block_invoke_cold_1(v3);
    }
    id v4 = [WeakRetained connection];
    id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_646];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __29__WPClient_getPowerLogStats___block_invoke_650;
    v6[3] = &unk_26420EC78;
    id v7 = *(id *)(a1 + 32);
    [v5 getPowerLogStats:v6];
  }
}

void __29__WPClient_getPowerLogStats___block_invoke_644(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_649);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __29__WPClient_getPowerLogStats___block_invoke_644_cold_1(v3);
  }
}

uint64_t __29__WPClient_getPowerLogStats___block_invoke_650(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpDaemonState
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(WPClient *)self daemonDeliveryQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__WPClient_dumpDaemonState__block_invoke;
  v4[3] = &unk_26420EBB0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __27__WPClient_dumpDaemonState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_653);
    }
    id v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __27__WPClient_dumpDaemonState__block_invoke_cold_1(v2);
    }
    id v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_656];
    [v4 dumpDaemonState];
  }
}

void __27__WPClient_dumpDaemonState__block_invoke_654(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_659);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __27__WPClient_dumpDaemonState__block_invoke_654_cold_1(v3);
  }
}

- (void)disableScanning
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(WPClient *)self daemonDeliveryQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__WPClient_disableScanning__block_invoke;
  v4[3] = &unk_26420EBB0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __27__WPClient_disableScanning__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_661);
    }
    id v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __27__WPClient_disableScanning__block_invoke_cold_1(v2);
    }
    id v3 = [WeakRetained connection];
    id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_664];
    [v4 disableScanning];
  }
}

void __27__WPClient_disableScanning__block_invoke_662(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_667);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __27__WPClient_disableScanning__block_invoke_662_cold_1(v3);
  }
}

- (void)sendTestRequest:(id)a3
{
  id v4 = a3;
  [(WPClient *)self setIsTestClient:1];
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPClient *)self daemonDeliveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__WPClient_sendTestRequest___block_invoke;
  block[3] = &unk_26420EAC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __28__WPClient_sendTestRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_669);
    }
    id v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __28__WPClient_sendTestRequest___block_invoke_cold_1(a1, v3);
    }
    id v4 = [WeakRetained connection];
    id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_672];
    [v5 sendTestRequest:*(void *)(a1 + 32)];
  }
}

void __28__WPClient_sendTestRequest___block_invoke_670(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_675);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    __28__WPClient_sendTestRequest___block_invoke_670_cold_1(v3);
  }
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)notifyNotApprovedUseCase:(id)a3
{
  id v3 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_677);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_FAULT)) {
    -[WPClient notifyNotApprovedUseCase:]();
  }
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)advertiserState
{
  return self->_advertiserState;
}

- (void)setAdvertiserState:(int64_t)a3
{
  self->_advertiserState = a3;
}

- (int64_t)scannerState
{
  return self->_scannerState;
}

- (void)setScannerState:(int64_t)a3
{
  self->_scannerState = a3;
}

- (int64_t)pipeState
{
  return self->_pipeState;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (BOOL)isTestClient
{
  return self->_isTestClient;
}

- (void)setIsTestClient:(BOOL)a3
{
  self->_isTestClient = a3;
}

- (BOOL)isBubbleTestClient
{
  return self->_isBubbleTestClient;
}

- (void)setIsBubbleTestClient:(BOOL)a3
{
  self->_isBubbleTestClient = a3;
}

- (int64_t)connectionUseCase
{
  return self->_connectionUseCase;
}

- (void)setConnectionUseCase:(int64_t)a3
{
  self->_connectionUseCase = a3;
}

- (int64_t)maxAllowedConnectionDelayMs
{
  return self->_maxAllowedConnectionDelayMs;
}

- (void)setMaxAllowedConnectionDelayMs:(int64_t)a3
{
  self->_maxAllowedConnectionDelayMs = a3;
}

- (void)setClientQueue:(id)a3
{
}

- (void)setDaemonDeliveryQueue:(id)a3
{
}

- (OS_dispatch_semaphore)daemonRegisteredSemaphore
{
  return self->_daemonRegisteredSemaphore;
}

- (void)setDaemonRegisteredSemaphore:(id)a3
{
}

- (NSString)machName
{
  return self->_machName;
}

- (void)setMachName:(id)a3
{
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)peerTrackingSlotsAvailable
{
  return self->_peerTrackingSlotsAvailable;
}

- (void)setPeerTrackingSlotsAvailable:(BOOL)a3
{
  self->_peerTrackingSlotsAvailable = a3;
}

- (void)setNeedsToRegister:(BOOL)a3
{
  self->_needsToRegister = a3;
}

- (BOOL)registering
{
  return self->_registering;
}

- (void)setRegistering:(BOOL)a3
{
  self->_registering = a3;
}

- (BOOL)servicesAdded
{
  return self->_servicesAdded;
}

- (void)setServicesAdded:(BOOL)a3
{
  self->_servicesAdded = a3;
}

- (NSXPCListener)xpcListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 104, 1);
}

- (void)setXpcListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_daemonRegisteredSemaphore, 0);
  objc_storeStrong((id *)&self->_daemonDeliveryQueue, 0);

  objc_storeStrong((id *)&self->_clientQueue, 0);
}

void __23__WPClient_addServices__block_invoke_2_405_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to add services. ERROR: %@", v6, v7, v8, v9, v10);
}

void __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_2144AA000, v0, v1, "%@", v2);
}

void __28__WPClient_stopAdvertising___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to stop advertising. ERROR: %@", v6, v7, v8, v9, v10);
}

- (void)updateAdvertisingRequest:(os_log_t)log withUpdate:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "Client type (none) calling [super updateAdvertisingRequest:withUpdate:]", v1, 2u);
}

- (void)updateAdvertisingRequest:(void *)a1 withUpdate:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  [a2 clientType];
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "Client type (%ld) calling [super updateAdvertisingRequest:withUpdate:]", v6, v7, v8, v9, 0);
}

- (void)updateScanningRequest:(os_log_t)log withUpdate:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "Client type (none) calling [super updateScanningRequest:withUpdate:]", v1, 2u);
}

- (void)updateScanningRequest:(void *)a1 withUpdate:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  [a2 clientType];
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "Client type (%ld) calling [super updateScanningRequest:withUpdate:]", v6, v7, v8, v9, 0);
}

void __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_9_1(a1, a2);
  [(id)OUTLINED_FUNCTION_8_1() UUIDString];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_2144AA000, v5, v6, "WPClient can't reach bluetoothd to send data to peer %@. ERROR: %@", v7, v8, v9, v10, v11);
}

- (void)connectToPeer:withOptions:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_2144AA000, v1, OS_LOG_TYPE_DEBUG, "Client connecting to peer %@ with option CBConnectPeripheralOptionDoNotDisconnectOnEncryptionFailure:%d", v2, 0x12u);
}

void __38__WPClient_connectToPeer_withOptions___block_invoke_508_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  int v4 = @"Connection option not allowed.";
  OUTLINED_FUNCTION_2_0(&dword_2144AA000, a1, a3, "%@", (uint8_t *)&v3);
}

void __38__WPClient_connectToPeer_withOptions___block_invoke_2_519_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_9_1(a1, a2);
  [(id)OUTLINED_FUNCTION_8_1() UUIDString];
  objc_claimAutoreleasedReturnValue();
  int v4 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_2144AA000, v5, v6, "WPClient can't reach bluetoothd to connect peer with options %@. ERROR: %@", v7, v8, v9, v10, v11);
}

void __31__WPClient_disconnectFromPeer___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_9_1(a1, a2);
  [(id)OUTLINED_FUNCTION_8_1() UUIDString];
  objc_claimAutoreleasedReturnValue();
  int v4 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_2144AA000, v5, v6, "WPClient can't reach bluetoothd to disconnect peer %@. ERROR: %@", v7, v8, v9, v10, v11);
}

void __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_9_1(a1, a2);
  [(id)OUTLINED_FUNCTION_8_1() UUIDString];
  objc_claimAutoreleasedReturnValue();
  int v4 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_2144AA000, v5, v6, "WPClient can't reach bluetoothd to discover services and charactertistcs for peer %@. ERROR: %@", v7, v8, v9, v10, v11);
}

void __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_9_1(a1, a2);
  [(id)OUTLINED_FUNCTION_8_1() UUIDString];
  objc_claimAutoreleasedReturnValue();
  int v4 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_2144AA000, v5, v6, "WPClient can't reach bluetoothd to subscribe charactertistc for peer %@. ERROR: %@", v7, v8, v9, v10, v11);
}

void __30__WPClient_startTrackingZone___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  int v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Trying to start zone tracking for class %@", v7, v8, v9, v10, v11);
}

void __30__WPClient_startTrackingZone___block_invoke_538_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to start tracking zone. ERROR: %@", v6, v7, v8, v9, v10);
}

void __30__WPClient_stopTrackingZones___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11(&dword_2144AA000, v6, v7, "Trying to stop zone tracking for zones %@ in class %@", v8, v9, v10, v11, v12);
}

void __30__WPClient_stopTrackingZones___block_invoke_546_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to stop tracking zone. ERROR: %@", v6, v7, v8, v9, v10);
}

void __32__WPClient_stopTrackingAllZones__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Trying to stop zone tracking for all zones %@", v7, v8, v9, v10, v11);
}

void __32__WPClient_stopTrackingAllZones__block_invoke_554_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to stop tracking all zones. ERROR: %@", v6, v7, v8, v9, v10);
}

void __30__WPClient_getAllTrackedZones__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Trying to get all zones for class %@", v7, v8, v9, v10, v11);
}

void __30__WPClient_getAllTrackedZones__block_invoke_562_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to get all tracked zones. ERROR: %@", v6, v7, v8, v9, v10);
}

void __32__WPClient_enableRanging_reply___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to enable/disable ranging. ERROR: %@", v6, v7, v8, v9, v10);
}

void __34__WPClient_isRangingEnabledReply___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to get ranging status. ERROR: %@", v6, v7, v8, v9, v10);
}

void __42__WPClient_listenToBandwidthNotifications__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Subscribing to bandwidth state updates for class %@", v7, v8, v9, v10, v11);
}

void __42__WPClient_listenToBandwidthNotifications__block_invoke_578_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to listen to bandwidth notifications. ERROR: %@", v6, v7, v8, v9, v10);
}

- (void)receivedTestResponse:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_2144AA000, v1, OS_LOG_TYPE_DEBUG, "FIXME: Client %@ received testResponse %@", v2, 0x16u);
}

void __33__WPClient_checkAllowDuplicates___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Trying to check if duplicates are allowed for class %@", v7, v8, v9, v10, v11);
}

void __33__WPClient_checkAllowDuplicates___block_invoke_602_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to check duplicate support. ERROR: %@", v6, v7, v8, v9, v10);
}

void __26__WPClient_enableTestMode__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Enabling test mode for class %@", v7, v8, v9, v10, v11);
}

void __26__WPClient_enableTestMode__block_invoke_612_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to enable test mode. ERROR: %@", v6, v7, v8, v9, v10);
}

void __32__WPClient_enableBubbleTestMode__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Enabling bubble test mode for class %@", v7, v8, v9, v10, v11);
}

void __32__WPClient_enableBubbleTestMode__block_invoke_620_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to enable bubble test mode. ERROR: %@", v6, v7, v8, v9, v10);
}

void __32__WPClient_overrideScanTimeout___block_invoke_628_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to set scan timeout. ERROR: %@", v6, v7, v8, v9, v10);
}

void __31__WPClient_overrideAdvTimeout___block_invoke_636_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to set advertising timeout. ERROR: %@", v6, v7, v8, v9, v10);
}

void __29__WPClient_getPowerLogStats___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Getting power stats for %@", v7, v8, v9, v10, v11);
}

void __29__WPClient_getPowerLogStats___block_invoke_644_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to get power stats. ERROR: %@", v6, v7, v8, v9, v10);
}

void __27__WPClient_dumpDaemonState__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Dumping WirelessProximity state requested by %@", v7, v8, v9, v10, v11);
}

void __27__WPClient_dumpDaemonState__block_invoke_654_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to dump WirelessProximity state. ERROR: %@", v6, v7, v8, v9, v10);
}

void __27__WPClient_disableScanning__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_2144AA000, v5, v6, "Disabling scan for %@", v7, v8, v9, v10, v11);
}

void __27__WPClient_disableScanning__block_invoke_662_cold_1(void *a1)
{
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to disable scanning. ERROR: %@", v6, v7, v8, v9, v10);
}

void __28__WPClient_sendTestRequest___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (objc_class *)OUTLINED_FUNCTION_7_0();
  uint64_t v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11(&dword_2144AA000, v6, v7, "Sending testRequest %@ for %@", v8, v9, v10, v11, v12);
}

void __28__WPClient_sendTestRequest___block_invoke_670_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_9() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_2144AA000, v4, v5, "WPClient can't reach bluetoothd to send test request. ERROR: %@", v6, v7, v8, v9, v10);
}

- (void)notifyNotApprovedUseCase:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_2144AA000, v0, OS_LOG_TYPE_FAULT, "Not approved use case: %@", v1, 0xCu);
}

@end