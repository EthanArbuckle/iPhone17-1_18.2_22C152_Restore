@interface WPDScanManager
+ (int64_t)zonesAvailableForType:(unsigned __int8)a3;
- (BOOL)heySiriScanActive:(BOOL)a3;
- (BOOL)isRanging;
- (BOOL)isScannerTestMode;
- (BOOL)retainDuplicates;
- (BOOL)scanOptionsChanged:(id)a3 ForRequests:(id)a4;
- (BOOL)scanning;
- (BOOL)scanningDisabled;
- (BOOL)shallStop;
- (BOOL)startTrackingPeripheral:(id)a3 ofType:(id)a4;
- (BOOL)updateScanRules;
- (CBCentralManager)centralManager;
- (CBController)cbDiscoveryAsserter;
- (NSDictionary)scanOptions;
- (NSIndexSet)currentScanners;
- (NSIndexSet)rangingTypes;
- (NSMutableDictionary)connectionsInProgress;
- (NSMutableDictionary)peerRequests;
- (NSMutableDictionary)scanRequests;
- (NSMutableSet)peripheralConnections;
- (NSMutableSet)spyScanClients;
- (NSNumber)scanRetainDuplicates;
- (NSSet)scanRequestHashes;
- (NSSet)scanRuleHashes;
- (OS_dispatch_queue)serverQueue;
- (WPDScanManager)initWithServer:(id)a3;
- (id)addPeerTrackingRequest:(id)a3 forClient:(id)a4;
- (id)addScanRequest:(id)a3 forClient:(id)a4;
- (id)clearDuplicateFilterCache:(id)a3 forClient:(id)a4;
- (id)connectToPeripheral:(id)a3 fromClient:(id)a4 withOptions:(id)a5;
- (id)disconnectFromPeripheral:(id)a3 withSubscribedCharacteristics:(id)a4 forClient:(id)a5;
- (id)generateStateDumpStrings;
- (id)getScanRequestsForClient:(id)a3;
- (id)removePeerTrackingRequest:(id)a3 checkZonesAvailable:(BOOL)a4 forClient:(id)a5;
- (id)removeScanRequest:(id)a3 forClient:(id)a4;
- (id)retrievePeripheralWithUUID:(id)a3;
- (id)ruleHashesFromScanOptions:(id)a3;
- (id)scanRequestHashesFromScanRequests:(id)a3;
- (void)addSpyScanClient:(id)a3;
- (void)assertCBDiscoveryScan:(BOOL)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4;
- (void)centralManager:(id)a3 didFindPeripheral:(id)a4 forType:(id)a5;
- (void)centralManager:(id)a3 didLosePeripheral:(id)a4 forType:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)cleanup;
- (void)clearExistingConnections;
- (void)disconnectFromCentral:(id)a3 forClient:(id)a4;
- (void)duplicateRulesGuard:(id)a3 forRule:(id)a4;
- (void)enableRanging:(BOOL)a3;
- (void)isScannerTestMode;
- (void)logScanRequests:(id)a3 method:(BOOL)a4 window:(int64_t)a5 interval:(int64_t)a6;
- (void)logScanTypes:(id)a3 method:(BOOL)a4 window:(int64_t)a5 interval:(int64_t)a6;
- (void)reconcileScanRule:(id)a3 withRule:(id)a4;
- (void)removeAllPeerTrackingRequestsForClient:(id)a3;
- (void)removeConflictingRequest:(id)a3 forClient:(id)a4;
- (void)removePeripheralConnection:(id)a3 forClient:(id)a4;
- (void)removePeripheralConnectionsForClient:(id)a3;
- (void)removeScanRequestsForClient:(id)a3;
- (void)removeSpyScanClient:(id)a3;
- (void)setCbDiscoveryAsserter:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setConnectionsInProgress:(id)a3;
- (void)setCurrentScanners:(id)a3;
- (void)setIsRanging:(BOOL)a3;
- (void)setPeerRequests:(id)a3;
- (void)setPeripheralConnections:(id)a3;
- (void)setScanOptions:(id)a3;
- (void)setScanRequestHashes:(id)a3;
- (void)setScanRequests:(id)a3;
- (void)setScanRetainDuplicates:(id)a3;
- (void)setScanRuleHashes:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setScanningDisabled:(BOOL)a3;
- (void)setServerQueue:(id)a3;
- (void)setSpyScanClients:(id)a3;
- (void)shallStop;
- (void)update;
- (void)updateScanner;
@end

@implementation WPDScanManager

uint64_t __33__WPDScanManager_updateScanRules__block_invoke_318(uint64_t a1, void *a2)
{
  return [a2 setStartPending:0];
}

- (BOOL)heySiriScanActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v5 = [(WPDScanManager *)self scanRequests];
  uint64_t v22 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v22)
  {
    uint64_t v6 = *(void *)v30;
    v23 = v5;
    uint64_t v21 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v9 = [(WPDScanManager *)self scanRequests];
        v10 = [v9 objectForKeyedSubscript:v8];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
LABEL_8:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            if ([*(id *)(*((void *)&v25 + 1) + 8 * v15) clientType] == 8)
            {
              if (!v3) {
                break;
              }
              v16 = [(WPDManager *)self server];
              char v17 = [v16 isClientTestMode:v8];

              if (v17) {
                break;
              }
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v13) {
                goto LABEL_8;
              }
              goto LABEL_16;
            }
          }

          if ([(WPDManager *)self isScanAllowlistedForType:8])
          {
            BOOL v18 = 1;
            goto LABEL_26;
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_246_0);
          }
          v19 = WiProxLog;
          BOOL v18 = 0;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "WPClientHeySiri scan is denylisted or not allowlisted", buf, 2u);
            goto LABEL_25;
          }
          goto LABEL_26;
        }
LABEL_16:

        v5 = v23;
        uint64_t v6 = v21;
      }
      uint64_t v22 = [v23 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

LABEL_25:
  BOOL v18 = 0;
LABEL_26:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_249_1);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDScanManager heySiriScanActive:]();
  }
  return v18;
}

- (BOOL)updateScanRules
{
  uint64_t v315 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WPDManager *)self server];
  v4 = [v3 statsManager];
  [v4 stopActivity:0];

  v5 = [(WPDScanManager *)self scanRequests];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v165 = [MEMORY[0x263EFF980] array];
    v164 = [MEMORY[0x263EFF980] array];
    BOOL v140 = [(WPDScanManager *)self isScannerTestMode];
    BOOL v7 = -[WPDScanManager heySiriScanActive:](self, "heySiriScanActive:");
    v166 = [MEMORY[0x263F089C8] indexSet];
    long long v287 = 0u;
    long long v286 = 0u;
    long long v285 = 0u;
    long long v284 = 0u;
    id obj = [(WPDScanManager *)self scanRequests];
    uint64_t v141 = [obj countByEnumeratingWithState:&v284 objects:v314 count:16];
    if (!v141) {
      goto LABEL_156;
    }
    char v170 = !v7;
    uint64_t v139 = *(void *)v285;
    id v162 = (id)*MEMORY[0x263EFEDA0];
    uint64_t v160 = *MEMORY[0x263EFED78];
    uint64_t v146 = *MEMORY[0x263EFEDC8];
    uint64_t v148 = *MEMORY[0x263EFEDD8];
    uint64_t v144 = *MEMORY[0x263EFEDD0];
    uint64_t v156 = *MEMORY[0x263EFED90];
    uint64_t v158 = *MEMORY[0x263EFEE78];
    uint64_t v154 = *MEMORY[0x263EFED88];
    *(void *)&long long v8 = 138412290;
    long long v137 = v8;
    uint64_t v150 = *MEMORY[0x263EFED98];
    uint64_t v152 = *MEMORY[0x263EFEDA8];
    uint64_t v143 = *MEMORY[0x263EFEDF8];
    while (1)
    {
      for (uint64_t i = 0; i != v141; uint64_t i = v90 + 1)
      {
        if (*(void *)v285 != v139) {
          objc_enumerationMutation(obj);
        }
        uint64_t v142 = i;
        uint64_t v10 = *(void *)(*((void *)&v284 + 1) + 8 * i);
        if (!v140
          || ([(WPDManager *)self server],
              id v11 = objc_claimAutoreleasedReturnValue(),
              char v12 = [v11 isClientTestMode:v10],
              v11,
              (v12 & 1) != 0))
        {
          uint64_t v13 = [(WPDManager *)self server];
          v167 = [v13 getClientForUUID:v10];

          uint64_t v14 = [(WPDScanManager *)self scanRequests];
          uint64_t v15 = [v14 objectForKeyedSubscript:v10];

          long long v283 = 0u;
          long long v282 = 0u;
          long long v281 = 0u;
          long long v280 = 0u;
          id v172 = v15;
          uint64_t v16 = [v172 countByEnumeratingWithState:&v280 objects:v313 count:16];
          if (!v16) {
            goto LABEL_149;
          }
          uint64_t v17 = *(void *)v281;
          while (1)
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v281 != v17) {
                objc_enumerationMutation(v172);
              }
              uint64_t v19 = *(void *)(*((void *)&v280 + 1) + 8 * v18);
              uint64_t v20 = [(id)v19 clientType];
              if (![(WPDManager *)self isScanAllowlistedForType:v20])
              {
                if (WPLogInitOnce != -1) {
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_268_0);
                }
                long long v25 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&buf[4] = v20;
                  _os_log_impl(&dword_22316D000, v25, OS_LOG_TYPE_DEFAULT, "Not scanning for client type (%ld) when denylisted or not allowlisted", buf, 0xCu);
                }
                goto LABEL_147;
              }
              if (v20 == 8) {
                char v21 = 1;
              }
              else {
                char v21 = v170;
              }
              if ((v21 & 1) == 0)
              {
                if (WPLogInitOnce != -1) {
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_271);
                }
                uint64_t v22 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&buf[4] = v20;
                  v23 = v22;
                  v24 = "Not scanning for client type (%ld) when HeySiri scan is active";
LABEL_23:
                  _os_log_debug_impl(&dword_22316D000, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0xCu);
                  goto LABEL_147;
                }
                goto LABEL_147;
              }
              if (v20 == 16)
              {
                v34 = [(WPDManager *)self server];
                int v35 = [v34 screenOff];

                if (!v35) {
                  goto LABEL_77;
                }
                memset(buf, 0, sizeof(buf));
                if (v19) {
                  [(id)v19 scanningRates];
                }
                v36 = [(WPDManager *)self server];
                if ([v36 isMirroring])
                {
                  if (v19)
                  {
                    [(id)v19 scanningRates];
                    BOOL v37 = v269 == 966;

                    if (v37)
                    {
                      *(void *)&buf[8] = 300;
                      if (WPLogInitOnce != -1) {
                        dispatch_once(&WPLogInitOnce, &__block_literal_global_280);
                      }
                      v38 = (id)WiProxLog;
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v307 = 134218240;
                        *(void *)&v307[4] = *(void *)&buf[8];
                        *(_WORD *)&v307[12] = 2048;
                        *(void *)&v307[14] = 16;
                        v39 = v38;
                        v40 = "Boosting screen off scan interval to %ld for client type (%ld) when mirroring";
                        goto LABEL_65;
                      }
                      goto LABEL_75;
                    }
LABEL_58:
                    v38 = [(WPDManager *)self server];
                    if ([v38 isMirroring]) {
                      goto LABEL_75;
                    }
                    if (!v19)
                    {
                      uint64_t v266 = 0;
                      uint64_t v265 = 0;
                      uint64_t v267 = 0;
                      goto LABEL_75;
                    }
                    [(id)v19 scanningRates];
                    BOOL v42 = v266 == 300;

                    if (v42)
                    {
                      *(void *)&buf[8] = 966;
                      if (WPLogInitOnce != -1) {
                        dispatch_once(&WPLogInitOnce, &__block_literal_global_283_0);
                      }
                      v38 = (id)WiProxLog;
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v307 = 134218240;
                        *(void *)&v307[4] = *(void *)&buf[8];
                        *(_WORD *)&v307[12] = 2048;
                        *(void *)&v307[14] = 16;
                        v39 = v38;
                        v40 = "Resetting screen off scan interval to %ld for client type (%ld) when not mirroring";
LABEL_65:
                        _os_log_impl(&dword_22316D000, v39, OS_LOG_TYPE_DEFAULT, v40, v307, 0x16u);
                      }
LABEL_75:
                    }
                    long long v263 = *(_OWORD *)buf;
                    uint64_t v264 = *(void *)&buf[16];
                    [(id)v19 setScanningRates:&v263];
                    goto LABEL_77;
                  }
                  uint64_t v269 = 0;
                  uint64_t v268 = 0;
                  uint64_t v270 = 0;
                }

                goto LABEL_58;
              }
              if (v20 == 12)
              {
                long long v26 = [(WPDManager *)self server];
                int v27 = [v26 screenOff];

                if (v27)
                {
                  memset(buf, 0, sizeof(buf));
                  if (v19) {
                    [(id)v19 scanningRates];
                  }
                  long long v28 = [(WPDManager *)self server];
                  if ([v28 isMirroring])
                  {
                    if (v19)
                    {
                      [(id)v19 scanningRates];
                      BOOL v29 = v278 == 0xFFFF;

                      if (v29)
                      {
                        [(id)v19 scanningRates];
                        *(void *)&buf[8] = v276;
                        if (WPLogInitOnce != -1) {
                          dispatch_once(&WPLogInitOnce, &__block_literal_global_274_0);
                        }
                        long long v30 = (id)WiProxLog;
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v307 = 134218240;
                          *(void *)&v307[4] = *(void *)&buf[8];
                          *(_WORD *)&v307[12] = 2048;
                          *(void *)&v307[14] = 12;
                          long long v31 = v30;
                          long long v32 = "Enabling screen off scan interval of %ld for client type (%ld) when mirroring";
                          uint32_t v33 = 22;
                          goto LABEL_71;
                        }
                        goto LABEL_72;
                      }
LABEL_52:
                      long long v30 = [(WPDManager *)self server];
                      if ([v30 isMirroring]) {
                        goto LABEL_72;
                      }
                      if (v19)
                      {
                        [(id)v19 scanningRates];
                        BOOL v41 = v274 == 0xFFFF;

                        if (v41) {
                          goto LABEL_73;
                        }
                      }
                      else
                      {
                        uint64_t v274 = 0;
                        uint64_t v273 = 0;
                        uint64_t v275 = 0;
                      }
                      *(void *)&buf[8] = 0xFFFFLL;
                      if (WPLogInitOnce != -1) {
                        dispatch_once(&WPLogInitOnce, &__block_literal_global_277);
                      }
                      long long v30 = (id)WiProxLog;
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v307 = 134217984;
                        *(void *)&v307[4] = 12;
                        long long v31 = v30;
                        long long v32 = "Disabling screen off scan for client type (%ld) when not mirroring";
                        uint32_t v33 = 12;
LABEL_71:
                        _os_log_impl(&dword_22316D000, v31, OS_LOG_TYPE_DEFAULT, v32, v307, v33);
                      }
LABEL_72:

LABEL_73:
                      long long v271 = *(_OWORD *)buf;
                      uint64_t v272 = *(void *)&buf[16];
                      [(id)v19 setScanningRates:&v271];
                      goto LABEL_77;
                    }
                    uint64_t v278 = 0;
                    uint64_t v277 = 0;
                    uint64_t v279 = 0;
                  }

                  goto LABEL_52;
                }
              }
LABEL_77:
              v43 = [(WPDManager *)self server];
              if (![v43 screenOff]) {
                goto LABEL_85;
              }
              if (!v19)
              {
                uint64_t v261 = 0;
                uint64_t v260 = 0;
                uint64_t v262 = 0;
LABEL_85:

                goto LABEL_86;
              }
              [(id)v19 scanningRates];

              if (v261 == 0xFFFF)
              {
                if (WPLogInitOnce != -1) {
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_286);
                }
                uint64_t v44 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&buf[4] = v20;
                  v23 = v44;
                  v24 = "Not scanning for client type (%ld) because we don't scan when screen is off";
                  goto LABEL_23;
                }
                goto LABEL_147;
              }
LABEL_86:
              v45 = [(WPDManager *)self server];
              if ([v45 systemLocked])
              {
                char v46 = [(id)v19 scanWhenLocked];

                if ((v46 & 1) == 0)
                {
                  if (WPLogInitOnce != -1) {
                    dispatch_once(&WPLogInitOnce, &__block_literal_global_289_0);
                  }
                  uint64_t v47 = WiProxLog;
                  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(void *)&buf[4] = v20;
                    v23 = v47;
                    v24 = "Not scanning for client type (%ld) because screen is locked";
                    goto LABEL_23;
                  }
                  goto LABEL_147;
                }
              }
              else
              {
              }
              if (!_os_feature_enabled_impl()) {
                goto LABEL_101;
              }
              v48 = [(WPDManager *)self server];
              if (![v48 screenOff])
              {

LABEL_101:
                v51 = (void *)MEMORY[0x263EFF9A0];
                id v311 = v162;
                v52 = [NSNumber numberWithUnsignedChar:v20];
                v312 = v52;
                v53 = [NSDictionary dictionaryWithObjects:&v312 forKeys:&v311 count:1];
                v54 = [v51 dictionaryWithDictionary:v53];

                v55 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)v19, "allowDuplicates"));
                [v54 setObject:v55 forKeyedSubscript:v160];

                if ((v20 - 15) <= 1u)
                {
                  if (v19)
                  {
                    [(id)v19 scanningRates];
                    if (v259 <= 65534)
                    {
                      v56 = NSNumber;
                      [(id)v19 scanningRates];
                      uint64_t v57 = v256;
                      goto LABEL_106;
                    }
                    goto LABEL_107;
                  }
                  uint64_t v57 = 0;
                  uint64_t v258 = 0;
                  uint64_t v257 = 0;
                  uint64_t v259 = 0;
                  v56 = NSNumber;
                  uint64_t v256 = 0;
                  uint64_t v254 = 0;
                  uint64_t v255 = 0;
LABEL_106:
                  v58 = [v56 numberWithInteger:v57];
                  [v54 setObject:v58 forKeyedSubscript:v148];

                  if (v19)
                  {
LABEL_107:
                    [(id)v19 scanningRates];
                    if (v251 <= 65534)
                    {
                      v59 = NSNumber;
                      [(id)v19 scanningRates];
                      uint64_t v60 = v248;
                      goto LABEL_110;
                    }
                    goto LABEL_111;
                  }
                  uint64_t v60 = 0;
                  uint64_t v252 = 0;
                  uint64_t v251 = 0;
                  uint64_t v253 = 0;
                  v59 = NSNumber;
                  uint64_t v250 = 0;
                  uint64_t v248 = 0;
                  uint64_t v249 = 0;
LABEL_110:
                  v61 = [v59 numberWithInteger:v60];
                  [v54 setObject:v61 forKeyedSubscript:v146];

                  if (v19)
                  {
LABEL_111:
                    [(id)v19 scanningRates];
                    if (v246 <= 65534)
                    {
                      v62 = NSNumber;
                      [(id)v19 scanningRates];
                      uint64_t v63 = v243;
                      goto LABEL_114;
                    }
                  }
                  else
                  {
                    uint64_t v63 = 0;
                    uint64_t v246 = 0;
                    uint64_t v245 = 0;
                    uint64_t v247 = 0;
                    v62 = NSNumber;
                    uint64_t v244 = 0;
                    uint64_t v242 = 0;
                    uint64_t v243 = 0;
LABEL_114:
                    v64 = [v62 numberWithInteger:v63];
                    [v54 setObject:v64 forKeyedSubscript:v144];
                  }
                }
                v65 = [v167 bundleID];

                if (v65)
                {
                  v66 = (void *)MEMORY[0x263EFF8C0];
                  v67 = [v167 bundleID];
                  v68 = [v66 arrayWithObject:v67];
                  [v54 setObject:v68 forKeyedSubscript:v158];
                }
                v69 = [(id)v19 blobValue];
                BOOL v70 = [v69 length] == 0;

                if (!v70)
                {
                  v71 = [(id)v19 blobValue];
                  [v54 setObject:v71 forKeyedSubscript:v156];
                }
                v72 = [(id)v19 maskValue];
                BOOL v73 = [v72 length] == 0;

                if (!v73)
                {
                  v74 = [(id)v19 maskValue];
                  [v54 setObject:v74 forKeyedSubscript:v154];
                }
                v75 = [(id)v19 peers];
                BOOL v76 = [v75 count] == 0;

                if (!v76)
                {
                  v77 = [(id)v19 peers];
                  [v54 setObject:v77 forKeyedSubscript:v152];
                }
                v78 = [(id)v19 rssiThreshold];

                if (v78)
                {
                  v79 = [(id)v19 rssiThreshold];
                  [v54 setObject:v79 forKeyedSubscript:v150];
                }
                v80 = [(id)v19 useCaseList];
                BOOL v81 = [v80 count] == 0;

                if (!v81)
                {
                  v82 = [(id)v19 useCaseList];
                  [v54 setObject:v82 forKeyedSubscript:@"kCBOptionUseCaseList"];
                }
                if ([(id)v19 range] && -[WPDScanManager isRanging](self, "isRanging"))
                {
                  v83 = [(WPDScanManager *)self rangingTypes];
                  if (![v83 containsIndex:v20]) {
                    goto LABEL_135;
                  }
                  v84 = [(WPDManager *)self server];
                  char v85 = [v84 screenOff];

                  if ((v85 & 1) == 0)
                  {
                    [v54 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v143];
                    if (WPLogInitOnce != -1) {
                      dispatch_once(&WPLogInitOnce, &__block_literal_global_299);
                    }
                    v83 = (id)WiProxLog;
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v137;
                      *(void *)&buf[4] = v54;
                      _os_log_debug_impl(&dword_22316D000, v83, OS_LOG_TYPE_DEBUG, "[Ranging] scan rule with ranging: %@", buf, 0xCu);
                    }
LABEL_135:
                  }
                }
                if ([v166 containsIndex:v20])
                {
                  [(WPDScanManager *)self duplicateRulesGuard:v165 forRule:v54];
                }
                else
                {
                  [v165 addObject:v54];
                  [v166 addIndex:v20];
                }
                [v164 addObject:v19];
                v86 = [(WPDManager *)self server];
                if ([v86 screenOff])
                {
                  if (v19)
                  {
                    [(id)v19 scanningRates];
                    uint64_t v19 = v240;
                  }
                  else
                  {
                    uint64_t v240 = 0;
                    uint64_t v239 = 0;
                    uint64_t v241 = 0;
                  }
                }
                else if (v19)
                {
                  [(id)v19 scanningRates];
                  uint64_t v19 = v236;
                }
                else
                {
                  uint64_t v237 = 0;
                  uint64_t v236 = 0;
                  uint64_t v238 = 0;
                }

                BOOL v87 = v19 > 299;
                v88 = [(WPDManager *)self server];
                v89 = [v88 statsManager];
                [v89 startActivity:0 forType:v20 scanRate:v87];

                goto LABEL_147;
              }
              BOOL v49 = [(id)v19 advBuffer] == 0;

              if (v49) {
                goto LABEL_101;
              }
              if (WPLogInitOnce != -1) {
                dispatch_once(&WPLogInitOnce, &__block_literal_global_293_0);
              }
              uint64_t v50 = WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)&buf[4] = v20;
                v23 = v50;
                v24 = "Not scanning for client type (%ld) when screen is off and ADV Buffer is enabled";
                goto LABEL_23;
              }
LABEL_147:
              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [v172 countByEnumeratingWithState:&v280 objects:v313 count:16];
            if (!v16)
            {
LABEL_149:

              uint64_t v90 = v142;
              goto LABEL_154;
            }
          }
        }
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_265_0);
        }
        v91 = WiProxLog;
        uint64_t v90 = v142;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v137;
          *(void *)&buf[4] = v10;
          _os_log_debug_impl(&dword_22316D000, v91, OS_LOG_TYPE_DEBUG, "Not scanning for non-test client UUID: %@ when in test mode", buf, 0xCu);
        }
LABEL_154:
        ;
      }
      uint64_t v141 = [obj countByEnumeratingWithState:&v284 objects:v314 count:16];
      if (!v141)
      {
LABEL_156:

        if ([v165 count])
        {
          v92 = (void *)[objc_alloc(MEMORY[0x263F088D0]) initWithIndexSet:v166];
          [(WPDScanManager *)self setCurrentScanners:v92];

          uint64_t v232 = 0;
          v233 = &v232;
          uint64_t v234 = 0x2020000000;
          uint64_t v235 = 0xFFFFLL;
          v231[0] = MEMORY[0x263EF8330];
          v231[1] = 3221225472;
          v231[2] = __33__WPDScanManager_updateScanRules__block_invoke_303;
          v231[3] = &unk_26469B318;
          v231[4] = self;
          v231[5] = &v232;
          [v164 enumerateObjectsUsingBlock:v231];
          if (v233[3] < 0xFFFF)
          {
            uint64_t v227 = 0;
            v228 = &v227;
            uint64_t v229 = 0x2020000000;
            uint64_t v230 = 0xFFFFLL;
            v226[0] = MEMORY[0x263EF8330];
            v226[1] = 3221225472;
            v226[2] = __33__WPDScanManager_updateScanRules__block_invoke_307;
            v226[3] = &unk_26469B340;
            v226[4] = &v227;
            [v164 enumerateObjectsUsingBlock:v226];
            if (v228[3] < 0xFFFF)
            {
              *(void *)v307 = 0;
              *(void *)&v307[8] = v307;
              *(void *)&v307[16] = 0x3032000000;
              v308 = __Block_byref_object_copy__2;
              v98 = (NSNumber *)MEMORY[0x263EFFA80];
              v309 = __Block_byref_object_dispose__2;
              id v310 = (id)MEMORY[0x263EFFA80];
              if (_os_feature_enabled_impl())
              {
                v99 = v225;
                v225[0] = MEMORY[0x263EF8330];
                v225[1] = 3221225472;
                v100 = __33__WPDScanManager_updateScanRules__block_invoke_311;
              }
              else
              {
                v99 = v224;
                v224[0] = MEMORY[0x263EF8330];
                v224[1] = 3221225472;
                v100 = __33__WPDScanManager_updateScanRules__block_invoke_2_312;
              }
              v99[2] = v100;
              v99[3] = &unk_26469B340;
              v99[4] = v307;
              [v164 enumerateObjectsUsingBlock:v137];
              uint64_t v218 = 0;
              v219 = &v218;
              uint64_t v220 = 0x3032000000;
              v221 = __Block_byref_object_copy__2;
              v222 = __Block_byref_object_dispose__2;
              v223 = v98;
              v217[0] = MEMORY[0x263EF8330];
              v217[1] = 3221225472;
              v217[2] = __33__WPDScanManager_updateScanRules__block_invoke_3;
              v217[3] = &unk_26469B318;
              v217[4] = self;
              v217[5] = &v218;
              [v164 enumerateObjectsUsingBlock:v217];
              uint64_t v211 = 0;
              v212 = &v211;
              uint64_t v213 = 0x3032000000;
              v214 = __Block_byref_object_copy__2;
              v215 = __Block_byref_object_dispose__2;
              v216 = v98;
              v210[0] = MEMORY[0x263EF8330];
              v210[1] = 3221225472;
              v210[2] = __33__WPDScanManager_updateScanRules__block_invoke_4;
              v210[3] = &unk_26469B340;
              v210[4] = &v211;
              [v164 enumerateObjectsUsingBlock:v210];
              uint64_t v204 = 0;
              v205 = &v204;
              uint64_t v206 = 0x3032000000;
              v207 = __Block_byref_object_copy__2;
              v208 = __Block_byref_object_dispose__2;
              v209 = v98;
              v203[0] = MEMORY[0x263EF8330];
              v203[1] = 3221225472;
              v203[2] = __33__WPDScanManager_updateScanRules__block_invoke_5;
              v203[3] = &unk_26469B340;
              v203[4] = &v204;
              [v164 enumerateObjectsUsingBlock:v203];
              uint64_t v197 = 0;
              v198 = &v197;
              uint64_t v199 = 0x3032000000;
              v200 = __Block_byref_object_copy__2;
              v201 = __Block_byref_object_dispose__2;
              v202 = v98;
              v196[0] = MEMORY[0x263EF8330];
              v196[1] = 3221225472;
              v196[2] = __33__WPDScanManager_updateScanRules__block_invoke_6;
              v196[3] = &unk_26469B340;
              v196[4] = &v197;
              [v164 enumerateObjectsUsingBlock:v196];
              uint64_t v192 = 0;
              v193 = &v192;
              uint64_t v194 = 0x2020000000;
              uint64_t v195 = 0;
              uint64_t v188 = 0;
              v189 = &v188;
              uint64_t v190 = 0x2020000000;
              int v191 = 0;
              v187[0] = MEMORY[0x263EF8330];
              v187[1] = 3221225472;
              v187[2] = __33__WPDScanManager_updateScanRules__block_invoke_7;
              v187[3] = &unk_26469B368;
              v187[5] = &v188;
              v187[6] = &v192;
              v187[4] = self;
              [v164 enumerateObjectsUsingBlock:v187];
              scanRetainDuplicates = self->_scanRetainDuplicates;
              self->_scanRetainDuplicates = v98;

              v102 = v164;
              if (_os_feature_enabled_impl())
              {
                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&uint8_t buf[16] = 0x2020000000;
                LOBYTE(v291) = 0;
                uint64_t v180 = 0;
                v181 = &v180;
                uint64_t v182 = 0x2020000000;
                LOBYTE(v183) = 0;
                if ([(id)v219[5] BOOLValue]) {
                  char v103 = 1;
                }
                else {
                  char v103 = [*(id *)(*(void *)&v307[8] + 40) BOOLValue];
                }
                LOBYTE(v183) = v103;
                if (!*((unsigned char *)v181 + 24))
                {
                  v186[0] = MEMORY[0x263EF8330];
                  v186[1] = 3221225472;
                  v186[2] = __33__WPDScanManager_updateScanRules__block_invoke_8;
                  v186[3] = &unk_26469B390;
                  v186[4] = buf;
                  v186[5] = &v180;
                  [v164 enumerateObjectsUsingBlock:v186];
                }
                if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
                  uint64_t v104 = *((unsigned __int8 *)v181 + 24) ^ 1u;
                }
                else {
                  uint64_t v104 = 0;
                }
                v105 = [NSNumber numberWithInt:v104];
                v106 = self->_scanRetainDuplicates;
                self->_scanRetainDuplicates = v105;

                if (WPLogInitOnce != -1) {
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_317);
                }
                v107 = (id)WiProxLog;
                if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
                {
                  BOOL v108 = [(NSNumber *)self->_scanRetainDuplicates BOOLValue];
                  int v109 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
                  int v110 = *((unsigned __int8 *)v181 + 24);
                  *(_DWORD *)v301 = 67109632;
                  *(_DWORD *)&v301[4] = v108;
                  LOWORD(v302) = 1024;
                  *(_DWORD *)((char *)&v302 + 2) = v109;
                  HIWORD(v302) = 1024;
                  LODWORD(v303) = v110;
                  _os_log_impl(&dword_22316D000, v107, OS_LOG_TYPE_INFO, "Retain duplicates:%d (askRetain:%d askReset:%d)", v301, 0x14u);
                }

                v102 = v164;
                [v164 enumerateObjectsUsingBlock:&__block_literal_global_320];
                _Block_object_dispose(&v180, 8);
                _Block_object_dispose(buf, 8);
              }
              uint64_t v180 = 0;
              v181 = &v180;
              uint64_t v182 = 0x3032000000;
              v183 = __Block_byref_object_copy__2;
              v184 = __Block_byref_object_dispose__2;
              id v185 = (id)MEMORY[0x263EFFA88];
              v179[0] = MEMORY[0x263EF8330];
              v179[1] = 3221225472;
              v179[2] = __33__WPDScanManager_updateScanRules__block_invoke_2_321;
              v179[3] = &unk_26469B340;
              v179[4] = &v180;
              [v102 enumerateObjectsUsingBlock:v179];
              *(void *)v301 = 0;
              v302 = v301;
              uint64_t v303 = 0x3032000000;
              v304 = __Block_byref_object_copy__2;
              v305 = __Block_byref_object_dispose__2;
              v306 = v98;
              v178[0] = MEMORY[0x263EF8330];
              v178[1] = 3221225472;
              v178[2] = __33__WPDScanManager_updateScanRules__block_invoke_3_322;
              v178[3] = &unk_26469B340;
              v178[4] = v301;
              [v102 enumerateObjectsUsingBlock:v178];
              uint64_t v111 = [(id)v219[5] BOOLValue];
              [(WPDScanManager *)self logScanTypes:v166 method:v111 window:v228[3] interval:v233[3]];
              long long v176 = 0u;
              long long v177 = 0u;
              long long v174 = 0u;
              long long v175 = 0u;
              id v163 = v165;
              uint64_t v112 = [v163 countByEnumeratingWithState:&v174 objects:v300 count:16];
              if (v112)
              {
                uint64_t v113 = *(void *)v175;
                uint64_t v159 = *MEMORY[0x263EFEDA0];
                uint64_t v155 = *MEMORY[0x263EFEDF8];
                uint64_t v157 = *MEMORY[0x263EFED98];
                uint64_t v151 = *MEMORY[0x263EFED88];
                uint64_t v153 = *MEMORY[0x263EFED90];
                uint64_t v149 = *MEMORY[0x263EFEDA8];
                uint64_t v147 = *MEMORY[0x263EFEE78];
                uint64_t v145 = *(void *)v175;
                do
                {
                  uint64_t v114 = 0;
                  uint64_t v161 = v112;
                  do
                  {
                    if (*(void *)v175 != v113) {
                      objc_enumerationMutation(v163);
                    }
                    v115 = *(void **)(*((void *)&v174 + 1) + 8 * v114);
                    if (WPLogInitOnce != -1) {
                      dispatch_once(&WPLogInitOnce, &__block_literal_global_325);
                    }
                    v116 = (id)WiProxLog;
                    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
                    {
                      log = v116;
                      id v173 = [v115 objectForKeyedSubscript:v159];
                      uint64_t v168 = [v173 integerValue];
                      v171 = [v115 objectForKeyedSubscript:v157];
                      uint64_t v117 = [v171 integerValue];
                      v118 = [v115 objectForKeyedSubscript:v155];
                      int v119 = [v118 BOOLValue];
                      v120 = [v115 objectForKeyedSubscript:v153];
                      v121 = [v115 objectForKeyedSubscript:v151];
                      v122 = [v115 objectForKeyedSubscript:v149];
                      uint64_t v123 = [v122 count];
                      v124 = [v115 objectForKeyedSubscript:v147];
                      *(_DWORD *)buf = 134219522;
                      *(void *)&buf[4] = v168;
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v117;
                      *(_WORD *)&buf[22] = 1024;
                      int v291 = v119;
                      __int16 v292 = 2114;
                      v293 = v120;
                      __int16 v294 = 2114;
                      v295 = v121;
                      __int16 v296 = 2048;
                      uint64_t v297 = v123;
                      __int16 v298 = 2112;
                      v299 = v124;
                      v116 = log;
                      _os_log_impl(&dword_22316D000, log, OS_LOG_TYPE_DEFAULT, "About to scan for type: %ld - rssi: %ld - range: %d - payload: %{public}@ - mask: %{public}@ - peers: %lu, bundleID: %@", buf, 0x44u);

                      uint64_t v112 = v161;
                      uint64_t v113 = v145;
                    }
                    ++v114;
                  }
                  while (v112 != v114);
                  uint64_t v112 = [v163 countByEnumeratingWithState:&v174 objects:v300 count:16];
                }
                while (v112);
              }

              uint64_t v125 = *(void *)(*(void *)&v307[8] + 40);
              uint64_t v126 = *MEMORY[0x263EFEE70];
              v288[0] = *MEMORY[0x263EFED50];
              v288[1] = v126;
              v289[0] = v125;
              v289[1] = MEMORY[0x263EFFA88];
              uint64_t v127 = *MEMORY[0x263EFED80];
              v289[2] = v163;
              uint64_t v128 = *MEMORY[0x263EFEDD8];
              v288[2] = v127;
              v288[3] = v128;
              v129 = [NSNumber numberWithInteger:v228[3]];
              v289[3] = v129;
              v288[4] = *MEMORY[0x263EFEDC8];
              v130 = [NSNumber numberWithInteger:v233[3]];
              v288[5] = *MEMORY[0x263EFED48];
              uint64_t v131 = v219[5];
              v289[4] = v130;
              v289[5] = v131;
              v288[6] = *MEMORY[0x263EFED58];
              v289[6] = v212[5];
              v288[7] = *MEMORY[0x263EFED70];
              v289[7] = v205[5];
              v288[8] = *MEMORY[0x263EFEDB0];
              v289[8] = v198[5];
              v288[9] = *MEMORY[0x263EFEDB8];
              v289[9] = v181[5];
              v288[10] = *MEMORY[0x263EFEE00];
              v289[10] = *((void *)v302 + 5);
              v288[11] = @"kCBScanOptionPriorityConfiguration";
              v132 = [NSNumber numberWithInteger:v193[3]];
              v289[11] = v132;
              v288[12] = *MEMORY[0x263EFEDE8];
              v133 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v189 + 6)];
              v288[13] = *MEMORY[0x263EFEDC0];
              v134 = self->_scanRetainDuplicates;
              v289[12] = v133;
              v289[13] = v134;
              v135 = [NSDictionary dictionaryWithObjects:v289 forKeys:v288 count:14];

              BOOL v94 = [(WPDScanManager *)self scanOptionsChanged:v135 ForRequests:v164];
              _Block_object_dispose(v301, 8);

              _Block_object_dispose(&v180, 8);
              _Block_object_dispose(&v188, 8);
              _Block_object_dispose(&v192, 8);
              _Block_object_dispose(&v197, 8);

              _Block_object_dispose(&v204, 8);
              _Block_object_dispose(&v211, 8);

              _Block_object_dispose(&v218, 8);
              _Block_object_dispose(v307, 8);
            }
            else
            {
              if (WPLogInitOnce != -1) {
                dispatch_once(&WPLogInitOnce, &__block_literal_global_310_0);
              }
              v97 = (id)WiProxLog;
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22316D000, v97, OS_LOG_TYPE_DEFAULT, "Scanning window is too high, not scanning", buf, 2u);
              }

              BOOL v94 = [(WPDScanManager *)self scanOptionsChanged:0 ForRequests:0];
            }
            _Block_object_dispose(&v227, 8);
          }
          else
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_306);
            }
            v93 = (id)WiProxLog;
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22316D000, v93, OS_LOG_TYPE_DEFAULT, "Scanning rate is too high, not scanning", buf, 2u);
            }

            BOOL v94 = [(WPDScanManager *)self scanOptionsChanged:0 ForRequests:0];
          }
          _Block_object_dispose(&v232, 8);
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_302);
          }
          v96 = (id)WiProxLog;
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22316D000, v96, OS_LOG_TYPE_DEFAULT, "No Scan requests that fit the current criteria, bailing", buf, 2u);
          }

          BOOL v94 = [(WPDScanManager *)self scanOptionsChanged:0 ForRequests:0];
        }

        return v94;
      }
    }
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_262_1);
  }
  v95 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22316D000, v95, OS_LOG_TYPE_DEFAULT, "Nothing left to scan for - Stopping Scan", buf, 2u);
  }
  return [(WPDScanManager *)self scanOptionsChanged:0 ForRequests:0];
}

uint64_t __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v6 = 138412546;
    long long v24 = v6;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        int v11 = objc_msgSend(v10, "clientType", v24, (void)v25);
        if ([*(id *)(a1 + 32) integerValue] == v11)
        {
          char v12 = [v10 peers];
          if (![v12 count])
          {

LABEL_22:
            uint64_t v22 = 1;
            goto LABEL_23;
          }
          uint64_t v13 = [v10 peers];
          char v14 = [v13 containsObject:*(void *)(a1 + 40)];

          if (v14) {
            goto LABEL_22;
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_427);
          }
          uint64_t v15 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = *(void *)(a1 + 40);
            uint64_t v16 = *(void **)(a1 + 48);
            *(_DWORD *)buf = v24;
            long long v30 = v16;
            __int16 v31 = 2112;
            uint64_t v32 = v17;
            _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_INFO, "Ignoring scan packet %@ because it's peer %@ is not being tracked", buf, 0x16u);
          }
          if ([v10 clientType] == 16)
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_430);
            }
            uint64_t v18 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
            {
              uint64_t v19 = v18;
              uint64_t v20 = [v10 peers];
              uint64_t v21 = *(void *)(a1 + 40);
              *(_DWORD *)buf = v24;
              long long v30 = v20;
              __int16 v31 = 2112;
              uint64_t v32 = v21;
              _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_INFO, "NearByInfo scanning for peers %@ but found %@", buf, 0x16u);
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v22 = 0;
LABEL_23:

  return v22;
}

void __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_439(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) server];
  uint64_t v5 = [v4 getClientForUUID:v3];

  if (v5)
  {
    long long v6 = (void *)[*(id *)(a1 + 40) copy];
    [v5 discoveredDevice:v6];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_442);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_439_cold_1();
    }
  }
}

void __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_425(uint64_t a1, void *a2, void *a3)
{
  v77[12] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_2;
  v67[3] = &unk_26469B498;
  id v8 = v5;
  id v68 = v8;
  id v69 = *(id *)(a1 + 40);
  id v59 = v6;
  id v70 = v59;
  v58 = [v7 keysOfEntriesPassingTest:v67];
  uint64_t v9 = *MEMORY[0x263EFECD8];
  uint64_t v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263EFECD8]];
  uint64_t v11 = *MEMORY[0x263EFECE0];
  uint64_t v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263EFECE0]];
  uint64_t v13 = *MEMORY[0x263EFECD0];
  uint64_t v57 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263EFECD0]];
  uint64_t v14 = *MEMORY[0x263EFECC0];
  v56 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263EFECC0]];
  uint64_t v15 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:*(void *)(a1 + 48)];
  uint64_t v16 = v15;
  BOOL v49 = (void *)v10;
  if (v10) {
    [v15 removeObjectForKey:v9];
  }
  if (v12) {
    [v16 removeObjectForKey:v11];
  }
  if (v57) {
    [v16 removeObjectForKey:v13];
  }
  if (v56) {
    [v16 removeObjectForKey:v14];
  }
  uint64_t v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263EFEC88]];
  v55 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263EFEC80]];
  v54 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263EFECC8]];
  uint64_t v18 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263EFECE8]];
  if ([v8 integerValue] == 15
    || [v8 integerValue] == 16
    || [v8 integerValue] == 7)
  {
    uint64_t v19 = [*(id *)(a1 + 56) centralManager];
    uint64_t v20 = [v19 sharedPairingAgent];
    uint64_t v21 = [v20 isPeerPaired:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v21 = 0;
  }
  v53 = (void *)v18;
  v52 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"kCBAdvDataProximityPairingStatusDecrypted"];
  v51 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"kCBAdvDataAccessoryStatusDecrypted"];
  v76[0] = @"kDeviceAdvertisingPacket";
  v76[1] = @"kDeviceAdvertisingData";
  uint64_t v47 = v16;
  v77[0] = v16;
  v77[1] = v59;
  uint64_t v22 = &unk_26D646E90;
  if (v55) {
    uint64_t v22 = v55;
  }
  v77[2] = v22;
  v76[2] = @"kDeviceChannel";
  v76[3] = @"kDeviceAddress";
  v23 = (void *)v17;
  if (!v17)
  {
    v23 = [MEMORY[0x263EFF8F8] data];
  }
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v25 = *(void *)(a1 + 80);
  v77[3] = v23;
  v77[4] = v24;
  v76[4] = @"kDeviceRSSI";
  v76[5] = @"kDevicePeripheralUUID";
  v77[5] = *(void *)(a1 + 40);
  v77[6] = v25;
  v76[6] = @"kDeviceManufacturerData";
  v76[7] = @"kDeviceName";
  v77[7] = *(void *)(a1 + 88);
  v77[8] = v8;
  v76[8] = @"kDeviceType";
  v76[9] = @"kDevicePaired";
  long long v26 = [NSNumber numberWithBool:v21];
  v77[9] = v26;
  v76[10] = @"kDeviceTime";
  uint64_t v27 = v18;
  long long v28 = (void *)v18;
  if (!v18)
  {
    long long v28 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  }
  v76[11] = @"kDeviceDataSaturated";
  BOOL v29 = (void *)MEMORY[0x263EFFA80];
  if (v54) {
    BOOL v29 = v54;
  }
  v77[10] = v28;
  v77[11] = v29;
  long long v30 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:12];
  __int16 v31 = (void *)[v30 mutableCopy];

  if (!v27) {
  if (!v17)
  }

  uint64_t v50 = v8;
  if (v52) {
    [v31 setObject:v52 forKeyedSubscript:@"kDeviceProxPairingStatusDecrypted"];
  }
  char v46 = (void *)v17;
  v48 = (void *)v12;
  if (v51) {
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v51, @"kDeviceAccessoryStatusDecrypted", v17, v47, v12, v49, v8);
  }
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_439;
  v65[3] = &unk_26469B0F8;
  v65[4] = *(void *)(a1 + 56);
  id v32 = v31;
  id v66 = v32;
  [v58 enumerateObjectsUsingBlock:v65];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v33 = *(id *)(a1 + 96);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v62;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v62 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v61 + 1) + 8 * v37);
        v39 = objc_msgSend(*(id *)(a1 + 56), "server", v46);
        v40 = [v39 getClientForUUID:v38];

        if (v40)
        {
          BOOL v41 = (void *)[v32 copy];
          [v40 anyDiscoveredDevice:v41];
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_446);
          }
          BOOL v42 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          {
            v43 = *(void **)(a1 + 56);
            log = v42;
            uint64_t v44 = [v43 server];
            v45 = [v44 getAllClients];
            *(_DWORD *)buf = 138412546;
            uint64_t v72 = v38;
            __int16 v73 = 2112;
            v74 = v45;
            _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "Spy client %@ doesn't exist in current all clients: %@", buf, 0x16u);
          }
        }

        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = [v33 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v35);
  }
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_414_0);
  }
  uint64_t v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDScanManager centralManager:didDiscoverPeripheral:advertisementData:RSSI:](v14, (uint64_t)v11, (uint64_t)v13);
  }
  uint64_t v15 = [(WPDScanManager *)self scanRequests];
  uint64_t v16 = [(WPDScanManager *)self currentScanners];
  char v46 = [(WPDScanManager *)self spyScanClients];
  id v17 = [v12 objectForKeyedSubscript:*MEMORY[0x263EFECB8]];
  uint64_t v18 = (unsigned char *)[v17 bytes];
  uint64_t v19 = [v17 length];
  if (v19 < 2 || *v18 != 76 || v18[1]) {
    goto LABEL_30;
  }
  unint64_t v20 = v19;
  v40 = v15;
  BOOL v41 = v13;
  BOOL v42 = v12;
  v43 = v11;
  id v44 = v10;
  v45 = [MEMORY[0x263EFF9A0] dictionary];
  if (v20 < 4) {
    goto LABEL_26;
  }
  uint64_t v22 = &v18[v20];
  v23 = v18 + 2;
  *(void *)&long long v21 = 134218242;
  long long v39 = v21;
  while (1)
  {
    uint64_t v24 = *v23;
    uint64_t v25 = v23 + 2;
    unint64_t v26 = v23[1] & 0x1F;
    unint64_t v27 = v22 - (v23 + 2);
    if (v27 < v26) {
      break;
    }
    long long v28 = &v25[v26];
    if ((v24 - 27) <= 0xE5u)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_420);
      }
      BOOL v29 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v39;
        uint64_t v58 = v24;
        __int16 v59 = 2112;
        unint64_t v60 = (unint64_t)v17;
        _os_log_debug_impl(&dword_22316D000, v29, OS_LOG_TYPE_DEBUG, "Unsupported payload type %ld, data %@", buf, 0x16u);
      }
      goto LABEL_20;
    }
LABEL_18:
    if (objc_msgSend(v16, "containsIndex:", *v23, v39))
    {
      long long v30 = [MEMORY[0x263EFF990] dataWithBytes:v18 length:2];
      [v30 appendBytes:v23 length:v26 + 2];
      __int16 v31 = [MEMORY[0x263EFF8F8] dataWithData:v30];
      id v32 = [NSNumber numberWithUnsignedChar:v24];
      [v45 setObject:v31 forKey:v32];
    }
LABEL_20:
    v23 = v28;
    if (v22 - v28 <= 1) {
      goto LABEL_26;
    }
  }
  if (v24 == 4)
  {
    unint64_t v26 = ((_BYTE)v22 - ((_BYTE)v23 + 2));
    long long v28 = &v25[v27];
    goto LABEL_18;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_417);
  }
  id v33 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v58 = v24;
    __int16 v59 = 2048;
    unint64_t v60 = v26;
    __int16 v61 = 2112;
    id v62 = v17;
    _os_log_error_impl(&dword_22316D000, v33, OS_LOG_TYPE_ERROR, "Bad payload type %ld length %zu, data %@", buf, 0x20u);
  }
LABEL_26:
  id v11 = v43;
  uint64_t v34 = objc_msgSend(v43, "name", v39);
  if (v34)
  {
    uint64_t v35 = [v43 name];
  }
  else
  {
    uint64_t v35 = @"Unknown";
  }
  id v10 = v44;
  id v13 = v41;
  id v12 = v42;
  uint64_t v15 = v40;

  uint64_t v36 = [v43 identifier];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_425;
  v47[3] = &unk_26469B4C0;
  id v48 = v40;
  id v49 = v36;
  id v50 = v42;
  v51 = self;
  id v52 = v43;
  id v53 = v41;
  id v54 = v17;
  v55 = v35;
  id v56 = v46;
  uint64_t v37 = v35;
  id v38 = v36;
  [v45 enumerateKeysAndObjectsUsingBlock:v47];

LABEL_30:
}

- (NSMutableDictionary)scanRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableSet)spyScanClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (NSIndexSet)currentScanners
{
  return (NSIndexSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentScanners:(id)a3
{
}

- (void)logScanTypes:(id)a3 method:(BOOL)a4 window:(int64_t)a5 interval:(int64_t)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a4) {
    id v8 = @"Actively";
  }
  else {
    id v8 = @"Passively";
  }
  uint64_t v9 = (void *)MEMORY[0x263F089D8];
  id v10 = a3;
  id v11 = [v9 stringWithFormat:@"%@ scanning for devices of types: ", v8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__WPDScanManager_logScanTypes_method_window_interval___block_invoke;
  v14[3] = &unk_26469B450;
  id v12 = v11;
  id v15 = v12;
  [v10 enumerateIndexesUsingBlock:v14];

  objc_msgSend(v12, "appendFormat:", @"(Window: %ld/Interval: %ld)", a5, a6);
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_371_0);
  }
  id v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v12;
    _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 scanCache])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x263EFFA88];

    *a4 = 1;
  }
}

void __44__WPDScanManager_ruleHashesFromScanOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __52__WPDScanManager_scanRequestHashesFromScanRequests___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __33__WPDScanManager_updateScanRules__block_invoke_311(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 allowDuplicates])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x263EFFA88];

    *a4 = 1;
  }
}

uint64_t __33__WPDScanManager_updateScanRules__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 clientType];
  if (result == 8)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 22;
    uint64_t result = [*(id *)(a1 + 32) isHomePod];
    uint64_t v7 = 3;
    if (!result) {
      uint64_t v7 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
    *a4 = 1;
  }
  return result;
}

void __33__WPDScanManager_updateScanRules__block_invoke_307(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 scanningRates];
    uint64_t v5 = v7;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v5 < *(void *)(v6 + 24)) {
    *(void *)(v6 + 24) = v5;
  }
}

- (BOOL)scanOptionsChanged:(id)a3 ForRequests:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a3;
  id v7 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__2;
  v31[4] = __Block_byref_object_dispose__2;
  id v32 = 0;
  id v32 = [MEMORY[0x263F089D8] string];
  id v8 = (void *)MEMORY[0x223CB05A0]();
  uint64_t v9 = [(WPDScanManager *)self ruleHashesFromScanOptions:v6];
  id v10 = [(WPDScanManager *)self scanRequestHashesFromScanRequests:v7];
  if (!v6
    || ([(WPDScanManager *)self scanOptions],
        id v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = v11 == 0,
        v11,
        v12))
  {
    uint64_t v15 = [(WPDScanManager *)self scanOptions];
    *((unsigned char *)v34 + 24) = (v6 | v15) != 0;

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_348);
    }
    uint64_t v16 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      int v17 = *((unsigned __int8 *)v34 + 24);
      *(_DWORD *)buf = 67109120;
      int v38 = v17;
      uint64_t v18 = "Scan options changed (from/to nil): %d";
LABEL_29:
      _os_log_impl(&dword_22316D000, v16, OS_LOG_TYPE_INFO, v18, buf, 8u);
    }
  }
  else
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __49__WPDScanManager_scanOptionsChanged_ForRequests___block_invoke;
    v30[3] = &unk_26469B400;
    v30[4] = self;
    v30[5] = &v33;
    v30[6] = v31;
    [(id)v6 enumerateKeysAndObjectsUsingBlock:v30];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_336_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDScanManager scanOptionsChanged:ForRequests:]();
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_339_0);
    }
    id v13 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      int v14 = *((unsigned __int8 *)v34 + 24);
      *(_DWORD *)buf = 67109120;
      int v38 = v14;
      _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_INFO, "Scan options changed (options): %d", buf, 8u);
    }
    if (*((unsigned char *)v34 + 24))
    {
      *((unsigned char *)v34 + 24) = 1;
    }
    else
    {
      uint64_t v19 = [(WPDScanManager *)self scanRequestHashes];
      char v20 = [v10 isEqualToSet:v19];
      *((unsigned char *)v34 + 24) = v20 ^ 1;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_342_0);
    }
    long long v21 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      int v22 = *((unsigned __int8 *)v34 + 24);
      *(_DWORD *)buf = 67109120;
      int v38 = v22;
      _os_log_impl(&dword_22316D000, v21, OS_LOG_TYPE_INFO, "Scan options changed (requests): %d", buf, 8u);
    }
    if (*((unsigned char *)v34 + 24))
    {
      *((unsigned char *)v34 + 24) = 1;
    }
    else
    {
      v23 = [(WPDScanManager *)self scanRuleHashes];
      char v24 = [v9 isEqualToSet:v23];
      *((unsigned char *)v34 + 24) = v24 ^ 1;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_345);
    }
    uint64_t v16 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      int v25 = *((unsigned __int8 *)v34 + 24);
      *(_DWORD *)buf = 67109120;
      int v38 = v25;
      uint64_t v18 = "Scan options changed (rules): %d";
      goto LABEL_29;
    }
  }
  if (*((unsigned char *)v34 + 24))
  {
    [(WPDScanManager *)self setScanOptions:v6];
    [(WPDScanManager *)self setScanRequestHashes:v10];
    [(WPDScanManager *)self setScanRuleHashes:v9];
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_351);
  }
  unint64_t v26 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = *((unsigned __int8 *)v34 + 24);
    *(_DWORD *)buf = 67109120;
    int v38 = v27;
    _os_log_impl(&dword_22316D000, v26, OS_LOG_TYPE_DEFAULT, "Scan options changed: %d", buf, 8u);
  }

  BOOL v28 = *((unsigned char *)v34 + 24) != 0;
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);
  return v28;
}

- (id)scanRequestHashesFromScanRequests:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__2;
    id v11 = __Block_byref_object_dispose__2;
    id v12 = 0;
    id v12 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__WPDScanManager_scanRequestHashesFromScanRequests___block_invoke;
    v6[3] = &unk_26469B340;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
    id v4 = [MEMORY[0x263EFFA08] setWithArray:v8[5]];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setScanRuleHashes:(id)a3
{
}

- (void)setScanRequestHashes:(id)a3
{
}

- (void)setScanOptions:(id)a3
{
}

- (NSSet)scanRequestHashes
{
  return (NSSet *)objc_getProperty(self, a2, 128, 1);
}

- (id)ruleHashesFromScanOptions:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFED80]];
    if (v5)
    {
      uint64_t v9 = 0;
      id v10 = &v9;
      uint64_t v11 = 0x3032000000;
      id v12 = __Block_byref_object_copy__2;
      id v13 = __Block_byref_object_dispose__2;
      id v14 = 0;
      id v14 = [MEMORY[0x263EFF980] array];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __44__WPDScanManager_ruleHashesFromScanOptions___block_invoke;
      v8[3] = &unk_26469B3D8;
      v8[4] = &v9;
      [v5 enumerateObjectsUsingBlock:v8];
      unint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:v10[5]];
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

void __33__WPDScanManager_updateScanRules__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([v8 clientType] == 16 && objc_msgSend(v8, "nearbyScanMode") == 40)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x263EFFA88];

    *a4 = 1;
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v3 retainDuplicates];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v5 + 24) = v6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v7 = 1;
  }
  else if ([v4 startPending])
  {
    char v7 = [v4 retainDuplicates] ^ 1;
  }
  else
  {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_314_0);
  }
  id v8 = (id)WiProxLog;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __33__WPDScanManager_updateScanRules__block_invoke_8_cold_1(v4, v8);
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 priorityCritical])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    char v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x263EFFA88];

    *a4 = 1;
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 activeScanning])
  {
    if ([v10 clientType] != 6
      || ([*(id *)(a1 + 32) server],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 screenOff],
          v6,
          (v7 & 1) == 0))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = MEMORY[0x263EFFA88];

      *a4 = 1;
    }
  }
}

uint64_t __54__WPDScanManager_logScanTypes_method_window_interval___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%ld ", a2);
}

- (void)updateScanner
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(WPDManager *)self server];
  uint64_t v4 = [v3 cbState];

  if (v4 != 3)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_409);
    }
    uint64_t v16 = WiProxLog;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    int v17 = "Trying to update scanner but Daemon central manager isn't powered on";
    uint64_t v18 = v16;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
LABEL_22:
    _os_log_impl(&dword_22316D000, v18, v19, v17, buf, 2u);
    return;
  }
  if ([(WPDScanManager *)self scanningDisabled]) {
    return;
  }
  if (![(WPDScanManager *)self updateScanRules])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_412);
    }
    uint64_t v20 = WiProxLog;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    int v17 = "Scan request no-op per <rdar://problem/36023927>";
    uint64_t v18 = v20;
    os_log_type_t v19 = OS_LOG_TYPE_INFO;
    goto LABEL_22;
  }
  uint64_t v5 = [(WPDScanManager *)self scanOptions];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 objectForKeyedSubscript:*MEMORY[0x263EFED80]];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:buf count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      uint64_t v11 = *MEMORY[0x263EFEDA0];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "objectForKeyedSubscript:", v11, (void)v28);
          uint64_t v14 = [v13 integerValue];

          if (v14 == 8)
          {
            uint64_t v15 = 1;
            goto LABEL_24;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:buf count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v15 = 0;
LABEL_24:
  }
  else
  {
    uint64_t v15 = 0;
  }
  -[WPDScanManager assertCBDiscoveryScan:](self, "assertCBDiscoveryScan:", v15, (void)v28);

  long long v21 = [(WPDScanManager *)self scanOptions];

  if (v21)
  {
    if ([(WPDScanManager *)self shallStop])
    {
      int v22 = [(WPDScanManager *)self centralManager];
      [v22 stopScan];
    }
    v23 = [(WPDScanManager *)self centralManager];
    char v24 = [(WPDScanManager *)self scanOptions];
    [v23 scanForPeripheralsWithServices:0 options:v24];

    int v25 = self;
    uint64_t v26 = 1;
  }
  else
  {
    int v27 = [(WPDScanManager *)self centralManager];
    [v27 stopScan];

    int v25 = self;
    uint64_t v26 = 0;
  }
  [(WPDScanManager *)v25 setScanning:v26];
}

void __49__WPDScanManager_scanOptionsChanged_ForRequests___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  if ((id)*MEMORY[0x263EFED80] != v12 && *MEMORY[0x263EFEE70] != (void)v12)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v9 + 24))
    {
      *(unsigned char *)(v9 + 24) = 1;
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 32) scanOptions];
      id v11 = [v10 objectForKeyedSubscript:v12];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11 != v7;
    }
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"Scan options %@ => %@ changed: %d\n", v12, v7, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  }
}

- (NSDictionary)scanOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)shallStop
{
  if (_os_feature_enabled_impl())
  {
    id v3 = [(WPDScanManager *)self scanOptions];
    uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFEDC0]];
    int v5 = [v4 BOOLValue] ^ 1;

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_407);
    }
    uint64_t v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      [(WPDScanManager *)v5 shallStop];
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (BOOL)scanningDisabled
{
  return self->_scanningDisabled;
}

- (void)assertCBDiscoveryScan:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_229_1);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDScanManager assertCBDiscoveryScan:]();
    }
    int v5 = [(WPDScanManager *)v4 cbDiscoveryAsserter];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFEF18]);
      [(WPDScanManager *)v4 setCbDiscoveryAsserter:v6];
    }
    id v7 = [(WPDScanManager *)v4 cbDiscoveryAsserter];
    [v7 activateAssertionWithFlags:1 completion:&__block_literal_global_221_0];
  }
  else
  {
    uint64_t v8 = [(WPDScanManager *)v4 cbDiscoveryAsserter];

    if (v8)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_233_1);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDScanManager assertCBDiscoveryScan:]();
      }
      uint64_t v9 = [(WPDScanManager *)v4 cbDiscoveryAsserter];
      [v9 invalidate];

      [(WPDScanManager *)v4 setCbDiscoveryAsserter:0];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_236_0);
      }
      uint64_t v10 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_INFO, "assertCBDiscoveryScan de-asserted", v11, 2u);
      }
    }
  }
  objc_sync_exit(v4);
}

- (CBController)cbDiscoveryAsserter
{
  return (CBController *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)retainDuplicates
{
  v2 = [(WPDScanManager *)self scanRetainDuplicates];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)scanRetainDuplicates
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (id)addScanRequest:(id)a3 forClient:(id)a4
{
  v56[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_189_4);
  }
  uint64_t v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Adding scan request called", buf, 2u);
  }
  if ([(WPDManager *)self state] == 3)
  {
    [(WPDScanManager *)self removeConflictingRequest:v6 forClient:v7];
    uint64_t v9 = [(WPDScanManager *)self scanRequests];
    uint64_t v10 = [v9 objectForKeyedSubscript:v7];

    if (!v10)
    {
      id v11 = [MEMORY[0x263EFF9C0] set];
      id v12 = [(WPDScanManager *)self scanRequests];
      [v12 setObject:v11 forKeyedSubscript:v7];
    }
    id v13 = [MEMORY[0x263EFF9C0] set];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    BOOL v41 = self;
    uint64_t v14 = [(WPDScanManager *)self scanRequests];
    id v42 = v7;
    uint64_t v15 = [v14 objectForKeyedSubscript:v7];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v43 + 1) + 8 * v19);
          int v21 = [v20 clientType];
          if (v21 == [v6 clientType])
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_199_0);
            }
            int v22 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
            {
              v23 = v22;
              unsigned int v24 = [v6 clientType];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v42;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v24;
              _os_log_debug_impl(&dword_22316D000, v23, OS_LOG_TYPE_DEBUG, "%@ is already scanning for type %ld. Replacing scan request", buf, 0x16u);
            }
            [v13 addObject:v20];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v17);
    }

    int v25 = [(WPDScanManager *)v41 scanRequests];
    id v7 = v42;
    uint64_t v26 = [v25 objectForKeyedSubscript:v42];
    [v26 minusSet:v13];

    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    *(void *)&buf[14] = 0;
    uint64_t v51 = 0;
    v52[0] = 0;
    *(void *)((char *)v52 + 6) = 0;
    int v27 = [v6 blobValue];
    long long v28 = [v6 maskValue];
    if ([v27 length])
    {
      objc_msgSend(v27, "getBytes:length:", buf, objc_msgSend(v27, "length"));
      if ([v28 length])
      {
        objc_msgSend(v28, "getBytes:length:", &v51, objc_msgSend(v28, "length"));
      }
      else
      {
        [v27 length];
        __memset_chk();
      }
    }
    uint64_t v33 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:22];
    uint64_t v34 = [MEMORY[0x263EFF8F8] dataWithBytes:&v51 length:22];
    [v6 setBlobValue:v33];
    [v6 setMaskValue:v34];
    if (_os_feature_enabled_impl()) {
      [v6 setStartPending:1];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_205_0);
    }
    uint64_t v35 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v47 = 138543618;
      id v48 = v6;
      __int16 v49 = 2114;
      id v50 = v42;
      _os_log_impl(&dword_22316D000, v35, OS_LOG_TYPE_DEFAULT, "Adding scan request %{public}@ for client %{public}@", v47, 0x16u);
    }
    char v36 = [(WPDScanManager *)v41 scanRequests];
    uint64_t v37 = [v36 objectForKeyedSubscript:v42];
    [v37 addObject:v6];

    int v38 = [(WPDManager *)v41 server];
    uint64_t v39 = [v38 statsManager];
    objc_msgSend(v39, "resetActivity:forType:", 0, objc_msgSend(v6, "clientType"));

    [(WPDScanManager *)v41 updateScanner];
    long long v31 = 0;
  }
  else
  {
    long long v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v55 = *MEMORY[0x263F08320];
    v56[0] = @"CoreBluetooth is currently powered off";
    long long v30 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];
    long long v31 = [v29 errorWithDomain:@"WPErrorDomain" code:1 userInfo:v30];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_196_1);
    }
    id v32 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDScanManager addScanRequest:forClient:](v32, (uint64_t)v6, self);
    }
  }

  return v31;
}

- (void)removeConflictingRequest:(id)a3 forClient:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WPDManager *)self server];
  int v9 = [v8 isClientTestMode:v7];

  int v10 = [v6 clientType];
  int v11 = v10;
  if ((v9 & 1) != 0 || v10 == 18)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_176_1);
    }
    v23 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v39 = 138412802;
      *(void *)&v39[4] = v7;
      *(_WORD *)&v39[12] = 1024;
      *(_DWORD *)&v39[14] = v9;
      *(_WORD *)&v39[18] = 1024;
      *(_DWORD *)&v39[20] = v11 == 18;
      _os_log_debug_impl(&dword_22316D000, v23, OS_LOG_TYPE_DEBUG, "%@ skip check for conflicting request: test mode:%d ObjectDiscovery:%d", v39, 0x18u);
    }
  }
  else
  {
    *(void *)uint64_t v39 = 0;
    *(void *)&v39[8] = v39;
    *(void *)&v39[16] = 0x3032000000;
    v40 = __Block_byref_object_copy__2;
    BOOL v41 = __Block_byref_object_dispose__2;
    id v42 = 0;
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x3032000000;
    id v32 = __Block_byref_object_copy__2;
    uint64_t v33 = __Block_byref_object_dispose__2;
    id v34 = 0;
    id v12 = [(WPDScanManager *)self scanRequests];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __53__WPDScanManager_removeConflictingRequest_forClient___block_invoke_177;
    v24[3] = &unk_26469B258;
    v24[4] = self;
    id v25 = v6;
    id v26 = v7;
    int v27 = v39;
    long long v28 = &v29;
    [v12 enumerateKeysAndObjectsUsingBlock:v24];

    if (*(void *)(*(void *)&v39[8] + 40))
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_184_1);
      }
      id v13 = (id)WiProxLog;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(*(void *)&v39[8] + 40);
        uint64_t v15 = [(WPDScanManager *)self scanRequests];
        uint64_t v16 = [v15 objectForKeyedSubscript:*(void *)(*(void *)&v39[8] + 40)];
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v14;
        __int16 v37 = 2112;
        int v38 = v16;
        _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "Before removing scan request for client: %@ - %@", buf, 0x16u);
      }
      uint64_t v17 = [(WPDScanManager *)self scanRequests];
      uint64_t v18 = [v17 objectForKeyedSubscript:*(void *)(*(void *)&v39[8] + 40)];

      [v18 removeObject:v30[5]];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_187_1);
      }
      uint64_t v19 = (id)WiProxLog;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(*(void *)&v39[8] + 40);
        int v21 = [(WPDScanManager *)self scanRequests];
        int v22 = [v21 objectForKeyedSubscript:*(void *)(*(void *)&v39[8] + 40)];
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v20;
        __int16 v37 = 2112;
        int v38 = v22;
        _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "After removing scan request for client: %@ - %@", buf, 0x16u);
      }
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(v39, 8);
  }
}

void __53__WPDScanManager_removeConflictingRequest_forClient___block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) server];
  char v8 = [v7 isClientTestMode:v5];

  if ((v8 & 1) == 0)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__WPDScanManager_removeConflictingRequest_forClient___block_invoke_2;
    v9[3] = &unk_26469B230;
    id v10 = *(id *)(a1 + 40);
    id v11 = v5;
    id v12 = *(id *)(a1 + 48);
    long long v13 = *(_OWORD *)(a1 + 56);
    [v6 enumerateObjectsUsingBlock:v9];
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_303(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) server];
  if ([v4 screenOff])
  {
    if (v3)
    {
      [v3 scanningRates];
      uint64_t v5 = v8;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else if (v3)
  {
    [v3 scanningRates];
    uint64_t v5 = v7;
  }
  else
  {
    uint64_t v5 = 0;
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v5 < *(void *)(v6 + 24)) {
    *(void *)(v6 + 24) = v5;
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_3_322(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 holdVoucher])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x263EFFA88];

    *a4 = 1;
  }
}

- (BOOL)isScannerTestMode
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if ([(WPDManager *)self testMode])
  {
    id v3 = [(WPDScanManager *)self scanRequests];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__WPDScanManager_isScannerTestMode__block_invoke;
    v6[3] = &unk_26469B2A0;
    v6[4] = self;
    void v6[5] = &v7;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_238_1);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDScanManager isScannerTestMode]();
    }
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __33__WPDScanManager_updateScanRules__block_invoke_2_321(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (([a2 range] & 1) == 0)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x263EFFA80];

    *a4 = 1;
  }
}

void __53__WPDScanManager_removeConflictingRequest_forClient___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a2;
  int v7 = [v6 clientType];
  if (v7 == [*(id *)(a1 + 32) clientType]
    && ([*(id *)(a1 + 40) isEqual:*(void *)(a1 + 48)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_179_0);
    }
    uint64_t v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = v8;
      unsigned int v12 = [v9 clientType];
      uint64_t v13 = *(void *)(a1 + 48);
      int v14 = 138412802;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_error_impl(&dword_22316D000, v11, OS_LOG_TYPE_ERROR, "%@ is already scanning for type %ld, but new client %@ also wants to scan for same type. Remove existing scan request", (uint8_t *)&v14, 0x20u);
    }
    *a3 = 1;
  }
}

- (id)removeScanRequest:(id)a3 forClient:(id)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v38 = *MEMORY[0x263F08320];
  v39[0] = @"CoreBluetooth isn't scanning for this device type";
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
  uint64_t v10 = [v8 errorWithDomain:@"WPErrorDomain" code:10 userInfo:v9];

  if (!v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_210);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      -[WPDScanManager removeScanRequest:forClient:]();
      if (v10) {
        goto LABEL_21;
      }
    }
    else if (v10)
    {
      goto LABEL_21;
    }
LABEL_26:
    unsigned int v24 = [(WPDManager *)self server];
    id v25 = [v24 statsManager];
    objc_msgSend(v25, "resetActivity:forType:", 0, objc_msgSend(v6, "clientType"));

    [(WPDScanManager *)self updateScanner];
    goto LABEL_27;
  }
  id v11 = [MEMORY[0x263EFF9C0] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v27 = self;
  unsigned int v12 = [(WPDScanManager *)self scanRequests];
  id v28 = v7;
  uint64_t v13 = [v12 objectForKeyedSubscript:v7];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
        int v19 = [v18 clientType];
        if (v19 == [v6 clientType])
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_213_0);
          }
          uint64_t v20 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v34 = v6;
            __int16 v35 = 2114;
            id v36 = v28;
            _os_log_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEFAULT, "Removing scan request %{public}@ for client %{public}@", buf, 0x16u);
          }
          [v11 addObject:v18];

          uint64_t v10 = 0;
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v15);
  }

  self = v27;
  int v21 = [(WPDScanManager *)v27 scanRequests];
  id v7 = v28;
  int v22 = [v21 objectForKeyedSubscript:v28];
  [v22 minusSet:v11];

  if (!v10) {
    goto LABEL_26;
  }
LABEL_21:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_216);
  }
  v23 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v7;
    _os_log_impl(&dword_22316D000, v23, OS_LOG_TYPE_INFO, "WirelessProximity has no scan requests for client %@", buf, 0xCu);
  }
LABEL_27:

  return v10;
}

- (WPDScanManager)initWithServer:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WPDScanManager;
  uint64_t v5 = [(WPDManager *)&v37 initWithServer:v4 Name:@"Scanner Central"];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    scanRequests = v5->_scanRequests;
    v5->_scanRequests = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    peerRequests = v5->_peerRequests;
    v5->_peerRequests = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    connectionsInProgress = v5->_connectionsInProgress;
    v5->_connectionsInProgress = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    peripheralConnections = v5->_peripheralConnections;
    v5->_peripheralConnections = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x263F088D0] indexSet];
    currentScanners = v5->_currentScanners;
    v5->_currentScanners = (NSIndexSet *)v14;

    v5->_scanning = 0;
    uint64_t v16 = [MEMORY[0x263EFF9C0] set];
    spyScanClients = v5->_spyScanClients;
    v5->_spyScanClients = (NSMutableSet *)v16;

    scanOptions = v5->_scanOptions;
    v5->_scanOptions = 0;

    scanRequestHashes = v5->_scanRequestHashes;
    v5->_scanRequestHashes = 0;

    scanRuleHashes = v5->_scanRuleHashes;
    v5->_scanRuleHashes = 0;

    int v21 = [v4 serverQueue];
    objc_storeWeak((id *)&v5->_serverQueue, v21);

    cbDiscoveryAsserter = v5->_cbDiscoveryAsserter;
    v5->_cbDiscoveryAsserter = 0;

    scanRetainDuplicates = v5->_scanRetainDuplicates;
    v5->_scanRetainDuplicates = (NSNumber *)MEMORY[0x263EFFA80];

    v5->_isRanging = 0;
    unsigned int v24 = [MEMORY[0x263F089C8] indexSet];
    [v24 addIndex:15];
    if (+[WPDaemonServer supportsRanging]) {
      [v24 addIndex:19];
    }
    uint64_t v25 = [objc_alloc(MEMORY[0x263F088D0]) initWithIndexSet:v24];
    rangingTypes = v5->_rangingTypes;
    v5->_rangingTypes = (NSIndexSet *)v25;

    id v27 = objc_alloc(MEMORY[0x263EFEF00]);
    id v28 = [(WPDScanManager *)v5 serverQueue];
    uint64_t v38 = *MEMORY[0x263EFEE80];
    v39[0] = MEMORY[0x263EFFA88];
    long long v29 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    long long v30 = (void *)[v27 initWithDelegate:v5 queue:v28 options:v29];
    [(WPDScanManager *)v5 setCentralManager:v30];

    long long v31 = (void *)MEMORY[0x263EFFA08];
    long long v32 = [(WPDScanManager *)v5 centralManager];
    uint64_t v33 = [v31 setWithObject:v32];
    [(WPDManager *)v5 setCbManagers:v33];

    id v34 = [v4 wpdState];
    __int16 v35 = [(WPDScanManager *)v5 centralManager];
    [v34 registerManager:v35];
  }
  return v5;
}

- (void)cleanup
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(WPDScanManager *)self cbDiscoveryAsserter];

  if (v3)
  {
    id v4 = [(WPDScanManager *)self cbDiscoveryAsserter];
    [v4 invalidate];

    [(WPDScanManager *)self setCbDiscoveryAsserter:0];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(WPDScanManager *)self peripheralConnections];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        id v11 = [(WPDScanManager *)self centralManager];
        [v11 cancelPeripheralConnection:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [(WPDScanManager *)self scanRequests];
  [v12 removeAllObjects];

  uint64_t v13 = [(WPDScanManager *)self spyScanClients];
  [v13 removeAllObjects];

  [(WPDScanManager *)self updateScanner];
  v14.receiver = self;
  v14.super_class = (Class)WPDScanManager;
  [(WPDManager *)&v14 cleanup];
}

- (id)generateStateDumpStrings
{
  v2 = self;
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  v89.receiver = self;
  v89.super_class = (Class)WPDScanManager;
  id v4 = [(WPDManager *)&v89 generateStateDumpStrings];
  v65 = [v3 arrayWithArray:v4];

  uint64_t v72 = v2;
  if ([(WPDManager *)v2 isInternalBuild])
  {
    uint64_t v5 = v2;
    uint64_t v6 = NSString;
    uint64_t v7 = [(WPDManager *)v5 scanAllowlist];
    if (v7)
    {
      uint64_t v8 = [(WPDManager *)v5 scanAllowlist];
    }
    else
    {
      uint64_t v8 = @"all";
    }
    uint64_t v9 = [v6 stringWithFormat:@"allowlisted scan types: %@\n", v8];
    [v65 addObject:v9];

    if (v7) {
    v2 = v72;
    }
  }
  uint64_t v10 = NSString;
  if ([(WPDScanManager *)v2 isRanging]) {
    id v11 = "yes";
  }
  else {
    id v11 = "no";
  }
  uint64_t v12 = [(WPDScanManager *)v2 rangingTypes];
  uint64_t v13 = [v10 stringWithFormat:@"ranging: %s, supported types: %@\n", v11, v12];
  [v65 addObject:v13];

  objc_super v14 = [MEMORY[0x263EFF980] array];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v15 = [(WPDScanManager *)v2 scanRequests];
  long long v16 = [v15 allKeys];

  uint64_t v70 = [v16 countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v70)
  {
    uint64_t v17 = *(void *)v86;
    uint64_t v66 = *(void *)v86;
    v67 = v16;
    do
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v86 != v17) {
          objc_enumerationMutation(v16);
        }
        uint64_t v19 = *(void *)(*((void *)&v85 + 1) + 8 * i);
        uint64_t v20 = [(WPDScanManager *)v2 scanRequests];
        int v21 = [v20 objectForKeyedSubscript:v19];

        int v22 = v21;
        if (v21 && [v21 count])
        {
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id v68 = v21;
          id v23 = v21;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v81 objects:v92 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v82;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v82 != v26) {
                  objc_enumerationMutation(v23);
                }
                id v28 = [NSString stringWithFormat:@"    %@: %@\n", v19, *(void *)(*((void *)&v81 + 1) + 8 * j)];
                [v14 addObject:v28];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v81 objects:v92 count:16];
            }
            while (v25);
            v2 = v72;
            uint64_t v17 = v66;
            long long v16 = v67;
          }
          int v22 = v68;
        }
        else
        {
          [NSString stringWithFormat:@"    %@: (nil)\n"], v19);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
          [v14 addObject:v23];
        }
      }
      uint64_t v70 = [v16 countByEnumeratingWithState:&v85 objects:v93 count:16];
    }
    while (v70);
  }

  long long v29 = objc_msgSend(NSString, "stringWithFormat:", @"scan requests (%lu):\n", objc_msgSend(v14, "count"));
  [v65 addObject:v29];

  [v65 addObjectsFromArray:v14];
  v71 = [MEMORY[0x263EFF980] array];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v30 = [(WPDScanManager *)v2 peerRequests];
  long long v31 = [v30 allKeys];

  uint64_t v32 = [v31 countByEnumeratingWithState:&v77 objects:v91 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v78;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v78 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v77 + 1) + 8 * k);
        objc_super v37 = [(WPDScanManager *)v72 peerRequests];
        uint64_t v38 = [v37 objectForKeyedSubscript:v36];

        if (v38 && [v38 count])
        {
          uint64_t v39 = [NSString stringWithFormat:@"    %@: %@\n", v36, v38];
          [v71 addObject:v39];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v77 objects:v91 count:16];
    }
    while (v33);
  }

  v40 = objc_msgSend(NSString, "stringWithFormat:", @"tracked peers (%lu):\n", objc_msgSend(v71, "count"));
  [v65 addObject:v40];

  [v65 addObjectsFromArray:v71];
  id v69 = [MEMORY[0x263EFF980] array];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  BOOL v41 = [(WPDScanManager *)v72 connectionsInProgress];
  id v42 = [v41 allKeys];

  uint64_t v43 = [v42 countByEnumeratingWithState:&v73 objects:v90 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v74;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v74 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void *)(*((void *)&v73 + 1) + 8 * m);
        id v48 = [(WPDScanManager *)v72 connectionsInProgress];
        __int16 v49 = [v48 objectForKeyedSubscript:v47];

        if (v49 && [v49 count])
        {
          [v49 count];
          id v50 = [NSString stringWithFormat:@"    %@: %@\n", v47, v49];
          [v69 addObject:v50];
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v73 objects:v90 count:16];
    }
    while (v44);
  }

  uint64_t v51 = objc_msgSend(NSString, "stringWithFormat:", @"connections in progress (%lu):\n", objc_msgSend(v69, "count"));
  [v65 addObject:v51];

  [v65 addObjectsFromArray:v69];
  id v52 = NSString;
  if ([(WPDScanManager *)v72 scanning]) {
    id v53 = "yes";
  }
  else {
    id v53 = "no";
  }
  id v54 = [(WPDScanManager *)v72 currentScanners];
  uint64_t v55 = [v54 count];
  id v56 = [(WPDScanManager *)v72 currentScanners];
  uint64_t v57 = [v56 count];
  if (v57)
  {
    uint64_t v58 = [(WPDScanManager *)v72 currentScanners];
  }
  else
  {
    uint64_t v58 = &stru_26D63C830;
  }
  __int16 v59 = [v52 stringWithFormat:@"scanning: %s types (%lu): %@\n", v53, v55, v58];
  [v65 addObject:v59];

  if (v57) {
  unint64_t v60 = NSString;
  }
  __int16 v61 = [(WPDScanManager *)v72 scanOptions];
  id v62 = [v60 stringWithFormat:@"options: %@\n", v61];
  [v65 addObject:v62];

  uint64_t v63 = [MEMORY[0x263EFF8C0] arrayWithArray:v65];

  return v63;
}

- (void)enableRanging:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_12);
  }
  uint64_t v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "WPScanManager enable ranging: %d", (uint8_t *)v6, 8u);
  }
  [(WPDScanManager *)self setIsRanging:v3];
  if ([(WPDManager *)self state] == 3) {
    [(WPDScanManager *)self updateScanner];
  }
}

- (void)addSpyScanClient:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_166_0);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(WPDScanManager *)self spyScanClients];
    int v14 = 138412290;
    long long v15 = v7;
    _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "Current spy scan clients: %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v8 = [(WPDScanManager *)self spyScanClients];
  char v9 = [v8 containsObject:v4];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [(WPDScanManager *)self spyScanClients];
    [v10 addObject:v4];
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_169_0);
  }
  id v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [(WPDScanManager *)self spyScanClients];
    int v14 = 138412546;
    long long v15 = v13;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_DEFAULT, "Current spy scan clients: %@ after adding client %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)removeSpyScanClient:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_171_0);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(WPDScanManager *)self spyScanClients];
    int v14 = 138412290;
    long long v15 = v7;
    _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "Current spy scan clients: %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v8 = [(WPDScanManager *)self spyScanClients];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(WPDScanManager *)self spyScanClients];
    [v10 removeObject:v4];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_174_0);
    }
    id v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      uint64_t v13 = [(WPDScanManager *)self spyScanClients];
      int v14 = 138412546;
      long long v15 = v13;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_DEFAULT, "Current spy scan clients: %@ after removing client %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (id)getScanRequestsForClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WPDScanManager *)self scanRequests];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 allObjects];

  return v7;
}

- (void)removeScanRequestsForClient:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_218_0);
  }
  uint64_t v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "Removing all scan requests for client %{public}@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [(WPDScanManager *)self scanRequests];
  [v6 removeObjectForKey:v4];

  [(WPDScanManager *)self updateScanner];
}

void __40__WPDScanManager_assertCBDiscoveryScan___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_223_2);
    }
    BOOL v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __40__WPDScanManager_assertCBDiscoveryScan___block_invoke_cold_1(v3);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_226_1);
    }
    id v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_INFO, "assertCBDiscoveryScan asserted", v5, 2u);
    }
  }
}

void __35__WPDScanManager_isScannerTestMode__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  int v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 server];
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

- (void)reconcileScanRule:(id)a3 withRule:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFEDA0]];
  char v8 = [v7 integerValue];

  if (v8 == 18)
  {
    uint64_t v9 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v10 = [v5 allKeys];
    id v11 = [v9 setWithArray:v10];

    id v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = [v6 allKeys];
    int v14 = [v12 setWithArray:v13];
    [v11 unionSet:v14];

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __45__WPDScanManager_reconcileScanRule_withRule___block_invoke_252;
    v17[3] = &unk_26469B2C8;
    id v15 = v5;
    id v18 = v15;
    id v19 = v6;
    char v20 = v8;
    [v11 enumerateObjectsUsingBlock:v17];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_259_1);
    }
    __int16 v16 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDScanManager reconcileScanRule:withRule:]((uint64_t)v15, v16);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_251_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDScanManager reconcileScanRule:withRule:]();
    }
  }
}

void __45__WPDScanManager_reconcileScanRule_withRule___block_invoke_252(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  if ((id)*MEMORY[0x263EFED78] == v4)
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    if (v7)
    {
      char v8 = (void *)v7;
      uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

      if (v9)
      {
        uint64_t v10 = NSNumber;
        id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
        char v12 = [v11 BOOLValue];
        if (v12)
        {
          uint64_t v13 = 1;
        }
        else
        {
          id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
          uint64_t v13 = [v2 BOOLValue];
        }
        id v27 = [v10 numberWithInt:v13];
        [*(id *)(a1 + 32) setObject:v27 forKeyedSubscript:v5];

        if ((v12 & 1) == 0) {
        goto LABEL_29;
        }
      }
    }
    goto LABEL_16;
  }
  if ((id)*MEMORY[0x263EFED98] == v4)
  {
    uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    if (v14)
    {
      id v15 = (void *)v14;
      __int16 v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

      if (v16)
      {
        id v17 = NSNumber;
        id v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
        unsigned int v19 = [v18 intValue];

        char v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
        unsigned int v21 = [v20 intValue];

        if ((int)v19 >= (int)v21) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = v19;
        }
        uint64_t v23 = [v17 numberWithInt:v22];
LABEL_20:
        id v11 = (void *)v23;
        [*(id *)(a1 + 32) setObject:v23 forKeyedSubscript:v5];
LABEL_29:

        goto LABEL_30;
      }
    }
LABEL_16:
    uint64_t v24 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    if (v24)
    {

      goto LABEL_30;
    }
    uint64_t v25 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

    if (!v25) {
      goto LABEL_30;
    }
    uint64_t v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    goto LABEL_20;
  }
  if ((id)*MEMORY[0x263EFEDA0] != v4)
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    if (v6)
    {
    }
    else
    {
      uint64_t v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

      if (!v26) {
        goto LABEL_30;
      }
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_255_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __45__WPDScanManager_reconcileScanRule_withRule___block_invoke_252_cold_1();
    }
  }
LABEL_30:
}

- (void)duplicateRulesGuard:(id)a3 forRule:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263EFEDA0];
  id v8 = a3;
  uint64_t v9 = [v6 objectForKeyedSubscript:v7];
  char v10 = [v9 integerValue];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__WPDScanManager_duplicateRulesGuard_forRule___block_invoke;
  v12[3] = &unk_26469B2F0;
  char v14 = v10;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v8 enumerateObjectsUsingBlock:v12];
}

void __46__WPDScanManager_duplicateRulesGuard_forRule___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v6 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFEDA0]];
  uint64_t v7 = [v6 integerValue];
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);

  if (v7 == v8)
  {
    [*(id *)(a1 + 32) reconcileScanRule:v9 withRule:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_2_312(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([v8 allowDuplicates] && objc_msgSend(v8, "clientType") != 18)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x263EFFA88];

    *a4 = 1;
  }
}

- (void)logScanRequests:(id)a3 method:(BOOL)a4 window:(int64_t)a5 interval:(int64_t)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a4) {
    id v8 = @"Actively";
  }
  else {
    id v8 = @"Passively";
  }
  id v9 = (void *)MEMORY[0x263F089D8];
  id v10 = a3;
  id v11 = [v9 stringWithFormat:@"%@ scanning for devices of types: ", v8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__WPDScanManager_logScanRequests_method_window_interval___block_invoke;
  v14[3] = &unk_26469B428;
  id v12 = v11;
  id v15 = v12;
  [v10 enumerateObjectsUsingBlock:v14];

  objc_msgSend(v12, "appendFormat:", @"(Window: %ld/Interval: %ld)", a5, a6);
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_368_0);
  }
  id v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v12;
    _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

uint64_t __57__WPDScanManager_logScanRequests_method_window_interval___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%ld ", objc_msgSend(a2, "clientType"));
}

- (id)clearDuplicateFilterCache:(id)a3 forClient:(id)a4
{
  v34[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v33 = *MEMORY[0x263F08320];
  v34[0] = @"CoreBluetooth isn't scanning for this device type";
  id v9 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
  id v10 = [v8 errorWithDomain:@"WPErrorDomain" code:10 userInfo:v9];

  if (v6)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = [(WPDScanManager *)self scanRequests];
    id v12 = [v11 objectForKeyedSubscript:v7];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          int v17 = [*(id *)(*((void *)&v26 + 1) + 8 * i) clientType];
          if (v17 == [v6 clientType])
          {

            id v10 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_373);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDScanManager removeScanRequest:forClient:]();
    }
  }
  if (v10)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_376);
    }
    uint64_t v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v7;
      _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_INFO, "WirelessProximity has no scan requests for client %@", buf, 0xCu);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_379);
    }
    unsigned int v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      char v20 = v19;
      int v21 = [v6 clientType];
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v21;
      _os_log_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEFAULT, "About to clearDuplicateFilterCache for type: %d", buf, 8u);
    }
    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v6, "clientType"));
    [v22 setObject:v23 forKey:*MEMORY[0x263EFED40]];

    uint64_t v24 = [(WPDScanManager *)self centralManager];
    [v24 clearDuplicateFilterCache:v22];
  }
  return v10;
}

- (void)clearExistingConnections
{
  BOOL v3 = [(WPDScanManager *)self connectionsInProgress];
  [v3 removeAllObjects];

  id v4 = [(WPDScanManager *)self peripheralConnections];
  [v4 removeAllObjects];

  id v6 = [(WPDManager *)self server];
  id v5 = [v6 getAllClients];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_382_0];
}

void __42__WPDScanManager_clearExistingConnections__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (objc_opt_respondsToSelector())
    {
      [v2 resetConnection];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_389);
      }
      BOOL v3 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        __42__WPDScanManager_clearExistingConnections__block_invoke_cold_2(v3);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_384_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __42__WPDScanManager_clearExistingConnections__block_invoke_cold_1();
    }
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WPDScanManager;
  [(WPDManager *)&v3 cbManagerDidUpdateState:a3];
}

- (void)update
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_393);
  }
  objc_super v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    int v21 = 67109376;
    *(_DWORD *)uint64_t v22 = [(WPDManager *)self state];
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = [(WPDManager *)self restricted];
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "Scanner Central manager update with state: %d restricted: %d", (uint8_t *)&v21, 0xEu);
  }
  switch([(WPDManager *)self state])
  {
    case 0:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_405);
      }
      id v5 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "Scanner Central manager state is unknown", (uint8_t *)&v21, 2u);
      }
      break;
    case 1:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_402);
      }
      id v6 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v6;
        id v8 = [(WPDScanManager *)self connectionsInProgress];
        id v9 = [(WPDScanManager *)self peripheralConnections];
        int v21 = 138412546;
        *(void *)uint64_t v22 = v8;
        *(_WORD *)&v22[8] = 2112;
        uint64_t v23 = v9;
        _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "Scanner Central manager is resetting - reset connection in progress %@ and peripheral connections %@", (uint8_t *)&v21, 0x16u);
      }
      goto LABEL_18;
    case 2:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_399);
      }
      id v10 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v10;
        id v12 = [(WPDScanManager *)self centralManager];
        uint64_t v13 = [v12 state];
        uint64_t v14 = [(WPDScanManager *)self connectionsInProgress];
        uint64_t v15 = [(WPDScanManager *)self peripheralConnections];
        int v21 = 134218498;
        *(void *)uint64_t v22 = v13;
        *(_WORD *)&v22[8] = 2112;
        uint64_t v23 = v14;
        __int16 v24 = 2112;
        uint64_t v25 = v15;
        _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "Scanner Central manager is unknown, powered off, unauthorized or not supported (%ld) - reset connection in progress %@ and peripheral connections %@", (uint8_t *)&v21, 0x20u);
      }
LABEL_18:
      [(WPDScanManager *)self clearExistingConnections];
      __int16 v16 = [(WPDManager *)self server];
      int v17 = [v16 statsManager];
      [v17 stopActivity:0];

      break;
    case 3:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_396);
      }
      uint64_t v18 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v19 = v18;
        BOOL v20 = [(WPDManager *)self restricted];
        int v21 = 67109120;
        *(_DWORD *)uint64_t v22 = v20;
        _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "Scanner Central manager is powered on, restricted: %d", (uint8_t *)&v21, 8u);
      }
      [(WPDScanManager *)self updateScanner];
      break;
    default:
      return;
  }
}

- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_449);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDScanManager centralManager:didDiscoverMultiplePeripherals:](v7);
  }
}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_451_0);
  }
  id v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "WPDScanManager UNEXPECTED didFailToScanWithError %{public}@", (uint8_t *)&v9, 0xCu);
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_454);
  }
  id v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "WPDScanManager scan failed to start - TODO add proper cleanup", (uint8_t *)&v9, 2u);
  }
}

+ (int64_t)zonesAvailableForType:(unsigned __int8)a3
{
  if (a3 - 9) < 8u && ((0xCBu >> (a3 - 9))) {
    return 15;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_456_0);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    +[WPDScanManager zonesAvailableForType:]();
  }
  return 0;
}

- (id)addPeerTrackingRequest:(id)a3 forClient:(id)a4
{
  v44[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 clientType];
  if ([(WPDManager *)self state] == 3)
  {
    int v9 = [(WPDScanManager *)self peerRequests];
    id v10 = [v9 objectForKeyedSubscript:v7];

    if (!v10)
    {
      id v10 = [MEMORY[0x263EFF9C0] set];
    }
    if ([v10 containsObject:v6])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_474);
      }
      uint64_t v11 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        id v12 = v11;
        uint64_t v13 = [v6 peerUUID];
        *(_DWORD *)buf = 138412290;
        unint64_t v38 = (unint64_t)v13;
        _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_INFO, "Peer %@ is already being tracked", buf, 0xCu);
      }
LABEL_24:
      uint64_t v15 = 0;
      goto LABEL_34;
    }
    unint64_t v16 = +[WPDScanManager zonesAvailableForType:v8];
    if ([v10 count] >= v16)
    {
      __int16 v24 = [(WPDManager *)self server];
      uint64_t v25 = [v24 getClientForUUID:v7];
      [v25 peerTrackingFull];

      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"Peer tracking maxed out for client %ld (%lu slots)", objc_msgSend(v6, "clientType"), objc_msgSend(v10, "count"));
      long long v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F08320];
      uint64_t v36 = v26;
      long long v28 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      uint64_t v15 = [v27 errorWithDomain:@"WPErrorDomain" code:14 userInfo:v28];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_471);
      }
      long long v29 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v38 = (unint64_t)v26;
        _os_log_impl(&dword_22316D000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
    else
    {
      [v10 addObject:v6];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_465);
      }
      int v17 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = v17;
        *(_DWORD *)buf = 134218496;
        unint64_t v38 = [v6 clientType];
        __int16 v39 = 2048;
        uint64_t v40 = [v10 count];
        __int16 v41 = 2048;
        unint64_t v42 = v16;
        _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_INFO, "Adding peer tracking request for client %ld. Using (%lu/%lu) tracking slots", buf, 0x20u);
      }
      unsigned int v19 = [v6 peerUUID];
      BOOL v20 = [NSNumber numberWithUnsignedChar:v8];
      BOOL v21 = [(WPDScanManager *)self startTrackingPeripheral:v19 ofType:v20];

      if (v21)
      {
        uint64_t v22 = [(WPDScanManager *)self peerRequests];
        [v22 setObject:v10 forKeyedSubscript:v7];

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_477);
        }
        uint64_t v23 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          -[WPDScanManager addPeerTrackingRequest:forClient:](v23);
        }
        goto LABEL_24;
      }
      long long v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      uint64_t v34 = @"Unknown error";
      id v31 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v15 = [v30 errorWithDomain:@"WPErrorDomain" code:26 userInfo:v31];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_483);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDScanManager addPeerTrackingRequest:forClient:]();
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_458);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDScanManager addPeerTrackingRequest:forClient:]();
    }
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    v44[0] = @"Trying to start tracking when central manager is not powered on";
    id v10 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    uint64_t v15 = [v14 errorWithDomain:@"WPErrorDomain" code:1 userInfo:v10];
  }
LABEL_34:

  return v15;
}

- (id)removePeerTrackingRequest:(id)a3 checkZonesAvailable:(BOOL)a4 forClient:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_485);
  }
  id v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    *(_DWORD *)buf = 67109120;
    int v27 = [(WPDManager *)self state];
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "Remove peer tracking when central state is %d", buf, 8u);
  }
  uint64_t v12 = [v8 clientType];
  uint64_t v13 = [v8 peerUUID];
  uint64_t v14 = [(WPDScanManager *)self peerRequests];
  uint64_t v15 = [v14 objectForKeyedSubscript:v9];

  if (![v15 containsObject:v8])
  {
    uint64_t v18 = [NSString stringWithFormat:@"Couldn't find peer tracking request for peer %@ of type %ld (internal error)", v13, v12];
    BOOL v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    uint64_t v25 = v18;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    BOOL v20 = [v21 errorWithDomain:@"WPErrorDomain" code:16 userInfo:v22];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_494);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient disconnectedPeer:error:]();
    }
    goto LABEL_17;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_488);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDScanManager removePeerTrackingRequest:checkZonesAvailable:forClient:]();
  }
  [v15 removeObject:v8];
  unint64_t v16 = [NSNumber numberWithUnsignedChar:v12];
  [(WPDScanManager *)self stopTrackingPeripheral:v13 ofType:v16];

  if (a4)
  {
    unint64_t v17 = +[WPDScanManager zonesAvailableForType:v12];
    if ([v15 count] < v17)
    {
      uint64_t v18 = [(WPDManager *)self server];
      unsigned int v19 = [v18 getClientForUUID:v9];
      [v19 peerTrackingAvailable];

      BOOL v20 = 0;
LABEL_17:

      goto LABEL_19;
    }
  }
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)removeAllPeerTrackingRequestsForClient:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WPDScanManager *)self peerRequests];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_496_0);
  }
  id v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "Removing all peer tracking requests for client %{public}@", buf, 0xCu);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__WPDScanManager_removeAllPeerTrackingRequestsForClient___block_invoke_497;
  v9[3] = &unk_26469B4E8;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v9];
}

id __57__WPDScanManager_removeAllPeerTrackingRequestsForClient___block_invoke_497(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) removePeerTrackingRequest:a2 checkZonesAvailable:0 forClient:*(void *)(a1 + 40)];
}

- (BOOL)startTrackingPeripheral:(id)a3 ofType:(id)a4
{
  return 0;
}

- (id)retrievePeripheralWithUUID:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WPDManager *)self state] == 3)
  {
    id v5 = [(WPDScanManager *)self centralManager];
    v11[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    id v7 = [v5 retrievePeripheralsWithIdentifiers:v6];

    id v8 = [v7 firstObject];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_500);
    }
    id v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDScanManager retrievePeripheralWithUUID:](v9);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)centralManager:(id)a3 didLosePeripheral:(id)a4 forType:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = [a4 identifier];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_502);
  }
  id v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    *(_DWORD *)buf = 138412546;
    unsigned int v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = [v7 integerValue];
    _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_INFO, "Lost a peer %@ of type %ld", buf, 0x16u);
  }
  uint64_t v11 = [(WPDScanManager *)self peerRequests];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__WPDScanManager_centralManager_didLosePeripheral_forType___block_invoke_503;
  v14[3] = &unk_26469B538;
  id v15 = v8;
  id v16 = v7;
  unint64_t v17 = self;
  id v12 = v7;
  id v13 = v8;
  [v11 enumerateKeysAndObjectsUsingBlock:v14];
}

void __59__WPDScanManager_centralManager_didLosePeripheral_forType___block_invoke_503(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__WPDScanManager_centralManager_didLosePeripheral_forType___block_invoke_2;
  v9[3] = &unk_26469B510;
  id v10 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  [a3 enumerateObjectsUsingBlock:v9];
}

void __59__WPDScanManager_centralManager_didLosePeripheral_forType___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_super v3 = [v9 peerUUID];
  if ([v3 isEqual:*(void *)(a1 + 32)])
  {
    int v4 = [v9 clientType];
    int v5 = [*(id *)(a1 + 40) unsignedCharValue];

    if (v4 != v5) {
      goto LABEL_5;
    }
    id v6 = [*(id *)(a1 + 48) server];
    objc_super v3 = [v6 getClientForUUID:*(void *)(a1 + 56)];

    uint64_t v7 = [v9 peerUUID];
    objc_msgSend(v3, "lostPeer:ofType:", v7, objc_msgSend(*(id *)(a1 + 40), "integerValue"));

    id v8 = (id)[*(id *)(a1 + 48) removePeerTrackingRequest:v9 checkZonesAvailable:1 forClient:*(void *)(a1 + 56)];
  }

LABEL_5:
}

- (void)centralManager:(id)a3 didFindPeripheral:(id)a4 forType:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = [a4 identifier];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_505);
  }
  id v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    *(_DWORD *)buf = 138412546;
    unsigned int v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = [v7 integerValue];
    _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEFAULT, "Found a peer %@ of type %ld", buf, 0x16u);
  }
  id v11 = [(WPDScanManager *)self peerRequests];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__WPDScanManager_centralManager_didFindPeripheral_forType___block_invoke_506;
  v14[3] = &unk_26469B538;
  id v15 = v8;
  id v16 = v7;
  unint64_t v17 = self;
  id v12 = v7;
  id v13 = v8;
  [v11 enumerateKeysAndObjectsUsingBlock:v14];
}

void __59__WPDScanManager_centralManager_didFindPeripheral_forType___block_invoke_506(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__WPDScanManager_centralManager_didFindPeripheral_forType___block_invoke_2;
  v9[3] = &unk_26469B510;
  id v10 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  [a3 enumerateObjectsUsingBlock:v9];
}

void __59__WPDScanManager_centralManager_didFindPeripheral_forType___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_super v3 = [v8 peerUUID];
  if ([v3 isEqual:*(void *)(a1 + 32)])
  {
    int v4 = [v8 clientType];
    int v5 = [*(id *)(a1 + 40) unsignedCharValue];

    if (v4 != v5) {
      goto LABEL_5;
    }
    id v6 = [*(id *)(a1 + 48) server];
    objc_super v3 = [v6 getClientForUUID:*(void *)(a1 + 56)];

    uint64_t v7 = [v8 peerUUID];
    objc_msgSend(v3, "foundPeer:ofType:", v7, objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  }
LABEL_5:
}

- (id)connectToPeripheral:(id)a3 fromClient:(id)a4 withOptions:(id)a5
{
  v46[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(WPDManager *)self state] == 3)
  {
    id v11 = [(WPDScanManager *)self connectionsInProgress];
    uint64_t v12 = [v11 objectForKeyedSubscript:v8];

    if (v12 && [v12 count])
    {
      if ([v12 containsObject:v9])
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_511);
        }
        id v13 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "Wireless Proximity is already connecting to peripheral %@ for client %@ - ignore the processing", buf, 0x16u);
        }
        uint64_t v14 = 0;
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v18 = [(WPDManager *)self server];
      unsigned int v19 = [v18 getClientForUUID:v9];
      __int16 v20 = [v19 clientTypeString];

      uint64_t v14 = buf;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      unint64_t v42 = __Block_byref_object_copy__2;
      uint64_t v43 = __Block_byref_object_dispose__2;
      id v44 = 0;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __61__WPDScanManager_connectToPeripheral_fromClient_withOptions___block_invoke_512;
      v36[3] = &unk_26469B560;
      v36[4] = self;
      id v21 = v20;
      id v37 = v21;
      unint64_t v38 = buf;
      [v12 enumerateObjectsUsingBlock:v36];
      uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
      if (v22)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_517);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDScanManager connectToPeripheral:fromClient:withOptions:]();
        }
        uint64_t v14 = *(id *)(*(void *)&buf[8] + 40);
      }

      _Block_object_dispose(buf, 8);
      if (v22) {
        goto LABEL_30;
      }
    }
    uint64_t v23 = [(WPDScanManager *)self retrievePeripheralWithUUID:v8];
    if (v23)
    {
      uint64_t v24 = [(WPDScanManager *)self centralManager];
      [v24 connectPeripheral:v23 options:v10];

      uint64_t v25 = [(WPDScanManager *)self connectionsInProgress];
      uint64_t v26 = [v25 objectForKeyedSubscript:v8];
      BOOL v27 = v26 == 0;

      if (v27)
      {
        uint64_t v28 = [MEMORY[0x263EFF9C0] set];
        long long v29 = [(WPDScanManager *)self connectionsInProgress];
        [v29 setObject:v28 forKeyedSubscript:v8];
      }
      long long v30 = [(WPDScanManager *)self connectionsInProgress];
      id v31 = [v30 objectForKeyedSubscript:v8];
      [v31 addObject:v9];

      uint64_t v32 = [(WPDScanManager *)self peripheralConnections];
      [v32 addObject:v23];

      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v39 = *MEMORY[0x263F08320];
      uint64_t v40 = @"Wireless Proximity can't retrieve the peripheral specified";
      uint64_t v34 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v14 = [v33 errorWithDomain:@"WPErrorDomain" code:6 userInfo:v34];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_523);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDScanManager connectToPeripheral:fromClient:withOptions:]();
      }
    }

    goto LABEL_30;
  }
  id v15 = (void *)MEMORY[0x263F087E8];
  uint64_t v45 = *MEMORY[0x263F08320];
  v46[0] = @"CoreBluetooth is currently powered off";
  id v16 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
  uint64_t v14 = [v15 errorWithDomain:@"WPErrorDomain" code:1 userInfo:v16];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_508);
  }
  unint64_t v17 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDScanManager connectToPeripheral:fromClient:withOptions:](v17, self);
  }
LABEL_31:

  return v14;
}

void __61__WPDScanManager_connectToPeripheral_fromClient_withOptions___block_invoke_512(void *a1, void *a2, unsigned char *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  int v5 = (void *)a1[4];
  id v6 = a2;
  uint64_t v7 = [v5 server];
  id v8 = [v7 getClientForUUID:v6];

  id v9 = [v8 clientTypeString];

  if ([v9 isEqualToString:a1[5]])
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = @"Wireless Proximity is already trying to connect for this type";
    id v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v12 = [v10 errorWithDomain:@"WPErrorDomain" code:18 userInfo:v11];
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a3 = 1;
  }
}

- (id)disconnectFromPeripheral:(id)a3 withSubscribedCharacteristics:(id)a4 forClient:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_525);
  }
  id v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v57 = v8;
    __int16 v58 = 2114;
    id v59 = v9;
    __int16 v60 = 2114;
    id v61 = v10;
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "Disconnect from peripheral: %{public}@, characteristics: %{public}@, for client: %{public}@", buf, 0x20u);
  }
  uint64_t v12 = [(WPDScanManager *)self retrievePeripheralWithUUID:v8];
  uint64_t v13 = v12;
  if (v12)
  {
    id v37 = self;
    id v38 = v10;
    id v39 = v8;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = [v12 services];
    uint64_t v42 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v49;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v49 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = v14;
          uint64_t v15 = *(void **)(*((void *)&v48 + 1) + 8 * v14);
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v16 = [v15 characteristics];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v45;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v45 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(void **)(*((void *)&v44 + 1) + 8 * v20);
                uint64_t v22 = [v21 UUID];
                uint64_t v23 = [v22 UUIDString];
                int v24 = [v9 containsObject:v23];

                if (v24)
                {
                  if (WPLogInitOnce != -1) {
                    dispatch_once(&WPLogInitOnce, &__block_literal_global_531);
                  }
                  uint64_t v25 = (void *)WiProxLog;
                  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v26 = v25;
                    BOOL v27 = [v21 UUID];
                    uint64_t v28 = [v27 UUIDString];
                    *(_DWORD *)buf = 138543362;
                    id v57 = v28;
                    _os_log_impl(&dword_22316D000, v26, OS_LOG_TYPE_DEFAULT, "Setting notify value to off for characteristic %{public}@", buf, 0xCu);
                  }
                  [v13 setNotifyValue:0 forCharacteristic:v21];
                }
                ++v20;
              }
              while (v18 != v20);
              uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
            }
            while (v18);
          }

          uint64_t v14 = v43 + 1;
        }
        while (v43 + 1 != v42);
        uint64_t v42 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v42);
    }

    long long v29 = [(WPDScanManager *)v37 connectionsInProgress];
    long long v30 = [v13 identifier];
    [v29 removeObjectForKey:v30];

    id v31 = [(WPDScanManager *)v37 peripheralConnections];
    [v31 removeObject:v13];

    uint64_t v32 = [(WPDScanManager *)v37 centralManager];
    [v32 cancelPeripheralConnection:v13];

    uint64_t v33 = 0;
    id v10 = v38;
    id v8 = v39;
  }
  else
  {
    uint64_t v34 = (void *)MEMORY[0x263F087E8];
    uint64_t v54 = *MEMORY[0x263F08320];
    uint64_t v55 = @"Wireless Proximity can't retrieve the peripheral specified";
    uint64_t v35 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    uint64_t v33 = [v34 errorWithDomain:@"WPErrorDomain" code:6 userInfo:v35];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_528);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDScanManager disconnectFromPeripheral:withSubscribedCharacteristics:forClient:]();
    }
  }

  return v33;
}

- (void)disconnectFromCentral:(id)a3 forClient:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_533);
  }
  id v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Disconnecting from central %{public}@ for client %{public}@", buf, 0x16u);
  }
  id v9 = [(WPDScanManager *)self retrievePeripheralWithUUID:v6];
  if (v9)
  {
    id v10 = [(WPDScanManager *)self centralManager];
    uint64_t v15 = *MEMORY[0x263EFED08];
    uint64_t v16 = MEMORY[0x263EFFA88];
    id v11 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v10 cancelPeripheralConnection:v9 options:v11];

    uint64_t v12 = [(WPDScanManager *)self connectionsInProgress];
    uint64_t v13 = [v9 identifier];
    [v12 removeObjectForKey:v13];

    uint64_t v14 = [(WPDScanManager *)self peripheralConnections];
    [v14 removeObject:v9];
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_535);
  }
  id v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v7 name];
    id v11 = [v7 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v10;
    __int16 v24 = 2114;
    uint64_t v25 = v11;
    __int16 v26 = 2048;
    uint64_t v27 = [v7 role];
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "Connected to device (%{public}@) with UUID %{public}@ and role %ld", buf, 0x20u);
  }
  uint64_t v12 = [(WPDScanManager *)self peripheralConnections];
  [v12 removeObject:v7];

  uint64_t v13 = [(WPDScanManager *)self connectionsInProgress];
  uint64_t v14 = [v7 identifier];
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_538);
  }
  uint64_t v16 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v15;
    _os_log_impl(&dword_22316D000, v16, OS_LOG_TYPE_DEFAULT, "Current Connection clients %@", buf, 0xCu);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__WPDScanManager_centralManager_didConnectPeripheral___block_invoke_539;
  v19[3] = &unk_26469B588;
  v19[4] = self;
  id v20 = v7;
  id v21 = v15;
  id v17 = v15;
  id v18 = v7;
  [v17 enumerateObjectsUsingBlock:v19];
}

void __54__WPDScanManager_centralManager_didConnectPeripheral___block_invoke_539(id *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_541);
  }
  int v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    uint64_t v34 = v3;
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "connection client uuid %@", (uint8_t *)&v33, 0xCu);
  }
  int v5 = [a1[4] server];
  id v6 = [v5 getClientForUUID:v3];

  id v7 = a1 + 5;
  id v8 = [a1[5] identifier];
  id v9 = [v6 connectionForUUID:v8];

  if (v6)
  {
    if (v9)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_544);
      }
      id v10 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v10;
        uint64_t v12 = [v6 clientUUID];
        uint64_t v13 = [*v7 identifier];
        int v33 = 138543874;
        uint64_t v34 = v9;
        __int16 v35 = 2114;
        uint64_t v36 = v12;
        __int16 v37 = 2114;
        id v38 = v13;
        _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ already exists for client %{public}@ for peripheral %{public}@", (uint8_t *)&v33, 0x20u);
      }
      uint64_t v14 = [(WPDConnection *)v9 getPeripheral];
      uint64_t v15 = v14;
      if (v14)
      {
        uint64_t v16 = [(WPDConnection *)v14 services];

        if (v16)
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_547);
          }
          id v17 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v33) = 0;
            _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "Services are discovered already", (uint8_t *)&v33, 2u);
          }
          id v18 = [(WPDConnection *)v9 subscribedCharacteristics];
          uint64_t v19 = [v18 count];

          if (v19)
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_550);
            }
            id v20 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v33) = 0;
              _os_log_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEFAULT, "Characteristics are discovered and subscribed", (uint8_t *)&v33, 2u);
            }
            id v21 = [(WPDConnection *)v9 getPeripheralUUID];
            [v6 connectedDevice:v21 withError:0 shouldDiscover:0];

            goto LABEL_50;
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_553);
          }
          id v31 = WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_50;
          }
          LOWORD(v33) = 0;
          uint64_t v32 = "Peripheral connection exist but characteristic discovery is in progress.. wait";
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_556);
          }
          id v31 = WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_50;
          }
          LOWORD(v33) = 0;
          uint64_t v32 = "Peripheral connection exist but service discovery is in progress.. wait";
        }
        _os_log_impl(&dword_22316D000, v31, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v33, 2u);
LABEL_50:

        goto LABEL_51;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_559);
      }
      uint64_t v25 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = v25;
        uint64_t v27 = [v6 clientUUID];
        uint64_t v28 = [*v7 identifier];
        int v33 = 138412802;
        uint64_t v34 = v9;
        __int16 v35 = 2112;
        uint64_t v36 = v27;
        __int16 v37 = 2112;
        id v38 = v28;
        _os_log_impl(&dword_22316D000, v26, OS_LOG_TYPE_DEFAULT, "Updating connection(%@) for client(%@) with peripheral(%@)", (uint8_t *)&v33, 0x20u);
      }
      [(WPDConnection *)v9 updateWithPeripheral:*v7];
      long long v29 = v6;
      long long v30 = v9;
LABEL_40:
      [v29 createdConnection:v30];
      goto LABEL_50;
    }
    if ([*v7 role] != 1)
    {
      uint64_t v15 = [[WPDConnection alloc] initWithPeripheral:*v7];
      [(WPDConnection *)v15 setClient:v6];
      long long v29 = v6;
      long long v30 = v15;
      goto LABEL_40;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_562);
    }
    __int16 v24 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_22316D000, v24, OS_LOG_TYPE_DEFAULT, "Connected as peripheral, wait for subscribed notification from central", (uint8_t *)&v33, 2u);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_566);
    }
    uint64_t v22 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __54__WPDScanManager_centralManager_didConnectPeripheral___block_invoke_539_cold_1((uint64_t)v3, (uint64_t)(a1 + 5), v22);
    }
    if ([a1[6] count] == 1)
    {
      uint64_t v23 = [a1[4] centralManager];
      [v23 cancelPeripheralConnection:a1[5]];
    }
  }
LABEL_51:
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_568);
  }
  id v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDScanManager centralManager:didFailToConnectPeripheral:error:](v11, v9);
  }
  id v12 = v9;
  uint64_t v13 = [(WPDScanManager *)self connectionsInProgress];
  uint64_t v14 = [v12 identifier];
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __66__WPDScanManager_centralManager_didFailToConnectPeripheral_error___block_invoke_569;
  v21[3] = &unk_26469B588;
  v21[4] = self;
  id v22 = v12;
  id v23 = v10;
  id v16 = v10;
  id v17 = v12;
  [v15 enumerateObjectsUsingBlock:v21];
  id v18 = [(WPDScanManager *)self connectionsInProgress];
  uint64_t v19 = [v17 identifier];
  [v18 removeObjectForKey:v19];

  id v20 = [(WPDScanManager *)self peripheralConnections];
  [v20 removeObject:v17];
}

void __66__WPDScanManager_centralManager_didFailToConnectPeripheral_error___block_invoke_569(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 server];
  id v7 = [v5 getClientForUUID:v4];

  id v6 = [*(id *)(a1 + 40) identifier];
  [v7 connectedDevice:v6 withError:*(void *)(a1 + 48) shouldDiscover:0];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = v7;
  id v10 = [(WPDScanManager *)self connectionsInProgress];
  id v11 = [v9 identifier];
  id v12 = [v10 objectForKeyedSubscript:v11];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __63__WPDScanManager_centralManager_didDisconnectPeripheral_error___block_invoke;
  v22[3] = &unk_26469B588;
  v22[4] = self;
  id v13 = v9;
  id v23 = v13;
  id v14 = v8;
  id v24 = v14;
  [v12 enumerateObjectsUsingBlock:v22];
  uint64_t v15 = [(WPDScanManager *)self connectionsInProgress];
  id v16 = [v13 identifier];
  [v15 removeObjectForKey:v16];

  id v17 = [(WPDScanManager *)self peripheralConnections];
  [v17 removeObject:v13];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_571);
  }
  id v18 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v18;
    id v20 = [v13 identifier];
    id v21 = [v14 localizedDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v26 = v20;
    __int16 v27 = 2114;
    uint64_t v28 = v21;
    _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "Disconnected from peripheral %{public}@ with Error: %{public}@", buf, 0x16u);
  }
}

void __63__WPDScanManager_centralManager_didDisconnectPeripheral_error___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 server];
  id v7 = [v5 getClientForUUID:v4];

  id v6 = [*(id *)(a1 + 40) identifier];
  [v7 disconnectedPeer:v6 error:*(void *)(a1 + 48)];
}

- (void)removePeripheralConnection:(id)a3 forClient:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_573);
  }
  id v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Removing connection to peer %{public}@ for client %{public}@", buf, 0x16u);
  }
  id v9 = [(WPDScanManager *)self connectionsInProgress];
  id v10 = [v9 objectForKeyedSubscript:v6];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__WPDScanManager_removePeripheralConnection_forClient___block_invoke_574;
  v13[3] = &unk_26469B588;
  id v14 = v7;
  uint64_t v15 = self;
  id v16 = v6;
  id v11 = v6;
  id v12 = v7;
  [v10 enumerateObjectsUsingBlock:v13];
}

void __55__WPDScanManager_removePeripheralConnection_forClient___block_invoke_574(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:v3])
  {
    id v4 = [*(id *)(a1 + 40) connectionsInProgress];
    int v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v6 = [v5 count];

    if (v6 == 1)
    {
      id v7 = [*(id *)(a1 + 40) retrievePeripheralWithUUID:*(void *)(a1 + 48)];
      if (v7)
      {
        id v8 = [*(id *)(a1 + 40) peripheralConnections];
        [v8 removeObject:v7];

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_576_0);
        }
        id v9 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138543362;
          id v20 = v7;
          _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "Removing CBPeripheral object %{public}@", (uint8_t *)&v19, 0xCu);
        }
        id v10 = [*(id *)(a1 + 40) centralManager];
        [v10 cancelPeripheralConnection:v7];
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_579);
      }
      id v11 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = *(void **)(a1 + 40);
        id v13 = *(void **)(a1 + 48);
        id v14 = v11;
        uint64_t v15 = [v12 connectionsInProgress];
        id v16 = [v15 objectForKeyedSubscript:*(void *)(a1 + 48)];
        int v19 = 138412546;
        id v20 = v13;
        __int16 v21 = 2112;
        id v22 = v16;
        _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEFAULT, "Don't disconnect because peer %@ has more than one connections %@", (uint8_t *)&v19, 0x16u);
      }
    }
    id v17 = [*(id *)(a1 + 40) connectionsInProgress];
    id v18 = [v17 objectForKeyedSubscript:*(void *)(a1 + 48)];
    [v18 removeObject:v3];
  }
}

- (void)removePeripheralConnectionsForClient:(id)a3
{
  id v4 = a3;
  int v5 = [(WPDScanManager *)self connectionsInProgress];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__WPDScanManager_removePeripheralConnectionsForClient___block_invoke;
  v7[3] = &unk_26469B5B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __55__WPDScanManager_removePeripheralConnectionsForClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 containsObject:*(void *)(a1 + 32)]) {
    [v5 removeObject:*(void *)(a1 + 32)];
  }
  if (![v5 count])
  {
    id v6 = [*(id *)(a1 + 40) connectionsInProgress];
    [v6 removeObjectForKey:v7];
  }
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanningDisabled:(BOOL)a3
{
  self->_scanningDisabled = a3;
}

- (void)setScanRequests:(id)a3
{
}

- (NSMutableDictionary)peerRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPeerRequests:(id)a3
{
}

- (NSMutableDictionary)connectionsInProgress
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnectionsInProgress:(id)a3
{
}

- (NSMutableSet)peripheralConnections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPeripheralConnections:(id)a3
{
}

- (void)setCentralManager:(id)a3
{
}

- (void)setCbDiscoveryAsserter:(id)a3
{
}

- (void)setSpyScanClients:(id)a3
{
}

- (NSSet)scanRuleHashes
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (OS_dispatch_queue)serverQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverQueue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setServerQueue:(id)a3
{
}

- (BOOL)isRanging
{
  return self->_isRanging;
}

- (void)setIsRanging:(BOOL)a3
{
  self->_isRanging = a3;
}

- (NSIndexSet)rangingTypes
{
  return self->_rangingTypes;
}

- (void)setScanRetainDuplicates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanRetainDuplicates, 0);
  objc_storeStrong((id *)&self->_rangingTypes, 0);
  objc_destroyWeak((id *)&self->_serverQueue);
  objc_storeStrong((id *)&self->_scanRuleHashes, 0);
  objc_storeStrong((id *)&self->_scanRequestHashes, 0);
  objc_storeStrong((id *)&self->_scanOptions, 0);
  objc_storeStrong((id *)&self->_spyScanClients, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryAsserter, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_currentScanners, 0);
  objc_storeStrong((id *)&self->_peripheralConnections, 0);
  objc_storeStrong((id *)&self->_connectionsInProgress, 0);
  objc_storeStrong((id *)&self->_peerRequests, 0);
  objc_storeStrong((id *)&self->_scanRequests, 0);
}

- (void)addScanRequest:(void *)a3 forClient:.cold.1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a1;
  v6[0] = 67109376;
  v6[1] = [(id)OUTLINED_FUNCTION_10_1() clientType];
  __int16 v7 = 2048;
  uint64_t v8 = [a3 state];
  _os_log_error_impl(&dword_22316D000, v3, OS_LOG_TYPE_ERROR, "Failed to start a scan for type %d - central is not powered on %ld", (uint8_t *)v6, 0x12u);
}

- (void)removeScanRequest:forClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "No scan request object was provided for client %{public}@", v2, v3, v4, v5, v6);
}

- (void)assertCBDiscoveryScan:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEBUG, "assertCBDiscoveryScan asserting", v1, 2u);
}

- (void)assertCBDiscoveryScan:.cold.2()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEBUG, "assertCBDiscoveryScan de-asserting", v1, 2u);
}

void __40__WPDScanManager_assertCBDiscoveryScan___block_invoke_cold_1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v1, v4, "assertCBDiscoveryScan failed to assert with error: %@", v5);
}

- (void)isScannerTestMode
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "scannerTestMode: %@", v2, v3, v4, v5, v6);
}

- (void)heySiriScanActive:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "heySiriScanActive: %@", v2, v3, v4, v5, v6);
}

- (void)reconcileScanRule:(uint64_t)a1 withRule:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = 18;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "Reconcile scan rules for type %ld - %@", (uint8_t *)&v2, 0x16u);
}

- (void)reconcileScanRule:withRule:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Reconcile scan rules for type %ld - removed (not supported type)", v2, v3, v4, v5, v6);
}

void __45__WPDScanManager_reconcileScanRule_withRule___block_invoke_252_cold_1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_6_0(&dword_22316D000, v0, v1, "Reconcile scan rules for type %ld - unexpected key ignored:%@");
}

void __33__WPDScanManager_updateScanRules__block_invoke_8_cold_1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [a1 clientType];
  int v5 = [a1 retainDuplicates];
  if ([a1 startPending]) {
    int v6 = [a1 retainDuplicates] ^ 1;
  }
  else {
    int v6 = 0;
  }
  v7[0] = 67109632;
  v7[1] = v4;
  __int16 v8 = 1024;
  int v9 = v5;
  __int16 v10 = 1024;
  int v11 = v6;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "Retain duplicates type:%d retain:%d reset:%d)", (uint8_t *)v7, 0x14u);
}

- (void)scanOptionsChanged:ForRequests:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void __42__WPDScanManager_clearExistingConnections__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22316D000, v0, OS_LOG_TYPE_ERROR, "WPDClient is nil", v1, 2u);
}

void __42__WPDScanManager_clearExistingConnections__block_invoke_cold_2(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v1, v4, "Client %@ does not respond to selector resetConnection", v5);
}

- (void)shallStop
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "WPDScanManager shall call stopScan:%d", (uint8_t *)v2, 8u);
}

- (void)centralManager:(uint64_t)a3 didDiscoverPeripheral:advertisementData:RSSI:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [(id)OUTLINED_FUNCTION_10_1() identifier];
  OUTLINED_FUNCTION_8_0();
  uint64_t v8 = a3;
  _os_log_debug_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEBUG, "WPDScanManager didDiscoverPeripheral:%@ RSSI%@", v7, 0x16u);
}

void __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_439_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Client with UUID (%@) doesn't exist, but we've still got a scan request for it", v2, v3, v4, v5, v6);
}

- (void)centralManager:(void *)a1 didDiscoverMultiplePeripherals:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_15() count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v1, v3, "WPDScanManager UNEXPECTED didDiscoverMultiplePeripherals %lu peripherals", v4);
}

+ (void)zonesAvailableForType:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Peer tracking request received for a type that doesn't support it (%ld)", v2, v3, v4, v5, v6);
}

- (void)addPeerTrackingRequest:(void *)a1 forClient:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() peerRequests];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22316D000, v1, OS_LOG_TYPE_DEBUG, "Currently tracking peers: %@", v4, 0xCu);
}

- (void)addPeerTrackingRequest:forClient:.cold.2()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22316D000, v0, OS_LOG_TYPE_ERROR, "Unknown error while attempting to track a peer", v1, 2u);
}

- (void)addPeerTrackingRequest:forClient:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Failed to start tracking peer - central is not powered on %ld", v2, v3, v4, v5, v6);
}

- (void)removePeerTrackingRequest:checkZonesAvailable:forClient:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_22316D000, v1, OS_LOG_TYPE_DEBUG, "Removing tracking for peer %@ of type %ld", v2, 0x16u);
}

- (void)retrievePeripheralWithUUID:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_15() centralManager];
  [v3 state];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v1, v4, "Failed to retrieve peripherals with identifiers - central is not powered on: %ld", v5);
}

- (void)connectToPeripheral:fromClient:withOptions:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Wireless Proximity can't retrieve peripheral with UUID %@", v2, v3, v4, v5, v6);
}

- (void)connectToPeripheral:fromClient:withOptions:.cold.2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0(&dword_22316D000, v0, v1, "Wireless Proximity is already connecting to peripheral %@ for type %@");
}

- (void)connectToPeripheral:(void *)a1 fromClient:(void *)a2 withOptions:.cold.3(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 state];
  _os_log_error_impl(&dword_22316D000, v3, OS_LOG_TYPE_ERROR, "Failed to create connection - central is not powered on %d", (uint8_t *)v4, 8u);
}

- (void)disconnectFromPeripheral:withSubscribedCharacteristics:forClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Couldn't find peripheral to disconnect from %@", v2, v3, v4, v5, v6);
}

void __54__WPDScanManager_centralManager_didConnectPeripheral___block_invoke_539_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v11 = [(id)OUTLINED_FUNCTION_10_1() identifier];
  OUTLINED_FUNCTION_7_0(&dword_22316D000, v5, v6, "Error getting client %{public}@ to inform about connection to peripheral %{public}@", v7, v8, v9, v10, 2u);
}

- (void)centralManager:(void *)a1 didFailToConnectPeripheral:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  id v4 = a1;
  [(id)OUTLINED_FUNCTION_10_1() identifier];
  objc_claimAutoreleasedReturnValue();
  int v11 = [(id)OUTLINED_FUNCTION_15() localizedDescription];
  OUTLINED_FUNCTION_7_0(&dword_22316D000, v5, v6, "Failed to connect to peripheral %@ Error: %@", v7, v8, v9, v10, 2u);
}

@end