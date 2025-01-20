@interface PLAWDNetworkUsage
+ (id)entryAggregateDefinitionNetUsage;
+ (id)entryAggregateDefinitions;
+ (id)getSharedObjWithOperator:(id)a3;
- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (NSTimer)snapshotTimer;
- (PLEntryNotificationOperatorComposition)nameConnectionCallback;
- (PLEntryNotificationOperatorComposition)netEventCallback;
- (unsigned)netState;
- (void)handleNameConnectionCallback:(id)a3;
- (void)handleNetCallback:(id)a3;
- (void)resetNetUsageTable;
- (void)setNameConnectionCallback:(id)a3;
- (void)setNetEventCallback:(id)a3;
- (void)setNetState:(unsigned int)a3;
- (void)setSnapshotTimer:(id)a3;
- (void)startMetricCollection:(id)a3;
- (void)stopMetricCollection:(id)a3;
@end

@implementation PLAWDNetworkUsage

+ (id)entryAggregateDefinitions
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"NetworkUsage";
  v2 = [a1 entryAggregateDefinitionNetUsage];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryAggregateDefinitionNetUsage
{
  v30[4] = *MEMORY[0x263EF8340];
  v29[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v27[0] = *MEMORY[0x263F5F880];
  v27[1] = v2;
  v28[0] = &unk_26E546660;
  v28[1] = MEMORY[0x263EFFA80];
  v19 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  v30[0] = v19;
  v29[1] = *MEMORY[0x263F5F870];
  v25[0] = @"NetProcessName";
  v18 = [MEMORY[0x263F5F650] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v26[0] = v17;
  v25[1] = @"WifiIn";
  v16 = [MEMORY[0x263F5F650] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v26[1] = v15;
  v25[2] = @"WifiOut";
  v14 = [MEMORY[0x263F5F650] sharedInstance];
  v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v26[2] = v3;
  v25[3] = @"CellIn";
  v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v26[3] = v5;
  v25[4] = @"CellOut";
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v26[4] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];
  v30[1] = v8;
  v29[2] = *MEMORY[0x263F5F828];
  v23 = &unk_26E546670;
  uint64_t v21 = *MEMORY[0x263F5F820];
  v22 = &unk_26E546670;
  v9 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v24 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v30[2] = v10;
  v29[3] = *MEMORY[0x263F5F830];
  v20[0] = @"WifiIn";
  v20[1] = @"WifiOut";
  v20[2] = @"CellIn";
  v20[3] = @"CellOut";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
  v30[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];

  return v12;
}

+ (id)getSharedObjWithOperator:(id)a3
{
  v3 = (void *)plAwdNetworkUsage;
  if (!plAwdNetworkUsage)
  {
    id v4 = a3;
    v5 = [(PLAWDAuxMetrics *)[PLAWDNetworkUsage alloc] initWithOperator:v4];

    v6 = (void *)plAwdNetworkUsage;
    plAwdNetworkUsage = (uint64_t)v5;

    v3 = (void *)plAwdNetworkUsage;
  }

  return v3;
}

- (void)startMetricCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 addObject:v4];

  [(PLAWDNetworkUsage *)self resetNetUsageTable];
  LODWORD(v5) = [v4 unsignedIntValue];

  if (v5 == 2031619)
  {
    [(PLAWDNetworkUsage *)self setNetState:0];
    v6 = [MEMORY[0x263F5F908] entryKeyForType:*MEMORY[0x263F5F8A8] andName:*MEMORY[0x263F5FA28]];
    id v7 = objc_alloc(MEMORY[0x263F5F658]);
    v8 = [(PLAWDAuxMetrics *)self operator];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__PLAWDNetworkUsage_startMetricCollection___block_invoke;
    v18[3] = &unk_264B99DD0;
    v18[4] = self;
    v9 = (void *)[v7 initWithOperator:v8 forEntryKey:v6 withBlock:v18];

    [(PLAWDNetworkUsage *)self setNetEventCallback:v9];
    v10 = [(PLAWDNetworkUsage *)self netEventCallback];
    [v10 requestEntry];

    v11 = [MEMORY[0x263F5F908] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5FA30]];
    v12 = [NSString stringWithFormat:@"GroupID_%@", v11];
    id v13 = objc_alloc(MEMORY[0x263F5F658]);
    v14 = [(PLAWDAuxMetrics *)self operator];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __43__PLAWDNetworkUsage_startMetricCollection___block_invoke_2;
    v17[3] = &unk_264B99DD0;
    v17[4] = self;
    v15 = (void *)[v13 initWithOperator:v14 forEntryKey:v12 withBlock:v17];

    [(PLAWDNetworkUsage *)self setNameConnectionCallback:v15];
    v16 = [(PLAWDNetworkUsage *)self nameConnectionCallback];
    [v16 requestEntry];
  }
}

uint64_t __43__PLAWDNetworkUsage_startMetricCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleNetCallback:a2];
  }
  return result;
}

uint64_t __43__PLAWDNetworkUsage_startMetricCollection___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleNameConnectionCallback:a2];
  }
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 removeObject:v4];

  uint64_t v6 = [v4 longValue];
  if (v6 == 2031619) {
    [(PLAWDNetworkUsage *)self setNetEventCallback:0];
  }
  id v7 = [(PLAWDAuxMetrics *)self runningMetrics];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    v9 = (void *)plAwdNetworkUsage;
    plAwdNetworkUsage = 0;
  }
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  char v9 = 0;
  if ([v6 longValue] == 2031619 && v8)
  {
    v10 = [(PLAWDNetworkUsage *)self netEventCallback];
    [v10 requestEntry];

    sleep(5u);
    uint64_t v11 = objc_opt_new();
    v12 = (void *)v11;
    if (v11)
    {
      v54 = (void *)v11;
      v56 = v8;
      v57 = v7;
      id v58 = v6;
      v60 = objc_opt_new();
      v59 = objc_opt_new();
      id v13 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
      v14 = [MEMORY[0x263EFF910] monotonicDate];
      [v13 timeIntervalSince1970];
      double v16 = v15;
      [v14 timeIntervalSince1970];
      double v18 = v17 - v16;

      uint64_t v19 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"NetworkUsage"];
      v55 = self;
      v20 = [(PLAWDAuxMetrics *)self operator];
      uint64_t v21 = [v20 storage];
      v53 = (void *)v19;
      uint64_t v22 = objc_msgSend(v21, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v19, 86400.0, v16, v18);

      v52 = (void *)v22;
      [MEMORY[0x263F5F648] summarizeAggregateEntries:v22];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v63 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
      if (v63)
      {
        uint64_t v62 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v63; ++i)
          {
            if (*(void *)v65 != v62) {
              objc_enumerationMutation(obj);
            }
            v24 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            v25 = objc_opt_new();
            v26 = [v24 objectForKeyedSubscript:@"WifiIn"];
            [v26 doubleValue];
            uint64_t v28 = v27;

            v29 = [v24 objectForKeyedSubscript:@"WifiOut"];
            [v29 doubleValue];
            uint64_t v31 = v30;

            v32 = [v24 objectForKeyedSubscript:@"CellIn"];
            [v32 doubleValue];
            uint64_t v34 = v33;

            v35 = [v24 objectForKeyedSubscript:@"CellOut"];
            [v35 doubleValue];
            uint64_t v37 = v36;

            id v38 = [NSString alloc];
            v39 = [v24 objectForKeyedSubscript:@"NetProcessName"];
            v40 = (void *)[v38 initWithFormat:@"%@", v39];

            v41 = [NSNumber numberWithLong:(v31 + v28 + v34 + v37)];
            if ([v41 intValue])
            {
              v42 = [v24 objectForKeyedSubscript:@"NetProcessName"];
              [v25 setBundleName:v42];

              [v25 setWifiIn:v28];
              [v25 setWifiOut:v31];
              [v25 setCellIn:v34];
              [v25 setCellOut:v37];
              [v25 setNumConnections:0];
              if ([v40 rangeOfString:@"com.apple"] == 0x7FFFFFFFFFFFFFFFLL
                && [v40 rangeOfString:@"system"] == 0x7FFFFFFFFFFFFFFFLL)
              {
                [v59 setObject:v25 forKey:v41];
              }
              else
              {
                [v60 addObject:v25];
              }
            }
          }
          uint64_t v63 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
        }
        while (v63);
      }
      v43 = [v59 allKeys];
      v44 = [v43 sortedArrayUsingSelector:sel_compare_];
      v45 = [v44 reverseObjectEnumerator];
      v46 = [v45 allObjects];

      for (unint64_t j = 0; j != 10; ++j)
      {
        if ([v46 count] <= j) {
          break;
        }
        v48 = [v46 objectAtIndexedSubscript:j];
        v49 = [v59 objectForKey:v48];

        [v60 addObject:v49];
      }
      id v7 = v57;
      v12 = v54;
      objc_msgSend(v54, "setTimestamp:", objc_msgSend(v57, "getAWDTimestamp"));
      [v54 setUsages:v60];
      uint64_t v8 = v56;
      [v56 setMetric:v54];

      id v6 = v58;
      self = v55;
    }
    [(PLAWDNetworkUsage *)self resetNetUsageTable];
    v50 = [(PLAWDNetworkUsage *)self netEventCallback];
    [v50 requestEntry];

    char v9 = [v7 submitMetric:v8];
  }

  return v9;
}

- (void)handleNetCallback:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    uint64_t v31 = (void *)v4;
    v5 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"NetworkUsage"];
    id v6 = [v31 objectForKeyedSubscript:@"BundleName"];

    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v5];
      uint64_t v8 = [v31 objectForKeyedSubscript:@"BundleName"];
      [v7 setObject:v8 forKeyedSubscript:@"NetProcessName"];

      char v9 = [v31 objectForKeyedSubscript:@"WifiIn"];
      [v7 setObject:v9 forKeyedSubscript:@"WifiIn"];

      v10 = [v31 objectForKeyedSubscript:@"WifiOut"];
      [v7 setObject:v10 forKeyedSubscript:@"WifiOut"];

      uint64_t v11 = [v31 objectForKeyedSubscript:@"CellIn"];
      [v7 setObject:v11 forKeyedSubscript:@"CellIn"];

      v12 = [v31 objectForKeyedSubscript:@"CellOut"];
      [v7 setObject:v12 forKeyedSubscript:@"CellOut"];

      id v13 = [(PLAWDAuxMetrics *)self operator];
      [v13 logEntry:v7];

      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }
    else
    {
      double v18 = [v31 objectForKeyedSubscript:@"WifiIn"];
      [v18 doubleValue];
      uint64_t v17 = (v19 + 0.0);

      v20 = [v31 objectForKeyedSubscript:@"WifiOut"];
      [v20 doubleValue];
      uint64_t v14 = (v21 + 0.0);

      uint64_t v22 = [v31 objectForKeyedSubscript:@"CellIn"];
      [v22 doubleValue];
      uint64_t v15 = (v23 + 0.0);

      id v7 = [v31 objectForKeyedSubscript:@"CellOut"];
      [v7 doubleValue];
      uint64_t v16 = (v24 + 0.0);
    }

    v25 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v5];
    [v25 setObject:@"system" forKeyedSubscript:@"NetProcessName"];
    v26 = [NSNumber numberWithUnsignedInt:v17];
    [v25 setObject:v26 forKeyedSubscript:@"WifiIn"];

    double v27 = [NSNumber numberWithUnsignedInt:v14];
    [v25 setObject:v27 forKeyedSubscript:@"WifiOut"];

    uint64_t v28 = [NSNumber numberWithUnsignedInt:v15];
    [v25 setObject:v28 forKeyedSubscript:@"CellIn"];

    v29 = [NSNumber numberWithUnsignedInt:v16];
    [v25 setObject:v29 forKeyedSubscript:@"CellOut"];

    double v30 = [(PLAWDAuxMetrics *)self operator];
    [v30 logEntry:v25];
  }

  MEMORY[0x270F9A758]();
}

- (void)handleNameConnectionCallback:(id)a3
{
  v3 = [a3 objectForKey:@"group"];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__PLAWDNetworkUsage_handleNameConnectionCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleNameConnectionCallback__defaultOnce != -1) {
      dispatch_once(&handleNameConnectionCallback__defaultOnce, block);
    }
    if (handleNameConnectionCallback__classDebugEnabled)
    {
      v5 = [NSString stringWithFormat:@"%s = %@", "-[PLAWDNetworkUsage handleNameConnectionCallback:]", v3];
      id v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDNetworkUsage.m"];
      uint64_t v8 = [v7 lastPathComponent];
      char v9 = [NSString stringWithUTF8String:"-[PLAWDNetworkUsage handleNameConnectionCallback:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:278];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDNetworkUsage handleNameConnectionCallback:]((uint64_t)v5, v10);
      }
    }
  }
}

uint64_t __50__PLAWDNetworkUsage_handleNameConnectionCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleNameConnectionCallback__classDebugEnabled = result;
  return result;
}

- (void)resetNetUsageTable
{
  v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"NetworkUsage"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDNetworkUsage;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (PLEntryNotificationOperatorComposition)netEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNetEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)nameConnectionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNameConnectionCallback:(id)a3
{
}

- (unsigned)netState
{
  return self->_netState;
}

- (void)setNetState:(unsigned int)a3
{
  self->_netState = a3;
}

- (NSTimer)snapshotTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSnapshotTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotTimer, 0);
  objc_storeStrong((id *)&self->_nameConnectionCallback, 0);

  objc_storeStrong((id *)&self->_netEventCallback, 0);
}

- (void)handleNameConnectionCallback:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2309F8000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end