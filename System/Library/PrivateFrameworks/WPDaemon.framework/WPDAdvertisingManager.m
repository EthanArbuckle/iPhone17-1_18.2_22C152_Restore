@interface WPDAdvertisingManager
- (AdvMetrics)advMetrics;
- (BOOL)addressChangeNotificationNeeded:(id)a3 advertiserTypeString:(id)a4;
- (BOOL)allowCompoundAdvertisements;
- (BOOL)heySiriAdvertActive:(BOOL)a3;
- (BOOL)heySiriAdvertActiveAllDevices;
- (BOOL)isAdvertiserTestMode;
- (BOOL)isRanging;
- (BOOL)platformSupportsMultipleAdvertising;
- (CBPeripheralManager)connectablePeripheralManager;
- (CBPeripheralManager)nonConnectablePeripheralManager;
- (CBPeripheralManager)nonConnectableSecondaryPeripheralManager;
- (NSIndexSet)rangingTypes;
- (NSMutableDictionary)clientAdvertisingRequests;
- (NSMutableDictionary)preallocatedServices;
- (NSMutableDictionary)publishedServices;
- (NSMutableIndexSet)currentAdvertisers;
- (NSMutableSet)clientsToNotifyOnAddressChange;
- (NSMutableSet)rangingClients;
- (WPAdvertisingRequestsQueue)advertisingRequests;
- (WPDAdvertisingData)currentConnectableAdvertisingData;
- (WPDAdvertisingData)currentNonConnectableAdvertisingData;
- (WPDAdvertisingData)currentNonConnectableSecondaryAdvertisingData;
- (WPDAdvertisingManager)initWithServer:(id)a3;
- (id)NSUUIDfromCBUUID:(id)a3;
- (id)addAdvertisingRequest:(id)a3 forClient:(id)a4;
- (id)addXPCDelayTiming:(id)a3 IsMetricOnly:(BOOL)a4 UseCase:(unint64_t)a5 timeStamp:(unint64_t)a6;
- (id)advertisingRules;
- (id)clientForAdvRequest:(id)a3;
- (id)generateStateDumpStrings;
- (id)getCharacteristicForClient:(id)a3;
- (id)getClientUUIDsForCharacteristic:(id)a3;
- (id)getCurrentAdvertisers;
- (id)removeAdvertisingRequest:(id)a3 forClient:(id)a4;
- (id)removeAdvertisingRequest:(id)a3 forClient:(id)a4 shouldUpdate:(BOOL)a5;
- (id)removeAdvertisingRequestsForClient:(id)a3;
- (id)requestFromAdvertisingDataFromInstance:(int64_t)a3 AddressChangeNotificationNeeded:(BOOL)a4;
- (int)maxAdvertisingRules;
- (unint64_t)connectableAdvDropCount;
- (unint64_t)connectableAdvTotalCount;
- (unint64_t)nonConnectableAdvDropCount;
- (unint64_t)nonConnectableAdvTotalCount;
- (void)addAdvertisingRequest:(id)a3 forDaemon:(id)a4;
- (void)addCharacteristic:(id)a3 Properties:(unint64_t)a4 Permissions:(unint64_t)a5 Service:(id)a6 Name:(id)a7;
- (void)addCharacteristic:(id)a3 forService:(id)a4 forClient:(id)a5;
- (void)enableRanging:(BOOL)a3 forClient:(id)a4;
- (void)informClientsAdvertisingPending:(id)a3;
- (void)isAdvertiserTestMode;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4;
- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3;
- (void)preallocateServices;
- (void)removeAdvertisingRequest:(id)a3 forDaemon:(id)a4;
- (void)removeServiceForClient:(id)a3;
- (void)resetAdvertisingManager;
- (void)setAdvMetrics:(id)a3;
- (void)setAdvertisingRequests:(id)a3;
- (void)setAllowCompoundAdvertisements:(BOOL)a3;
- (void)setClientAdvertisingRequests:(id)a3;
- (void)setClientsToNotifyOnAddressChange:(id)a3;
- (void)setConnectableAdvDropCount:(unint64_t)a3;
- (void)setConnectableAdvTotalCount:(unint64_t)a3;
- (void)setConnectablePeripheralManager:(id)a3;
- (void)setCurrentAdvertisers:(id)a3;
- (void)setCurrentConnectableAdvertisingData:(id)a3;
- (void)setCurrentNonConnectableAdvertisingData:(id)a3;
- (void)setCurrentNonConnectableSecondaryAdvertisingData:(id)a3;
- (void)setNonConnectableAdvDropCount:(unint64_t)a3;
- (void)setNonConnectableAdvTotalCount:(unint64_t)a3;
- (void)setNonConnectablePeripheralManager:(id)a3;
- (void)setNonConnectableSecondaryPeripheralManager:(id)a3;
- (void)setPreallocatedServices:(id)a3;
- (void)setPublishedServices:(id)a3;
- (void)setRangingClients:(id)a3;
- (void)statsExportTimerFired;
- (void)update;
- (void)updateAdvertiser;
@end

@implementation WPDAdvertisingManager

void __45__WPDAdvertisingManager_clientForAdvRequest___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __46__WPDAdvertisingManager_getCurrentAdvertisers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%lu ", a2);
}

void __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_2_419(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    v10 = &WPLogInitOnce;
    uint64_t v11 = *(void *)v28;
    *(void *)&long long v8 = 67109378;
    long long v25 = v8;
    do
    {
      uint64_t v12 = 0;
      uint64_t v26 = v9;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v12), "clientType", v25) == *(unsigned __int8 *)(a1 + 48))
        {
          v13 = [*(id *)(a1 + 32) server];
          v14 = [v13 getClientForUUID:v5];

          if (*v10 != -1) {
            dispatch_once(v10, &__block_literal_global_421_0);
          }
          v15 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = v11;
            id v17 = v6;
            id v18 = v5;
            v19 = v10;
            int v20 = *(unsigned __int8 *)(a1 + 48);
            v21 = *(void **)(a1 + 40);
            v22 = v15;
            v23 = [v21 localizedDescription];
            *(_DWORD *)buf = v25;
            int v32 = v20;
            v10 = v19;
            id v5 = v18;
            id v6 = v17;
            uint64_t v11 = v16;
            __int16 v33 = 2112;
            v34 = v23;
            _os_log_impl(&dword_22316D000, v22, OS_LOG_TYPE_DEFAULT, "Started to advertise for type %d with error %@", buf, 0x12u);

            uint64_t v9 = v26;
          }
          uint64_t v24 = *(void *)(a1 + 40);
          if (v24) {
            [v14 advertisingFailedToStart:v24 ofType:*(unsigned __int8 *)(a1 + 48)];
          }
          else {
            [v14 advertisingStartedOfType:*(unsigned __int8 *)(a1 + 48)];
          }
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v9);
  }
}

- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_423);
  }
  long long v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    v10 = [v7 localizedDescription];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "[Privacy] Did stop advertising with error: %@", (uint8_t *)&buf, 0xCu);
  }
  if ([v7 code] == 8)
  {
    uint64_t v11 = [(WPDAdvertisingManager *)self clientsToNotifyOnAddressChange];
    BOOL v12 = [v11 count] == 0;

    if (v12)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_426);
      }
      v22 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDAdvertisingManager peripheralManager:didStopAdvertisingWithError:](v22);
      }
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__4;
      v43 = __Block_byref_object_dispose__4;
      id v44 = 0;
      id v44 = [MEMORY[0x263EFF9C0] set];
      v13 = [(WPDAdvertisingManager *)self advertisingRequests];
      v14 = [v13 allRequests];

      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_427;
      v30[3] = &unk_26469B7C0;
      v30[4] = self;
      v30[5] = &buf;
      [v14 enumerateObjectsUsingBlock:v30];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_430_0);
      }
      v15 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)uint64_t v36 = 138412546;
        *(void *)&v36[4] = v14;
        *(_WORD *)&v36[12] = 2112;
        *(void *)&v36[14] = v16;
        _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_DEFAULT, "[Privacy] current all adv requests: %@, advRequestsToRemove: %@", v36, 0x16u);
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_433);
      }
      id v17 = (id)WiProxLog;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(WPDAdvertisingManager *)self clientAdvertisingRequests];
        *(_DWORD *)uint64_t v36 = 138412290;
        *(void *)&v36[4] = v18;
        _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "[Privacy] advertising clients: %@", v36, 0xCu);
      }
      id v19 = [(WPDAdvertisingManager *)self nonConnectablePeripheralManager];
      if (v19 == v6)
      {
        BOOL v21 = 0;
      }
      else if (+[WPDaemonServer supportsNC2AdvertisingInstance])
      {
        id v20 = [(WPDAdvertisingManager *)self nonConnectableSecondaryPeripheralManager];
        BOOL v21 = v20 != v6;
      }
      else
      {
        BOOL v21 = 1;
      }

      *(void *)uint64_t v36 = 0;
      *(void *)&v36[8] = v36;
      *(void *)&v36[16] = 0x3032000000;
      v37 = __Block_byref_object_copy__4;
      v38 = __Block_byref_object_dispose__4;
      id v39 = 0;
      id v39 = [MEMORY[0x263EFF9A0] dictionary];
      v23 = *(void **)(*((void *)&buf + 1) + 40);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_434;
      v28[3] = &unk_26469B810;
      BOOL v29 = v21;
      v28[4] = self;
      v28[5] = v36;
      [v23 enumerateObjectsUsingBlock:v28];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_437);
      }
      uint64_t v24 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(*(void *)&v36[8] + 40);
        LODWORD(v31) = 138412290;
        *(void *)((char *)&v31 + 4) = v25;
        _os_log_impl(&dword_22316D000, v24, OS_LOG_TYPE_DEFAULT, "[Privacy] advClientRequestsToRemoveDict: %@", (uint8_t *)&v31, 0xCu);
      }
      *(void *)&long long v31 = 0;
      *((void *)&v31 + 1) = &v31;
      uint64_t v32 = 0x3032000000;
      __int16 v33 = __Block_byref_object_copy__4;
      v34 = __Block_byref_object_dispose__4;
      id v35 = 0;
      uint64_t v26 = *(void **)(*(void *)&v36[8] + 40);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_438;
      v27[3] = &unk_26469B838;
      v27[4] = self;
      v27[5] = &v31;
      [v26 enumerateKeysAndObjectsUsingBlock:v27];
      _Block_object_dispose(&v31, 8);

      _Block_object_dispose(v36, 8);
      _Block_object_dispose(&buf, 8);
    }
  }
}

- (id)removeAdvertisingRequest:(id)a3 forClient:(id)a4
{
  return [(WPDAdvertisingManager *)self removeAdvertisingRequest:a3 forClient:a4 shouldUpdate:1];
}

void __41__WPDAdvertisingManager_advertisingRules__block_invoke_369(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 currentAdvertisers];
  uint64_t v4 = [v3 integerValue];

  [v5 addIndex:v4];
}

void __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_418(uint64_t a1, void *a2)
{
  char v3 = [a2 integerValue];
  uint64_t v4 = [*(id *)(a1 + 32) clientAdvertisingRequests];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_2_419;
  v6[3] = &unk_26469B770;
  char v8 = v3;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __41__WPDAdvertisingManager_updateAdvertiser__block_invoke_339(uint64_t a1, void *a2)
{
  id v10 = a2;
  char v3 = [v10 objectForKeyedSubscript:*MEMORY[0x263EFECA0]];
  if (![v3 BOOLValue])
  {

    goto LABEL_5;
  }
  BOOL v4 = +[WPDaemonServer supportsNC2AdvertisingInstance];

  if (!v4)
  {
LABEL_5:
    id v6 = [v10 objectForKeyedSubscript:*MEMORY[0x263EFEC98]];
    int v7 = [v6 BOOLValue];

    char v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 connectablePeripheralManager];
    }
    else {
    id v5 = [v8 nonConnectablePeripheralManager];
    }
    goto LABEL_9;
  }
  id v5 = [*(id *)(a1 + 32) nonConnectableSecondaryPeripheralManager];
LABEL_9:
  uint64_t v9 = v5;
  [v5 startAdvertising:v10];
}

- (id)addAdvertisingRequest:(id)a3 forClient:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 clientType];
  uint64_t v9 = [v6 advertisingData];
  unint64_t v10 = [v9 length];

  if (v10 < 0x17)
  {
    if ([(WPDManager *)self state] == 3)
    {
      uint64_t v15 = [v6 clientType];
      uint64_t v16 = [(WPDManager *)self server];
      id v17 = [v16 statsManager];
      [v17 startActivity:1 forType:v15];

      id v18 = [(WPDManager *)self server];
      id v19 = [v18 statsManager];
      [v19 resetActivity:1 forType:v15];

      id v20 = [(WPDAdvertisingManager *)self advertisingRequests];
      int v21 = [v20 isAdvertisingForClientType:v8];

      if (v21) {
        id v22 = [(WPDAdvertisingManager *)self removeAdvertisingRequest:v6 forClient:v7 shouldUpdate:0];
      }
      v23 = [(WPDAdvertisingManager *)self advertisingRequests];
      [v23 add:v6];

      uint64_t v24 = [(WPDAdvertisingManager *)self clientAdvertisingRequests];
      uint64_t v25 = [v24 objectForKeyedSubscript:v7];

      if (!v25)
      {
        uint64_t v26 = [MEMORY[0x263EFF9C0] set];
        long long v27 = [(WPDAdvertisingManager *)self clientAdvertisingRequests];
        [v27 setObject:v26 forKeyedSubscript:v7];
      }
      long long v28 = [(WPDAdvertisingManager *)self clientAdvertisingRequests];
      BOOL v29 = [v28 objectForKeyedSubscript:v7];
      [v29 addObject:v6];

      [(WPDAdvertisingManager *)self updateAdvertiser];
      v13 = 0;
    }
    else
    {
      long long v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F08320];
      id v35 = @"CoreBluetooth is currently powered off";
      long long v31 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      v13 = [v30 errorWithDomain:@"WPErrorDomain" code:1 userInfo:v31];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_312_0);
      }
      uint64_t v32 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDAdvertisingManager addAdvertisingRequest:forClient:](v32, v6, self);
      }
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37[0] = @"The payload size is too large";
    BOOL v12 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    v13 = [v11 errorWithDomain:@"WPErrorDomain" code:12 userInfo:v12];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_306_0);
    }
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDAdvertisingManager addAdvertisingRequest:forClient:](v14);
    }
  }

  return v13;
}

- (id)advertisingRules
{
  uint64_t v155 = *MEMORY[0x263EF8340];
  char v3 = [(WPDAdvertisingManager *)self advertisingRequests];
  id v4 = (id)[v3 count];

  if (!v4) {
    goto LABEL_146;
  }
  id v5 = objc_opt_new();
  v118 = objc_opt_new();
  v125 = objc_opt_new();
  uint64_t v6 = [MEMORY[0x263EFF9C0] set];
  v119 = [MEMORY[0x263EFF9C0] set];
  v117 = [MEMORY[0x263EFF9C0] set];
  id v7 = [(WPDAdvertisingManager *)self currentAdvertisers];
  [v7 removeAllIndexes];

  BOOL v126 = [(WPDAdvertisingManager *)self isAdvertiserTestMode];
  BOOL v131 = -[WPDAdvertisingManager heySiriAdvertActive:](self, "heySiriAdvertActive:");
  uint64_t v8 = [(WPDAdvertisingManager *)self advertisingRequests];
  uint64_t v9 = [v8 allRequests];

  unint64_t v10 = [(WPDAdvertisingManager *)self advertisingRequests];
  unint64_t v11 = [v10 count];

  if (v11 >= 2)
  {
    uint64_t v12 = [v9 sortedArrayUsingSelector:sel_compare_];

    uint64_t v9 = (void *)v12;
  }
  v115 = (void *)v6;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v144 objects:v154 count:16];
  v120 = v5;
  uint64_t v15 = v118;
  v123 = v13;
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v121 = 0;
    uint64_t v133 = *(void *)v145;
    while (1)
    {
      uint64_t v17 = 0;
      uint64_t v127 = v16;
      do
      {
        if (*(void *)v145 != v133) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(id *)(*((void *)&v144 + 1) + 8 * v17);
        if (-[WPDManager isAdvertisingAllowlistedForType:](self, "isAdvertisingAllowlistedForType:", [v18 clientType]))
        {
          if (v131 && [v18 clientType] != 8)
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_356);
            }
            id v44 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
            {
              uint64_t v34 = v44;
              unsigned int v45 = [v18 clientType];
              *(_DWORD *)long long buf = 134217984;
              unint64_t v151 = v45;
              uint64_t v36 = v34;
              os_log_type_t v37 = OS_LOG_TYPE_INFO;
              v38 = "Not advertising for client type (%ld) when HeySiri is active";
              goto LABEL_34;
            }
          }
          else
          {
            uint64_t v19 = -[WPDAdvertisingManager clientForAdvRequest:](self, "clientForAdvRequest:", v18, v115);
            id v20 = (void *)v19;
            if (!v126) {
              goto LABEL_15;
            }
            if (v19)
            {
              [(WPDManager *)self server];
              int v21 = v5;
              v23 = id v22 = v20;
              char v24 = [v23 isClientTestMode:v22];

              id v20 = v22;
              id v5 = v21;
              if (v24)
              {
LABEL_15:
                v132 = v20;
                uint64_t v25 = [v18 advertisementRequestedAt];

                if (v25)
                {
                  uint64_t v26 = [v18 advertisementRequestedAt];
                  uint64_t v121 = [v26 longLongValue];
                }
                long long v27 = [(WPDManager *)self server];
                long long v28 = [v27 getClientForUUID:v132];

                LODWORD(v27) = [v18 connectable];
                int v29 = [v18 clientType];
                int v130 = (int)v27;
                long long v30 = &OBJC_IVAR___WPDAdvertisingManager__nonConnectableAdvTotalCount;
                if (v27) {
                  long long v30 = &OBJC_IVAR___WPDAdvertisingManager__connectableAdvTotalCount;
                }
                ++*(Class *)((char *)&self->super.super.isa + *v30);
                int v124 = [v5 isValidWithAdditionalRequest:v18];
                char v31 = [v15 isValidWithAdditionalRequest:v18];
                int v32 = [v125 isValidWithAdditionalRequest:v18];
                if (v31)
                {
                  int v128 = 1;
LABEL_44:
                  -[AdvMetrics incrementTotalAdvCountforType:](self->_advMetrics, "incrementTotalAdvCountforType:", [v18 clientType]);
                  if ([(WPDAdvertisingManager *)self platformSupportsMultipleAdvertising]&& ((+[WPDaemonServer supportsNC2AdvertisingInstance] & v32 ^ 1 | v130) & 1) == 0&& v29 == 19)
                  {
                    id v52 = v125;
                    v53 = [v28 bundleID];

                    if (v53)
                    {
                      v54 = [v28 bundleID];
                      v55 = v117;
                      goto LABEL_56;
                    }
LABEL_57:
                    id v13 = v123;
LABEL_58:
                    [v52 addAdvertisingRequest:v18];
                    if ([(WPDAdvertisingManager *)self isRanging])
                    {
                      v58 = [(WPDAdvertisingManager *)self rangingTypes];
                      int v59 = objc_msgSend(v58, "containsIndex:", objc_msgSend(v18, "clientType"));

                      if (v59)
                      {
                        if ([v18 clientType] == 2)
                        {
                          v60 = [v18 advertisingData];
                          uint64_t v61 = [v60 length];
                          unsigned int v62 = [v52 isRanging];
                          if (v61 == 22) {
                            uint64_t v63 = 1;
                          }
                          else {
                            uint64_t v63 = v62;
                          }
                          [v52 setIsRanging:v63];
                        }
                        else
                        {
                          [v52 setIsRanging:1];
                        }
                      }
                    }
                    objc_msgSend(v52, "setAssertPower:", objc_msgSend(v18, "holdVoucher") | objc_msgSend(v52, "assertPower"));
                    if ([v18 stopOnAdvertisingAddressChange])
                    {
                      v73 = [(WPDAdvertisingManager *)self clientsToNotifyOnAddressChange];
                      v74 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v18, "clientType"));
                      [v73 addObject:v74];
                    }
                    if (![(WPDAdvertisingManager *)self allowCompoundAdvertisements])
                    {

                      goto LABEL_103;
                    }
LABEL_93:

                    uint64_t v16 = v127;
                    goto LABEL_94;
                  }
                  if (((v128 & [(WPDAdvertisingManager *)self platformSupportsMultipleAdvertising] ^ 1 | v130) & 1) == 0)
                  {
                    id v52 = v15;
                    v57 = [v28 bundleID];

                    if (!v57) {
                      goto LABEL_57;
                    }
                    v54 = [v28 bundleID];
                    v55 = v119;
                    goto LABEL_56;
                  }
                  if (v124)
                  {
                    if ([v18 isValidOnConnectableInstance])
                    {
                      id v52 = v5;
                      v56 = [v28 bundleID];

                      if (!v56) {
                        goto LABEL_57;
                      }
                      v54 = [v28 bundleID];
                      v55 = v115;
LABEL_56:
                      [v55 addObject:v54];
                      id v13 = v123;

                      goto LABEL_58;
                    }
                    [(WPDAdvertisingManager *)self informClientsAdvertisingPending:v18];
                    if ((v130 | v128) & 1) != 0 || ([v18 isValidOnConnectableInstance])
                    {
LABEL_88:
                      id v52 = 0;
                      id v13 = v123;
                      goto LABEL_93;
                    }
LABEL_79:
                    ++self->_nonConnectableAdvDropCount;
                    -[AdvMetrics incrementTotalDroppedAdvCountforType:](self->_advMetrics, "incrementTotalDroppedAdvCountforType:", [v18 clientType]);
                    long long v138 = 0u;
                    long long v139 = 0u;
                    long long v136 = 0u;
                    long long v137 = 0u;
                    v64 = [v15 types];
                    uint64_t v69 = [v64 countByEnumeratingWithState:&v136 objects:v148 count:16];
                    if (v69)
                    {
                      uint64_t v70 = v69;
                      uint64_t v71 = *(void *)v137;
                      do
                      {
                        for (uint64_t i = 0; i != v70; ++i)
                        {
                          if (*(void *)v137 != v71) {
                            objc_enumerationMutation(v64);
                          }
                          -[AdvMetrics incrementDroppedAdvCountforType:by:](self->_advMetrics, "incrementDroppedAdvCountforType:by:", [v18 clientType], objc_msgSend(*(id *)(*((void *)&v136 + 1) + 8 * i), "unsignedShortValue"));
                        }
                        uint64_t v70 = [v64 countByEnumeratingWithState:&v136 objects:v148 count:16];
                      }
                      while (v70);
                      id v5 = v120;
                      uint64_t v15 = v118;
                    }
                  }
                  else
                  {
                    [(WPDAdvertisingManager *)self informClientsAdvertisingPending:v18];
                    if (!v130)
                    {
                      if (v128) {
                        goto LABEL_88;
                      }
                      goto LABEL_79;
                    }
                    ++self->_connectableAdvDropCount;
                    -[AdvMetrics incrementTotalDroppedAdvCountforType:](self->_advMetrics, "incrementTotalDroppedAdvCountforType:", [v18 clientType]);
                    long long v142 = 0u;
                    long long v143 = 0u;
                    long long v140 = 0u;
                    long long v141 = 0u;
                    v64 = [v5 types];
                    uint64_t v65 = [v64 countByEnumeratingWithState:&v140 objects:v149 count:16];
                    if (v65)
                    {
                      uint64_t v66 = v65;
                      uint64_t v67 = *(void *)v141;
                      do
                      {
                        for (uint64_t j = 0; j != v66; ++j)
                        {
                          if (*(void *)v141 != v67) {
                            objc_enumerationMutation(v64);
                          }
                          -[AdvMetrics incrementDroppedAdvCountforType:by:](self->_advMetrics, "incrementDroppedAdvCountforType:by:", [v18 clientType], objc_msgSend(*(id *)(*((void *)&v140 + 1) + 8 * j), "unsignedShortValue"));
                        }
                        uint64_t v66 = [v64 countByEnumeratingWithState:&v140 objects:v149 count:16];
                      }
                      while (v66);

                      id v5 = v120;
                      uint64_t v15 = v118;
                      if ((v130 | v128)) {
                        goto LABEL_88;
                      }
                      goto LABEL_79;
                    }
                  }

                  goto LABEL_88;
                }
                if ([v18 clientType] != 10)
                {
                  int v128 = 0;
                  goto LABEL_44;
                }
                v122 = v28;
                id v46 = (id)[v18 copy];
                id v47 = v15;
                v48 = 0;
                buf[0] = 0;
                v49 = v15;
                if (!v15
                  || !v46
                  || ([v46 advertisingData],
                      v50 = objc_claimAutoreleasedReturnValue(),
                      (v48 = v50) == 0)
                  || (objc_msgSend(v50, "getBytes:range:", buf, 0, 1), (buf[0] & 0x10) == 0))
                {

                  int v128 = 0;
                  v51 = v46;
                  goto LABEL_41;
                }
                buf[0] &= ~0x10u;
                v75 = (void *)MEMORY[0x263EFF990];
                v129 = objc_msgSend(v48, "subdataWithRange:", 0, objc_msgSend(v48, "length") - 3);
                v76 = [v75 dataWithData:v129];

                objc_msgSend(v76, "replaceBytesInRange:withBytes:", 0, 1, buf);
                [v46 setAdvertisingData:v76];
                LODWORD(v129) = [v47 isValidWithAdditionalRequest:v46];

                if (v129)
                {
                  id v77 = v46;
                  v51 = v18;
                  int v128 = 1;
                  id v18 = v77;
LABEL_41:
                  long long v28 = v122;
                }
                else
                {
                  int v128 = 0;
                  long long v28 = v122;
                }
                uint64_t v15 = v49;

                id v5 = v120;
                goto LABEL_44;
              }
            }
            id v39 = v5;
            v40 = v20;
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_359);
            }
            uint64_t v16 = v127;
            uint64_t v41 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
            {
              v42 = v41;
              unsigned int v43 = [v18 clientType];
              *(_DWORD *)long long buf = 138412546;
              unint64_t v151 = (unint64_t)v40;
              __int16 v152 = 2048;
              uint64_t v153 = v43;
              _os_log_impl(&dword_22316D000, v42, OS_LOG_TYPE_INFO, "Not advertising for non-test client UUID: %@ type (%ld) when in test mode", buf, 0x16u);
            }
            id v5 = v39;
          }
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_353);
          }
          __int16 v33 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = v33;
            unsigned int v35 = [v18 clientType];
            *(_DWORD *)long long buf = 134217984;
            unint64_t v151 = v35;
            uint64_t v36 = v34;
            os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
            v38 = "Not advertising for client type (%ld) when denylisted or not allowlisted";
LABEL_34:
            _os_log_impl(&dword_22316D000, v36, v37, v38, buf, 0xCu);
          }
        }
LABEL_94:

        ++v17;
      }
      while (v17 != v16);
      uint64_t v78 = [v13 countByEnumeratingWithState:&v144 objects:v154 count:16];
      uint64_t v16 = v78;
      if (!v78) {
        goto LABEL_103;
      }
    }
  }
  uint64_t v121 = 0;
LABEL_103:

  v79 = [v5 types];
  BOOL v80 = [(WPDAdvertisingManager *)self addressChangeNotificationNeeded:v79 advertiserTypeString:@"connectable"];

  v81 = [v15 types];
  BOOL v82 = [(WPDAdvertisingManager *)self addressChangeNotificationNeeded:v81 advertiserTypeString:@"non-connectable"];

  if (+[WPDaemonServer supportsNC2AdvertisingInstance])
  {
    v83 = [v125 types];
    BOOL v134 = [(WPDAdvertisingManager *)self addressChangeNotificationNeeded:v83 advertiserTypeString:@"non-connectable secondary"];
  }
  else
  {
    BOOL v134 = 0;
  }
  v84 = v115;
  v85 = (void *)MEMORY[0x263EFF9C0];
  v86 = objc_msgSend(v120, "types", v115);
  v87 = [v85 setWithSet:v86];

  v88 = [v15 types];
  [v87 unionSet:v88];

  if (+[WPDaemonServer supportsNC2AdvertisingInstance])
  {
    v89 = [v125 types];
    [v87 unionSet:v89];
  }
  v135[0] = MEMORY[0x263EF8330];
  v135[1] = 3221225472;
  v135[2] = __41__WPDAdvertisingManager_advertisingRules__block_invoke_369;
  v135[3] = &unk_26469B748;
  v135[4] = self;
  [v87 enumerateObjectsUsingBlock:v135];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_372);
  }
  v90 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v91 = v90;
    v92 = [(WPDAdvertisingManager *)self getCurrentAdvertisers];
    *(_DWORD *)long long buf = 138543362;
    unint64_t v151 = (unint64_t)v92;
    _os_log_impl(&dword_22316D000, v91, OS_LOG_TYPE_DEFAULT, "AdvertisingRulesiOS - current advertisers: %{public}@", buf, 0xCu);
  }
  v93 = [(WPDAdvertisingManager *)self currentAdvertisers];
  uint64_t v94 = [v93 count];

  v95 = [MEMORY[0x263EFF980] array];
  v96 = [(WPDAdvertisingManager *)self currentConnectableAdvertisingData];
  if (![v120 isEqualToData:v96]) {
    goto LABEL_118;
  }
  v97 = [(WPDAdvertisingManager *)self currentNonConnectableAdvertisingData];
  if (![v118 isEqualToData:v97]
    || !+[WPDaemonServer supportsNC2AdvertisingInstance])
  {

LABEL_118:
    goto LABEL_119;
  }
  v98 = [(WPDAdvertisingManager *)self currentNonConnectableSecondaryAdvertisingData];
  char v99 = [v125 isEqualToData:v98];

  v84 = v116;
  if ((v99 & 1) == 0)
  {
LABEL_119:
    [(WPDAdvertisingManager *)self setCurrentConnectableAdvertisingData:v120];
    [(WPDAdvertisingManager *)self setCurrentNonConnectableAdvertisingData:v118];
    [(WPDAdvertisingManager *)self setCurrentNonConnectableSecondaryAdvertisingData:v125];
    v100 = [(WPDAdvertisingManager *)self requestFromAdvertisingDataFromInstance:0 AddressChangeNotificationNeeded:v80];
    if (v100)
    {
      v101 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v100];
      if ([v84 count])
      {
        v102 = [v84 allObjects];
        [v101 setObject:v102 forKeyedSubscript:*MEMORY[0x263EFEE78]];
      }
      [v95 addObject:v101];
    }
    v103 = [(WPDAdvertisingManager *)self requestFromAdvertisingDataFromInstance:1 AddressChangeNotificationNeeded:v82];

    if (v103)
    {
      v104 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v103];
      if ([v119 count])
      {
        v105 = [v119 allObjects];
        [v104 setObject:v105 forKeyedSubscript:*MEMORY[0x263EFEE78]];
      }
      if (v121)
      {
        v106 = (void *)MEMORY[0x263EFF9A0];
        v107 = -[WPDAdvertisingManager addXPCDelayTiming:IsMetricOnly:UseCase:timeStamp:](self, "addXPCDelayTiming:IsMetricOnly:UseCase:timeStamp:", v104, 1, 22);
        uint64_t v108 = [v106 dictionaryWithDictionary:v107];

        v104 = (void *)v108;
      }
      [v95 addObject:v104];
    }
    if (+[WPDaemonServer supportsNC2AdvertisingInstance])
    {
      v109 = [(WPDAdvertisingManager *)self requestFromAdvertisingDataFromInstance:2 AddressChangeNotificationNeeded:v134];

      if (v109)
      {
        v110 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v109];
        if ([v117 count])
        {
          v111 = [v117 allObjects];
          [v110 setObject:v111 forKeyedSubscript:*MEMORY[0x263EFEE78]];
        }
        [v95 addObject:v110];
      }
    }
    else
    {
      v109 = v103;
    }
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_375);
  }
  v112 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    unint64_t v151 = (unint64_t)v95;
    _os_log_impl(&dword_22316D000, v112, OS_LOG_TYPE_DEFAULT, "AdvertisingRulesiOS - advertising packets: %{public}@", buf, 0xCu);
  }
  if (v94)
  {
    if ([v95 count]) {
      id v4 = v95;
    }
    else {
      id v4 = (id)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    [(WPDAdvertisingManager *)self setCurrentConnectableAdvertisingData:0];
    [(WPDAdvertisingManager *)self setCurrentNonConnectableAdvertisingData:0];
    [(WPDAdvertisingManager *)self setCurrentNonConnectableSecondaryAdvertisingData:0];
    v113 = [(WPDAdvertisingManager *)self currentAdvertisers];
    [v113 removeAllIndexes];

    id v4 = 0;
  }

LABEL_146:
  return v4;
}

- (WPAdvertisingRequestsQueue)advertisingRequests
{
  return (WPAdvertisingRequestsQueue *)objc_getProperty(self, a2, 56, 1);
}

- (id)requestFromAdvertisingDataFromInstance:(int64_t)a3 AddressChangeNotificationNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    uint64_t v6 = [(WPDAdvertisingManager *)self currentNonConnectableSecondaryAdvertisingData];
  }
  else if (a3 == 1)
  {
    uint64_t v6 = [(WPDAdvertisingManager *)self currentNonConnectableAdvertisingData];
  }
  else
  {
    if (a3)
    {
      id v7 = 0;
      goto LABEL_34;
    }
    uint64_t v6 = [(WPDAdvertisingManager *)self currentConnectableAdvertisingData];
  }
  id v7 = v6;
  if (!v6)
  {
LABEL_34:
    uint64_t v8 = 0;
    goto LABEL_35;
  }
  uint64_t v8 = [v6 getData];
  if (!v8)
  {
LABEL_35:
    uint64_t v15 = 0;
    goto LABEL_36;
  }
  context = (void *)MEMORY[0x223CB05A0]();
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263EFEC78]];
  [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFEE70]];
  unint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "advertRate"));
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263EFEE90]];

  unint64_t v11 = [NSNumber numberWithInt:a3 == 0];
  [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263EFEC98]];

  int v12 = [v7 isRanging];
  if (v12) {
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFEC68]];
  }
  if (v4) {
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFEC70]];
  }
  int v13 = [v7 assertPower];
  if (v13) {
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFEE98]];
  }
  uint64_t v14 = "";
  if ([v7 enableEPAForAdvertisement])
  {
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFECF8]];
    uint64_t v14 = "[enableEPA]";
  }
  if (a3 == 2) {
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFECA0]];
  }
  uint64_t v15 = [NSDictionary dictionaryWithDictionary:v9];
  if ((v12 | v4 | v13) == 1)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_342_1);
    }
    uint64_t v16 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = "[Privacy] ";
      *(_DWORD *)long long buf = 136316418;
      id v18 = "[Ranging] ";
      if (!v12) {
        id v18 = "";
      }
      uint64_t v19 = "[AssertPower] ";
      if (!v13) {
        uint64_t v19 = "";
      }
      if (!v4) {
        uint64_t v17 = "";
      }
      uint64_t v25 = v17;
      __int16 v26 = 2080;
      long long v27 = v18;
      __int16 v28 = 2080;
      int v29 = v19;
      __int16 v30 = 2080;
      id v20 = "AddrChangeNotificationNeeded ";
      if (!v4) {
        id v20 = "";
      }
      char v31 = v20;
      __int16 v32 = 2080;
      __int16 v33 = v14;
      __int16 v34 = 2112;
      unsigned int v35 = v15;
      _os_log_impl(&dword_22316D000, v16, OS_LOG_TYPE_DEFAULT, "%s%s%sAdvertisingRulesiOS: %sadv packet: %s %@ ", buf, 0x3Eu);
    }
  }

LABEL_36:
  id v21 = v15;

  return v21;
}

- (BOOL)platformSupportsMultipleAdvertising
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WPDAdvertisingManager_platformSupportsMultipleAdvertising__block_invoke;
  block[3] = &unk_26469AD50;
  block[4] = self;
  if (platformSupportsMultipleAdvertising_onceToken != -1) {
    dispatch_once(&platformSupportsMultipleAdvertising_onceToken, block);
  }
  return platformSupportsMultipleAdvertising_supported;
}

- (void)updateAdvertiser
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "Advertising data did not change.", v1, 2u);
}

- (CBPeripheralManager)nonConnectablePeripheralManager
{
  return self->_nonConnectablePeripheralManager;
}

- (CBPeripheralManager)connectablePeripheralManager
{
  return self->_connectablePeripheralManager;
}

- (void)setCurrentNonConnectableAdvertisingData:(id)a3
{
}

- (void)setCurrentConnectableAdvertisingData:(id)a3
{
}

- (WPDAdvertisingData)currentConnectableAdvertisingData
{
  return self->_currentConnectableAdvertisingData;
}

void __73__WPDAdvertisingManager_removeAdvertisingRequest_forClient_shouldUpdate___block_invoke_318(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = v3;
  if (*(void *)(a1 + 32)
    && (int v5 = [v3 clientType], v5 != objc_msgSend(*(id *)(a1 + 32), "clientType")))
  {
    [*(id *)(a1 + 48) addObject:v4];
  }
  else
  {
    unsigned int v6 = [v4 clientType];
    id v7 = [*(id *)(a1 + 40) currentAdvertisers];
    int v8 = [v7 containsIndex:v6];

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 40) currentAdvertisers];
      [v9 removeIndex:v6];

      unint64_t v10 = [*(id *)(a1 + 40) clientsToNotifyOnAddressChange];
      unint64_t v11 = [NSNumber numberWithUnsignedChar:v6];
      [v10 removeObject:v11];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_321_0);
      }
      int v12 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *(void **)(a1 + 40);
        uint64_t v14 = v12;
        uint64_t v15 = [v13 clientsToNotifyOnAddressChange];
        v23[0] = 67109378;
        v23[1] = v6;
        __int16 v24 = 2112;
        uint64_t v25 = v15;
        _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEFAULT, "[Privacy] removeAdvertisingRequest: %d, %@", (uint8_t *)v23, 0x12u);
      }
      [*(id *)(a1 + 40) setCurrentConnectableAdvertisingData:0];
      [*(id *)(a1 + 40) setCurrentNonConnectableAdvertisingData:0];
      [*(id *)(a1 + 40) setCurrentNonConnectableSecondaryAdvertisingData:0];
    }
    uint64_t v16 = [*(id *)(a1 + 40) advertisingRequests];
    [v16 remove:v4];

    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;

    uint64_t v19 = [*(id *)(a1 + 40) server];
    id v20 = [v19 statsManager];
    [v20 stopActivity:1 forType:v6];

    id v21 = [*(id *)(a1 + 40) server];
    id v22 = [v21 statsManager];
    [v22 resetActivity:1 forType:v6];
  }
}

- (BOOL)addressChangeNotificationNeeded:(id)a3 advertiserTypeString:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF9C0] setWithSet:a3];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_492);
  }
  int v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    unint64_t v10 = [(WPDAdvertisingManager *)self clientsToNotifyOnAddressChange];
    int v17 = 138412802;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "[Privacy] AdvertisingRulesiOS: current %@ advertisers: %@, current clients for address change notification: %@", (uint8_t *)&v17, 0x20u);
  }
  unint64_t v11 = [(WPDAdvertisingManager *)self clientsToNotifyOnAddressChange];
  [v7 minusSet:v11];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_495);
  }
  int v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = v12;
    uint64_t v14 = [(WPDAdvertisingManager *)self clientsToNotifyOnAddressChange];
    int v17 = 138412802;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v14;
    _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "[Privacy] AdvertisingRulesiOS: remaining %@ advertisers: %@, notification clients: %@", (uint8_t *)&v17, 0x20u);
  }
  BOOL v15 = [v7 count] == 0;

  return v15;
}

- (NSMutableSet)clientsToNotifyOnAddressChange
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCurrentNonConnectableSecondaryAdvertisingData:(id)a3
{
}

- (id)removeAdvertisingRequest:(id)a3 forClient:(id)a4 shouldUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  v36[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(WPDAdvertisingManager *)self clientAdvertisingRequests];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    *(void *)long long buf = 0;
    __int16 v30 = buf;
    uint64_t v31 = 0x3032000000;
    __int16 v32 = __Block_byref_object_copy__4;
    __int16 v33 = __Block_byref_object_dispose__4;
    id v34 = 0;
    int v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08320];
    int v13 = objc_msgSend(NSString, "stringWithFormat:", @"CoreBluetooth isn't advertising for client type %d", objc_msgSend(v8, "clientType"));
    v36[0] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    id v34 = [v12 errorWithDomain:@"WPErrorDomain" code:11 userInfo:v14];

    BOOL v15 = [(WPDAdvertisingManager *)self clientAdvertisingRequests];
    uint64_t v16 = [v15 objectForKeyedSubscript:v9];

    int v17 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v16, "count"));
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __73__WPDAdvertisingManager_removeAdvertisingRequest_forClient_shouldUpdate___block_invoke_318;
    v24[3] = &unk_26469B720;
    id v18 = v8;
    id v25 = v18;
    uint64_t v26 = self;
    __int16 v28 = buf;
    id v19 = v17;
    id v27 = v19;
    [v16 enumerateObjectsUsingBlock:v24];
    [(WPDAdvertisingManager *)self clientAdvertisingRequests];
    if (v18) {
      id v20 = {;
    }
      [v20 setObject:v19 forKeyedSubscript:v9];
    }
    else {
      id v20 = {;
    }
      [v20 removeObjectForKey:v9];
    }

    if (v5) {
      [(WPDAdvertisingManager *)self updateAdvertiser];
    }
    id v22 = *((id *)v30 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_314_1);
    }
    __int16 v21 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22316D000, v21, OS_LOG_TYPE_DEFAULT, "Trying to remove an advertising request when there are no advert requests", buf, 2u);
    }
    id v22 = 0;
  }

  return v22;
}

- (NSMutableDictionary)clientAdvertisingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSIndexSet)rangingTypes
{
  return self->_rangingTypes;
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WPDAdvertisingManager *)self nonConnectablePeripheralManager];
  if (v8 != v6)
  {
    id v9 = [(WPDAdvertisingManager *)self nonConnectableSecondaryPeripheralManager];
    if (v9 != v6)
    {

LABEL_7:
      int v12 = [(WPDAdvertisingManager *)self currentAdvertisers];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_411_0);
        }
        uint64_t v14 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
        {
          BOOL v15 = v14;
          uint64_t v16 = [(WPDAdvertisingManager *)self getCurrentAdvertisers];
          *(_DWORD *)long long buf = 138543362;
          id v27 = v16;
          _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_INFO, "Current advertisers %{public}@", buf, 0xCu);
        }
        if (v7)
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_414_1);
          }
          int v17 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
            -[WPDAdvertisingManager peripheralManagerDidStartAdvertising:error:](v17, v7);
          }
        }
        id v18 = [MEMORY[0x263EFF9C0] set];
        id v19 = [(WPDAdvertisingManager *)self currentAdvertisers];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_415;
        v24[3] = &unk_26469B450;
        id v25 = v18;
        id v20 = v18;
        [v19 enumerateIndexesUsingBlock:v24];

        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_418;
        v22[3] = &unk_26469B798;
        v22[4] = self;
        id v23 = v7;
        [v20 enumerateObjectsUsingBlock:v22];
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_408_0);
        }
        __int16 v21 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22316D000, v21, OS_LOG_TYPE_DEFAULT, "Started advertising while client asked to stop advertising - stopping advertising", buf, 2u);
        }
        [v6 stopAdvertising];
      }
      goto LABEL_23;
    }
  }
  unint64_t v10 = [(WPDAdvertisingManager *)self connectablePeripheralManager];
  char v11 = [v10 isAdvertising];

  if (v8 != v6) {
  if ((v11 & 1) == 0)
  }
    goto LABEL_7;
LABEL_23:
}

- (id)getCurrentAdvertisers
{
  id v3 = [MEMORY[0x263F089D8] string];
  BOOL v4 = [(WPDAdvertisingManager *)self currentAdvertisers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WPDAdvertisingManager_getCurrentAdvertisers__block_invoke;
  v7[3] = &unk_26469B450;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateIndexesUsingBlock:v7];

  return v5;
}

- (NSMutableIndexSet)currentAdvertisers
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 72, 1);
}

- (CBPeripheralManager)nonConnectableSecondaryPeripheralManager
{
  return self->_nonConnectableSecondaryPeripheralManager;
}

- (BOOL)isRanging
{
  return [(NSMutableSet *)self->_rangingClients count] != 0;
}

- (BOOL)isAdvertiserTestMode
{
  uint64_t v8 = 0;
  v9[0] = &v8;
  v9[1] = 0x2020000000;
  char v10 = 0;
  if ([(WPDManager *)self testMode])
  {
    id v3 = [(WPDAdvertisingManager *)self clientAdvertisingRequests];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__WPDAdvertisingManager_isAdvertiserTestMode__block_invoke;
    v7[3] = &unk_26469B2A0;
    void v7[4] = self;
    v7[5] = &v8;
    [v3 enumerateKeysAndObjectsUsingBlock:v7];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_378);
    }
    BOOL v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      [(WPDAdvertisingManager *)(uint64_t)v9 isAdvertiserTestMode];
    }
  }
  char v5 = *(unsigned char *)(v9[0] + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)heySiriAdvertActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (![(WPDManager *)self isHomePod]) {
    return 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  char v5 = [(WPDAdvertisingManager *)self advertisingRequests];
  id v6 = [v5 allRequests];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      char v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      if ([v11 clientType] == 8)
      {
        if (!v3) {
          break;
        }
        uint64_t v12 = [(WPDAdvertisingManager *)self clientForAdvRequest:v11];
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          uint64_t v14 = [(WPDManager *)self server];
          char v15 = [v14 isClientTestMode:v13];

          if (v15) {
            break;
          }
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v8) {
          goto LABEL_4;
        }

        BOOL v16 = 0;
        int v17 = 1;
        goto LABEL_23;
      }
    }

    if ([(WPDManager *)self isAdvertisingAllowlistedForType:8])
    {
      int v17 = 0;
      BOOL v16 = 1;
      goto LABEL_23;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_386_0);
    }
    id v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEFAULT, "WPClientHeySiri advertising is denylisted or not allowlisted", buf, 2u);
    }
  }
  else
  {
  }
  BOOL v16 = 0;
  int v17 = 1;
LABEL_23:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_389_0);
  }
  id v19 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    id v20 = @"YES";
    if (v17) {
      id v20 = @"NO";
    }
    *(_DWORD *)long long buf = 138412290;
    id v27 = v20;
    _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_INFO, "heySiriAdvertActive: %@", buf, 0xCu);
  }
  return v16;
}

- (WPDAdvertisingData)currentNonConnectableAdvertisingData
{
  return self->_currentNonConnectableAdvertisingData;
}

- (id)clientForAdvRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__4;
  BOOL v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  char v5 = [(WPDAdvertisingManager *)self clientAdvertisingRequests];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __45__WPDAdvertisingManager_clientForAdvRequest___block_invoke;
  v9[3] = &unk_26469B2A0;
  id v6 = v4;
  id v10 = v6;
  char v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)allowCompoundAdvertisements
{
  return self->_allowCompoundAdvertisements;
}

void __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_415(uint64_t a1, uint64_t a2)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_417_0);
    }
    v2 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22316D000, v2, OS_LOG_TYPE_DEFAULT, "Got NSNotFound as an advertising index", buf, 2u);
    }
  }
  else
  {
    BOOL v3 = *(void **)(a1 + 32);
    id v4 = [NSNumber numberWithUnsignedChar:a2];
    [v3 addObject:v4];
  }
}

- (WPDAdvertisingManager)initWithServer:(id)a3
{
  v70[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)WPDAdvertisingManager;
  char v5 = [(WPDManager *)&v62 initWithServer:v4 Name:@"Peripheral"];
  if (v5)
  {
    id v6 = objc_alloc_init(WPAdvertisingRequestsQueue);
    advertisingRequests = v5->_advertisingRequests;
    v5->_advertisingRequests = v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    clientAdvertisingRequests = v5->_clientAdvertisingRequests;
    v5->_clientAdvertisingRequests = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263F089C8] indexSet];
    currentAdvertisers = v5->_currentAdvertisers;
    v5->_currentAdvertisers = (NSMutableIndexSet *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    clientsToNotifyOnAddressChange = v5->_clientsToNotifyOnAddressChange;
    v5->_clientsToNotifyOnAddressChange = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    publishedServices = v5->_publishedServices;
    v5->_publishedServices = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    preallocatedServices = v5->_preallocatedServices;
    v5->_preallocatedServices = (NSMutableDictionary *)v16;

    id v18 = objc_alloc(MEMORY[0x263EFEF60]);
    id v19 = [v4 serverQueue];
    uint64_t v69 = *MEMORY[0x263EFEE80];
    uint64_t v20 = v69;
    uint64_t v21 = MEMORY[0x263EFFA88];
    v70[0] = MEMORY[0x263EFFA88];
    long long v22 = [NSDictionary dictionaryWithObjects:v70 forKeys:&v69 count:1];
    uint64_t v23 = [v18 initWithDelegate:v5 queue:v19 options:v22];
    connectablePeripheralManager = v5->_connectablePeripheralManager;
    v5->_connectablePeripheralManager = (CBPeripheralManager *)v23;

    id v25 = objc_alloc(MEMORY[0x263EFEF60]);
    uint64_t v26 = [v4 serverQueue];
    uint64_t v67 = v20;
    uint64_t v68 = v21;
    id v27 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    uint64_t v28 = [v25 initWithDelegate:v5 queue:v26 options:v27];
    nonConnectablePeripheralManager = v5->_nonConnectablePeripheralManager;
    v5->_nonConnectablePeripheralManager = (CBPeripheralManager *)v28;

    if (+[WPDaemonServer supportsNC2AdvertisingInstance])
    {
      id v30 = objc_alloc(MEMORY[0x263EFEF60]);
      uint64_t v31 = [v4 serverQueue];
      uint64_t v65 = v20;
      uint64_t v66 = v21;
      __int16 v32 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      uint64_t v33 = [v30 initWithDelegate:v5 queue:v31 options:v32];
      nonConnectableSecondaryPeripheralManager = v5->_nonConnectableSecondaryPeripheralManager;
      v5->_nonConnectableSecondaryPeripheralManager = (CBPeripheralManager *)v33;
    }
    v5->_allowCompoundAdvertisements = 1;
    uint64_t v35 = [MEMORY[0x263F089C8] indexSet];
    [v35 addIndex:15];
    if (+[WPDaemonServer supportsRanging]) {
      [v35 addIndex:19];
    }
    uint64_t v36 = [objc_alloc(MEMORY[0x263F088D0]) initWithIndexSet:v35];
    rangingTypes = v5->_rangingTypes;
    v5->_rangingTypes = (NSIndexSet *)v36;

    v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    rangingClients = v5->_rangingClients;
    v5->_rangingClients = v38;

    v40 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v41 = [v40 persistentDomainForName:@"com.apple.MobileBluetooth.debug"];
    v42 = [v41 objectForKeyedSubscript:@"WIPROX"];

    unsigned int v43 = [v42 objectForKeyedSubscript:@"AllowCompoundAdvertisements"];
    id v44 = v43;
    if (v43)
    {
      v5->_allowCompoundAdvertisements = [v43 BOOLValue];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_14);
      }
      unsigned int v45 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDAdvertisingManager initWithServer:]((unsigned __int8 *)&v5->_allowCompoundAdvertisements, v45);
      }
    }
    BOOL v46 = +[WPDaemonServer supportsNC2AdvertisingInstance];
    id v47 = (void *)MEMORY[0x263EFFA08];
    if (v46)
    {
      v64[0] = v5->_connectablePeripheralManager;
      v64[1] = v5->_nonConnectablePeripheralManager;
      v64[2] = v5->_nonConnectableSecondaryPeripheralManager;
      v48 = (void *)MEMORY[0x263EFF8C0];
      v49 = v64;
      uint64_t v50 = 3;
    }
    else
    {
      v63[0] = v5->_connectablePeripheralManager;
      v63[1] = v5->_nonConnectablePeripheralManager;
      v48 = (void *)MEMORY[0x263EFF8C0];
      v49 = v63;
      uint64_t v50 = 2;
    }
    v51 = [v48 arrayWithObjects:v49 count:v50];
    id v52 = [v47 setWithArray:v51];
    [(WPDManager *)v5 setCbManagers:v52];

    v53 = [v4 wpdState];
    [v53 registerManager:v5->_connectablePeripheralManager];

    v54 = [v4 wpdState];
    [v54 registerManager:v5->_nonConnectablePeripheralManager];

    if (+[WPDaemonServer supportsNC2AdvertisingInstance])
    {
      v55 = [v4 wpdState];
      [v55 registerManager:v5->_nonConnectableSecondaryPeripheralManager];
    }
    v56 = objc_alloc_init(AdvMetrics);
    advMetrics = v5->_advMetrics;
    v5->_advMetrics = v56;

    xpc_object_t v58 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v58, (const char *)*MEMORY[0x263EF82A0], 1);
    xpc_dictionary_set_int64(v58, (const char *)*MEMORY[0x263EF81A0], *MEMORY[0x263EF81E8]);
    xpc_dictionary_set_int64(v58, (const char *)*MEMORY[0x263EF81C0], *MEMORY[0x263EF81F8]);
    xpc_dictionary_set_string(v58, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __40__WPDAdvertisingManager_initWithServer___block_invoke_195;
    v60[3] = &unk_26469B6D0;
    uint64_t v61 = v5;
    xpc_activity_register("com.apple.Bluetoooth.WPDAdvertisingManager", v58, v60);
  }
  return v5;
}

uint64_t __40__WPDAdvertisingManager_initWithServer___block_invoke_195(uint64_t a1)
{
  return [*(id *)(a1 + 32) statsExportTimerFired];
}

- (id)generateStateDumpStrings
{
  v2 = self;
  uint64_t v84 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263EFF980];
  v80.receiver = self;
  v80.super_class = (Class)WPDAdvertisingManager;
  id v4 = [(WPDManager *)&v80 generateStateDumpStrings];
  char v5 = [v3 arrayWithArray:v4];

  if ([(WPDManager *)v2 isInternalBuild])
  {
    id v6 = NSString;
    id v7 = [(WPDManager *)v2 advAllowlist];
    if (v7)
    {
      uint64_t v8 = [(WPDManager *)v2 advAllowlist];
    }
    else
    {
      uint64_t v8 = @"all";
    }
    uint64_t v9 = [v6 stringWithFormat:@"allowlisted adv types: %@\n", v8];
    [v5 addObject:v9];

    if (v7) {
  }
    }
  uint64_t v10 = NSString;
  BOOL v11 = [(WPDAdvertisingManager *)v2 isRanging];
  uint64_t v12 = [(WPDAdvertisingManager *)v2 rangingClients];
  uint64_t v13 = [v10 stringWithFormat:@"ranging %d for clients: %@\n", v11, v12];
  [v5 addObject:v13];

  uint64_t v14 = NSString;
  BOOL v15 = [(WPDAdvertisingManager *)v2 allowCompoundAdvertisements];
  uint64_t v16 = "no";
  if (v15) {
    uint64_t v16 = "yes";
  }
  id v17 = objc_msgSend(v14, "stringWithFormat:", @"allowCompoundAdvertisements: %s\n", v16);
  objc_super v62 = v5;
  [v5 addObject:v17];

  id v18 = [MEMORY[0x263EFF980] array];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v19 = [(WPDAdvertisingManager *)v2 clientAdvertisingRequests];
  uint64_t v20 = [v19 allKeys];

  obuint64_t j = v20;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v76 objects:v83 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v77;
    uint64_t v63 = *(void *)v77;
    v64 = v2;
    do
    {
      uint64_t v24 = 0;
      uint64_t v65 = v22;
      do
      {
        if (*(void *)v77 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v76 + 1) + 8 * v24);
        uint64_t v26 = [(WPDAdvertisingManager *)v2 clientAdvertisingRequests];
        id v27 = [v26 objectForKeyedSubscript:v25];

        if (v27 && [v27 count])
        {
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          uint64_t v67 = v27;
          id v28 = v27;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v72 objects:v82 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v73;
            do
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v73 != v31) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v33 = [NSString stringWithFormat:@"    %@: %@\n", v25, *(void *)(*((void *)&v72 + 1) + 8 * i)];
                [v18 addObject:v33];
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v72 objects:v82 count:16];
            }
            while (v30);
          }

          uint64_t v23 = v63;
          v2 = v64;
          uint64_t v22 = v65;
          id v27 = v67;
        }

        ++v24;
      }
      while (v24 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v76 objects:v83 count:16];
    }
    while (v22);
  }

  id v34 = objc_msgSend(NSString, "stringWithFormat:", @"all advertising requests (%ld):\n", objc_msgSend(v18, "count"));
  [v62 addObject:v34];

  [v62 addObjectsFromArray:v18];
  uint64_t v35 = NSString;
  uint64_t v36 = [(WPDAdvertisingManager *)v2 advertisingRequests];
  os_log_type_t v37 = objc_msgSend(v35, "stringWithFormat:", @"currently active requests (%ld):\n", objc_msgSend(v36, "count"));
  [v62 addObject:v37];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v38 = [(WPDAdvertisingManager *)v2 advertisingRequests];
  id v39 = [v38 allRequests];

  uint64_t v40 = [v39 countByEnumeratingWithState:&v68 objects:v81 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v69 != v42) {
          objc_enumerationMutation(v39);
        }
        id v44 = [NSString stringWithFormat:@"    %@\n", *(void *)(*((void *)&v68 + 1) + 8 * j)];
        [v62 addObject:v44];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v68 objects:v81 count:16];
    }
    while (v41);
  }

  [v62 addObject:@"currently advertising:\n"];
  unsigned int v45 = NSString;
  BOOL v46 = [(WPDAdvertisingManager *)v2 currentConnectableAdvertisingData];
  id v47 = [v45 stringWithFormat:@"    connectable: %@\n", v46];
  [v62 addObject:v47];

  v48 = NSString;
  v49 = [(WPDAdvertisingManager *)v2 currentNonConnectableAdvertisingData];
  uint64_t v50 = [v48 stringWithFormat:@"    non-connectable: %@\n", v49];
  [v62 addObject:v50];

  v51 = NSString;
  id v52 = [(WPDAdvertisingManager *)v2 getCurrentAdvertisers];
  v53 = [v51 stringWithFormat:@"    types: %@\n", v52];
  [v62 addObject:v53];

  v54 = NSString;
  v55 = [(WPDAdvertisingManager *)v2 preallocatedServices];
  v56 = [v54 stringWithFormat:@"preallocated services: %@\n", v55];
  [v62 addObject:v56];

  v57 = NSString;
  xpc_object_t v58 = [(WPDAdvertisingManager *)v2 publishedServices];
  int v59 = [v57 stringWithFormat:@"published services: %@\n", v58];
  [v62 addObject:v59];

  v60 = [MEMORY[0x263EFF8C0] arrayWithArray:v62];

  return v60;
}

- (void)addCharacteristic:(id)a3 Properties:(unint64_t)a4 Permissions:(unint64_t)a5 Service:(id)a6 Name:(id)a7
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v32 = a7;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
  BOOL v15 = [(WPDAdvertisingManager *)self preallocatedServices];
  uint64_t v16 = [v15 objectForKeyedSubscript:v14];

  if (v16)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_247_0);
    }
    id v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v35 = v13;
      _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "Service with UUID %@ was already pre-allocated", buf, 0xCu);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_250_0);
    }
    id v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543874;
      id v35 = v32;
      __int16 v36 = 2114;
      uint64_t v37 = (uint64_t)v13;
      __int16 v38 = 2114;
      id v39 = v12;
      _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ pre-populate GATT database for service: %{public}@, characteristic: %{public}@", buf, 0x20u);
    }
    uint64_t v31 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v12];
    uint64_t v30 = objc_msgSend(MEMORY[0x263EFEF88], "UUIDWithNSUUID:");
    id v19 = (void *)[objc_alloc(MEMORY[0x263EFEF40]) initWithType:v30 properties:a4 value:0 permissions:a5];
    uint64_t v20 = [MEMORY[0x263EFEF88] UUIDWithNSUUID:v14];
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263EFEF48]) initWithType:v20 primary:1];
    uint64_t v33 = v19;
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
    [v21 setCharacteristics:v22];

    uint64_t v23 = [(WPDAdvertisingManager *)self preallocatedServices];
    [v23 setObject:v21 forKeyedSubscript:v14];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_256_1);
    }
    uint64_t v24 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = v24;
      uint64_t v26 = [v21 UUID];
      id v27 = [(WPDAdvertisingManager *)self connectablePeripheralManager];
      uint64_t v28 = [v27 state];
      *(_DWORD *)long long buf = 138543618;
      id v35 = v26;
      __int16 v36 = 2048;
      uint64_t v37 = v28;
      _os_log_impl(&dword_22316D000, v25, OS_LOG_TYPE_DEFAULT, "Adding service with UUID %{public}@ with peripheral manager state %ld", buf, 0x16u);
    }
    uint64_t v29 = [(WPDAdvertisingManager *)self connectablePeripheralManager];
    [v29 addService:v21];
  }
}

- (void)preallocateServices
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  v2 = @"Continuity";
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "Service with UUID %{public}@ is not supported on this product", (uint8_t *)&v1, 0xCu);
}

- (void)addCharacteristic:(id)a3 forService:(id)a4 forClient:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [MEMORY[0x263EFEF88] UUIDWithNSUUID:v9];
  id v12 = (void *)MEMORY[0x263EFEF88];
  id v13 = [v8 uuid];
  uint64_t v14 = [v12 UUIDWithNSUUID:v13];

  BOOL v15 = [(WPDAdvertisingManager *)self publishedServices];
  uint64_t v16 = [v15 objectForKeyedSubscript:v10];

  if (v16
    && (id v17 = v11,
        [v16 UUID],
        id v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 isEqual:v17],
        v17,
        v18,
        v19))
  {
    if (verifyCharacteristicUUIDforService(v14, v16))
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_260);
      }
      uint64_t v20 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = v20;
        uint64_t v22 = [v8 uuid];
        *(_DWORD *)long long buf = 138543874;
        id v59 = v9;
        __int16 v60 = 2114;
        uint64_t v61 = (uint64_t)v22;
        __int16 v62 = 2114;
        id v63 = v10;
        _os_log_impl(&dword_22316D000, v21, OS_LOG_TYPE_DEFAULT, "Already published service %{public}@ with characteristic %{public}@ for client %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_263_1);
      }
      v49 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDAdvertisingManager addCharacteristic:forService:forClient:]((uint64_t)v9, v49, v8);
      }
      [MEMORY[0x263EFF940] raise:@"WPServiceWithoutCharacteristic" format:@"Published service does not have the characteristic"];
    }
  }
  else
  {
    v54 = v16;
    uint64_t v23 = v8;
    uint64_t v24 = v11;
    uint64_t v25 = [(WPDAdvertisingManager *)self preallocatedServices];
    uint64_t v26 = [v25 objectForKeyedSubscript:v9];

    if (!v26) {
      goto LABEL_16;
    }
    id v27 = v11;
    [v26 UUID];
    v29 = uint64_t v28 = v26;
    int v30 = [v29 isEqual:v27];

    uint64_t v26 = v28;
    if (v30)
    {
      BOOL v11 = v24;
      if (verifyCharacteristicUUIDforService(v14, v28))
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_273_0);
        }
        uint64_t v31 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = v31;
          uint64_t v33 = [v23 uuid];
          *(_DWORD *)long long buf = 138543874;
          id v59 = v9;
          __int16 v60 = 2114;
          uint64_t v61 = (uint64_t)v33;
          __int16 v62 = 2114;
          id v63 = v10;
          _os_log_impl(&dword_22316D000, v32, OS_LOG_TYPE_DEFAULT, "Using pre-allocated service %{public}@ with characteristic %{public}@ for client %{public}@", buf, 0x20u);

          uint64_t v26 = v28;
        }
        id v34 = [(WPDAdvertisingManager *)self publishedServices];
        [v34 setObject:v26 forKeyedSubscript:v10];

        id v8 = v23;
        uint64_t v16 = v54;
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_276_1);
        }
        id v8 = v23;
        uint64_t v50 = (void *)WiProxLog;
        uint64_t v16 = v54;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDAdvertisingManager addCharacteristic:forService:forClient:]((uint64_t)v9, v50, v8);
        }
        [MEMORY[0x263EFF940] raise:@"WPServiceWithoutCharacteristic" format:@"Pre-allocated service does not have the characteristic"];
      }
    }
    else
    {
LABEL_16:
      id v56 = v10;
      v55 = v14;
      v51 = v26;
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_282_0);
      }
      id v8 = v23;
      id v35 = (void *)WiProxLog;
      uint64_t v16 = v54;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v36 = v35;
        uint64_t v37 = [v8 uuid];
        *(_DWORD *)long long buf = 138543874;
        id v59 = v9;
        __int16 v60 = 2114;
        uint64_t v61 = (uint64_t)v37;
        __int16 v62 = 2114;
        id v63 = v10;
        _os_log_impl(&dword_22316D000, v36, OS_LOG_TYPE_DEFAULT, "Publishing service %{public}@ with characteritic %{public}@ for client %{public}@", buf, 0x20u);
      }
      id v53 = v9;
      __int16 v38 = objc_msgSend(objc_alloc(MEMORY[0x263EFEF40]), "initWithType:properties:value:permissions:", v14, objc_msgSend(v8, "properties"), 0, objc_msgSend(v8, "permissions"));
      id v39 = (void *)[objc_alloc(MEMORY[0x263EFEF48]) initWithType:v24 primary:1];
      v57 = v38;
      uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
      [v39 setCharacteristics:v40];

      uint64_t v41 = [(WPDAdvertisingManager *)self publishedServices];
      [v41 setObject:v39 forKeyedSubscript:v10];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_285_1);
      }
      uint64_t v42 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v43 = v42;
        id v44 = [v39 UUID];
        unsigned int v45 = [v44 UUIDString];
        BOOL v46 = [(WPDAdvertisingManager *)self connectablePeripheralManager];
        uint64_t v47 = [v46 state];
        *(_DWORD *)long long buf = 138412546;
        id v59 = v45;
        __int16 v60 = 2048;
        uint64_t v61 = v47;
        _os_log_impl(&dword_22316D000, v43, OS_LOG_TYPE_DEFAULT, "Adding service with UUID %@ with peripheral manager state %ld", buf, 0x16u);
      }
      v48 = [(WPDAdvertisingManager *)self connectablePeripheralManager];
      [v48 addService:v39];

      uint64_t v26 = v52;
      id v9 = v53;
      uint64_t v14 = v55;
      id v10 = v56;
      BOOL v11 = v24;
    }
  }
}

- (void)removeServiceForClient:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(WPDAdvertisingManager *)self publishedServices];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_287_1);
    }
    id v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = [v6 UUID];
      int v17 = 138543618;
      id v18 = v9;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Removing service %{public}@ for client %{public}@", (uint8_t *)&v17, 0x16u);
    }
    id v10 = [v6 UUID];
    BOOL v11 = [(WPDAdvertisingManager *)self NSUUIDfromCBUUID:v10];

    id v12 = [(WPDAdvertisingManager *)self preallocatedServices];
    id v13 = [v12 objectForKeyedSubscript:v11];

    if (!v13)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_290_0);
      }
      uint64_t v14 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = v11;
        _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEFAULT, "Unpublishing service %{public}@, since it was not pre-allocated", (uint8_t *)&v17, 0xCu);
      }
      BOOL v15 = [(WPDAdvertisingManager *)self connectablePeripheralManager];
      [v15 removeService:v6];
    }
    uint64_t v16 = [(WPDAdvertisingManager *)self publishedServices];
    [v16 removeObjectForKey:v4];
  }
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_292_0);
    }
    BOOL v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDAdvertisingManager peripheralManager:didAddService:error:](v11, v9, v10);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_295_1);
    }
    id v12 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      uint64_t v14 = [v9 UUID];
      BOOL v15 = [v9 characteristics];
      int v16 = 138543618;
      int v17 = v14;
      __int16 v18 = 2114;
      __int16 v19 = v15;
      _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "Added service with UUID %{public}@ and characteristics %{public}@", (uint8_t *)&v16, 0x16u);
    }
    [(WPDAdvertisingManager *)self updateAdvertiser];
  }
}

- (void)enableRanging:(BOOL)a3 forClient:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_297);
  }
  id v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = v4;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "WPAdvertisingManager enable ranging:%d for client: %@", (uint8_t *)v11, 0x12u);
  }
  id v8 = [(WPDAdvertisingManager *)self rangingClients];
  id v9 = v8;
  if (v4) {
    [v8 addObject:v6];
  }
  else {
    [v8 removeObject:v6];
  }

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_300_0);
  }
  id v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDAdvertisingManager enableRanging:forClient:](v4, v10, self);
  }
  if ([(WPDManager *)self state] == 3) {
    [(WPDAdvertisingManager *)self updateAdvertiser];
  }
}

- (void)addAdvertisingRequest:(id)a3 forDaemon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WPDManager *)self server];
  id v9 = [v8 serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__WPDAdvertisingManager_addAdvertisingRequest_forDaemon___block_invoke;
  block[3] = &unk_26469B6F8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t __57__WPDAdvertisingManager_addAdvertisingRequest_forDaemon___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addAdvertisingRequest:*(void *)(a1 + 40) forClient:*(void *)(a1 + 48)];
  if (!objc_claimAutoreleasedReturnValue() && [*(id *)(a1 + 40) isRanging]) {
    [*(id *)(a1 + 32) enableRanging:1 forClient:*(void *)(a1 + 48)];
  }
  return MEMORY[0x270F9A758]();
}

- (id)removeAdvertisingRequestsForClient:(id)a3
{
  return [(WPDAdvertisingManager *)self removeAdvertisingRequest:0 forClient:a3];
}

- (void)removeAdvertisingRequest:(id)a3 forDaemon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WPDManager *)self server];
  id v9 = [v8 serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WPDAdvertisingManager_removeAdvertisingRequest_forDaemon___block_invoke;
  block[3] = &unk_26469B6F8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __60__WPDAdvertisingManager_removeAdvertisingRequest_forDaemon___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) removeAdvertisingRequest:*(void *)(a1 + 40) forClient:*(void *)(a1 + 48) shouldUpdate:1];
  uint64_t v3 = [*(id *)(a1 + 32) rangingClients];
  int v4 = [v3 containsObject:*(void *)(a1 + 48)];

  if (v4)
  {
    char v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    [v5 enableRanging:0 forClient:v6];
  }
}

- (id)addXPCDelayTiming:(id)a3 IsMetricOnly:(BOOL)a4 UseCase:(unint64_t)a5 timeStamp:(unint64_t)a6
{
  BOOL v8 = a4;
  id v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  id v10 = [v9 objectForKeyedSubscript:@"kCBMsgArgTimeXpcTimestampsTracking"];
  id v11 = (void *)MEMORY[0x263EFF9A0];
  if (v10)
  {
    __int16 v12 = [v9 objectForKeyedSubscript:@"kCBMsgArgTimeXpcTimestampsTracking"];
    id v13 = [v11 dictionaryWithDictionary:v12];
  }
  else
  {
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
  }

  if (!a6) {
    a6 = clock_gettime_nsec_np(_CLOCK_MONOTONIC) / 0xF4240;
  }
  id v14 = (void *)[objc_alloc(NSNumber) initWithLongLong:a6];
  [v13 setObject:v14 forKeyedSubscript:@"kCBMsgArgTimeXpcWiProxUpdateAdv"];

  [v9 setObject:v13 forKeyedSubscript:@"kCBMsgArgTimeXpcTimestampsTracking"];
  BOOL v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedLong:a5];
  [v9 setObject:v15 forKeyedSubscript:*MEMORY[0x263EFEE88]];

  int v16 = (void *)[objc_alloc(NSNumber) initWithBool:v8];
  [v9 setObject:v16 forKeyedSubscript:@"kCBMsgArgTimeXpcMetricsOnlyFlag"];

  return v9;
}

void __45__WPDAdvertisingManager_isAdvertiserTestMode__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 server];
  LODWORD(v7) = [v9 isClientTestMode:v8];

  if (v7)
  {
    uint64_t v10 = [v12 count];

    id v11 = v12;
    if (v10)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {

    id v11 = v12;
  }
}

- (BOOL)heySiriAdvertActiveAllDevices
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(WPDAdvertisingManager *)self advertisingRequests];
  int v4 = [v3 allRequests];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v14 + 1) + 8 * v8) clientType] == 8) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if ([(WPDManager *)self isAdvertisingAllowlistedForType:8])
    {
      BOOL v9 = 1;
      goto LABEL_17;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_391);
    }
    uint64_t v10 = WiProxLog;
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEFAULT, "WPClientHeySiri advertising is denylisted or not allowlisted", buf, 2u);
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:

LABEL_16:
    BOOL v9 = 0;
  }
LABEL_17:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_394_0);
  }
  id v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    id v12 = @"NO";
    if (v9) {
      id v12 = @"YES";
    }
    *(_DWORD *)long long buf = 138412290;
    __int16 v19 = v12;
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_INFO, "heySiriAdvertActive: %@", buf, 0xCu);
  }
  return v9;
}

- (void)informClientsAdvertisingPending:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  uint64_t v6 = [(WPDAdvertisingManager *)self clientAdvertisingRequests];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__WPDAdvertisingManager_informClientsAdvertisingPending___block_invoke;
  v12[3] = &unk_26469B5B0;
  id v7 = v4;
  id v13 = v7;
  id v14 = v5;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__WPDAdvertisingManager_informClientsAdvertisingPending___block_invoke_2;
  v10[3] = &unk_26469B0F8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v10];
}

void __57__WPDAdvertisingManager_informClientsAdvertisingPending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) clientType];
        if (v11 == [*(id *)(a1 + 32) clientType]) {
          [*(id *)(a1 + 40) addObject:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void __57__WPDAdvertisingManager_informClientsAdvertisingPending___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 server];
  id v5 = [v6 getClientForUUID:v4];

  objc_msgSend(v5, "advertisingPendingOfType:", objc_msgSend(*(id *)(a1 + 40), "clientType"));
}

- (void)resetAdvertisingManager
{
  uint64_t v3 = [(WPDManager *)self server];
  id v4 = [v3 statsManager];
  [v4 stopActivity:1];

  [(WPDAdvertisingManager *)self setCurrentConnectableAdvertisingData:0];
  [(WPDAdvertisingManager *)self setCurrentNonConnectableAdvertisingData:0];
  [(WPDAdvertisingManager *)self setCurrentNonConnectableSecondaryAdvertisingData:0];
  id v5 = [(WPDAdvertisingManager *)self publishedServices];
  [v5 removeAllObjects];

  id v6 = [(WPDAdvertisingManager *)self preallocatedServices];
  [v6 removeAllObjects];
}

- (void)update
{
  switch([(WPDManager *)self state])
  {
    case 0:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_406_0);
      }
      uint64_t v3 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "Peripheral manager is unknown state", v9, 2u);
      }
      break;
    case 1:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_400_0);
      }
      id v4 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "Peripheral manager is resetting, clearing currently advertising manager data", buf, 2u);
      }
      [(WPDAdvertisingManager *)self resetAdvertisingManager];
      break;
    case 2:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_397);
      }
      id v5 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "Peripheral manager is powered off, unauthorized or not supported", v12, 2u);
      }
      id v6 = [(WPDManager *)self server];
      uint64_t v7 = [v6 statsManager];
      [v7 stopActivity:1];

      break;
    case 3:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_403_0);
      }
      uint64_t v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Peripheral manager is powered on", v10, 2u);
      }
      [(WPDAdvertisingManager *)self preallocateServices];
      [(WPDAdvertisingManager *)self updateAdvertiser];
      break;
    default:
      return;
  }
}

void __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_427(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) clientsToNotifyOnAddressChange];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v6, "clientType"));
  int v5 = [v3 containsObject:v4];

  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
}

void __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_434(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clientAdvertisingRequests];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_2_435;
  v7[3] = &unk_26469B7E8;
  char v10 = *(unsigned char *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
}

void __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_2_435(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    if (*(unsigned char *)(a1 + 48))
    {
      if ([*(id *)(a1 + 32) connectable])
      {
LABEL_6:
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:*(void *)(a1 + 32) forKey:v5];
        goto LABEL_7;
      }
      if (*(unsigned char *)(a1 + 48)) {
        goto LABEL_7;
      }
    }
    if ([*(id *)(a1 + 32) connectable]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:
}

void __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_438(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) server];
  id v8 = [v7 getClientForUUID:v5];

  if (v8)
  {
    id v9 = (id)[*(id *)(a1 + 32) removeAdvertisingRequest:v6 forClient:v5 shouldUpdate:0];
    char v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    int v11 = [NSString stringWithFormat:@"Local address changed, client %d restart advertisement", objc_msgSend(v6, "clientType")];
    v17[0] = v11;
    long long v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v13 = [v10 errorWithDomain:@"WPErrorDomain" code:28 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    objc_msgSend(v8, "advertisingStoppedOfType:withError:", objc_msgSend(v6, "clientType"), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  __int16 v38 = v7;
  id v9 = [v7 identifier];
  char v10 = [v8 UUID];
  uint64_t v40 = [v10 UUIDString];

  int v11 = [v8 service];
  long long v12 = [v11 UUID];
  id v39 = [v12 UUIDString];

  uint64_t v37 = v8;
  uint64_t v13 = [(WPDAdvertisingManager *)self getClientUUIDsForCharacteristic:v8];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_444);
  }
  uint64_t v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = v14;
    uint64_t v16 = [v38 identifier];
    uint64_t v17 = [v16 UUIDString];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v50 = v13;
    __int16 v51 = 2114;
    id v52 = v40;
    __int16 v53 = 2114;
    v54 = v17;
    _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_DEFAULT, "Clients %{public}@ subscribed for characteristic %{public}@ for central %{public}@", buf, 0x20u);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v13;
  uint64_t v18 = [(WPDConnection *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v45;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(WPDConnection **)(*((void *)&v44 + 1) + 8 * v21);
        uint64_t v23 = [(WPDManager *)self server];
        uint64_t v24 = [v23 getClientForUUID:v22];

        if (v24)
        {
          uint64_t v25 = [v24 connectionForUUID:v9];
          if (v25)
          {
            uint64_t v26 = (WPDConnection *)v25;
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_447);
            }
            id v27 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              uint64_t v50 = v26;
              __int16 v51 = 2112;
              id v52 = v22;
              _os_log_error_impl(&dword_22316D000, v27, OS_LOG_TYPE_ERROR, "We already have a %@ for client %@", buf, 0x16u);
            }
            uint64_t v28 = [(WPDConnection *)v26 getCentral];
            if (v28)
            {

              goto LABEL_28;
            }
            id v34 = [(WPDConnection *)v26 getPeripheral];

            if (v34)
            {
LABEL_28:
              if (![(WPDConnection *)v26 didConnectSent]
                && (![(WPDConnection *)v26 fetchConnectionType]
                 || [(WPDConnection *)v26 fetchConnectionType] == 2))
              {
                if (WPLogInitOnce != -1) {
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_453);
                }
                id v35 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
                  -[WPDAdvertisingManager peripheralManager:central:didSubscribeToCharacteristic:](&v42, v43, v35);
                }
                [v24 central:v9 subscribed:1 toCharacteristic:v40 inService:v39];
              }
              goto LABEL_36;
            }
            int v30 = [(WPDAdvertisingManager *)self getCharacteristicForClient:v22];
            [(WPDConnection *)v26 updateWithCentral:v38 characteristic:v30];
            [v24 createdConnection:v26];
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_450);
            }
            uint64_t v31 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
LABEL_25:
              id v32 = v31;
              uint64_t v33 = [(WPDConnection *)v22 UUIDString];
              *(_DWORD *)long long buf = 138543618;
              uint64_t v50 = v26;
              __int16 v51 = 2114;
              id v52 = v33;
              _os_log_impl(&dword_22316D000, v32, OS_LOG_TYPE_DEFAULT, "Created central connection %{public}@ for client %{public}@ - send didSubscribe", buf, 0x16u);
            }
          }
          else
          {
            int v30 = [(WPDAdvertisingManager *)self getCharacteristicForClient:v22];
            uint64_t v26 = [[WPDConnection alloc] initWithCentral:v38 characteristic:v30];
            [(WPDConnection *)v26 setClient:v24];
            [v24 createdConnection:v26];
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_457);
            }
            uint64_t v31 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_25;
            }
          }
          [v24 central:v9 subscribed:1 toCharacteristic:v40 inService:v39];

LABEL_36:
          goto LABEL_37;
        }
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_460);
        }
        uint64_t v29 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v50 = v22;
          __int16 v51 = 2112;
          id v52 = v40;
          _os_log_error_impl(&dword_22316D000, v29, OS_LOG_TYPE_ERROR, "Couldn't find client %@ associated with this characteristic %@ (subscribing)", buf, 0x16u);
        }
LABEL_37:

        ++v21;
      }
      while (v19 != v21);
      uint64_t v36 = [(WPDConnection *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      uint64_t v19 = v36;
    }
    while (v36);
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 identifier];
  char v10 = [v8 UUID];
  int v11 = [v10 UUIDString];

  long long v12 = [v8 service];
  uint64_t v13 = [v12 UUID];
  id v39 = [v13 UUIDString];

  uint64_t v14 = [(WPDAdvertisingManager *)self getClientUUIDsForCharacteristic:v8];
  uint64_t v37 = v8;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_462);
  }
  long long v15 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    uint64_t v17 = objc_msgSend(v7, "identifier", v8);
    uint64_t v18 = [v17 UUIDString];
    *(_DWORD *)long long buf = 138543874;
    long long v47 = v14;
    __int16 v48 = 2114;
    v49 = v11;
    __int16 v50 = 2114;
    __int16 v51 = v18;
    _os_log_impl(&dword_22316D000, v16, OS_LOG_TYPE_DEFAULT, "Clients %{public}@ unsubscribed for characteristic %{public}@ for central %{public}@", buf, 0x20u);
  }
  __int16 v38 = v7;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v14;
  uint64_t v19 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v42;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v41 + 1) + 8 * v22);
        uint64_t v24 = [(WPDManager *)self server];
        uint64_t v25 = [v24 getClientForUUID:v23];

        uint64_t v26 = [v25 connectionForUUID:v9];
        id v27 = v26;
        if (v25) {
          BOOL v28 = v26 == 0;
        }
        else {
          BOOL v28 = 1;
        }
        if (!v28)
        {
          if (![v26 fetchConnectionType] || objc_msgSend(v27, "fetchConnectionType") == 2)
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_465_0);
            }
            id v32 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v33 = v32;
              id v34 = [v25 clientUUID];
              *(_DWORD *)long long buf = 138543874;
              long long v47 = v9;
              __int16 v48 = 2114;
              v49 = v11;
              __int16 v50 = 2114;
              __int16 v51 = v34;
              _os_log_impl(&dword_22316D000, v33, OS_LOG_TYPE_DEFAULT, "Central %{public}@ unsubsribed from characteristic %{public}@ for client %{public}@ - send didUnSubsribe", buf, 0x20u);
            }
            [v25 central:v9 subscribed:0 toCharacteristic:v11 inService:v39];
            goto LABEL_37;
          }
LABEL_28:
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_474_0);
          }
          uint64_t v35 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            long long v47 = v23;
            __int16 v48 = 2112;
            v49 = v11;
            int v30 = v35;
            uint64_t v31 = "Couldn't find client %@ associated with this characteristic %@ (unsubscribing)";
            goto LABEL_36;
          }
          goto LABEL_37;
        }
        if (!v25)
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_468);
          }
          uint64_t v36 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            long long v47 = v23;
            __int16 v48 = 2112;
            v49 = v11;
            int v30 = v36;
            uint64_t v31 = "client associated with client UUID %@ doesn't exist and characteristic %@ (unsubscribing)";
            goto LABEL_36;
          }
          goto LABEL_37;
        }
        if (v26) {
          goto LABEL_28;
        }
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_471_0);
        }
        uint64_t v29 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          long long v47 = v23;
          __int16 v48 = 2112;
          v49 = v11;
          int v30 = v29;
          uint64_t v31 = "connection associated with client UUID %@ doesn't exist and characteristic %@ (unsubscribing)";
LABEL_36:
          _os_log_impl(&dword_22316D000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0x16u);
        }
LABEL_37:

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v20);
  }
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_476);
  }
  id v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "Read request received, ignoring", v8, 2u);
  }
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = a4;
  uint64_t v40 = [obj countByEnumeratingWithState:&v55 objects:v70 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v56;
    *(void *)&long long v7 = 138412290;
    long long v37 = v7;
    long long v44 = self;
    id v43 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v56 != v39) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v55 + 1) + 8 * v8);
        long long v47 = objc_msgSend(v9, "characteristic", v37);
        char v10 = -[WPDAdvertisingManager getClientUUIDsForCharacteristic:](self, "getClientUUIDsForCharacteristic:");
        if ([v10 count])
        {
          long long v41 = v10;
          uint64_t v42 = v8;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v48 = v10;
          uint64_t v50 = [v48 countByEnumeratingWithState:&v51 objects:v69 count:16];
          if (v50)
          {
            uint64_t v11 = *(void *)v52;
            uint64_t v45 = *(void *)v52;
            long long v46 = v9;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v52 != v11) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v13 = *(void *)(*((void *)&v51 + 1) + 8 * v12);
                uint64_t v14 = [(WPDManager *)self server];
                long long v15 = [v14 getClientForUUID:v13];

                uint64_t v16 = [v9 central];
                uint64_t v17 = [v16 identifier];

                uint64_t v18 = [v15 connectionForUUID:v17];
                uint64_t v19 = (void *)v18;
                if (v15) {
                  BOOL v20 = v18 == 0;
                }
                else {
                  BOOL v20 = 1;
                }
                if (v20)
                {
                  if (WPLogInitOnce != -1) {
                    dispatch_once(&WPLogInitOnce, &__block_literal_global_484);
                  }
                  uint64_t v21 = (void *)WiProxLog;
                  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
                  {
                    id v32 = v21;
                    uint64_t v33 = [v15 clientUUID];
                    id v34 = [v15 processName];
                    uint64_t v35 = [v19 fetchConnectionType];
                    *(_DWORD *)long long buf = 134219010;
                    __int16 v60 = v15;
                    __int16 v61 = 2112;
                    __int16 v62 = v33;
                    __int16 v63 = 2112;
                    uint64_t v64 = v34;
                    __int16 v65 = 2048;
                    uint64_t v66 = v19;
                    __int16 v67 = 2048;
                    uint64_t v68 = v35;
                    _os_log_error_impl(&dword_22316D000, v32, OS_LOG_TYPE_ERROR, "client %p, client UUID %@, client name %@, connection %p or connection type %ld is invalid, send RequestNotSupported", buf, 0x34u);

                    self = v44;
                  }
                  [v6 respondToRequest:v9 withResult:6];
                }
                else
                {
                  v49 = [v9 value];
                  uint64_t v22 = [v47 UUID];
                  uint64_t v23 = [v22 UUIDString];

                  uint64_t v24 = [v47 service];
                  uint64_t v25 = [v24 UUID];
                  uint64_t v26 = [v25 UUIDString];

                  if (WPLogInitOnce != -1) {
                    dispatch_once(&WPLogInitOnce, &__block_literal_global_481);
                  }
                  id v27 = (void *)WiProxLog;
                  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
                  {
                    BOOL v28 = v27;
                    uint64_t v29 = [v17 UUIDString];
                    int v30 = [v15 clientUUID];
                    uint64_t v31 = [v30 UUIDString];
                    *(_DWORD *)long long buf = 138412802;
                    __int16 v60 = v29;
                    __int16 v61 = 2112;
                    __int16 v62 = v23;
                    __int16 v63 = 2112;
                    uint64_t v64 = v31;
                    _os_log_impl(&dword_22316D000, v28, OS_LOG_TYPE_INFO, "Received Write Request from Central %@ for characteristic %@ for client %@", buf, 0x20u);

                    id v6 = v43;
                    self = v44;
                  }
                  [v15 receivedData:v49 fromCharacteristic:v23 inService:v26 forPeripheral:v17];
                  id v9 = v46;
                  [v6 respondToRequest:v46 withResult:0];

                  uint64_t v11 = v45;
                }

                ++v12;
              }
              while (v50 != v12);
              uint64_t v50 = [v48 countByEnumeratingWithState:&v51 objects:v69 count:16];
            }
            while (v50);
          }

          char v10 = v41;
          uint64_t v8 = v42;
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_478);
          }
          uint64_t v36 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v37;
            __int16 v60 = v47;
            _os_log_error_impl(&dword_22316D000, v36, OS_LOG_TYPE_ERROR, "Received Write Request for characteristic %@ for which no centrals have subscribed, send RequestNotSupported", buf, 0xCu);
          }
          [v6 respondToRequest:v9 withResult:6];
        }

        ++v8;
      }
      while (v8 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v55 objects:v70 count:16];
    }
    while (v40);
  }
}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_486_0);
  }
  id v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_INFO, "Peripheral Manager is now ready to update subscribers", v8, 2u);
  }
  id v6 = [(WPDManager *)self server];
  long long v7 = [v6 getAllClients];

  [v7 enumerateObjectsUsingBlock:&__block_literal_global_490];
}

uint64_t __69__WPDAdvertisingManager_peripheralManagerIsReadyToUpdateSubscribers___block_invoke_487(uint64_t a1, void *a2)
{
  return [a2 readyForDataTransfer];
}

- (int)maxAdvertisingRules
{
  if (+[WPDaemonServer supportsNC2AdvertisingInstance]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)NSUUIDfromCBUUID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 UUIDString];

  long long v7 = (void *)[v5 initWithUUIDString:v6];
  return v7;
}

void __60__WPDAdvertisingManager_platformSupportsMultipleAdvertising__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v1 = [*(id *)(a1 + 32) connectablePeripheralManager];
  platformSupportsMultipleAdvertising_supported = [v1 supportsMultipleAdvertising];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_497);
  }
  id v2 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    if (platformSupportsMultipleAdvertising_supported) {
      id v3 = "supports";
    }
    else {
      id v3 = "doesn't support";
    }
    int v4 = 136446210;
    id v5 = v3;
    _os_log_impl(&dword_22316D000, v2, OS_LOG_TYPE_DEFAULT, "Platform %{public}s multiple advertising", (uint8_t *)&v4, 0xCu);
  }
}

- (id)getClientUUIDsForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [(WPDAdvertisingManager *)self publishedServices];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__WPDAdvertisingManager_getClientUUIDsForCharacteristic___block_invoke;
  v12[3] = &unk_26469B860;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __57__WPDAdvertisingManager_getClientUUIDsForCharacteristic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = getFirstCharacteristicForService(a3);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 UUID];
    id v8 = [*(id *)(a1 + 32) UUID];
    int v9 = [v7 isEqual:v8];

    if (v9) {
      [*(id *)(a1 + 40) addObject:v10];
    }
  }
}

- (id)getCharacteristicForClient:(id)a3
{
  id v4 = a3;
  id v5 = [(WPDAdvertisingManager *)self publishedServices];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = getFirstCharacteristicForService(v6);

  return v7;
}

- (void)statsExportTimerFired
{
  id v3 = [(WPDManager *)self server];
  id v4 = [v3 serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WPDAdvertisingManager_statsExportTimerFired__block_invoke;
  block[3] = &unk_26469AD50;
  block[4] = self;
  dispatch_async(v4, block);
}

void __46__WPDAdvertisingManager_statsExportTimerFired__block_invoke(uint64_t a1)
{
  v60[2] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) connectableAdvTotalCount])
  {
    v59[1] = @"DroppedAdvertisementTypePercent";
    v60[0] = @"ConnectableAdvertisements";
    v59[0] = @"DroppedAdvertisementType";
    id v2 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "connectableAdvDropCount")/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "connectableAdvTotalCount")* 100.0);
    v60[1] = v2;
    id v3 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];

    id v4 = v3;
    id v5 = [NSString stringWithFormat:@"%@%@", @"com.apple.Bluetooth.", @"AdvTypesBufferDropInfo"];
    long long v54 = v4;
    id v6 = v4;
    AnalyticsSendEventLazy();
  }
  if ([*(id *)(a1 + 32) nonConnectableAdvTotalCount])
  {
    v57[1] = @"DroppedAdvertisementTypePercent";
    v58[0] = @"NonConnectableAdvertisements";
    v57[0] = @"DroppedAdvertisementType";
    id v7 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "nonConnectableAdvDropCount")/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "nonConnectableAdvTotalCount")* 100.0);
    v58[1] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];

    id v9 = v8;
    id v10 = [NSString stringWithFormat:@"%@%@", @"com.apple.Bluetooth.", @"AdvTypesBufferDropInfo"];
    long long v55 = v9;
    id v11 = v9;
    AnalyticsSendEventLazy();
  }
  int v12 = 0;
  uint64_t v13 = 1;
  unint64_t v14 = 0x263EFF000uLL;
  do
  {
    id v15 = objc_alloc_init(*(Class *)(v14 + 2464));
    id v16 = objc_alloc_init(*(Class *)(v14 + 2464));
    uint64_t v17 = [*(id *)(a1 + 32) advMetrics];
    unint64_t v18 = [v17 totalAdvCountforType:v13];

    uint64_t v19 = [*(id *)(a1 + 32) advMetrics];
    unint64_t v20 = [v19 totalDroppedAdvCountforType:v13];

    if (v20) {
      BOOL v21 = v18 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21)
    {
      uint64_t v23 = 0;
    }
    else
    {
      long long v53 = v16;
      int v22 = 0;
      uint64_t v23 = 0;
      double v24 = (double)v18;
      do
      {
        uint64_t v25 = (v22 + 1);
        if (v12 != v22)
        {
          uint64_t v26 = [*(id *)(a1 + 32) advMetrics];
          unint64_t v27 = [v26 droppedAdvCountforType:v13 by:v25];

          uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Type%d", v25);

          uint64_t v29 = [NSNumber numberWithDouble:(double)v27 / v24 * 100.0];
          [v15 setObject:v29 forKeyedSubscript:v28];

          uint64_t v23 = (void *)v28;
        }
        int v22 = v25;
      }
      while (v25 != 26);
      int v30 = [v15 keysSortedByValueUsingComparator:&__block_literal_global_518];
      unint64_t v31 = [v30 count];
      id v32 = objc_msgSend(NSString, "stringWithFormat:", @"Type%d", v13);
      [v53 setObject:v32 forKeyedSubscript:@"DroppedAdvertisementType"];

      uint64_t v33 = [NSNumber numberWithDouble:(double)v20 / v24 * 100.0];
      [v53 setObject:v33 forKeyedSubscript:@"DroppedAdvertisementTypePercent"];

      if (v31)
      {
        id v34 = [v30 objectAtIndexedSubscript:0];
        uint64_t v35 = [v15 objectForKeyedSubscript:v34];

        if (v35)
        {
          uint64_t v36 = [v30 objectAtIndexedSubscript:0];
          [v53 setObject:v36 forKeyedSubscript:@"HighestDropsByAdvertisementType"];

          long long v37 = [v30 objectAtIndexedSubscript:0];
          __int16 v38 = [v15 objectForKeyedSubscript:v37];
          [v53 setObject:v38 forKeyedSubscript:@"HighestDropsByAdvertisementTypePercent"];
        }
        if (v31 >= 2)
        {
          uint64_t v39 = [v30 objectAtIndexedSubscript:1];
          uint64_t v40 = [v15 objectForKeyedSubscript:v39];

          if (v40)
          {
            long long v41 = [v30 objectAtIndexedSubscript:1];
            [v53 setObject:v41 forKeyedSubscript:@"SecondHighestDropsByAdvertisementType"];

            uint64_t v42 = [v30 objectAtIndexedSubscript:1];
            id v43 = [v15 objectForKeyedSubscript:v42];
            [v53 setObject:v43 forKeyedSubscript:@"SecondHighestDropsByAdvertisementTypePercent"];
          }
          if (v31 >= 3)
          {
            long long v44 = [v30 objectAtIndexedSubscript:2];
            uint64_t v45 = [v15 objectForKeyedSubscript:v44];

            if (v45)
            {
              long long v46 = [v30 objectAtIndexedSubscript:2];
              [v53 setObject:v46 forKeyedSubscript:@"ThirdHighestDropsByAdvertismentType"];

              long long v47 = [v30 objectAtIndexedSubscript:2];
              id v48 = [v15 objectForKeyedSubscript:v47];
              [v53 setObject:v48 forKeyedSubscript:@"ThirdHighestDropsByAdvertisementTypePercent"];
            }
          }
        }
      }
      id v49 = v53;
      uint64_t v50 = [NSString stringWithFormat:@"%@%@", @"com.apple.Bluetooth.", @"AdvTypesBufferDropInfo"];
      long long v56 = v49;
      id v51 = v49;
      AnalyticsSendEventLazy();

      id v16 = v53;
      unint64_t v14 = 0x263EFF000;
    }

    uint64_t v13 = (v13 + 1);
    ++v12;
  }
  while (v13 != 27);
  long long v52 = [*(id *)(a1 + 32) advMetrics];
  [v52 resetAllCounters];
}

uint64_t __46__WPDAdvertisingManager_statsExportTimerFired__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)setAdvertisingRequests:(id)a3
{
}

- (void)setClientAdvertisingRequests:(id)a3
{
}

- (void)setCurrentAdvertisers:(id)a3
{
}

- (void)setClientsToNotifyOnAddressChange:(id)a3
{
}

- (NSMutableDictionary)publishedServices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPublishedServices:(id)a3
{
}

- (void)setConnectablePeripheralManager:(id)a3
{
}

- (void)setNonConnectablePeripheralManager:(id)a3
{
}

- (void)setNonConnectableSecondaryPeripheralManager:(id)a3
{
}

- (WPDAdvertisingData)currentNonConnectableSecondaryAdvertisingData
{
  return self->_currentNonConnectableSecondaryAdvertisingData;
}

- (void)setAllowCompoundAdvertisements:(BOOL)a3
{
  self->_allowCompoundAdvertisements = a3;
}

- (NSMutableDictionary)preallocatedServices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPreallocatedServices:(id)a3
{
}

- (NSMutableSet)rangingClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRangingClients:(id)a3
{
}

- (unint64_t)nonConnectableAdvDropCount
{
  return self->_nonConnectableAdvDropCount;
}

- (void)setNonConnectableAdvDropCount:(unint64_t)a3
{
  self->_nonConnectableAdvDropCount = a3;
}

- (unint64_t)nonConnectableAdvTotalCount
{
  return self->_nonConnectableAdvTotalCount;
}

- (void)setNonConnectableAdvTotalCount:(unint64_t)a3
{
  self->_nonConnectableAdvTotalCount = a3;
}

- (unint64_t)connectableAdvDropCount
{
  return self->_connectableAdvDropCount;
}

- (void)setConnectableAdvDropCount:(unint64_t)a3
{
  self->_connectableAdvDropCount = a3;
}

- (unint64_t)connectableAdvTotalCount
{
  return self->_connectableAdvTotalCount;
}

- (void)setConnectableAdvTotalCount:(unint64_t)a3
{
  self->_connectableAdvTotalCount = a3;
}

- (AdvMetrics)advMetrics
{
  return (AdvMetrics *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAdvMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advMetrics, 0);
  objc_storeStrong((id *)&self->_rangingClients, 0);
  objc_storeStrong((id *)&self->_rangingTypes, 0);
  objc_storeStrong((id *)&self->_preallocatedServices, 0);
  objc_storeStrong((id *)&self->_currentNonConnectableSecondaryAdvertisingData, 0);
  objc_storeStrong((id *)&self->_currentNonConnectableAdvertisingData, 0);
  objc_storeStrong((id *)&self->_currentConnectableAdvertisingData, 0);
  objc_storeStrong((id *)&self->_nonConnectableSecondaryPeripheralManager, 0);
  objc_storeStrong((id *)&self->_nonConnectablePeripheralManager, 0);
  objc_storeStrong((id *)&self->_connectablePeripheralManager, 0);
  objc_storeStrong((id *)&self->_publishedServices, 0);
  objc_storeStrong((id *)&self->_clientsToNotifyOnAddressChange, 0);
  objc_storeStrong((id *)&self->_currentAdvertisers, 0);
  objc_storeStrong((id *)&self->_clientAdvertisingRequests, 0);
  objc_storeStrong((id *)&self->_advertisingRequests, 0);
}

- (void)initWithServer:(unsigned __int8 *)a1 .cold.1(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "Using allow compound advertisements: %d", (uint8_t *)v3, 8u);
}

- (void)addCharacteristic:(uint64_t)a1 forService:(void *)a2 forClient:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 uuid];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_22316D000, v6, v7, "Pre-allocated service %{public}@ does not have the characteristic %{public}@", v8, v9, v10, v11, v12);
}

- (void)addCharacteristic:(uint64_t)a1 forService:(void *)a2 forClient:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 uuid];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_22316D000, v6, v7, "Published service %{public}@ does not have the characteristic %{public}@", v8, v9, v10, v11, v12);
}

- (void)peripheralManager:(void *)a1 didAddService:(void *)a2 error:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 UUID];
  uint64_t v7 = [a3 localizedDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_22316D000, v8, v9, "Error adding service %{public}@, %{public}@", v10, v11, v12, v13, v14);
}

- (void)enableRanging:(void *)a3 forClient:.cold.1(char a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = a1 & 1;
  id v5 = a2;
  uint64_t v6 = [a3 rangingClients];
  v7[0] = 67109378;
  v7[1] = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  _os_log_debug_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEBUG, "WPAdvertisingManager ranging:%d for clients: %@", (uint8_t *)v7, 0x12u);
}

- (void)addAdvertisingRequest:(os_log_t)log forClient:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "Failed to start advertising because the advert is too big", v1, 2u);
}

- (void)addAdvertisingRequest:(void *)a3 forClient:.cold.2(void *a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a1;
  v6[0] = 67109376;
  v6[1] = [a2 clientType];
  __int16 v7 = 1024;
  int v8 = [a3 state];
  _os_log_error_impl(&dword_22316D000, v5, OS_LOG_TYPE_ERROR, "Failed to start advertising for type %d - peripheral is not powered on %d", (uint8_t *)v6, 0xEu);
}

- (void)isAdvertiserTestMode
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)a1 + 24)) {
    int v2 = @"YES";
  }
  else {
    int v2 = @"NO";
  }
  int v3 = 138412290;
  int v4 = v2;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "advertiserTestMode: %@", (uint8_t *)&v3, 0xCu);
}

- (void)peripheralManagerDidStartAdvertising:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = a1;
  int v4 = [a2 localizedDescription];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_22316D000, v3, OS_LOG_TYPE_ERROR, "Error starting advertising - %@", (uint8_t *)&v5, 0xCu);
}

- (void)peripheralManager:(os_log_t)log didStopAdvertisingWithError:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "[Privacy] Received didStopAdvertisingWithError delegate call back but no clients need address change notification", v1, 2u);
}

- (void)peripheralManager:(uint8_t *)buf central:(unsigned char *)a2 didSubscribeToCharacteristic:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "NOT Updating existing connection with a Central", buf, 2u);
}

@end