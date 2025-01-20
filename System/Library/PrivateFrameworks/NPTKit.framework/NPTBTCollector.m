@interface NPTBTCollector
+ (id)collectorName;
- (NSArray)eventsToMonitor;
- (NSMutableDictionary)cachedMetadata;
- (W5Client)client;
- (id)metadataDidChangeHandler;
- (void)setCachedMetadata:(id)a3;
- (void)setClient:(id)a3;
- (void)setEventsToMonitor:(id)a3;
- (void)setMetadataDidChangeHandler:(id)a3;
- (void)startCollectingWithCompletion:(id)a3;
- (void)stopCollecting;
@end

@implementation NPTBTCollector

- (void)startCollectingWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void *))a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263F86488]);
  [(NPTBTCollector *)self setClient:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NPTBTCollector *)self setCachedMetadata:v8];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v10 = [(NPTBTCollector *)self cachedMetadata];
  [v10 setObject:v9 forKeyedSubscript:@"initial_state"];

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = [(NPTBTCollector *)self cachedMetadata];
  [v12 setObject:v11 forKeyedSubscript:@"events"];

  v13 = [(NPTBTCollector *)self client];
  id v27 = 0;
  v14 = [v13 queryStatusForPeer:0 error:&v27];
  id v15 = v27;

  v16 = [v14 bluetooth];

  if (v16)
  {
    v17 = [v14 bluetooth];
    v18 = [v17 dictionary];
    [v5 addEntriesFromDictionary:v18];
  }
  objc_initWeak(&location, self);
  v19 = [(NPTBTCollector *)self client];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __48__NPTBTCollector_startCollectingWithCompletion___block_invoke;
  v24[3] = &unk_2643A1DD8;
  objc_copyWeak(&v25, &location);
  [v19 setEventCallback:v24];

  [(NPTBTCollector *)self setEventsToMonitor:&unk_26CAD5AA0];
  v20 = [(NPTBTCollector *)self client];
  v21 = [(NPTBTCollector *)self eventsToMonitor];
  [v20 startMonitoringEvents:v21];

  v22 = [(NPTBTCollector *)self cachedMetadata];
  [v22 setObject:v5 forKeyedSubscript:@"initial_state"];

  if (v15) {
    [v7 addObject:v15];
  }
  if (v4)
  {
    v23 = (void *)[v7 copy];
    v4[2](v4, v5, v23);
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __48__NPTBTCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_alloc_init(NPTMetadataEvent);
  id v6 = [MEMORY[0x263EFF910] now];
  [(NPTMetadataEvent *)v5 setTimeStamp:v6];

  [(NPTMetadataEvent *)v5 setCollectorType:objc_opt_class()];
  [(NPTMetadataEvent *)v5 setEventType:7];
  id v7 = objc_alloc_init(MEMORY[0x263F86488]);
  id v18 = 0;
  id v8 = [v7 queryStatusForPeer:0 error:&v18];
  id v9 = v18;

  if (v8)
  {
    v10 = [v8 bluetooth];
    id v11 = [v10 dictionary];
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
  id v3 = [(NPTBTCollector *)self client];
  v4 = [(NPTBTCollector *)self eventsToMonitor];
  [v3 stopMonitoringEvents:v4];

  [(NPTBTCollector *)self setClient:0];
}

+ (id)collectorName
{
  return @"bluetooth";
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