@interface PLICEBBMetric
+ (id)sharedInstance;
- (BOOL)registerForNotifClient:(id)a3 andProfile:(id)a4;
- (NSData)aPeriodicTriggerPayload;
- (NSDictionary)plistSimMetrics;
- (NSMutableDictionary)egprsSimMetrics;
- (NSMutableDictionary)lteSimMetrics;
- (NSMutableDictionary)prodMetrics;
- (NSMutableDictionary)sendSimMetrics;
- (NSMutableDictionary)tdsSimMetrics;
- (NSMutableDictionary)umtsSimMetrics;
- (NSNumber)aPeriodicProfileId;
- (NSNumber)aPeriodicTriggerCnt;
- (NSNumber)error;
- (NSString)notifyTitle;
- (OS_dispatch_queue)queue;
- (PLAgent)logAgent;
- (PLICEBBHardwareMessage)storeMetricsLogger;
- (PLTimer)tickTock;
- (void)deregisterForNotifications:(id)a3;
- (void)initializeDataStoreBBTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5;
- (void)initializeMetricsDictWithTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5;
- (void)initializeMetricsSim;
- (void)modelProdMetricsNotify;
- (void)modelSimMetricsNotify:(id)a3;
- (void)queueAperiodicMetricId:(id)a3 payload:(id)a4 profileId:(id)a5;
- (void)queuePeriodicMetricId:(id)a3 payload:(id)a4 forTrigger:(id)a5;
- (void)setAPeriodicProfileId:(id)a3;
- (void)setAPeriodicTriggerCnt:(id)a3;
- (void)setAPeriodicTriggerPayload:(id)a3;
- (void)setEgprsSimMetrics:(id)a3;
- (void)setError:(id)a3;
- (void)setLogAgent:(id)a3;
- (void)setLteSimMetrics:(id)a3;
- (void)setNotifyTitle:(id)a3;
- (void)setPlistSimMetrics:(id)a3;
- (void)setProdMetrics:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSendSimMetrics:(id)a3;
- (void)setStoreMetricsLogger:(id)a3;
- (void)setTdsSimMetrics:(id)a3;
- (void)setTickTock:(id)a3;
- (void)setUmtsSimMetrics:(id)a3;
@end

@implementation PLICEBBMetric

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLICEBBMetric_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EBD5BE78 != -1) {
    dispatch_once(&qword_1EBD5BE78, block);
  }
  v2 = (void *)qword_1EBD5BE80;
  return v2;
}

void *__31__PLICEBBMetric_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EBD5BE80;
  qword_1EBD5BE80 = (uint64_t)v1;

  result = (void *)qword_1EBD5BE80;
  if (qword_1EBD5BE80)
  {
    return (void *)[result initializeMetricsSim];
  }
  return result;
}

- (void)initializeMetricsSim
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

  v5 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.powerlog.cebb", v4, 0);
  queue = self->_queue;
  self->_queue = v5;

  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 pathForResource:@"MetricsSim" ofType:@"plist"];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v8];
    plistSimMetrics = self->_plistSimMetrics;
    self->_plistSimMetrics = v9;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"*** error *** plist not found, cannot proceed"];
    v12 = (void *)MEMORY[0x1E4F929B8];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m"];
    v14 = [v13 lastPathComponent];
    v15 = [NSString stringWithUTF8String:"-[PLICEBBMetric initializeMetricsSim]"];
    [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:64];

    v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138412290;
      v20 = v11;
      _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v19, 0xCu);
    }

    error = self->_error;
    self->_error = (NSNumber *)&unk_1F29E60E8;

    v18 = (NSDictionary *)objc_opt_new();
    [(NSDictionary *)v18 setValue:@"1.0" forKey:@"version"];
    [(NSDictionary *)v18 setValue:self->_error forKey:@"error"];
    plistSimMetrics = self->_plistSimMetrics;
    self->_plistSimMetrics = v18;
  }
}

- (BOOL)registerForNotifClient:(id)a3 andProfile:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[(NSDictionary *)self->_plistSimMetrics mutableCopy];
  switch([v7 integerValue])
  {
    case 1:
      objc_storeStrong((id *)&self->_lteSimMetrics, v8);
      lteSimMetrics = self->_lteSimMetrics;
      v10 = [(NSMutableDictionary *)lteSimMetrics objectForKey:@"arrlte"];
      [(NSMutableDictionary *)lteSimMetrics setObject:v10 forKey:@"arr"];

      objc_storeStrong((id *)&self->_sendSimMetrics, self->_lteSimMetrics);
      notifyTitle = self->_notifyTitle;
      v12 = @"METRIC_SIM_LTE_TEST";
      goto LABEL_9;
    case 2:
      objc_storeStrong((id *)&self->_umtsSimMetrics, v8);
      umtsSimMetrics = self->_umtsSimMetrics;
      v24 = [(NSMutableDictionary *)umtsSimMetrics objectForKey:@"arrumts"];
      [(NSMutableDictionary *)umtsSimMetrics setObject:v24 forKey:@"arr"];

      objc_storeStrong((id *)&self->_sendSimMetrics, self->_umtsSimMetrics);
      notifyTitle = self->_notifyTitle;
      v12 = @"METRIC_SIM_UMTS_TEST";
      goto LABEL_9;
    case 3:
      objc_storeStrong((id *)&self->_tdsSimMetrics, v8);
      tdsSimMetrics = self->_tdsSimMetrics;
      v14 = [(NSMutableDictionary *)tdsSimMetrics objectForKey:@"arrtds"];
      [(NSMutableDictionary *)tdsSimMetrics setObject:v14 forKey:@"arr"];

      objc_storeStrong((id *)&self->_sendSimMetrics, self->_tdsSimMetrics);
      notifyTitle = self->_notifyTitle;
      v12 = @"METRIC_SIM_TDS_TEST";
      goto LABEL_9;
    case 4:
      objc_storeStrong((id *)&self->_egprsSimMetrics, v8);
      egprsSimMetrics = self->_egprsSimMetrics;
      v26 = [(NSMutableDictionary *)egprsSimMetrics objectForKey:@"arregprs"];
      [(NSMutableDictionary *)egprsSimMetrics setObject:v26 forKey:@"arr"];

      objc_storeStrong((id *)&self->_sendSimMetrics, self->_egprsSimMetrics);
      notifyTitle = self->_notifyTitle;
      v12 = @"METRIC_SIM_EGPRS_TEST";
LABEL_9:
      self->_notifyTitle = &v12->isa;

      [(NSMutableDictionary *)self->_sendSimMetrics removeObjectForKey:@"arrlte"];
      [(NSMutableDictionary *)self->_sendSimMetrics removeObjectForKey:@"arrumts"];
      [(NSMutableDictionary *)self->_sendSimMetrics removeObjectForKey:@"arrtds"];
      [(NSMutableDictionary *)self->_sendSimMetrics removeObjectForKey:@"arregprs"];
      objc_initWeak(location, self);
      id v27 = objc_alloc(MEMORY[0x1E4F92A80]);
      v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0];
      queue = self->_queue;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __51__PLICEBBMetric_registerForNotifClient_andProfile___block_invoke;
      v35[3] = &unk_1E692AC18;
      objc_copyWeak(&v36, location);
      uint64_t v30 = [v27 initWithFireDate:v28 withInterval:1 withTolerance:0 repeats:queue withUserInfo:v35 withQueue:30.0 withBlock:0.0];
      tickTock = self->_tickTock;
      p_tickTock = (id *)&self->_tickTock;
      id *p_tickTock = (id)v30;

      [*p_tickTock arm];
      objc_destroyWeak(&v36);
      objc_destroyWeak(location);
      goto LABEL_11;
    case 7:
      v33 = self->_notifyTitle;
      self->_notifyTitle = (NSString *)@"METRIC_PROD";

LABEL_11:
      BOOL v22 = 1;
      break;
    default:
      v15 = objc_opt_new();
      [v15 setValue:@"1.0" forKey:@"version"];
      [v15 setValue:&unk_1F29E6100 forKey:@"error"];
      v16 = [NSString stringWithFormat:@"*** error *** unsupported profile"];
      v17 = (void *)MEMORY[0x1E4F929B8];
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m"];
      int v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLICEBBMetric registerForNotifClient:andProfile:]"];
      [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:134];

      uint64_t v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v16;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
      }

      BOOL v22 = 0;
      break;
  }

  return v22;
}

void __51__PLICEBBMetric_registerForNotifClient_andProfile___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained modelProdMetricsNotify];
}

- (void)deregisterForNotifications:(id)a3
{
}

- (void)queuePeriodicMetricId:(id)a3 payload:(id)a4 forTrigger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  logAgent = self->_logAgent;
  if (!logAgent)
  {
    v14 = PLLogCommon();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      [MEMORY[0x1E4F929C0] debugEnabled];
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v15 = "PLBBAgent not ready";
LABEL_10:
    _os_log_error_impl(&dword_1D2690000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_7;
  }
  v12 = [(PLAgent *)logAgent workQueue];

  if (!v12)
  {
    v14 = PLLogCommon();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v15 = "PLBBAgent workQueue not ready";
    goto LABEL_10;
  }
  v13 = [(PLAgent *)self->_logAgent workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__PLICEBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke;
  v16[3] = &unk_1E692A6A0;
  id v17 = v8;
  v18 = self;
  id v19 = v10;
  id v20 = v9;
  dispatch_async(v13, v16);

LABEL_8:
}

void __58__PLICEBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) integerValue];
  v3 = *(void **)(*(void *)(a1 + 40) + 112);
  if (v2 == 3932163)
  {
    if (v3)
    {
      if ([*(id *)(a1 + 48) integerValue])
      {
        v4 = [*(id *)(*(void *)(a1 + 40) + 112) objectForKeyedSubscript:@"triggerId"];
        uint64_t v5 = [v4 integerValue];
        uint64_t v6 = [*(id *)(a1 + 48) integerValue];

        if (v5 == v6)
        {
          id v7 = [NSString stringWithFormat:@"bad tid. will failed assertion if debugEnabled"];
          id v8 = (void *)MEMORY[0x1E4F929B8];
          id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m"];
          id v10 = [v9 lastPathComponent];
          v11 = [NSString stringWithUTF8String:"-[PLICEBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke"];
          [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:235];

          v12 = PLLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v7;
            _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          [MEMORY[0x1E4F929C0] debugEnabled];
          return;
        }
      }
      if (([MEMORY[0x1E4F92A38] isBasebandClass:1003009] & 1) == 0) {
        [*(id *)(a1 + 40) modelProdMetricsNotify];
      }
      v18 = *(void **)(*(void *)(a1 + 40) + 120);
      if (v18) {
        [v18 logBBIcePeriodicMetrics];
      }
      id v19 = [[PowerlogMetricLog alloc] initWithData:*(void *)(a1 + 56)];
      if (-[PowerlogMetricLog kCellularPerClientProfileTriggerCountsCount](v19, "kCellularPerClientProfileTriggerCountsCount") >= 2)[MEMORY[0x1E4F929C0] debugEnabled]; {
      id v20 = [(PowerlogMetricLog *)v19 kCellularPerClientProfileTriggerCountAtIndex:0];
      }
      if ([v20 hasTimestamp])
      {
        uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "timestamp"));
      }
      else
      {
        uint64_t v21 = &unk_1F29E60E8;
      }
      if (objc_msgSend(v20, "hasTriggerCount", v21))
      {
        v29 = NSNumber;
LABEL_40:
        uint64_t v30 = objc_msgSend(v29, "numberWithUnsignedInt:", objc_msgSend(v20, "triggerCount"));
LABEL_42:
        [*(id *)(a1 + 40) initializeMetricsDictWithTS:v31 triggerCnt:v30 triggerId:*(void *)(a1 + 48)];
        [*(id *)(a1 + 40) initializeDataStoreBBTS:v31 triggerCnt:v30 triggerId:*(void *)(a1 + 48)];

        return;
      }
    }
    else
    {
      id v19 = [[PowerlogMetricLog alloc] initWithData:*(void *)(a1 + 56)];
      if (-[PowerlogMetricLog kCellularPerClientProfileTriggerCountsCount](v19, "kCellularPerClientProfileTriggerCountsCount") >= 2)[MEMORY[0x1E4F929C0] debugEnabled]; {
      id v20 = [(PowerlogMetricLog *)v19 kCellularPerClientProfileTriggerCountAtIndex:0];
      }
      if ([v20 hasTimestamp])
      {
        BOOL v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "timestamp"));
      }
      else
      {
        BOOL v22 = &unk_1F29E60E8;
      }
      if (objc_msgSend(v20, "hasTriggerCount", v22))
      {
        v29 = NSNumber;
        goto LABEL_40;
      }
    }
    uint64_t v30 = &unk_1F29E60E8;
    goto LABEL_42;
  }
  v13 = [v3 objectForKeyedSubscript:@"arr"];
  if (v13)
  {
    v14 = [*(id *)(*(void *)(a1 + 40) + 120) decodePayload:*(void *)(a1 + 56) forMetricId:*(void *)(a1 + 32)];
    uint64_t v15 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLICEBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v15;
    if (qword_1EBD5BE88 != -1) {
      dispatch_once(&qword_1EBD5BE88, block);
    }
    if (_MergedGlobals_93)
    {
      v16 = +[PLICEBBMetricUtility convertToStringData:*(void *)(a1 + 56)];
      [v14 setObject:v16 forKey:@"payload"];
    }
    if (v14) {
      [v13 addObject:v14];
    }
    id v17 = *(void **)(*(void *)(a1 + 40) + 120);
    if (v17) {
      [v17 addToListMetric:*(void *)(a1 + 32) payload:*(void *)(a1 + 56)];
    }
  }
  else
  {
    v23 = [NSString stringWithFormat:@"bad arr"];
    v24 = (void *)MEMORY[0x1E4F929B8];
    v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m"];
    v26 = [v25 lastPathComponent];
    id v27 = [NSString stringWithUTF8String:"-[PLICEBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke"];
    [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:282];

    v28 = PLLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v23;
      _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    if ([MEMORY[0x1E4F929C0] debugEnabled]) {
      __assert_rtn("-[PLICEBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke", "PLICEBBMetric.m", 283, "0");
    }
  }
}

uint64_t __58__PLICEBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_93 = result;
  return result;
}

- (void)queueAperiodicMetricId:(id)a3 payload:(id)a4 profileId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  logAgent = self->_logAgent;
  if (!logAgent)
  {
    v14 = PLLogCommon();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      [MEMORY[0x1E4F929C0] debugEnabled];
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = "PLBBAgent not ready";
LABEL_10:
    _os_log_error_impl(&dword_1D2690000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_7;
  }
  v12 = [(PLAgent *)logAgent workQueue];

  if (!v12)
  {
    v14 = PLLogCommon();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = "PLBBAgent workQueue not ready";
    goto LABEL_10;
  }
  v13 = [(PLAgent *)self->_logAgent workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__PLICEBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke;
  v16[3] = &unk_1E692A6A0;
  id v17 = v9;
  v18 = self;
  id v19 = v8;
  id v20 = v10;
  dispatch_async(v13, v16);

LABEL_8:
}

void __58__PLICEBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[PowerlogMetricLog alloc] initWithData:*(void *)(a1 + 32)];
  v3 = v2;
  if (v2)
  {
    v4 = [(PowerlogMetricLog *)v2 dictionaryRepresentation];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v35;
      do
      {
        uint64_t v9 = 0;
        id v10 = v7;
        do
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v4);
          }
          v11 = [v4 objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * v9)];
          id v7 = [v11 objectAtIndex:0];

          ++v9;
          id v10 = v7;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }
    v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v7;
      _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "aperiodic ICE metric: %@", buf, 0xCu);
    }

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      id v31 = __58__PLICEBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke_92;
      v32 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v33 = v14;
      if (qword_1EBD5BE90 != -1) {
        dispatch_once(&qword_1EBD5BE90, &block);
      }
      if (byte_1EBD5BE71)
      {
        uint64_t v15 = [NSString stringWithFormat:@"aperiodic ICE metric: %@", v7, block, v30, v31, v32, v33];
        v16 = (void *)MEMORY[0x1E4F929B8];
        id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m"];
        v18 = [v17 lastPathComponent];
        id v19 = [NSString stringWithUTF8String:"-[PLICEBBMetric queueAperiodicMetricId:payload:profileId:]_block_invoke_2"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:348];

        id v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v15;
          _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (v7)
    {
      if ([*(id *)(a1 + 48) intValue] == 3932163)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 96), *(id *)(a1 + 56));
        uint64_t v21 = [v7 objectForKeyedSubscript:@"trigger_count"];
        uint64_t v22 = *(void *)(a1 + 40);
        v23 = *(void **)(v22 + 88);
        *(void *)(v22 + 88) = v21;

        uint64_t v24 = *(void *)(a1 + 40);
        id v25 = *(id *)(a1 + 32);
        id v26 = *(id *)(v24 + 104);
        *(void *)(v24 + 104) = v25;
      }
      else
      {
        id v27 = [PLICEBBHardwareMessage alloc];
        v28 = [v7 objectForKeyedSubscript:@"timestamp"];
        id v26 = [(PLICEBBHardwareMessage *)v27 initEntryWithBBTS:v28 triggerId:*(void *)(a1 + 48) seqnum:*(void *)(*(void *)(a1 + 40) + 88) payload:*(void *)(a1 + 32) logAgent:*(void *)(*(void *)(a1 + 40) + 8)];

        [v26 logBBIceAperiodicMetrics];
      }
    }
  }
  else
  {
    v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2690000, v12, OS_LOG_TYPE_ERROR, "unable to init powerlogmetriclog class", buf, 2u);
    }

    [MEMORY[0x1E4F929C0] debugEnabled];
  }
}

uint64_t __58__PLICEBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke_92(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE71 = result;
  return result;
}

- (void)modelSimMetricsNotify:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSString *)self->_notifyTitle isEqualToString:@"METRIC_PROD"])
  {
    uint64_t v5 = [NSString stringWithFormat:@"bad metrics channel, !TEST"];
    uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = [NSString stringWithUTF8String:"-[PLICEBBMetric modelSimMetricsNotify:]"];
    [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:388];

    id v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      uint64_t v15 = v5;
      _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v14, 0xCu);
    }

    if ([MEMORY[0x1E4F929C0] debugEnabled]) {
      __assert_rtn("-[PLICEBBMetric modelSimMetricsNotify:]", "PLICEBBMetric.m", 389, "0");
    }
  }
  v11 = (void *)MEMORY[0x1E4F92A88];
  notifyTitle = self->_notifyTitle;
  v13 = (void *)[(NSMutableDictionary *)self->_sendSimMetrics copy];
  [v11 postNotificationName:notifyTitle object:self userInfo:v13];
}

- (void)modelProdMetricsNotify
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(NSMutableDictionary *)self->_prodMetrics objectForKey:@"arr"];
  uint64_t v2 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (!v2)
  {
    int v6 = -1;
    int v7 = -1;
    goto LABEL_23;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v29;
  uint64_t v5 = @"duration";
  int v6 = -1;
  int v7 = -1;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v9 = v5;
      if (*(void *)v29 != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(*((void *)&v28 + 1) + 8 * i);
      v11 = [v10 objectForKeyedSubscript:@"metricId"];
      int v12 = [v11 intValue];

      if (v12 != 3985670)
      {
        uint64_t v5 = v9;
        v13 = [v10 objectForKeyedSubscript:v9];

        if (!v13) {
          goto LABEL_19;
        }
        int v14 = [v10 objectForKeyedSubscript:v9];
        int v15 = [v14 intValue];

        if (v15 < v7 || v7 == -1) {
          int v7 = v15;
        }
        if (v15 > v6 || v6 == -1) {
          int v6 = v15;
        }
      }
      uint64_t v5 = v9;
LABEL_19:
    }
    uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  }
  while (v3);
LABEL_23:

  int v18 = v7 + v6;
  if (v7 + v6 < 0 != __OFADD__(v7, v6)) {
    ++v18;
  }
  id v19 = [NSNumber numberWithInt:(v18 >> 1)];
  [(NSMutableDictionary *)self->_prodMetrics setObject:v19 forKeyedSubscript:@"duration"];

  if ([(NSString *)self->_notifyTitle isEqualToString:@"METRIC_PROD"])
  {
    [MEMORY[0x1E4F92A88] postNotificationName:self->_notifyTitle object:self userInfo:self->_prodMetrics];
  }
  else
  {
    id v20 = [NSString stringWithFormat:@"bad metrics channel: !PROD"];
    uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m"];
    v23 = [v22 lastPathComponent];
    uint64_t v24 = [NSString stringWithUTF8String:"-[PLICEBBMetric modelProdMetricsNotify]"];
    [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:419];

    id v25 = PLLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v20;
      _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    if ([MEMORY[0x1E4F929C0] debugEnabled]) {
      __assert_rtn("-[PLICEBBMetric modelProdMetricsNotify]", "PLICEBBMetric.m", 420, "0");
    }
  }
}

- (void)initializeMetricsDictWithTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (NSMutableDictionary *)objc_opt_new();
  prodMetrics = self->_prodMetrics;
  self->_prodMetrics = v11;

  id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v10, "integerValue"));
  v13 = [v15 convertFromBasebandToMonotonic];
  [(NSMutableDictionary *)self->_prodMetrics setObject:v13 forKeyedSubscript:@"timestamp"];

  [(NSMutableDictionary *)self->_prodMetrics setObject:v10 forKeyedSubscript:@"bbtimestamp"];
  [(NSMutableDictionary *)self->_prodMetrics setObject:&unk_1F29E60E8 forKeyedSubscript:@"duration"];
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
  v11 = [[PLICEBBHardwareMessage alloc] initEntryWithBBTS:v10 triggerId:v8 seqnum:v9 payload:0 logAgent:self->_logAgent];

  storeMetricsLogger = self->_storeMetricsLogger;
  self->_storeMetricsLogger = v11;
}

- (PLAgent)logAgent
{
  return (PLAgent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogAgent:(id)a3
{
}

- (NSDictionary)plistSimMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPlistSimMetrics:(id)a3
{
}

- (NSMutableDictionary)sendSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSendSimMetrics:(id)a3
{
}

- (NSMutableDictionary)lteSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLteSimMetrics:(id)a3
{
}

- (NSMutableDictionary)umtsSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUmtsSimMetrics:(id)a3
{
}

- (NSMutableDictionary)egprsSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEgprsSimMetrics:(id)a3
{
}

- (NSMutableDictionary)tdsSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTdsSimMetrics:(id)a3
{
}

- (NSNumber)error
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (PLTimer)tickTock
{
  return (PLTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTickTock:(id)a3
{
}

- (NSString)notifyTitle
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNotifyTitle:(id)a3
{
}

- (NSNumber)aPeriodicTriggerCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAPeriodicTriggerCnt:(id)a3
{
}

- (NSNumber)aPeriodicProfileId
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAPeriodicProfileId:(id)a3
{
}

- (NSData)aPeriodicTriggerPayload
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAPeriodicTriggerPayload:(id)a3
{
}

- (NSMutableDictionary)prodMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setProdMetrics:(id)a3
{
}

- (PLICEBBHardwareMessage)storeMetricsLogger
{
  return (PLICEBBHardwareMessage *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStoreMetricsLogger:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_storeMetricsLogger, 0);
  objc_storeStrong((id *)&self->_prodMetrics, 0);
  objc_storeStrong((id *)&self->_aPeriodicTriggerPayload, 0);
  objc_storeStrong((id *)&self->_aPeriodicProfileId, 0);
  objc_storeStrong((id *)&self->_aPeriodicTriggerCnt, 0);
  objc_storeStrong((id *)&self->_notifyTitle, 0);
  objc_storeStrong((id *)&self->_tickTock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_tdsSimMetrics, 0);
  objc_storeStrong((id *)&self->_egprsSimMetrics, 0);
  objc_storeStrong((id *)&self->_umtsSimMetrics, 0);
  objc_storeStrong((id *)&self->_lteSimMetrics, 0);
  objc_storeStrong((id *)&self->_sendSimMetrics, 0);
  objc_storeStrong((id *)&self->_plistSimMetrics, 0);
  objc_storeStrong((id *)&self->_logAgent, 0);
}

@end