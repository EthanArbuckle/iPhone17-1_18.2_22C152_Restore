@interface NPTMetadataCollector
+ (id)collectorName;
+ (id)fetch;
+ (id)fetchCellularData;
+ (id)fetchDeviceData;
+ (id)fetchWRMMetrics;
+ (void)fetch;
- (BOOL)isCollectingMetadata;
- (BOOL)knownCollectionType:(Class)a3;
- (CWFInterface)interface;
- (NPTMetadataCollector)init;
- (NPTMetadataCollector)initWithCollectorTypes:(id)a3;
- (NSDate)startDate;
- (NSMutableArray)collectors;
- (NSMutableDictionary)cachedMetadata;
- (OS_dispatch_queue)backgroundQueue;
- (id)metadataDidChangeHandler;
- (id)metadataDidChangeHandlerForCollectors;
- (void)setBackgroundQueue:(id)a3;
- (void)setCachedMetadata:(id)a3;
- (void)setCollectors:(id)a3;
- (void)setInterface:(id)a3;
- (void)setIsCollectingMetadata:(BOOL)a3;
- (void)setMetadataDidChangeHandler:(id)a3;
- (void)setMetadataDidChangeHandlerForCollectors:(id)a3;
- (void)setStartDate:(id)a3;
- (void)startCollectingWithCompletion:(id)a3;
- (void)stopCollecting;
@end

@implementation NPTMetadataCollector

+ (id)fetch
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5 = [a1 fetchDeviceData];
  v6 = [a1 fetchCellularData];
  [v4 addEntriesFromDictionary:v5];
  [v4 addEntriesFromDictionary:v6];
  [v3 setValue:v4 forKey:@"metadata"];
  v7 = [MEMORY[0x263F86488] sharedClient];
  id v36 = 0;
  v8 = [v7 queryStatusForPeer:0 error:&v36];
  id v9 = v36;
  id v10 = objc_alloc_init(MEMORY[0x263F386E0]);
  [v10 activate];
  v11 = [v10 currentKnownNetworkProfile];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v10 CCA];
    v13 = [NSNumber numberWithInteger:v12];
    [v4 setValue:v13 forKey:@"wifi_cwf_cca"];
  }
  [v10 invalidate];
  if (v11)
  {
    v14 = [v11 dictionary];
    [v4 addEntriesFromDictionary:v14];
  }
  if (v9)
  {
    v15 = +[NPTLogger wifiVelocity];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[NPTMetadataCollector fetch];
    }

    id v16 = v3;
  }
  else
  {
    v35 = v5;
    v17 = [v8 wifi];

    if (v17)
    {
      v18 = [v8 wifi];
      v19 = [v18 dictionary];
      [v4 addEntriesFromDictionary:v19];
    }
    v20 = [v8 bluetooth];

    if (v20)
    {
      v21 = [v8 bluetooth];
      v22 = [v21 dictionary];
      [v4 addEntriesFromDictionary:v22];
    }
    uint64_t v23 = [v8 awdl];
    if (v23)
    {
      v24 = (void *)v23;
      int has_internal_content = os_variant_has_internal_content();

      if (has_internal_content)
      {
        v26 = [v8 awdl];
        v27 = [v26 dictionary];
        [v4 addEntriesFromDictionary:v27];
      }
    }
    v28 = [v8 network];

    if (v28)
    {
      v29 = [v8 network];
      v30 = [v29 dictionary];
      [v4 addEntriesFromDictionary:v30];
    }
    v31 = [v8 power];

    if (v31)
    {
      v32 = [v8 power];
      v33 = [v32 dictionary];
      [v4 addEntriesFromDictionary:v33];
    }
    [v3 setValue:v4 forKey:@"metadata"];
    id v16 = [NSDictionary dictionaryWithDictionary:v3];
    v5 = v35;
  }

  return v16;
}

- (NPTMetadataCollector)init
{
  v6[8] = *MEMORY[0x263EF8340];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  id v4 = [(NPTMetadataCollector *)self initWithCollectorTypes:v3];

  return v4;
}

- (NPTMetadataCollector)initWithCollectorTypes:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(NPTMetadataCollector *)self setCollectors:v5];

  dispatch_queue_t v6 = dispatch_queue_create("NPTMetadataCollector.backgroundQueue", 0);
  [(NPTMetadataCollector *)self setBackgroundQueue:v6];

  [(NPTMetadataCollector *)self setIsCollectingMetadata:1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(objc_class **)(*((void *)&v16 + 1) + 8 * i);
        if (-[NPTMetadataCollector knownCollectionType:](self, "knownCollectionType:", v12, (void)v16))
        {
          v13 = [(NPTMetadataCollector *)self collectors];
          id v14 = objc_alloc_init(v12);
          [v13 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return self;
}

- (BOOL)knownCollectionType:(Class)a3
{
  uint64_t v4 = objc_opt_class();
  if (v4)
  {
    LOBYTE(v4) = [(objc_class *)a3 conformsToProtocol:&unk_26CAD7758];
  }
  return v4;
}

- (void)startCollectingWithCompletion:(id)a3
{
  id v4 = a3;
  [(NPTMetadataCollector *)self setIsCollectingMetadata:1];
  id v5 = [(NPTMetadataCollector *)self backgroundQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke;
  v7[3] = &unk_2643A1660;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v1 = [MEMORY[0x263EFF910] now];
  [*(id *)(a1 + 32) setStartDate:v1];

  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [*(id *)(a1 + 32) setCachedMetadata:v2];

  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [*(id *)(a1 + 32) cachedMetadata];
  [v4 setObject:v3 forKeyedSubscript:@"device_states"];

  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__0;
  v51[4] = __Block_byref_object_dispose__0;
  id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_86;
  v48[3] = &unk_2643A1F38;
  v27 = &v49;
  objc_copyWeak(&v49, &location);
  [*(id *)(a1 + 32) setMetadataDidChangeHandlerForCollectors:v48];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = [*(id *)(a1 + 32) collectors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_26CAD7758, v27))
        {
          uint64_t v10 = [*(id *)(a1 + 32) metadataDidChangeHandlerForCollectors];
          [v9 setMetadataDidChangeHandler:v10];

          dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
          uint64_t v12 = [(id)objc_opt_class() collectorName];
          [v28 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v6);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v13 = [*(id *)(a1 + 32) collectors];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        if (objc_msgSend(v17, "conformsToProtocol:", &unk_26CAD7758, v27))
        {
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_91;
          v37[3] = &unk_2643A1F60;
          uint64_t v18 = *(void *)(a1 + 32);
          v37[4] = v17;
          v37[5] = v18;
          v39 = v51;
          id v38 = v28;
          [v17 startCollectingWithCompletion:v37];
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v14);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v19 = [v28 allValues];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v53 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(NSObject **)(*((void *)&v33 + 1) + 8 * k);
        dispatch_time_t v24 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v23, v24);
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v53 count:16];
    }
    while (v20);
  }

  v25 = [*(id *)(a1 + 32) backgroundQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_2;
  block[3] = &unk_2643A1F88;
  v26 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v31 = v26;
  v32 = v51;
  dispatch_async(v25, block);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  _Block_object_dispose(v51, 8);
}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [v5 asDictionary];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"collector_type"];

  uint64_t v10 = [WeakRetained startDate];
  [v10 timeIntervalSinceNow];
  [v5 setTimeSinceStart:-v11];

  if (([WeakRetained isCollectingMetadata] & 1) == 0)
  {
    uint64_t v26 = +[NPTLogger metadata];
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
      __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_86_cold_2((os_log_t)v26);
    }
    goto LABEL_13;
  }
  if (v6 || !v9)
  {
    long long v16 = +[NPTLogger metadata];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_86_cold_1((uint64_t)v5, (uint64_t)v6, v16);
    }
  }
  else
  {
    uint64_t v12 = [WeakRetained cachedMetadata];
    v13 = [v12 objectForKeyedSubscript:@"device_states"];
    uint64_t v14 = [v13 objectForKeyedSubscript:v9];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"events"];

    if (!v15) {
      goto LABEL_11;
    }
    long long v16 = WeakRetained;
    objc_sync_enter(v16);
    long long v17 = [v16 cachedMetadata];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"device_states"];
    long long v19 = [v18 objectForKeyedSubscript:v9];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"events"];

    uint64_t v21 = [v5 asDictionary];
    v22 = (void *)[v21 copy];
    [v20 addObject:v22];

    uint64_t v23 = [v16 cachedMetadata];
    dispatch_time_t v24 = [v23 objectForKeyedSubscript:@"device_states"];
    v25 = [v24 objectForKeyedSubscript:v9];
    [v25 setObject:v20 forKeyedSubscript:@"events"];

    objc_sync_exit(v16);
  }

LABEL_11:
  v27 = [WeakRetained metadataDidChangeHandler];

  if (v27)
  {
    uint64_t v26 = [WeakRetained metadataDidChangeHandler];
    (*(void (**)(uint64_t, id, id))(v26 + 16))(v26, v5, v6);
LABEL_13:
  }
}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() collectorName];
  id v8 = *(id *)(a1 + 40);
  objc_sync_enter(v8);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v6];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v10 = [*(id *)(a1 + 40) cachedMetadata];
  double v11 = [v10 objectForKeyedSubscript:@"device_states"];
  [v11 setObject:v9 forKeyedSubscript:v7];

  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v31;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v16), "localizedDescription", (void)v30);
        [v12 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  uint64_t v18 = (void *)[v12 copy];
  long long v19 = [*(id *)(a1 + 40) cachedMetadata];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"device_states"];
  uint64_t v21 = [v20 objectForKeyedSubscript:v7];
  [v21 setObject:v18 forKeyedSubscript:@"errors"];

  v22 = [*(id *)(a1 + 40) cachedMetadata];
  uint64_t v23 = [v22 objectForKeyedSubscript:@"device_states"];
  dispatch_time_t v24 = [v23 objectForKeyedSubscript:v7];
  [v24 setObject:v5 forKeyedSubscript:@"initial_state"];

  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v26 = [*(id *)(a1 + 40) cachedMetadata];
  v27 = [v26 objectForKeyedSubscript:@"device_states"];
  id v28 = [v27 objectForKeyedSubscript:v7];
  [v28 setObject:v25 forKeyedSubscript:@"events"];

  objc_sync_exit(v8);
  v29 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
  dispatch_semaphore_signal(v29);
}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_2(uint64_t a1)
{
  obuint64_t j = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) collectors];

    if (v2)
    {
      id v3 = NSDictionary;
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = [*(id *)(a1 + 32) cachedMetadata];
      id v6 = [v3 dictionaryWithDictionary:v5];
      uint64_t v7 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
    }
  }
  objc_sync_exit(obj);
}

- (void)stopCollecting
{
  [(NPTMetadataCollector *)self setIsCollectingMetadata:0];
  id v3 = [(NPTMetadataCollector *)self backgroundQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__NPTMetadataCollector_stopCollecting__block_invoke;
  block[3] = &unk_2643A17E8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __38__NPTMetadataCollector_stopCollecting__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "collectors", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 conformsToProtocol:&unk_26CAD7758]) {
          [v7 stopCollecting];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) setCollectors:0];
}

+ (id)collectorName
{
  return @"metadata";
}

+ (id)fetchWRMMetrics
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = objc_alloc_init(NPTCellularCollector);
  uint64_t v4 = [(NPTCellularCollector *)v3 wrmBasebandMetrics];
  [v2 addEntriesFromDictionary:v4];

  uint64_t v5 = [NSDictionary dictionaryWithDictionary:v2];

  return v5;
}

+ (id)fetchDeviceData
{
  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v2 = objc_alloc_init(MEMORY[0x263F08AB0]);
  uint64_t v3 = MGCopyAnswer();
  uint64_t v4 = (void *)v3;
  uint64_t v5 = @"Unknown Version";
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  id v6 = v5;

  uint64_t v7 = MGCopyAnswer();
  id v8 = (void *)v7;
  long long v9 = @"Unknown Model";
  if (v7) {
    long long v9 = (__CFString *)v7;
  }
  long long v10 = v9;

  uint64_t v11 = MGCopyAnswer();
  long long v12 = (void *)v11;
  id v13 = @"Unknown System";
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  uint64_t v14 = v13;

  id v25 = MGCopyAnswer();
  uint64_t v15 = MGCopyAnswer();
  IOPSGetPercentRemaining();
  uint64_t v16 = [NSNumber numberWithInt:0];
  long long v17 = [NSNumber numberWithBool:IOPSDrawingUnlimitedPower()];
  if (v17) {
    uint64_t v18 = @"Unknown";
  }
  else {
    uint64_t v18 = @"Unplugged";
  }
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v19 setObject:v6 forKeyedSubscript:@"system_version"];

  [v19 setObject:v16 forKeyedSubscript:@"system_battery_level"];
  [v19 setObject:v10 forKeyedSubscript:@"system_device_model"];

  [v19 setObject:v14 forKeyedSubscript:@"system_name"];
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "activeProcessorCount"));
  [v19 setObject:v20 forKeyedSubscript:@"system_active_processor_count"];

  uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isLowPowerModeEnabled"));
  [v19 setObject:v21 forKeyedSubscript:@"system_low_power_mode_enabled"];

  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "processorCount"));
  [v19 setObject:v22 forKeyedSubscript:@"system_processor_count"];

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "physicalMemory"));
  [v19 setObject:v23 forKeyedSubscript:@"system_physical_memory"];

  [v19 setObject:v18 forKeyedSubscript:@"system_battery_state"];
  [v19 setObject:v25 forKeyedSubscript:@"system_os_variant"];
  [v19 setObject:v15 forKeyedSubscript:@"system_device_class"];
  [v19 setObject:v17 forKeyedSubscript:@"system_powersource_connected"];
  [v26 addEntriesFromDictionary:v19];

  return v26;
}

+ (id)fetchCellularData
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = objc_alloc_init(NPTCellularCollector);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __41__NPTMetadataCollector_fetchCellularData__block_invoke;
  uint64_t v14 = &unk_2643A1FB0;
  id v15 = v2;
  dispatch_semaphore_t v16 = v3;
  uint64_t v5 = v3;
  id v6 = v2;
  [(NPTCellularCollector *)v4 startCollectingWithCompletion:&v11];
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v7);
  [(NPTCellularCollector *)v4 stopCollecting];
  id v8 = [(NPTCellularCollector *)v4 fetchCellularTPutEstimates];
  [v6 addEntriesFromDictionary:v8];

  long long v9 = [NSDictionary dictionaryWithDictionary:v6];

  return v9;
}

intptr_t __41__NPTMetadataCollector_fetchCellularData__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
  dispatch_semaphore_t v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
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

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (NSMutableArray)collectors
{
  return self->_collectors;
}

- (void)setCollectors:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
}

- (BOOL)isCollectingMetadata
{
  return self->_isCollectingMetadata;
}

- (void)setIsCollectingMetadata:(BOOL)a3
{
  self->_isCollectingMetadata = a3;
}

- (id)metadataDidChangeHandlerForCollectors
{
  return self->_metadataDidChangeHandlerForCollectors;
}

- (void)setMetadataDidChangeHandlerForCollectors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadataDidChangeHandlerForCollectors, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_collectors, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);

  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

+ (void)fetch
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_219415000, a2, OS_LOG_TYPE_ERROR, "Failed to create W5Status: %{public}@", (uint8_t *)&v4, 0xCu);
}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_86_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_219415000, log, OS_LOG_TYPE_ERROR, "Failure: %@, Error %@", (uint8_t *)&v3, 0x16u);
}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_86_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219415000, log, OS_LOG_TYPE_ERROR, "NPTMetadataCollector has been stopped", v1, 2u);
}

@end