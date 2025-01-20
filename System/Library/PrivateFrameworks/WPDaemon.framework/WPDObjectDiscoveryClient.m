@interface WPDObjectDiscoveryClient
- (BOOL)pendingSent;
- (NSNumber)testBeaconingInterval;
- (WPDObjectDiscoveryClient)initWithXPCConnection:(id)a3 server:(id)a4;
- (WPDObjectDiscoveryData)keyAddressAndPayload;
- (WPDObjectDiscoveryManager)objectDiscoveryManager;
- (WPDSearchPartyAgent)spAgent;
- (unint64_t)keyRequestID;
- (unint64_t)tokenRequestID;
- (void)completeSPBeaconingWithSuccess:(BOOL)a3;
- (void)completeSPNearbyTockensWithSuccess:(BOOL)a3;
- (void)dealloc;
- (void)destroy;
- (void)endTestMode;
- (void)generateStateDump;
- (void)notifyClientObjectDiscoveryStateChange:(int64_t)a3;
- (void)registerWithDaemon:(id)a3 forProcess:(id)a4 machName:(id)a5 holdVouchers:(int64_t)a6;
- (void)sendRegisteredWithDaemonAndContinuingSession:(BOOL)a3;
- (void)sendTestRequest:(id)a3;
- (void)setKeyRequestID:(unint64_t)a3;
- (void)setObjectDiscoveryManager:(id)a3;
- (void)setPendingSent:(BOOL)a3;
- (void)setSpAgent:(id)a3;
- (void)setTestBeaconingInterval:(id)a3;
- (void)setTokenRequestID:(unint64_t)a3;
- (void)startAdvertising:(id)a3;
- (void)startSPBeaconing;
- (void)stopAdvertising:(id)a3;
- (void)stopSPBeaconing;
- (void)updateSPBeaconing;
- (void)updateSPNearbyTokens;
@end

@implementation WPDObjectDiscoveryClient

- (WPDObjectDiscoveryClient)initWithXPCConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WPDObjectDiscoveryClient;
  v8 = [(WPDClient *)&v25 initWithXPCConnection:0 server:v7];
  v9 = v8;
  if (v8)
  {
    v8->_pendingSent = 0;
    uint64_t v10 = objc_opt_new();
    keyAddressAndPayload = v9->_keyAddressAndPayload;
    v9->_keyAddressAndPayload = (WPDObjectDiscoveryData *)v10;

    spAgent = v9->_spAgent;
    v9->_spAgent = 0;

    testBeaconingInterval = v9->_testBeaconingInterval;
    v9->_testBeaconingInterval = 0;

    if (objc_opt_class())
    {
      location[0] = 0;
      objc_initWeak(location, v9);
      v14 = [WPDSearchPartyAgent alloc];
      v15 = [(WPDClient *)v9 serverQueue];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke;
      v22[3] = &unk_26469B208;
      objc_copyWeak(&v23, location);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_149;
      v20[3] = &unk_26469B208;
      objc_copyWeak(&v21, location);
      uint64_t v16 = [(WPDSearchPartyAgent *)v14 initWithQueue:v15 beaconChange:v22 tokensChange:v20];
      v17 = v9->_spAgent;
      v9->_spAgent = (WPDSearchPartyAgent *)v16;

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(location);
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_155);
      }
      v18 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_INFO, "WPDObjectDiscoveryClient SPOwner framework not found, beaconing is disabled", (uint8_t *)location, 2u);
      }
    }
  }

  return v9;
}

void __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_11);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_cold_1();
      if (!a2) {
        goto LABEL_7;
      }
    }
    else if (!a2)
    {
LABEL_7:
      [WeakRetained updateSPBeaconing];
      goto LABEL_8;
    }
    [WeakRetained setKeyRequestID:a2];
    goto LABEL_7;
  }
LABEL_8:
}

void __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_149(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_152_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_149_cold_1();
      if (!a2) {
        goto LABEL_7;
      }
    }
    else if (!a2)
    {
LABEL_7:
      [WeakRetained updateSPNearbyTokens];
      goto LABEL_8;
    }
    [WeakRetained setTokenRequestID:a2];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_157);
  }
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = [(WPDClient *)self clientUUID];
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_INFO, "Deallocing WPDObjectDiscoveryClient %@", buf, 0xCu);
  }
  [(WPDObjectDiscoveryClient *)self setSpAgent:0];
  v6.receiver = self;
  v6.super_class = (Class)WPDObjectDiscoveryClient;
  [(WPDClient *)&v6 dealloc];
}

- (void)generateStateDump
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_161);
  }
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(WPDClient *)self clientTypeString];
    objc_super v6 = [(WPDClient *)self clientUUID];
    int v11 = 138412546;
    v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: ========= %@ %@ =========", (uint8_t *)&v11, 0x16u);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_164_0);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    uint64_t v9 = [(WPDObjectDiscoveryClient *)self keyAddressAndPayload];
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: beacon buffer %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = [(WPDObjectDiscoveryClient *)self spAgent];
  [v10 generateStateDump];
}

- (void)endTestMode
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_166);
  }
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = [(WPDClient *)self clientUUID];
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_INFO, "Ending test mode WPDObjectDiscoveryClient %@", buf, 0xCu);
  }
  objc_super v6 = [(WPDObjectDiscoveryClient *)self spAgent];

  if (v6)
  {
    id v7 = [(WPDObjectDiscoveryClient *)self spAgent];
    [v7 stopTest];
  }
  v8.receiver = self;
  v8.super_class = (Class)WPDObjectDiscoveryClient;
  [(WPDClient *)&v8 endTestMode];
}

- (void)registerWithDaemon:(id)a3 forProcess:(id)a4 machName:(id)a5 holdVouchers:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WPDObjectDiscoveryClient;
  [(WPDClient *)&v21 registerWithDaemon:v10 forProcess:v11 machName:v12 holdVouchers:a6];
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __80__WPDObjectDiscoveryClient_registerWithDaemon_forProcess_machName_holdVouchers___block_invoke;
  v18 = &unk_26469AEE0;
  objc_copyWeak(&v19, &location);
  __int16 v13 = (void *)MEMORY[0x223CB07B0](&v15);
  v14 = [(WPDClient *)self server];
  [v14 registerClient:self withMachName:v12 withCompletion:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __80__WPDObjectDiscoveryClient_registerWithDaemon_forProcess_machName_holdVouchers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setRegistered:1];
    [v8 setObjectDiscoveryManager:v9];
    [v8 sendRegisteredWithDaemonAndContinuingSession:0];
  }
}

- (void)sendRegisteredWithDaemonAndContinuingSession:(BOOL)a3
{
  v4 = [(WPDClient *)self server];
  v5 = [v4 wpdState];
  uint64_t v6 = [v5 state];

  id v7 = [(WPDClient *)self server];
  objc_super v8 = [v7 wpdState];
  uint64_t v9 = [v8 restricted];

  [(WPDObjectDiscoveryClient *)self notifyClientStateChange:v6 Restricted:v9];
}

- (void)destroy
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_173_1);
  }
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(WPDClient *)self clientUUID];
    uint64_t v6 = [(WPDClient *)self processName];
    int v11 = 138543874;
    id v12 = v5;
    __int16 v13 = 2114;
    v14 = v6;
    __int16 v15 = 1024;
    int v16 = [(WPDClient *)self processID];
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "Removing WPDObjectDiscoveryClient %{public}@ of process %{public}@ (%d)", (uint8_t *)&v11, 0x1Cu);
  }
  if ([(WPDClient *)self registered])
  {
    id v7 = [(WPDObjectDiscoveryClient *)self objectDiscoveryManager];
    objc_super v8 = [(WPDClient *)self clientUUID];
    [v7 removeAdvertisingRequestsForClient:v8];

    uint64_t v9 = [(WPDObjectDiscoveryClient *)self objectDiscoveryManager];
    [v9 updateNearbyTokens:0];
  }
  id v10 = [(WPDClient *)self server];
  [v10 removeClient:self];
}

- (void)updateSPNearbyTokens
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "ObjectDiscovery update nearby tokens", v2, v3, v4, v5, v6);
}

- (void)completeSPNearbyTockensWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_189_3);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryClient completeSPNearbyTockensWithSuccess:](v5, self);
  }
  uint8_t v6 = [(WPDObjectDiscoveryClient *)self spAgent];

  if (v6)
  {
    unint64_t v7 = [(WPDObjectDiscoveryClient *)self tokenRequestID];
    [(WPDObjectDiscoveryClient *)self setTokenRequestID:0];
    objc_super v8 = [(WPDObjectDiscoveryClient *)self spAgent];
    [v8 completedTokenRequestID:v7 success:v3];
  }
}

- (void)updateSPBeaconing
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = a1;
  uint64_t v4 = [a2 spAgent];
  if ([v4 beaconState]) {
    uint64_t v5 = "ON";
  }
  else {
    uint64_t v5 = "OFF";
  }
  uint8_t v6 = [a2 objectDiscoveryManager];
  int v8 = 136315650;
  uint64_t v9 = "-[WPDObjectDiscoveryClient updateSPBeaconing]";
  if ([v6 state] == 3) {
    unint64_t v7 = "ON";
  }
  else {
    unint64_t v7 = "OFF";
  }
  __int16 v10 = 2080;
  int v11 = v5;
  __int16 v12 = 2080;
  __int16 v13 = v7;
  _os_log_debug_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEBUG, "%s spAgent.beaconState: %s objectDiscoveryManager.state: %s", (uint8_t *)&v8, 0x20u);
}

- (void)startSPBeaconing
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[WPDObjectDiscoveryClient startSPBeaconing]";
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_22316D000, v0, OS_LOG_TYPE_ERROR, "%s bad advertisement %@", (uint8_t *)&v1, 0x16u);
}

- (void)stopSPBeaconing
{
  id v4 = +[WPAdvertisingRequest requestForClientType:18];
  [(WPDObjectDiscoveryClient *)self stopAdvertising:v4];
  uint64_t v3 = [(WPDObjectDiscoveryClient *)self keyAddressAndPayload];
  [v3 wipeout];
}

- (void)completeSPBeaconingWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_206_0);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryClient completeSPBeaconingWithSuccess:](v5, self);
  }
  uint8_t v6 = [(WPDObjectDiscoveryClient *)self spAgent];

  if (v6)
  {
    unint64_t v7 = [(WPDObjectDiscoveryClient *)self keyRequestID];
    [(WPDObjectDiscoveryClient *)self setKeyRequestID:0];
    int v8 = [(WPDObjectDiscoveryClient *)self spAgent];
    [v8 completedKeyRequestID:v7 success:v3];
  }
}

- (void)startAdvertising:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_208);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryClient startAdvertising:].cold.5();
  }
  uint64_t v5 = [v4 clientType];
  if (![(WPDClient *)self registered])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_211_0);
    }
    __int16 v15 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDObjectDiscoveryClient startAdvertising:].cold.4(v15, self);
    }
    int v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    v35[0] = @"The client is currently not registered with the daemon";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v18 = v16;
    uint64_t v19 = 2;
    goto LABEL_27;
  }
  uint8_t v6 = [(WPDObjectDiscoveryClient *)self objectDiscoveryManager];

  if (!v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_218);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDObjectDiscoveryClient updateSPNearbyTokens]();
    }
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v33 = @"WPDObjectDiscovery manager is nil";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v18 = v20;
    uint64_t v19 = 26;
LABEL_27:
    __int16 v12 = [v18 errorWithDomain:@"WPErrorDomain" code:v19 userInfo:v17];

    if (v12)
    {
      int v14 = 1;
      goto LABEL_29;
    }
    uint64_t v21 = 0;
LABEL_37:
    [(WPDObjectDiscoveryClient *)self completeSPBeaconingWithSuccess:v21];
    goto LABEL_38;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_224);
  }
  unint64_t v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = v7;
    uint64_t v9 = [(WPDClient *)self processName];
    int v22 = 138544386;
    id v23 = v9;
    __int16 v24 = 1024;
    int v25 = [(WPDClient *)self processID];
    __int16 v26 = 2048;
    uint64_t v27 = v5;
    __int16 v28 = 2048;
    uint64_t v29 = [v4 advertisingRate];
    __int16 v30 = 2048;
    double v31 = (double)[v4 advertisingRate] * 0.625;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Start advertising for process %{public}@ (%d) of type %ld with advertising interval %ld (%.2f ms)", (uint8_t *)&v22, 0x30u);
  }
  __int16 v10 = [(WPDObjectDiscoveryClient *)self objectDiscoveryManager];
  int v11 = [(WPDClient *)self clientUUID];
  __int16 v12 = [v10 addAdvertisingRequest:v4 forClient:v11];

  if (!v12)
  {
    uint64_t v21 = 1;
    goto LABEL_37;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_227_0);
  }
  __int16 v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDObjectDiscoveryClient startAdvertising:](v13, v12);
  }
  int v14 = 0;
LABEL_29:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_230_1);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDObjectDiscoveryClient startAdvertising:]();
  }
  [(WPDClient *)self advertisingFailedToStart:v12 ofType:v5];
  [(WPDObjectDiscoveryClient *)self setPendingSent:0];
  uint64_t v21 = 0;
  if (v14) {
    goto LABEL_37;
  }
LABEL_38:
}

- (void)stopAdvertising:(id)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_232_0);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryClient stopAdvertising:].cold.4();
  }
  if (![(WPDClient *)self registered])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_235_0);
    }
    int v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDObjectDiscoveryClient stopAdvertising:](v14, self);
    }
    __int16 v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v32[0] = @"The client is currently not registered with the daemon";
    int v16 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v17 = v15;
    uint64_t v18 = 2;
    goto LABEL_26;
  }
  uint64_t v5 = [(WPDObjectDiscoveryClient *)self objectDiscoveryManager];

  if (!v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_238_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDObjectDiscoveryClient updateSPNearbyTokens]();
    }
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    __int16 v30 = @"ObjectDiscovery manager is nil ";
    int v16 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v17 = v19;
    uint64_t v18 = 26;
LABEL_26:
    __int16 v12 = [v17 errorWithDomain:@"WPErrorDomain" code:v18 userInfo:v16];

    uint64_t v20 = 0;
LABEL_27:
    [(WPDObjectDiscoveryClient *)self completeSPBeaconingWithSuccess:v20];
    goto LABEL_28;
  }
  unsigned int v6 = [v4 clientType];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_244_0);
  }
  unint64_t v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = v7;
    uint64_t v9 = [(WPDClient *)self processName];
    int v23 = 138543874;
    __int16 v24 = v9;
    __int16 v25 = 1024;
    int v26 = [(WPDClient *)self processID];
    __int16 v27 = 2048;
    uint64_t v28 = v6;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Stop advertising for process %{public}@ (%d) of type %ld", (uint8_t *)&v23, 0x1Cu);
  }
  __int16 v10 = [(WPDObjectDiscoveryClient *)self objectDiscoveryManager];
  int v11 = [(WPDClient *)self clientUUID];
  __int16 v12 = [v10 removeAdvertisingRequest:v4 forClient:v11];

  if (!v12)
  {
    uint64_t v21 = [(WPDClient *)self conn];
    int v22 = [v21 remoteObjectProxy];
    objc_msgSend(v22, "advertisingStoppedOfType:withError:", objc_msgSend(v4, "clientType"), 0);

    [(WPDObjectDiscoveryClient *)self setPendingSent:0];
    __int16 v12 = 0;
    uint64_t v20 = 1;
    goto LABEL_27;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_247);
  }
  __int16 v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDObjectDiscoveryClient startAdvertising:](v13, v12);
  }
LABEL_28:
}

- (void)notifyClientObjectDiscoveryStateChange:(int64_t)a3
{
  if (notifyClientObjectDiscoveryStateChange__state != a3)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_249_0);
    }
    uint64_t v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDObjectDiscoveryClient notifyClientObjectDiscoveryStateChange:](a3, v5);
    }
    notifyClientObjectDiscoveryStateChange__state = a3;
    id location = 0;
    objc_initWeak(&location, self);
    unsigned int v6 = [(WPDClient *)self serverQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__WPDObjectDiscoveryClient_notifyClientObjectDiscoveryStateChange___block_invoke_250;
    v7[3] = &unk_26469ABC0;
    objc_copyWeak(&v8, &location);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __67__WPDObjectDiscoveryClient_notifyClientObjectDiscoveryStateChange___block_invoke_250(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateSPBeaconing];
    [v2 updateSPNearbyTokens];
    id WeakRetained = v2;
  }
}

- (void)sendTestRequest:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_252_1);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    [(WPDObjectDiscoveryClient *)(uint64_t)v4 sendTestRequest:self];
  }
  unsigned int v6 = [v4 objectForKeyedSubscript:@"kWPTestRequestKeyID"];
  unint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 integerValue];
    switch(v8)
    {
      case 1:
        [(WPDClient *)self setIsTestModeClient:1];
        uint64_t v9 = [(WPDObjectDiscoveryClient *)self spAgent];
        [v9 startTest];

        break;
      case 2:
        [(WPDClient *)self setIsTestModeClient:0];
        __int16 v12 = [(WPDObjectDiscoveryClient *)self spAgent];
        [v12 stopTest];

        [(WPDObjectDiscoveryClient *)self setTestBeaconingInterval:0];
        break;
      case 3:
        uint64_t v13 = [v4 objectForKeyedSubscript:@"kWPTestBeaconKeysKey"];
        if (v13) {
          int v14 = (void *)v13;
        }
        else {
          int v14 = (void *)MEMORY[0x263EFFA68];
        }
        __int16 v15 = [(WPDObjectDiscoveryClient *)self spAgent];
        [v15 updateTestBeaconKeys:v14];
        goto LABEL_29;
      case 4:
        uint64_t v16 = [v4 objectForKeyedSubscript:@"kWPTestNearOwnerTokensKey"];
        if (v16) {
          int v14 = (void *)v16;
        }
        else {
          int v14 = (void *)MEMORY[0x263EFFA68];
        }
        __int16 v15 = [(WPDObjectDiscoveryClient *)self spAgent];
        [v15 updateTestNearOwnerTokens:v14];
        goto LABEL_29;
      case 5:
        int v14 = [v4 objectForKeyedSubscript:@"kWPTestBeaconStatusKey"];
        __int16 v15 = [(WPDObjectDiscoveryClient *)self spAgent];
        [v15 updateTestBeaconStatus:v14];
        goto LABEL_29;
      case 6:
        int v14 = [v4 objectForKeyedSubscript:@"kWPTestBeaconExtendedKey"];
        __int16 v15 = [(WPDObjectDiscoveryClient *)self spAgent];
        [v15 updateTestBeaconExtended:v14];
        goto LABEL_29;
      case 7:
        uint64_t v17 = [v4 objectForKeyedSubscript:@"kWPTestBeaconStateKey"];
        if (v17) {
          int v14 = (void *)v17;
        }
        else {
          int v14 = (void *)MEMORY[0x263EFFA80];
        }
        __int16 v15 = [(WPDObjectDiscoveryClient *)self spAgent];
        [v15 updateTestBeaconState:v14];
LABEL_29:

        break;
      case 8:
        uint64_t v18 = [v4 objectForKeyedSubscript:@"kWPTestBeaconIntervalKey"];
        [(WPDObjectDiscoveryClient *)self setTestBeaconingInterval:v18];

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_255);
        }
        uint64_t v19 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          -[WPDObjectDiscoveryClient sendTestRequest:](v19, self);
        }
        break;
      default:
        uint64_t v10 = v8;
        goto LABEL_9;
    }
  }
  else
  {
    uint64_t v10 = 0;
LABEL_9:
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_258_0);
    }
    int v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      [(WPDObjectDiscoveryClient *)v11 sendTestRequest:v10];
    }
  }
}

- (BOOL)pendingSent
{
  return self->_pendingSent;
}

- (void)setPendingSent:(BOOL)a3
{
  self->_pendingSent = a3;
}

- (WPDObjectDiscoveryManager)objectDiscoveryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectDiscoveryManager);
  return (WPDObjectDiscoveryManager *)WeakRetained;
}

- (void)setObjectDiscoveryManager:(id)a3
{
}

- (WPDObjectDiscoveryData)keyAddressAndPayload
{
  return (WPDObjectDiscoveryData *)objc_getProperty(self, a2, 280, 1);
}

- (unint64_t)keyRequestID
{
  return self->_keyRequestID;
}

- (void)setKeyRequestID:(unint64_t)a3
{
  self->_keyRequestID = a3;
}

- (unint64_t)tokenRequestID
{
  return self->_tokenRequestID;
}

- (void)setTokenRequestID:(unint64_t)a3
{
  self->_tokenRequestID = a3;
}

- (WPDSearchPartyAgent)spAgent
{
  return (WPDSearchPartyAgent *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSpAgent:(id)a3
{
}

- (NSNumber)testBeaconingInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTestBeaconingInterval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testBeaconingInterval, 0);
  objc_storeStrong((id *)&self->_spAgent, 0);
  objc_storeStrong((id *)&self->_keyAddressAndPayload, 0);
  objc_destroyWeak((id *)&self->_objectDiscoveryManager);
}

void __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "WPDObjectDiscoveryClient SP beacon changed", v2, v3, v4, v5, v6);
}

void __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_149_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "WPDObjectDiscoveryClient SP tokens changed", v2, v3, v4, v5, v6);
}

- (void)completeSPNearbyTockensWithSuccess:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 tokenRequestID];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_0(&dword_22316D000, v4, v5, "ObjectDiscovery complete SPNearbyTockens ID:%lu success:%d", v6, v7, v8, v9, v10);
}

- (void)completeSPBeaconingWithSuccess:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 keyRequestID];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_0(&dword_22316D000, v4, v5, "ObjectDiscovery complete SPBeaconing ID:%lu success:%d", v6, v7, v8, v9, v10);
}

- (void)startAdvertising:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v0, v1, "ObjectDiscovery Advertising failed to start with error: %@", v2);
}

- (void)startAdvertising:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v3, v5, "%@", v6);
}

- (void)startAdvertising:(void *)a1 .cold.4(void *a1, void *a2)
{
  id v3 = a1;
  [a2 processID];
  uint64_t v4 = [a2 clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v5, v6, "ObjectDiscovery Trying to start advertising when process %d (client %@) is not registered with daemon - ignoring", v7, v8, v9, v10, v11);
}

- (void)startAdvertising:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "ObjectDiscovery Start advertising with request %@", v2, v3, v4, v5, v6);
}

- (void)stopAdvertising:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3 = a1;
  [a2 processID];
  uint64_t v4 = [a2 clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v5, v6, "ObjectDiscovery Trying to stop advertising when process %d (client %@) is not registered with daemon - ignoring", v7, v8, v9, v10, v11);
}

- (void)stopAdvertising:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "ObjectDiscovery Stop advertising with request %@", v2, v3, v4, v5, v6);
}

- (void)notifyClientObjectDiscoveryStateChange:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = "-[WPDObjectDiscoveryClient notifyClientObjectDiscoveryStateChange:]";
  if (notifyClientObjectDiscoveryStateChange__state == 3) {
    uint64_t v2 = "ON";
  }
  else {
    uint64_t v2 = "OFF";
  }
  int v4 = 136315650;
  __int16 v6 = 2080;
  uint64_t v7 = v2;
  if (a1 == 3) {
    uint64_t v3 = "ON";
  }
  else {
    uint64_t v3 = "OFF";
  }
  __int16 v8 = 2080;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "%s advertiser state changed from %s to %s", (uint8_t *)&v4, 0x20u);
}

- (void)sendTestRequest:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  __int16 v6 = [a2 clientUUID];
  int v7 = 134218242;
  uint64_t v8 = a3;
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_22316D000, v5, OS_LOG_TYPE_ERROR, "Bad send test request %ld for client %@, dropping on the floor", (uint8_t *)&v7, 0x16u);
}

- (void)sendTestRequest:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = [a2 testBeaconingInterval];
  uint64_t v5 = [a2 clientUUID];
  int v6 = 138412546;
  int v7 = v4;
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEBUG, "Requested custom beaconing interval %@ ms for test client %@", (uint8_t *)&v6, 0x16u);
}

- (void)sendTestRequest:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  int v6 = [a3 clientUUID];
  int v7 = 138412546;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEBUG, "Send test request %@ for WPDObjectDiscoveryClient %@", (uint8_t *)&v7, 0x16u);
}

@end