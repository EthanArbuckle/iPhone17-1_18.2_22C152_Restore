@interface WFGasQueryController
- (CWFInterface)cInterface;
- (NSMapTable)gasResponseCache;
- (NSMutableSet)resolvedNetworks;
- (NSSet)profiles;
- (WFGasQueryController)init;
- (WFGasQueryController)initWithInterface:(id)a3;
- (WFGasQueryControllerDelegate)delegate;
- (WFInterface)interface;
- (id)_ANQPDictionaryFromScanResult:(id)a3;
- (id)_defaultANQPParameterForNetworks:(id)a3;
- (id)profileForNetwork:(id)a3;
- (void)_processANQPResults:(id)a3 scanRecords:(id)a4 error:(id)a5;
- (void)removeAllProfiles;
- (void)removeProfileForNetwork:(id)a3;
- (void)resolveProfileForNetwork:(id)a3 handler:(id)a4 force:(BOOL)a5;
- (void)resolveProfilesForNetworks:(id)a3;
- (void)setCInterface:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGasResponseCache:(id)a3;
- (void)setInterface:(id)a3;
- (void)setResolvedNetworks:(id)a3;
@end

@implementation WFGasQueryController

- (WFGasQueryController)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WFGasQueryController init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (WFGasQueryController)initWithInterface:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFGasQueryController;
  v6 = [(WFGasQueryController *)&v15 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  if (!v5)
  {
    v13 = WFLogForCategory(0);
    os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFGasQueryController initWithInterface:]";
      _os_log_impl(&dword_226071000, v13, v14, "%s: nil interface", buf, 0xCu);
    }

    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_cInterface, a3);
  uint64_t v8 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:5 valueOptions:0 capacity:0];
  gasResponseCache = v7->_gasResponseCache;
  v7->_gasResponseCache = (NSMapTable *)v8;

  if (!v7->_gasResponseCache
    || (v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]),
        resolvedNetworks = v7->_resolvedNetworks,
        v7->_resolvedNetworks = v10,
        resolvedNetworks,
        !v7->_resolvedNetworks))
  {
LABEL_5:

    v7 = 0;
  }

  return v7;
}

- (id)profileForNetwork:(id)a3
{
  id v4 = a3;
  id v5 = [(WFGasQueryController *)self gasResponseCache];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)resolveProfilesForNetworks:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 mutableCopy];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = [(WFGasQueryController *)self resolvedNetworks];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v23;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v7);
          }
          [v6 removeObject:*(void *)(*((void *)&v22 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    BOOL v11 = [v6 count] == 0;
    v12 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
    BOOL v15 = (unint64_t)WFCurrentLogLevel() > 2 && v12 != 0;
    if (v11)
    {
      if (v15 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[WFGasQueryController resolveProfilesForNetworks:]";
        _os_log_impl(&dword_226071000, v12, v13, "%s: no new HS20 networks to resolve", buf, 0xCu);
      }
    }
    else
    {
      if (v15 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (const char *)v6;
        _os_log_impl(&dword_226071000, v12, v13, "Starting GAS query for %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v16 = [(WFGasQueryController *)self _defaultANQPParameterForNetworks:v6];
      v17 = [(WFGasQueryController *)self cInterface];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __51__WFGasQueryController_resolveProfilesForNetworks___block_invoke;
      v19[3] = &unk_26478F0D0;
      v19[4] = self;
      objc_copyWeak(&v21, (id *)buf);
      v6 = v6;
      v20 = v6;
      [v17 performANQPWithParameters:v16 reply:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v6 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v18))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[WFGasQueryController resolveProfilesForNetworks:]";
      _os_log_impl(&dword_226071000, v6, v18, "%s: nil networks", buf, 0xCu);
    }
  }
}

void __51__WFGasQueryController_resolveProfilesForNetworks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v12 = 0;
  os_log_type_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__WFGasQueryController_resolveProfilesForNetworks___block_invoke_3;
  v11[3] = &unk_26478F0A8;
  v11[4] = *(void *)(a1 + 32);
  v11[5] = &v12;
  [v6 enumerateObjectsUsingBlock:v11];
  v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = v13[5];
    *(_DWORD *)buf = 136315650;
    v19 = "-[WFGasQueryController resolveProfilesForNetworks:]_block_invoke_2";
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_226071000, v7, v8, "%s: responses %@ error %@", buf, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _processANQPResults:v13[5] scanRecords:*(void *)(a1 + 40) error:v5];

  _Block_object_dispose(&v12, 8);
}

void __51__WFGasQueryController_resolveProfilesForNetworks___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [WFANQPQueryResponse alloc];
  id v5 = [*(id *)(a1 + 32) _ANQPDictionaryFromScanResult:v3];
  id v6 = [(WFANQPQueryResponse *)v4 initWithScanResult:v3 ANQPResponse:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
}

- (id)_ANQPDictionaryFromScanResult:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 cellularNetworkInfo];
  [v5 setValue:v6 forKey:@"ANQP_CELL_NETWORK_INFO"];

  v7 = [v4 roamingConsortiumList];
  [v5 setValue:v7 forKey:@"ANQP_ROAMING_CONSORTIUM_OI_LIST"];

  os_log_type_t v8 = [v4 domainNameList];
  [v5 setValue:v8 forKey:@"ANQP_DOMAIN_NAME_LIST"];

  uint64_t v9 = [v4 BSSID];
  [v5 setValue:v9 forKey:@"BSSID"];

  uint64_t v10 = [v4 operatorFriendlyNameList];

  BOOL v11 = [v10 firstObject];
  [v5 setValue:v11 forKey:@"ANQP_OPERATOR_NAME"];

  return v5;
}

- (id)_defaultANQPParameterForNetworks:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F386C0]);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  BOOL v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__WFGasQueryController__defaultANQPParameterForNetworks___block_invoke;
  v7[3] = &unk_26478F0F8;
  v7[4] = &v8;
  [v3 enumerateObjectsUsingBlock:v7];
  id v5 = [(id)v9[5] allObjects];
  [v4 setScanResults:v5];

  [v4 setANQPElementIDList:&unk_26D9E21B8];
  [v4 setMaximumCacheAge:0];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __57__WFGasQueryController__defaultANQPParameterForNetworks___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 attributes];
  id v4 = (void *)[v3 mutableCopy];
  WiFiNetworkCreate();

  id CoreWiFiScanResult = (id)WiFiNetworkCreateCoreWiFiScanResult();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:CoreWiFiScanResult];
}

- (void)resolveProfileForNetwork:(id)a3 handler:(id)a4 force:(BOOL)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    uint64_t v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]";
      _os_log_impl(&dword_226071000, v10, v11, "%s: skipping cache, forcing resolution", buf, 0xCu);
    }

    goto LABEL_14;
  }
  uint64_t v12 = [(WFGasQueryController *)self gasResponseCache];
  id v13 = [v12 objectForKey:v8];

  if (!v13)
  {
LABEL_14:
    v16 = WFLogForCategory(0);
    os_log_type_t v17 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v16 && os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]";
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_226071000, v16, v17, "%s: resolving profile for %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    os_log_type_t v18 = [MEMORY[0x263EFFA08] setWithObject:v8];
    v19 = [(WFGasQueryController *)self _defaultANQPParameterForNetworks:v18];

    __int16 v20 = [(WFGasQueryController *)self cInterface];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke;
    v21[3] = &unk_26478F148;
    v21[4] = self;
    objc_copyWeak(&v24, (id *)buf);
    id v22 = v8;
    id v23 = v9;
    [v20 performANQPWithParameters:v19 reply:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
    id v13 = 0;
    goto LABEL_19;
  }
  uint64_t v14 = WFLogForCategory(0);
  os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v14 && os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]";
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_226071000, v14, v15, "%s: found cached profile %@ for %@", buf, 0x20u);
  }

  if (v9) {
    (*((void (**)(id, void *, void))v9 + 2))(v9, v13, 0);
  }
LABEL_19:
}

void __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke_2;
  v10[3] = &unk_26478F120;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], v10);

  objc_destroyWeak(&v16);
}

void __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy__3;
  id v28 = __Block_byref_object_dispose__3;
  id v29 = [MEMORY[0x263EFF9C0] set];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke_3;
  v23[3] = &unk_26478F0A8;
  id v2 = *(void **)(a1 + 32);
  v23[4] = *(void *)(a1 + 40);
  v23[5] = &v24;
  [v2 enumerateObjectsUsingBlock:v23];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    id v5 = (WFHotspotProfile *)v25[5];
    id v6 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    uint64_t v31 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]_block_invoke_2";
    __int16 v32 = 2112;
    v33 = v5;
    __int16 v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_226071000, v3, v4, "%s: responses %@ error %@", buf, 0x20u);
  }

  if ([(id)v25[5] count] && !*(void *)(a1 + 48))
  {
    id v8 = [(id)v25[5] anyObject];
    id v9 = [v8 scanResult];
    uint64_t v10 = [v9 matchingKnownNetworkProfile];

    if (v10) {
      goto LABEL_10;
    }
    id v11 = [*(id *)(a1 + 40) cInterface];
    uint64_t v12 = [v8 scanResult];
    uint64_t v10 = [v11 knownNetworkProfileMatchingScanResult:v12];

    if (v10)
    {
LABEL_10:
      id v13 = [[WFNetworkProfile alloc] initWithCoreWiFiProfile:v10];
      uint64_t v7 = [[WFHotspotProfile alloc] initWithProfile:v13 anqpResponse:v8];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      id v15 = [WeakRetained gasResponseCache];
      [v15 setObject:v7 forKey:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v10 = WFLogForCategory(0);
      os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
      uint64_t v7 = 0;
      if (!WFCurrentLogLevel() || !v10) {
        goto LABEL_12;
      }
      id v13 = v10;
      if (os_log_type_enabled(&v13->super, v20))
      {
        uint64_t v21 = *(WFHotspotProfile **)(a1 + 56);
        id v22 = [v8 ssid];
        *(_DWORD *)buf = 136315650;
        uint64_t v31 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]_block_invoke";
        __int16 v32 = 2112;
        v33 = v21;
        __int16 v34 = 2112;
        v35 = v22;
        _os_log_impl(&dword_226071000, &v13->super, v20, "%s: no existing profile for network %@ (response %@)", buf, 0x20u);
      }
      uint64_t v7 = 0;
      uint64_t v10 = v13;
    }

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v7 = 0;
LABEL_13:
  id v16 = WFLogForCategory(0);
  os_log_type_t v17 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v16 && os_log_type_enabled(v16, v17))
  {
    os_log_type_t v18 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    uint64_t v31 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]_block_invoke";
    __int16 v32 = 2112;
    v33 = v7;
    __int16 v34 = 2112;
    v35 = v18;
    _os_log_impl(&dword_226071000, v16, v17, "%s: profile %@ error %@", buf, 0x20u);
  }

  uint64_t v19 = *(void *)(a1 + 64);
  if (v19) {
    (*(void (**)(uint64_t, WFHotspotProfile *, void))(v19 + 16))(v19, v7, *(void *)(a1 + 48));
  }
  _Block_object_dispose(&v24, 8);
}

void __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_type_t v4 = [WFANQPQueryResponse alloc];
  id v5 = [*(id *)(a1 + 32) _ANQPDictionaryFromScanResult:v3];
  id v6 = [(WFANQPQueryResponse *)v4 initWithScanResult:v3 ANQPResponse:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
}

- (void)_processANQPResults:(id)a3 scanRecords:(id)a4 error:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 count];
  if (!a5 && v10)
  {
    v39 = objc_opt_new();
    v38 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v36 = v8;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v44;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
          id v16 = [v15 ssid];
          os_log_type_t v17 = [v9 scanRecordWithSSID:v16];

          os_log_type_t v18 = WFLogForCategory(0);
          if (v17)
          {
            os_log_type_t v19 = OSLogForWFLogLevel(3uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 3 && v18 && os_log_type_enabled(v18, v19))
            {
              *(_DWORD *)buf = 136315394;
              v48 = "-[WFGasQueryController _processANQPResults:scanRecords:error:]";
              __int16 v49 = 2112;
              v50 = v17;
              _os_log_impl(&dword_226071000, v18, v19, "%s: resolved %@", buf, 0x16u);
            }

            os_log_type_t v20 = [(WFGasQueryController *)self resolvedNetworks];
            [v20 addObject:v17];

            uint64_t v21 = [v15 scanResult];
            os_log_type_t v18 = [v21 matchingKnownNetworkProfile];

            if (v18) {
              goto LABEL_15;
            }
            id v22 = [(WFGasQueryController *)self cInterface];
            id v23 = [v15 scanResult];
            os_log_type_t v18 = [v22 knownNetworkProfileMatchingScanResult:v23];

            if (v18)
            {
LABEL_15:
              uint64_t v24 = WFLogForCategory(0);
              os_log_type_t v25 = OSLogForWFLogLevel(3uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 3 && v24 && os_log_type_enabled(v24, v25))
              {
                *(_DWORD *)buf = 136315650;
                v48 = "-[WFGasQueryController _processANQPResults:scanRecords:error:]";
                __int16 v49 = 2112;
                v50 = v18;
                __int16 v51 = 2112;
                v52 = v17;
                _os_log_impl(&dword_226071000, v24, v25, "%s: resolved profile %@ for %@", buf, 0x20u);
              }

              uint64_t v26 = [[WFNetworkProfile alloc] initWithCoreWiFiProfile:v18];
              __int16 v27 = [[WFHotspotProfile alloc] initWithProfile:v26 anqpResponse:v15];
              id v28 = [(WFGasQueryController *)self gasResponseCache];
              [v28 setObject:v27 forKey:v17];

              [v39 addObject:v18];
              id v29 = [v17 ssid];
              [v38 addObject:v29];
            }
            else
            {
              os_log_type_t v18 = WFLogForCategory(0);
              os_log_type_t v31 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v18)
              {
                os_log_type_t v18 = v18;
                if (os_log_type_enabled(v18, v31))
                {
                  __int16 v32 = [v15 ssid];
                  *(_DWORD *)buf = 136315650;
                  v48 = "-[WFGasQueryController _processANQPResults:scanRecords:error:]";
                  __int16 v49 = 2112;
                  v50 = v17;
                  __int16 v51 = 2112;
                  v52 = v32;
                  _os_log_impl(&dword_226071000, v18, v31, "%s: no existing profile for network %@ (response %@)", buf, 0x20u);
                }
              }
            }
          }
          else
          {
            os_log_type_t v30 = OSLogForWFLogLevel(2uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 2 && v18 && os_log_type_enabled(v18, v30))
            {
              *(_DWORD *)buf = 138412290;
              v48 = (const char *)v15;
              _os_log_impl(&dword_226071000, v18, v30, "Missing scanRecord for ANQP response %@", buf, 0xCu);
            }
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
        uint64_t v12 = v33;
      }
      while (v33);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__WFGasQueryController__processANQPResults_scanRecords_error___block_invoke;
    block[3] = &unk_26478E7B0;
    block[4] = self;
    id v41 = v39;
    id v42 = v38;
    id v34 = v38;
    id v35 = v39;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v8 = v36;
  }
}

void __62__WFGasQueryController__processANQPResults_scanRecords_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 gasQueryController:*(void *)(a1 + 32) didUpdateProfiles:*(void *)(a1 + 40) networkNames:*(void *)(a1 + 48)];
}

- (void)removeProfileForNetwork:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[WFGasQueryController removeProfileForNetwork:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: removing profile for network %@", (uint8_t *)&v13, 0x16u);
  }

  if (v4)
  {
    uint64_t v7 = [(WFGasQueryController *)self resolvedNetworks];
    [v7 removeObject:v4];

    id v8 = [(WFGasQueryController *)self gasResponseCache];
    id v9 = [v8 objectForKey:v4];

    if (v9)
    {
      uint64_t v10 = [(WFGasQueryController *)self gasResponseCache];
      [v10 removeObjectForKey:v4];
      goto LABEL_8;
    }
    uint64_t v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[WFGasQueryController removeProfileForNetwork:]";
      uint64_t v12 = "%s: no existing profile for network";
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[WFGasQueryController removeProfileForNetwork:]";
      uint64_t v12 = "%s: nil network";
LABEL_17:
      _os_log_impl(&dword_226071000, v10, v11, v12, (uint8_t *)&v13, 0xCu);
    }
  }
LABEL_8:
}

- (void)removeAllProfiles
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    id v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      os_log_type_t v6 = [(WFGasQueryController *)self gasResponseCache];
      int v9 = 136315394;
      uint64_t v10 = "-[WFGasQueryController removeAllProfiles]";
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_226071000, v5, v4, "%s: removing profiles %@", (uint8_t *)&v9, 0x16u);
    }
  }

  uint64_t v7 = [(WFGasQueryController *)self gasResponseCache];
  [v7 removeAllObjects];

  id v8 = [(WFGasQueryController *)self resolvedNetworks];
  [v8 removeAllObjects];
}

- (WFGasQueryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFGasQueryControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)profiles
{
  return self->_profiles;
}

- (NSMapTable)gasResponseCache
{
  return self->_gasResponseCache;
}

- (void)setGasResponseCache:(id)a3
{
}

- (NSMutableSet)resolvedNetworks
{
  return self->_resolvedNetworks;
}

- (void)setResolvedNetworks:(id)a3
{
}

- (WFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (CWFInterface)cInterface
{
  return self->_cInterface;
}

- (void)setCInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cInterface, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_resolvedNetworks, 0);
  objc_storeStrong((id *)&self->_gasResponseCache, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end