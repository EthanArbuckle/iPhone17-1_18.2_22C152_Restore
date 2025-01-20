@interface WPDObjectDiscoveryManager
- (BOOL)advAllowlisted;
- (BOOL)advertOptionsChanged:(id)a3;
- (BOOL)advertising;
- (BOOL)changedScanOptions:(id)a3 Clients:(id)a4;
- (BOOL)scanAllowlisted;
- (BOOL)scanning;
- (BOOL)scanningDisabled;
- (BOOL)updateAdvertisingOptionsWithError:(id *)a3;
- (BOOL)updateScanRules;
- (CBCentralManager)centralManager;
- (CBPeripheralManager)peripheralManager;
- (NSArray)matchActionRules;
- (NSArray)nearbyTokensRequest;
- (NSDictionary)advertOptions;
- (NSDictionary)scanOptions;
- (NSMutableDictionary)scanRequests;
- (NSMutableSet)currentScanners;
- (NSUUID)advertClientUUID;
- (OS_dispatch_queue)serverQueue;
- (OS_dispatch_source)scanStopTimer;
- (WPAdvertisingRequest)advertRequest;
- (WPDObjectDiscoveryManager)initWithServer:(id)a3;
- (id)addAdvertisingRequest:(id)a3 forClient:(id)a4;
- (id)addScanRequest:(id)a3 forClient:(id)a4;
- (id)generateStateDumpStrings;
- (id)getScanRequestsForClient:(id)a3;
- (id)removeAdvertisingRequest:(id)a3 forClient:(id)a4;
- (id)rulesFromTokens:(id)a3;
- (id)updateAdvertiser;
- (int)advBuffersToRead;
- (unint64_t)advertHash;
- (void)activateADVBuffer;
- (void)addScanStopTimer;
- (void)cancelScanStopTimer;
- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4;
- (void)cleanup;
- (void)deactivateADVBuffer;
- (void)forceReadADVBuffer:(id)a3;
- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)removeAdvertisingRequestsForClient:(id)a3;
- (void)removeScanRequestsForClient:(id)a3;
- (void)resetAdvertiser;
- (void)setAdvBuffersToRead:(int)a3;
- (void)setAdvertClientUUID:(id)a3;
- (void)setAdvertHash:(unint64_t)a3;
- (void)setAdvertOptions:(id)a3;
- (void)setAdvertRequest:(id)a3;
- (void)setAdvertising:(BOOL)a3;
- (void)setCentralManager:(id)a3;
- (void)setCurrentScanners:(id)a3;
- (void)setMatchActionRules:(id)a3;
- (void)setNearbyTokensRequest:(id)a3;
- (void)setPeripheralManager:(id)a3;
- (void)setScanOptions:(id)a3;
- (void)setScanRequests:(id)a3;
- (void)setScanStopTimer:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setScanningDisabled:(BOOL)a3;
- (void)startAdvertiser;
- (void)stopAdvertiser;
- (void)update;
- (void)updateAdvertiser;
- (void)updateClientsWithReports:(id)a3;
- (void)updateNearbyTokens:(id)a3;
- (void)updateReports:(id)a3 Peripheral:(id)a4 AdvertisementData:(id)a5 RSSI:(id)a6;
- (void)updateReports:(id)a3 fromReport:(id)a4;
- (void)updateScanRules;
- (void)updateScanner;
@end

@implementation WPDObjectDiscoveryManager

- (WPDObjectDiscoveryManager)initWithServer:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WPDObjectDiscoveryManager;
  v5 = [(WPDManager *)&v32 initWithServer:v4 Name:@"ObjectDiscovery"];
  if (v5)
  {
    v6 = [v4 serverQueue];
    objc_storeWeak((id *)&v5->_serverQueue, v6);

    v5->_advertising = 0;
    advertRequest = v5->_advertRequest;
    v5->_advertRequest = 0;

    objc_storeWeak((id *)&v5->_advertClientUUID, 0);
    advertOptions = v5->_advertOptions;
    v5->_advertOptions = 0;

    v5->_advAllowlisted = [(WPDManager *)v5 isAdvertisingAllowlistedForType:18];
    v5->_scanAllowlisted = [(WPDManager *)v5 isScanAllowlistedForType:18];
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    scanRequests = v5->_scanRequests;
    v5->_scanRequests = (NSMutableDictionary *)v9;

    v5->_scanning = 0;
    scanOptions = v5->_scanOptions;
    v5->_scanOptions = 0;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    currentScanners = v5->_currentScanners;
    v5->_currentScanners = (NSMutableSet *)v12;

    scanStopTimer = v5->_scanStopTimer;
    v5->_scanStopTimer = 0;

    v5->_advBuffersToRead = 0;
    nearbyTokensRequest = v5->_nearbyTokensRequest;
    v5->_nearbyTokensRequest = 0;

    matchActionRules = v5->_matchActionRules;
    v5->_matchActionRules = 0;

    uint64_t v34 = *MEMORY[0x263EFEE80];
    v35[0] = MEMORY[0x263EFFA88];
    v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v18 = objc_alloc(MEMORY[0x263EFEF60]);
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_serverQueue);
    uint64_t v20 = [v18 initWithDelegate:v5 queue:WeakRetained options:v17];
    peripheralManager = v5->_peripheralManager;
    v5->_peripheralManager = (CBPeripheralManager *)v20;

    id v22 = objc_alloc(MEMORY[0x263EFEF00]);
    id v23 = objc_loadWeakRetained((id *)&v5->_serverQueue);
    uint64_t v24 = [v22 initWithDelegate:v5 queue:v23 options:v17];
    centralManager = v5->_centralManager;
    v5->_centralManager = (CBCentralManager *)v24;

    v26 = (void *)MEMORY[0x263EFFA08];
    v33[0] = v5->_peripheralManager;
    v33[1] = v5->_centralManager;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
    v28 = [v26 setWithArray:v27];
    [(WPDManager *)v5 setCbManagers:v28];

    v29 = [v4 wpdState];
    [v29 registerManager:v5->_centralManager];

    v30 = [v4 wpdState];
    [v30 registerManager:v5->_peripheralManager];
  }
  return v5;
}

- (id)generateStateDumpStrings
{
  v2 = self;
  uint64_t v74 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  v70.receiver = self;
  v70.super_class = (Class)WPDObjectDiscoveryManager;
  id v4 = [(WPDManager *)&v70 generateStateDumpStrings];
  v5 = [v3 arrayWithArray:v4];

  v6 = NSString;
  if ([(WPDObjectDiscoveryManager *)v2 advertising]) {
    v7 = "yes";
  }
  else {
    v7 = "no";
  }
  v8 = [(WPDObjectDiscoveryManager *)v2 advertClientUUID];
  uint64_t v9 = [(WPDObjectDiscoveryManager *)v2 advertRequest];
  v10 = [v6 stringWithFormat:@"advertising: %s client:%@ request:%@\n", v7, v8, v9];
  [v5 addObject:v10];

  if ([(WPDManager *)v2 isInternalBuild])
  {
    if (v2->_advAllowlisted) {
      v11 = "yes";
    }
    else {
      v11 = "no";
    }
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"advertising allowlisted: %s\n", v11);
    [v5 addObject:v12];
  }
  v13 = NSString;
  if ([(WPDObjectDiscoveryManager *)v2 scanning]) {
    v14 = "yes";
  }
  else {
    v14 = "no";
  }
  v15 = [(WPDObjectDiscoveryManager *)v2 scanOptions];
  v16 = [v13 stringWithFormat:@"scanning: %s options: %@\n", v14, v15];
  [v5 addObject:v16];

  if ([(WPDManager *)v2 isInternalBuild])
  {
    if (v2->_scanAllowlisted) {
      v17 = "yes";
    }
    else {
      v17 = "no";
    }
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"scan allowlisted: %s\n", v17);
    [v5 addObject:v18];
  }
  v56 = v5;
  v57 = [MEMORY[0x263EFF980] array];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v19 = [(WPDObjectDiscoveryManager *)v2 scanRequests];
  uint64_t v20 = [(__CFString *)v19 allKeys];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v67;
    v19 = @"    %@: %@\n";
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v67 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        v26 = NSString;
        v27 = [(WPDObjectDiscoveryManager *)v2 scanRequests];
        [v27 objectForKeyedSubscript:v25];
        v29 = v28 = v2;
        v30 = [v26 stringWithFormat:@"    %@: %@\n", v25, v29];
        [v57 addObject:v30];

        v2 = v28;
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v22);
  }

  v31 = objc_msgSend(NSString, "stringWithFormat:", @"scan requests: %d\n", objc_msgSend(v57, "count"));
  [v56 addObject:v31];

  [v56 addObjectsFromArray:v57];
  objc_super v32 = NSString;
  uint64_t v33 = [(WPDObjectDiscoveryManager *)v2 nearbyTokensRequest];
  uint64_t v34 = (void *)v33;
  if (v33)
  {
    v19 = [(WPDObjectDiscoveryManager *)v2 nearbyTokensRequest];
    uint64_t v33 = [(__CFString *)v19 count];
  }
  v35 = objc_msgSend(v32, "stringWithFormat:", @"near owner tokens (%d):\n", v33);
  [v56 addObject:v35];

  if (v34) {
  v36 = [(WPDObjectDiscoveryManager *)v2 nearbyTokensRequest];
  }

  if (v36)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v37 = [(WPDObjectDiscoveryManager *)v2 nearbyTokensRequest];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v63;
      v19 = @"    %@\n";
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v63 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [NSString stringWithFormat:@"    %@\n", *(void *)(*((void *)&v62 + 1) + 8 * j)];
          [v56 addObject:v42];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v62 objects:v72 count:16];
      }
      while (v39);
    }
  }
  v43 = NSString;
  uint64_t v44 = [(WPDObjectDiscoveryManager *)v2 matchActionRules];
  v45 = (void *)v44;
  if (v44)
  {
    v19 = [(WPDObjectDiscoveryManager *)v2 matchActionRules];
    uint64_t v44 = [(__CFString *)v19 count];
  }
  v46 = objc_msgSend(v43, "stringWithFormat:", @"match action rules (%d):\n", v44);
  [v56 addObject:v46];

  if (v45) {
  v47 = [(WPDObjectDiscoveryManager *)v2 matchActionRules];
  }

  if (v47)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v48 = [(WPDObjectDiscoveryManager *)v2 matchActionRules];
    uint64_t v49 = [v48 countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v59;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v59 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = [NSString stringWithFormat:@"    %@\n", *(void *)(*((void *)&v58 + 1) + 8 * k)];
          [v56 addObject:v53];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v58 objects:v71 count:16];
      }
      while (v50);
    }
  }
  v54 = [MEMORY[0x263EFF8C0] arrayWithArray:v56];

  return v54;
}

- (void)cleanup
{
  v3 = [(WPDObjectDiscoveryManager *)self advertClientUUID];
  [(WPDObjectDiscoveryManager *)self removeAdvertisingRequestsForClient:v3];

  id v4 = [(WPDObjectDiscoveryManager *)self peripheralManager];
  [v4 setDelegate:0];

  [(WPDObjectDiscoveryManager *)self setPeripheralManager:0];
  v5 = [(WPDObjectDiscoveryManager *)self scanRequests];
  [v5 removeAllObjects];

  [(WPDObjectDiscoveryManager *)self updateScanner];
  [(WPDObjectDiscoveryManager *)self updateNearbyTokens:0];
  v6 = [(WPDObjectDiscoveryManager *)self centralManager];
  [v6 setDelegate:0];

  [(WPDObjectDiscoveryManager *)self setCentralManager:0];
  v7.receiver = self;
  v7.super_class = (Class)WPDObjectDiscoveryManager;
  [(WPDManager *)&v7 cleanup];
}

- (void)update
{
  switch([(WPDManager *)self state])
  {
    case 0:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_168);
      }
      v3 = WiProxLog;
      if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      __int16 v9 = 0;
      id v4 = "ObjectDiscovery manager is unknown";
      v5 = (uint8_t *)&v9;
      break;
    case 1:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_171);
      }
      v3 = WiProxLog;
      if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      __int16 v8 = 0;
      id v4 = "ObjectDiscovery manager is resetting";
      v5 = (uint8_t *)&v8;
      break;
    case 2:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_9);
      }
      v3 = WiProxLog;
      if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      id v4 = "ObjectDiscovery manager is powered off, unauthorized or not supported";
      v5 = buf;
      break;
    case 3:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_174);
      }
      v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v7 = 0;
        _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery manager is powered on", v7, 2u);
      }
      return;
    default:
      return;
  }
  _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
LABEL_15:
  [(WPDObjectDiscoveryManager *)self resetAdvertiser];
}

- (BOOL)advertOptionsChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_176_0);
  }
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    -[WPDObjectDiscoveryManager advertOptionsChanged:](v5, self);
    if (!v4) {
      goto LABEL_9;
    }
  }
  else if (!v4)
  {
    goto LABEL_9;
  }
  v6 = [(WPDObjectDiscoveryManager *)self advertOptions];

  if (v6)
  {
    objc_super v7 = [(WPDObjectDiscoveryManager *)self advertOptions];
    char v8 = [v4 isEqual:v7];

    if (v8)
    {
      BOOL v9 = 0;
      goto LABEL_14;
    }
  }
LABEL_9:
  [(WPDObjectDiscoveryManager *)self setAdvertOptions:v4];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_179);
  }
  v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    uint64_t v12 = [(WPDObjectDiscoveryManager *)self advertOptions];
    int v16 = 138477827;
    v17 = v12;
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery updated advertising options: %{private}@", (uint8_t *)&v16, 0xCu);
  }
  BOOL v9 = 1;
LABEL_14:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_182);
  }
  v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "NO";
    if (v9) {
      v14 = "YES";
    }
    int v16 = 136315138;
    v17 = v14;
    _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery advertising data has changed: %s", (uint8_t *)&v16, 0xCu);
  }

  return v9;
}

- (BOOL)updateAdvertisingOptionsWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_186_1);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryManager updateAdvertisingOptionsWithError:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = [(WPDObjectDiscoveryManager *)self advertRequest];

  if (v13)
  {
    v14 = [(WPDObjectDiscoveryManager *)self advertRequest];
    v15 = [v14 advertisingOptions];
    int v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263EFEC58]];

    if ([v14 clientType] == 18)
    {
      if ([v16 length] == 6) {
        goto LABEL_19;
      }
      [NSString stringWithFormat:@"Failed to update advertising because the address is not 6 bytes (%@)", v16];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Failed to update advertising because wrong client type %d", objc_msgSend(v14, "clientType"));
    v19 = };
    uint64_t v20 = v19;
    if (v19)
    {
      if (a3) {
        *a3 = v19;
      }
      BOOL v18 = [(WPDObjectDiscoveryManager *)self advertOptionsChanged:0];
LABEL_24:

      return v18;
    }
LABEL_19:
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_198_1);
    }
    uint64_t v21 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = v21;
      uint64_t v23 = [v14 clientType];
      uint64_t v24 = [v14 advertisingData];
      *(_DWORD *)buf = 134284291;
      uint64_t v32 = v23;
      __int16 v33 = 2113;
      uint64_t v34 = v24;
      __int16 v35 = 2049;
      uint64_t v36 = [v14 advertisingRate];
      __int16 v37 = 2113;
      uint64_t v38 = v16;
      _os_log_impl(&dword_22316D000, v22, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery adding data of type: %{private}ld, advData: %{private}@ advInterval: %{private}ld address: %{private}@", buf, 0x2Au);
    }
    uint64_t v20 = objc_opt_new();
    [v20 addAdvertisingRequest:v14];
    uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v26 = MEMORY[0x263EFFA88];
    [v25 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFECA8]];
    [v25 setObject:v16 forKeyedSubscript:*MEMORY[0x263EFEC60]];
    [v25 setObject:v26 forKeyedSubscript:*MEMORY[0x263EFEE70]];
    v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "advertRate"));
    [v25 setObject:v27 forKeyedSubscript:@"kCBAdvOptionUseFGInterval"];

    v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "advertRate"));
    [v25 setObject:v28 forKeyedSubscript:*MEMORY[0x263EFEE90]];

    v29 = [v20 getData];
    [v25 setObject:v29 forKeyedSubscript:*MEMORY[0x263EFEC78]];

    BOOL v18 = [(WPDObjectDiscoveryManager *)self advertOptionsChanged:v25];
    goto LABEL_24;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_189_2);
  }
  v17 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "Nothing left to advertise - Stopping Advertising", buf, 2u);
  }
  return [(WPDObjectDiscoveryManager *)self advertOptionsChanged:0];
}

- (void)resetAdvertiser
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_202);
  }
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery will reset (stop) advertising", v4, 2u);
  }
  [(WPDObjectDiscoveryManager *)self setAdvertOptions:0];
  [(WPDObjectDiscoveryManager *)self setAdvertising:0];
}

- (void)stopAdvertiser
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_204_0);
  }
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery will stop advertising", v5, 2u);
  }
  id v4 = [(WPDObjectDiscoveryManager *)self peripheralManager];
  [v4 stopAdvertising];
}

- (void)startAdvertiser
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_206);
  }
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5 = [(WPDObjectDiscoveryManager *)self advertOptions];
    int v8 = 138477827;
    uint64_t v9 = v5;
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery will start advertising with options %{private}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [(WPDObjectDiscoveryManager *)self peripheralManager];
  uint64_t v7 = [(WPDObjectDiscoveryManager *)self advertOptions];
  [v6 startAdvertising:v7];
}

- (id)updateAdvertiser
{
  v13[1] = *MEMORY[0x263EF8340];
  v3 = [(WPDObjectDiscoveryManager *)self advertRequest];

  if (!v3)
  {
    [(WPDObjectDiscoveryManager *)self advertOptionsChanged:0];
    [(WPDObjectDiscoveryManager *)self stopAdvertiser];
LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_19;
  }
  if (![(WPDObjectDiscoveryManager *)self advAllowlisted])
  {
    v3 = @"ObjectDiscovery advertising is denylisted or not allowlisted";
LABEL_13:
    [(WPDObjectDiscoveryManager *)self advertOptionsChanged:0];
    goto LABEL_14;
  }
  if ([(WPDManager *)self state] != 3)
  {
    v3 = @"Trying to update advertiser but peripheral manager isn't powered on";
    goto LABEL_13;
  }
  id v11 = 0;
  BOOL v4 = [(WPDObjectDiscoveryManager *)self updateAdvertisingOptionsWithError:&v11];
  v3 = (__CFString *)v11;
  if (v4)
  {
    [(WPDObjectDiscoveryManager *)self stopAdvertiser];
    v5 = [(WPDObjectDiscoveryManager *)self advertOptions];

    if (v5) {
      [(WPDObjectDiscoveryManager *)self startAdvertiser];
    }
  }
  if (!v3) {
    goto LABEL_10;
  }
LABEL_14:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_214);
  }
  uint64_t v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    [(WPDObjectDiscoveryManager *)(uint64_t)v3 updateAdvertiser];
  }
  int v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F08320];
  v13[0] = v3;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v6 = [v8 errorWithDomain:@"WPErrorDomain" code:26 userInfo:v9];

LABEL_19:
  return v6;
}

- (id)addAdvertisingRequest:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_217_0);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryManager addAdvertisingRequest:forClient:]();
  }
  int v8 = [(WPDManager *)self server];
  uint64_t v9 = [v8 statsManager];
  [v9 startActivity:1 forType:18];

  uint64_t v10 = [(WPDManager *)self server];
  id v11 = [v10 statsManager];
  [v11 resetActivity:1 forType:18];

  [(WPDObjectDiscoveryManager *)self setAdvertRequest:v6];
  [(WPDObjectDiscoveryManager *)self setAdvertClientUUID:v7];
  uint64_t v12 = [(WPDObjectDiscoveryManager *)self updateAdvertiser];

  return v12;
}

- (id)removeAdvertisingRequest:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_219);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryManager removeAdvertisingRequest:forClient:]();
  }
  int v8 = [(WPDManager *)self server];
  uint64_t v9 = [v8 statsManager];
  [v9 stopActivity:1 forType:18];

  uint64_t v10 = [(WPDManager *)self server];
  id v11 = [v10 statsManager];
  [v11 resetActivity:1 forType:18];

  [(WPDObjectDiscoveryManager *)self setAdvertRequest:0];
  [(WPDObjectDiscoveryManager *)self setAdvertClientUUID:0];
  uint64_t v12 = [(WPDObjectDiscoveryManager *)self updateAdvertiser];

  return v12;
}

- (void)removeAdvertisingRequestsForClient:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_221);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryManager removeAdvertisingRequestsForClient:]();
  }
  id v5 = [(WPDObjectDiscoveryManager *)self advertClientUUID];
  if (v5 != v4) {
    goto LABEL_8;
  }
  id v6 = [(WPDObjectDiscoveryManager *)self advertRequest];

  if (v6)
  {
    id v5 = [(WPDObjectDiscoveryManager *)self advertRequest];
    id v7 = [(WPDObjectDiscoveryManager *)self removeAdvertisingRequest:v5 forClient:v4];
LABEL_8:
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_223_0);
    }
    int v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDObjectDiscoveryManager peripheralManagerDidStartAdvertising:error:](v8, v7);
    }
    [(WPDObjectDiscoveryManager *)self setAdvertising:0];
    uint64_t v9 = [(WPDManager *)self server];
    uint64_t v10 = [v9 spObjectDiscoveryClient];

    if (v10)
    {
      id v11 = [(WPDManager *)self server];
      uint64_t v12 = [v11 spObjectDiscoveryClient];
      [v12 advertisingFailedToStart:v7 ofType:18];
LABEL_14:

      goto LABEL_23;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_226);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDObjectDiscoveryManager peripheralManagerDidStartAdvertising:error:]();
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_229);
    }
    v13 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Did start advertising", v16, 2u);
    }
    [(WPDObjectDiscoveryManager *)self setAdvertising:1];
    v14 = [(WPDManager *)self server];
    v15 = [v14 spObjectDiscoveryClient];

    if (v15)
    {
      id v11 = [(WPDManager *)self server];
      uint64_t v12 = [v11 spObjectDiscoveryClient];
      [v12 advertisingStartedOfType:18];
      goto LABEL_14;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_232);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDObjectDiscoveryManager peripheralManagerDidStartAdvertising:error:]();
    }
  }
LABEL_23:
}

- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_234);
    }
    int v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      uint64_t v10 = [v7 localizedDescription];
      int v18 = 138412546;
      v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = [v7 code];
      _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Failed to stop advertising with error: %@ (%ld)", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    [(WPDObjectDiscoveryManager *)self setAdvertising:0];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_237_0);
    }
    id v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Did stop advertising", (uint8_t *)&v18, 2u);
    }
  }
  uint64_t v12 = [(WPDManager *)self server];
  v13 = [v12 statsManager];
  [v13 stopActivity:1 forType:18];

  v14 = [(WPDManager *)self server];
  v15 = [v14 spObjectDiscoveryClient];

  if (v15)
  {
    int v16 = [(WPDManager *)self server];
    v17 = [v16 spObjectDiscoveryClient];
    [v17 advertisingStoppedOfType:18 withError:v7];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_240);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDObjectDiscoveryManager peripheralManager:didStopAdvertisingWithError:]();
    }
  }
}

- (void)updateReports:(id)a3 fromReport:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [v6 objectForKeyedSubscript:@"kCBMsgArgAdvertisementPeripheral"];
  int v8 = [v6 objectForKeyedSubscript:@"kCBMsgArgRssi"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"kCBMsgArgAdvertisementData"];

  [(WPDObjectDiscoveryManager *)self updateReports:v7 Peripheral:v10 AdvertisementData:v9 RSSI:v8];
}

- (void)updateReports:(id)a3 Peripheral:(id)a4 AdvertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFECB8]];
  v14 = (unsigned char *)[v13 bytes];
  uint64_t v15 = [v13 length];
  if (v15 < 2 || *v14 != 76 || v14[1]) {
    goto LABEL_27;
  }
  unint64_t v16 = v15;
  uint64_t v32 = v10;
  __int16 v33 = v9;
  uint64_t v34 = [MEMORY[0x263EFF9A0] dictionary];
  if (v16 < 4) {
    goto LABEL_26;
  }
  int v18 = &v14[v16];
  v19 = v14 + 2;
  *(void *)&long long v17 = 134218242;
  long long v31 = v17;
  while (1)
  {
    uint64_t v20 = *v19;
    uint64_t v21 = v19 + 2;
    unint64_t v22 = v19[1] & 0x1F;
    unint64_t v23 = v18 - (v19 + 2);
    if (v23 < v22) {
      break;
    }
    uint64_t v24 = &v21[v22];
    if ((v20 - 27) <= 0xE5u)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_254);
      }
      uint64_t v25 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v31;
        uint64_t v42 = v20;
        __int16 v43 = 2112;
        unint64_t v44 = (unint64_t)v13;
        _os_log_error_impl(&dword_22316D000, v25, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer unsupported payload type %ld, data %@", buf, 0x16u);
      }
      goto LABEL_20;
    }
    if (v20 != 18) {
      goto LABEL_15;
    }
LABEL_19:
    v27 = objc_msgSend(MEMORY[0x263EFF990], "dataWithBytes:length:", v14, 2, v31);
    [v27 appendBytes:v19 length:v22 + 2];
    v28 = [MEMORY[0x263EFF8F8] dataWithData:v27];
    v29 = [NSNumber numberWithUnsignedChar:v20];
    [v34 setObject:v28 forKey:v29];

LABEL_20:
    v19 = v24;
    if (v18 - v24 <= 1) {
      goto LABEL_26;
    }
  }
  if (v20 == 4)
  {
    unint64_t v22 = ((_BYTE)v18 - ((_BYTE)v19 + 2));
    uint64_t v24 = &v21[v23];
LABEL_15:
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_257);
    }
    uint64_t v26 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v31;
      uint64_t v42 = v20;
      __int16 v43 = 2112;
      unint64_t v44 = (unint64_t)v13;
      _os_log_debug_impl(&dword_22316D000, v26, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer unexpected payload type %ld, data %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_251);
  }
  v30 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218499;
    uint64_t v42 = v20;
    __int16 v43 = 2048;
    unint64_t v44 = v22;
    __int16 v45 = 2113;
    id v46 = v13;
    _os_log_error_impl(&dword_22316D000, v30, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer bad payload type %ld length %zu, data %{private}@", buf, 0x20u);
  }
LABEL_26:
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  void v35[2] = __77__WPDObjectDiscoveryManager_updateReports_Peripheral_AdvertisementData_RSSI___block_invoke_260;
  v35[3] = &unk_26469B0D0;
  id v36 = v11;
  id v37 = v12;
  id v10 = v32;
  id v38 = v32;
  id v39 = v13;
  id v9 = v33;
  id v40 = v33;
  [v34 enumerateKeysAndObjectsUsingBlock:v35];

LABEL_27:
}

void __77__WPDObjectDiscoveryManager_updateReports_Peripheral_AdvertisementData_RSSI___block_invoke_260(uint64_t a1, void *a2, void *a3)
{
  v17[7] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263EFEC88]];
  int v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263EFECE8]];
  v17[0] = v6;
  v16[0] = @"kDeviceAdvertisingData";
  v16[1] = @"kDeviceAddress";
  id v9 = v7;
  if (!v7)
  {
    id v9 = [MEMORY[0x263EFF8F8] data];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  v17[1] = v9;
  v17[2] = v11;
  v16[2] = @"kDeviceRSSI";
  v16[3] = @"kDevicePeripheralUUID";
  id v12 = [v10 identifier];
  uint64_t v13 = *(void *)(a1 + 56);
  v17[3] = v12;
  v17[4] = v13;
  v16[4] = @"kDeviceManufacturerData";
  v16[5] = @"kDeviceType";
  v17[5] = v5;
  v16[6] = @"kDeviceTime";
  v14 = v8;
  if (!v8)
  {
    v14 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  }
  v17[6] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:7];
  if (!v8) {

  }
  if (!v7) {
  [*(id *)(a1 + 64) addObject:v15];
  }
}

- (void)updateClientsWithReports:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_263);
  }
  id v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = [v4 count];
    int v8 = [(WPDObjectDiscoveryManager *)self currentScanners];
    *(_DWORD *)buf = 134349314;
    *(void *)&uint8_t buf[4] = v7;
    __int16 v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer receiving %{public}lu reports for %{public}@ clients", buf, 0x16u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v9 = [(WPDObjectDiscoveryManager *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_264;
  block[3] = &unk_26469ABC0;
  objc_copyWeak(&v16, (id *)buf);
  dispatch_async(v9, block);

  if (![v4 count])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_272_1);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDObjectDiscoveryManager updateClientsWithReports:]();
    }
  }
  id v10 = [(WPDObjectDiscoveryManager *)self currentScanners];
  BOOL v11 = [v10 count] == 0;

  if (v11)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_275);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDObjectDiscoveryManager updateClientsWithReports:]();
    }
  }
  else
  {
    id v12 = [(WPDObjectDiscoveryManager *)self currentScanners];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_276;
    v13[3] = &unk_26469B0F8;
    v13[4] = self;
    id v14 = v4;
    [v12 enumerateObjectsUsingBlock:v13];
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_264(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained scanStopTimer];

    if (v3)
    {
      objc_msgSend(v2, "setAdvBuffersToRead:", objc_msgSend(v2, "advBuffersToRead") - 1);
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_266_0);
      }
      id v4 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_264_cold_2(v4);
      }
      if ((int)[v2 advBuffersToRead] <= 0)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_269_1);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_264_cold_1();
        }
        [v2 cancelScanStopTimer];
        [v2 deactivateADVBuffer];
        id v5 = [v2 scanOptions];

        if (v5) {
          [v2 activateADVBuffer];
        }
      }
    }
  }
}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_276(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) server];
  id v5 = [v4 getClientForUUID:v3];

  if (v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_279);
    }
    id v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void **)(a1 + 40);
      int v8 = v6;
      int v9 = 138543618;
      id v10 = v3;
      __int16 v11 = 2050;
      uint64_t v12 = [v7 count];
      _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer telling client %{public}@ about %{public}lu reports", (uint8_t *)&v9, 0x16u);
    }
    [v5 discoveredDevices:*(void *)(a1 + 40)];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_282);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_276_cold_1();
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_285_0);
  }
  id v14 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v17 = 0;
    _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer UNEXPECTED didDiscoverPeripheral", v17, 2u);
  }
  uint64_t v15 = (void *)MEMORY[0x223CB05A0]();
  id v16 = objc_opt_new();
  [(WPDObjectDiscoveryManager *)self updateReports:v16 Peripheral:v11 AdvertisementData:v12 RSSI:v13];
  [(WPDObjectDiscoveryManager *)self updateClientsWithReports:v16];
}

- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_287);
  }
  int v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    *(_DWORD *)buf = 134349056;
    uint64_t v23 = [v7 count];
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer didDiscoverMultiplePeripherals %{public}lu peripherals", buf, 0xCu);
  }
  id v10 = (void *)MEMORY[0x223CB05A0]();
  id v11 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[WPDObjectDiscoveryManager updateReports:fromReport:](self, "updateReports:fromReport:", v11, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }

  [(WPDObjectDiscoveryManager *)self updateClientsWithReports:v11];
}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_289);
  }
  int v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer didFailToScanWithError %{public}@", buf, 0xCu);
  }
  if (v7)
  {
    int v9 = [v7 domain];
    id v10 = v9;
    if (v9 == (void *)*MEMORY[0x263EFEE60])
    {
      BOOL v11 = [v7 code] == 13;

      if (v11)
      {
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        id v12 = [(WPDObjectDiscoveryManager *)self serverQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __67__WPDObjectDiscoveryManager_centralManager_didFailToScanWithError___block_invoke_293;
        block[3] = &unk_26469ABC0;
        objc_copyWeak(&v15, (id *)buf);
        dispatch_async(v12, block);

        objc_destroyWeak(&v15);
        objc_destroyWeak((id *)buf);
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_292);
  }
  uint64_t v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer UNEXPECTED didFailToScanWithError %{public}@", buf, 0xCu);
  }
LABEL_14:
}

void __67__WPDObjectDiscoveryManager_centralManager_didFailToScanWithError___block_invoke_293(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained scanStopTimer];

    if (v3)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_295);
      }
      id v4 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_INFO, "ObjectDiscovery ADV Buffer force-read failed", buf, 2u);
      }
      [v2 cancelScanStopTimer];
      [v2 deactivateADVBuffer];
      id v5 = [v2 scanOptions];

      if (v5) {
        [v2 activateADVBuffer];
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_298_0);
      }
      id v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_INFO, "ObjectDiscovery ADV Buffer scan failed to start", v7, 2u);
      }
      [v2 setScanning:0];
    }
  }
}

- (id)rulesFromTokens:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", (unint64_t)objc_msgSend(v4, "count") >> 1);
    if ([v4 count])
    {
      unint64_t v6 = 0;
      uint64_t v7 = *MEMORY[0x263EFED18];
      uint64_t v8 = *MEMORY[0x263EFED10];
      do
      {
        v14[0] = v7;
        int v9 = [v4 objectAtIndexedSubscript:v6];
        v14[1] = v8;
        v15[0] = v9;
        id v10 = [v4 objectAtIndexedSubscript:v6 + 1];
        v15[1] = v10;
        BOOL v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
        [v5 addObject:v11];

        v6 += 2;
      }
      while ([v4 count] > v6);
    }
    id v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  }
  else
  {
    id v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (void)updateNearbyTokens:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_300);
  }
  unint64_t v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Updating nearby tokens", (uint8_t *)&v24, 2u);
  }
  if (v5
    || ([(WPDObjectDiscoveryManager *)self nearbyTokensRequest],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = [(WPDObjectDiscoveryManager *)self nearbyTokensRequest];
    uint64_t v8 = [v5 isEqual:v7] ^ 1;

    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

LABEL_11:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_303_0);
  }
  int v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    -[WPDObjectDiscoveryManager updateNearbyTokens:].cold.4(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v8) {
      goto LABEL_15;
    }
  }
  else if (v8)
  {
LABEL_15:
    [(WPDObjectDiscoveryManager *)self setNearbyTokensRequest:v5];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_315);
    }
    id v16 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDObjectDiscoveryManager updateNearbyTokens:](v16);
    }
    uint64_t v17 = [(WPDObjectDiscoveryManager *)self rulesFromTokens:v5];
    [(WPDObjectDiscoveryManager *)self setMatchActionRules:v17];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_318);
    }
    long long v18 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = v18;
      long long v20 = [(WPDObjectDiscoveryManager *)self matchActionRules];
      int v24 = 138412290;
      uint64_t v25 = v20;
      _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Nearby tokens setMatchActionRules with rules: %@", (uint8_t *)&v24, 0xCu);
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_321);
    }
    uint64_t v21 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDObjectDiscoveryManager updateNearbyTokens:](v21);
    }
    unint64_t v22 = [(WPDObjectDiscoveryManager *)self centralManager];
    uint64_t v23 = [(WPDObjectDiscoveryManager *)self matchActionRules];
    [v22 setMatchActionRules:v23];

    goto LABEL_33;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_312);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryManager updateNearbyTokens:]();
  }
LABEL_33:
}

- (BOOL)changedScanOptions:(id)a3 Clients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WPDObjectDiscoveryManager *)self scanOptions];
  int v9 = (void *)v8;
  if (v6)
  {
    if (v8)
    {
      uint64_t v10 = [(WPDObjectDiscoveryManager *)self scanOptions];
      uint64_t v11 = [v6 isEqualToDictionary:v10] ^ 1;
    }
    else
    {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = v8 != 0;
  }

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_323);
  }
  uint64_t v12 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    -[WPDObjectDiscoveryManager changedScanOptions:Clients:](v11, v12, v13, v14, v15, v16, v17, v18);
    if (!v11) {
      goto LABEL_14;
    }
  }
  else if (!v11)
  {
    goto LABEL_14;
  }
  [(WPDObjectDiscoveryManager *)self setScanOptions:v6];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_326_0);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryManager changedScanOptions:Clients:]();
  }
LABEL_14:
  long long v19 = [(WPDObjectDiscoveryManager *)self currentScanners];
  [v19 removeAllObjects];

  if (v7)
  {
    long long v20 = [(WPDObjectDiscoveryManager *)self currentScanners];
    [v20 addObjectsFromArray:v7];
  }
  return v11;
}

- (BOOL)updateScanRules
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = [(WPDObjectDiscoveryManager *)self scanRequests];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v6 = [(WPDObjectDiscoveryManager *)self scanRequests];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v57 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(const char **)(*((void *)&v56 + 1) + 8 * i);
          if ([(WPDManager *)self testMode]
            && ([(WPDManager *)self server],
                uint64_t v12 = objc_claimAutoreleasedReturnValue(),
                char v13 = [v12 isClientTestMode:v11],
                v12,
                (v13 & 1) == 0))
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_331);
            }
            uint64_t v17 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v61 = v11;
              _os_log_debug_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer Not adding for non-test client UUID: %@ when in test mode", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v14 = [(WPDObjectDiscoveryManager *)self scanRequests];
            uint64_t v15 = [v14 objectForKeyedSubscript:v11];

            if ([v15 clientType] == 18)
            {
              [v5 addObject:v11];
            }
            else
            {
              if (WPLogInitOnce != -1) {
                dispatch_once(&WPLogInitOnce, &__block_literal_global_334);
              }
              uint64_t v16 = (void *)WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
                [(WPDObjectDiscoveryManager *)v67 updateScanRules];
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v8);
    }

    if (![v5 count])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_337);
      }
      id v37 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v37, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer No valid clients to scan for - Stopping Scan", buf, 2u);
      }
      BOOL v36 = [(WPDObjectDiscoveryManager *)self changedScanOptions:0 Clients:0];
      goto LABEL_101;
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obuint64_t j = v5;
    uint64_t v18 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v18)
    {
      uint64_t v20 = v18;
      uint64_t v50 = 0;
      uint64_t v21 = *(void *)v53;
      *(void *)&long long v19 = 138412290;
      long long v47 = v19;
      int v48 = 0xFFFF;
      while (2)
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v53 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(const char **)(*((void *)&v52 + 1) + 8 * v22);
          int v24 = [(WPDObjectDiscoveryManager *)self scanRequests];
          uint64_t v25 = [v24 objectForKeyedSubscript:v23];

          if (v25)
          {
            [v25 scanningRates];
            unsigned __int16 v26 = v51;
          }
          else
          {
            unsigned __int16 v26 = 0;
            unsigned __int16 v51 = 0;
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_340);
          }
          v27 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            long long v61 = v23;
            __int16 v62 = 2112;
            *(void *)long long v63 = v25;
            _os_log_debug_impl(&dword_22316D000, v27, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer client %@ request %@", buf, 0x16u);
          }
          if (([v25 advBuffer] & 4) != 0)
          {
            if (([v25 advBuffer] & 3) != 0)
            {
              if (WPLogInitOnce != -1) {
                dispatch_once(&WPLogInitOnce, &__block_literal_global_343);
              }
              v29 = WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v47;
                long long v61 = v23;
                _os_log_debug_impl(&dword_22316D000, v29, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer activating for client %@", buf, 0xCu);
              }
              v50 |= [v25 advBuffer];
              if (v26)
              {
                int v30 = v48;
                int v31 = (unsigned __int16)v48;
                if (v26 < (unsigned __int16)v48) {
                  int v31 = v26;
                }
                if (v26 != 0xFFFF) {
                  int v30 = v31;
                }
                int v48 = v30;
              }
            }
            else
            {
              if (WPLogInitOnce != -1) {
                dispatch_once(&WPLogInitOnce, &__block_literal_global_346_0);
              }
              uint64_t v32 = WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v47;
                long long v61 = v23;
                _os_log_error_impl(&dword_22316D000, v32, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer no-buffer no-op for client %@", buf, 0xCu);
              }
            }
          }
          else
          {
            if (v26 != 0xFFFF)
            {
              if (WPLogInitOnce != -1) {
                dispatch_once(&WPLogInitOnce, &__block_literal_global_352_1);
              }
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
                -[WPDObjectDiscoveryManager updateScanRules]();
              }

              goto LABEL_78;
            }
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_349_0);
            }
            v28 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v47;
              long long v61 = v23;
              _os_log_debug_impl(&dword_22316D000, v28, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer no-op for client %@", buf, 0xCu);
            }
          }

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
        if (v20) {
          continue;
        }
        break;
      }

      uint64_t v33 = v50;
      unsigned __int16 v34 = v48;
      if (v50 == 4)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_355_1);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          -[WPDObjectDiscoveryManager updateScanRules]();
        }
        goto LABEL_79;
      }
    }
    else
    {
LABEL_78:

LABEL_79:
      uint64_t v33 = 0;
      unsigned __int16 v34 = -1;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_358_1);
    }
    id v38 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      [(WPDObjectDiscoveryManager *)v34 updateScanRules];
      if ((v33 & 4) == 0) {
        goto LABEL_84;
      }
    }
    else if ((v33 & 4) == 0)
    {
LABEL_84:
      id v39 = 0;
LABEL_94:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_364);
      }
      unint64_t v44 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v45 = "activate";
        *(_DWORD *)buf = 136446979;
        if (!v39) {
          __int16 v45 = "deactivate";
        }
        long long v61 = v45;
        __int16 v62 = 1025;
        *(_DWORD *)long long v63 = 18;
        *(_WORD *)&v63[4] = 2114;
        *(void *)&v63[6] = v39;
        __int16 v64 = 2113;
        id v65 = obj;
        _os_log_impl(&dword_22316D000, v44, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer about to %{public}s for type %{private}d with options %{public}@ for clients %{private}@", buf, 0x26u);
      }
      BOOL v36 = [(WPDObjectDiscoveryManager *)self changedScanOptions:v39 Clients:obj];

LABEL_101:
      return v36;
    }
    id v40 = [MEMORY[0x263EFF9A0] dictionary];
    v41 = v40;
    if (v33) {
      [v40 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFED68]];
    }
    if ((v33 & 2) != 0) {
      [v41 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFED60]];
    }
    uint64_t v42 = *MEMORY[0x263EFEDD8];
    if (v34 == 0xFFFF)
    {
      [v41 setObject:&unk_26D646E48 forKeyedSubscript:v42];
      [v41 setObject:&unk_26D646E48 forKeyedSubscript:*MEMORY[0x263EFEDC8]];
    }
    else
    {
      [v41 setObject:&unk_26D646E60 forKeyedSubscript:v42];
      __int16 v43 = [NSNumber numberWithUnsignedShort:v34];
      [v41 setObject:v43 forKeyedSubscript:*MEMORY[0x263EFEDC8]];
    }
    id v39 = [NSDictionary dictionaryWithDictionary:v41];

    goto LABEL_94;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_328_0);
  }
  __int16 v35 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22316D000, v35, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer Nothing left to scan for - Stopping Scan", buf, 2u);
  }
  return [(WPDObjectDiscoveryManager *)self changedScanOptions:0 Clients:0];
}

- (void)updateScanner
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "ObjectDiscovery ADV Buffer request no-op", v2, v3, v4, v5, v6);
}

- (void)forceReadADVBuffer:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WPDObjectDiscoveryManager *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WPDObjectDiscoveryManager_forceReadADVBuffer___block_invoke;
  block[3] = &unk_26469AD78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__WPDObjectDiscoveryManager_forceReadADVBuffer___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *MEMORY[0x263EFED68];
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFED68]];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = [v3 objectForKeyedSubscript:v4];
      int v8 = [v7 BOOLValue];
    }
    else
    {
      int v8 = 0;
    }
    uint64_t v9 = *MEMORY[0x263EFED60];
    id v10 = v3;
    uint64_t v11 = [v10 objectForKeyedSubscript:v9];
    if (v11)
    {
      uint64_t v12 = [v10 objectForKeyedSubscript:v9];
      int v13 = [v12 BOOLValue];
    }
    else
    {
      int v13 = 0;
    }

    [WeakRetained setAdvBuffersToRead:(v13 + v8)];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_382);
    }
    uint64_t v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v14;
      v17[0] = 67174913;
      v17[1] = 18;
      __int16 v18 = 1025;
      int v19 = [WeakRetained advBuffersToRead];
      _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer force-read for type %{private}d buffers %{private}d", (uint8_t *)v17, 0xEu);
    }
    [WeakRetained addScanStopTimer];
    uint64_t v16 = [WeakRetained centralManager];
    [v16 scanForPeripheralsWithServices:0 options:*(void *)(a1 + 32)];
  }
}

- (void)activateADVBuffer
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_384);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(WPDObjectDiscoveryManager *)self scanOptions];
    v8[0] = 67174915;
    v8[1] = 18;
    __int16 v9 = 2113;
    id v10 = v5;
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer activate for type %{private}d with options %{private}@", (uint8_t *)v8, 0x12u);
  }
  id v6 = [(WPDObjectDiscoveryManager *)self centralManager];
  uint64_t v7 = [(WPDObjectDiscoveryManager *)self scanOptions];
  [v6 scanForPeripheralsWithServices:0 options:v7];

  [(WPDObjectDiscoveryManager *)self setScanning:1];
}

- (void)deactivateADVBuffer
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_386);
  }
  id v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67174657;
    v5[1] = 18;
    _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer deactivate for type %{private}d", (uint8_t *)v5, 8u);
  }
  uint64_t v4 = [(WPDObjectDiscoveryManager *)self centralManager];
  [v4 stopScan];

  [(WPDObjectDiscoveryManager *)self setScanning:0];
}

- (id)addScanRequest:(id)a3 forClient:(id)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_388);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryManager addScanRequest:forClient:].cold.4();
  }
  int v8 = [v6 clientType];
  if (v8 == 18)
  {
    if ([(WPDManager *)self state] == 3)
    {
      __int16 v9 = [(WPDObjectDiscoveryManager *)self scanRequests];
      id v10 = [v9 objectForKeyedSubscript:v7];

      if (v10)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_403);
        }
        uint64_t v11 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          -[WPDObjectDiscoveryManager addScanRequest:forClient:]((uint64_t)v7, v11, v6);
        }
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_406);
      }
      uint64_t v12 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138543618;
        id v24 = v6;
        __int16 v25 = 2114;
        id v26 = v7;
        _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Adding scan request %{public}@ for client %{public}@", (uint8_t *)&v23, 0x16u);
      }
      int v13 = [(WPDObjectDiscoveryManager *)self scanRequests];
      [v13 setObject:v6 forKeyedSubscript:v7];

      [(WPDObjectDiscoveryManager *)self updateScanner];
      uint64_t v14 = 0;
    }
    else
    {
      int v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08320];
      v28 = @"CoreBluetooth is currently powered off";
      uint64_t v20 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      uint64_t v14 = [v19 errorWithDomain:@"WPErrorDomain" code:1 userInfo:v20];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_400);
      }
      uint64_t v21 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDObjectDiscoveryManager addScanRequest:forClient:](v21);
      }
    }
  }
  else
  {
    int v15 = v8;
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    v30[0] = @"ObjectDiscoveryManager is not scanning for this client type";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    uint64_t v14 = [v16 errorWithDomain:@"WPErrorDomain" code:10 userInfo:v17];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_394);
    }
    __int16 v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDObjectDiscoveryManager addScanRequest:forClient:](v15, v18);
    }
  }

  return v14;
}

- (id)getScanRequestsForClient:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WPDObjectDiscoveryManager *)self scanRequests];
  id v6 = [v5 objectForKeyedSubscript:v4];

  v9[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return v7;
}

- (void)removeScanRequestsForClient:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_408);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDObjectDiscoveryManager removeScanRequestsForClient:]();
  }
  uint64_t v5 = [(WPDObjectDiscoveryManager *)self scanRequests];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_414);
    }
    id v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Removing all scan requests for client %{public}@", (uint8_t *)&v10, 0xCu);
    }
    int v8 = [(WPDObjectDiscoveryManager *)self scanRequests];
    [v8 removeObjectForKey:v4];

    [(WPDObjectDiscoveryManager *)self updateScanner];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_411);
    }
    __int16 v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_INFO, "ObjectDiscovery has no scan requests for client %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)cancelScanStopTimer
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "ObjectDiscovery ADV Buffer cancelScanStopTimer", v2, v3, v4, v5, v6);
}

- (void)addScanStopTimer
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "ObjectDiscovery ADV Buffer addScanStopTimer", v2, v3, v4, v5, v6);
}

void __45__WPDObjectDiscoveryManager_addScanStopTimer__block_invoke_422(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained scanning])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_424);
      }
      uint64_t v3 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_INFO, "ObjectDiscovery ADV Buffer force-read timed-out", v4, 2u);
      }
      [v2 deactivateADVBuffer];
    }
    [v2 setScanStopTimer:0];
  }
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (BOOL)scanningDisabled
{
  return self->_scanningDisabled;
}

- (void)setScanningDisabled:(BOOL)a3
{
  self->_scanningDisabled = a3;
}

- (OS_dispatch_queue)serverQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverQueue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (CBPeripheralManager)peripheralManager
{
  return (CBPeripheralManager *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPeripheralManager:(id)a3
{
}

- (BOOL)advertising
{
  return self->_advertising;
}

- (void)setAdvertising:(BOOL)a3
{
  self->_advertising = a3;
}

- (WPAdvertisingRequest)advertRequest
{
  return (WPAdvertisingRequest *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAdvertRequest:(id)a3
{
}

- (NSUUID)advertClientUUID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_advertClientUUID);
  return (NSUUID *)WeakRetained;
}

- (void)setAdvertClientUUID:(id)a3
{
}

- (NSDictionary)advertOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAdvertOptions:(id)a3
{
}

- (unint64_t)advertHash
{
  return self->_advertHash;
}

- (void)setAdvertHash:(unint64_t)a3
{
  self->_advertHash = a3;
}

- (BOOL)advAllowlisted
{
  return self->_advAllowlisted;
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCentralManager:(id)a3
{
}

- (NSMutableDictionary)scanRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setScanRequests:(id)a3
{
}

- (NSMutableSet)currentScanners
{
  return (NSMutableSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentScanners:(id)a3
{
}

- (NSDictionary)scanOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setScanOptions:(id)a3
{
}

- (OS_dispatch_source)scanStopTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 144, 1);
}

- (void)setScanStopTimer:(id)a3
{
}

- (int)advBuffersToRead
{
  return self->_advBuffersToRead;
}

- (void)setAdvBuffersToRead:(int)a3
{
  self->_advBuffersToRead = a3;
}

- (NSArray)nearbyTokensRequest
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setNearbyTokensRequest:(id)a3
{
}

- (NSArray)matchActionRules
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setMatchActionRules:(id)a3
{
}

- (BOOL)scanAllowlisted
{
  return self->_scanAllowlisted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchActionRules, 0);
  objc_storeStrong((id *)&self->_nearbyTokensRequest, 0);
  objc_storeStrong((id *)&self->_scanStopTimer, 0);
  objc_storeStrong((id *)&self->_scanOptions, 0);
  objc_storeStrong((id *)&self->_currentScanners, 0);
  objc_storeStrong((id *)&self->_scanRequests, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_advertOptions, 0);
  objc_destroyWeak((id *)&self->_advertClientUUID);
  objc_storeStrong((id *)&self->_advertRequest, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_destroyWeak((id *)&self->_serverQueue);
}

- (void)advertOptionsChanged:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 advertOptions];
  OUTLINED_FUNCTION_20(&dword_22316D000, v5, v6, "ObjectDiscovery advertising options old: %@ new: %@", v7, v8, v9, v10, 2u);
}

- (void)updateAdvertisingOptionsWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateAdvertiser
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[WPDObjectDiscoveryManager updateAdvertiser]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22316D000, a2, OS_LOG_TYPE_ERROR, "ObjectDiscovery %s updated with error: %@", (uint8_t *)&v2, 0x16u);
}

- (void)addAdvertisingRequest:forClient:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22316D000, v0, v1, "ObjectDiscovery Adding advertising request %@ for client: %@");
}

- (void)removeAdvertisingRequest:forClient:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22316D000, v0, v1, "ObjectDiscovery Removing advertising request %@ for client: %@");
}

- (void)removeAdvertisingRequestsForClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "ObjectDiscovery Remove advertising requests for client: %@", v2, v3, v4, v5, v6);
}

- (void)peripheralManagerDidStartAdvertising:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "ObjectDiscovery started advertising, but no client advertising", v2, v3, v4, v5, v6);
}

- (void)peripheralManagerDidStartAdvertising:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "ObjectDiscovery failed to start advertising, but no client advertising", v2, v3, v4, v5, v6);
}

- (void)peripheralManagerDidStartAdvertising:(void *)a1 error:(void *)a2 .cold.3(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_15() localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 code];
  _os_log_error_impl(&dword_22316D000, v2, OS_LOG_TYPE_ERROR, "ObjectDiscovery Failed to start advertising with error: %@ (%ld)", (uint8_t *)&v6, 0x16u);
}

- (void)peripheralManager:didStopAdvertisingWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "ObjectDiscovery stopped advertising, but no client advertising", v2, v3, v4, v5, v6);
}

- (void)updateClientsWithReports:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "ObjectDiscovery ADV Buffer no current scanners found.", v2, v3, v4, v5, v6);
}

- (void)updateClientsWithReports:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "ObjectDiscovery ADV Buffer read event.", v2, v3, v4, v5, v6);
}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_264_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "ObjectDiscovery ADV Buffer forced-read completed", v2, v3, v4, v5, v6);
}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_264_cold_2(void *a1)
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_15() advBuffersToRead];
  OUTLINED_FUNCTION_9_0(&dword_22316D000, v3, v4, "ObjectDiscovery ADV Buffers force-read remaining buffers %{private}d", v5, v6, v7, v8, 1u);
}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_276_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22316D000, v0, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer client with UUID %{public}@ doesn't exist, but we've still got a scan request for it", v1, 0xCu);
}

- (void)updateNearbyTokens:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() matchActionRules];
  [v3 count];
  OUTLINED_FUNCTION_9_0(&dword_22316D000, v4, v5, "ObjectDiscovery calling Nearby tokens setMatchActionRules with %d rules", v6, v7, v8, v9, 0);
}

- (void)updateNearbyTokens:(void *)a1 .cold.2(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() nearbyTokensRequest];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22316D000, v1, OS_LOG_TYPE_DEBUG, "ObjectDiscovery Nearby tokens updated to: %@ ", v4, 0xCu);
}

- (void)updateNearbyTokens:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "ObjectDiscovery Nearby tokens request no-op", v2, v3, v4, v5, v6);
}

- (void)updateNearbyTokens:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)changedScanOptions:Clients:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "ObjectDiscovery manager status %@", v2, v3, v4, v5, v6);
}

- (void)changedScanOptions:(uint64_t)a3 Clients:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateScanRules
{
  uint64_t v7 = a2;
  int v8 = [a3 clientType];
  *(_DWORD *)a1 = 67109120;
  *a4 = v8;
  _os_log_error_impl(&dword_22316D000, v7, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer Request with unexpected client type %d", a1, 8u);
}

- (void)addScanRequest:(void *)a3 forClient:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 clientType];
  OUTLINED_FUNCTION_20(&dword_22316D000, v5, v6, "ObjectDiscovery - %{public}@ is already scanning for type %{public}ld. Replacing scan request", v7, v8, v9, v10, 2u);
}

- (void)addScanRequest:(void *)a1 forClient:.cold.2(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  v3[0] = 67240448;
  v3[1] = 18;
  __int16 v4 = 1026;
  int v5 = [(id)OUTLINED_FUNCTION_15() state];
  _os_log_error_impl(&dword_22316D000, v1, OS_LOG_TYPE_ERROR, "ObjectDiscovery Failed to start a scan for type %{public}d - central is not powered on %{public}d", (uint8_t *)v3, 0xEu);
}

- (void)addScanRequest:(int)a1 forClient:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_22316D000, a2, OS_LOG_TYPE_ERROR, "ObjectDiscovery Failed to start a scan for type %{public}d - ObjectDiscoveryManager is not scanning for this type", (uint8_t *)v2, 8u);
}

- (void)addScanRequest:forClient:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "ObjectDiscovery Adding scan request called for client %@", v2, v3, v4, v5, v6);
}

- (void)removeScanRequestsForClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "ObjectDiscovery Remove scan requests called for client %@", v2, v3, v4, v5, v6);
}

@end