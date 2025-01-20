@interface PLAWDMetricsService
+ (id)entryAggregateDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (AWDServerConnection)awdServerConn;
- (BOOL)connectToAWDServer;
- (BOOL)initAWDInterface;
- (NSMutableDictionary)classDictionary;
- (NSMutableSet)currRunningMetrics;
- (NSMutableSet)updateRunningMetrics;
- (PLAWDMetricsService)init;
- (void)auxClassWrapper:(id)a3 withAction:(int64_t)a4;
- (void)initOperatorDependancies;
- (void)setAwdServerConn:(id)a3;
- (void)setClassDictionary:(id)a3;
- (void)setCurrRunningMetrics:(id)a3;
- (void)setUpdateRunningMetrics:(id)a3;
- (void)threadFunc;
@end

@implementation PLAWDMetricsService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAWDMetricsService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)connectToAWDServer
{
  v3 = [(PLAWDMetricsService *)self awdServerConn];

  if (v3) {
    return 1;
  }
  BOOL v4 = 1;
  v5 = (void *)[objc_alloc(MEMORY[0x263F864B0]) initWithComponentId:31 andBlockOnConfiguration:1];
  [(PLAWDMetricsService *)self setAwdServerConn:v5];

  v6 = [(PLAWDMetricsService *)self awdServerConn];

  if (!v6)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __41__PLAWDMetricsService_connectToAWDServer__block_invoke;
      v18 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v19 = v7;
      if (connectToAWDServer_defaultOnce != -1) {
        dispatch_once(&connectToAWDServer_defaultOnce, &block);
      }
      if (connectToAWDServer_classDebugEnabled)
      {
        v8 = [NSString stringWithFormat:@"%@ : Connection to awd server failed!", @"*******PLAWDMetricsService*******", block, v16, v17, v18, v19];
        v9 = (void *)MEMORY[0x263F5F638];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLAWDMetricsService connectToAWDServer]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:49];

        v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    return 0;
  }
  return v4;
}

uint64_t __41__PLAWDMetricsService_connectToAWDServer__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  connectToAWDServer_classDebugEnabled = result;
  return result;
}

+ (id)entryAggregateDefinitions
{
  objc_super v2 = objc_opt_new();
  v3 = +[PLAWDAudio entryAggregateDefinitions];
  [v2 addEntriesFromDictionary:v3];

  BOOL v4 = +[PLAWDNetworkUsage entryAggregateDefinitions];
  [v2 addEntriesFromDictionary:v4];

  v5 = +[PLAWDCpuAP entryAggregateDefinitions];
  [v2 addEntriesFromDictionary:v5];

  v6 = +[PLAWDWifiBT entryAggregateDefinitions];
  [v2 addEntriesFromDictionary:v6];

  uint64_t v7 = +[PLAWDDisplay entryAggregateDefinitions];
  [v2 addEntriesFromDictionary:v7];

  v8 = +[PLAWDBattery entryAggregateDefinitions];
  [v2 addEntriesFromDictionary:v8];

  v9 = +[PLAWDCamera entryAggregateDefinitions];
  [v2 addEntriesFromDictionary:v9];

  v10 = +[PLAWDBB entryAggregateDefinitions];
  [v2 addEntriesFromDictionary:v10];

  return v2;
}

+ (id)entryEventPointDefinitions
{
  objc_super v2 = objc_opt_new();
  v3 = +[PLAWDAuxMetrics entryEventPointDefinitions];
  [v2 addEntriesFromDictionary:v3];

  BOOL v4 = +[PLAWDAuxMetrics entryEventPointDefinitions];
  [v2 addEntriesFromDictionary:v4];

  v5 = +[PLAWDAuxMetrics entryEventPointDefinitions];
  [v2 addEntriesFromDictionary:v5];

  v6 = +[PLAWDAuxMetrics entryEventPointDefinitions];
  [v2 addEntriesFromDictionary:v6];

  uint64_t v7 = +[PLAWDAuxMetrics entryEventPointDefinitions];
  [v2 addEntriesFromDictionary:v7];

  v8 = +[PLAWDAuxMetrics entryEventPointDefinitions];
  [v2 addEntriesFromDictionary:v8];

  v9 = +[PLAWDAuxMetrics entryEventPointDefinitions];
  [v2 addEntriesFromDictionary:v9];

  v10 = +[PLAWDAuxMetrics entryEventPointDefinitions];
  [v2 addEntriesFromDictionary:v10];

  return v2;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

- (PLAWDMetricsService)init
{
  if ([MEMORY[0x263F5F668] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLAWDMetricsService;
    BOOL v4 = [(PLOperator *)&v18 init];
    if (v4)
    {
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v5 = objc_opt_class();
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v14 = 3221225472;
        v15 = __27__PLAWDMetricsService_init__block_invoke;
        uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v17 = v5;
        if (init_defaultOnce_0 != -1) {
          dispatch_once(&init_defaultOnce_0, &block);
        }
        if (init_classDebugEnabled_0)
        {
          v6 = [NSString stringWithFormat:@"%@ : init", @"*******PLAWDMetricsService*******", block, v14, v15, v16, v17];
          uint64_t v7 = (void *)MEMORY[0x263F5F638];
          v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m"];
          v9 = [v8 lastPathComponent];
          v10 = [NSString stringWithUTF8String:"-[PLAWDMetricsService init]"];
          [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:95];

          v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
        }
      }
      [(PLAWDMetricsService *)v4 setAwdServerConn:0];
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

uint64_t __27__PLAWDMetricsService_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_0 = result;
  return result;
}

- (void)initOperatorDependancies
{
  if (self
    && ![(PLAWDMetricsService *)self initAWDInterface]
    && [MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __47__PLAWDMetricsService_initOperatorDependancies__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (initOperatorDependancies_defaultOnce != -1) {
      dispatch_once(&initOperatorDependancies_defaultOnce, &block);
    }
    if (initOperatorDependancies_classDebugEnabled)
    {
      BOOL v4 = [NSString stringWithFormat:@"%@: initAWDInterface Failed!", @"*******PLAWDMetricsService*******", block, v11, v12, v13, v14];
      uint64_t v5 = (void *)MEMORY[0x263F5F638];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m"];
      uint64_t v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLAWDMetricsService initOperatorDependancies]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:109];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  [(PLOperator *)self defaultBoolForKey:@"simulatedMode"];
}

uint64_t __47__PLAWDMetricsService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  initOperatorDependancies_classDebugEnabled = result;
  return result;
}

- (void)auxClassWrapper:(id)a3 withAction:(int64_t)a4
{
  id v10 = a3;
  if (a4 == 2)
  {
    if (![(PLAWDMetricsService *)self connectToAWDServer]) {
      goto LABEL_9;
    }
    v6 = [(PLAWDMetricsService *)self classDictionary];
    uint64_t v7 = [v6 objectForKey:v10];
    v8 = [v7 getSharedObjWithOperator:self];
    v9 = [(PLAWDMetricsService *)self awdServerConn];
    [v8 submitDataToAWDServer:v10 withAwdConn:v9];
  }
  else if (a4 == 1)
  {
    v6 = [(PLAWDMetricsService *)self classDictionary];
    uint64_t v7 = [v6 objectForKey:v10];
    v8 = [v7 getSharedObjWithOperator:self];
    [v8 stopMetricCollection:v10];
  }
  else
  {
    if (a4) {
      goto LABEL_9;
    }
    v6 = [(PLAWDMetricsService *)self classDictionary];
    uint64_t v7 = [v6 objectForKey:v10];
    v8 = [v7 getSharedObjWithOperator:self];
    [v8 startMetricCollection:v10];
  }

LABEL_9:
}

- (void)threadFunc
{
}

- (BOOL)initAWDInterface
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __39__PLAWDMetricsService_initAWDInterface__block_invoke;
  v39[3] = &unk_264B99FF0;
  v39[4] = self;
  uint64_t v3 = (void *)MEMORY[0x230FC4EC0](v39, a2);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [(PLAWDMetricsService *)self setCurrRunningMetrics:v4];

  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(PLAWDMetricsService *)self setClassDictionary:v5];

  v6 = [(PLAWDMetricsService *)self classDictionary];
  [v6 setObject:objc_opt_class() forKey:&unk_26E5467B8];

  uint64_t v7 = [(PLAWDMetricsService *)self classDictionary];
  [v7 setObject:objc_opt_class() forKey:&unk_26E5467D0];

  v8 = [(PLAWDMetricsService *)self classDictionary];
  [v8 setObject:objc_opt_class() forKey:&unk_26E5467E8];

  v9 = [(PLAWDMetricsService *)self classDictionary];
  [v9 setObject:objc_opt_class() forKey:&unk_26E546800];

  id v10 = [(PLAWDMetricsService *)self classDictionary];
  [v10 setObject:objc_opt_class() forKey:&unk_26E546818];

  uint64_t v11 = [(PLAWDMetricsService *)self classDictionary];
  [v11 setObject:objc_opt_class() forKey:&unk_26E546830];

  v12 = [(PLAWDMetricsService *)self classDictionary];
  [v12 setObject:objc_opt_class() forKey:&unk_26E546848];

  v13 = [(PLAWDMetricsService *)self classDictionary];
  [v13 setObject:objc_opt_class() forKey:&unk_26E546860];

  uint64_t v14 = [(PLAWDMetricsService *)self classDictionary];
  [v14 setObject:objc_opt_class() forKey:&unk_26E546878];

  v15 = [(PLAWDMetricsService *)self classDictionary];
  [v15 setObject:objc_opt_class() forKey:&unk_26E546890];

  uint64_t v16 = [(PLAWDMetricsService *)self classDictionary];
  [v16 setObject:objc_opt_class() forKey:&unk_26E5468A8];

  uint64_t v17 = [(PLAWDMetricsService *)self classDictionary];
  [v17 setObject:objc_opt_class() forKey:&unk_26E5468C0];

  objc_super v18 = [(PLAWDMetricsService *)self classDictionary];
  [v18 setObject:objc_opt_class() forKey:&unk_26E5468D8];

  uint64_t v19 = [(PLAWDMetricsService *)self classDictionary];
  [v19 setObject:objc_opt_class() forKey:&unk_26E5468F0];

  v20 = [(PLAWDMetricsService *)self classDictionary];
  [v20 setObject:objc_opt_class() forKey:&unk_26E546908];

  v21 = [(PLAWDMetricsService *)self classDictionary];
  [v21 setObject:objc_opt_class() forKey:&unk_26E546920];

  BOOL v22 = [(PLAWDMetricsService *)self connectToAWDServer];
  if (v22)
  {
    v23 = [(PLAWDMetricsService *)self classDictionary];
    v24 = [v23 allKeys];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v35 + 1) + 8 * v29);
          v31 = [(PLAWDMetricsService *)self awdServerConn];
          objc_msgSend(v31, "registerQueriableMetricCallback:forIdentifier:", v3, objc_msgSend(v30, "unsignedIntValue"));

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v27);
    }

    v32 = [(PLAWDMetricsService *)self awdServerConn];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __39__PLAWDMetricsService_initAWDInterface__block_invoke_77;
    v34[3] = &unk_264B9A018;
    v34[4] = self;
    [v32 registerConfigChangeCallback:v34];
  }
  return v22;
}

void __39__PLAWDMetricsService_initAWDInterface__block_invoke(uint64_t a1, uint64_t a2)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__PLAWDMetricsService_initAWDInterface__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%@ : AWD Submit data callback: metricType=%d", @"*******PLAWDMetricsService*******", a2];
      v6 = (void *)MEMORY[0x263F5F638];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLAWDMetricsService initAWDInterface]_block_invoke"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:218];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) currRunningMetrics];
  v12 = [NSNumber numberWithUnsignedInt:a2];
  int v13 = [v11 containsObject:v12];

  if (v13)
  {
    uint64_t v14 = *(void **)(a1 + 32);
    v15 = [NSNumber numberWithUnsignedInt:a2];
    [v14 auxClassWrapper:v15 withAction:2];
  }
}

uint64_t __39__PLAWDMetricsService_initAWDInterface__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled = result;
  return result;
}

void __39__PLAWDMetricsService_initAWDInterface__block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__PLAWDMetricsService_initAWDInterface__block_invoke_2_78;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"%@ : AWD config change callback: %@", @"*******PLAWDMetricsService*******", v3];
      v6 = (void *)MEMORY[0x263F5F638];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLAWDMetricsService initAWDInterface]_block_invoke"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:255];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  uint64_t v11 = objc_opt_new();
  [*(id *)(a1 + 32) setUpdateRunningMetrics:v11];

  if (v3)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          objc_super v18 = [*(id *)(a1 + 32) updateRunningMetrics];
          [v18 addObject:v17];

          uint64_t v19 = [*(id *)(a1 + 32) currRunningMetrics];
          int v20 = [v19 containsObject:v17];

          v21 = *(void **)(a1 + 32);
          if (v20)
          {
            BOOL v22 = [v21 currRunningMetrics];
            [v22 removeObject:v17];
          }
          else
          {
            [v21 auxClassWrapper:v17 withAction:0];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v14);
    }
  }
  v23 = [*(id *)(a1 + 32) currRunningMetrics];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v25 = [*(id *)(a1 + 32) currRunningMetrics];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(a1 + 32) auxClassWrapper:*(void *)(*((void *)&v31 + 1) + 8 * j) withAction:1];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v27);
    }
  }
  v30 = [*(id *)(a1 + 32) updateRunningMetrics];
  [*(id *)(a1 + 32) setCurrRunningMetrics:v30];

  [*(id *)(a1 + 32) setUpdateRunningMetrics:0];
}

uint64_t __39__PLAWDMetricsService_initAWDInterface__block_invoke_2_78(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (AWDServerConnection)awdServerConn
{
  return (AWDServerConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAwdServerConn:(id)a3
{
}

- (NSMutableSet)currRunningMetrics
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrRunningMetrics:(id)a3
{
}

- (NSMutableSet)updateRunningMetrics
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUpdateRunningMetrics:(id)a3
{
}

- (NSMutableDictionary)classDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setClassDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classDictionary, 0);
  objc_storeStrong((id *)&self->_updateRunningMetrics, 0);
  objc_storeStrong((id *)&self->_currRunningMetrics, 0);

  objc_storeStrong((id *)&self->_awdServerConn, 0);
}

@end