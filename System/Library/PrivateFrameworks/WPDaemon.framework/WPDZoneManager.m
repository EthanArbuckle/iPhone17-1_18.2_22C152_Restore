@interface WPDZoneManager
- (BOOL)scanAllowlisted;
- (BOOL)updateScanner;
- (CBCentralManager)centralManager;
- (NSDate)lastTimeScannerStarted;
- (NSMutableDictionary)trackRequests;
- (NSMutableDictionary)trackedZones;
- (NSNumber)zoneExitTimeout;
- (OS_dispatch_source)exitTimer;
- (WPDZoneManager)initWithServer:(id)a3;
- (id)addZoneTrackingRequest:(id)a3 forClient:(id)a4;
- (id)generateStateDumpStrings;
- (id)getAllZones;
- (void)addSingleZoneTrackingRequest:(id)a3 forClient:(id)a4;
- (void)cancelExitTimer;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didLoseZone:(id)a4 mask:(id)a5;
- (void)cleanup;
- (void)exitTimerFired;
- (void)printTrackedZones;
- (void)setCentralManager:(id)a3;
- (void)setExitTimer:(id)a3;
- (void)setLastTimeScannerStarted:(id)a3;
- (void)setTrackRequests:(id)a3;
- (void)setTrackedZones:(id)a3;
- (void)setZoneExitTimeout:(id)a3;
- (void)startExitTimer;
- (void)unregisterAllZones;
- (void)unregisterZones:(id)a3 forClient:(id)a4;
- (void)unregisterZonesForClient:(id)a3;
- (void)unregisterZonesForClient:(id)a3 updateScanner:(BOOL)a4;
- (void)update;
- (void)updateScanner;
@end

@implementation WPDZoneManager

- (WPDZoneManager)initWithServer:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WPDZoneManager;
  v5 = [(WPDManager *)&v31 initWithServer:v4 Name:@"Zone Central"];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFEF00]);
    v7 = [v4 serverQueue];
    uint64_t v32 = *MEMORY[0x263EFEE80];
    v33[0] = MEMORY[0x263EFFA88];
    v8 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v9 = [v6 initWithDelegate:v5 queue:v7 options:v8];
    centralManager = v5->_centralManager;
    v5->_centralManager = (CBCentralManager *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    trackedZones = v5->_trackedZones;
    v5->_trackedZones = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    trackRequests = v5->_trackRequests;
    v5->_trackRequests = (NSMutableDictionary *)v13;

    zoneExitTimeout = v5->_zoneExitTimeout;
    v5->_zoneExitTimeout = (NSNumber *)&unk_26D646E78;

    v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v17 = [v16 persistentDomainForName:@"com.apple.MobileBluetooth.debug"];
    v18 = [v17 objectForKeyedSubscript:@"WIPROX"];

    v19 = [v18 objectForKeyedSubscript:@"ZoneTrackerTimeout"];
    if (v19)
    {
      objc_storeStrong((id *)&v5->_zoneExitTimeout, v19);
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_10);
      }
      v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDZoneManager initWithServer:]((uint64_t)&v5->_zoneExitTimeout, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    exitTimer = v5->_exitTimer;
    v5->_exitTimer = 0;

    v5->_scanAllowlisted = [(WPDManager *)v5 isScanAllowlistedForType:2];
    v28 = [MEMORY[0x263EFFA08] setWithObject:v5->_centralManager];
    [(WPDManager *)v5 setCbManagers:v28];

    v29 = [v4 wpdState];
    [v29 registerManager:v5->_centralManager];
  }
  return v5;
}

- (void)cleanup
{
  [(WPDZoneManager *)self cancelExitTimer];
  [(WPDZoneManager *)self unregisterAllZones];
  v3.receiver = self;
  v3.super_class = (Class)WPDZoneManager;
  [(WPDManager *)&v3 cleanup];
}

- (id)generateStateDumpStrings
{
  objc_super v3 = (void *)MEMORY[0x263EFF980];
  v22.receiver = self;
  v22.super_class = (Class)WPDZoneManager;
  id v4 = [(WPDManager *)&v22 generateStateDumpStrings];
  v5 = [v3 arrayWithArray:v4];

  if ([(WPDManager *)self isInternalBuild])
  {
    id v6 = NSString;
    BOOL v7 = [(WPDZoneManager *)self scanAllowlisted];
    v8 = "no";
    if (v7) {
      v8 = "yes";
    }
    uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", @"scan allowlisted: %s\n", v8);
    [v5 addObject:v9];
  }
  v10 = NSString;
  uint64_t v11 = [(WPDZoneManager *)self trackRequests];
  v12 = objc_msgSend(v10, "stringWithFormat:", @"trackRequests (%ld):\n", objc_msgSend(v11, "count"));
  [v5 addObject:v12];

  uint64_t v13 = NSString;
  v14 = [(WPDZoneManager *)self trackedZones];
  v15 = objc_msgSend(v13, "stringWithFormat:", @"trackedZones (%ld):\n", objc_msgSend(v14, "count"));
  [v5 addObject:v15];

  v16 = [(WPDZoneManager *)self trackedZones];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __42__WPDZoneManager_generateStateDumpStrings__block_invoke;
  v20[3] = &unk_26469B120;
  id v21 = v5;
  id v17 = v5;
  [v16 enumerateKeysAndObjectsUsingBlock:v20];

  v18 = [MEMORY[0x263EFF8C0] arrayWithArray:v17];

  return v18;
}

void __42__WPDZoneManager_generateStateDumpStrings__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"zone %@: %@\n", a2, a3];
  [v3 addObject:v4];
}

- (void)update
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  switch([(WPDManager *)self state])
  {
    case 0:
    case 2:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_162_0);
      }
      objc_super v3 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = v3;
        v5 = [(WPDZoneManager *)self centralManager];
        v8[0] = 67109120;
        v8[1] = [v5 state];
        _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "Zone Central manager is  unknown, powered off, unauthorized or not supported (%d)", (uint8_t *)v8, 8u);
      }
      break;
    case 1:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_165);
      }
      id v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        BOOL v7 = "Zone Central manager is resetting";
        goto LABEL_14;
      }
      break;
    case 3:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_168_0);
      }
      id v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        BOOL v7 = "Zone Central manager is powered on";
LABEL_14:
        _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v8, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [a5 objectForKeyedSubscript:*MEMORY[0x263EFECB8]];
  v12 = v11;
  if (v11)
  {
    if ((unint64_t)[v11 length] > 3)
    {
      id v15 = v12;
      v16 = (unsigned char *)[v15 bytes];
      if (*v16 == 76 && !v16[1] && v16[2] == 2)
      {
        id v17 = v16 + 4;
        uint64_t v18 = [v15 length] - 4;
        if ([v10 integerValue] < -87 || objc_msgSend(v10, "integerValue") == 127)
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_173_0);
          }
          v19 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            v14 = v19;
            int v20 = [v10 intValue];
            id v21 = [MEMORY[0x263EFF8F8] dataWithBytes:v17 length:v18];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = v20;
            *(_WORD *)&v33[4] = 2112;
            *(void *)&v33[6] = v21;
            _os_log_debug_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEBUG, "RSSI invalid for zone entry (%d dBm - %@)", buf, 0x12u);

            goto LABEL_7;
          }
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_177_1);
          }
          objc_super v22 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v24 = v22;
            uint64_t v25 = [v9 name];
            uint64_t v26 = [MEMORY[0x263EFF8F8] dataWithBytes:v17 length:v18];
            *(_DWORD *)buf = 138412802;
            *(void *)v33 = v25;
            *(_WORD *)&v33[8] = 2112;
            *(void *)&v33[10] = v26;
            __int16 v34 = 2048;
            uint64_t v35 = v18;
            _os_log_debug_impl(&dword_22316D000, v24, OS_LOG_TYPE_DEBUG, "Discovered a zone peripheral %@ with data (%@) of length (%lu)", buf, 0x20u);
          }
          uint64_t v23 = [(WPDZoneManager *)self trackedZones];
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_178;
          v27[3] = &unk_26469B148;
          uint64_t v30 = v18;
          objc_super v31 = v17;
          id v28 = v9;
          v29 = self;
          [v23 enumerateKeysAndObjectsUsingBlock:v27];
        }
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_170);
      }
      uint64_t v13 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        *(_DWORD *)buf = 134218242;
        *(void *)v33 = [v12 length];
        *(_WORD *)&v33[8] = 2112;
        *(void *)&v33[10] = v12;
        _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_INFO, "Zones: Expected minimum advertisement data length: 4, received: %lu, with content: %@", buf, 0x16u);
LABEL_7:
      }
    }
  }
}

void __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [v6 objectForKeyedSubscript:@"kData"];
  unint64_t v8 = *(void *)(a1 + 48);
  if (v8 >= [v7 length])
  {
    id v9 = *(const void **)(a1 + 56);
    id v10 = v7;
    if (!memcmp(v9, (const void *)[v10 bytes], objc_msgSend(v10, "length")))
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_180);
      }
      uint64_t v11 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_178_cold_2(a1, v11);
      }
      v12 = [MEMORY[0x263EFF910] date];
      [v6 setObject:v12 forKeyedSubscript:@"kLastSeen"];

      uint64_t v13 = [v6 objectForKeyedSubscript:@"kInZone"];
      char v14 = [v13 BOOLValue];

      if (v14)
      {
        id v15 = [v6 objectForKeyedSubscript:@"kPendingExit"];
        int v16 = [v15 BOOLValue];

        if (v16)
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_187);
          }
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
            __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_178_cold_1();
          }
          [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"kPendingExit"];
        }
      }
      else
      {
        v27 = v7;
        id v28 = v5;
        [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kInZone"];
        id v17 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a1 + 56) length:*(void *)(a1 + 48)];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v18 = [v6 objectForKeyedSubscript:@"kWPClientUUIDs"];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v30 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v24 = [*(id *)(a1 + 40) server];
              uint64_t v25 = [v24 getClientForUUID:v23];
              [v25 enteredZone:v10 manufacturerData:v17];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v20);
        }

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_184);
        }
        BOOL v7 = v27;
        id v5 = v28;
        uint64_t v26 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v34 = v10;
          __int16 v35 = 2114;
          uint64_t v36 = v17;
          _os_log_impl(&dword_22316D000, v26, OS_LOG_TYPE_DEFAULT, "Entered zone: %{public}@, manufacturer data: %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)centralManager:(id)a3 didLoseZone:(id)a4 mask:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 bytes];
  id v10 = v7;
  uint64_t v11 = [v10 bytes];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_190);
  }
  v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDZoneManager centralManager:didLoseZone:mask:](v12, v10, (uint64_t)v8);
  }
  uint64_t v13 = [(WPDZoneManager *)self trackedZones];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191;
  v16[3] = &unk_26469B170;
  uint64_t v20 = v9;
  uint64_t v21 = v11;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v10;
  id v14 = v10;
  id v15 = v8;
  [v13 enumerateKeysAndObjectsUsingBlock:v16];

  [(WPDZoneManager *)self printTrackedZones];
}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kData"];
  id v6 = (unsigned __int8 *)malloc_type_calloc([*(id *)(a1 + 32) length], 1uLL, 0x100004077774924uLL);
  id v7 = v5;
  memcpy(v6, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_193);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191_cold_4();
  }
  if ([*(id *)(a1 + 32) length])
  {
    unint64_t v8 = 0;
    char v9 = 1;
    do
    {
      if ([v7 length] < v8 && *(unsigned __int8 *)(*(void *)(a1 + 56) + v8) == 255
        || v6[v8] != *(unsigned __int8 *)(*(void *)(a1 + 64) + v8))
      {
        char v9 = 0;
      }
      ++v8;
    }
    while ([*(id *)(a1 + 32) length] > v8);
    free(v6);
    if ((v9 & 1) == 0)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_205);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191_cold_3();
      }
      goto LABEL_39;
    }
  }
  else
  {
    free(v6);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_196);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191_cold_2();
  }
  id v10 = [v4 objectForKeyedSubscript:@"kInZone"];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_199);
    }
    v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v7;
      _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_DEFAULT, "Exited zone: %{public}@", buf, 0xCu);
    }
    [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"kInZone"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v13 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kWPClientUUIDs", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v19 = [*(id *)(a1 + 40) server];
          uint64_t v20 = [v19 getClientForUUID:v18];
          [v20 exitedZone:v7];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_202_0);
    }
    uint64_t v21 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191_cold_1(a1, (uint64_t)v4, v21);
    }
  }
LABEL_39:
}

- (void)printTrackedZones
{
  id v2 = [(WPDZoneManager *)self trackedZones];
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_207_1];
}

void __35__WPDZoneManager_printTrackedZones__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_209_0);
  }
  id v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    __35__WPDZoneManager_printTrackedZones__block_invoke_cold_1((uint64_t)v4, v6, v5);
  }
}

- (BOOL)updateScanner
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if ([(WPDManager *)self state] != 3)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_217_1);
    }
    id v28 = (void *)WiProxLog;
    BOOL v26 = 0;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
      return v26;
    }
    uint64_t v29 = v28;
    long long v30 = [(WPDZoneManager *)self centralManager];
    *(_DWORD *)buf = 67109120;
    LODWORD(v59) = [v30 state];
    _os_log_impl(&dword_22316D000, v29, OS_LOG_TYPE_DEFAULT, "Zones: updateScanner - central is not powered on: %d", buf, 8u);

    return 0;
  }
  if (![(WPDZoneManager *)self scanAllowlisted])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_220_0);
    }
    long long v31 = WiProxLog;
    BOOL v26 = 0;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
      return v26;
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v59 = 2;
    _os_log_impl(&dword_22316D000, v31, OS_LOG_TYPE_DEFAULT, "Zones: not tracking for client type (%ld) when denylisted or not allowlisted", buf, 0xCu);
    return 0;
  }
  objc_super v3 = [(WPDZoneManager *)self centralManager];
  [v3 stopScan];

  id v4 = [(WPDZoneManager *)self trackedZones];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    [(WPDZoneManager *)self cancelExitTimer];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_223_1);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDZoneManager updateScanner]();
    }
    return 0;
  }
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [(WPDZoneManager *)self trackedZones];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __31__WPDZoneManager_updateScanner__block_invoke_224;
  v56[3] = &unk_26469B120;
  id v8 = v6;
  id v57 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v56];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  char v9 = [(WPDZoneManager *)self trackRequests];
  id v10 = [v9 allValues];

  uint64_t v42 = [v10 countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (!v42)
  {

    goto LABEL_49;
  }
  id v39 = v8;
  id obj = v10;
  uint64_t v41 = *(void *)v53;
  uint64_t v11 = 0xFFFFLL;
  uint64_t v12 = 0xFFFFLL;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v53 != v41) {
        objc_enumerationMutation(obj);
      }
      uint64_t v43 = v13;
      uint64_t v14 = *(void **)(*((void *)&v52 + 1) + 8 * v13);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v15 = objc_msgSend(v14, "allValues", v39);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v64 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v49 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            uint64_t v21 = [(WPDManager *)self server];
            if ([v21 screenOff])
            {
              long long v22 = (uint64_t *)&v46;
              if (!v20) {
                goto LABEL_22;
              }
              [v20 scanningRates];
              uint64_t v23 = v47;
            }
            else
            {
              long long v22 = &v45;
              if (!v20)
              {
LABEL_22:
                *long long v22 = 0;
                v22[1] = 0;
                v22[2] = 0;

                uint64_t v24 = 0;
                v11 &= v11 >> 63;
                uint64_t v44 = 0;
                goto LABEL_23;
              }
              [v20 scanningRates];
              uint64_t v23 = v45;
            }

            if (v23 < v11) {
              uint64_t v11 = v23;
            }
            [v20 scanningRates];
            uint64_t v24 = v44;
LABEL_23:
            if (v24 < v12) {
              uint64_t v12 = v24;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v64 count:16];
        }
        while (v17);
      }

      uint64_t v13 = v43 + 1;
    }
    while (v43 + 1 != v42);
    uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v65 count:16];
  }
  while (v42);

  id v8 = v39;
  if (v11 < 0xFFFF)
  {
    if (v12 < 0xFFFF)
    {
      long long v32 = [(WPDZoneManager *)self centralManager];
      uint64_t v33 = *MEMORY[0x263EFEE70];
      v62[0] = *MEMORY[0x263EFEDF0];
      v62[1] = v33;
      v63[0] = v39;
      v63[1] = MEMORY[0x263EFFA88];
      v62[2] = *MEMORY[0x263EFEDD8];
      id v34 = [NSNumber numberWithInteger:v12];
      v63[2] = v34;
      v62[3] = *MEMORY[0x263EFEDC8];
      __int16 v35 = [NSNumber numberWithInteger:v11];
      v63[3] = v35;
      uint64_t v36 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:4];
      [v32 scanForPeripheralsWithServices:0 options:v36];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_233_0);
      }
      v37 = WiProxLog;
      id v8 = v39;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v59 = v12;
        __int16 v60 = 2048;
        uint64_t v61 = v11;
        _os_log_impl(&dword_22316D000, v37, OS_LOG_TYPE_DEFAULT, "Started scan for zones %ld (Window) %ld (Interval)", buf, 0x16u);
      }
      [(WPDZoneManager *)self startExitTimer];
      BOOL v26 = 1;
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_229_0);
      }
      long long v25 = WiProxLog;
      BOOL v26 = 0;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v27 = "Scanning window is too high or not set - not scanning";
        goto LABEL_53;
      }
    }
    goto LABEL_59;
  }
LABEL_49:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_226_0);
  }
  long long v25 = WiProxLog;
  BOOL v26 = 0;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v27 = "Scanning rate is too high or not set - not scanning";
LABEL_53:
    _os_log_impl(&dword_22316D000, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    BOOL v26 = 0;
  }
LABEL_59:

  return v26;
}

void __31__WPDZoneManager_updateScanner__block_invoke_224(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 objectForKeyedSubscript:@"kData"];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  unint64_t v4 = -1;
  do
    ++v4;
  while ([v5 length] > v4);
}

- (void)startExitTimer
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = a1;
  unint64_t v4 = [a2 lastTimeScannerStarted];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22316D000, v3, OS_LOG_TYPE_ERROR, "startExitTimer failed to start: (%@)", v5, 0xCu);
}

void __32__WPDZoneManager_startExitTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained exitTimerFired];
    [v2 setExitTimer:0];
    id WeakRetained = v2;
  }
}

- (void)cancelExitTimer
{
  objc_super v3 = [(WPDZoneManager *)self exitTimer];

  if (v3)
  {
    unint64_t v4 = [(WPDZoneManager *)self exitTimer];
    intptr_t v5 = dispatch_source_testcancel(v4);

    if (!v5)
    {
      uint64_t v6 = [(WPDZoneManager *)self exitTimer];
      dispatch_source_cancel(v6);
    }
    [(WPDZoneManager *)self setExitTimer:0];
  }
}

- (void)exitTimerFired
{
  id v5 = a2;
  uint64_t v6 = [a3 lastTimeScannerStarted];
  [a1 timeIntervalSinceDate:v6];
  OUTLINED_FUNCTION_20(&dword_22316D000, v7, v8, "exitTimerFired: (%@) - delta: %f", v9, v10, v11, v12, 2u);
}

void __32__WPDZoneManager_exitTimerFired__block_invoke_241(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kInZone"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"kLastSeen"];
    uint64_t v8 = [*(id *)(a1 + 32) lastTimeScannerStarted];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    if (v10 < 0.0)
    {
      [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"kInZone"];
      uint64_t v11 = [v4 objectForKeyedSubscript:@"kData"];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v12 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kWPClientUUIDs", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            uint64_t v18 = [*(id *)(a1 + 32) server];
            id v19 = [v18 getClientForUUID:v17];
            [v19 exitedZone:v11];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v14);
      }

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_243);
      }
      uint64_t v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        BOOL v26 = v7;
        __int16 v27 = 2114;
        id v28 = v11;
        _os_log_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEFAULT, "Too long since last seen (%{public}@). Exiting zone: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
}

- (void)addSingleZoneTrackingRequest:(id)a3 forClient:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 zones];
  double v9 = [v8 anyObject];
  double v10 = [v9 description];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_245_0);
  }
  uint64_t v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v10;
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "Adding zone %@", buf, 0xCu);
  }
  uint64_t v12 = [(WPDZoneManager *)self trackRequests];
  uint64_t v13 = [v12 objectForKeyedSubscript:v7];

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v14 = [(WPDZoneManager *)self trackRequests];
    [v14 setObject:v13 forKey:v7];
  }
  [v13 setObject:v6 forKey:v10];
  uint64_t v15 = [(WPDZoneManager *)self trackedZones];
  uint64_t v16 = [v15 objectForKeyedSubscript:v10];

  if (v16)
  {
    uint64_t v17 = [v16 objectForKeyedSubscript:@"kWPClientUUIDs"];
    [v17 addObject:v7];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_248_0);
    }
    uint64_t v18 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      uint64_t v20 = [(WPDZoneManager *)self trackedZones];
      uint64_t v21 = [v20 count];
      long long v22 = [(WPDZoneManager *)self trackedZones];
      *(_DWORD *)buf = 138413058;
      id v37 = v7;
      __int16 v38 = 2114;
      id v39 = v10;
      __int16 v40 = 2048;
      uint64_t v41 = v21;
      __int16 v42 = 2114;
      uint64_t v43 = v22;
      _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "Added client %@ to zone %{public}@. Currently tracking %ld zones %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    long long v23 = [MEMORY[0x263EFF9C0] setWithObject:v7];
    long long v24 = (void *)MEMORY[0x263EFF9A0];
    long long v25 = objc_msgSend(v6, "zones", @"kData");
    BOOL v26 = [v25 anyObject];
    v35[0] = v26;
    v35[1] = MEMORY[0x263EFFA80];
    v34[1] = @"kInZone";
    v34[2] = @"kWPClientUUIDs";
    v35[2] = v23;
    __int16 v27 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
    uint64_t v16 = [v24 dictionaryWithDictionary:v27];

    id v28 = [(WPDZoneManager *)self trackedZones];
    [v28 setObject:v16 forKey:v10];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_252_0);
    }
    uint64_t v29 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = v29;
      long long v31 = [(WPDZoneManager *)self trackedZones];
      uint64_t v32 = [v31 count];
      uint64_t v33 = [(WPDZoneManager *)self trackedZones];
      *(_DWORD *)buf = 138544130;
      id v37 = v10;
      __int16 v38 = 2112;
      id v39 = v7;
      __int16 v40 = 2048;
      uint64_t v41 = v32;
      __int16 v42 = 2114;
      uint64_t v43 = v33;
      _os_log_impl(&dword_22316D000, v30, OS_LOG_TYPE_DEFAULT, "Added zone %{public}@ for client %@. Currently tracking %ld zones %{public}@", buf, 0x2Au);
    }
  }
}

- (id)addZoneTrackingRequest:(id)a3 forClient:(id)a4
{
  v82[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(WPDManager *)self state] == 3)
  {
    long long v53 = self;
    id v8 = objc_alloc(MEMORY[0x263EFF9C0]);
    double v9 = [v6 zones];
    double v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    uint64_t v11 = [v6 zones];
    uint64_t v12 = [v11 count];

    uint64_t v13 = v10;
    if (v12 == 1)
    {
      [v10 addObject:v6];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_261);
      }
      uint64_t v18 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v18;
        uint64_t v20 = [v6 zones];
        *(_DWORD *)buf = 134217984;
        uint64_t v72 = [v20 count];
        _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "Multiple zones in one request, breaking down into %ld one-zone-per-request", buf, 0xCu);
      }
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      uint64_t v21 = objc_msgSend(v6, "zones", v7);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v80 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v67 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v66 + 1) + 8 * i);
            __int16 v27 = objc_opt_new();
            objc_msgSend(v27, "setClientType:", objc_msgSend(v6, "clientType"));
            if (v6)
            {
              [v6 scanningRates];
            }
            else
            {
              long long v64 = 0uLL;
              uint64_t v65 = 0;
            }
            long long v62 = v64;
            uint64_t v63 = v65;
            [v27 setScanningRates:&v62];
            id v28 = [MEMORY[0x263EFF9C0] setWithObject:v26];
            [v27 setZones:v28];

            [v10 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v66 objects:v80 count:16];
        }
        while (v23);
      }

      id v7 = v52;
    }
    uint64_t v29 = [(WPDZoneManager *)v53 trackedZones];
    uint64_t v30 = [v29 allKeys];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v31 = [v6 zones];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v58 objects:v79 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = 0;
      uint64_t v35 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v59 != v35) {
            objc_enumerationMutation(v31);
          }
          id v37 = [*(id *)(*((void *)&v58 + 1) + 8 * j) description];
          v34 += [v30 containsObject:v37] ^ 1;
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v58 objects:v79 count:16];
      }
      while (v33);
    }
    else
    {
      uint64_t v34 = 0;
    }

    __int16 v38 = [(WPDZoneManager *)v53 trackedZones];
    uint64_t v39 = 30 - [v38 count];

    if (v39 >= v34)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      __int16 v42 = v13;
      id v46 = v13;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v54 objects:v70 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v55;
        do
        {
          for (uint64_t k = 0; k != v48; ++k)
          {
            if (*(void *)v55 != v49) {
              objc_enumerationMutation(v46);
            }
            [(WPDZoneManager *)v53 addSingleZoneTrackingRequest:*(void *)(*((void *)&v54 + 1) + 8 * k) forClient:v7];
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v54 objects:v70 count:16];
        }
        while (v48);
      }

      [(WPDZoneManager *)v53 updateScanner];
      uint64_t v16 = 0;
    }
    else
    {
      __int16 v40 = (void *)MEMORY[0x263F087E8];
      uint64_t v77 = *MEMORY[0x263F08320];
      v78 = @"Tracking the maximum number of zones available within the chips";
      uint64_t v41 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      uint64_t v16 = [v40 errorWithDomain:@"WPErrorDomain" code:4 userInfo:v41];

      __int16 v42 = v13;
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_268);
      }
      uint64_t v43 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = v43;
        uint64_t v45 = [v6 zones];
        *(_DWORD *)buf = 138543874;
        uint64_t v72 = (uint64_t)v45;
        __int16 v73 = 2048;
        uint64_t v74 = v34;
        __int16 v75 = 2048;
        uint64_t v76 = v39;
        _os_log_impl(&dword_22316D000, v44, OS_LOG_TYPE_DEFAULT, "Could not add zones (%{public}@): asked to add %ld, can only add %ld new zones", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v81 = *MEMORY[0x263F08320];
    v82[0] = @"CoreBluetooth is currently powered off";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v82 forKeys:&v81 count:1];
    uint64_t v16 = [v14 errorWithDomain:@"WPErrorDomain" code:1 userInfo:v15];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_258);
    }
    uint64_t v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDZoneManager addZoneTrackingRequest:forClient:](v17, self);
    }
  }

  return v16;
}

- (void)unregisterZones:(id)a3 forClient:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v45 = a4;
  if (v6 && [v6 count])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_270);
    }
    id v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v56 = (uint64_t)v6;
      __int16 v57 = 2112;
      uint64_t v58 = (uint64_t)v45;
      _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "Unregistering zones: %{public}@ for client %@", buf, 0x16u);
    }
    id v8 = [(WPDZoneManager *)self trackRequests];
    double v9 = [v8 objectForKeyedSubscript:v45];

    if (v9)
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v64 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v52 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = [*(id *)(*((void *)&v51 + 1) + 8 * i) description];
            [v9 removeObjectForKey:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v51 objects:v64 count:16];
        }
        while (v12);
      }

      if (![v9 count])
      {
        uint64_t v16 = [(WPDZoneManager *)self trackRequests];
        [v16 removeObjectForKey:v45];
      }
    }
    __int16 v42 = v9;
    id v43 = v6;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v6;
    uint64_t v17 = [obj countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v46 = *(void *)v48;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v48 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v19), "description", v42, v43);
          uint64_t v21 = [(WPDZoneManager *)self trackedZones];
          uint64_t v22 = [v21 objectForKeyedSubscript:v20];

          if (v22)
          {
            uint64_t v23 = [v22 objectForKeyedSubscript:@"kWPClientUUIDs"];
            uint64_t v24 = v23;
            if (!v23) {
              goto LABEL_29;
            }
            [v23 removeObject:v45];
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_273);
            }
            long long v25 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v26 = v25;
              __int16 v27 = [(WPDZoneManager *)self trackedZones];
              uint64_t v28 = [v27 count];
              uint64_t v29 = [(WPDZoneManager *)self trackedZones];
              *(_DWORD *)buf = 138413058;
              uint64_t v56 = (uint64_t)v45;
              __int16 v57 = 2114;
              uint64_t v58 = (uint64_t)v20;
              __int16 v59 = 2048;
              uint64_t v60 = v28;
              __int16 v61 = 2114;
              long long v62 = v29;
              _os_log_impl(&dword_22316D000, v26, OS_LOG_TYPE_DEFAULT, "Removed client %@ from zone (%{public}@), currently tracking %ld zones %{public}@ ", buf, 0x2Au);
            }
            if (![v24 count])
            {
LABEL_29:
              uint64_t v30 = [(WPDZoneManager *)self trackedZones];
              [v30 removeObjectForKey:v20];

              if (WPLogInitOnce != -1) {
                dispatch_once(&WPLogInitOnce, &__block_literal_global_276_0);
              }
              long long v31 = (void *)WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v32 = v31;
                uint64_t v33 = [(WPDZoneManager *)self trackedZones];
                uint64_t v34 = [v33 count];
                uint64_t v35 = [(WPDZoneManager *)self trackedZones];
                *(_DWORD *)buf = 138543874;
                uint64_t v56 = (uint64_t)v20;
                __int16 v57 = 2048;
                uint64_t v58 = v34;
                __int16 v59 = 2114;
                uint64_t v60 = (uint64_t)v35;
                _os_log_impl(&dword_22316D000, v32, OS_LOG_TYPE_DEFAULT, "Removed zone (%{public}@), currently tracking %ld zones %{public}@ ", buf, 0x20u);
              }
            }
          }
          ++v19;
        }
        while (v18 != v19);
        uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v63 count:16];
      }
      while (v18);
    }

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_279_0);
    }
    uint64_t v36 = v42;
    id v6 = v43;
    id v37 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v38 = v37;
      uint64_t v39 = [(WPDZoneManager *)self trackedZones];
      uint64_t v40 = [v39 count];
      uint64_t v41 = [(WPDZoneManager *)self trackedZones];
      *(_DWORD *)buf = 134218242;
      uint64_t v56 = v40;
      __int16 v57 = 2114;
      uint64_t v58 = (uint64_t)v41;
      _os_log_impl(&dword_22316D000, v38, OS_LOG_TYPE_DEFAULT, "Now tracking %ld zones: %{public}@", buf, 0x16u);
    }
    [(WPDZoneManager *)self updateScanner];
  }
}

- (void)unregisterZonesForClient:(id)a3
{
}

- (void)unregisterZonesForClient:(id)a3 updateScanner:(BOOL)a4
{
  BOOL v20 = a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v21 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_281_1);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDZoneManager unregisterZonesForClient:updateScanner:]();
  }
  id v5 = [(WPDZoneManager *)self trackRequests];
  BOOL v6 = [v5 count] == 0;

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_284_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDZoneManager unregisterZonesForClient:updateScanner:]();
    }
  }
  else
  {
    id v7 = [(WPDZoneManager *)self trackRequests];
    [v7 removeObjectForKey:v21];

    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__1;
    uint64_t v33 = __Block_byref_object_dispose__1;
    id v34 = 0;
    id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v8 = [(WPDZoneManager *)self trackedZones];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __57__WPDZoneManager_unregisterZonesForClient_updateScanner___block_invoke_285;
    v26[3] = &unk_26469B1E0;
    id v27 = v21;
    uint64_t v28 = &v29;
    [v8 enumerateKeysAndObjectsUsingBlock:v26];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = (id)v30[5];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v12);
          uint64_t v14 = [(WPDZoneManager *)self trackedZones];
          [v14 removeObjectForKey:v13];

          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_290);
          }
          uint64_t v15 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v36 = v13;
            _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_DEFAULT, "Removed zone (%{public}@)", buf, 0xCu);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v39 count:16];
      }
      while (v10);
    }

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_293);
    }
    uint64_t v16 = (id)WiProxLog;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(WPDZoneManager *)self trackedZones];
      uint64_t v18 = [v17 count];
      uint64_t v19 = [(WPDZoneManager *)self trackedZones];
      *(_DWORD *)buf = 134218242;
      uint64_t v36 = v18;
      __int16 v37 = 2114;
      __int16 v38 = v19;
      _os_log_impl(&dword_22316D000, v16, OS_LOG_TYPE_DEFAULT, "Now tracking %ld zones: %{public}@", buf, 0x16u);
    }
    if (v20) {
      [(WPDZoneManager *)self updateScanner];
    }

    _Block_object_dispose(&v29, 8);
  }
}

void __57__WPDZoneManager_unregisterZonesForClient_updateScanner___block_invoke_285(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  BOOL v6 = [a3 objectForKeyedSubscript:@"kWPClientUUIDs"];
  id v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  [v6 removeObject:*(void *)(a1 + 32)];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_287_0);
  }
  id v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Removed client %@ from zone %{public}@", (uint8_t *)&v10, 0x16u);
  }
  if (![v7 count]) {
LABEL_7:
  }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
}

- (id)getAllZones
{
  id v2 = NSDictionary;
  objc_super v3 = [(WPDZoneManager *)self trackedZones];
  id v4 = [v2 dictionaryWithDictionary:v3];

  return v4;
}

- (void)unregisterAllZones
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "Unregistering all requests", v2, v3, v4, v5, v6);
}

- (NSMutableDictionary)trackRequests
{
  return self->_trackRequests;
}

- (void)setTrackRequests:(id)a3
{
}

- (NSMutableDictionary)trackedZones
{
  return self->_trackedZones;
}

- (void)setTrackedZones:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCentralManager:(id)a3
{
}

- (OS_dispatch_source)exitTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExitTimer:(id)a3
{
}

- (NSNumber)zoneExitTimeout
{
  return self->_zoneExitTimeout;
}

- (void)setZoneExitTimeout:(id)a3
{
}

- (NSDate)lastTimeScannerStarted
{
  return self->_lastTimeScannerStarted;
}

- (void)setLastTimeScannerStarted:(id)a3
{
}

- (BOOL)scanAllowlisted
{
  return self->_scanAllowlisted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTimeScannerStarted, 0);
  objc_storeStrong((id *)&self->_zoneExitTimeout, 0);
  objc_storeStrong((id *)&self->_exitTimer, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_trackedZones, 0);
  objc_storeStrong((id *)&self->_trackRequests, 0);
}

- (void)initWithServer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_178_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "Double entry for %@", v2, v3, v4, v5, v6);
}

void __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_178_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 name];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_20(&dword_22316D000, v5, v6, "Discovered a tracked zone peripheral %@ (%@)", v7, v8, v9, v10, v11);
}

- (void)centralManager:(void *)a1 didLoseZone:(void *)a2 mask:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  v6[0] = 67109634;
  v6[1] = [a2 length];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_debug_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEBUG, "Received zone lost: %d\n%@\n%@", (uint8_t *)v6, 0x1Cu);
}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "Exiting a zone we're not meant to be in:\n%@\n%@)", (uint8_t *)&v4, 0x16u);
}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "match", v2, v3, v4, v5, v6);
}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "no match", v2, v3, v4, v5, v6);
}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_191_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "zoneData: %@", v2, v3, v4, v5, v6);
}

void __35__WPDZoneManager_printTrackedZones__block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint8_t v6 = [a3 objectForKeyedSubscript:@"kInZone"];
  if ([v6 BOOLValue]) {
    uint64_t v7 = @"IN";
  }
  else {
    uint64_t v7 = @"OUT";
  }
  uint64_t v8 = [a3 objectForKeyedSubscript:@"kLastSeen"];
  int v9 = 138412802;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  __int16 v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEBUG, "\t%@: %@ last:%@", (uint8_t *)&v9, 0x20u);
}

- (void)updateScanner
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "No zones left to track", v2, v3, v4, v5, v6);
}

- (void)addZoneTrackingRequest:(void *)a1 forClient:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 state];
  _os_log_error_impl(&dword_22316D000, v3, OS_LOG_TYPE_ERROR, "Failed to start tracking a zone - central is not powered on %d", (uint8_t *)v4, 8u);
}

- (void)unregisterZonesForClient:updateScanner:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22316D000, v0, v1, "No zones tracked for any client", v2, v3, v4, v5, v6);
}

- (void)unregisterZonesForClient:updateScanner:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "Unregistering all zones for client %@", v2, v3, v4, v5, v6);
}

@end