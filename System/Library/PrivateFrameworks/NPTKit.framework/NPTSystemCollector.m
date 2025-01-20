@interface NPTSystemCollector
+ (id)collectorName;
- (NSArray)eventsToMonitor;
- (NSMutableDictionary)cachedMetadata;
- (W5Client)client;
- (id)fetchDeviceData;
- (id)metadataDidChangeHandler;
- (void)setCachedMetadata:(id)a3;
- (void)setClient:(id)a3;
- (void)setEventsToMonitor:(id)a3;
- (void)setMetadataDidChangeHandler:(id)a3;
- (void)startCollectingWithCompletion:(id)a3;
- (void)stopCollecting;
@end

@implementation NPTSystemCollector

- (void)startCollectingWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void *))a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263F86488]);
  [(NPTSystemCollector *)self setClient:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NPTSystemCollector *)self setCachedMetadata:v7];

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v9 = [(NPTSystemCollector *)self cachedMetadata];
  [v9 setObject:v8 forKeyedSubscript:@"initial_state"];

  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  v11 = [(NPTSystemCollector *)self cachedMetadata];
  [v11 setObject:v10 forKeyedSubscript:@"events"];

  v24 = [(NPTSystemCollector *)self fetchDeviceData];
  objc_msgSend(v5, "addEntriesFromDictionary:");
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  v13 = [(NPTSystemCollector *)self client];
  id v28 = 0;
  v14 = [v13 queryStatusForPeer:0 error:&v28];
  id v15 = v28;

  v16 = [v14 power];

  if (v16)
  {
    v17 = [v14 power];
    v18 = [v17 dictionary];
    [v5 addEntriesFromDictionary:v18];
  }
  objc_initWeak(&location, self);
  v19 = [(NPTSystemCollector *)self client];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __52__NPTSystemCollector_startCollectingWithCompletion___block_invoke;
  v25[3] = &unk_2643A1DD8;
  objc_copyWeak(&v26, &location);
  [v19 setEventCallback:v25];

  [(NPTSystemCollector *)self setEventsToMonitor:&unk_26CAD5AB8];
  v20 = [(NPTSystemCollector *)self client];
  v21 = [(NPTSystemCollector *)self eventsToMonitor];
  [v20 startMonitoringEvents:v21];

  v22 = [(NPTSystemCollector *)self cachedMetadata];
  [v22 setObject:v5 forKeyedSubscript:@"initial_state"];

  if (v15) {
    [v12 addObject:v15];
  }
  if (v4)
  {
    v23 = (void *)[v12 copy];
    v4[2](v4, v5, v23);
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __52__NPTSystemCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_alloc_init(NPTMetadataEvent);
  id v6 = [MEMORY[0x263EFF910] now];
  [(NPTMetadataEvent *)v5 setTimeStamp:v6];

  [(NPTMetadataEvent *)v5 setCollectorType:objc_opt_class()];
  [(NPTMetadataEvent *)v5 setEventType:8];
  id v7 = objc_alloc_init(MEMORY[0x263F86488]);
  id v18 = 0;
  id v8 = [v7 queryStatusForPeer:0 error:&v18];
  id v9 = v18;

  if (v8)
  {
    id v10 = [v8 power];
    v11 = [v10 dictionary];
    [(NPTMetadataEvent *)v5 setData:v11];
  }
  id v12 = WeakRetained;
  objc_sync_enter(v12);
  v13 = [v12 cachedMetadata];
  v14 = [v13 objectForKeyedSubscript:@"events"];
  id v15 = [(NPTMetadataEvent *)v5 asDictionary];
  [v14 addObject:v15];

  objc_sync_exit(v12);
  v16 = [v12 metadataDidChangeHandler];

  if (v16)
  {
    v17 = [v12 metadataDidChangeHandler];
    ((void (**)(void, NPTMetadataEvent *, id))v17)[2](v17, v5, v9);
  }
}

- (void)stopCollecting
{
  id v3 = [(NPTSystemCollector *)self client];
  v4 = [(NPTSystemCollector *)self eventsToMonitor];
  [v3 stopMonitoringEvents:v4];

  [(NPTSystemCollector *)self setClient:0];
}

+ (id)collectorName
{
  return @"system";
}

- (id)fetchDeviceData
{
  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v2 = objc_alloc_init(MEMORY[0x263F08AB0]);
  uint64_t v3 = MGCopyAnswer();
  v4 = (void *)v3;
  id v5 = @"Unknown Version";
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  id v6 = v5;

  uint64_t v7 = MGCopyAnswer();
  id v8 = (void *)v7;
  id v9 = @"Unknown Model";
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  uint64_t v11 = MGCopyAnswer();
  id v12 = (void *)v11;
  v13 = @"Unknown System";
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v14 = v13;

  v25 = MGCopyAnswer();
  id v15 = MGCopyAnswer();
  IOPSGetPercentRemaining();
  v16 = [NSNumber numberWithInt:0];
  v17 = [NSNumber numberWithBool:IOPSDrawingUnlimitedPower()];
  if (v17) {
    id v18 = @"Unknown";
  }
  else {
    id v18 = @"Unplugged";
  }
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v19 setObject:v6 forKeyedSubscript:@"system_version"];

  [v19 setObject:v16 forKeyedSubscript:@"system_battery_level"];
  [v19 setObject:v10 forKeyedSubscript:@"system_device_model"];

  [v19 setObject:v14 forKeyedSubscript:@"system_name"];
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "activeProcessorCount"));
  [v19 setObject:v20 forKeyedSubscript:@"system_active_processor_count"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isLowPowerModeEnabled"));
  [v19 setObject:v21 forKeyedSubscript:@"system_low_power_mode_enabled"];

  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "processorCount"));
  [v19 setObject:v22 forKeyedSubscript:@"system_processor_count"];

  v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "physicalMemory"));
  [v19 setObject:v23 forKeyedSubscript:@"system_physical_memory"];

  [v19 setObject:v18 forKeyedSubscript:@"system_battery_state"];
  [v19 setObject:v25 forKeyedSubscript:@"system_os_variant"];
  [v19 setObject:v15 forKeyedSubscript:@"system_device_class"];
  [v19 setObject:v17 forKeyedSubscript:@"system_powersource_connected"];
  [v26 addEntriesFromDictionary:v19];

  return v26;
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedMetadata:(id)a3
{
}

- (W5Client)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSArray)eventsToMonitor
{
  return self->_eventsToMonitor;
}

- (void)setEventsToMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsToMonitor, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);

  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end