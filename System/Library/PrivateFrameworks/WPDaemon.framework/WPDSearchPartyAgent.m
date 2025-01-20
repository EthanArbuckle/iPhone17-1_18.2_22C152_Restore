@interface WPDSearchPartyAgent
+ (id)spBeaconKeyFromTestKey:(id)a3;
- (BOOL)beaconState;
- (BOOL)continueAdvOnFail;
- (BOOL)disableScans;
- (BOOL)isTestMode;
- (BOOL)spBeaconState;
- (BOOL)testBeaconState;
- (NSArray)beaconKeys;
- (NSArray)nearbyTokens;
- (NSArray)spBeaconKeys;
- (NSArray)spNearbyTokens;
- (NSArray)testBeaconKeys;
- (NSArray)testNearbyTokens;
- (NSData)beaconKey;
- (NSData)beaconReserved;
- (NSData)spBeaconReserved;
- (NSData)testBeaconReserved;
- (NSDate)beaconKeysUpdated;
- (NSDate)nearbyTokensUpdated;
- (NSDate)spBeaconKeysUpdated;
- (NSDate)spNearbyTokensUpdated;
- (NSDate)testBeaconKeysUpdated;
- (NSDate)testNearbyTokensUpdated;
- (OS_dispatch_queue)queue;
- (SPBeaconManager)beaconManager;
- (WPDPendingCompletions)pendingKeyCompletions;
- (WPDPendingCompletions)pendingTokenCompletions;
- (WPDSearchPartyAgent)initWithQueue:(id)a3 beaconChange:(id)a4 tokensChange:(id)a5;
- (id)beaconChange;
- (id)beaconKeysChangedBlock;
- (id)beaconStateChangedBlock;
- (id)beaconStatusChangedBlock;
- (id)nearbyTokensChangedBlock;
- (id)tokensChange;
- (unsigned)beaconStatus;
- (unsigned)spBeaconStatus;
- (unsigned)testBeaconStatus;
- (void)completedKeyRequestID:(unint64_t)a3 success:(BOOL)a4;
- (void)completedTokenRequestID:(unint64_t)a3 success:(BOOL)a4;
- (void)dealloc;
- (void)generateStateDump;
- (void)initSPObjects;
- (void)rollKeysWithRequestID:(unint64_t)a3;
- (void)rollKeys_async;
- (void)rollKeys_async_completion:(id)a3;
- (void)rollTokensWithRequestID:(unint64_t)a3;
- (void)rollTokens_async;
- (void)rollTokens_async_completion:(id)a3;
- (void)setBeaconChange:(id)a3;
- (void)setBeaconKey:(id)a3;
- (void)setBeaconKeysChangedBlock:(id)a3;
- (void)setBeaconManager:(id)a3;
- (void)setBeaconStateChangedBlock:(id)a3;
- (void)setBeaconStatusChangedBlock:(id)a3;
- (void)setContinueAdvOnFail:(BOOL)a3;
- (void)setDisableScans:(BOOL)a3;
- (void)setIsTestMode:(BOOL)a3;
- (void)setNearbyTokensChangedBlock:(id)a3;
- (void)setPendingKeyCompletions:(id)a3;
- (void)setPendingTokenCompletions:(id)a3;
- (void)setSpBeaconKeys:(id)a3;
- (void)setSpBeaconKeysUpdated:(id)a3;
- (void)setSpBeaconState:(BOOL)a3;
- (void)setSpBeaconStatus:(unsigned __int8)a3;
- (void)setSpNearbyTokens:(id)a3;
- (void)setSpNearbyTokensUpdated:(id)a3;
- (void)setTestBeaconKeys:(id)a3;
- (void)setTestBeaconKeysUpdated:(id)a3;
- (void)setTestBeaconReserved:(id)a3;
- (void)setTestBeaconState:(BOOL)a3;
- (void)setTestBeaconStatus:(unsigned __int8)a3;
- (void)setTestNearbyTokens:(id)a3;
- (void)setTestNearbyTokensUpdated:(id)a3;
- (void)setTokensChange:(id)a3;
- (void)startTest;
- (void)stopTest;
- (void)updateTestBeaconExtended:(id)a3;
- (void)updateTestBeaconKeys:(id)a3;
- (void)updateTestBeaconState:(id)a3;
- (void)updateTestBeaconStatus:(id)a3;
- (void)updateTestNearOwnerTokens:(id)a3;
@end

@implementation WPDSearchPartyAgent

- (WPDSearchPartyAgent)initWithQueue:(id)a3 beaconChange:(id)a4 tokensChange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v41.receiver = self;
  v41.super_class = (Class)WPDSearchPartyAgent;
  v11 = [(WPDSearchPartyAgent *)&v41 init];
  v12 = v11;
  if (v11)
  {
    beaconKey = v11->_beaconKey;
    v11->_beaconKey = 0;

    *(_DWORD *)&v12->_isTestMode = 0;
    spBeaconReserved = v12->_spBeaconReserved;
    v12->_spBeaconReserved = 0;

    *(_WORD *)&v12->_testBeaconState = 0;
    testBeaconReserved = v12->_testBeaconReserved;
    v12->_testBeaconReserved = 0;

    spBeaconKeys = v12->_spBeaconKeys;
    v12->_spBeaconKeys = 0;

    spNearbyTokens = v12->_spNearbyTokens;
    v12->_spNearbyTokens = 0;

    spNearbyTokensUpdated = v12->_spNearbyTokensUpdated;
    v12->_spNearbyTokensUpdated = 0;

    spBeaconKeysUpdated = v12->_spBeaconKeysUpdated;
    v12->_spBeaconKeysUpdated = 0;

    testNearbyTokens = v12->_testNearbyTokens;
    v12->_testNearbyTokens = 0;

    testBeaconKeys = v12->_testBeaconKeys;
    v12->_testBeaconKeys = 0;

    testNearbyTokensUpdated = v12->_testNearbyTokensUpdated;
    v12->_testNearbyTokensUpdated = 0;

    testBeaconKeysUpdated = v12->_testBeaconKeysUpdated;
    v12->_testBeaconKeysUpdated = 0;

    id beaconStateChangedBlock = v12->_beaconStateChangedBlock;
    v12->_id beaconStateChangedBlock = 0;

    id beaconKeysChangedBlock = v12->_beaconKeysChangedBlock;
    v12->_id beaconKeysChangedBlock = 0;

    id beaconStatusChangedBlock = v12->_beaconStatusChangedBlock;
    v12->_id beaconStatusChangedBlock = 0;

    id nearbyTokensChangedBlock = v12->_nearbyTokensChangedBlock;
    v12->_id nearbyTokensChangedBlock = 0;

    v12->_continueAdvOnFail = 0;
    objc_storeWeak((id *)&v12->_queue, v8);
    uint64_t v28 = MEMORY[0x223CB07B0](v9);
    id beaconChange = v12->_beaconChange;
    v12->_id beaconChange = (id)v28;

    uint64_t v30 = MEMORY[0x223CB07B0](v10);
    id tokensChange = v12->_tokensChange;
    v12->_id tokensChange = (id)v30;

    v32 = [[WPDPendingCompletions alloc] initWithName:@"beaconing key"];
    pendingKeyCompletions = v12->_pendingKeyCompletions;
    v12->_pendingKeyCompletions = v32;

    v34 = [[WPDPendingCompletions alloc] initWithName:@"near owner tokens"];
    pendingTokenCompletions = v12->_pendingTokenCompletions;
    v12->_pendingTokenCompletions = v34;

    id location = 0;
    objc_initWeak(&location, v12);
    WeakRetained = objc_loadWeakRetained((id *)&v12->_queue);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __63__WPDSearchPartyAgent_initWithQueue_beaconChange_tokensChange___block_invoke;
    v38[3] = &unk_26469ABC0;
    objc_copyWeak(&v39, &location);
    dispatch_async(WeakRetained, v38);

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_177);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDSearchPartyAgent initWithQueue:beaconChange:tokensChange:]();
    }
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __63__WPDSearchPartyAgent_initWithQueue_beaconChange_tokensChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained initSPObjects];
    id WeakRetained = v2;
  }
}

- (BOOL)beaconState
{
  if ([(WPDSearchPartyAgent *)self isTestMode])
  {
    return [(WPDSearchPartyAgent *)self testBeaconState];
  }
  else
  {
    return [(WPDSearchPartyAgent *)self spBeaconState];
  }
}

- (unsigned)beaconStatus
{
  if ([(WPDSearchPartyAgent *)self isTestMode])
  {
    return [(WPDSearchPartyAgent *)self testBeaconStatus];
  }
  else
  {
    return [(WPDSearchPartyAgent *)self spBeaconStatus];
  }
}

- (NSData)beaconReserved
{
  if ([(WPDSearchPartyAgent *)self isTestMode]) {
    [(WPDSearchPartyAgent *)self testBeaconReserved];
  }
  else {
  v3 = [(WPDSearchPartyAgent *)self spBeaconReserved];
  }
  return (NSData *)v3;
}

- (NSArray)nearbyTokens
{
  if ([(WPDSearchPartyAgent *)self isTestMode]) {
    [(WPDSearchPartyAgent *)self testNearbyTokens];
  }
  else {
  v3 = [(WPDSearchPartyAgent *)self spNearbyTokens];
  }
  return (NSArray *)v3;
}

- (NSDate)nearbyTokensUpdated
{
  if ([(WPDSearchPartyAgent *)self isTestMode]) {
    [(WPDSearchPartyAgent *)self testNearbyTokensUpdated];
  }
  else {
  v3 = [(WPDSearchPartyAgent *)self spNearbyTokensUpdated];
  }
  return (NSDate *)v3;
}

- (NSArray)beaconKeys
{
  if ([(WPDSearchPartyAgent *)self isTestMode]) {
    [(WPDSearchPartyAgent *)self testBeaconKeys];
  }
  else {
  v3 = [(WPDSearchPartyAgent *)self spBeaconKeys];
  }
  return (NSArray *)v3;
}

- (NSDate)beaconKeysUpdated
{
  if ([(WPDSearchPartyAgent *)self isTestMode]) {
    [(WPDSearchPartyAgent *)self testBeaconKeysUpdated];
  }
  else {
  v3 = [(WPDSearchPartyAgent *)self spBeaconKeysUpdated];
  }
  return (NSDate *)v3;
}

- (void)dealloc
{
  [(WPDSearchPartyAgent *)self setBeaconManager:0];
  [(WPDSearchPartyAgent *)self setBeaconStateChangedBlock:0];
  [(WPDSearchPartyAgent *)self setBeaconKeysChangedBlock:0];
  [(WPDSearchPartyAgent *)self setBeaconStatusChangedBlock:0];
  [(WPDSearchPartyAgent *)self setNearbyTokensChangedBlock:0];
  [(WPDSearchPartyAgent *)self setBeaconChange:0];
  [(WPDSearchPartyAgent *)self setTokensChange:0];
  objc_storeWeak((id *)&self->_queue, 0);
  [(WPDSearchPartyAgent *)self setPendingKeyCompletions:0];
  [(WPDSearchPartyAgent *)self setPendingTokenCompletions:0];
  v3.receiver = self;
  v3.super_class = (Class)WPDSearchPartyAgent;
  [(WPDSearchPartyAgent *)&v3 dealloc];
}

- (void)generateStateDump
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_181);
  }
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    BOOL v6 = [(WPDSearchPartyAgent *)self isTestMode];
    v7 = "no";
    if (v6) {
      v7 = "yes";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v53 = v7;
    _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: testMode: %s", buf, 0xCu);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_186);
  }
  id v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    BOOL v10 = [(WPDSearchPartyAgent *)self continueAdvOnFail];
    v11 = "no";
    if (v10) {
      v11 = "yes";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v53 = v11;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: continue adv on fail: %s", buf, 0xCu);
  }
  obj = self;
  objc_sync_enter(obj);
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_189);
  }
  v12 = (id)WiProxLog;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if ([(WPDSearchPartyAgent *)obj beaconState]) {
      v13 = "yes";
    }
    else {
      v13 = "no";
    }
    id v2 = (int *)[(WPDSearchPartyAgent *)obj spBeaconState];
    BOOL v14 = [(WPDSearchPartyAgent *)obj isTestMode];
    v15 = [(WPDSearchPartyAgent *)obj beaconKey];
    int v16 = [(WPDSearchPartyAgent *)obj beaconStatus];
    v17 = [(WPDSearchPartyAgent *)obj beaconReserved];
    *(_DWORD *)buf = 136316418;
    *(void *)v53 = v13;
    *(_WORD *)&v53[8] = 1024;
    *(_DWORD *)&v53[10] = v2;
    *(_WORD *)&v53[14] = 1024;
    *(_DWORD *)&v53[16] = v14;
    __int16 v54 = 2112;
    v55 = v15;
    __int16 v56 = 1024;
    int v57 = v16;
    __int16 v58 = 2112;
    v59 = v17;
    _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: beaconing: %s (SP:%d || Test:%d) key %@ status: 0x%02x reserved: %@", buf, 0x32u);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_192);
  }
  v18 = (id)WiProxLog;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(WPDSearchPartyAgent *)obj beaconKeys];
    if (v19)
    {
      id v2 = [(WPDSearchPartyAgent *)obj beaconKeys];
      int v20 = [v2 count];
    }
    else
    {
      int v20 = 0;
    }
    v21 = [(WPDSearchPartyAgent *)obj beaconKeysUpdated];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v53 = v20;
    *(_WORD *)&v53[4] = 2112;
    *(void *)&v53[6] = v21;
    _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: beaconing keys (%d) updated: %@", buf, 0x12u);

    if (v19) {
  }
    }

  v22 = [(WPDSearchPartyAgent *)obj beaconKeys];

  if (v22)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v23 = [(WPDSearchPartyAgent *)obj beaconKeys];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v48;
      id v2 = &dword_22316D000;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v48 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v47 + 1) + 8 * v26);
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_195);
          }
          uint64_t v28 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v53 = v27;
            _os_log_impl(&dword_22316D000, v28, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump:     %@", buf, 0xCu);
          }
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v24);
    }
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_198);
  }
  v29 = (id)WiProxLog;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [(WPDSearchPartyAgent *)obj nearbyTokens];
    if (v30)
    {
      id v2 = [(WPDSearchPartyAgent *)obj nearbyTokens];
      unint64_t v31 = (unint64_t)[v2 count] >> 1;
    }
    else
    {
      LODWORD(v31) = 0;
    }
    v32 = [(WPDSearchPartyAgent *)obj nearbyTokensUpdated];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v53 = v31;
    *(_WORD *)&v53[4] = 2112;
    *(void *)&v53[6] = v32;
    _os_log_impl(&dword_22316D000, v29, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: near owner tokens (%d) updated: %@", buf, 0x12u);

    if (v30) {
  }
    }

  v33 = [(WPDSearchPartyAgent *)obj nearbyTokens];

  if (v33)
  {
    for (uint64_t i = 0; ; i += 2)
    {
      v35 = [(WPDSearchPartyAgent *)obj nearbyTokens];
      BOOL v36 = [v35 count] > (unint64_t)(i + 1);

      if (!v36) {
        break;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_201);
      }
      v37 = (id)WiProxLog;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = [(WPDSearchPartyAgent *)obj nearbyTokens];
        id v39 = [v38 objectAtIndexedSubscript:i + 1];
        v40 = [(WPDSearchPartyAgent *)obj nearbyTokens];
        objc_super v41 = [v40 objectAtIndexedSubscript:i];
        *(_DWORD *)buf = 138412546;
        *(void *)v53 = v39;
        *(_WORD *)&v53[8] = 2112;
        *(void *)&v53[10] = v41;
        _os_log_impl(&dword_22316D000, v37, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump:     token: %@ address: %@", buf, 0x16u);
      }
    }
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_204);
  }
  v42 = (id)WiProxLog;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = [(WPDSearchPartyAgent *)obj pendingTokenCompletions];
    *(_DWORD *)buf = 138412290;
    *(void *)v53 = v43;
    _os_log_impl(&dword_22316D000, v42, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_207);
  }
  v44 = (id)WiProxLog;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = [(WPDSearchPartyAgent *)obj pendingKeyCompletions];
    *(_DWORD *)buf = 138412290;
    *(void *)v53 = v45;
    _os_log_impl(&dword_22316D000, v44, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);
  }
  objc_sync_exit(obj);
}

- (void)initSPObjects
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPDSearchPartyAgent failed to instantiate SPBeaconManager", v2, v3, v4, v5, v6);
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_209);
    }
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "NO";
      if (a2) {
        id v8 = "YES";
      }
      int v11 = 136315138;
      v12 = v8;
      _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconManager state changed to %s", (uint8_t *)&v11, 0xCu);
    }
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    [v9 setSpBeaconState:a2];
    BOOL v10 = [MEMORY[0x263EFF910] date];
    [v9 setSpBeaconKeysUpdated:v10];

    objc_sync_exit(v9);
    if (([v9 isTestMode] & 1) == 0) {
      objc_msgSend(v9, "rollKeys_async_completion:", v5);
    }
  }
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_217);
    }
    id v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      int v12 = 134217984;
      uint64_t v13 = [v5 count];
      _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconManager keys updated: %lu keys", (uint8_t *)&v12, 0xCu);
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_220);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __36__WPDSearchPartyAgent_initSPObjects__block_invoke_214_cold_1();
    }
    id v10 = WeakRetained;
    objc_sync_enter(v10);
    [v10 setSpBeaconKeys:v5];
    int v11 = [MEMORY[0x263EFF910] date];
    [v10 setSpBeaconKeysUpdated:v11];

    objc_sync_exit(v10);
    if (([v10 isTestMode] & 1) == 0) {
      objc_msgSend(v10, "rollKeys_async_completion:", v6);
    }
  }
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_222(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_225);
    }
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = a2;
      _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconManager status changed to 0x%02x", (uint8_t *)v10, 8u);
    }
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    [v8 setSpBeaconStatus:a2];
    id v9 = [MEMORY[0x263EFF910] date];
    [v8 setSpBeaconKeysUpdated:v9];

    objc_sync_exit(v8);
    if (([v8 isTestMode] & 1) == 0) {
      objc_msgSend(v8, "rollKeys_async_completion:", v5);
    }
  }
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_230);
    }
    id v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = [v5 count];
      _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconManager nearbyTokensChangeBlock with %lu tokens", buf, 0xCu);
    }
    id v10 = (void *)MEMORY[0x223CB05A0]();
    if (v5)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", 2 * objc_msgSend(v5, "count"));
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __36__WPDSearchPartyAgent_initSPObjects__block_invoke_231;
      v17[3] = &unk_26469AC60;
      id v12 = v11;
      id v18 = v12;
      [v5 enumerateObjectsUsingBlock:v17];
      id v13 = WeakRetained;
      objc_sync_enter(v13);
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v12];
      objc_sync_exit(v13);
    }
    else
    {
      uint64_t v14 = 0;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_237);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __36__WPDSearchPartyAgent_initSPObjects__block_invoke_227_cold_1();
    }
    id v15 = WeakRetained;
    objc_sync_enter(v15);
    [v15 setSpNearbyTokens:v14];
    int v16 = [MEMORY[0x263EFF910] date];
    [v15 setSpNearbyTokensUpdated:v16];

    objc_sync_exit(v15);
    if (([v15 isTestMode] & 1) == 0) {
      objc_msgSend(v15, "rollTokens_async_completion:", v6);
    }
  }
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_231(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263EFF8F8];
  id v6 = a2;
  v7 = [v6 address];
  id v8 = [v5 dataWithData:v7];
  [*(id *)(a1 + 32) setObject:v8 atIndexedSubscript:2 * a3];

  id v9 = (void *)MEMORY[0x263EFF8F8];
  id v11 = [v6 nearbyToken];

  id v10 = [v9 dataWithData:v11];
  [*(id *)(a1 + 32) setObject:v10 atIndexedSubscript:(2 * a3) | 1];
}

- (void)completedKeyRequestID:(unint64_t)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(WPDSearchPartyAgent *)self pendingKeyCompletions];
  [v6 completeID:a3 success:v4];
}

- (void)completedTokenRequestID:(unint64_t)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(WPDSearchPartyAgent *)self pendingTokenCompletions];
  [v6 completeID:a3 success:v4];
}

- (void)rollKeys_async_completion:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPDSearchPartyAgent *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WPDSearchPartyAgent_rollKeys_async_completion___block_invoke;
  block[3] = &unk_26469AC88;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__WPDSearchPartyAgent_rollKeys_async_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained pendingKeyCompletions];
    id v4 = (void *)MEMORY[0x223CB07B0](*(void *)(a1 + 32));
    objc_msgSend(v5, "rollKeysWithRequestID:", objc_msgSend(v3, "addCompletion:", v4));

    id WeakRetained = v5;
  }
}

- (void)rollKeys_async
{
}

- (void)rollKeysWithRequestID:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ([(WPDSearchPartyAgent *)self beaconState])
  {
    *(void *)uint64_t v26 = 0;
    uint64_t v27 = v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    uint64_t v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    id v5 = objc_opt_new();
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_246);
    }
    id v6 = (id)WiProxLog;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [(WPDSearchPartyAgent *)self beaconKeys];
      uint64_t v19 = [v18 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v19;
      _os_log_debug_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEBUG, "WPDSearchPartyAgent has %lu beacon keys", buf, 0xCu);
    }
    v7 = [(WPDSearchPartyAgent *)self beaconKeys];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_247;
    v23 = &unk_26469ACB0;
    id v8 = v5;
    id v24 = v8;
    uint64_t v25 = v26;
    [v7 enumerateObjectsUsingBlock:&v20];

    if (*((void *)v27 + 5))
    {
      id v9 = [(WPDSearchPartyAgent *)self beaconKey];
      if (!v9
        || (id v10 = (void *)*((void *)v27 + 5),
            [(WPDSearchPartyAgent *)self beaconKey],
            id v11 = objc_claimAutoreleasedReturnValue(),
            LOBYTE(v10) = [v10 isEqualToData:v11],
            v11,
            v9,
            (v10 & 1) == 0))
      {
        id v12 = [MEMORY[0x263EFF8F8] dataWithData:*((void *)v27 + 5)];
        [(WPDSearchPartyAgent *)self setBeaconKey:v12];

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_256);
        }
        id v13 = (id)WiProxLog;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [(WPDSearchPartyAgent *)self beaconKey];
          *(_DWORD *)buf = 138543362;
          uint64_t v33 = (uint64_t)v14;
          _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beacon key updated to %{public}@", buf, 0xCu);
        }
      }
    }
    else if ([(WPDSearchPartyAgent *)self continueAdvOnFail])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_259);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDSearchPartyAgent rollKeysWithRequestID:]();
      }
    }
    else
    {
      [(WPDSearchPartyAgent *)self setBeaconKey:0];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_262);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDSearchPartyAgent rollKeysWithRequestID:]();
      }
    }

    _Block_object_dispose(v26, 8);
  }
  else
  {
    [(WPDSearchPartyAgent *)self setBeaconKey:0];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_265);
    }
    id v15 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconing was turned off", v26, 2u);
    }
  }
  int v16 = [(WPDSearchPartyAgent *)self beaconChange];

  if (v16)
  {
    v17 = [(WPDSearchPartyAgent *)self beaconChange];
    v17[2](v17, a3);
  }
}

void __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_247(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_249);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_247_cold_2();
  }
  v7 = [v6 dateInterval];
  int v8 = [v7 containsDate:*(void *)(a1 + 32)];

  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_252);
    }
    id v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_247_cold_1(v9, v6);
    }
    uint64_t v10 = [v6 key];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (void)rollTokens_async_completion:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPDSearchPartyAgent *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WPDSearchPartyAgent_rollTokens_async_completion___block_invoke;
  block[3] = &unk_26469AC88;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__WPDSearchPartyAgent_rollTokens_async_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained pendingTokenCompletions];
    id v4 = (void *)MEMORY[0x223CB07B0](*(void *)(a1 + 32));
    objc_msgSend(v5, "rollTokensWithRequestID:", objc_msgSend(v3, "addCompletion:", v4));

    id WeakRetained = v5;
  }
}

- (void)rollTokens_async
{
}

- (void)rollTokensWithRequestID:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_267);
  }
  id v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = [(WPDSearchPartyAgent *)self nearbyTokens];
    int v11 = 134217984;
    uint64_t v12 = [v7 count];
    _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent has %lu nearby tokens", (uint8_t *)&v11, 0xCu);
  }
  id v8 = [MEMORY[0x263EFF910] date];
  [(WPDSearchPartyAgent *)self setSpNearbyTokensUpdated:v8];

  id v9 = [(WPDSearchPartyAgent *)self tokensChange];

  if (v9)
  {
    uint64_t v10 = [(WPDSearchPartyAgent *)self tokensChange];
    v10[2](v10, a3);
  }
}

- (void)startTest
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "WPDSearchPartyAgent test mode started", v2, v3, v4, v5, v6);
}

- (void)stopTest
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "WPDSearchPartyAgent test mode stopped", v2, v3, v4, v5, v6);
}

- (void)updateTestNearOwnerTokens:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x223CB05A0]();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_274);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDSearchPartyAgent updateTestNearOwnerTokens:]();
  }
  uint8_t v6 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];
  [(WPDSearchPartyAgent *)self setTestNearbyTokens:v6];

  v7 = [MEMORY[0x263EFF910] date];
  [(WPDSearchPartyAgent *)self setTestNearbyTokensUpdated:v7];

  [(WPDSearchPartyAgent *)self rollTokens_async];
}

- (void)updateTestBeaconKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x223CB05A0]();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_276);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDSearchPartyAgent updateTestBeaconKeys:]();
  }
  uint8_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __44__WPDSearchPartyAgent_updateTestBeaconKeys___block_invoke_277;
  v10[3] = &unk_26469ACD8;
  id v11 = v6;
  id v7 = v6;
  [v4 enumerateObjectsUsingBlock:v10];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
  [(WPDSearchPartyAgent *)self setTestBeaconKeys:v8];

  id v9 = [MEMORY[0x263EFF910] date];
  [(WPDSearchPartyAgent *)self setTestBeaconKeysUpdated:v9];

  [(WPDSearchPartyAgent *)self rollKeys_async];
}

void __44__WPDSearchPartyAgent_updateTestBeaconKeys___block_invoke_277(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[WPDSearchPartyAgent spBeaconKeyFromTestKey:a2];
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
}

- (void)updateTestBeaconStatus:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223CB05A0]();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_281);
  }
  uint8_t v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDSearchPartyAgent updateTestBeaconStatus:](v6, v4);
  }
  -[WPDSearchPartyAgent setTestBeaconStatus:](self, "setTestBeaconStatus:", [v4 unsignedCharValue]);
  id v7 = [MEMORY[0x263EFF910] date];
  [(WPDSearchPartyAgent *)self setTestBeaconKeysUpdated:v7];

  [(WPDSearchPartyAgent *)self rollKeys_async];
}

- (void)updateTestBeaconExtended:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223CB05A0]();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_283);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDSearchPartyAgent updateTestBeaconExtended:]();
  }
  [(WPDSearchPartyAgent *)self setTestBeaconReserved:v4];
  uint8_t v6 = [MEMORY[0x263EFF910] date];
  [(WPDSearchPartyAgent *)self setTestBeaconKeysUpdated:v6];

  [(WPDSearchPartyAgent *)self rollKeys_async];
}

- (void)updateTestBeaconState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223CB05A0]();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_285);
  }
  uint8_t v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDSearchPartyAgent updateTestBeaconState:](v6, v4);
  }
  -[WPDSearchPartyAgent setTestBeaconState:](self, "setTestBeaconState:", [v4 BOOLValue]);
  id v7 = [MEMORY[0x263EFF910] date];
  [(WPDSearchPartyAgent *)self setTestBeaconKeysUpdated:v7];

  [(WPDSearchPartyAgent *)self rollKeys_async];
}

+ (id)spBeaconKeyFromTestKey:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x223CB05A0]();
  id v5 = [v3 objectForKeyedSubscript:@"kStartTime"];
  uint8_t v6 = [v3 objectForKeyedSubscript:@"kEndTime"];
  uint64_t v7 = [v3 objectForKeyedSubscript:@"kBeaconKey"];
  id v8 = (void *)v7;
  if (v5 && v6 && v7)
  {
    [v5 doubleValue];
    double v10 = v9;
    [v6 doubleValue];
    double v12 = v11;
    uint64_t v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v10];
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v13 duration:v12 - v10];
    id v15 = (void *)[objc_alloc(MEMORY[0x263F66140]) initWithDateInterval:v14 key:v8];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_303);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      +[WPDSearchPartyAgent spBeaconKeyFromTestKey:]();
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_298);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      +[WPDSearchPartyAgent spBeaconKeyFromTestKey:]();
    }
    id v15 = 0;
  }

  return v15;
}

- (BOOL)isTestMode
{
  return self->_isTestMode;
}

- (void)setIsTestMode:(BOOL)a3
{
  self->_isTestMode = a3;
}

- (NSData)beaconKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBeaconKey:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (BOOL)disableScans
{
  return self->_disableScans;
}

- (void)setDisableScans:(BOOL)a3
{
  self->_disableScans = a3;
}

- (BOOL)spBeaconState
{
  return self->_spBeaconState;
}

- (void)setSpBeaconState:(BOOL)a3
{
  self->_spBeaconState = a3;
}

- (unsigned)spBeaconStatus
{
  return self->_spBeaconStatus;
}

- (void)setSpBeaconStatus:(unsigned __int8)a3
{
  self->_spBeaconStatus = a3;
}

- (NSData)spBeaconReserved
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)testBeaconState
{
  return self->_testBeaconState;
}

- (void)setTestBeaconState:(BOOL)a3
{
  self->_testBeaconState = a3;
}

- (unsigned)testBeaconStatus
{
  return self->_testBeaconStatus;
}

- (void)setTestBeaconStatus:(unsigned __int8)a3
{
  self->_testBeaconStatus = a3;
}

- (NSData)testBeaconReserved
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTestBeaconReserved:(id)a3
{
}

- (SPBeaconManager)beaconManager
{
  return (SPBeaconManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBeaconManager:(id)a3
{
}

- (id)beaconChange
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setBeaconChange:(id)a3
{
}

- (NSArray)spBeaconKeys
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSpBeaconKeys:(id)a3
{
}

- (NSDate)spBeaconKeysUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSpBeaconKeysUpdated:(id)a3
{
}

- (id)beaconStateChangedBlock
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setBeaconStateChangedBlock:(id)a3
{
}

- (id)beaconKeysChangedBlock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setBeaconKeysChangedBlock:(id)a3
{
}

- (id)beaconStatusChangedBlock
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setBeaconStatusChangedBlock:(id)a3
{
}

- (id)nearbyTokensChangedBlock
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setNearbyTokensChangedBlock:(id)a3
{
}

- (id)tokensChange
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setTokensChange:(id)a3
{
}

- (NSArray)spNearbyTokens
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSpNearbyTokens:(id)a3
{
}

- (NSDate)spNearbyTokensUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSpNearbyTokensUpdated:(id)a3
{
}

- (NSArray)testNearbyTokens
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTestNearbyTokens:(id)a3
{
}

- (NSArray)testBeaconKeys
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTestBeaconKeys:(id)a3
{
}

- (NSDate)testNearbyTokensUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTestNearbyTokensUpdated:(id)a3
{
}

- (NSDate)testBeaconKeysUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTestBeaconKeysUpdated:(id)a3
{
}

- (BOOL)continueAdvOnFail
{
  return self->_continueAdvOnFail;
}

- (void)setContinueAdvOnFail:(BOOL)a3
{
  self->_continueAdvOnFail = a3;
}

- (WPDPendingCompletions)pendingKeyCompletions
{
  return (WPDPendingCompletions *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPendingKeyCompletions:(id)a3
{
}

- (WPDPendingCompletions)pendingTokenCompletions
{
  return (WPDPendingCompletions *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPendingTokenCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTokenCompletions, 0);
  objc_storeStrong((id *)&self->_pendingKeyCompletions, 0);
  objc_storeStrong((id *)&self->_testBeaconKeysUpdated, 0);
  objc_storeStrong((id *)&self->_testNearbyTokensUpdated, 0);
  objc_storeStrong((id *)&self->_testBeaconKeys, 0);
  objc_storeStrong((id *)&self->_testNearbyTokens, 0);
  objc_storeStrong((id *)&self->_spNearbyTokensUpdated, 0);
  objc_storeStrong((id *)&self->_spNearbyTokens, 0);
  objc_storeStrong(&self->_tokensChange, 0);
  objc_storeStrong(&self->_nearbyTokensChangedBlock, 0);
  objc_storeStrong(&self->_beaconStatusChangedBlock, 0);
  objc_storeStrong(&self->_beaconKeysChangedBlock, 0);
  objc_storeStrong(&self->_beaconStateChangedBlock, 0);
  objc_storeStrong((id *)&self->_spBeaconKeysUpdated, 0);
  objc_storeStrong((id *)&self->_spBeaconKeys, 0);
  objc_storeStrong(&self->_beaconChange, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_testBeaconReserved, 0);
  objc_storeStrong((id *)&self->_spBeaconReserved, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_storeStrong((id *)&self->_beaconKey, 0);
}

- (void)initWithQueue:beaconChange:tokensChange:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "WPDSearchPartyAgent initialized", v2, v3, v4, v5, v6);
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_214_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "WPDSearchPartyAgent beaconManager keys updated: %@", v2, v3, v4, v5, v6);
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_227_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "WPDSearchPartyAgent beaconManager updated nearby tokens:%@", v2, v3, v4, v5, v6);
}

- (void)rollKeysWithRequestID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPDSearchPartyAgent failed to roll new key. Continue beaconing using old key", v2, v3, v4, v5, v6);
}

- (void)rollKeysWithRequestID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPDSearchPartyAgent ran out of beacon keys. Beaconing is disabled", v2, v3, v4, v5, v6);
}

void __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_247_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 dateInterval];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_22316D000, v5, v6, "WPDSearchPartyAgent current beacon key for (%@)", v7, v8, v9, v10, v11);
}

void __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_247_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "WPDSearchPartyAgent processing beacon key %@", v2, v3, v4, v5, v6);
}

- (void)updateTestNearOwnerTokens:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "WPDSearchPartyAgent test nearby tokens updated", v2, v3, v4, v5, v6);
}

- (void)updateTestBeaconKeys:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "WPDSearchPartyAgent test beacon keys updated", v2, v3, v4, v5, v6);
}

- (void)updateTestBeaconStatus:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 unsignedCharValue];
  _os_log_debug_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEBUG, "WPDSearchPartyAgent test beacon status updated 0x%02x", (uint8_t *)v4, 8u);
}

- (void)updateTestBeaconExtended:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "WPDSearchPartyAgent test beacon extended updated", v2, v3, v4, v5, v6);
}

- (void)updateTestBeaconState:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 BOOLValue];
  OUTLINED_FUNCTION_5(&dword_22316D000, v4, v5, "WPDSearchPartyAgent test beacon state updated %s", v6, v7, v8, v9, 2u);
}

+ (void)spBeaconKeyFromTestKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "WPDSearchPartyAgent - bad test beacon key %@", v2, v3, v4, v5, v6);
}

+ (void)spBeaconKeyFromTestKey:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "WPDSearchPartyAgent - new test beacon key %@", v2, v3, v4, v5, v6);
}

@end