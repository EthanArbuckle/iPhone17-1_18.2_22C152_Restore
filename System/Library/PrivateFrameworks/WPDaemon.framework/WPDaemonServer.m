@interface WPDaemonServer
+ (BOOL)isAppleTV;
+ (BOOL)isHomePod;
+ (BOOL)isInternalBuild;
+ (BOOL)supportsNC2AdvertisingInstance;
+ (BOOL)supportsRanging;
+ (void)initialize;
- (BOOL)isClientTestMode:(id)a3;
- (BOOL)isMirroring;
- (BOOL)isRangingEnabled;
- (BOOL)isTesting;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)scanWithRetainDuplicates;
- (BOOL)screenOff;
- (BOOL)systemLocked;
- (FBSDisplayLayoutMonitor)mirroringMonitor;
- (NSArray)managers;
- (NSMapTable)clientsWithMach;
- (NSMutableDictionary)clients;
- (NSMutableSet)privilegedClients;
- (NSMutableSet)testClients;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)serverQueue;
- (WPDAdvertisingManager)advertisingManager;
- (WPDClient)spObjectDiscoveryClient;
- (WPDObjectDiscoveryManager)objectDiscoveryManager;
- (WPDPersistence)persistence;
- (WPDPipeManager)pipeManager;
- (WPDScanManager)scanManager;
- (WPDState)wpdState;
- (WPDStatsManager)statsManager;
- (WPDZoneManager)zoneManager;
- (WPDaemonServer)init;
- (id)clientForMachName:(id)a3;
- (id)getAllClients;
- (id)getClientForUUID:(id)a3;
- (int)firstUnlockStatusChangedToken;
- (int)lockStatusChangedToken;
- (int)screenStateToken;
- (int64_t)cbState;
- (unsigned)coreBluetoothState;
- (void)SetupSignalHandler;
- (void)addClient:(id)a3;
- (void)cbManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)disableScanningForClient:(id)a3;
- (void)dumpDaemonState;
- (void)dumpDaemonStateAsync;
- (void)enableRanging:(BOOL)a3;
- (void)enableTestMode;
- (void)enableTestMode:(BOOL)a3;
- (void)generateStateDump;
- (void)init;
- (void)initClients;
- (void)initManagers;
- (void)lockStateUpdate;
- (void)mirroringStateUpdate;
- (void)notifyClientsOfStateChange;
- (void)notifyManagersOfStateChange;
- (void)registerClient:(id)a3 withMachName:(id)a4 withCompletion:(id)a5;
- (void)registerForSpringboardNotifications;
- (void)removeClient:(id)a3;
- (void)screenStateUpdate;
- (void)setAdvertisingManager:(id)a3;
- (void)setCbState:(int64_t)a3;
- (void)setClients:(id)a3;
- (void)setClientsWithMach:(id)a3;
- (void)setCoreBluetoothState:(unsigned __int8)a3;
- (void)setFirstUnlockStatusChangedToken:(int)a3;
- (void)setIsMirroring:(BOOL)a3;
- (void)setIsTesting:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setLockStatusChangedToken:(int)a3;
- (void)setManagers:(id)a3;
- (void)setMirroringMonitor:(id)a3;
- (void)setObjectDiscoveryManager:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setPipeManager:(id)a3;
- (void)setPrivilegedClients:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScanManager:(id)a3;
- (void)setScreenOff:(BOOL)a3;
- (void)setScreenStateToken:(int)a3;
- (void)setServerQueue:(id)a3;
- (void)setStatsManager:(id)a3;
- (void)setSystemLocked:(BOOL)a3;
- (void)setTestClients:(id)a3;
- (void)setWpdState:(id)a3;
- (void)setZoneManager:(id)a3;
- (void)startListening;
- (void)updateState;
@end

@implementation WPDaemonServer

- (BOOL)screenOff
{
  return self->_screenOff;
}

- (id)getClientForUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v5 = [(WPDaemonServer *)self serverQueue];
  label = dispatch_queue_get_label(v5);

  v7 = dispatch_queue_get_label(0);
  if (!strcmp(label, v7))
  {
    v10 = [(WPDaemonServer *)self clients];
    uint64_t v11 = [v10 objectForKeyedSubscript:v4];
    v12 = (void *)v19[5];
    v19[5] = v11;
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_227);
    }
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = v7;
      _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_INFO, "WPDaemonServer:getClientForUUID called on %s", buf, 0xCu);
    }
    v9 = [(WPDaemonServer *)self serverQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__WPDaemonServer_getClientForUUID___block_invoke_228;
    block[3] = &unk_26469AD28;
    v17 = &v18;
    block[4] = self;
    id v16 = v4;
    dispatch_sync(v9, block);
  }
  id v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (OS_dispatch_queue)serverQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableDictionary)clients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (WPDStatsManager)statsManager
{
  return self->_statsManager;
}

- (BOOL)systemLocked
{
  return self->_systemLocked;
}

void __35__WPDaemonServer_isClientTestMode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) testClients];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (NSMutableSet)testClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (int64_t)cbState
{
  return self->_cbState;
}

- (BOOL)scanWithRetainDuplicates
{
  id v2 = [(WPDaemonServer *)self scanManager];
  char v3 = [v2 retainDuplicates];

  return v3;
}

- (WPDScanManager)scanManager
{
  return (WPDScanManager *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isClientTestMode:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(WPDaemonServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WPDaemonServer_isClientTestMode___block_invoke;
  block[3] = &unk_26469AD28;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

+ (BOOL)supportsNC2AdvertisingInstance
{
  if (supportsNC2AdvertisingInstance_sOnce != -1) {
    dispatch_once(&supportsNC2AdvertisingInstance_sOnce, &__block_literal_global_150_0);
  }
  return supportsNC2AdvertisingInstance_supported;
}

+ (BOOL)isHomePod
{
  return _MergedGlobals;
}

+ (BOOL)isAppleTV
{
  return byte_26ABF7BD9;
}

+ (BOOL)supportsRanging
{
  if (supportsRanging_onceToken != -1) {
    dispatch_once(&supportsRanging_onceToken, &__block_literal_global_4);
  }
  return supportsRanging_supportsRanging;
}

uint64_t __33__WPDaemonServer_supportsRanging__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportsRanging_supportsRanging = result;
  return result;
}

void __48__WPDaemonServer_supportsNC2AdvertisingInstance__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  supportsNC2AdvertisingInstance_supported = GestaltGetDeviceClass() == 13;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_152);
  }
  v0 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    if (supportsNC2AdvertisingInstance_supported) {
      v1 = "yes";
    }
    else {
      v1 = "no";
    }
    int v2 = 136315138;
    char v3 = v1;
    _os_log_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEFAULT, "Platform supports NonConnectable Secondary AdvertisingInstance: %s", (uint8_t *)&v2, 0xCu);
  }
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_156);
  }
  return isInternalBuild__isInternalBuild;
}

uint64_t __33__WPDaemonServer_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  isInternalBuild__isInternalBuild = result;
  return result;
}

+ (void)initialize
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 67109376;
  v1[1] = _MergedGlobals;
  __int16 v2 = 1024;
  int v3 = byte_26ABF7BD9;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "WPDaemonServer _isHomePod: %d _isAppleTV: %d", (uint8_t *)v1, 0xEu);
}

- (BOOL)isRangingEnabled
{
  int v3 = [(WPDaemonServer *)self persistence];
  if (v3)
  {
    uint64_t v4 = [(WPDaemonServer *)self persistence];
    char v5 = [v4 isRangingEnabled];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)SetupSignalHandler
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __36__WPDaemonServer_SetupSignalHandler__block_invoke;
  v8 = &unk_26469AD00;
  objc_copyWeak(&v9, &location);
  int v3 = (void *)MEMORY[0x223CB07B0](&v5);
  uint64_t v4 = [(WPDaemonServer *)self serverQueue];
  os_state_add_handler();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __36__WPDaemonServer_SetupSignalHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) == 2)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_164);
    }
    uint64_t v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_DWORD *)(a2 + 16) == 3) {
        uint64_t v5 = "OS_STATE_API_REQUEST";
      }
      else {
        uint64_t v5 = "OS_STATE_API_FAULT";
      }
      int v10 = 136315138;
      uint64_t v11 = v5;
      _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "WIPROX received %s, triggering statedump.", (uint8_t *)&v10, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained dumpDaemonState];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_169);
    }
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "WIPROX completed statedump.", (uint8_t *)&v10, 2u);
    }
  }
  return 0;
}

- (WPDaemonServer)init
{
  v20.receiver = self;
  v20.super_class = (Class)WPDaemonServer;
  __int16 v2 = [(WPDaemonServer *)&v20 init];
  int v3 = v2;
  if (v2)
  {
    v2->_cbState = 0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    clients = v3->_clients;
    v3->_clients = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    testClients = v3->_testClients;
    v3->_testClients = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    privilegedClients = v3->_privilegedClients;
    v3->_privilegedClients = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    clientsWithMach = v3->_clientsWithMach;
    v3->_clientsWithMach = (NSMapTable *)v10;

    uint64_t v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.wiproxd.clientQueue", v12);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.wiproxd.serverQueue", v12);
    serverQueue = v3->_serverQueue;
    v3->_serverQueue = (OS_dispatch_queue *)v15;

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_177_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDaemonServer init]();
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_183);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDaemonServer init]();
    }
    *(_WORD *)&v3->_screenOff = 0;
    v3->_isMirroring = 0;
    *(void *)&v3->_lockStatusChangedToken = -1;
    v3->_firstUnlockStatusChangedToken = -1;
    [(WPDaemonServer *)v3 registerForSpringboardNotifications];
    v3->_isTesting = 0;
    if (init_onceDToken != -1) {
      dispatch_once(&init_onceDToken, &__block_literal_global_189_0);
    }
    [(WPDaemonServer *)v3 SetupSignalHandler];
    uint32_t v17 = notify_post("com.apple.wirelessproximity.launch");
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_198_0);
    }
    uint64_t v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      [(WPDaemonServer *)v17 init];
    }
  }
  return v3;
}

void __22__WPDaemonServer_init__block_invoke_187()
{
  WPLoggingInit();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_191);
  }
  v0 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEFAULT, "STARTED WIPROX DAEMON", buf, 2u);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_194);
  }
  v1 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v2 = 0;
    _os_log_impl(&dword_22316D000, v1, OS_LOG_TYPE_DEFAULT, "WPDaemon iOS 18.2 (22C140) (WirelessProximity-182.22.2) (Release) built on 2024-11-14 22:48:20", v2, 2u);
  }
}

- (void)initManagers
{
  v29[4] = *MEMORY[0x263EF8340];
  int v3 = [WPDState alloc];
  uint64_t v4 = [(WPDaemonServer *)self serverQueue];
  uint64_t v5 = [(WPDState *)v3 initWithQueue:v4];
  [(WPDaemonServer *)self setWpdState:v5];

  uint64_t v6 = [(WPDaemonServer *)self wpdState];
  -[WPDaemonServer setCbState:](self, "setCbState:", [v6 state]);

  v7 = [[WPDScanManager alloc] initWithServer:self];
  [(WPDaemonServer *)self setScanManager:v7];

  uint64_t v8 = [[WPDAdvertisingManager alloc] initWithServer:self];
  [(WPDaemonServer *)self setAdvertisingManager:v8];

  id v9 = [[WPDZoneManager alloc] initWithServer:self];
  [(WPDaemonServer *)self setZoneManager:v9];

  uint64_t v10 = [[WPDPipeManager alloc] initWithServer:self];
  [(WPDaemonServer *)self setPipeManager:v10];

  uint64_t v11 = [[WPDStatsManager alloc] initWithServer:self];
  [(WPDaemonServer *)self setStatsManager:v11];

  if (_MergedGlobals)
  {
    uint64_t v12 = [(WPDaemonServer *)self scanManager];
    v29[0] = v12;
    dispatch_queue_t v13 = [(WPDaemonServer *)self advertisingManager];
    v29[1] = v13;
    char v14 = [(WPDaemonServer *)self pipeManager];
    v29[2] = v14;
    dispatch_queue_t v15 = [(WPDaemonServer *)self zoneManager];
    v29[3] = v15;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
    [(WPDaemonServer *)self setManagers:v16];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_207_0);
    }
    uint32_t v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "initManagers - ObjectDiscovery is disabled on this platform", v27, 2u);
    }
  }
  else
  {
    uint64_t v18 = [[WPDObjectDiscoveryManager alloc] initWithServer:self];
    [(WPDaemonServer *)self setObjectDiscoveryManager:v18];

    v19 = [(WPDaemonServer *)self scanManager];
    v28[0] = v19;
    objc_super v20 = [(WPDaemonServer *)self advertisingManager];
    v28[1] = v20;
    v21 = [(WPDaemonServer *)self pipeManager];
    v28[2] = v21;
    v22 = [(WPDaemonServer *)self zoneManager];
    v28[3] = v22;
    id v23 = [(WPDaemonServer *)self objectDiscoveryManager];
    v28[4] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:5];
    [(WPDaemonServer *)self setManagers:v24];
  }
  if (+[WPDaemonServer supportsRanging])
  {
    v25 = [(WPDaemonServer *)self scanManager];
    objc_msgSend(v25, "enableRanging:", -[WPDaemonServer isRangingEnabled](self, "isRangingEnabled"));
  }
  uint64_t v26 = [(WPDaemonServer *)self wpdState];
  [v26 updateWithCompletion:&__block_literal_global_211];
}

void __30__WPDaemonServer_initManagers__block_invoke_209()
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_213);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    __30__WPDaemonServer_initManagers__block_invoke_209_cold_1();
  }
}

- (void)initClients
{
  if (_MergedGlobals)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_215);
    }
    __int16 v2 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22316D000, v2, OS_LOG_TYPE_DEFAULT, "initClients - ObjectDiscovery is disabled on this platform", buf, 2u);
    }
  }
  else
  {
    uint64_t v4 = [[WPDObjectDiscoveryClient alloc] initWithXPCConnection:0 server:self];
    [(WPDaemonServer *)self addClient:v4];
    uint64_t v5 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v6 = [v5 processName];

    [(WPDObjectDiscoveryClient *)v4 registerWithDaemon:@"WPObjectDiscovery" forProcess:v6 machName:0 holdVouchers:0];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_223);
    }
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "Created WPDObjectDiscoveryClient instance and registered with the server", v9, 2u);
    }
    spObjectDiscoveryClient = self->_spObjectDiscoveryClient;
    self->_spObjectDiscoveryClient = &v4->super;
  }
}

- (void)dealloc
{
  int v3 = [(WPDaemonServer *)self spObjectDiscoveryClient];

  if (v3)
  {
    [(WPDClient *)self->_spObjectDiscoveryClient destroy];
    spObjectDiscoveryClient = self->_spObjectDiscoveryClient;
    self->_spObjectDiscoveryClient = 0;
  }
  if ([(WPDaemonServer *)self screenStateToken] != -1) {
    notify_cancel([(WPDaemonServer *)self screenStateToken]);
  }
  if ([(WPDaemonServer *)self lockStatusChangedToken] != -1) {
    notify_cancel([(WPDaemonServer *)self lockStatusChangedToken]);
  }
  if ([(WPDaemonServer *)self firstUnlockStatusChangedToken] != -1) {
    notify_cancel([(WPDaemonServer *)self firstUnlockStatusChangedToken]);
  }
  v5.receiver = self;
  v5.super_class = (Class)WPDaemonServer;
  [(WPDaemonServer *)&v5 dealloc];
}

void __35__WPDaemonServer_getClientForUUID___block_invoke_228(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) clients];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)getAllClients
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v3 = [(WPDaemonServer *)self clients];
  uint64_t v4 = [v3 allValues];
  id v5 = [v2 setWithArray:v4];

  return v5;
}

- (void)setCbState:(int64_t)a3
{
  if (self->_cbState != a3) {
    self->_cbState = a3;
  }
  [(WPDaemonServer *)self notifyClientsOfStateChange];
}

- (void)cbManagerDidUpdateState:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__WPDaemonServer_cbManagerDidUpdateState___block_invoke;
  v7[3] = &unk_26469AD50;
  v7[4] = self;
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223CB07B0](v7);
  uint64_t v6 = [(WPDaemonServer *)self wpdState];
  [v6 updateWithManager:v4 Completion:v5];
}

uint64_t __42__WPDaemonServer_cbManagerDidUpdateState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateState];
}

- (void)updateState
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v3 = [(WPDaemonServer *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__WPDaemonServer_updateState__block_invoke;
  block[3] = &unk_26469AD78;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__WPDaemonServer_updateState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained wpdState];
    uint64_t v5 = [v4 state];

    if (v5 == 3)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_230_0);
      }
      uint64_t v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "Daemon Peripheral is now powered on", buf, 2u);
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_233);
      }
      v7 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "Daemon Central is now powered on", v11, 2u);
      }
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_236);
    }
    uint64_t v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __29__WPDaemonServer_updateState__block_invoke_cold_1(v8, v3);
    }
    [v3 notifyManagersOfStateChange];
    [v3 setCbState:v5];
    if (v5 != 3)
    {
      id v9 = [v3 statsManager];
      [v9 reportPLStats];
    }
    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"WPDaemonServerStateChanged" object:*(void *)(a1 + 32)];
  }
}

- (void)notifyManagersOfStateChange
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WPDaemonServer *)self wpdState];
  uint64_t v4 = [v3 state];

  uint64_t v5 = [(WPDaemonServer *)self wpdState];
  uint64_t v6 = [v5 restricted];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = [(WPDaemonServer *)self managers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) updateState:v4 Restricted:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)addClient:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 conn];
  uint64_t v6 = [v5 valueForEntitlement:@"com.apple.wirelessproxd-util-test"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_242);
    }
    uint64_t v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      uint64_t v10 = [v4 clientUUID];
      *(_DWORD *)buf = 138543362;
      v29 = v10;
      _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "WiProx test client has connected (UUID: %{public}@)", buf, 0xCu);
    }
    uint64_t v11 = [(WPDaemonServer *)self queue];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __28__WPDaemonServer_addClient___block_invoke_243;
    v25 = &unk_26469ADA0;
    uint64_t v26 = self;
    id v12 = v4;
    id v27 = v12;
    dispatch_sync(v11, &v22);

    objc_msgSend(v12, "setIsTestModeClient:", 1, v22, v23, v24, v25, v26);
  }
  long long v13 = [v4 conn];
  long long v14 = [v13 valueForEntitlement:@"com.apple.wirelessproxd-disable-scans"];
  int v15 = [v14 BOOLValue];

  if (v15) {
    [v4 setCanDisableScans:1];
  }
  id v16 = [v4 conn];

  if (v16)
  {
    uint64_t v17 = [v4 conn];
    [v17 resume];
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_245);
  }
  uint64_t v18 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDaemonServer addClient:](v18, v4);
  }
  v19 = [(WPDaemonServer *)self clients];
  objc_super v20 = [v4 clientUUID];
  [v19 setObject:v4 forKeyedSubscript:v20];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_248);
  }
  v21 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDaemonServer addClient:](v21, self);
  }
}

void __28__WPDaemonServer_addClient___block_invoke_243(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) testClients];
  uint64_t v2 = [*(id *)(a1 + 40) clientUUID];
  [v3 addObject:v2];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 clientUUID];
  if (v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_250);
    }
    uint64_t v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      [(WPDaemonServer *)(uint64_t)v5 removeClient:v4];
    }
    int v7 = [(WPDaemonServer *)self clients];
    [v7 removeObjectForKey:v5];

    uint64_t v8 = [(WPDaemonServer *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__WPDaemonServer_removeClient___block_invoke_251;
    block[3] = &unk_26469ADA0;
    block[4] = self;
    id v9 = v5;
    id v29 = v9;
    dispatch_sync(v8, block);

    uint64_t v10 = [(WPDaemonServer *)self privilegedClients];
    int v11 = [v10 containsObject:v9];

    if (v11)
    {
      id v12 = [(WPDaemonServer *)self privilegedClients];
      [v12 removeObject:v9];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_253);
    }
    long long v13 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDaemonServer removeClient:](v13, v4);
    }
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_256_0);
  }
  long long v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDaemonServer addClient:](v14, self);
  }
  if ([(WPDaemonServer *)self isTesting])
  {
    int v15 = [(WPDaemonServer *)self testClients];
    uint64_t v16 = [v15 count];

    if (!v16)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_259_0);
      }
      uint64_t v17 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v27 = 0;
        _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "No more test clients available, exiting test mode", v27, 2u);
      }
      [(WPDaemonServer *)self enableTestMode:0];
    }
  }
  uint64_t v18 = [(WPDaemonServer *)self scanManager];
  if ([v18 scanningDisabled])
  {
    v19 = [(WPDaemonServer *)self privilegedClients];
    uint64_t v20 = [v19 count];

    if (v20) {
      goto LABEL_32;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_262_0);
    }
    v21 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v27 = 0;
      _os_log_impl(&dword_22316D000, v21, OS_LOG_TYPE_DEFAULT, "No more clients that can disable scans, re-enabling", v27, 2u);
    }
    uint64_t v22 = [(WPDaemonServer *)self scanManager];
    [v22 setScanningDisabled:0];

    uint64_t v18 = [(WPDaemonServer *)self scanManager];
    [v18 updateScanner];
  }

LABEL_32:
  uint64_t v23 = [(WPDaemonServer *)self objectDiscoveryManager];
  if (![v23 scanningDisabled])
  {
LABEL_35:

    goto LABEL_36;
  }
  v24 = [(WPDaemonServer *)self privilegedClients];
  uint64_t v25 = [v24 count];

  if (!v25)
  {
    uint64_t v26 = [(WPDaemonServer *)self objectDiscoveryManager];
    [v26 setScanningDisabled:0];

    uint64_t v23 = [(WPDaemonServer *)self objectDiscoveryManager];
    [v23 updateScanner];
    goto LABEL_35;
  }
LABEL_36:
}

void __31__WPDaemonServer_removeClient___block_invoke_251(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) testClients];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) testClients];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
}

- (void)registerClient:(id)a3 withMachName:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(WPDaemonServer *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__WPDaemonServer_registerClient_withMachName_withCompletion___block_invoke;
  v15[3] = &unk_26469ADC8;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __61__WPDaemonServer_registerClient_withMachName_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_264);
  }
  uint64_t v2 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 processName];
    int v6 = [*(id *)(a1 + 32) processID];
    int v7 = [*(id *)(a1 + 32) clientUUID];
    int v15 = 138543874;
    id v16 = v5;
    __int16 v17 = 1024;
    int v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_INFO, "Daemon registering process %{public}@ (%d) with WPDClient UUID %{public}@", (uint8_t *)&v15, 0x1Cu);
  }
  if (*(void *)(a1 + 40))
  {
    id v8 = [*(id *)(a1 + 48) clientsWithMach];
    [v8 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
  }
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [*(id *)(a1 + 48) scanManager];
  int v11 = [*(id *)(a1 + 48) advertisingManager];
  id v12 = [*(id *)(a1 + 48) zoneManager];
  id v13 = [*(id *)(a1 + 48) pipeManager];
  id v14 = [*(id *)(a1 + 48) objectDiscoveryManager];
  (*(void (**)(uint64_t, void *, void *, void *, void *, void *))(v9 + 16))(v9, v10, v11, v12, v13, v14);
}

- (id)clientForMachName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WPDaemonServer *)self clientsWithMach];
  int v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)notifyClientsOfStateChange
{
  int v3 = [(WPDaemonServer *)self wpdState];
  char v4 = [v3 restricted];

  uint64_t v5 = [(WPDaemonServer *)self wpdState];
  uint64_t v6 = [v5 state];

  int v7 = [(WPDaemonServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke;
  block[3] = &unk_26469AE10;
  block[4] = self;
  void block[5] = v6;
  char v9 = v4;
  dispatch_sync(v7, block);
}

void __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) clients];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke_2;
  v3[3] = &__block_descriptor_41_e34_v32__0__NSUUID_8__WPDClient_16_B24l;
  v3[4] = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_266);
  }
  int v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke_2_cold_1(a1, v7, v6);
  }
  [v6 notifyClientStateChange:*(void *)(a1 + 32) Restricted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)enableRanging:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[WPDaemonServer supportsRanging])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_269_0);
    }
    id v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDaemonServer enableRanging:](v5, self);
    }
    id v6 = [(WPDaemonServer *)self persistence];
    [v6 setIsRangingEnabled:v3];

    int v7 = [(WPDaemonServer *)self scanManager];

    if (v7)
    {
      id v8 = [(WPDaemonServer *)self scanManager];
      [v8 enableRanging:v3];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_272_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDaemonServer enableRanging:]();
    }
  }
}

- (void)startListening
{
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v3 = [(WPDaemonServer *)self serverQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__WPDaemonServer_startListening__block_invoke;
  v4[3] = &unk_26469ABC0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__WPDaemonServer_startListening__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained initManagers];
    [v2 initClients];
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.wirelessproxd"];
    [v2 setListener:v3];

    char v4 = [v2 listener];
    [v4 setDelegate:v2];

    id v5 = [v2 listener];
    [v5 resume];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_278);
    }
    id v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = @"com.apple.wirelessproxd";
      _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_INFO, "Daemon started listening for mach service %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [[WPDClient alloc] initWithXPCConnection:v5 server:self];

  int v7 = [(WPDaemonServer *)self serverQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__WPDaemonServer_listener_shouldAcceptNewConnection___block_invoke;
  v10[3] = &unk_26469ADA0;
  v10[4] = self;
  int v11 = v6;
  id v8 = v6;
  dispatch_sync(v7, v10);

  return 1;
}

uint64_t __53__WPDaemonServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addClient:*(void *)(a1 + 40)];
}

- (void)registerForSpringboardNotifications
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "Daemon couldn't register for screen on/off", v2, v3, v4, v5, v6);
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    if (notify_get_state(a2, &state64))
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_281_0);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v4 = state64;
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_284);
      }
      uint64_t v5 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        uint8_t v6 = "On";
        if (v4) {
          uint8_t v6 = "Off";
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v9 = v6;
        _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "Screen state - %s", buf, 0xCu);
      }
      if ((v4 != 0) != [WeakRetained screenOff])
      {
        [WeakRetained setScreenOff:v4 != 0];
        [WeakRetained screenStateUpdate];
      }
    }
  }
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_293(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_296);
  }
  uint64_t v10 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = "No";
    if (v8) {
      int v11 = "Yes";
    }
    *(_DWORD *)buf = 136315138;
    __int16 v17 = v11;
    _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEFAULT, "Mirroring state - %s", buf, 0xCu);
  }
  id v12 = [*(id *)(a1 + 32) serverQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_299;
  v13[3] = &unk_26469AE60;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  BOOL v15 = v8 != 0;
  dispatch_async(v12, v13);

  objc_destroyWeak(&v14);
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_299(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    int v3 = [WeakRetained isMirroring];
    int v4 = *(unsigned __int8 *)(a1 + 40);
    BOOL v5 = v4 == v3;
    id WeakRetained = v6;
    if (!v5)
    {
      [v6 setIsMirroring:v4 != 0];
      [v6 mirroringStateUpdate];
      id WeakRetained = v6;
    }
  }
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_2_302(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = MKBGetDeviceLockState();
    unsigned int v3 = [WeakRetained systemLocked];
    BOOL v4 = v2 == 1;
    if (v2 == 2) {
      BOOL v4 = v3;
    }
    if ((unint64_t)v2 <= 3) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = v3;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_304);
    }
    id v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      id v7 = "Unlocked";
      if (v5) {
        id v7 = "Locked";
      }
      int v8 = 136315138;
      id v9 = v7;
      _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_INFO, "Lock state - %s", (uint8_t *)&v8, 0xCu);
    }
    if (v5 != [WeakRetained systemLocked])
    {
      [WeakRetained setSystemLocked:v5];
      [WeakRetained lockStateUpdate];
    }
  }
}

uint64_t __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_311(uint64_t a1)
{
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) lockStatusChangedToken]);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) screenStateToken];
  BOOL v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_316(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 == -1)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_319);
      }
      int v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_INFO, "Already first unlocked", buf, 2u);
      }
      uint64_t v5 = [WeakRetained persistence];
      id v6 = v5;
      uint64_t v7 = 0;
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_322);
      }
      BOOL v4 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_INFO, "Received first unlocked notification", v10, 2u);
      }
      uint64_t v5 = [WeakRetained persistence];
      id v6 = v5;
      uint64_t v7 = 1;
    }
    [v5 firstUnlockedWithEvent:v7];

    id v9 = [WeakRetained persistence];
    objc_msgSend(WeakRetained, "enableRanging:", objc_msgSend(v9, "isRangingEnabled"));
  }
}

- (void)screenStateUpdate
{
  uint64_t v3 = [(WPDaemonServer *)self scanManager];
  [v3 updateScanner];

  BOOL v4 = [(WPDaemonServer *)self objectDiscoveryManager];
  [v4 updateScanner];

  uint64_t v5 = [(WPDaemonServer *)self advertisingManager];
  [v5 updateAdvertiser];

  id v6 = [(WPDaemonServer *)self statsManager];
  [v6 reportPLStats];
}

- (void)mirroringStateUpdate
{
  uint64_t v3 = [(WPDaemonServer *)self scanManager];
  [v3 updateScanner];

  id v4 = [(WPDaemonServer *)self statsManager];
  [v4 reportPLStats];
}

- (void)lockStateUpdate
{
  uint64_t v3 = [(WPDaemonServer *)self scanManager];
  [v3 updateScanner];

  id v4 = [(WPDaemonServer *)self objectDiscoveryManager];
  [v4 updateScanner];

  id v5 = [(WPDaemonServer *)self statsManager];
  [v5 reportPLStats];
}

- (void)enableTestMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WPDaemonServer *)self isTesting] != a3)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_328);
    }
    id v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "Disabling";
      if (v3) {
        id v6 = "Enabling";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = v6;
      _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "%s test mode", buf, 0xCu);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(WPDaemonServer *)self managers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) setTestMode:v3];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(WPDaemonServer *)self setIsTesting:v3];
  }
}

- (void)enableTestMode
{
}

- (void)disableScanningForClient:(id)a3
{
  id v4 = a3;
  id v5 = [(WPDaemonServer *)self scanManager];
  [v5 setScanningDisabled:1];

  id v6 = [(WPDaemonServer *)self privilegedClients];
  [v6 addObject:v4];
}

- (void)generateStateDump
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v2 = &WPLogInitOnce;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_332);
  }
  BOOL v3 = (os_log_t *)&WiProxLog;
  id v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v45 = (uint64_t)"WPDaemon iOS 18.2 (22C140) (WirelessProximity-182.22.2) (Release) built on 2024-11-14 22:48:20";
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %s", buf, 0xCu);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_336);
  }
  id v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v45 = 1840200;
    _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: WP_API_VERSION: %ld", buf, 0xCu);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_339);
  }
  id v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    uint64_t v8 = [(WPDaemonServer *)self wpdState];
    *(_DWORD *)buf = 138412290;
    uint64_t v45 = (uint64_t)v8;
    _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: wpdState: %@", buf, 0xCu);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_342);
  }
  uint64_t v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    int v11 = +[WPDManager wpStateAsString:[(WPDaemonServer *)self cbState]];
    int v12 = [(WPDaemonServer *)self cbState];
    *(_DWORD *)buf = 138412546;
    uint64_t v45 = (uint64_t)v11;
    __int16 v46 = 1024;
    int v47 = v12;
    _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: cbState: %@ (%d)", buf, 0x12u);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_346);
  }
  long long v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = v13;
    if ([(WPDaemonServer *)self isTesting]) {
      long long v15 = "yes";
    }
    else {
      long long v15 = "no";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v45 = (uint64_t)v15;
    _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: isTesting: %s", buf, 0xCu);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_349);
  }
  id v16 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = v16;
    if ([(WPDaemonServer *)self isRangingEnabled]) {
      uint64_t v18 = "yes";
    }
    else {
      uint64_t v18 = "no";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v45 = (uint64_t)v18;
    _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: isRangingEnabled: %s", buf, 0xCu);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_352_0);
  }
  uint64_t v19 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v19;
    if ([(WPDaemonServer *)self systemLocked]) {
      uint64_t v21 = "yes";
    }
    else {
      uint64_t v21 = "no";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v45 = (uint64_t)v21;
    _os_log_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: systemLocked: %s", buf, 0xCu);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_355_0);
  }
  uint64_t v22 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v22;
    v24 = [(WPDaemonServer *)self clients];
    uint64_t v25 = [v24 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v45 = v25;
    _os_log_impl(&dword_22316D000, v23, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: clients (%ld):", buf, 0xCu);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v26 = [(WPDaemonServer *)self clients];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v40;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * v30);
        if (*v2 != -1) {
          dispatch_once(v2, &__block_literal_global_358_0);
        }
        os_log_t v32 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v32;
          [(WPDaemonServer *)self clients];
          v34 = v3;
          v36 = v35 = v2;
          v37 = [v36 objectForKeyedSubscript:v31];
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = (uint64_t)v37;
          _os_log_impl(&dword_22316D000, v33, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);

          uint64_t v2 = v35;
          BOOL v3 = v34;
        }
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v28);
  }

  +[WPDClient generateStateDump];
}

- (void)dumpDaemonState
{
  if (+[WPDaemonServer isInternalBuild])
  {
    location[0] = 0;
    objc_initWeak(location, self);
    BOOL v3 = [(WPDaemonServer *)self serverQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__WPDaemonServer_dumpDaemonState__block_invoke;
    block[3] = &unk_26469ABC0;
    objc_copyWeak(&v6, location);
    dispatch_async(v3, block);

    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_360);
    }
    id v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "Statedump disabled on non-internal builds.", (uint8_t *)location, 2u);
    }
  }
}

void __33__WPDaemonServer_dumpDaemonState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dumpDaemonStateAsync];
    id WeakRetained = v2;
  }
}

- (void)dumpDaemonStateAsync
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_362);
  }
  BOOL v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: BEGIN", buf, 2u);
  }
  id v4 = (void *)MEMORY[0x223CB05A0]([(WPDaemonServer *)self generateStateDump]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(WPDaemonServer *)self managers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) generateStateDump];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(WPDaemonServer *)self statsManager];
  [v10 generateStateDump];

  int v11 = [(WPDaemonServer *)self spObjectDiscoveryClient];

  if (v11)
  {
    int v12 = [(WPDaemonServer *)self spObjectDiscoveryClient];
    [v12 generateStateDump];
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_365);
  }
  long long v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: END", buf, 2u);
  }
}

- (WPDAdvertisingManager)advertisingManager
{
  return (WPDAdvertisingManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAdvertisingManager:(id)a3
{
}

- (void)setStatsManager:(id)a3
{
}

- (WPDState)wpdState
{
  return self->_wpdState;
}

- (void)setWpdState:(id)a3
{
}

- (unsigned)coreBluetoothState
{
  return self->_coreBluetoothState;
}

- (void)setCoreBluetoothState:(unsigned __int8)a3
{
  self->_coreBluetoothState = a3;
}

- (void)setServerQueue:(id)a3
{
}

- (void)setScanManager:(id)a3
{
}

- (WPDZoneManager)zoneManager
{
  return (WPDZoneManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setZoneManager:(id)a3
{
}

- (WPDPipeManager)pipeManager
{
  return (WPDPipeManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPipeManager:(id)a3
{
}

- (WPDObjectDiscoveryManager)objectDiscoveryManager
{
  return (WPDObjectDiscoveryManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)setObjectDiscoveryManager:(id)a3
{
}

- (WPDClient)spObjectDiscoveryClient
{
  return (WPDClient *)objc_getProperty(self, a2, 104, 1);
}

- (WPDPersistence)persistence
{
  return (WPDPersistence *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPersistence:(id)a3
{
}

- (NSArray)managers
{
  return self->_managers;
}

- (void)setManagers:(id)a3
{
}

- (void)setClients:(id)a3
{
}

- (void)setTestClients:(id)a3
{
}

- (NSMutableSet)privilegedClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPrivilegedClients:(id)a3
{
}

- (NSMapTable)clientsWithMach
{
  return (NSMapTable *)objc_getProperty(self, a2, 152, 1);
}

- (void)setClientsWithMach:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 168, 1);
}

- (void)setListener:(id)a3
{
}

- (int)lockStatusChangedToken
{
  return self->_lockStatusChangedToken;
}

- (void)setLockStatusChangedToken:(int)a3
{
  self->_lockStatusChangedToken = a3;
}

- (int)screenStateToken
{
  return self->_screenStateToken;
}

- (void)setScreenStateToken:(int)a3
{
  self->_screenStateToken = a3;
}

- (int)firstUnlockStatusChangedToken
{
  return self->_firstUnlockStatusChangedToken;
}

- (void)setFirstUnlockStatusChangedToken:(int)a3
{
  self->_firstUnlockStatusChangedToken = a3;
}

- (FBSDisplayLayoutMonitor)mirroringMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMirroringMonitor:(id)a3
{
}

- (void)setScreenOff:(BOOL)a3
{
  self->_screenOff = a3;
}

- (void)setSystemLocked:(BOOL)a3
{
  self->_systemLocked = a3;
}

- (BOOL)isMirroring
{
  return self->_isMirroring;
}

- (void)setIsMirroring:(BOOL)a3
{
  self->_isMirroring = a3;
}

- (BOOL)isTesting
{
  return self->_isTesting;
}

- (void)setIsTesting:(BOOL)a3
{
  self->_isTesting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringMonitor, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientsWithMach, 0);
  objc_storeStrong((id *)&self->_privilegedClients, 0);
  objc_storeStrong((id *)&self->_testClients, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_spObjectDiscoveryClient, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_scanManager, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_wpdState, 0);
  objc_storeStrong((id *)&self->_statsManager, 0);
  objc_storeStrong((id *)&self->_advertisingManager, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v2 = @"com.wiproxd.clientQueue";
  __int16 v3 = 2080;
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEBUG, "Created queue %@ with QOS class %s (%d)", v1, 0x1Cu);
}

void __30__WPDaemonServer_initManagers__block_invoke_209_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEBUG, "Registered all CBManagers with wpdState, updates accepted now.", v1, 2u);
}

void __29__WPDaemonServer_updateState__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 cbState];
  OUTLINED_FUNCTION_5_0(&dword_22316D000, v4, v5, "Daemon has updated state %d -> %d", v6, v7, v8, v9, 0);
}

- (void)addClient:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 clients];
  [v4 count];
  uint64_t v5 = [a2 clients];
  uint64_t v6 = [v5 allValues];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_22316D000, v7, v8, "Current clients (%lu): %@", v9, v10, v11, v12, 2u);
}

- (void)addClient:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 clientUUID];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEBUG, "Added WPDClient %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)removeClient:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 processName];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_22316D000, v3, OS_LOG_TYPE_ERROR, "Client for process %@ doesn't have a client UUID", (uint8_t *)&v5, 0xCu);
}

- (void)removeClient:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = a2;
  uint64_t v6 = [a3 processName];
  int v7 = 138543618;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEBUG, "Remove client WPDClient %{public}@ for process %@", (uint8_t *)&v7, 0x16u);
}

void __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke_2_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v6 = a2;
  int v7 = [a3 clientUUID];
  uint64_t v8 = [a3 processName];
  v9[0] = 67109890;
  v9[1] = v4;
  __int16 v10 = 1024;
  int v11 = v5;
  __int16 v12 = 2114;
  long long v13 = v7;
  __int16 v14 = 2112;
  long long v15 = v8;
  _os_log_debug_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEBUG, "notifyClientsOfStateChange: %d restricted: %d to WPDClient %{public}@ name %@", (uint8_t *)v9, 0x22u);
}

- (void)enableRanging:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 persistence];
  [v4 isRangingEnabled];
  OUTLINED_FUNCTION_5_0(&dword_22316D000, v5, v6, "Enable ranging: %d -> %d", v7, v8, v9, v10, 0);
}

- (void)enableRanging:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "Ranging is not supported on this platform.", v2, v3, v4, v5, v6);
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "notify_get_state() not returning NOTIFY_STATUS_OK", v2, v3, v4, v5, v6);
}

@end