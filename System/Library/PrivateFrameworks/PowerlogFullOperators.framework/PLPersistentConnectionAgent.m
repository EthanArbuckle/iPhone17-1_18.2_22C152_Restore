@interface PLPersistentConnectionAgent
+ (id)accountingGroupDefinitions;
+ (id)defaults;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)railDefinitions;
+ (void)load;
- (BOOL)pushEnabled;
- (PLCFNotificationOperatorComposition)intervalChangedNotification;
- (PLCFNotificationOperatorComposition)preferencesChangedNotification;
- (PLPersistentConnectionAgent)init;
- (int64_t)pollingInterval;
- (void)log;
- (void)logEventForwardConfig;
- (void)logEventPointCache;
@end

@implementation PLPersistentConnectionAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPersistentConnectionAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventPointDefinitions
{
  v20[1] = *MEMORY[0x263EF8340];
  v19 = @"Cache";
  v17[0] = *MEMORY[0x263F5F858];
  uint64_t v15 = *MEMORY[0x263F5F880];
  v16 = &unk_26E5466D0;
  objc_super v2 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18[0] = v2;
  v17[1] = *MEMORY[0x263F5F870];
  v13[0] = @"CacheId";
  v3 = [MEMORY[0x263F5F650] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v14[0] = v4;
  v13[1] = @"CacheInterval";
  v5 = [MEMORY[0x263F5F650] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v14[1] = v6;
  v13[2] = @"CacheAge";
  v7 = [MEMORY[0x263F5F650] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v14[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

  return v11;
}

+ (id)entryEventForwardDefinitions
{
  v18[1] = *MEMORY[0x263EF8340];
  v17 = @"Config";
  v15[0] = *MEMORY[0x263F5F858];
  uint64_t v13 = *MEMORY[0x263F5F880];
  v14 = &unk_26E5466D0;
  objc_super v2 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v16[0] = v2;
  v15[1] = *MEMORY[0x263F5F870];
  v11[0] = @"Enabled";
  v3 = [MEMORY[0x263F5F650] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v11[1] = @"PollingInterval";
  v12[0] = v4;
  v5 = [MEMORY[0x263F5F650] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v12[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  return v9;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

- (PLPersistentConnectionAgent)init
{
  v18.receiver = self;
  v18.super_class = (Class)PLPersistentConnectionAgent;
  objc_super v2 = [(PLAgent *)&v18 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F5F630]);
    uint64_t v4 = *MEMORY[0x263F5D418];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __35__PLPersistentConnectionAgent_init__block_invoke;
    v16[3] = &unk_264B99DD0;
    v5 = v2;
    v17 = v5;
    uint64_t v6 = [v3 initWithOperator:v5 forNotification:v4 requireState:0 withBlock:v16];
    intervalChangedNotification = v5->_intervalChangedNotification;
    v5->_intervalChangedNotification = (PLCFNotificationOperatorComposition *)v6;

    id v8 = objc_alloc(MEMORY[0x263F5F630]);
    uint64_t v9 = *MEMORY[0x263F5D430];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __35__PLPersistentConnectionAgent_init__block_invoke_42;
    void v14[3] = &unk_264B99DD0;
    v10 = v5;
    uint64_t v15 = v10;
    uint64_t v11 = [v8 initWithOperator:v10 forNotification:v9 requireState:0 withBlock:v14];
    preferencesChangedNotification = v10->_preferencesChangedNotification;
    v10->_preferencesChangedNotification = (PLCFNotificationOperatorComposition *)v11;
  }
  return v2;
}

uint64_t __35__PLPersistentConnectionAgent_init__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__PLPersistentConnectionAgent_init__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLPersistentConnectionAgentCache_block_invoke_defaultOnce != -1) {
      dispatch_once(&kPLPersistentConnectionAgentCache_block_invoke_defaultOnce, block);
    }
    if (kPLPersistentConnectionAgentCache_block_invoke_classDebugEnabled)
    {
      id v3 = [NSString stringWithFormat:@"Interval changed"];
      uint64_t v4 = (void *)MEMORY[0x263F5F638];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPersistentConnectionAgent.m"];
      uint64_t v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLPersistentConnectionAgent init]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:102];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        [(PLPMUAgent *)(uint64_t)v3 init];
      }
    }
  }
  return [*(id *)(a1 + 32) log];
}

uint64_t __35__PLPersistentConnectionAgent_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLPersistentConnectionAgentCache_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __35__PLPersistentConnectionAgent_init__block_invoke_42(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__PLPersistentConnectionAgent_init__block_invoke_2_43;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLPersistentConnectionAgentCache_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&kPLPersistentConnectionAgentCache_block_invoke_2_defaultOnce, block);
    }
    if (kPLPersistentConnectionAgentCache_block_invoke_2_classDebugEnabled)
    {
      id v3 = [NSString stringWithFormat:@"Preferences changed"];
      uint64_t v4 = (void *)MEMORY[0x263F5F638];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPersistentConnectionAgent.m"];
      uint64_t v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLPersistentConnectionAgent init]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:108];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        [(PLPMUAgent *)(uint64_t)v3 init];
      }
    }
  }
  return [*(id *)(a1 + 32) log];
}

uint64_t __35__PLPersistentConnectionAgent_init__block_invoke_2_43(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLPersistentConnectionAgentCache_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (BOOL)pushEnabled
{
  return PCSettingsGetClassPushEnabled() != 0;
}

- (int64_t)pollingInterval
{
  return (int)PCSettingsGetClassPollInterval();
}

- (void)log
{
  [(PLPersistentConnectionAgent *)self logEventForwardConfig];

  [(PLPersistentConnectionAgent *)self logEventPointCache];
}

- (void)logEventPointCache
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F5D3F0] intervalCacheDictionaries];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__PLPersistentConnectionAgent_logEventPointCache__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (logEventPointCache_defaultOnce != -1) {
      dispatch_once(&logEventPointCache_defaultOnce, block);
    }
    if (logEventPointCache_classDebugEnabled)
    {
      uint64_t v4 = [NSString stringWithFormat:@"Cache = %@", v2];
      v5 = (void *)MEMORY[0x263F5F638];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPersistentConnectionAgent.m"];
      v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLPersistentConnectionAgent logEventPointCache]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:139];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        [(PLPMUAgent *)(uint64_t)v4 init];
      }
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v31 = v2;
  id obj = [v2 allKeys];
  uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    uint64_t v19 = *MEMORY[0x263F5F8B8];
    uint64_t v20 = *MEMORY[0x263F5D428];
    uint64_t v21 = *MEMORY[0x263F5D420];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v24 = +[PLOperator entryKeyForType:v19 andName:@"Cache"];
        v25 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v24];
        [v25 setObject:v23 forKeyedSubscript:@"CacheId"];
        v26 = [0 objectForKey:v20];
        [v25 setObject:v26 forKeyedSubscript:@"CacheInterval"];

        v27 = NSNumber;
        v28 = [0 objectForKey:v21];
        [v28 timeIntervalSinceNow];
        v30 = [v27 numberWithDouble:-v29];
        [v25 setObject:v30 forKeyedSubscript:@"CacheAge"];

        [(PLOperator *)self logEntry:v25];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v17);
  }
}

uint64_t __49__PLPersistentConnectionAgent_logEventPointCache__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointCache_classDebugEnabled = result;
  return result;
}

- (void)logEventForwardConfig
{
  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F8A0] andName:@"Config"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v6];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PLPersistentConnectionAgent pushEnabled](self, "pushEnabled"));
  [v3 setObject:v4 forKeyedSubscript:@"Enabled"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLPersistentConnectionAgent pollingInterval](self, "pollingInterval"));
  [v3 setObject:v5 forKeyedSubscript:@"PollingInterval"];

  [(PLOperator *)self logEntry:v3];
}

- (PLCFNotificationOperatorComposition)intervalChangedNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (PLCFNotificationOperatorComposition)preferencesChangedNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesChangedNotification, 0);

  objc_storeStrong((id *)&self->_intervalChangedNotification, 0);
}

@end