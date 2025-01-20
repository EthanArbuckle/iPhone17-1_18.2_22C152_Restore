@interface NPTAWDLCollector
+ (id)collectorName;
- (CWFInterface)interface;
- (NSMutableDictionary)cachedMetadata;
- (id)awdlOpModeString;
- (id)fetchAWDLData;
- (id)metadataDidChangeHandler;
- (void)setCachedMetadata:(id)a3;
- (void)setInterface:(id)a3;
- (void)setMetadataDidChangeHandler:(id)a3;
- (void)startCollectingWithCompletion:(id)a3;
- (void)stopCollecting;
@end

@implementation NPTAWDLCollector

- (void)startCollectingWithCompletion:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, id, void *))a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NPTAWDLCollector *)self setCachedMetadata:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [(NPTAWDLCollector *)self cachedMetadata];
  [v8 setObject:v7 forKeyedSubscript:@"initial_state"];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = [(NPTAWDLCollector *)self cachedMetadata];
  [v10 setObject:v9 forKeyedSubscript:@"events"];

  if (os_variant_has_internal_content())
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F386E0]) initWithServiceType:1];
    [(NPTAWDLCollector *)self setInterface:v11];

    objc_initWeak(&location, self);
    v12 = [(NPTAWDLCollector *)self interface];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __50__NPTAWDLCollector_startCollectingWithCompletion___block_invoke;
    v25[3] = &unk_2643A1C78;
    objc_copyWeak(&v26, &location);
    [v12 setEventHandler:v25];

    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    v14 = [(NPTAWDLCollector *)self interface];
    [v14 activate];

    v15 = [(NPTAWDLCollector *)self interface];
    id v24 = 0;
    [v15 startMonitoringEventType:17 error:&v24];
    id v16 = v24;

    v17 = [(NPTAWDLCollector *)self fetchAWDLData];
    [v5 addEntriesFromDictionary:v17];
    v18 = [(NPTAWDLCollector *)self cachedMetadata];
    [v18 setObject:v5 forKeyedSubscript:@"initial_state"];

    if (v16) {
      [v13 addObject:v16];
    }
    if (v4)
    {
      v19 = (void *)[v13 copy];
      v4[2](v4, v5, v19);
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    v20 = [MEMORY[0x263EFF9A0] dictionary];
    [v20 setValue:@"AWDL Metrics only available on Internal Builds" forKey:*MEMORY[0x263F08320]];
    uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPTKit" code:-1 userInfo:v20];
    v22 = (void *)v21;
    if (v4)
    {
      v28[0] = v21;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
      v4[2](v4, v5, v23);
    }
  }
}

void __50__NPTAWDLCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_alloc_init(NPTMetadataEvent);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = [MEMORY[0x263EFF910] now];
  [(NPTMetadataEvent *)v4 setTimeStamp:v6];

  [(NPTMetadataEvent *)v4 setCollectorType:objc_opt_class()];
  if ([v17 type] == 17)
  {
    [(NPTMetadataEvent *)v4 setEventType:17];
    id v7 = [WeakRetained interface];
    v8 = [v7 AWDLSyncState];

    if (v8)
    {
      [v8 bytes];
      id v9 = W5DescriptionForAWDLSyncState();
      [v5 setObject:v9 forKeyedSubscript:@"data"];
    }
    else
    {
      [v5 setObject:0 forKeyedSubscript:@"data"];
    }
    v11 = [NSDictionary dictionaryWithDictionary:v5];
    [(NPTMetadataEvent *)v4 setData:v11];

    if (!v4) {
      goto LABEL_10;
    }
    id v12 = WeakRetained;
    objc_sync_enter(v12);
    id v13 = [v12 cachedMetadata];
    v14 = [v13 objectForKeyedSubscript:@"events"];
    v15 = [(NPTMetadataEvent *)v4 asDictionary];
    [v14 addObject:v15];

    objc_sync_exit(v12);
    id v16 = [v12 metadataDidChangeHandler];

    if (!v16) {
      goto LABEL_10;
    }
    v10 = [v12 metadataDidChangeHandler];
    ((void (**)(void, NPTMetadataEvent *, void))v10)[2](v10, v4, 0);
  }
  else
  {
    v10 = (void (**)(void, void, void))v4;
    v4 = 0;
  }

LABEL_10:
}

- (void)stopCollecting
{
  id v2 = [(NPTAWDLCollector *)self interface];
  [v2 invalidate];
}

+ (id)collectorName
{
  return @"awdl";
}

- (id)fetchAWDLData
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = NSNumber;
  id v5 = [(NPTAWDLCollector *)self interface];
  id v6 = [v5 AWDL];
  id v7 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "powerOn"));
  [v3 setObject:v7 forKeyedSubscript:@"awdl_power_state"];

  v8 = [(NPTAWDLCollector *)self interface];
  id v9 = [v8 AWDLMasterChannel];

  if (v9)
  {
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"%i", *(unsigned int *)(objc_msgSend(v9, "bytes") + 4));
    [v3 setObject:v10 forKeyedSubscript:@"awdl_master_channel"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"awdl_master_channel"];
  }
  v11 = [(NPTAWDLCollector *)self interface];
  id v12 = [v11 AWDLSecondaryMasterChannel];

  if (v12)
  {
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%i", *(unsigned int *)(objc_msgSend(v12, "bytes") + 4));
    [v3 setObject:v13 forKeyedSubscript:@"awdl_secondary_master_channel"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"awdl_secondary_master_channel"];
  }
  v14 = [(NPTAWDLCollector *)self awdlOpModeString];
  [v3 setObject:v14 forKeyedSubscript:@"awdl_op_mode"];

  v15 = [(NPTAWDLCollector *)self interface];
  id v16 = [v15 AWDLElectionParameters];

  if (v16)
  {
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%i", *(unsigned int *)(objc_msgSend(v16, "bytes") + 32));
    [v3 setObject:v17 forKeyedSubscript:@"awdl_election_parameters"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"awdl_election_parameters"];
  }
  v18 = [(NPTAWDLCollector *)self interface];
  v19 = [v18 AWDLSyncState];

  if (v19)
  {
    [v19 bytes];
    v20 = W5DescriptionForAWDLSyncState();
    [v3 setObject:v20 forKeyedSubscript:@"awdl_sync_state"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"awdl_sync_state"];
  }
  uint64_t v21 = [(NPTAWDLCollector *)self interface];
  v22 = [v21 AWDLSyncChannelSequence];

  if (v22)
  {
    [v22 bytes];
    v23 = W5DescriptionForAWDLSyncChannelSequence();
    [v3 setObject:v23 forKeyedSubscript:@"awdl_sync_channel_sequence"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"awdl_sync_channel_sequence"];
  }
  id v24 = [(NPTAWDLCollector *)self interface];
  v25 = [v24 AWDLStrategy];

  if (v25)
  {
    [v25 bytes];
    id v26 = W5DescriptionForAWDLScheduleState();
    [v3 setObject:v26 forKeyedSubscript:@"awdl_schedule"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"awdl_schedule"];
  }

  return v3;
}

- (id)awdlOpModeString
{
  id v2 = [(NPTAWDLCollector *)self interface];
  id v3 = [v2 AWDLOpMode];

  if (v3)
  {
    v4 = NSString;
    id v5 = v3;
    if (*(_DWORD *)([v5 bytes] + 4) <= 2u) {
      id v6 = awdlOpModeString_modestr[*(unsigned int *)([v5 bytes] + 4)];
    }
    else {
      id v6 = "Unknown";
    }
    id v7 = objc_msgSend(v4, "stringWithFormat:", @"%s", v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
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

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);

  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end