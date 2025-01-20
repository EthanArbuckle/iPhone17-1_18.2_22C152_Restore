@interface PLOperator
+ (BOOL)fullMode;
+ (BOOL)isDebugEnabled;
+ (BOOL)isDebugEnabledForKey:(id)a3;
+ (BOOL)isEnabled;
+ (id)accountingGroupDefinitions;
+ (id)className;
+ (id)createEntriesForMetrics:(id)a3 withData:(id)a4 withDate:(id)a5;
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (id)entryDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)entryKeyForType:(id)a3 andName:(id)a4;
+ (id)entryKeyForType:(id)a3 andName:(id)a4 isDynamic:(BOOL)a5;
+ (id)entryKeys;
+ (id)operator;
+ (id)railDefinitions;
+ (id)storageQueueName;
+ (id)trimConditionsWithEntryKey:(id)a3 withTrimDate:(id)a4 withCount:(id)a5 withStartDateKey:(id)a6;
+ (id)trimConditionsWithEntryKey:(id)a3 withTrimDate:(id)a4 withDuration:(id)a5 withStartDateKey:(id)a6;
+ (void)load;
+ (void)setEnabled:(BOOL)a3;
- (BOOL)defaultBoolForKey:(id)a3;
- (BOOL)isDebugEnabled;
- (BOOL)isDebugEnabledForKey:(id)a3;
- (BOOL)postFilteredNotificationForEntry:(id)a3 withFilteredDefition:(id)a4 withNotificationName:(id)a5;
- (BOOL)shouldWriteEntry:(id)a3 withDebug:(BOOL)a4;
- (NSMutableArray)bufferedEntries;
- (NSMutableDictionary)filterDefinitions;
- (NSMutableDictionary)filterDeltaLastEntryIDs;
- (NSMutableDictionary)lastLogDateForEntryKey;
- (NSString)className;
- (NSString)storageQueueName;
- (OS_dispatch_queue)storageQueue;
- (OS_dispatch_queue)workQueue;
- (PLCoreStorage)storage;
- (PLOperator)init;
- (PLTimer)triggerBufferFlush;
- (double)defaultDoubleForKey:(id)a3;
- (double)timeIntervalSinceLastLogForEntryKey:(id)a3;
- (id)defaultObjectForKey:(id)a3;
- (id)entryDefinitions;
- (id)entryKeys;
- (id)initForTest;
- (id)tablesToTrimConditionsForTrimDate:(id)a3;
- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4;
- (int64_t)defaultLongForKey:(id)a3;
- (void)dealloc;
- (void)enableBufferFlushTimer:(unint64_t)a3;
- (void)flushBuffer;
- (void)logDMAEntry:(id)a3;
- (void)logEntries:(id)a3 withGroupID:(id)a4;
- (void)logEntry:(id)a3;
- (void)logForSubsystem:(id)a3 category:(id)a4 data:(id)a5;
- (void)logForSubsystem:(id)a3 category:(id)a4 data:(id)a5 date:(id)a6;
- (void)logFromCFCallback:(id)a3;
- (void)logProportionateAggregateEntry:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5;
- (void)logRequestNotification:(id)a3;
- (void)postEntries:(id)a3;
- (void)postEntries:(id)a3 withGroupID:(id)a4;
- (void)setBufferedEntries:(id)a3;
- (void)setFilterDefinitions:(id)a3;
- (void)setFilterDeltaLastEntryIDs:(id)a3;
- (void)setLastLogDateForEntryKey:(id)a3;
- (void)setTriggerBufferFlush:(id)a3;
- (void)setupFilterRequest:(id)a3;
- (void)subscribeNotificationsForEntries;
- (void)updateEntry:(id)a3 withBlock:(id)a4;
@end

@implementation PLOperator

- (void)logProportionateAggregateEntry:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v8) {
      goto LABEL_14;
    }
  }
  else
  {
    v11 = [(PLOperator *)self storage];
    char v12 = [v11 storageReady];

    if (!v8 || (v12 & 1) == 0) {
      goto LABEL_14;
    }
  }
  v13 = [v8 entryKey];
  BOOL v14 = +[PLUtilities shouldLogForEntryKey:v13];

  if (v14)
  {
    if ([(PLOperator *)self isDebugEnabledForKey:@"logEntry"])
    {
      v15 = [NSString stringWithFormat:@"%@", v8];
      v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:]"];
      +[PLCoreStorage logMessage:v15 fromFile:v17 fromFunction:v18 fromLineNumber:350];

      v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    v20 = [v8 entryDefinition];
    BOOL v21 = +[PLEntryDefinition isAggregateForEntryDefinition:v20];

    if (v21)
    {
      v22 = self->_lastLogDateForEntryKey;
      objc_sync_enter(v22);
      v23 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      v24 = [(PLOperator *)self lastLogDateForEntryKey];
      v25 = [v8 entryKey];
      [v24 setObject:v23 forKeyedSubscript:v25];

      objc_sync_exit(v22);
      if (!+[PLUtilities isPowerlogHelperd])
      {
        v26 = [(PLOperator *)self storage];
        [v26 writeProportionateAggregateEntry:v8 withStartDate:v9 withEndDate:v10];
      }
    }
  }
LABEL_14:
}

- (void)logEntry:(id)a3
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v4) {
      goto LABEL_38;
    }
  }
  else
  {
    v5 = [(PLOperator *)self storage];
    char v6 = [v5 storageReady];

    if (!v4 || (v6 & 1) == 0) {
      goto LABEL_38;
    }
  }
  v7 = [v4 entryKey];
  BOOL v8 = +[PLUtilities shouldLogForEntryKey:v7];

  if (!v8) {
    goto LABEL_38;
  }
  BOOL v9 = [(PLOperator *)self isDebugEnabledForKey:@"logEntry"];
  if (v9)
  {
    id v10 = [NSString stringWithFormat:@"%@", v4];
    v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
    char v12 = [v11 lastPathComponent];
    v13 = [NSString stringWithUTF8String:"-[PLOperator logEntry:]"];
    +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:372];

    BOOL v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  v15 = [v4 entryDefinition];
  BOOL v16 = +[PLEntryDefinition isAggregateForEntryDefinition:v15];

  if (v16)
  {
    v17 = self->_lastLogDateForEntryKey;
    objc_sync_enter(v17);
    v18 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v19 = [(PLOperator *)self lastLogDateForEntryKey];
    v20 = [v4 entryKey];
    [v19 setObject:v18 forKeyedSubscript:v20];

    objc_sync_exit(v17);
    if (!+[PLUtilities isPowerlogHelperd])
    {
      BOOL v21 = [(PLOperator *)self storage];
      [v21 writeAggregateEntry:v4];
    }
    goto LABEL_38;
  }
  if (![(PLOperator *)self shouldWriteEntry:v4 withDebug:v9]) {
    goto LABEL_38;
  }
  v22 = self->_lastLogDateForEntryKey;
  objc_sync_enter(v22);
  v23 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v24 = [(PLOperator *)self lastLogDateForEntryKey];
  v25 = [v4 entryKey];
  [v24 setObject:v23 forKeyedSubscript:v25];

  objc_sync_exit(v22);
  v26 = [v4 entryKey];
  v27 = +[PLEntryDefinition definitionForEntryKey:v26];
  v28 = objc_msgSend(v27, "objectForKeyedSubscript:");
  v29 = [v28 objectForKeyedSubscript:@"BufferEntries"];
  LODWORD(v25) = [v29 BOOLValue];

  if (v25)
  {
    v71 = [v4 entryKey];
    v30 = +[PLEntryDefinition definitionForEntryKey:v71];
    v31 = [v30 objectForKeyedSubscript:@"Configs"];
    v32 = objc_msgSend(v31, "objectForKeyedSubscript:");
    if (v32)
    {
      v33 = [v4 entryKey];
      v34 = +[PLEntryDefinition definitionForEntryKey:v33];
      v35 = [v34 objectForKeyedSubscript:@"Configs"];
      v36 = [v35 objectForKeyedSubscript:@"BufferFlushInterval"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v37 = [v4 entryKey];
        v38 = +[PLEntryDefinition definitionForEntryKey:v37];
        v39 = [v38 objectForKeyedSubscript:@"Configs"];
        v40 = [v39 objectForKeyedSubscript:@"BufferFlushInterval"];
        unsigned int v41 = [v40 unsignedIntValue];

        uint64_t v42 = v41;
        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v42 = 10;
LABEL_24:
    [(PLOperator *)self enableBufferFlushTimer:v42];
    v45 = [(PLOperator *)self bufferedEntries];
    [v45 addObject:v4];

    if (v9)
    {
      v46 = NSString;
      v47 = [(PLOperator *)self bufferedEntries];
      v48 = [v46 stringWithFormat:@"Added entry onto queue, queue size: %lu", objc_msgSend(v47, "count")];

      v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      v50 = [v49 lastPathComponent];
      v51 = [NSString stringWithUTF8String:"-[PLOperator logEntry:]"];
      +[PLCoreStorage logMessage:v48 fromFile:v50 fromFunction:v51 fromLineNumber:400];

      v52 = PLLogCommon();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    v53 = [v4 entryKey];
    v54 = +[PLEntryDefinition definitionForEntryKey:v53];
    v55 = [v54 objectForKeyedSubscript:@"Configs"];
    v56 = objc_msgSend(v55, "objectForKeyedSubscript:");
    if (v56)
    {
      v57 = [v4 entryKey];
      v58 = +[PLEntryDefinition definitionForEntryKey:v57];
      v59 = [v58 objectForKeyedSubscript:@"Configs"];
      v60 = [v59 objectForKeyedSubscript:@"BufferSize"];
      objc_opt_class();
      char v70 = objc_opt_isKindOfClass();

      if (v70)
      {
        v61 = [v4 entryKey];
        v62 = +[PLEntryDefinition definitionForEntryKey:v61];
        v63 = [v62 objectForKeyedSubscript:@"Configs"];
        v64 = [v63 objectForKeyedSubscript:@"BufferSize"];
        unsigned int v65 = [v64 unsignedIntValue];

        unint64_t v66 = v65;
        goto LABEL_33;
      }
    }
    else
    {
    }
    unint64_t v66 = 10;
LABEL_33:
    v67 = [(PLOperator *)self bufferedEntries];
    BOOL v68 = [v67 count] < v66;

    if (!v68) {
      [(PLOperator *)self flushBuffer];
    }
    goto LABEL_35;
  }
  if (+[PLUtilities isPowerlogHelperd])
  {
    v74[0] = v4;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
    [(PLOperator *)self postEntries:v43];
  }
  else
  {
    v44 = [(PLOperator *)self storage];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __23__PLOperator_logEntry___block_invoke;
    v72[3] = &unk_1E62539B8;
    v72[4] = self;
    id v73 = v4;
    [v44 writeEntry:v73 withCompletionBlock:v72];
  }
LABEL_35:
  if (!+[PLUtilities isPowerlogHelperd]
    && [v4 hasDMAKeys])
  {
    [(PLOperator *)self logDMAEntry:v4];
  }
LABEL_38:
}

- (PLCoreStorage)storage
{
  v2 = +[PowerlogCore sharedCore];
  v3 = [v2 storage];

  return (PLCoreStorage *)v3;
}

- (BOOL)isDebugEnabledForKey:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() isDebugEnabledForKey:v3];

  return v4;
}

+ (BOOL)isDebugEnabledForKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", objc_opt_class(), v3)|| +[PLDefaults isClassDebugEnabled:objc_opt_class() forKey:v3];

  return v4;
}

- (NSMutableDictionary)lastLogDateForEntryKey
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)shouldWriteEntry:(id)a3 withDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 isErrorEntry] & 1) == 0)
  {
    if (![v6 filterEntryLogging])
    {
      BOOL v7 = 1;
      goto LABEL_22;
    }
    BOOL v8 = [(PLOperator *)self storage];
    BOOL v9 = [v6 entryKey];
    id v10 = [v8 lastEntryForKey:v9];

    if (v4)
    {
      v11 = [NSString stringWithFormat:@"lastEntry=%@", v10];
      char v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      v13 = [v12 lastPathComponent];
      BOOL v14 = [NSString stringWithUTF8String:"-[PLOperator shouldWriteEntry:withDebug:]"];
      +[PLCoreStorage logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:517];

      v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      if (v10)
      {
        uint64_t v16 = [v6 compare:v10 options:2];
        v17 = objc_msgSend(NSString, "stringWithFormat:", @"result=%ld", v16);
        v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
        v19 = [v18 lastPathComponent];
        v20 = [NSString stringWithUTF8String:"-[PLOperator shouldWriteEntry:withDebug:]"];
        +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:520];

        BOOL v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }

        if (!v16)
        {
          v22 = [NSString stringWithFormat:@"skipping logging"];
          v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
          v24 = [v23 lastPathComponent];
          v25 = [NSString stringWithUTF8String:"-[PLOperator shouldWriteEntry:withDebug:]"];
          +[PLCoreStorage logMessage:v22 fromFile:v24 fromFunction:v25 fromLineNumber:522];

          v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }

          goto LABEL_18;
        }
      }
    }
    else if (v10 && ![v6 compare:v10 options:2])
    {
LABEL_18:
      v27 = [v6 entryKey];
      uint64_t v28 = [v27 rangeOfString:@"EventBackward"];

      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v33[0] = 0;
        v33[1] = v33;
        v33[2] = 0x3032000000;
        v33[3] = __Block_byref_object_copy__19;
        v33[4] = __Block_byref_object_dispose__19;
        id v34 = v6;
        v31[0] = 0;
        v31[1] = v31;
        v31[2] = 0x3032000000;
        v31[3] = __Block_byref_object_copy__19;
        v31[4] = __Block_byref_object_dispose__19;
        id v32 = v10;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __41__PLOperator_shouldWriteEntry_withDebug___block_invoke;
        v30[3] = &unk_1E6253A50;
        v30[4] = v31;
        v30[5] = v33;
        [(PLOperator *)self updateEntry:v32 withBlock:v30];
        _Block_object_dispose(v31, 8);

        _Block_object_dispose(v33, 8);
      }
      BOOL v7 = 0;
      goto LABEL_21;
    }
    BOOL v7 = 1;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v7 = 0;
LABEL_22:

  return v7;
}

- (void)logDMAEntry:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 dictionary];
  v5 = (void *)[v4 mutableCopy];

  id v6 = NSString;
  BOOL v7 = [v3 entryKey];
  BOOL v8 = [v6 stringWithFormat:@"com.apple.perfpowerservices.dma.%@", v7];

  BOOL v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLOperator logDMAEntry:]();
  }

  id v10 = [v3 entryDefinition];
  v11 = +[PLEntryDefinition keyConfigsForEntryDefinition:v10];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __26__PLOperator_logDMAEntry___block_invoke;
  v23[3] = &unk_1E6255668;
  id v12 = v5;
  id v24 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v23];

  if ([v3 hasDynamicKeys])
  {
    v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLOperator logDMAEntry:]();
    }

    BOOL v14 = [v3 DMAKeys];
    v15 = [v12 dictionaryWithValuesForKeys:v14];
    uint64_t v16 = (void *)[v15 mutableCopy];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __26__PLOperator_logDMAEntry___block_invoke_225;
    v20[3] = &unk_1E6254330;
    id v21 = v16;
    id v22 = v8;
    id v17 = v16;
    [v12 enumerateKeysAndObjectsUsingBlock:v20];
  }
  else
  {
    id v18 = v12;
    id v19 = v3;
    AnalyticsSendEventLazy();

    id v17 = v18;
  }
}

- (OS_dispatch_queue)storageQueue
{
  v2 = [(PLOperator *)self storageQueueName];
  id v3 = +[PLUtilities workQueueForKey:v2];

  return (OS_dispatch_queue *)v3;
}

+ (id)storageQueueName
{
  if (storageQueueName_onceToken != -1) {
    dispatch_once(&storageQueueName_onceToken, &__block_literal_global_17_0);
  }
  id v3 = (id)storageQueueName__storageQueueNames;
  objc_sync_enter(v3);
  BOOL v4 = [(id)storageQueueName__storageQueueNames objectForKeyedSubscript:objc_opt_class()];

  if (!v4)
  {
    v5 = +[PLCoreStorage storageQueueNameForClass:a1];
    [(id)storageQueueName__storageQueueNames setObject:v5 forKeyedSubscript:objc_opt_class()];
  }
  id v6 = [(id)storageQueueName__storageQueueNames objectForKeyedSubscript:objc_opt_class()];
  objc_sync_exit(v3);

  return v6;
}

- (NSString)storageQueueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 storageQueueName];
}

- (double)timeIntervalSinceLastLogForEntryKey:(id)a3
{
  id v4 = a3;
  v5 = self->_lastLogDateForEntryKey;
  objc_sync_enter(v5);
  id v6 = [(PLOperator *)self lastLogDateForEntryKey];
  BOOL v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    BOOL v8 = [(PLOperator *)self lastLogDateForEntryKey];
    BOOL v9 = [v8 objectForKeyedSubscript:v4];
    [v9 timeIntervalSinceMonitonicNow];
    double v11 = -v10;
  }
  else
  {
    BOOL v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    BOOL v9 = [(PLOperator *)self lastLogDateForEntryKey];
    [v9 setObject:v8 forKeyedSubscript:v4];
    double v11 = INFINITY;
  }

  objc_sync_exit(v5);
  return v11;
}

- (void)logForSubsystem:(id)a3 category:(id)a4 data:(id)a5 date:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    BOOL v14 = [MEMORY[0x1E4F89D08] getMetadataByNameForSubsystem:v10 category:v11];
    if (v14)
    {
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        v15 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      }
      uint64_t v16 = v15;
      id v17 = +[PLOperator createEntriesForMetrics:v14 withData:v12 withDate:v15];
      id v18 = PPSLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v32 = v10;
        __int16 v33 = 2112;
        id v34 = v11;
        __int16 v35 = 2048;
        uint64_t v36 = [v17 count];
        _os_log_debug_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEBUG, "[Log] Number of entries for subsystem/category: %@/%@ : %lu", buf, 0x20u);
      }
      id v25 = v10;

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v24 = v17;
      id v19 = [v17 allValues];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v27 != v22) {
              objc_enumerationMutation(v19);
            }
            [(PLOperator *)self logEntry:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v21);
      }

      id v10 = v25;
    }
    else
    {
      uint64_t v16 = PPSLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PLOperator logForSubsystem:category:data:date:]();
      }
    }
  }
  else
  {
    BOOL v14 = PPSLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PLOperator logForSubsystem:category:data:date:]();
    }
  }
}

+ (id)createEntriesForMetrics:(id)a3 withData:(id)a4 withDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v31 = 0;
  v32[0] = &v31;
  v32[1] = 0x3032000000;
  v32[2] = __Block_byref_object_copy__19;
  v32[3] = __Block_byref_object_dispose__19;
  id v33 = 0;
  id v10 = objc_opt_new();
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke;
  long long v26 = &unk_1E6255D80;
  id v11 = v7;
  id v27 = v11;
  v30 = &v31;
  id v12 = v10;
  id v28 = v12;
  id v13 = v9;
  id v29 = v13;
  [v8 enumerateKeysAndObjectsUsingBlock:&v23];
  if (*(void *)(v32[0] + 40))
  {
    BOOL v14 = objc_msgSend(v12, "objectForKey:", v23, v24, v25, v26, v27, v28);

    if (!v14)
    {
      v15 = [PLEntry alloc];
      uint64_t v16 = [(PLEntry *)v15 initWithEntryKey:*(void *)(v32[0] + 40) withDate:v13];
      [v12 setObject:v16 forKeyedSubscript:*(void *)(v32[0] + 40)];
    }
    id v17 = [v8 objectForKeyedSubscript:@"__PPSKVPairs__"];
    id v18 = [v12 objectForKeyedSubscript:*(void *)(v32[0] + 40)];
    [v18 setObject:v17 forKeyedSubscript:@"__PPSKVPairs__"];

    id v19 = PPSLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[PLOperator createEntriesForMetrics:withData:withDate:]((uint64_t)v32, (uint64_t)v12, v19);
    }
  }
  uint64_t v20 = v29;
  id v21 = v12;

  _Block_object_dispose(&v31, 8);
  return v21;
}

- (void)logForSubsystem:(id)a3 category:(id)a4 data:(id)a5
{
}

void __26__PLOperator_logDMAEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:@"ProcessName"];

  if (v6)
  {
    id v8 = *(void **)(a1 + 32);
    id v7 = (id *)(a1 + 32);
    id v9 = [v8 objectForKeyedSubscript:v5];
    id v10 = +[PLUtilities bundleIDFromProcessName:v9];

    if (v10)
    {
      id v11 = *v7;
      id v12 = v10;
    }
    else
    {
      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __26__PLOperator_logDMAEntry___block_invoke_cold_1(v7, (uint64_t)v5, v13);
      }

      id v11 = *v7;
      id v12 = @"unknown";
    }
    [v11 setObject:v12 forKeyedSubscript:v5];
  }
}

void __38__PLOperator_postEntries_withGroupID___block_invoke(id *a1)
{
  v2 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PLOperator_postEntries_withGroupID___block_invoke_2;
  block[3] = &unk_1E62544E0;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, block);
}

+ (id)entryKeyForType:(id)a3 andName:(id)a4 isDynamic:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 className];
  id v11 = +[PLEntryKey entryKeyForOperatorName:v10 withType:v9 withName:v8 isDynamic:v5];

  return v11;
}

+ (id)className
{
  if (className_onceToken != -1) {
    dispatch_once(&className_onceToken, &__block_literal_global_51);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)className__classNamesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v2 = [(id)className__classNames objectForKeyedSubscript:objc_opt_class()];

  if (!v2)
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    [(id)className__classNames setObject:v4 forKeyedSubscript:objc_opt_class()];
  }
  BOOL v5 = [(id)className__classNames objectForKeyedSubscript:objc_opt_class()];
  dispatch_semaphore_signal((dispatch_semaphore_t)className__classNamesSemaphore);
  return v5;
}

+ (id)entryKeyForType:(id)a3 andName:(id)a4
{
  return (id)[a1 entryKeyForType:a3 andName:a4 isDynamic:0];
}

void __23__PLOperator_logEntry___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 postEntries:v2];
}

- (void)postEntries:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [(PLOperator *)self workQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __26__PLOperator_postEntries___block_invoke;
    v7[3] = &unk_1E62539B8;
    id v8 = v5;
    id v9 = self;
    dispatch_async(v6, v7);
  }
}

- (OS_dispatch_queue)workQueue
{
  uint64_t v2 = objc_opt_class();
  return (OS_dispatch_queue *)+[PLUtilities workQueueForClass:v2];
}

void __37__PLOperator_logEntries_withGroupID___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v1 postEntries:v2];
}

void __26__PLOperator_postEntries___block_invoke_101(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  LODWORD(a3) = [*(id *)(a1 + 32) postFilteredNotificationForEntry:*(void *)(a1 + 40) withFilteredDefition:a3 withNotificationName:v5];
  BOOL v6 = +[PLDefaults debugEnabled];
  if (a3)
  {
    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __26__PLOperator_postEntries___block_invoke_2_102;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v7;
      if (ArrayReserved_block_invoke_4_defaultOnce_0 != -1) {
        dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_0, block);
      }
      if (ArrayReserved_block_invoke_4_classDebugEnabled_0)
      {
        id v8 = NSString;
        id v9 = [*(id *)(a1 + 40) entryKey];
        id v10 = [v8 stringWithFormat:@"posting %@ with NotificationName %@", v9, v5];

        id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
        id v12 = [v11 lastPathComponent];
        id v13 = [NSString stringWithUTF8String:"-[PLOperator postEntries:]_block_invoke"];
        +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:551];

        BOOL v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    +[PLUtilities postNotificationName:v5 object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 48)];
  }
  else if (v6)
  {
    uint64_t v15 = objc_opt_class();
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    id v25 = __26__PLOperator_postEntries___block_invoke_108;
    long long v26 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v27 = v15;
    if (ArrayReserved_block_invoke_4_defaultOnce_106 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_106, &v23);
    }
    if (ArrayReserved_block_invoke_4_classDebugEnabled_107)
    {
      uint64_t v16 = NSString;
      id v17 = [*(id *)(a1 + 40) entryKey];
      id v18 = [v16 stringWithFormat:@"NOT posting %@ with NotificationName %@", v17, v5, v23, v24, v25, v26, v27];

      id v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      uint64_t v20 = [v19 lastPathComponent];
      id v21 = [NSString stringWithUTF8String:"-[PLOperator postEntries:]_block_invoke_2"];
      +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:554];

      uint64_t v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

- (BOOL)postFilteredNotificationForEntry:(id)a3 withFilteredDefition:(id)a4 withNotificationName:(id)a5
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1C1869120]();
  id v12 = [v10 componentsSeparatedByString:@"."];
  v127 = v12;
  if ([v12 count])
  {
    id v13 = [v12 firstObject];
    BOOL v14 = [v8 entryKey];
    char v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      v125 = self;
      uint64_t v16 = [(PLOperator *)self filterDeltaLastEntryIDs];
      id v17 = [v16 objectForKeyedSubscript:v10];

      if (!v17)
      {
        id v18 = [(PLOperator *)v125 filterDeltaLastEntryIDs];
        [v18 setObject:v8 forKeyedSubscript:v10];
      }
      v126 = v11;
      long long v141 = 0u;
      long long v142 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      obj = v9;
      uint64_t v129 = [obj countByEnumeratingWithState:&v139 objects:v147 count:16];
      v130 = v17;
      int v19 = 0;
      if (!v129)
      {
        int v20 = 1;
        goto LABEL_71;
      }
      uint64_t v128 = *(void *)v140;
      int v20 = 1;
      while (1)
      {
        uint64_t v21 = 0;
LABEL_8:
        if (*(void *)v140 != v128) {
          objc_enumerationMutation(obj);
        }
        uint64_t v132 = v21;
        uint64_t v22 = *(void *)(*((void *)&v139 + 1) + 8 * v21);
        uint64_t v23 = [obj objectForKeyedSubscript:v22];
        uint64_t v24 = (void *)[v23 mutableCopy];

        v133 = v24;
        id v25 = [v24 objectForKeyedSubscript:&unk_1F1584A70];

        if (v25)
        {
          if (!v17) {
            goto LABEL_69;
          }
          long long v26 = [v17 entryDate];
          uint64_t v27 = [v8 entryDate];
          [v26 timeIntervalSinceDate:v27];
          double v29 = fabs(v28);
          v30 = [v24 objectForKeyedSubscript:&unk_1F1584A70];
          [v30 doubleValue];
          double v32 = v31;

          id v17 = v130;
          if (v29 <= v32)
          {
LABEL_69:

            LOBYTE(v102) = 0;
            goto LABEL_80;
          }
        }
        if (v19) {
          goto LABEL_14;
        }
        id v33 = [v24 objectForKeyedSubscript:&unk_1F1584A88];

        if (v33)
        {
          if (!v17) {
            goto LABEL_69;
          }
          id v34 = [v17 entryDate];
          __int16 v35 = [v8 entryDate];
          [v34 timeIntervalSinceDate:v35];
          double v37 = fabs(v36);
          v38 = [v24 objectForKeyedSubscript:&unk_1F1584A88];
          [v38 doubleValue];
          double v40 = v39;

          if (v37 >= v40) {
            goto LABEL_26;
          }
          int v20 = 0;
          id v17 = v130;
        }
        unsigned int v41 = [v24 objectForKeyedSubscript:&unk_1F1584AA0];

        if (v41)
        {
          if (!v17) {
            goto LABEL_69;
          }
          uint64_t v42 = [v17 objectForKeyedSubscript:v22];
          [v42 doubleValue];
          double v44 = v43;
          v45 = [v8 objectForKeyedSubscript:v22];
          [v45 doubleValue];
          double v47 = vabdd_f64(v44, v46);
          v48 = [v24 objectForKeyedSubscript:&unk_1F1584AA0];
          [v48 doubleValue];
          double v50 = v49;

          if (v47 >= v50)
          {
LABEL_26:
            int v19 = 1;
            goto LABEL_27;
          }
          int v20 = 0;
          id v17 = v130;
        }
        v51 = [v24 objectForKeyedSubscript:&unk_1F1584AB8];

        if (v51)
        {
          if (v17)
          {
            v52 = [v17 objectForKeyedSubscript:v22];
            v53 = [v8 objectForKeyedSubscript:v22];
            int v19 = [v52 isEqual:v53] ^ 1;

            v20 &= v19;
            goto LABEL_28;
          }
LABEL_14:
          int v19 = 1;
          goto LABEL_28;
        }
        if ((v20 & 1) == 0)
        {
          int v20 = 0;
          int v19 = 0;
          goto LABEL_28;
        }
        id v123 = v10;
        id v124 = v9;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        id v54 = v24;
        uint64_t v55 = [v54 countByEnumeratingWithState:&v135 objects:v146 count:16];
        if (!v55)
        {
          int v20 = 1;
          goto LABEL_59;
        }
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v136;
        int v20 = 1;
LABEL_33:
        uint64_t v58 = 0;
        while (2)
        {
          if (*(void *)v136 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v135 + 1) + 8 * v58);
          switch([v59 shortValue])
          {
            case 1u:
              v60 = [v8 objectForKeyedSubscript:v22];
              [v60 doubleValue];
              double v62 = v61;
              v63 = [v54 objectForKeyedSubscript:v59];
              [v63 doubleValue];
              double v65 = v64;

              if (v62 <= v65) {
                goto LABEL_50;
              }
              goto LABEL_54;
            case 2u:
              unint64_t v66 = [v8 objectForKeyedSubscript:v22];
              [v66 doubleValue];
              double v68 = v67;
              v69 = [v54 objectForKeyedSubscript:v59];
              [v69 doubleValue];
              double v71 = v70;

              if (v68 < v71) {
                goto LABEL_50;
              }
              goto LABEL_54;
            case 3u:
              v72 = [v54 objectForKeyedSubscript:v59];
              id v73 = [v8 objectForKeyedSubscript:v22];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  v75 = [v8 objectForKeyedSubscript:v22];
                  [v75 doubleValue];
                  double v77 = v76;
                  [v72 doubleValue];
                  double v79 = v78;

                  if (v77 != v79) {
                    int v20 = 0;
                  }
                  goto LABEL_53;
                }
              }
              else
              {
              }
              v98 = [v8 objectForKeyedSubscript:v22];
              BOOL v99 = [v98 plCompare:v72] == 0;

              v20 &= v99;
LABEL_53:

LABEL_54:
              if (v56 != ++v58) {
                continue;
              }
              uint64_t v56 = [v54 countByEnumeratingWithState:&v135 objects:v146 count:16];
              if (v56) {
                goto LABEL_33;
              }
LABEL_59:

              int v19 = 0;
              id v10 = v123;
              id v9 = v124;
LABEL_27:
              id v17 = v130;
LABEL_28:

              uint64_t v21 = v132 + 1;
              if (v132 + 1 != v129) {
                goto LABEL_8;
              }
              uint64_t v100 = [obj countByEnumeratingWithState:&v139 objects:v147 count:16];
              uint64_t v129 = v100;
              if (!v100)
              {
LABEL_71:

                if (+[PLDefaults debugEnabled])
                {
                  uint64_t v109 = objc_opt_class();
                  v134[0] = MEMORY[0x1E4F143A8];
                  v134[1] = 3221225472;
                  v134[2] = __89__PLOperator_postFilteredNotificationForEntry_withFilteredDefition_withNotificationName___block_invoke_137;
                  v134[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v134[4] = v109;
                  if (postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__defaultOnce_135 != -1) {
                    dispatch_once(&postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__defaultOnce_135, v134);
                  }
                  if (postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__classDebugEnabled_136)
                  {
                    v110 = NSString;
                    v111 = [v8 entryKey];
                    v112 = NSStringFromBOOL();
                    uint64_t v113 = NSStringFromBOOL();
                    id v114 = v10;
                    v115 = (void *)v113;
                    v116 = v114;
                    v117 = [v110 stringWithFormat:@"entryKey=%@ notificationName=%@ shouldPost=%@ Post=%@", v111, v114, v112, v113];

                    v118 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
                    v119 = [v118 lastPathComponent];
                    v120 = [NSString stringWithUTF8String:"-[PLOperator postFilteredNotificationForEntry:withFilteredDefition:withNotificationName:]"];
                    +[PLCoreStorage logMessage:v117 fromFile:v119 fromFunction:v120 fromLineNumber:693];

                    v121 = PLLogCommon();
                    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG)) {
                      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
                    }

                    id v10 = v116;
                    id v17 = v130;
                  }
                }
                if ((v20 | v19))
                {
                  obj = [(PLOperator *)v125 filterDeltaLastEntryIDs];
                  [obj setObject:v8 forKeyedSubscript:v10];
                  LOBYTE(v102) = 1;
LABEL_80:
                  id v11 = v126;
LABEL_81:
                }
                else
                {
                  LOBYTE(v102) = 0;
                  id v11 = v126;
                }

                goto LABEL_83;
              }
              break;
            case 4u:
              v80 = [v8 objectForKeyedSubscript:v22];
              [v80 doubleValue];
              double v82 = v81;
              v83 = [v54 objectForKeyedSubscript:v59];
              [v83 doubleValue];
              double v85 = v84;

              if (v82 >= v85) {
                goto LABEL_50;
              }
              goto LABEL_54;
            case 5u:
              v86 = [v8 objectForKeyedSubscript:v22];
              [v86 doubleValue];
              double v88 = v87;
              v89 = [v54 objectForKeyedSubscript:v59];
              [v89 doubleValue];
              double v91 = v90;

              if (v88 > v91) {
                goto LABEL_50;
              }
              goto LABEL_54;
            case 6u:
              v92 = [v8 objectForKeyedSubscript:v22];
              [v92 doubleValue];
              double v94 = v93;
              v95 = [v54 objectForKeyedSubscript:v59];
              [v95 doubleValue];
              double v97 = v96;

              if (v94 == v97) {
LABEL_50:
              }
                int v20 = 0;
              goto LABEL_54;
            default:
              goto LABEL_54;
          }
          break;
        }
      }
    }
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v101 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__PLOperator_postFilteredNotificationForEntry_withFilteredDefition_withNotificationName___block_invoke;
    block[3] = &unk_1E6253EC0;
    v144 = @"FilteredNotifications";
    uint64_t v145 = v101;
    if (postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__defaultOnce != -1) {
      dispatch_once(&postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__defaultOnce, block);
    }
    int v102 = postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__classDebugEnabled;

    if (v102)
    {
      v103 = NSString;
      v104 = [v8 entryKey];
      uint64_t v105 = [v103 stringWithFormat:@"EntryKey %@ does not match key %@", v104, v10];

      v106 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      v107 = [v106 lastPathComponent];
      v108 = [NSString stringWithUTF8String:"-[PLOperator postFilteredNotificationForEntry:withFilteredDefition:withNotificationName:]"];
      +[PLCoreStorage logMessage:v105 fromFile:v107 fromFunction:v108 fromLineNumber:579];

      obj = PLLogCommon();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      {
        id v17 = (void *)v105;
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        LOBYTE(v102) = 0;
      }
      else
      {
        LOBYTE(v102) = 0;
        id v17 = (void *)v105;
      }
      goto LABEL_81;
    }
  }
  else
  {
    LOBYTE(v102) = 0;
  }
LABEL_83:

  return v102;
}

- (NSMutableDictionary)filterDeltaLastEntryIDs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

void __38__PLOperator_postEntries_withGroupID___block_invoke_2(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"GroupID_%@", a1[4]];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  BOOL v6 = @"group";
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  +[PLUtilities postNotificationName:v2 object:v4 userInfo:v5];
}

void __26__PLOperator_postEntries___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = v25;
    uint64_t v5 = *(void *)v29;
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v6 = 0;
      uint64_t v22 = v3;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
        id v34 = @"entry";
        __int16 v35 = v7;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v9 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __26__PLOperator_postEntries___block_invoke_2;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          void block[4] = v9;
          if (ArrayReserved_block_invoke_3_defaultOnce_0 != -1) {
            dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce_0, block);
          }
          if (ArrayReserved_block_invoke_3_classDebugEnabled_0)
          {
            id v10 = v4;
            id v11 = NSString;
            id v12 = [v7 entryKey];
            id v13 = [v11 stringWithFormat:@"posting %@", v12];

            BOOL v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
            char v15 = [v14 lastPathComponent];
            uint64_t v16 = [NSString stringWithUTF8String:"-[PLOperator postEntries:]_block_invoke"];
            +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:544];

            id v17 = PLLogCommon();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v33 = v13;
              _os_log_debug_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v4 = v10;
            uint64_t v5 = v21;
            uint64_t v3 = v22;
          }
        }
        id v18 = [v7 entryKey];
        +[PLUtilities postNotificationName:v18 object:*(void *)(a1 + 40) userInfo:v8];

        int v19 = [*(id *)(a1 + 40) filterDefinitions];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v25[0] = __26__PLOperator_postEntries___block_invoke_101;
        v25[1] = &unk_1E6253BD0;
        v25[2] = *(void *)(a1 + 40);
        v25[3] = v7;
        id v26 = v8;
        id v20 = v8;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v3);
  }
}

- (NSMutableDictionary)filterDefinitions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)logEntries:(id)a3 withGroupID:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([(PLOperator *)self storage],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 storageReady],
        v8,
        v9))
  {
    id v36 = v7;
    id v37 = v6;
    if ([(PLOperator *)self isDebugEnabledForKey:@"logEntry"]
      || [(PLOperator *)self isDebugEnabledForKey:@"logEntries"])
    {
      id v10 = [NSString stringWithFormat:@"%@", v6];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLOperator logEntries:withGroupID:]"];
      +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:453];

      BOOL v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      id v6 = v37;
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v47 = 0u;
    long long v46 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v47;
      unint64_t v19 = 0x1E6253000uLL;
      unint64_t v20 = 0x1E6253000uLL;
      do
      {
        uint64_t v21 = 0;
        uint64_t v38 = v17;
        do
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * v21);
          int v23 = [*(id *)(v19 + 968) isAggregateForEntryKey:v22];
          char v24 = [*(id *)(v20 + 1288) isPowerlogHelperd];
          if (v23)
          {
            if ((v24 & 1) == 0)
            {
              uint64_t v25 = v18;
              long long v44 = 0u;
              long long v45 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              id v26 = [v15 objectForKeyedSubscript:v22];
              uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v43;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v43 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v31 = *(void *)(*((void *)&v42 + 1) + 8 * i);
                    double v32 = [(PLOperator *)self storage];
                    [v32 writeAggregateEntry:v31];
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
                }
                while (v28);
              }

              uint64_t v18 = v25;
              uint64_t v17 = v38;
              unint64_t v19 = 0x1E6253000;
              unint64_t v20 = 0x1E6253000;
            }
          }
          else if (v24)
          {
            id v33 = [v15 objectForKeyedSubscript:v22];
            [(PLOperator *)self postEntries:v33];
          }
          else
          {
            id v34 = [(PLOperator *)self storage];
            __int16 v35 = [v15 objectForKeyedSubscript:v22];
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = __37__PLOperator_logEntries_withGroupID___block_invoke;
            v39[3] = &unk_1E62544E0;
            v39[4] = self;
            id v40 = v15;
            uint64_t v41 = v22;
            [v34 writeEntries:v35 withCompletionBlock:v39];
          }
          ++v21;
        }
        while (v21 != v17);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v17);
    }

    id v7 = v36;
    [(PLOperator *)self postEntries:v15 withGroupID:v36];
    id v6 = v37;
  }
}

- (void)postEntries:(id)a3 withGroupID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLOperator *)self storageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PLOperator_postEntries_withGroupID___block_invoke;
  block[3] = &unk_1E62544E0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

id __26__PLOperator_logDMAEntry___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) DMAKeys];
  uint64_t v3 = [v1 dictionaryWithValuesForKeys:v2];
  uint64_t v4 = +[PLUtilities sanitizeCAPayload:v3];

  return v4;
}

void __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 isEqualToString:@"__PPSKVPairs__"])
    {
      id v7 = [v6 firstObject];
      id v8 = v7;
      if (!v7)
      {
LABEL_24:

        goto LABEL_25;
      }
      id v9 = [v7 allKeys];
      id v10 = [v9 firstObject];
      id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
      uint64_t v12 = +[PPSEntryKey entryKeyForMetric:v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      if (v8)
      {
        if (+[PLUtilities OverrideAllowlistEnabled])
        {
          if (!+[PPSCoreUtilities shouldLogMetric:v8]) {
            goto LABEL_24;
          }
        }
        else if (!+[PPSCoreUtilities isValidModeForMetric:](PPSCoreUtilities, "isValidModeForMetric:", v8)|| !+[PPSCoreUtilities isAllowedMetric:v8])
        {
          goto LABEL_24;
        }
        id v9 = +[PPSEntryKey entryKeyForMetric:v8];
        if (v9)
        {
          uint64_t v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];

          if (!v16)
          {
            uint64_t v17 = [[PLEntry alloc] initWithEntryKey:v9 withDate:*(void *)(a1 + 48)];
            [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v9];
          }
          uint64_t v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
          [v18 setObject:v6 forKeyedSubscript:v5];
        }
        else
        {
          uint64_t v18 = PPSLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_2();
          }
        }
      }
      else
      {
        id v9 = PPSLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_1();
        }
      }
    }

    goto LABEL_24;
  }
  id v15 = PPSLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_3((uint64_t)v5, v15);
  }

LABEL_25:
}

- (BOOL)isDebugEnabled
{
  uint64_t v2 = objc_opt_class();
  return [v2 isDebugEnabled];
}

+ (BOOL)isDebugEnabled
{
  if (+[PLDefaults isClassDebugEnabled:objc_opt_class()]) {
    return 1;
  }
  uint64_t v3 = objc_opt_class();
  return +[PLDefaults isClassDebugEnabled:v3];
}

- (NSString)className
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 className];
}

void __36__PLOperator_updateEntry_withBlock___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v7 = @"entry";
  v8[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v4 = NSString;
  id v5 = [*(id *)(a1 + 32) entryKey];
  id v6 = [v4 stringWithFormat:@"%@_update", v5];
  +[PLUtilities postNotificationName:v6 object:*(void *)(a1 + 40) userInfo:v3];
}

void __36__PLOperator_updateEntry_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PLOperator_updateEntry_withBlock___block_invoke_2;
  v6[3] = &unk_1E62539B8;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, v6);
}

- (void)updateEntry:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = 0;
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v9 = [(PLOperator *)self storage];
    char v8 = [v9 storageReady] ^ 1;

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((v8 & 1) == 0)
  {
    if (+[PLUtilities isPowerlogHelperd])
    {
      id v10 = [(PLOperator *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__PLOperator_updateEntry_withBlock___block_invoke_3;
      block[3] = &unk_1E62539B8;
      id v11 = (id *)v14;
      v14[0] = v6;
      v14[1] = self;
      dispatch_async(v10, block);
    }
    else
    {
      uint64_t v12 = [(PLOperator *)self storage];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __36__PLOperator_updateEntry_withBlock___block_invoke;
      v15[3] = &unk_1E6255D58;
      id v11 = &v17;
      id v17 = v7;
      v15[4] = self;
      uint64_t v16 = v6;
      [v12 updateEntry:v16 withBlock:v15];

      id v10 = v16;
    }
  }
LABEL_10:
}

+ (void)load
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class())
  {
    uint64_t v3 = objc_opt_class();
    +[PLCoreOperator registerOperator:v3];
  }
}

uint64_t __23__PLOperator_className__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)className__classNames;
  className__classNames = v0;

  className__classNamesSemaphore = (uint64_t)dispatch_semaphore_create(1);
  return MEMORY[0x1F41817F8]();
}

uint64_t __30__PLOperator_storageQueueName__block_invoke()
{
  storageQueueName__storageQueueNames = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)operator
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (BOOL)isEnabled
{
  id v2 = NSString;
  uint64_t v3 = [a1 className];
  id v4 = [v2 stringWithFormat:@"%@%@", v3, @"_Enabled"];

  LOBYTE(v3) = +[PLDefaults BOOLForKey:v4 ifNotSet:1];
  return (char)v3;
}

+ (void)setEnabled:(BOOL)a3
{
  id v7 = [NSNumber numberWithBool:a3];
  id v4 = NSString;
  uint64_t v5 = [a1 className];
  id v6 = [v4 stringWithFormat:@"%@%@", v5, @"_Enabled"];
  +[PLDefaults setObject:v7 forKey:v6];
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (BOOL)fullMode
{
  uint64_t v2 = objc_opt_class();
  return +[PLDefaults fullModeForClass:v2];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryDefinitions
{
  uint64_t v2 = objc_opt_class();
  return +[PLEntryDefinition entryDefinitionsForOperatorClass:v2];
}

+ (id)entryKeys
{
  uint64_t v2 = objc_opt_class();
  return +[PLEntryKey entryKeysForOperatorClass:v2];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLOperator)init
{
  v37.receiver = self;
  v37.super_class = (Class)PLOperator;
  uint64_t v2 = [(PLOperator *)&v37 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    lastLogDateForEntryKey = v2->_lastLogDateForEntryKey;
    v2->_lastLogDateForEntryKey = (NSMutableDictionary *)v3;

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __18__PLOperator_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v5;
      if (init_defaultOnce_2 != -1) {
        dispatch_once(&init_defaultOnce_2, block);
      }
      if (init_classDebugEnabled_2)
      {
        id v6 = NSString;
        id v7 = [(PLOperator *)v2 className];
        char v8 = [v6 stringWithFormat:@"*** Debug enabled for %@ ***", v7];

        id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
        id v10 = [v9 lastPathComponent];
        id v11 = [NSString stringWithUTF8String:"-[PLOperator init]"];
        +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:183];

        uint64_t v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      double v32 = __18__PLOperator_init__block_invoke_39;
      id v33 = &unk_1E6253EC0;
      id v34 = @"entryDefinitions";
      uint64_t v35 = v13;
      if (init_defaultOnce_37 != -1) {
        dispatch_once(&init_defaultOnce_37, &v30);
      }
      int v14 = init_classDebugEnabled_38;

      if (v14)
      {
        id v15 = NSString;
        uint64_t v16 = [(id)objc_opt_class() entryDefinitions];
        id v17 = [v15 stringWithFormat:@"%@", v16, v30, v31, v32, v33];

        uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
        unint64_t v19 = [v18 lastPathComponent];
        unint64_t v20 = [NSString stringWithUTF8String:"-[PLOperator init]"];
        +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:184];

        uint64_t v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if ([(PLOperator *)v2 isDebugEnabled])
    {
      uint64_t v22 = NSString;
      int v23 = [(PLOperator *)v2 className];
      char v24 = [v22 stringWithFormat:@"com.apple.powerlogd.%@.log", v23];

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)didReceiveLogNotification, v24, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    id v26 = objc_opt_new();
    [(PLOperator *)v2 setFilterDefinitions:v26];

    uint64_t v27 = objc_opt_new();
    [(PLOperator *)v2 setFilterDeltaLastEntryIDs:v27];

    uint64_t v28 = objc_opt_new();
    [(PLOperator *)v2 setBufferedEntries:v28];

    [(PLOperator *)v2 setTriggerBufferFlush:0];
    [(PLOperator *)v2 subscribeNotificationsForEntries];
  }
  return v2;
}

BOOL __18__PLOperator_init__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_2 = result;
  return result;
}

BOOL __18__PLOperator_init__block_invoke_39(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  init_classDebugEnabled_38 = result;
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PLOperator;
  [(PLOperator *)&v5 dealloc];
}

- (id)defaultObjectForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = NSString;
  id v6 = [(PLOperator *)self className];
  id v7 = [v5 stringWithFormat:@"%@_%@", v6, v4];

  char v8 = +[PLDefaults objectForKey:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [(id)objc_opt_class() defaults];
    id v10 = [v11 objectForKeyedSubscript:v4];
  }
  return v10;
}

- (BOOL)defaultBoolForKey:(id)a3
{
  uint64_t v3 = [(PLOperator *)self defaultObjectForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (double)defaultDoubleForKey:(id)a3
{
  uint64_t v3 = [(PLOperator *)self defaultObjectForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (int64_t)defaultLongForKey:(id)a3
{
  uint64_t v3 = [(PLOperator *)self defaultObjectForKey:a3];
  int64_t v4 = [v3 longValue];

  return v4;
}

- (id)initForTest
{
  v3.receiver = self;
  v3.super_class = (Class)PLOperator;
  return [(PLOperator *)&v3 init];
}

- (void)logFromCFCallback:(id)a3
{
  id v4 = a3;
  double v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __32__PLOperator_logFromCFCallback___block_invoke;
  v7[3] = &unk_1E62539B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __32__PLOperator_logFromCFCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1C1869120]();
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PLOperator_logFromCFCallback___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (ArrayReserved_block_invoke_defaultOnce_1 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_defaultOnce_1, block);
    }
    if (ArrayReserved_block_invoke_classDebugEnabled_1)
    {
      id v4 = NSString;
      double v5 = [*(id *)(a1 + 32) className];
      id v6 = [v4 stringWithFormat:@"%@ got CFCallback %@", v5, *(void *)(a1 + 40)];

      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLOperator logFromCFCallback:]_block_invoke"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:306];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  [*(id *)(a1 + 32) log];
}

BOOL __32__PLOperator_logFromCFCallback___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_classDebugEnabled_1 = result;
  return result;
}

- (void)flushBuffer
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    unint64_t v19 = __25__PLOperator_flushBuffer__block_invoke;
    unint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v3;
    if (flushBuffer_defaultOnce != -1) {
      dispatch_once(&flushBuffer_defaultOnce, &block);
    }
    if (flushBuffer_classDebugEnabled)
    {
      id v4 = NSString;
      double v5 = [(PLOperator *)self bufferedEntries];
      uint64_t v6 = [v5 count];
      id v7 = [v4 stringWithFormat:@"Flushing buffer, queue size %lu", v6, block, v18, v19, v20, v21];

      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLOperator flushBuffer]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:315];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v12 = [(PLOperator *)self bufferedEntries];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    int v14 = [(PLOperator *)self bufferedEntries];
    id v15 = objc_opt_new();
    [(PLOperator *)self setBufferedEntries:v15];

    uint64_t v16 = [(PLOperator *)self storage];
    [v16 writeEntries:v14 withCompletionBlock:&__block_literal_global_65];
  }
}

BOOL __25__PLOperator_flushBuffer__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  flushBuffer_classDebugEnabled = result;
  return result;
}

- (void)enableBufferFlushTimer:(unint64_t)a3
{
  double v5 = [(PLOperator *)self triggerBufferFlush];

  if (!v5)
  {
    uint64_t v6 = [PLTimer alloc];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    double v8 = (double)a3;
    id v9 = [(PLOperator *)self workQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__PLOperator_enableBufferFlushTimer___block_invoke;
    v11[3] = &unk_1E6254400;
    v11[4] = self;
    id v10 = [(PLTimer *)v6 initWithFireDate:v7 withInterval:1 withTolerance:0 repeats:v9 withUserInfo:v11 withQueue:v8 withBlock:0.0];
    [(PLOperator *)self setTriggerBufferFlush:v10];
  }
}

void __37__PLOperator_enableBufferFlushTimer___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) flushBuffer];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v1 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLOperator_enableBufferFlushTimer___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v1;
    if (ArrayReserved_block_invoke_2_defaultOnce_0 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_2_defaultOnce_0, block);
    }
    if (ArrayReserved_block_invoke_2_classDebugEnabled_0)
    {
      uint64_t v2 = [NSString stringWithFormat:@"Timer triggered flush buffer"];
      uint64_t v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      id v4 = [v3 lastPathComponent];
      double v5 = [NSString stringWithUTF8String:"-[PLOperator enableBufferFlushTimer:]_block_invoke"];
      +[PLCoreStorage logMessage:v2 fromFile:v4 fromFunction:v5 fromLineNumber:334];

      uint64_t v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __37__PLOperator_enableBufferFlushTimer___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_2_classDebugEnabled_0 = result;
  return result;
}

void __36__PLOperator_updateEntry_withBlock___block_invoke_3(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v7 = @"entry";
  v8[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v4 = NSString;
  double v5 = [*(id *)(a1 + 32) entryKey];
  uint64_t v6 = [v4 stringWithFormat:@"%@_update", v5];
  +[PLUtilities postNotificationName:v6 object:*(void *)(a1 + 40) userInfo:v3];
}

void __41__PLOperator_shouldWriteEntry_withDebug___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) entryDate];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setEntryDate:v2];
}

BOOL __26__PLOperator_postEntries___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_3_classDebugEnabled_0 = result;
  return result;
}

BOOL __26__PLOperator_postEntries___block_invoke_2_102(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_4_classDebugEnabled_0 = result;
  return result;
}

BOOL __26__PLOperator_postEntries___block_invoke_108(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_4_classDebugEnabled_107 = result;
  return result;
}

BOOL __89__PLOperator_postFilteredNotificationForEntry_withFilteredDefition_withNotificationName___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__classDebugEnabled = result;
  return result;
}

BOOL __89__PLOperator_postFilteredNotificationForEntry_withFilteredDefition_withNotificationName___block_invoke_137(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__classDebugEnabled_136 = result;
  return result;
}

- (id)entryDefinitions
{
  id v2 = objc_opt_class();
  return (id)[v2 entryDefinitions];
}

- (id)entryKeys
{
  id v2 = objc_opt_class();
  return (id)[v2 entryKeys];
}

- (void)subscribeNotificationsForEntries
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C1869120](self, a2);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v3 = [(PLOperator *)self entryKeys];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    unint64_t v8 = 0x1E6253000uLL;
    uint64_t v31 = *(void *)v40;
    uint64_t v30 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * v9);
        if ([*(id *)(v8 + 968) isOnDemandQueryableForEntryKey:v10])
        {
          id v11 = [NSString stringWithFormat:@"requesting.%@", v10];
          if (+[PLDefaults debugEnabled])
          {
            uint64_t v12 = objc_opt_class();
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __46__PLOperator_subscribeNotificationsForEntries__block_invoke;
            v36[3] = &unk_1E6253EC0;
            objc_super v37 = @"notifications";
            uint64_t v38 = v12;
            if (subscribeNotificationsForEntries_defaultOnce != -1) {
              dispatch_once(&subscribeNotificationsForEntries_defaultOnce, v36);
            }
            int v13 = subscribeNotificationsForEntries_classDebugEnabled;

            if (v13)
            {
              int v14 = [NSString stringWithFormat:@"signing up for notification %@", v11];
              id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
              uint64_t v16 = [v15 lastPathComponent];
              id v17 = [NSString stringWithUTF8String:"-[PLOperator subscribeNotificationsForEntries]"];
              +[PLCoreStorage logMessage:v14 fromFile:v16 fromFunction:v17 fromLineNumber:718];

              uint64_t v18 = PLLogCommon();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v44 = v14;
                _os_log_debug_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v4 = v30;
              uint64_t v7 = v31;
              uint64_t v6 = v32;
              unint64_t v8 = 0x1E6253000;
            }
          }
          unint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v19 addObserver:self selector:sel_logRequestNotification_ name:v11 object:0];
        }
        unint64_t v20 = [NSString stringWithFormat:@"requestingFilter.%@", v10];
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v21 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __46__PLOperator_subscribeNotificationsForEntries__block_invoke_157;
          block[3] = &unk_1E6253EC0;
          id v34 = @"notifications";
          uint64_t v35 = v21;
          if (subscribeNotificationsForEntries_defaultOnce_155 != -1) {
            dispatch_once(&subscribeNotificationsForEntries_defaultOnce_155, block);
          }
          int v22 = subscribeNotificationsForEntries_classDebugEnabled_156;

          if (v22)
          {
            int v23 = [NSString stringWithFormat:@"signing up for notification %@", v20];
            char v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
            uint64_t v25 = [v24 lastPathComponent];
            id v26 = [NSString stringWithUTF8String:"-[PLOperator subscribeNotificationsForEntries]"];
            +[PLCoreStorage logMessage:v23 fromFile:v25 fromFunction:v26 fromLineNumber:723];

            uint64_t v27 = PLLogCommon();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v44 = v23;
              _os_log_debug_impl(&dword_1BBD2F000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v7 = v31;
            uint64_t v6 = v32;
            unint64_t v8 = 0x1E6253000;
          }
        }
        uint64_t v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v28 addObserver:self selector:sel_setupFilterRequest_ name:v20 object:0];

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v6);
  }
}

BOOL __46__PLOperator_subscribeNotificationsForEntries__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  subscribeNotificationsForEntries_classDebugEnabled = result;
  return result;
}

BOOL __46__PLOperator_subscribeNotificationsForEntries__block_invoke_157(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  subscribeNotificationsForEntries_classDebugEnabled_156 = result;
  return result;
}

- (void)logRequestNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __37__PLOperator_logRequestNotification___block_invoke;
  v7[3] = &unk_1E62539B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __37__PLOperator_logRequestNotification___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1C1869120]();
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLOperator_logRequestNotification___block_invoke_2;
    block[3] = &unk_1E6253EC0;
    int v22 = @"notifications";
    uint64_t v23 = v3;
    if (ArrayReserved_block_invoke_5_defaultOnce_0 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_0, block);
    }
    int v4 = ArrayReserved_block_invoke_5_classDebugEnabled_0;

    if (v4)
    {
      uint64_t v5 = NSString;
      id v6 = [*(id *)(a1 + 40) name];
      uint64_t v7 = [v5 stringWithFormat:@"notification=%@", v6];

      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLOperator logRequestNotification:]_block_invoke"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:732];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v12 = [*(id *)(a1 + 40) name];
  int v13 = [v12 stringByReplacingOccurrencesOfString:@"requesting." withString:&stru_1F15208F0];

  int v14 = +[PLEntryDefinition logSelectorStringForEnteryKey:v13];
  SEL v15 = NSSelectorFromString(v14);

  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 32) performSelector:v15];
  }
  else
  {
    uint64_t v16 = [NSString stringWithFormat:@"Does not respond to entryKey=%@", v13];
    id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
    uint64_t v18 = [v17 lastPathComponent];
    unint64_t v19 = [NSString stringWithUTF8String:"-[PLOperator logRequestNotification:]_block_invoke"];
    +[PLCoreStorage logMessage:v16 fromFile:v18 fromFunction:v19 fromLineNumber:741];

    unint64_t v20 = PLLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
}

BOOL __37__PLOperator_logRequestNotification___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_5_classDebugEnabled_0 = result;
  return result;
}

- (void)setupFilterRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __33__PLOperator_setupFilterRequest___block_invoke;
  v7[3] = &unk_1E62539B8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __33__PLOperator_setupFilterRequest___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1C1869120]();
  uint64_t v3 = [*(id *)(a1 + 32) name];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"requestingFilter." withString:&stru_1F15208F0];

  uint64_t v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = +[PLEntryDefinition notificationNameForEntryKey:v4 withFilterDefintion:v5];

  uint64_t v7 = [*(id *)(a1 + 40) filterDefinitions];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) userInfo];
    uint64_t v10 = [*(id *)(a1 + 40) filterDefinitions];
    [v10 setObject:v9 forKeyedSubscript:v6];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__PLOperator_setupFilterRequest___block_invoke_2;
      block[3] = &unk_1E6253EC0;
      unint64_t v19 = @"notifications";
      uint64_t v20 = v11;
      if (ArrayReserved_block_invoke_6_defaultOnce_0 != -1) {
        dispatch_once(&ArrayReserved_block_invoke_6_defaultOnce_0, block);
      }
      int v12 = ArrayReserved_block_invoke_6_classDebugEnabled_0;

      if (v12)
      {
        int v13 = [NSString stringWithFormat:@"added requestingFilter %@", v6];
        int v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
        SEL v15 = [v14 lastPathComponent];
        uint64_t v16 = [NSString stringWithUTF8String:"-[PLOperator setupFilterRequest:]_block_invoke"];
        +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:755];

        id v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
  }
}

BOOL __33__PLOperator_setupFilterRequest___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_6_classDebugEnabled_0 = result;
  return result;
}

+ (id)trimConditionsWithEntryKey:(id)a3 withTrimDate:(id)a4 withDuration:(id)a5 withStartDateKey:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  if (a5)
  {
    [a5 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 1209600.0;
  }
  int v12 = NSString;
  [v8 timeIntervalSince1970];
  double v14 = v13;
  SEL v15 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v16 = [v15 dateByAddingTimeInterval:-v11];
  [v16 timeIntervalSince1970];
  double v18 = v17;

  if (v14 >= v18) {
    double v19 = v18;
  }
  else {
    double v19 = v14;
  }
  uint64_t v20 = [v12 stringWithFormat:@"(%@ is NULL OR %@<%f)", v9, v9, *(void *)&v19];

  return v20;
}

+ (id)trimConditionsWithEntryKey:(id)a3 withTrimDate:(id)a4 withCount:(id)a5 withStartDateKey:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (a5) {
    uint64_t v12 = [a5 integerValue];
  }
  else {
    uint64_t v12 = 200;
  }
  double v13 = NSString;
  [v10 timeIntervalSince1970];
  SEL v15 = [v13 stringWithFormat:@"(%@ is NULL OR %@<%f) AND ID<=(SELECT (max(ID)-%i) from %@)", v11, v11, v14, v12, v9];

  return v15;
}

- (id)tablesToTrimConditionsForTrimDate:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v43 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v45 = v4;
  [v4 timeIntervalSince1970];
  uint64_t v6 = v5;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v42 = self;
  uint64_t v7 = +[PLEntryKey entryKeysForOperator:self];
  id v8 = (void *)[v7 copy];

  id obj = v8;
  uint64_t v47 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v49;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v48 + 1) + 8 * v9);
        id v11 = +[PLEntryKey PLEntryKeyForEntryKey:v10];
        uint64_t v12 = +[PLEntryDefinition definitionForEntryKey:v10];
        double v13 = [v12 objectForKeyedSubscript:@"Configs"];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"TrimConditionsTemplate"];

        if (v14)
        {
          SEL v15 = [v12 objectForKeyedSubscript:@"Configs"];
          uint64_t v16 = [v15 objectForKeyedSubscript:@"TrimConditionsTemplate"];
          __int16 v17 = [v16 integerValue];
        }
        else
        {
          __int16 v17 = 0;
        }
        double v18 = [v12 objectForKeyedSubscript:@"Keys"];
        double v19 = [v18 allKeys];

        uint64_t v20 = @"StartDate";
        if (([v19 containsObject:@"StartDate"] & 1) == 0)
        {
          if ([v19 containsObject:@"StartOffset"]) {
            uint64_t v20 = @"(timestamp + StartOffset/1000.0)";
          }
          else {
            uint64_t v20 = @"timestamp";
          }
        }
        uint64_t v21 = @"EndDate";
        if (([v19 containsObject:@"EndDate"] & 1) == 0)
        {
          if ([v19 containsObject:@"EndOffset"]) {
            uint64_t v21 = @"(timestamp + EndOffset/1000.0)";
          }
          else {
            uint64_t v21 = @"timestampEnd";
          }
        }
        if (v17 > 1)
        {
          if (v17 != 2)
          {
            if (v17 != 0x7FFF) {
              goto LABEL_35;
            }
            uint64_t v25 = [(PLOperator *)v42 trimConditionsForEntryKey:v10 forTrimDate:v45];
LABEL_24:
            id v26 = (void *)v25;
            if (v25) {
              goto LABEL_34;
            }
            goto LABEL_35;
          }
          int v22 = [v12 objectForKeyedSubscript:@"Configs"];
          uint64_t v23 = [v22 objectForKeyedSubscript:@"TrimConditionsTemplateArg"];
          uint64_t v24 = +[PLOperator trimConditionsWithEntryKey:v10 withTrimDate:v45 withCount:v23 withStartDateKey:v20];
          goto LABEL_29;
        }
        if (v17)
        {
          if (v17 != 1) {
            goto LABEL_35;
          }
          int v22 = [v12 objectForKeyedSubscript:@"Configs"];
          uint64_t v23 = [v22 objectForKeyedSubscript:@"TrimConditionsTemplateArg"];
          uint64_t v24 = +[PLOperator trimConditionsWithEntryKey:v10 withTrimDate:v45 withDuration:v23 withStartDateKey:v20];
LABEL_29:
          id v26 = (void *)v24;

          if (v26) {
            goto LABEL_34;
          }
          goto LABEL_35;
        }
        uint64_t v27 = [v11 entryType];
        int v28 = [v27 isEqualToString:@"EventInterval"];

        if (v28)
        {
          uint64_t v29 = [MEMORY[0x1E4F1C9C8] monotonicDate];
          uint64_t v30 = [v29 dateByAddingTimeInterval:1209600.0];

          [v30 timeIntervalSince1970];
          uint64_t v32 = v31;
          id v33 = NSString;
          id v34 = +[PLUtilities deviceBootTime];
          [v34 timeIntervalSince1970];
          id v26 = [v33 stringWithFormat:@"(%@<%f) OR ((%@ is NULL OR %@<%f OR %@<%f) AND (%@ is NULL OR %@<%f))", v21, v6, v20, v20, v35, v20, v32, v21, v21, v6];

          goto LABEL_33;
        }
        id v36 = [v11 entryType];
        int v37 = [v36 isEqualToString:@"EventForward"];

        if (v37)
        {
          id v26 = [NSString stringWithFormat:@"%@ is NULL OR %@<(SELECT max(%@) FROM '%@' WHERE %@<%f)", v20, v20, v20, v11, v20, v6];
LABEL_33:
          if (!v26) {
            goto LABEL_35;
          }
LABEL_34:
          [v43 setObject:v26 forKeyedSubscript:v10];

          goto LABEL_35;
        }
        uint64_t v38 = [v11 entryType];
        int v39 = [v38 isEqualToString:@"Aggregate"];

        if (v39)
        {
          uint64_t v25 = +[PLOperator trimConditionsWithEntryKey:v10 withTrimDate:v45 withDuration:&unk_1F15859F0 withStartDateKey:v20];
          goto LABEL_24;
        }
LABEL_35:

        ++v9;
      }
      while (v47 != v9);
      uint64_t v40 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      uint64_t v47 = v40;
    }
    while (v40);
  }

  return v43;
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  if (+[PLDefaults debugEnabled])
  {
    id v4 = [NSString stringWithFormat:@"PLOperator::trimConditionsForEntryKey:trimDate: WARNING: derived class must implement if they specify PLEDTrimConditionsTemplateCustom in an entryDefinition"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m"];
    uint64_t v6 = [v5 lastPathComponent];
    uint64_t v7 = [NSString stringWithUTF8String:"-[PLOperator trimConditionsForEntryKey:forTrimDate:]"];
    +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:872];

    id v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  return 0;
}

void __26__PLOperator_logDMAEntry___block_invoke_225(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) setValuesForKeysWithDictionary:v5];
    [*(id *)(a1 + 32) setObject:v6 forKey:@"value"];
    id v7 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();
  }
}

id __26__PLOperator_logDMAEntry___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) copy];
  id v2 = +[PLUtilities sanitizeCAPayload:v1];

  return v2;
}

- (void)setFilterDefinitions:(id)a3
{
}

- (void)setFilterDeltaLastEntryIDs:(id)a3
{
}

- (NSMutableArray)bufferedEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBufferedEntries:(id)a3
{
}

- (PLTimer)triggerBufferFlush
{
  return (PLTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTriggerBufferFlush:(id)a3
{
}

- (void)setLastLogDateForEntryKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLogDateForEntryKey, 0);
  objc_storeStrong((id *)&self->_triggerBufferFlush, 0);
  objc_storeStrong((id *)&self->_bufferedEntries, 0);
  objc_storeStrong((id *)&self->_filterDeltaLastEntryIDs, 0);
  objc_storeStrong((id *)&self->_filterDefinitions, 0);
}

- (void)logForSubsystem:category:data:date:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "[Log] Nil payload for subsystem/category: %@/%@");
}

- (void)logForSubsystem:category:data:date:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "[Log] Metadata not found for subsystem/category: %@/%@");
}

- (void)logDMAEntry:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "DMA data '%@' has dynamic keys", v2, v3, v4, v5, v6);
}

- (void)logDMAEntry:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Processing DMA data: '%@'", v2, v3, v4, v5, v6);
}

void __26__PLOperator_logDMAEntry___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, a3, OS_LOG_TYPE_ERROR, "Failed to translate process name '%@' to bundle ID for DMA!", v5, 0xCu);
}

+ (void)createEntriesForMetrics:(uint64_t)a1 withData:(uint64_t)a2 withDate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Adding to %@ entries array %@", (uint8_t *)&v4, 0x16u);
}

void __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "No metadata for metric: %@", v2, v3, v4, v5, v6);
}

void __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "No entryKey for metric: %@", v1, 0xCu);
}

void __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  id v7 = (id)objc_opt_class();
  id v3 = v7;
  _os_log_fault_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_FAULT, "Metric name: %@ is not String class %@", (uint8_t *)&v4, 0x16u);
}

@end