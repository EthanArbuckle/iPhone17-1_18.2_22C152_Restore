@interface NPTCellularCollector
+ (id)calculateMaxCellularTPutEstimates:(id)a3;
+ (id)collectorName;
+ (id)getPreferredDataSlot;
+ (void)getPreferredDataSlot;
- (BOOL)stopCollectingMetadata;
- (CTDataStatus)dataStatus;
- (CTTelephonyNetworkInfo)networkInfo;
- (CTXPCServiceSubscriptionContext)context;
- (CoreTelephonyClient)ctClient;
- (NPTCellularCollector)init;
- (NPTCellularCollector)initWithSlotID:(id)a3;
- (NSArray)cellChanges;
- (NSArray)dataStatusChanges;
- (NSDictionary)metadata;
- (NSMutableArray)mutableCellChanges;
- (NSMutableArray)mutableDataStatusChanges;
- (NSMutableDictionary)cachedMetadata;
- (NSMutableDictionary)mutableMetadata;
- (NSMutableDictionary)servingCellInfo;
- (NSNumber)slotID;
- (OS_nw_path_monitor)pathMonitor;
- (id)dualSimStatus;
- (id)fetchCellularTPutEstimates;
- (id)getCellInfoForSlot:(id)a3;
- (id)getCellularMNCMCCDE;
- (id)getEstimateFromPath:(id)a3;
- (id)metadataDidChangeHandler;
- (id)signalStrengthMeasurements;
- (id)wrmBasebandMetrics;
- (void)cellChanged:(id)a3 cell:(id)a4;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)estimateDidChange:(id)a3;
- (void)getCellularMNCMCCDE;
- (void)setCachedMetadata:(id)a3;
- (void)setCellChanges:(id)a3;
- (void)setContext:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setDataStatus:(id)a3;
- (void)setDataStatusChanges:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataDidChangeHandler:(id)a3;
- (void)setMutableCellChanges:(id)a3;
- (void)setMutableDataStatusChanges:(id)a3;
- (void)setMutableMetadata:(id)a3;
- (void)setNetworkInfo:(id)a3;
- (void)setPathMonitor:(id)a3;
- (void)setServingCellInfo:(id)a3;
- (void)setSlotID:(id)a3;
- (void)setStopCollectingMetadata:(BOOL)a3;
- (void)setUpPathMonitor:(id)a3;
- (void)signalStrengthMeasurements;
- (void)startCollectingWithCompletion:(id)a3;
- (void)stopCollecting;
@end

@implementation NPTCellularCollector

- (NPTCellularCollector)init
{
  v3 = +[NPTCellularCollector getPreferredDataSlot];
  v4 = [(NPTCellularCollector *)self initWithSlotID:v3];

  return v4;
}

- (NPTCellularCollector)initWithSlotID:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NPTCellularCollector;
  v6 = [(NPTCellularCollector *)&v25 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableCellChanges = v6->_mutableCellChanges;
    v6->_mutableCellChanges = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableDataStatusChanges = v6->_mutableDataStatusChanges;
    v6->_mutableDataStatusChanges = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mutableMetadata = v6->_mutableMetadata;
    v6->_mutableMetadata = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    servingCellInfo = v6->_servingCellInfo;
    v6->_servingCellInfo = v13;

    id v15 = objc_alloc(MEMORY[0x263F02D30]);
    v16 = dispatch_get_global_queue(2, 0);
    uint64_t v17 = [v15 initWithQueue:v16];
    ctClient = v6->_ctClient;
    v6->_ctClient = (CoreTelephonyClient *)v17;

    [(CoreTelephonyClient *)v6->_ctClient setDelegate:v6];
    objc_storeStrong((id *)&v6->_slotID, a3);
    v19 = (CTTelephonyNetworkInfo *)objc_alloc_init(MEMORY[0x263F02D18]);
    networkInfo = v6->_networkInfo;
    v6->_networkInfo = v19;

    if ([v5 isEqualToNumber:&unk_26CAD5700])
    {
      uint64_t v21 = 1;
    }
    else if ([v5 isEqualToNumber:&unk_26CAD5718])
    {
      uint64_t v21 = 2;
    }
    else
    {
      NSLog(&cfstr_ExpectingSloti.isa, v5);
      uint64_t v21 = 0;
    }
    uint64_t v22 = [objc_alloc(MEMORY[0x263F02D20]) initWithSlot:v21];
    context = v6->_context;
    v6->_context = (CTXPCServiceSubscriptionContext *)v22;
  }
  return v6;
}

- (NSDictionary)metadata
{
  v2 = NSDictionary;
  v3 = [(NPTCellularCollector *)self mutableMetadata];
  v4 = [v2 dictionaryWithDictionary:v3];

  return (NSDictionary *)v4;
}

- (id)dualSimStatus
{
  v3 = [(NPTCellularCollector *)self ctClient];

  if (!v3) {
    return @"Unknown";
  }
  v4 = [(NPTCellularCollector *)self ctClient];
  uint64_t v8 = 0;
  unint64_t v5 = [v4 getDualSimCapability:&v8];
  uint64_t v6 = v8;

  id result = @"Unknown";
  if (!v6 && v5 <= 4) {
    return off_2643A1770[v5];
  }
  return result;
}

- (id)wrmBasebandMetrics
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_super v25 = v3;
  if (objc_opt_class())
  {
    id v4 = objc_alloc_init(MEMORY[0x263F86490]);
    queue = dispatch_queue_create("com.apple.Client.queueBB.wirelesscoexmanager", 0);
    objc_msgSend(v4, "registerClient:queue:", 33);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    int v44 = 0;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy_;
    v41 = __Block_byref_object_dispose_;
    id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __42__NPTCellularCollector_wrmBasebandMetrics__block_invoke;
    v33[3] = &unk_2643A1638;
    v33[4] = self;
    v35 = &v37;
    v36 = v43;
    dispatch_semaphore_t dsema = v5;
    dispatch_semaphore_t v34 = dsema;
    uint64_t v6 = (void *)MEMORY[0x21D48AC70](v33);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__NPTCellularCollector_wrmBasebandMetrics__block_invoke_2;
    block[3] = &unk_2643A1660;
    id v7 = v4;
    id v31 = v7;
    id v22 = v6;
    id v32 = v22;
    dispatch_async(queue, block);
    dispatch_time_t v8 = dispatch_walltime(0, 1000000000);
    dispatch_semaphore_wait(dsema, v8);
    uint64_t v21 = v7;
    [v7 unregisterClient];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v9 = [&unk_26CAD59E8 countByEnumeratingWithState:&v26 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(&unk_26CAD59E8);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v13 = self;
          objc_sync_enter(v13);
          v14 = [(id)v38[5] valueForKey:v12];
          if (v14)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (id v15 = v14,
                  [MEMORY[0x263F087B0] notANumber],
                  v16 = objc_claimAutoreleasedReturnValue(),
                  char v17 = [v15 isEqualToNumber:v16],
                  v16,
                  v15,
                  (v17 & 1) == 0))
            {
              v18 = [&unk_26CAD59E8 objectForKey:v12];
              [v25 setObject:v14 forKey:v18];
            }
          }

          objc_sync_exit(v13);
        }
        uint64_t v9 = [&unk_26CAD59E8 countByEnumeratingWithState:&v26 objects:v45 count:16];
      }
      while (v9);
    }
    v19 = [NSDictionary dictionaryWithDictionary:v25];

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(v43, 8);
  }
  else
  {
    v19 = [NSDictionary dictionaryWithDictionary:v3];
  }

  return v19;
}

void __42__NPTCellularCollector_wrmBasebandMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addEntriesFromDictionary:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  int v5 = *(_DWORD *)(v4 + 24);
  *(_DWORD *)(v4 + 24) = v5 + 1;
  if (v5 >= 3) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  objc_sync_exit(v3);
}

uint64_t __42__NPTCellularCollector_wrmBasebandMetrics__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) getNRPhyMetrics:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) getCellularDataMetrics:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) getWiFiBWEstimationMetrics:*(void *)(a1 + 40)];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 getQSHMetrics:v4];
  }
  return result;
}

- (id)signalStrengthMeasurements
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(NPTCellularCollector *)self ctClient];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
    dispatch_time_t v8 = +[NPTLogger cellular];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NPTCellularCollector signalStrengthMeasurements](v8);
    }
    goto LABEL_9;
  }
  id v6 = (void *)MEMORY[0x263F02CD8];
  id v7 = [(NPTCellularCollector *)self context];
  dispatch_time_t v8 = [v6 descriptorWithSubscriptionContext:v7];

  uint64_t v9 = [(NPTCellularCollector *)self ctClient];
  id v23 = 0;
  uint64_t v10 = [v9 getSignalStrengthMeasurements:v8 error:&v23];
  id v11 = v23;

  if (!v11)
  {
    v14 = [v10 rssi];
    [v3 setObject:v14 forKeyedSubscript:@"cellular_rssi"];

    id v15 = [v10 rscp];
    [v3 setObject:v15 forKeyedSubscript:@"cellular_rscp"];

    v16 = [v10 ecn0];
    [v3 setObject:v16 forKeyedSubscript:@"cellular_ecn0"];

    char v17 = [v10 rsrp];
    [v3 setObject:v17 forKeyedSubscript:@"cellular_rsrp"];

    v18 = [v10 rsrq];
    [v3 setObject:v18 forKeyedSubscript:@"cellular_rsrq"];

    v19 = [v10 snr];
    [v3 setObject:v19 forKeyedSubscript:@"cellular_snr"];

    v20 = [v10 ecio];
    [v3 setObject:v20 forKeyedSubscript:@"cellular_ecio"];

    uint64_t v21 = [v10 rxagc];
    [v3 setObject:v21 forKeyedSubscript:@"cellular_rxagc"];

LABEL_9:
    v13 = [NSDictionary dictionaryWithDictionary:v3];
    goto LABEL_10;
  }
  uint64_t v12 = +[NPTLogger cellular];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    [(NPTCellularCollector *)self signalStrengthMeasurements];
  }

  v13 = [NSDictionary dictionaryWithDictionary:v3];

LABEL_10:

  return v13;
}

- (id)getCellularMNCMCCDE
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  ctClient = self->_ctClient;
  context = self->_context;
  id v20 = 0;
  id v6 = (void *)[(CoreTelephonyClient *)ctClient copyMobileCountryCode:context error:&v20];
  id v7 = v20;
  [v3 setObject:v6 forKeyedSubscript:@"cellular_rn_mobile_country_code"];

  if (v7)
  {
    dispatch_time_t v8 = +[NPTLogger cellular];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NPTCellularCollector getCellularMNCMCCDE]();
    }
  }
  uint64_t v9 = self->_ctClient;
  uint64_t v10 = self->_context;
  id v19 = v7;
  id v11 = (void *)[(CoreTelephonyClient *)v9 copyMobileNetworkCode:v10 error:&v19];
  id v12 = v19;

  [v3 setObject:v11 forKeyedSubscript:@"cellular_rn_mobile_network_code"];
  if (v12)
  {
    v13 = +[NPTLogger cellular];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NPTCellularCollector getCellularMNCMCCDE]();
    }
  }
  _CTServerConnectionCreate();
  uint64_t IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
  int v15 = HIDWORD(IsEnabled);
  if (IsEnabled)
  {
    v16 = +[NPTLogger cellular];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(NPTCellularCollector *)v15 getCellularMNCMCCDE];
    }
  }
  else
  {
    [v3 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"cellular_data_is_enabled"];
  }
  char v17 = [NSDictionary dictionaryWithDictionary:v3];

  return v17;
}

- (id)getCellInfoForSlot:(id)a3
{
  id v3 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  objc_super v25 = __Block_byref_object_copy_;
  long long v26 = __Block_byref_object_dispose_;
  id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc(MEMORY[0x263F02D30]);
  char v5 = dispatch_get_global_queue(2, 0);
  id v6 = (void *)[v4 initWithQueue:v5];

  if ([v3 isEqualToNumber:&unk_26CAD5700])
  {
    id v7 = objc_alloc(MEMORY[0x263F02D20]);
    uint64_t v8 = 1;
  }
  else if ([v3 isEqualToNumber:&unk_26CAD5718])
  {
    id v7 = objc_alloc(MEMORY[0x263F02D20]);
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v9 = +[NPTLogger cellular];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NPTCellularCollector getCellInfoForSlot:]();
    }

    id v7 = objc_alloc(MEMORY[0x263F02D20]);
    uint64_t v8 = 0;
  }
  uint64_t v10 = (void *)[v7 initWithSlot:v8];
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __43__NPTCellularCollector_getCellInfoForSlot___block_invoke;
  id v19 = &unk_2643A1688;
  uint64_t v21 = &v22;
  id v12 = v11;
  id v20 = v12;
  [v6 copyCellInfo:v10 completion:&v16];
  dispatch_time_t v13 = dispatch_time(0, 500000000);
  dispatch_semaphore_wait(v12, v13);
  v14 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:", v23[5], v16, v17, v18, v19);

  _Block_object_dispose(&v22, 8);

  return v14;
}

intptr_t __43__NPTCellularCollector_getCellInfoForSlot___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = objc_msgSend(a2, "legacyInfo", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = *MEMORY[0x263F02DB0];
    uint64_t v8 = *MEMORY[0x263F02DC0];
    uint64_t v9 = *MEMORY[0x263F02DB8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_semaphore_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 valueForKey:v7];
        if (([v12 isEqualToString:v8] & 1) != 0
          || [v12 isEqualToString:v9])
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)startCollectingWithCompletion:(id)a3
{
  v63 = (void (**)(id, void *, void *))a3;
  id v62 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NPTCellularCollector *)self setStopCollectingMetadata:0];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NPTCellularCollector *)self setCachedMetadata:v5];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [(NPTCellularCollector *)self cachedMetadata];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6);

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = [(NPTCellularCollector *)self cachedMetadata];
  [v9 setObject:v8 forKeyedSubscript:@"events"];

  uint64_t v10 = [(NPTCellularCollector *)self dualSimStatus];
  [v4 setObject:v10 forKeyedSubscript:@"cellular_dual_sim_capability"];

  dispatch_semaphore_t v11 = [(NPTCellularCollector *)self slotID];
  id v12 = [(NPTCellularCollector *)self getCellInfoForSlot:v11];

  if (v12)
  {
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke;
    v73[3] = &unk_2643A16B0;
    id v74 = &unk_26CAD5A10;
    id v75 = v4;
    [v12 enumerateKeysAndObjectsUsingBlock:v73];
  }
  v61 = v12;
  dispatch_time_t v13 = [(NPTCellularCollector *)self signalStrengthMeasurements];
  [v4 addEntriesFromDictionary:v13];

  long long v14 = [(NPTCellularCollector *)self networkInfo];
  uint64_t v15 = [v14 dataServiceIdentifier];

  long long v16 = [(NPTCellularCollector *)self networkInfo];
  long long v17 = [v16 serviceCurrentRadioAccessTechnology];
  v60 = (void *)v15;
  v18 = [v17 objectForKeyedSubscript:v15];

  if (v18)
  {
    uint64_t v19 = [v18 stringByReplacingOccurrencesOfString:@"CTRadioAccessTechnology" withString:&stru_26CAC3728];
    [v4 setObject:v19 forKeyedSubscript:@"cellular_radio_access_technology"];
  }
  ctClient = self->_ctClient;
  context = self->_context;
  id v72 = 0;
  uint64_t v22 = (void *)[(CoreTelephonyClient *)ctClient copyMobileSubscriberCountryCode:context error:&v72];
  id v23 = v72;
  uint64_t v24 = v23;
  if (v22 && !v23)
  {
    objc_super v25 = [v22 uppercaseString];
    [v4 setObject:v25 forKeyedSubscript:@"cellular_mobile_country_code"];

    long long v26 = self->_ctClient;
    id v71 = 0;
    id v27 = (void *)[(CoreTelephonyClient *)v26 copyMobileSubscriberIsoCountryCode:v22 error:&v71];
    id v28 = v71;
    uint64_t v24 = v28;
    if (v27 && !v28)
    {
      long long v29 = [v27 uppercaseString];
      [v4 setObject:v29 forKeyedSubscript:@"cellular_iso_country_code"];
    }
  }
  v30 = self->_ctClient;
  id v31 = self->_context;
  id v70 = v24;
  id v32 = (void *)[(CoreTelephonyClient *)v30 copyMobileSubscriberNetworkCode:v31 error:&v70];
  id v33 = v70;

  if (v32 && !v33)
  {
    dispatch_semaphore_t v34 = [v32 uppercaseString];
    [v4 setObject:v34 forKeyedSubscript:@"cellular_mobile_network_code"];
  }
  v57 = v32;
  v35 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
  v36 = self->_ctClient;
  uint64_t v37 = self->_context;
  id v69 = v33;
  uint64_t v38 = [(CoreTelephonyClient *)v36 copyCarrierBundleValue:v37 key:@"AllowVOIP" bundleType:v35 error:&v69];
  id v39 = v69;

  if (!v39)
  {
    if (v38)
    {
      [v4 setObject:v38 forKeyedSubscript:@"cellular_allows_voip"];
    }
    else
    {
      v40 = (void *)[objc_alloc(NSNumber) initWithBool:1];
      [v4 setObject:v40 forKeyedSubscript:@"cellular_allows_voip"];
    }
  }
  v56 = (void *)v38;
  v58 = v22;
  v59 = v18;
  v41 = self->_ctClient;
  id v42 = self->_context;
  id v68 = v39;
  v43 = (void *)[(CoreTelephonyClient *)v41 copyCarrierBundleValue:v42 key:@"CarrierName" bundleType:v35 error:&v68];
  id v44 = v68;

  if (v43 && !v44) {
    [v4 setObject:v43 forKeyedSubscript:@"cellular_carrier_name"];
  }
  v45 = [(NPTCellularCollector *)self ctClient];
  uint64_t v46 = [(NPTCellularCollector *)self context];
  id v67 = 0;
  v47 = [v45 getDataStatus:v46 error:&v67];
  id v48 = v67;

  if (v48)
  {
    v49 = +[NPTLogger cellular];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      -[NPTCellularCollector startCollectingWithCompletion:](v48, v49);
    }
  }
  v50 = [v47 dictionary];
  [v4 addEntriesFromDictionary:v50];

  v51 = [(NPTCellularCollector *)self getCellularMNCMCCDE];
  [v4 addEntriesFromDictionary:v51];

  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3042000000;
  v65[3] = __Block_byref_object_copy__249;
  v65[4] = __Block_byref_object_dispose__250;
  objc_initWeak(&v66, self);
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke_251;
  v64[3] = &unk_2643A1700;
  v64[4] = v65;
  [(NPTCellularCollector *)self setUpPathMonitor:v64];
  if (v48) {
    [v62 addObject:v48];
  }
  if (v63)
  {
    v52 = [NSDictionary dictionaryWithDictionary:v4];
    v53 = (void *)[v62 copy];
    v63[2](v63, v52, v53);
  }
  v54 = self;
  objc_sync_enter(v54);
  v55 = [(NPTCellularCollector *)v54 cachedMetadata];
  [v55 setObject:v4 forKeyedSubscript:@"initial_state"];

  [(NPTCellularCollector *)v54 setMutableMetadata:v4];
  objc_sync_exit(v54);

  _Block_object_dispose(v65, 8);
  objc_destroyWeak(&v66);
}

void __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"kCTCellMonitor" withString:&stru_26CAC3728];
  uint64_t v7 = [NSString stringWithFormat:@"cellular_%@", v6];
  id v8 = [v7 lowercaseString];

  LOBYTE(v6) = [*(id *)(a1 + 32) containsObject:v5];
  if ((v6 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v10 stringByReplacingOccurrencesOfString:@"kCTCellMonitor" withString:&stru_26CAC3728];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v8];
    }
    else
    {
      [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v8];
    }
  }
}

void __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke_251(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (nw_path_get_status(v3) == nw_path_status_satisfied)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke_2;
    v4[3] = &unk_2643A16D8;
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = v3;
    nw_path_enumerate_interfaces(v5, v4);
  }
}

BOOL __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke_2(uint64_t a1, nw_interface_t interface)
{
  nw_interface_type_t type = nw_interface_get_type(interface);
  if (type == nw_interface_type_cellular)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    [WeakRetained estimateDidChange:*(void *)(a1 + 32)];
  }
  return type != nw_interface_type_cellular;
}

- (void)stopCollecting
{
  [(CTTelephonyNetworkInfo *)self->_networkInfo setServiceSubscriberCellularProvidersDidUpdateNotifier:0];

  [(NPTCellularCollector *)self setStopCollectingMetadata:1];
}

+ (id)collectorName
{
  return @"cellular";
}

+ (id)getPreferredDataSlot
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F02D30]);
  id v3 = dispatch_get_global_queue(2, 0);
  id v4 = (void *)[v2 initWithQueue:v3];

  id v25 = 0;
  id v5 = [v4 getActiveContexts:&v25];
  id v6 = v25;
  if (v6)
  {
    uint64_t v7 = +[NPTLogger cellular];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[NPTCellularCollector getPreferredDataSlot];
    }

    id v8 = &unk_26CAD5700;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v5 subscriptions];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v20 = v4;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v15 = [v14 uuid];
          long long v16 = [v5 dataPreferred];
          int v17 = [v15 isEqual:v16];

          if (v17)
          {
            v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "slotID"));
            id v4 = v20;
            goto LABEL_16;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      id v4 = v20;
    }
    v18 = &unk_26CAD5700;
LABEL_16:

    id v8 = v18;
  }

  return v8;
}

- (void)setUpPathMonitor:(id)a3
{
  id v4 = a3;
  nw_path_monitor_t v5 = nw_path_monitor_create_with_type(nw_interface_type_cellular);
  [(NPTCellularCollector *)self setPathMonitor:v5];

  id v6 = [(NPTCellularCollector *)self pathMonitor];
  uint64_t v7 = dispatch_get_global_queue(2, 0);
  nw_path_monitor_set_queue(v6, v7);

  id v8 = [(NPTCellularCollector *)self pathMonitor];
  nw_path_monitor_set_update_handler(v8, v4);

  uint64_t v9 = [(NPTCellularCollector *)self pathMonitor];
  nw_path_monitor_start(v9);
}

- (id)fetchCellularTPutEstimates
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3042000000;
  v15[3] = __Block_byref_object_copy__249;
  v15[4] = __Block_byref_object_dispose__250;
  objc_initWeak(&v16, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__NPTCellularCollector_fetchCellularTPutEstimates__block_invoke;
  v11[3] = &unk_2643A1750;
  id v5 = v3;
  id v12 = v5;
  long long v14 = v15;
  id v6 = v4;
  dispatch_time_t v13 = v6;
  [(NPTCellularCollector *)self setUpPathMonitor:v11];
  dispatch_time_t v7 = dispatch_walltime(0, 1000000000);
  dispatch_semaphore_wait(v6, v7);
  id v8 = v13;
  id v9 = v5;

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v9;
}

void __50__NPTCellularCollector_fetchCellularTPutEstimates__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (nw_path_get_status(v3) == nw_path_status_satisfied)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__NPTCellularCollector_fetchCellularTPutEstimates__block_invoke_2;
    v6[3] = &unk_2643A1728;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = v4;
    uint64_t v10 = v5;
    id v8 = v3;
    id v9 = *(id *)(a1 + 40);
    nw_path_enumerate_interfaces(v8, v6);
  }
}

BOOL __50__NPTCellularCollector_fetchCellularTPutEstimates__block_invoke_2(uint64_t a1, nw_interface_t interface)
{
  nw_interface_type_t type = nw_interface_get_type(interface);
  if (type == nw_interface_type_cellular)
  {
    id v4 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    id v6 = [WeakRetained getEstimateFromPath:*(void *)(a1 + 40)];
    [v4 addEntriesFromDictionary:v6];

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  return type != nw_interface_type_cellular;
}

- (id)getEstimateFromPath:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t estimated_download_throughput = nw_path_get_estimated_download_throughput();
  uint64_t estimated_upload_throughput = nw_path_get_estimated_upload_throughput();

  id v8 = [NSNumber numberWithDouble:(double)(unint64_t)estimated_download_throughput / 125000.0];
  [v5 setObject:v8 forKeyedSubscript:@"cellular_download_estimate"];

  id v9 = [NSNumber numberWithDouble:(double)(unint64_t)estimated_upload_throughput / 125000.0];
  [v5 setObject:v9 forKeyedSubscript:@"cellular_upload_estimate"];

  return v5;
}

- (void)estimateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = [(NPTCellularCollector *)self getEstimateFromPath:v4];
  [v5 addEntriesFromDictionary:v6];

  id v7 = +[NPTLogger cellular];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[NPTCellularCollector estimateDidChange:]();
  }

  if ([v5 count])
  {
    id v8 = self;
    objc_sync_enter(v8);
    id v9 = [(NPTCellularCollector *)v8 mutableMetadata];
    [v9 addEntriesFromDictionary:v5];

    id v10 = objc_alloc_init(MEMORY[0x263F08790]);
    [v10 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
    uint64_t v11 = [NPTMetadataEvent alloc];
    uint64_t v12 = objc_opt_class();
    dispatch_time_t v13 = [MEMORY[0x263EFF910] now];
    long long v14 = [(NPTMetadataEvent *)v11 initWithType:v12 eventType:27 timeStamp:v13 data:v5];

    uint64_t v15 = [(NPTCellularCollector *)v8 cachedMetadata];
    id v16 = [v15 objectForKeyedSubscript:@"events"];
    int v17 = [(NPTMetadataEvent *)v14 asDictionary];
    [v16 addObject:v17];

    objc_sync_exit(v8);
    v18 = [(NPTCellularCollector *)v8 metadataDidChangeHandler];

    if (v18)
    {
      uint64_t v19 = [(NPTCellularCollector *)v8 metadataDidChangeHandler];
      ((void (**)(void, NPTMetadataEvent *, void))v19)[2](v19, v14, 0);
    }
  }
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  id v9 = [(NPTCellularCollector *)self context];
  id v10 = [v9 uuid];
  if ([v8 isEqual:v10])
  {
    BOOL v11 = [(NPTCellularCollector *)self stopCollectingMetadata];

    if (!v11)
    {
      uint64_t v12 = +[NPTLogger cellular];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[NPTCellularCollector dataStatus:dataStatusInfo:](v7, v12);
      }

      dispatch_time_t v13 = self;
      objc_sync_enter(v13);
      [(NPTCellularCollector *)v13 setDataStatus:v7];
      long long v14 = [(NPTCellularCollector *)v13 mutableDataStatusChanges];
      uint64_t v15 = [(NPTCellularCollector *)v13 dataStatus];
      id v16 = [v15 dictionary];
      [v14 addObject:v16];

      int v17 = [(NPTCellularCollector *)v13 mutableMetadata];
      v18 = [(NPTCellularCollector *)v13 dataStatus];
      uint64_t v19 = [v18 dictionary];
      [v17 addEntriesFromDictionary:v19];

      id v20 = objc_alloc_init(MEMORY[0x263F08790]);
      [v20 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
      long long v21 = [NPTMetadataEvent alloc];
      uint64_t v22 = objc_opt_class();
      long long v23 = [MEMORY[0x263EFF910] now];
      long long v24 = [(NPTCellularCollector *)v13 dataStatus];
      id v25 = [v24 dictionary];
      long long v26 = [(NPTMetadataEvent *)v21 initWithType:v22 eventType:1 timeStamp:v23 data:v25];

      uint64_t v27 = [(NPTCellularCollector *)v13 cachedMetadata];
      id v28 = [v27 objectForKeyedSubscript:@"events"];

      if (v28)
      {
        long long v29 = [(NPTCellularCollector *)v13 cachedMetadata];
        v30 = [v29 objectForKeyedSubscript:@"events"];
        id v31 = [(NPTMetadataEvent *)v26 asDictionary];
        [v30 addObject:v31];
      }
      objc_sync_exit(v13);

      id v32 = [(NPTCellularCollector *)v13 metadataDidChangeHandler];

      if (v32)
      {
        id v33 = [(NPTCellularCollector *)v13 metadataDidChangeHandler];
        ((void (**)(void, NPTMetadataEvent *, void))v33)[2](v33, v26, 0);
      }
    }
  }
  else
  {
  }
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  id v9 = [(NPTCellularCollector *)self context];
  id v10 = [v9 uuid];
  if ([v8 isEqual:v10])
  {
    BOOL v11 = [(NPTCellularCollector *)self stopCollectingMetadata];

    if (!v11)
    {
      uint64_t v12 = +[NPTLogger cellular];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[NPTCellularCollector cellChanged:cell:]();
      }

      dispatch_time_t v13 = self;
      objc_sync_enter(v13);
      long long v14 = [(NPTCellularCollector *)v13 servingCellInfo];
      [v14 addEntriesFromDictionary:v7];

      uint64_t v15 = [(NPTCellularCollector *)v13 servingCellInfo];
      id v16 = [(NPTCellularCollector *)v13 slotID];
      int v17 = [(NPTCellularCollector *)v13 getCellInfoForSlot:v16];
      [v15 addEntriesFromDictionary:v17];

      v18 = [(NPTCellularCollector *)v13 mutableCellChanges];
      [v18 addObject:v7];

      uint64_t v19 = [(NPTCellularCollector *)v13 mutableMetadata];
      [v19 addEntriesFromDictionary:v7];

      id v20 = objc_alloc_init(MEMORY[0x263F08790]);
      [v20 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
      long long v21 = [NPTMetadataEvent alloc];
      uint64_t v22 = objc_opt_class();
      long long v23 = [MEMORY[0x263EFF910] now];
      long long v24 = NSDictionary;
      id v25 = [(NPTCellularCollector *)v13 servingCellInfo];
      long long v26 = [v24 dictionaryWithDictionary:v25];
      uint64_t v27 = [(NPTMetadataEvent *)v21 initWithType:v22 eventType:2 timeStamp:v23 data:v26];

      id v28 = [(NPTCellularCollector *)v13 cachedMetadata];
      long long v29 = [v28 objectForKeyedSubscript:@"events"];

      if (v29)
      {
        v30 = [(NPTCellularCollector *)v13 cachedMetadata];
        id v31 = [v30 objectForKeyedSubscript:@"events"];
        id v32 = [(NPTMetadataEvent *)v27 asDictionary];
        [v31 addObject:v32];
      }
      objc_sync_exit(v13);

      id v33 = [(NPTCellularCollector *)v13 metadataDidChangeHandler];

      if (v33)
      {
        dispatch_semaphore_t v34 = [(NPTCellularCollector *)v13 metadataDidChangeHandler];
        ((void (**)(void, NPTMetadataEvent *, void))v34)[2](v34, v27, 0);
      }
    }
  }
  else
  {
  }
}

- (NSArray)cellChanges
{
  id v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(NPTCellularCollector *)self mutableCellChanges];
  id v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (NSArray)dataStatusChanges
{
  id v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(NPTCellularCollector *)self mutableDataStatusChanges];
  id v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

+ (id)calculateMaxCellularTPutEstimates:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v30 = v3;
  [v3 objectForKeyedSubscript:@"events"];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        BOOL v11 = [v10 objectForKeyedSubscript:@"event_type"];
        uint64_t v12 = +[NPTMetadataEventTypeConverter getTypeAsString:27];

        if (v11 == v12)
        {
          dispatch_time_t v13 = [v10 objectForKeyedSubscript:@"data"];
          long long v14 = [v13 objectForKeyedSubscript:@"cellular_download_estimate"];
          [v14 doubleValue];
          double v16 = v15;

          if (v16 > v8)
          {
            int v17 = [v10 objectForKeyedSubscript:@"data"];
            v18 = [v17 objectForKeyedSubscript:@"cellular_download_estimate"];
            [v18 doubleValue];
            double v8 = v19;
          }
          id v20 = [v10 objectForKeyedSubscript:@"data"];
          long long v21 = [v20 objectForKeyedSubscript:@"cellular_upload_estimate"];
          [v21 doubleValue];
          double v23 = v22;

          if (v23 > v7)
          {
            long long v24 = [v10 objectForKeyedSubscript:@"data"];
            id v25 = [v24 objectForKeyedSubscript:@"cellular_upload_estimate"];
            [v25 doubleValue];
            double v7 = v26;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
  }
  uint64_t v27 = [NSNumber numberWithDouble:v8];
  [v31 setObject:v27 forKeyedSubscript:@"cellular_max_download_estimate"];

  id v28 = [NSNumber numberWithDouble:v7];
  [v31 setObject:v28 forKeyedSubscript:@"cellular_max_upload_estimate"];

  return v31;
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedMetadata:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setCellChanges:(id)a3
{
}

- (void)setDataStatusChanges:(id)a3
{
}

- (CoreTelephonyClient)ctClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCtClient:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)context
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContext:(id)a3
{
}

- (NSNumber)slotID
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSlotID:(id)a3
{
}

- (CTDataStatus)dataStatus
{
  return (CTDataStatus *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDataStatus:(id)a3
{
}

- (NSMutableArray)mutableCellChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMutableCellChanges:(id)a3
{
}

- (NSMutableArray)mutableDataStatusChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMutableDataStatusChanges:(id)a3
{
}

- (NSMutableDictionary)servingCellInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setServingCellInfo:(id)a3
{
}

- (NSMutableDictionary)mutableMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMutableMetadata:(id)a3
{
}

- (CTTelephonyNetworkInfo)networkInfo
{
  return (CTTelephonyNetworkInfo *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNetworkInfo:(id)a3
{
}

- (BOOL)stopCollectingMetadata
{
  return self->_stopCollectingMetadata;
}

- (void)setStopCollectingMetadata:(BOOL)a3
{
  self->_stopCollectingMetadata = a3;
}

- (OS_nw_path_monitor)pathMonitor
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPathMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_networkInfo, 0);
  objc_storeStrong((id *)&self->_mutableMetadata, 0);
  objc_storeStrong((id *)&self->_servingCellInfo, 0);
  objc_storeStrong((id *)&self->_mutableDataStatusChanges, 0);
  objc_storeStrong((id *)&self->_mutableCellChanges, 0);
  objc_storeStrong((id *)&self->_dataStatus, 0);
  objc_storeStrong((id *)&self->_slotID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_dataStatusChanges, 0);
  objc_storeStrong((id *)&self->_cellChanges, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);

  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

- (void)signalStrengthMeasurements
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219415000, log, OS_LOG_TYPE_ERROR, "Current CoreTelephony API does not include getSignalStrengthMeasurements:Error: method", v1, 2u);
}

- (void)getCellularMNCMCCDE
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_219415000, v0, v1, "Error collecting mobile country code %@", v2);
}

- (void)getCellInfoForSlot:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_219415000, v0, v1, "Expecting slotID to be 1 or 2. Received %@. Passing SlotUnknown to CT", v2);
}

- (void)startCollectingWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_219415000, a2, v4, "Failed to get dataStatus: %{public}@", v5);
}

+ (void)getPreferredDataSlot
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_219415000, a2, v4, "Failed to get the active contexts due to %{public}@", v5);
}

- (void)estimateDidChange:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_219415000, v0, OS_LOG_TYPE_DEBUG, "Cellular Throughput Estimate Changed: %@", v1, 0xCu);
}

- (void)dataStatus:(void *)a1 dataStatusInfo:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 dictionary];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_219415000, a2, OS_LOG_TYPE_DEBUG, "Data Status Changed: %@", v4, 0xCu);
}

- (void)cellChanged:cell:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_219415000, v0, OS_LOG_TYPE_DEBUG, "Cell changed: %@", v1, 0xCu);
}

@end