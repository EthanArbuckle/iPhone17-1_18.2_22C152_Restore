@interface PLActivityCriterionEntry
+ (id)audioOffCriterion;
+ (id)displayOffCriterion;
+ (id)pluggedInCriterion;
- (NSDictionary)filter;
- (NSString)entryKey;
- (PLActivityCriterionEntry)initWithEntryKey:(id)a3 withCriterionBlock:(id)a4;
- (PLActivityCriterionEntry)initWithEntryKey:(id)a3 withFilter:(id)a4 withCriterionBlock:(id)a5;
- (PLEntryNotificationOperatorComposition)entryListener;
- (id)criterionBlock;
- (void)didDisableActivity:(id)a3;
- (void)didEnableActivity:(id)a3;
- (void)scheduleEntryListener;
- (void)setCriterionBlock:(id)a3;
- (void)setEntryListener:(id)a3;
- (void)setFilter:(id)a3;
@end

@implementation PLActivityCriterionEntry

void __49__PLActivityCriterionEntry_scheduleEntryListener__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"entry"];
  if (v3)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__PLActivityCriterionEntry_scheduleEntryListener__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_3 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_3, block);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_3)
      {
        v5 = [NSString stringWithFormat:@"PLActivityCriterionEntry::entryListenerBlock: entry=%@ for criterion=%@", v3, *(void *)(a1 + 32)];
        v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionEntry.m"];
        v7 = [v6 lastPathComponent];
        v8 = [NSString stringWithUTF8String:"-[PLActivityCriterionEntry scheduleEntryListener]_block_invoke"];
        +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:117];

        v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    v10 = [*(id *)(a1 + 32) criterionBlock];
    objc_msgSend(*(id *)(a1 + 32), "setSatisfied:", ((uint64_t (**)(void, void *))v10)[2](v10, v3));
  }
}

uint64_t __45__PLActivityCriterionEntry_audioOffCriterion__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  uint64_t v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

- (id)criterionBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (PLActivityCriterionEntry)initWithEntryKey:(id)a3 withCriterionBlock:(id)a4
{
  return [(PLActivityCriterionEntry *)self initWithEntryKey:a3 withFilter:0 withCriterionBlock:a4];
}

- (PLActivityCriterionEntry)initWithEntryKey:(id)a3 withFilter:(id)a4 withCriterionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)PLActivityCriterionEntry;
    v14 = [(PLActivityCriterion *)&v19 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_entryKey, a3);
      objc_storeStrong((id *)&v15->_filter, a4);
      uint64_t v16 = [v12 copy];
      id criterionBlock = v15->_criterionBlock;
      v15->_id criterionBlock = (id)v16;
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

+ (id)pluggedInCriterion
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)objc_opt_class());
  v12 = @"ExternalConnected";
  id v10 = &unk_1F1580BD0;
  uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  id v11 = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PLActivityCriterionEntry_pluggedInCriterion__block_invoke;
  v8[3] = &unk_1E6254FE0;
  id v9 = @"ExternalConnected";
  v6 = (void *)[v2 initWithEntryKey:@"PLBatteryAgent_EventBackward_Battery" withFilter:v5 withCriterionBlock:v8];

  return v6;
}

uint64_t __46__PLActivityCriterionEntry_pluggedInCriterion__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

+ (id)displayOffCriterion
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)objc_opt_class());
  v12 = @"Active";
  id v10 = &unk_1F1580BD0;
  uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  id v11 = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PLActivityCriterionEntry_displayOffCriterion__block_invoke;
  v8[3] = &unk_1E6254FE0;
  id v9 = @"Active";
  v6 = (void *)[v2 initWithEntryKey:@"PLDisplayAgent_EventPoint_Display" withFilter:v5 withCriterionBlock:v8];

  return v6;
}

BOOL __47__PLActivityCriterionEntry_displayOffCriterion__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  BOOL v3 = [v2 integerValue] != 1;

  return v3;
}

+ (id)audioOffCriterion
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  v14 = @"Active";
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v17 = v10[5];
  v15 = &unk_1F1580BD0;
  BOOL v3 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v16 = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PLActivityCriterionEntry_audioOffCriterion__block_invoke;
  v8[3] = &unk_1E6255008;
  void v8[4] = &v9;
  v6 = (void *)[v2 initWithEntryKey:@"PLAudioAgent_EventForward_Routing" withFilter:v5 withCriterionBlock:v8];

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)didEnableActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLActivityCriterionEntry_didEnableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didEnableActivity__defaultOnce_0 != -1) {
      dispatch_once(&didEnableActivity__defaultOnce_0, block);
    }
    if (didEnableActivity__classDebugEnabled_0)
    {
      v6 = [NSString stringWithFormat:@"PLActivityCriterionEntry::didEnableActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionEntry.m"];
      v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLActivityCriterionEntry didEnableActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:89];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)PLActivityCriterionEntry;
  [(PLActivityCriterion *)&v23 didEnableActivity:v4];
  uint64_t v11 = +[PowerlogCore sharedCore];
  v12 = [v11 storage];
  v13 = [(PLActivityCriterionEntry *)self entryKey];
  v14 = [v12 lastEntryForKey:v13];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46__PLActivityCriterionEntry_didEnableActivity___block_invoke_38;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = v15;
    if (didEnableActivity__defaultOnce_36 != -1) {
      dispatch_once(&didEnableActivity__defaultOnce_36, v22);
    }
    if (didEnableActivity__classDebugEnabled_37)
    {
      uint64_t v16 = [NSString stringWithFormat:@"PLActivityCriterionEntry::didEnableActivity: entry=%@", v14];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionEntry.m"];
      v18 = [v17 lastPathComponent];
      objc_super v19 = [NSString stringWithUTF8String:"-[PLActivityCriterionEntry didEnableActivity:]"];
      +[PLCoreStorage logMessage:v16 fromFile:v18 fromFunction:v19 fromLineNumber:93];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if (v14)
  {
    v21 = [(PLActivityCriterionEntry *)self criterionBlock];
    [(PLActivityCriterion *)self setSatisfied:((uint64_t (**)(void, void *))v21)[2](v21, v14)];
  }
  [(PLActivityCriterionEntry *)self scheduleEntryListener];
}

BOOL __46__PLActivityCriterionEntry_didEnableActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didEnableActivity__classDebugEnabled_0 = result;
  return result;
}

BOOL __46__PLActivityCriterionEntry_didEnableActivity___block_invoke_38(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didEnableActivity__classDebugEnabled_37 = result;
  return result;
}

- (void)didDisableActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLActivityCriterionEntry_didDisableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didDisableActivity__defaultOnce_0 != -1) {
      dispatch_once(&didDisableActivity__defaultOnce_0, block);
    }
    if (didDisableActivity__classDebugEnabled_0)
    {
      v6 = [NSString stringWithFormat:@"PLActivityCriterionEntry::didDisableActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionEntry.m"];
      v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLActivityCriterionEntry didDisableActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:105];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PLActivityCriterionEntry;
  [(PLActivityCriterion *)&v11 didDisableActivity:v4];
  [(PLActivityCriterionEntry *)self setEntryListener:0];
}

BOOL __47__PLActivityCriterionEntry_didDisableActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didDisableActivity__classDebugEnabled_0 = result;
  return result;
}

- (void)scheduleEntryListener
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__PLActivityCriterionEntry_scheduleEntryListener__block_invoke;
  v12[3] = &unk_1E6253970;
  v12[4] = self;
  BOOL v3 = (void *)MEMORY[0x1C1869370](v12, a2);
  id v4 = [(PLActivityCriterionEntry *)self filter];

  uint64_t v5 = [PLEntryNotificationOperatorComposition alloc];
  v6 = dispatch_get_global_queue(2, 0);
  v7 = [(PLActivityCriterionEntry *)self entryKey];
  if (v4)
  {
    v8 = [(PLActivityCriterionEntry *)self filter];
    uint64_t v9 = [(PLEntryNotificationOperatorComposition *)v5 initWithWorkQueue:v6 forEntryKey:v7 withFilter:v8 withBlock:v3];
    entryListener = self->_entryListener;
    self->_entryListener = v9;
  }
  else
  {
    objc_super v11 = [(PLEntryNotificationOperatorComposition *)v5 initWithWorkQueue:v6 forEntryKey:v7 withBlock:v3];
    v8 = self->_entryListener;
    self->_entryListener = v11;
  }
}

BOOL __49__PLActivityCriterionEntry_scheduleEntryListener__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_3 = result;
  return result;
}

- (NSString)entryKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCriterionBlock:(id)a3
{
}

- (NSDictionary)filter
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilter:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)entryListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEntryListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryListener, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong(&self->_criterionBlock, 0);
  objc_storeStrong((id *)&self->_entryKey, 0);
}

@end