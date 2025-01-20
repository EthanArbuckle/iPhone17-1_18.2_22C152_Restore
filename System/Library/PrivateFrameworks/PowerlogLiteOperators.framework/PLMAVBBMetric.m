@interface PLMAVBBMetric
+ (id)sharedInstance;
- (BOOL)registerForNotifClient:(id)a3 andProfile:(id)a4;
- (NSData)aPeriodicTriggerPayload;
- (NSMutableDictionary)prodMetrics;
- (NSNumber)aPeriodicProfileId;
- (NSNumber)aPeriodicTriggerCnt;
- (NSString)notifyTitle;
- (PLAgent)logAgent;
- (PLMAVBBHardwareMessage)storeMetricsLogger;
- (void)flushPeriodicMetrics;
- (void)initializeDataStoreBBTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5;
- (void)initializeMetricsDictWithTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5;
- (void)modelProdMetricsNotify;
- (void)queueAperiodicMetricId:(id)a3 payload:(id)a4 profileId:(id)a5;
- (void)queuePeriodicMetricId:(id)a3 payload:(id)a4 forTrigger:(id)a5;
- (void)setAPeriodicProfileId:(id)a3;
- (void)setAPeriodicTriggerCnt:(id)a3;
- (void)setAPeriodicTriggerPayload:(id)a3;
- (void)setLogAgent:(id)a3;
- (void)setNotifyTitle:(id)a3;
- (void)setProdMetrics:(id)a3;
- (void)setStoreMetricsLogger:(id)a3;
@end

@implementation PLMAVBBMetric

void __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v38 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v44 = v38;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "BB Agent: queuePeriodicMetricId in dispatch queue : %@", buf, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 40) integerValue];
  v4 = *(void **)(*(void *)(a1 + 48) + 48);
  if (v3 == 786435)
  {
    if (v4)
    {
      if ([*(id *)(a1 + 56) integerValue])
      {
        v5 = [*(id *)(*(void *)(a1 + 48) + 48) objectForKeyedSubscript:@"triggerId"];
        uint64_t v6 = [v5 integerValue];
        uint64_t v7 = [*(id *)(a1 + 56) integerValue];

        if (v6 == v7)
        {
          v8 = [NSString stringWithFormat:@"bad tid. will failed assertion if debugEnabled"];
          v9 = (void *)MEMORY[0x1E4F929B8];
          v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m"];
          v11 = [v10 lastPathComponent];
          v12 = [NSString stringWithUTF8String:"-[PLMAVBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke"];
          [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:107];

          v13 = PLLogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v8;
            _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          [MEMORY[0x1E4F929C0] debugEnabled];
          return;
        }
      }
      [*(id *)(a1 + 48) modelProdMetricsNotify];
      if (*(void *)(*(void *)(a1 + 48) + 56))
      {
        v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v40 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v44 = v40;
          _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "BB Agent: queuePeriodicMetricId in RF Trigger Count : %@", buf, 0xCu);
        }

        [*(id *)(*(void *)(a1 + 48) + 56) logBBMavPeriodicMetrics];
      }
    }
    v21 = [[AWDMETRICSCellularPowerLog alloc] initWithData:*(void *)(a1 + 32)];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_24;
      v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v42[4] = v22;
      if (qword_1EBD5B5C8 != -1) {
        dispatch_once(&qword_1EBD5B5C8, v42);
      }
      if (_MergedGlobals_77)
      {
        v23 = [NSString stringWithFormat:@"Generate awdPowerLog to handle periodic metrics: %@", v21];
        v24 = (void *)MEMORY[0x1E4F929B8];
        v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m"];
        v26 = [v25 lastPathComponent];
        v27 = [NSString stringWithUTF8String:"-[PLMAVBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke_2"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:117];

        v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v23;
          _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (-[AWDMETRICSCellularPowerLog cellularPerClientProfileTriggerCountsCount](v21, "cellularPerClientProfileTriggerCountsCount") >= 2)[MEMORY[0x1E4F929C0] debugEnabled]; {
    v29 = [(AWDMETRICSCellularPowerLog *)v21 cellularPerClientProfileTriggerCountAtIndex:0];
    }
    if ([v29 hasTimestamp])
    {
      v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v29, "timestamp"));
    }
    else
    {
      v30 = &unk_1F29E1810;
    }
    if ([v29 hasTriggerCount])
    {
      v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v29, "triggerCount"));
    }
    else
    {
      v31 = &unk_1F29E1810;
    }
    [*(id *)(a1 + 48) initializeMetricsDictWithTS:v30 triggerCnt:v31 triggerId:*(void *)(a1 + 56)];
    [*(id *)(a1 + 48) initializeDataStoreBBTS:v30 triggerCnt:v31 triggerId:*(void *)(a1 + 56)];
  }
  else
  {
    v14 = [v4 objectForKeyedSubscript:@"arr"];
    if (v14)
    {
      v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v39 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v44 = v39;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "BB Agent: queuePeriodicMetricId in default : %@", buf, 0xCu);
      }

      v16 = [*(id *)(*(void *)(a1 + 48) + 56) decodePayload:*(void *)(a1 + 32) forMetricId:*(void *)(a1 + 40)];
      uint64_t v17 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_43;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v17;
      if (qword_1EBD5B5D0 != -1) {
        dispatch_once(&qword_1EBD5B5D0, block);
      }
      if (byte_1EBD5B5B1)
      {
        v18 = +[PLMAVBBMetricUtility convertToStringData:*(void *)(a1 + 32)];
        [v16 setObject:v18 forKey:@"payload"];
      }
      if (v16) {
        [v14 addObject:v16];
      }
      v19 = *(void **)(*(void *)(a1 + 48) + 56);
      if (v19) {
        [v19 addToListMetric:*(void *)(a1 + 40) payload:*(void *)(a1 + 32)];
      }
    }
    else
    {
      v32 = [NSString stringWithFormat:@"bad arr"];
      v33 = (void *)MEMORY[0x1E4F929B8];
      v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m"];
      v35 = [v34 lastPathComponent];
      v36 = [NSString stringWithUTF8String:"-[PLMAVBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke"];
      [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:141];

      v37 = PLLogCommon();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v32;
        _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      if ([MEMORY[0x1E4F929C0] debugEnabled]) {
        __assert_rtn("-[PLMAVBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke", "PLMAVBBMetric.m", 142, "0");
      }
    }
  }
}

- (void)modelProdMetricsNotify
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(NSMutableDictionary *)self->_prodMetrics objectForKey:@"arr"];
  uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v25;
    int v5 = -1;
    int v6 = -1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v24 + 1) + 8 * i);
        v9 = [v8 objectForKeyedSubscript:@"duration"];

        if (v9)
        {
          v10 = [v8 objectForKeyedSubscript:@"duration"];
          int v11 = [v10 intValue];

          if (v11 < v6 || v6 == -1) {
            int v6 = v11;
          }
          if (v11 > v5 || v5 == -1) {
            int v5 = v11;
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v3);
  }
  else
  {
    int v5 = -1;
    int v6 = -1;
  }

  int v14 = v6 + v5;
  if (v6 + v5 < 0 != __OFADD__(v6, v5)) {
    ++v14;
  }
  v15 = [NSNumber numberWithInt:(v14 >> 1)];
  [(NSMutableDictionary *)self->_prodMetrics setObject:v15 forKeyedSubscript:@"duration"];

  if ([(NSString *)self->_notifyTitle isEqualToString:@"MAV_METRIC_PROD"])
  {
    [MEMORY[0x1E4F92A88] postNotificationName:self->_notifyTitle object:self userInfo:self->_prodMetrics];
  }
  else
  {
    v16 = [NSString stringWithFormat:@"bad metrics channel: !PROD"];
    uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
    v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m"];
    v19 = [v18 lastPathComponent];
    v20 = [NSString stringWithUTF8String:"-[PLMAVBBMetric modelProdMetricsNotify]"];
    [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:268];

    v21 = PLLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    if ([MEMORY[0x1E4F929C0] debugEnabled]) {
      __assert_rtn("-[PLMAVBBMetric modelProdMetricsNotify]", "PLMAVBBMetric.m", 269, "0");
    }
  }
}

- (void)initializeMetricsDictWithTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = (NSMutableDictionary *)objc_opt_new();
  prodMetrics = self->_prodMetrics;
  self->_prodMetrics = v11;

  id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v10, "integerValue"));
  v13 = [v15 convertFromBasebandToMonotonic];
  [(NSMutableDictionary *)self->_prodMetrics setObject:v13 forKeyedSubscript:@"timestamp"];

  [(NSMutableDictionary *)self->_prodMetrics setObject:v10 forKeyedSubscript:@"bbtimestamp"];
  [(NSMutableDictionary *)self->_prodMetrics setObject:&unk_1F29E1810 forKeyedSubscript:@"duration"];
  [(NSMutableDictionary *)self->_prodMetrics setObject:v9 forKeyedSubscript:@"seqnum"];

  [(NSMutableDictionary *)self->_prodMetrics setObject:v8 forKeyedSubscript:@"triggerId"];
  int v14 = objc_opt_new();
  [(NSMutableDictionary *)self->_prodMetrics setObject:v14 forKeyedSubscript:@"arr"];
}

- (void)initializeDataStoreBBTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [[PLMAVBBHardwareMessage alloc] initEntryWithBBTS:v10 triggerId:v8 seqnum:v9 payload:0 logAgent:self->_logAgent];

  storeMetricsLogger = self->_storeMetricsLogger;
  self->_storeMetricsLogger = v11;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLMAVBBMetric_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EBD5B5B8 != -1) {
    dispatch_once(&qword_1EBD5B5B8, block);
  }
  uint64_t v2 = (void *)qword_1EBD5B5C0;
  return v2;
}

- (void)queueAperiodicMetricId:(id)a3 payload:(id)a4 profileId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  logAgent = self->_logAgent;
  if (logAgent
    && ([(PLAgent *)logAgent workQueue],
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    v13 = [(PLAgent *)self->_logAgent workQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__PLMAVBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke;
    v14[3] = &unk_1E692A6A0;
    id v15 = v9;
    v16 = self;
    id v17 = v8;
    id v18 = v10;
    dispatch_async(v13, v14);
  }
  else
  {
    [MEMORY[0x1E4F929C0] debugEnabled];
  }
}

- (void)queuePeriodicMetricId:(id)a3 payload:(id)a4 forTrigger:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = PLLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "BB Agent: queuePeriodicMetricId : %@", buf, 0xCu);
  }

  logAgent = self->_logAgent;
  if (logAgent
    && ([(PLAgent *)logAgent workQueue],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    int v14 = [(PLAgent *)self->_logAgent workQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke;
    v15[3] = &unk_1E692A6A0;
    id v16 = v9;
    id v17 = v8;
    id v18 = self;
    id v19 = v10;
    dispatch_async(v14, v15);
  }
  else
  {
    [MEMORY[0x1E4F929C0] debugEnabled];
  }
}

void __58__PLMAVBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[AWDMETRICSCellularPowerLog alloc] initWithData:*(void *)(a1 + 32)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(AWDMETRICSCellularPowerLog *)v2 dictionaryRepresentation];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v33;
      do
      {
        uint64_t v9 = 0;
        id v10 = v7;
        do
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v4);
          }
          int v11 = [v4 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * v9)];
          uint64_t v7 = [v11 objectAtIndex:0];

          ++v9;
          id v10 = v7;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __58__PLMAVBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke_2;
      v30 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v31 = v12;
      if (qword_1EBD5B5D8 != -1) {
        dispatch_once(&qword_1EBD5B5D8, &block);
      }
      if (byte_1EBD5B5B2)
      {
        v13 = [NSString stringWithFormat:@"aperiodic MAV metric: %@", v7, block, v28, v29, v30, v31];
        int v14 = (void *)MEMORY[0x1E4F929B8];
        id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m"];
        id v16 = [v15 lastPathComponent];
        id v17 = [NSString stringWithUTF8String:"-[PLMAVBBMetric queueAperiodicMetricId:payload:profileId:]_block_invoke"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:222];

        id v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v13;
          _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (v7)
    {
      if ([*(id *)(a1 + 48) intValue] == 786435)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 56));
        uint64_t v19 = [v7 objectForKeyedSubscript:@"trigger_count"];
        uint64_t v20 = *(void *)(a1 + 40);
        id v21 = *(void **)(v20 + 24);
        *(void *)(v20 + 24) = v19;

        uint64_t v22 = *(void *)(a1 + 40);
        id v23 = *(id *)(a1 + 32);
        id v24 = *(id *)(v22 + 40);
        *(void *)(v22 + 40) = v23;
      }
      else
      {
        long long v25 = [PLMAVBBHardwareMessage alloc];
        long long v26 = [v7 objectForKeyedSubscript:@"timestamp"];
        id v24 = [(PLMAVBBHardwareMessage *)v25 initEntryWithBBTS:v26 triggerId:*(void *)(a1 + 48) seqnum:*(void *)(*(void *)(a1 + 40) + 24) payload:*(void *)(a1 + 32) logAgent:*(void *)(*(void *)(a1 + 40) + 8)];

        [v24 logBBMavAperiodicMetrics];
      }
    }
  }
  else
  {
    [MEMORY[0x1E4F929C0] debugEnabled];
  }
}

uint64_t __31__PLMAVBBMetric_sharedInstance__block_invoke(uint64_t a1)
{
  qword_1EBD5B5C0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (BOOL)registerForNotifClient:(id)a3 andProfile:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a4, "integerValue", a3);
  if (v5 == 1)
  {
    notifyTitle = self->_notifyTitle;
    self->_notifyTitle = (NSString *)@"MAV_METRIC_PROD";
  }
  else
  {
    uint64_t v7 = [NSString stringWithFormat:@"*** error *** unsupported profile"];
    uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m"];
    id v10 = [v9 lastPathComponent];
    int v11 = [NSString stringWithUTF8String:"-[PLMAVBBMetric registerForNotifClient:andProfile:]"];
    [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:62];

    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v14, 0xCu);
    }
  }
  return v5 == 1;
}

uint64_t __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_24(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_77 = result;
  return result;
}

uint64_t __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_43(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B5B1 = result;
  return result;
}

- (void)flushPeriodicMetrics
{
  logAgent = self->_logAgent;
  if (!logAgent)
  {
    uint64_t v6 = PLLogCommon();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "BBAgent not ready";
LABEL_10:
    _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
    goto LABEL_7;
  }
  uint64_t v4 = [(PLAgent *)logAgent workQueue];

  if (v4)
  {
    uint64_t v5 = [(PLAgent *)self->_logAgent workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLMAVBBMetric_flushPeriodicMetrics__block_invoke;
    block[3] = &unk_1E692A250;
    block[4] = self;
    dispatch_async(v5, block);

    return;
  }
  uint64_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    uint64_t v7 = "Work-queue not ready";
    goto LABEL_10;
  }
LABEL_7:
}

uint64_t __37__PLMAVBBMetric_flushPeriodicMetrics__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 48) && *(void *)(v1 + 56))
  {
    uint64_t v2 = result;
    uint64_t v3 = PLLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "BB Agent: flushPeriodicMetrics", v4, 2u);
    }

    return [*(id *)(*(void *)(v2 + 32) + 56) logBBMavPeriodicMetrics];
  }
  return result;
}

uint64_t __58__PLMAVBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B5B2 = result;
  return result;
}

- (PLAgent)logAgent
{
  return (PLAgent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogAgent:(id)a3
{
}

- (NSString)notifyTitle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNotifyTitle:(id)a3
{
}

- (NSNumber)aPeriodicTriggerCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAPeriodicTriggerCnt:(id)a3
{
}

- (NSNumber)aPeriodicProfileId
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAPeriodicProfileId:(id)a3
{
}

- (NSData)aPeriodicTriggerPayload
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAPeriodicTriggerPayload:(id)a3
{
}

- (NSMutableDictionary)prodMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProdMetrics:(id)a3
{
}

- (PLMAVBBHardwareMessage)storeMetricsLogger
{
  return (PLMAVBBHardwareMessage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStoreMetricsLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMetricsLogger, 0);
  objc_storeStrong((id *)&self->_prodMetrics, 0);
  objc_storeStrong((id *)&self->_aPeriodicTriggerPayload, 0);
  objc_storeStrong((id *)&self->_aPeriodicProfileId, 0);
  objc_storeStrong((id *)&self->_aPeriodicTriggerCnt, 0);
  objc_storeStrong((id *)&self->_notifyTitle, 0);
  objc_storeStrong((id *)&self->_logAgent, 0);
}

@end