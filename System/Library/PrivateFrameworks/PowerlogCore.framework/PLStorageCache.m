@interface PLStorageCache
+ (id)sharedStorageCache;
+ (void)syncAndDispatchForEntryCache:(id)a3 forEntryKey:(id)a4 withBlock:(id)a5;
- (NSDate)lastCacheFlushDate;
- (NSMutableDictionary)cacheContent;
- (NSMutableDictionary)countSafetyDrop;
- (NSMutableDictionary)countWarnings;
- (NSMutableDictionary)lastEntryCache;
- (NSMutableDictionary)stagingAggregateEntryCache;
- (NSMutableDictionary)stagingEntryCache;
- (PLStorageCache)init;
- (id)cachedEntryForEntryKey:(id)a3 withEntryID:(int64_t)a4;
- (id)connectionForKey:(id)a3;
- (id)getEntryFromDBForEntryKey:(id)a3 withMatchingKeyToValue:(id)a4;
- (id)getQueryForAggregateEntryKey:(id)a3 withMatchingKeyToValue:(id)a4;
- (id)lastEntryCacheForEntryKey:(id)a3;
- (id)lastEntryCacheForEntryKey:(id)a3 withSubEntryKey:(id)a4;
- (id)matchingPairs:(id)a3;
- (id)stagingEntryCacheForEntryKey:(id)a3;
- (id)stagingEntryCacheForEntryKey:(id)a3 withComparisons:(id)a4 isSingleton:(BOOL)a5;
- (id)stagingEntryCacheForEntryKey:(id)a3 withID:(int64_t)a4;
- (id)stagingEntryCacheForEntryKey:(id)a3 withIDLessThan:(int64_t)a4;
- (id)stagingEntryCacheIDsForEntryKey:(id)a3;
- (int)limitOfType:(id)a3 forEntryKey:(id)a4;
- (int64_t)addToStagingEntryCache:(id)a3;
- (int64_t)entryIDForNewEntry:(id)a3;
- (int64_t)lastEntryCacheSize;
- (int64_t)stagingEntryCacheSize;
- (int64_t)stagingEntryCacheSizeForEntryKey:(id)a3;
- (void)addToLastEntryCache:(id)a3;
- (void)addToLastEntryCacheSubKey:(id)a3;
- (void)addToStagingAggregateEntryCache:(id)a3;
- (void)clearLastEntryCacheForEntryKey:(id)a3;
- (void)dumpEntryCache:(id)a3;
- (void)dumpLastEntryCache;
- (void)dumpStagingEntryCache;
- (void)enumerateEntryCache:(id)a3 withBlock:(id)a4;
- (void)enumerateStagingEntryCacheForEntryKey:(id)a3 withBlock:(id)a4;
- (void)enumerateStagingEntryCacheWithBlock:(id)a3;
- (void)flushStagingAggregateEntryCacheToDatabase;
- (void)flushStagingEntryCacheToDatabase;
- (void)insertIntoStagingEntryCache:(id)a3;
- (void)lastEntryCachePruneToDate:(id)a3;
- (void)logFullLastEntryCacheForEntryKey:(id)a3;
- (void)logSizeOfEntryCache:(id)a3;
- (void)logSizeOfLastEntryCache;
- (void)logSizeOfStagingEntryCache;
- (void)logStagingEntryCacheForEntryKey:(id)a3;
- (void)setCacheContent:(id)a3;
- (void)setCountSafetyDrop:(id)a3;
- (void)setCountWarnings:(id)a3;
- (void)setLastCacheFlushDate:(id)a3;
- (void)setLastEntryCache:(id)a3;
- (void)setLastEntryCacheSize:(int64_t)a3;
- (void)setNextEntryIDForEntryKey:(id)a3 toEntryID:(int64_t)a4;
- (void)setStagingAggregateEntryCache:(id)a3;
- (void)setStagingEntryCache:(id)a3;
- (void)setStagingEntryCacheSize:(int64_t)a3;
- (void)updateStagingEntryCacheWithEntry:(id)a3 withBlock:(id)a4;
@end

@implementation PLStorageCache

void __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = +[PLEntryDefinition subEntryKeyKeyForEntryKey:v5];

  if (v7)
  {
    v8 = objc_opt_new();
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_2;
    v15 = &unk_1E6253CE0;
    id v16 = *(id *)(a1 + 32);
    id v9 = v8;
    id v17 = v9;
    [v6 enumerateKeysAndObjectsUsingBlock:&v12];
    objc_msgSend(v6, "removeObjectsForKeys:", v9, v12, v13, v14, v15);
    if (![v6 count]) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
  else
  {
    v10 = [v6 entryDate];
    uint64_t v11 = [v10 compare:*(void *)(a1 + 32)];

    if (v11 == -1) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

void __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = [a3 entryDate];
  uint64_t v6 = [v5 compare:*(void *)(a1 + 32)];

  if (v6 == -1) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (id)getQueryForAggregateEntryKey:(id)a3 withMatchingKeyToValue:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v57 = self;
  v8 = [(PLStorageCache *)self getEntryFromDBForEntryKey:v6 withMatchingKeyToValue:v7];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [MEMORY[0x1E4F1CA48] array];
  if (v8)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:@"ID"];
  }
  else
  {
    uint64_t v11 = @"NULL";
  }
  [v9 addObject:@"ID"];
  v52 = v11;
  uint64_t v12 = [NSString stringWithFormat:@"%@", v11];
  [v10 addObject:v12];

  uint64_t v13 = [v7 allKeys];
  v14 = [v13 componentsJoinedByString:@", "];
  [v9 addObject:v14];

  v15 = [v7 allValues];
  id v16 = [v15 componentsJoinedByString:@", "];
  [v10 addObject:v16];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v17 = [(PLStorageCache *)v57 stagingAggregateEntryCache];
  v54 = v6;
  v18 = [v17 objectForKeyedSubscript:v6];
  v53 = v7;
  v19 = [v18 objectForKeyedSubscript:v7];
  v20 = [v19 allValues];

  unint64_t v21 = 0x1E4F29000uLL;
  id obj = v20;
  uint64_t v22 = [v20 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    unint64_t v24 = 0x1E6253000uLL;
    uint64_t v59 = *(void *)v64;
    v55 = v8;
    do
    {
      uint64_t v25 = 0;
      uint64_t v56 = v23;
      do
      {
        if (*(void *)v64 != v59) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v63 + 1) + 8 * v25);
        if ([*(id *)(v24 + 936) debugEnabled])
        {
          uint64_t v27 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __70__PLStorageCache_getQueryForAggregateEntryKey_withMatchingKeyToValue___block_invoke;
          block[3] = &unk_1E6253EC0;
          v61 = @"aggregate";
          uint64_t v62 = v27;
          if (getQueryForAggregateEntryKey_withMatchingKeyToValue__defaultOnce != -1) {
            dispatch_once(&getQueryForAggregateEntryKey_withMatchingKeyToValue__defaultOnce, block);
          }
          int v28 = getQueryForAggregateEntryKey_withMatchingKeyToValue__classDebugEnabled;

          if (v28)
          {
            v29 = v10;
            v30 = v9;
            [*(id *)(v21 + 24) stringWithFormat:@"aggregateEntry=%@", v26];
            v32 = unint64_t v31 = v21;
            v33 = [*(id *)(v31 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
            v34 = [v33 lastPathComponent];
            unint64_t v35 = v31;
            v36 = [*(id *)(v31 + 24) stringWithUTF8String:"-[PLStorageCache getQueryForAggregateEntryKey:withMatchingKeyToValue:]"];
            +[PLCoreStorage logMessage:v32 fromFile:v34 fromFunction:v36 fromLineNumber:791];

            v37 = PLLogCommon();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v68 = v32;
              _os_log_debug_impl(&dword_1BBD2F000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            id v9 = v30;
            v10 = v29;
            unint64_t v21 = v35;
            v8 = v55;
            uint64_t v23 = v56;
            unint64_t v24 = 0x1E6253000;
          }
        }
        if (v8)
        {
          v38 = [v26 aggregateKey];
          v39 = [v8 objectForKeyedSubscript:v38];

          if (v39)
          {
            v40 = [v26 aggregateKey];
            v41 = [v8 objectForKeyedSubscript:v40];
            [v41 doubleValue];
            objc_msgSend(v26, "updateWithValue:");
          }
        }
        v42 = [v26 aggregateKey];
        [v9 addObject:v42];

        v43 = *(void **)(v21 + 24);
        [v26 aggregateValue];
        v45 = objc_msgSend(v43, "stringWithFormat:", @"%f", v44);
        [v10 addObject:v45];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v23);
  }

  v46 = *(void **)(v21 + 24);
  [v9 componentsJoinedByString:@", "];
  v48 = v47 = v10;
  v49 = [v47 componentsJoinedByString:@", "];
  objc_msgSend(v46, "stringWithFormat:", @"                          INSERT OR REPLACE INTO '%@'                           (%@)                           VALUES (%@);",
    v54,
    v48,
  v50 = v49);

  return v50;
}

+ (id)sharedStorageCache
{
  if (sharedStorageCache_onceToken != -1) {
    dispatch_once(&sharedStorageCache_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedStorageCache_sharedStorageCache;
  return v2;
}

- (void)addToStagingAggregateEntryCache:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke;
    block[3] = &unk_1E6253EC0;
    v18 = @"aggregate";
    uint64_t v19 = v5;
    if (addToStagingAggregateEntryCache__defaultOnce != -1) {
      dispatch_once(&addToStagingAggregateEntryCache__defaultOnce, block);
    }
    int v6 = addToStagingAggregateEntryCache__classDebugEnabled;

    if (v6)
    {
      id v7 = [NSString stringWithFormat:@"aggregateEntry=%@", v4];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      id v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLStorageCache addToStagingAggregateEntryCache:]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:741];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v12 = [(PLStorageCache *)self stagingAggregateEntryCache];
  uint64_t v13 = [v4 entryKey];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_257;
  v15[3] = &unk_1E62539B8;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  +[PLStorageCache syncAndDispatchForEntryCache:v12 forEntryKey:v13 withBlock:v15];
}

void __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_257(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) stagingAggregateEntryCache];
  v3 = [*(id *)(a1 + 40) entryKey];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [*(id *)(a1 + 32) stagingAggregateEntryCache];
    int v6 = [*(id *)(a1 + 40) entryKey];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  id v7 = [*(id *)(a1 + 40) matchingKeyToValue];
  v8 = [v4 objectForKeyedSubscript:v7];

  if (!v8)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    id v9 = [*(id *)(a1 + 40) matchingKeyToValue];
    [v4 setObject:v8 forKeyedSubscript:v9];
  }
  v10 = [*(id *)(a1 + 40) aggregateKey];
  uint64_t v11 = [v8 objectForKeyedSubscript:v10];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_2;
    block[3] = &unk_1E6253EC0;
    v43 = @"aggregate";
    uint64_t v44 = v12;
    if (ArrayReserved_block_invoke_6_defaultOnce != -1) {
      dispatch_once(&ArrayReserved_block_invoke_6_defaultOnce, block);
    }
    int v13 = ArrayReserved_block_invoke_6_classDebugEnabled;

    if (v13)
    {
      id v14 = [NSString stringWithFormat:@"existingAggregateEntry=%@", v11];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      id v16 = [v15 lastPathComponent];
      id v17 = [NSString stringWithUTF8String:"-[PLStorageCache addToStagingAggregateEntryCache:]_block_invoke"];
      +[PLCoreStorage logMessage:v14 fromFile:v16 fromFunction:v17 fromLineNumber:758];

      v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  BOOL v19 = +[PLDefaults debugEnabled];
  if (v11)
  {
    if (v19)
    {
      uint64_t v20 = objc_opt_class();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_263;
      v39[3] = &unk_1E6253EC0;
      v40 = @"aggregate";
      uint64_t v41 = v20;
      if (ArrayReserved_block_invoke_6_defaultOnce_261 != -1) {
        dispatch_once(&ArrayReserved_block_invoke_6_defaultOnce_261, v39);
      }
      int v21 = ArrayReserved_block_invoke_6_classDebugEnabled_262;

      if (v21)
      {
        uint64_t v22 = [NSString stringWithFormat:@"hit"];
        uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        unint64_t v24 = [v23 lastPathComponent];
        uint64_t v25 = [NSString stringWithUTF8String:"-[PLStorageCache addToStagingAggregateEntryCache:]_block_invoke_2"];
        +[PLCoreStorage logMessage:v22 fromFile:v24 fromFunction:v25 fromLineNumber:762];

        v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    [*(id *)(a1 + 40) aggregateValue];
    objc_msgSend(v11, "updateWithValue:");
  }
  else
  {
    if (v19)
    {
      uint64_t v27 = objc_opt_class();
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_270;
      v36[3] = &unk_1E6253EC0;
      v37 = @"aggregate";
      uint64_t v38 = v27;
      if (ArrayReserved_block_invoke_6_defaultOnce_268 != -1) {
        dispatch_once(&ArrayReserved_block_invoke_6_defaultOnce_268, v36);
      }
      int v28 = ArrayReserved_block_invoke_6_classDebugEnabled_269;

      if (v28)
      {
        v29 = [NSString stringWithFormat:@"miss"];
        v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        unint64_t v31 = [v30 lastPathComponent];
        v32 = [NSString stringWithUTF8String:"-[PLStorageCache addToStagingAggregateEntryCache:]_block_invoke_2"];
        +[PLCoreStorage logMessage:v29 fromFile:v31 fromFunction:v32 fromLineNumber:767];

        v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    v34 = *(void **)(a1 + 40);
    unint64_t v35 = [v34 aggregateKey];
    [v8 setObject:v34 forKeyedSubscript:v35];
  }
}

- (NSMutableDictionary)stagingAggregateEntryCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

+ (void)syncAndDispatchForEntryCache:(id)a3 forEntryKey:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[PLCoreStorage storageQueueNameForEntryKey:a4];
  v10 = +[PLUtilities workQueueForKey:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PLStorageCache_syncAndDispatchForEntryCache_forEntryKey_withBlock___block_invoke;
  v13[3] = &unk_1E6253C90;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  +[PLUtilities dispatchSyncIfNotCallerQueue:v10 withBlock:v13];
}

void __69__PLStorageCache_syncAndDispatchForEntryCache_forEntryKey_withBlock___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_sync_exit(obj);
}

void __60__PLStorageCache_lastEntryCacheForEntryKey_withSubEntryKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lastEntryCache];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = +[PLEntryDefinition subEntryKeyKeyForEntryKey:*(void *)(a1 + 40)];
  if (v6)
  {
    id v11 = v6;
    id v7 = *(__CFString **)(a1 + 48);
    if (!v7) {
      id v7 = @"__LastEntry__";
    }
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    int v6 = v11;
  }
}

void __44__PLStorageCache_addToLastEntryCacheSubKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) subEntryKey];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) lastEntryCache];
    uint64_t v4 = [*(id *)(a1 + 32) entryKey];
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];

    if (!v5)
    {
      int v6 = objc_opt_new();
      id v7 = [*(id *)(a1 + 40) lastEntryCache];
      uint64_t v8 = [*(id *)(a1 + 32) entryKey];
      [v7 setObject:v6 forKeyedSubscript:v8];
    }
    uint64_t v9 = [*(id *)(a1 + 40) lastEntryCache];
    v10 = [*(id *)(a1 + 32) entryKey];
    id v11 = [v9 objectForKeyedSubscript:v10];
    id v12 = [*(id *)(a1 + 32) subEntryKey];
    int v13 = [v11 objectForKeyedSubscript:v12];

    uint64_t v14 = [v13 entryID];
    if (v14 <= [*(id *)(a1 + 32) entryID])
    {
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = [*(id *)(a1 + 40) lastEntryCache];
      id v17 = [*(id *)(a1 + 32) entryKey];
      v18 = [v16 objectForKeyedSubscript:v17];
      BOOL v19 = [*(id *)(a1 + 32) subEntryKey];
      [v18 setObject:v15 forKeyedSubscript:v19];

      uint64_t v20 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __44__PLStorageCache_addToLastEntryCacheSubKey___block_invoke_2;
      unint64_t v35 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v36 = v20;
      if (ArrayReserved_block_invoke_defaultOnce != -1) {
        dispatch_once(&ArrayReserved_block_invoke_defaultOnce, &block);
      }
      if (ArrayReserved_block_invoke_classDebugEnabled)
      {
        int v21 = [*(id *)(a1 + 32) entryKey];
        char v22 = [v21 isEqualToString:@"PLStorageOperator_EventPoint_PLLog"];

        if ((v22 & 1) == 0)
        {
          uint64_t v23 = NSString;
          unint64_t v24 = [*(id *)(a1 + 32) entryKey];
          uint64_t v25 = [*(id *)(a1 + 32) subEntryKey];
          uint64_t v26 = [*(id *)(a1 + 32) entryID];
          uint64_t v27 = [v23 stringWithFormat:@"LastEntryCache added %@.%@ %lld", v24, v25, v26, block, v33, v34, v35, v36];

          int v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
          v29 = [v28 lastPathComponent];
          v30 = [NSString stringWithUTF8String:"-[PLStorageCache addToLastEntryCacheSubKey:]_block_invoke"];
          +[PLCoreStorage logMessage:v27 fromFile:v29 fromFunction:v30 fromLineNumber:197];

          unint64_t v31 = PLLogCommon();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
    }
    if (!v13) {
      objc_msgSend(*(id *)(a1 + 40), "setLastEntryCacheSize:", objc_msgSend(*(id *)(a1 + 40), "lastEntryCacheSize") + 1);
    }
  }
}

void __38__PLStorageCache_addToLastEntryCache___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) subEntryKey];

  uint64_t v3 = [*(id *)(a1 + 40) lastEntryCache];
  uint64_t v4 = [*(id *)(a1 + 32) entryKey];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  int v6 = v5;
  if (v2)
  {

    if (!v6)
    {
      id v7 = objc_opt_new();
      uint64_t v8 = [*(id *)(a1 + 40) lastEntryCache];
      uint64_t v9 = [*(id *)(a1 + 32) entryKey];
      [v8 setObject:v7 forKeyedSubscript:v9];
    }
    v10 = [*(id *)(a1 + 40) lastEntryCache];
    id v11 = [*(id *)(a1 + 32) entryKey];
    id v12 = [v10 objectForKeyedSubscript:v11];
    int v6 = [v12 objectForKeyedSubscript:@"__LastEntry__"];

    uint64_t v13 = [v6 entryID];
    if (v13 <= [*(id *)(a1 + 32) entryID])
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [*(id *)(a1 + 40) lastEntryCache];
      id v16 = [*(id *)(a1 + 32) entryKey];
      id v17 = [v15 objectForKeyedSubscript:v16];
      [v17 setObject:v14 forKeyedSubscript:@"__LastEntry__"];

      uint64_t v18 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PLStorageCache_addToLastEntryCache___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v18;
      if (ArrayReserved_block_invoke_2_defaultOnce != -1) {
        dispatch_once(&ArrayReserved_block_invoke_2_defaultOnce, block);
      }
      if (ArrayReserved_block_invoke_2_classDebugEnabled)
      {
        BOOL v19 = [*(id *)(a1 + 32) entryKey];
        char v20 = [v19 isEqualToString:@"PLStorageOperator_EventPoint_PLLog"];

        if ((v20 & 1) == 0)
        {
          int v21 = NSString;
          char v22 = [*(id *)(a1 + 32) entryKey];
          uint64_t v23 = [v21 stringWithFormat:@"LastEntryCache added %@ %lld", v22, objc_msgSend(*(id *)(a1 + 32), "entryID")];

          unint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
          uint64_t v25 = [v24 lastPathComponent];
          uint64_t v26 = [NSString stringWithUTF8String:"-[PLStorageCache addToLastEntryCache:]_block_invoke"];
          +[PLCoreStorage logMessage:v23 fromFile:v25 fromFunction:v26 fromLineNumber:217];

          uint64_t v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
LABEL_18:
        }
      }
    }
  }
  else
  {

    uint64_t v28 = [v6 entryID];
    if (v28 <= [*(id *)(a1 + 32) entryID])
    {
      uint64_t v29 = *(void *)(a1 + 32);
      v30 = [*(id *)(a1 + 40) lastEntryCache];
      unint64_t v31 = [*(id *)(a1 + 32) entryKey];
      [v30 setObject:v29 forKeyedSubscript:v31];

      uint64_t v32 = objc_opt_class();
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      v43 = __38__PLStorageCache_addToLastEntryCache___block_invoke_87;
      uint64_t v44 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v45 = v32;
      if (ArrayReserved_block_invoke_2_defaultOnce_85 != -1) {
        dispatch_once(&ArrayReserved_block_invoke_2_defaultOnce_85, &v41);
      }
      if (ArrayReserved_block_invoke_2_classDebugEnabled_86)
      {
        uint64_t v33 = [*(id *)(a1 + 32) entryKey];
        char v34 = [v33 isEqualToString:@"PLStorageOperator_EventPoint_PLLog"];

        if ((v34 & 1) == 0)
        {
          unint64_t v35 = NSString;
          uint64_t v36 = [*(id *)(a1 + 32) entryKey];
          uint64_t v37 = [*(id *)(a1 + 32) entryID];
          uint64_t v23 = [v35 stringWithFormat:@"LastEntryCache added %@ %lld", v36, v37, v41, v42, v43, v44, v45];

          uint64_t v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
          v39 = [v38 lastPathComponent];
          v40 = [NSString stringWithUTF8String:"-[PLStorageCache addToLastEntryCache:]_block_invoke_2"];
          +[PLCoreStorage logMessage:v23 fromFile:v39 fromFunction:v40 fromLineNumber:228];

          uint64_t v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
          goto LABEL_18;
        }
      }
    }
  }
  if (!v6) {
    objc_msgSend(*(id *)(a1 + 40), "setLastEntryCacheSize:", objc_msgSend(*(id *)(a1 + 40), "lastEntryCacheSize") + 1);
  }
}

- (NSMutableDictionary)lastEntryCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

void __54__PLStorageCache_stagingEntryCacheForEntryKey_withID___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) stagingEntryCache];
  v2 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __41__PLStorageCache_addToStagingEntryCache___block_invoke_128(uint64_t a1)
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (ArrayReserved_block_invoke_3_defaultOnce != -1) {
      dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce, block);
    }
    if (ArrayReserved_block_invoke_3_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"inside syncAndDispatch: entry=%@", *(void *)(a1 + 40)];
      uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      uint64_t v5 = [v4 lastPathComponent];
      int v6 = [NSString stringWithUTF8String:"-[PLStorageCache addToStagingEntryCache:]_block_invoke"];
      +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:402];

      id v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke_134;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v8;
    if (ArrayReserved_block_invoke_3_defaultOnce_132 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce_132, v40);
    }
    if (ArrayReserved_block_invoke_3_classDebugEnabled_133)
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"before entryIDForNewEntry: entryBlock.entryID=%llu", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "entryID"));
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      id v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLStorageCache addToStagingEntryCache:]_block_invoke_2"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:405];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) entryID] <= 0) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setEntryID:", objc_msgSend(*(id *)(a1 + 32), "entryIDForNewEntry:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)));
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke_141;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v39[4] = v14;
    if (ArrayReserved_block_invoke_3_defaultOnce_139 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce_139, v39);
    }
    if (ArrayReserved_block_invoke_3_classDebugEnabled_140)
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"after entryIDForNewEntry: entryBlock.entryID=%llu", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "entryID"));
      id v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      id v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLStorageCache addToStagingEntryCache:]_block_invoke_2"];
      +[PLCoreStorage logMessage:v15 fromFile:v17 fromFunction:v18 fromLineNumber:409];

      BOOL v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  char v20 = *(void **)(a1 + 32);
  int v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) entryKey];
  char v22 = objc_msgSend(v20, "stagingEntryCacheForEntryKey:withID:", v21, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "entryID"));

  if (v22)
  {
    uint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) entryKey];
    char v24 = [v23 isEqualToString:@"PLStorageOperator_EventPoint_PLLog"];

    if ((v24 & 1) == 0 && +[PLDefaults debugEnabled])
    {
      uint64_t v25 = objc_opt_class();
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      uint64_t v36 = __41__PLStorageCache_addToStagingEntryCache___block_invoke_147;
      uint64_t v37 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v38 = v25;
      if (ArrayReserved_block_invoke_3_defaultOnce_145 != -1) {
        dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce_145, &v34);
      }
      if (ArrayReserved_block_invoke_3_classDebugEnabled_146)
      {
        uint64_t v26 = NSString;
        uint64_t v27 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) entryKey];
        uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) entryID];
        uint64_t v29 = [v26 stringWithFormat:@"addToStagingEntryCache:: entryKey=%@, entryID=%llu already exists in cache", v27, v28, v34, v35, v36, v37, v38];

        v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        unint64_t v31 = [v30 lastPathComponent];
        uint64_t v32 = [NSString stringWithUTF8String:"-[PLStorageCache addToStagingEntryCache:]_block_invoke_2"];
        +[PLCoreStorage logMessage:v29 fromFile:v31 fromFunction:v32 fromLineNumber:414];

        uint64_t v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) insertIntoStagingEntryCache:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) existsInDB] & 1) == 0)
    {
      [*(id *)(a1 + 32) addToLastEntryCache:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [*(id *)(a1 + 32) addToLastEntryCacheSubKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
  }
}

void __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_201(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2_202;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v4;
    if (ArrayReserved_block_invoke_5_defaultOnce != -1) {
      dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce, block);
    }
    if (ArrayReserved_block_invoke_5_classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"entry=%@", v3];
      int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke"];
      +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:593];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v10 = (void *)MEMORY[0x1C1869120]();
  if ([v3 existsInDB])
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    BOOL v11 = +[PLUtilities isPowerlogHelperd];
    BOOL v12 = +[PLDefaults debugEnabled];
    if (v11)
    {
      if (v12)
      {
        uint64_t v13 = objc_opt_class();
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_205;
        v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v51[4] = v13;
        if (ArrayReserved_block_invoke_5_defaultOnce_203 != -1) {
          dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_203, v51);
        }
        if (ArrayReserved_block_invoke_5_classDebugEnabled_204)
        {
          uint64_t v14 = [NSString stringWithFormat:@"powerlogHelperd update: %@", v3];
          uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
          id v16 = [v15 lastPathComponent];
          id v17 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2"];
          +[PLCoreStorage logMessage:v14 fromFile:v16 fromFunction:v17 fromLineNumber:599];

          uint64_t v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
    }
    else
    {
      if (v12)
      {
        uint64_t v32 = objc_opt_class();
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_211;
        v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v50[4] = v32;
        if (ArrayReserved_block_invoke_5_defaultOnce_209 != -1) {
          dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_209, v50);
        }
        if (ArrayReserved_block_invoke_5_classDebugEnabled_210)
        {
          uint64_t v33 = [NSString stringWithFormat:@"updateEntry: entry=%@", v3];
          uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
          uint64_t v35 = [v34 lastPathComponent];
          uint64_t v36 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2"];
          +[PLCoreStorage logMessage:v33 fromFile:v35 fromFunction:v36 fromLineNumber:601];

          uint64_t v37 = PLLogCommon();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      [*(id *)(a1 + 40) updateEntry:v3];
    }
  }
  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (*(__int16 *)(a1 + 96) >= 2)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
        uint64_t v19 = *(int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if (v19)
        {
          uint64_t v20 = *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + v19;
          if ([*(id *)(a1 + 48) count] != v20)
          {
            uint64_t v21 = *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
                + (uint64_t)*(int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            if (v21 != (unint64_t)[*(id *)(a1 + 48) count] >> 1)
            {
              objc_msgSend(*(id *)(a1 + 32), "setNextEntryIDForEntryKey:toEntryID:", *(void *)(a1 + 56), objc_msgSend(v3, "entryID"));
              objc_msgSend(*(id *)(a1 + 32), "setNextEntryIDForEntryKey:toEntryID:", *(void *)(a1 + 56), objc_msgSend(v3, "entryID"));
              goto LABEL_48;
            }
          }
        }
      }
      [*(id *)(a1 + 40) writeEntry:v3];
    }
    BOOL v22 = +[PLUtilities isPowerlogHelperd];
    BOOL v23 = +[PLDefaults debugEnabled];
    if (v22)
    {
      if (v23)
      {
        uint64_t v24 = objc_opt_class();
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_217;
        v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v49[4] = v24;
        if (ArrayReserved_block_invoke_5_defaultOnce_215 != -1) {
          dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_215, v49);
        }
        if (ArrayReserved_block_invoke_5_classDebugEnabled_216)
        {
          uint64_t v25 = [NSString stringWithFormat:@"powerlogHelperd: %@", v3];
          uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
          uint64_t v27 = [v26 lastPathComponent];
          uint64_t v28 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2"];
          +[PLCoreStorage logMessage:v25 fromFile:v27 fromFunction:v28 fromLineNumber:630];

          uint64_t v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      v30 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      unint64_t v31 = [v3 serialized];
      [v30 addObject:v31];
    }
    else
    {
      if (v23)
      {
        uint64_t v38 = objc_opt_class();
        uint64_t v44 = MEMORY[0x1E4F143A8];
        uint64_t v45 = 3221225472;
        v46 = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_223;
        v47 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v48 = v38;
        if (ArrayReserved_block_invoke_5_defaultOnce_221 != -1) {
          dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_221, &v44);
        }
        if (ArrayReserved_block_invoke_5_classDebugEnabled_222)
        {
          v39 = [NSString stringWithFormat:@"writeEntry: entry=%@", v3, v44, v45, v46, v47, v48];
          v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
          uint64_t v41 = [v40 lastPathComponent];
          uint64_t v42 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2"];
          +[PLCoreStorage logMessage:v39 fromFile:v41 fromFunction:v42 fromLineNumber:633];

          v43 = PLLogCommon();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      [*(id *)(a1 + 40) writeEntry:v3];
    }
  }
LABEL_48:
}

- (int64_t)entryIDForNewEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 entryKey];
  int v6 = [(PLStorageCache *)self lastEntryCacheForEntryKey:v5];

  id v7 = &off_1BBE12000;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLStorageCache_entryIDForNewEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v8;
    if (entryIDForNewEntry__defaultOnce != -1) {
      dispatch_once(&entryIDForNewEntry__defaultOnce, block);
    }
    if (entryIDForNewEntry__classDebugEnabled)
    {
      uint64_t v9 = [NSString stringWithFormat:@"lastEntry=%@", v6];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      BOOL v11 = [v10 lastPathComponent];
      BOOL v12 = [NSString stringWithUTF8String:"-[PLStorageCache entryIDForNewEntry:]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:367];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      id v7 = &off_1BBE12000;
    }
  }
  if (!v6)
  {
    BOOL v22 = NSString;
    BOOL v23 = [v4 entryKey];
    objc_msgSend(v22, "stringWithFormat:", @"SELECT seq + 1 AS nextSeq FROM SQLITE_SEQUENCE where name='%@';",
    uint64_t v24 = v23);

    uint64_t v25 = [v4 entryKey];
    uint64_t v26 = [(PLStorageCache *)self connectionForKey:v25];
    v57 = (void *)v24;
    uint64_t v21 = [v26 performQuery:v24];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v27 = objc_opt_class();
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __37__PLStorageCache_entryIDForNewEntry___block_invoke_100;
      v59[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v59[4] = v27;
      if (entryIDForNewEntry__defaultOnce_98 != -1) {
        dispatch_once(&entryIDForNewEntry__defaultOnce_98, v59);
      }
      if (entryIDForNewEntry__classDebugEnabled_99)
      {
        uint64_t v28 = [NSString stringWithFormat:@"result=%@", v21];
        uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        v30 = [v29 lastPathComponent];
        unint64_t v31 = [NSString stringWithUTF8String:"-[PLStorageCache entryIDForNewEntry:]"];
        +[PLCoreStorage logMessage:v28 fromFile:v30 fromFunction:v31 fromLineNumber:371];

        uint64_t v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    uint64_t v33 = [v21 lastObject];
    uint64_t v34 = [v33 objectForKeyedSubscript:@"nextSeq"];
    uint64_t v14 = [v34 longLongValue];

    if ((unint64_t)v14 <= 1 && +[PLDefaults debugEnabled])
    {
      uint64_t v35 = NSString;
      uint64_t v36 = [v4 entryKey];
      uint64_t v56 = [v35 stringWithFormat:@"failed entryID Query! %@ %@", v36, v21];

      uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      uint64_t v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLStorageCache entryIDForNewEntry:]"];
      +[PLCoreStorage logMessage:v56 fromFile:v38 fromFunction:v39 fromLineNumber:374];

      v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    goto LABEL_26;
  }
  uint64_t v14 = [v6 entryID] + 1;
  if ((unint64_t)v14 <= 1 && +[PLDefaults debugEnabled])
  {
    uint64_t v15 = NSString;
    id v16 = [v4 entryKey];
    uint64_t v17 = [v15 stringWithFormat:@"failed entryID cache! %@", v16];

    uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
    uint64_t v19 = [v18 lastPathComponent];
    uint64_t v20 = [NSString stringWithUTF8String:"-[PLStorageCache entryIDForNewEntry:]"];
    +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:378];

    uint64_t v21 = PLLogCommon();
    v57 = (void *)v17;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
    id v7 = &off_1BBE12000;
LABEL_26:
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v41 = objc_opt_class();
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = *((void *)v7 + 11);
    v58[2] = __37__PLStorageCache_entryIDForNewEntry___block_invoke_115;
    v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v58[4] = v41;
    if (entryIDForNewEntry__defaultOnce_113 != -1) {
      dispatch_once(&entryIDForNewEntry__defaultOnce_113, v58);
    }
    if (entryIDForNewEntry__classDebugEnabled_114)
    {
      uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"before MAX(): entryID=%llu", v14);
      v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      uint64_t v44 = [v43 lastPathComponent];
      uint64_t v45 = [NSString stringWithUTF8String:"-[PLStorageCache entryIDForNewEntry:]"];
      +[PLCoreStorage logMessage:v42 fromFile:v44 fromFunction:v45 fromLineNumber:381];

      v46 = PLLogCommon();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if (v14 <= 1 && +[PLDefaults debugEnabled])
  {
    v47 = NSString;
    uint64_t v48 = [v4 entryKey];
    v49 = [v47 stringWithFormat:@"EntryID is 1! %@", v48];

    v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
    v51 = [v50 lastPathComponent];
    v52 = [NSString stringWithUTF8String:"-[PLStorageCache entryIDForNewEntry:]"];
    +[PLCoreStorage logMessage:v49 fromFile:v51 fromFunction:v52 fromLineNumber:384];

    v53 = PLLogCommon();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  if (v14 <= 1) {
    int64_t v54 = 1;
  }
  else {
    int64_t v54 = v14;
  }

  return v54;
}

- (id)lastEntryCacheForEntryKey:(id)a3 withSubEntryKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v8 = [(PLStorageCache *)self lastEntryCache];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PLStorageCache_lastEntryCacheForEntryKey_withSubEntryKey___block_invoke;
  v13[3] = &unk_1E6253D30;
  id v16 = &v17;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  +[PLStorageCache syncAndDispatchForEntryCache:v8 forEntryKey:v9 withBlock:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)lastEntryCacheForEntryKey:(id)a3
{
  return [(PLStorageCache *)self lastEntryCacheForEntryKey:a3 withSubEntryKey:0];
}

- (void)addToLastEntryCacheSubKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLStorageCache *)self lastEntryCache];
  id v6 = [v4 entryKey];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PLStorageCache_addToLastEntryCacheSubKey___block_invoke;
  v8[3] = &unk_1E62539B8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  +[PLStorageCache syncAndDispatchForEntryCache:v5 forEntryKey:v6 withBlock:v8];
}

- (void)addToLastEntryCache:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLStorageCache *)self lastEntryCache];
  id v6 = [v4 entryKey];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PLStorageCache_addToLastEntryCache___block_invoke;
  v8[3] = &unk_1E62539B8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  +[PLStorageCache syncAndDispatchForEntryCache:v5 forEntryKey:v6 withBlock:v8];
}

- (id)stagingEntryCacheForEntryKey:(id)a3 withID:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  id v7 = [(PLStorageCache *)self stagingEntryCache];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__PLStorageCache_stagingEntryCacheForEntryKey_withID___block_invoke;
  v11[3] = &unk_1E6253D80;
  uint64_t v13 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  int64_t v14 = a4;
  +[PLStorageCache syncAndDispatchForEntryCache:v7 forEntryKey:v8 withBlock:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (int64_t)addToStagingEntryCache:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
LABEL_11:
    int64_t v9 = -1;
    goto LABEL_12;
  }
  if (([v4 writeToDB] & 1) == 0)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v10;
      if (addToStagingEntryCache__defaultOnce != -1) {
        dispatch_once(&addToStagingEntryCache__defaultOnce, block);
      }
      if (addToStagingEntryCache__classDebugEnabled)
      {
        id v11 = [NSString stringWithFormat:@"writeToDB=NO entry=%@", v5];
        id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        uint64_t v13 = [v12 lastPathComponent];
        int64_t v14 = [NSString stringWithUTF8String:"-[PLStorageCache addToStagingEntryCache:]"];
        +[PLCoreStorage logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:397];

        uint64_t v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    goto LABEL_11;
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  BOOL v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v6 = v5;
  id v25 = v6;
  id v7 = [(PLStorageCache *)self stagingEntryCache];
  id v8 = [(id)v21[5] entryKey];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke_128;
  v17[3] = &unk_1E62539E0;
  v17[4] = self;
  id v18 = v6;
  uint64_t v19 = &v20;
  +[PLStorageCache syncAndDispatchForEntryCache:v7 forEntryKey:v8 withBlock:v17];

  int64_t v9 = [(id)v21[5] entryID];
  _Block_object_dispose(&v20, 8);

LABEL_12:
  return v9;
}

- (void)insertIntoStagingEntryCache:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __46__PLStorageCache_insertIntoStagingEntryCache___block_invoke;
      v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v52[4] = v5;
      if (insertIntoStagingEntryCache__defaultOnce != -1) {
        dispatch_once(&insertIntoStagingEntryCache__defaultOnce, v52);
      }
      if (insertIntoStagingEntryCache__classDebugEnabled)
      {
        id v6 = [NSString stringWithFormat:@"entry=%@", v4];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        id v8 = [v7 lastPathComponent];
        int64_t v9 = [NSString stringWithUTF8String:"-[PLStorageCache insertIntoStagingEntryCache:]"];
        +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:436];

        uint64_t v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    id v11 = [(PLStorageCache *)self stagingEntryCache];
    id v12 = [v4 entryKey];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
      id v16 = [(PLStorageCache *)self stagingEntryCache];
      uint64_t v17 = [v4 entryKey];
      [v16 setObject:v15 forKeyedSubscript:v17];

      if (+[PLPlatform isiOS])
      {
        if (+[PLPlatform internalBuild])
        {
          id v18 = [(PLStorageCache *)self cacheContent];
          objc_sync_enter(v18);
          uint64_t v19 = [(PLStorageCache *)self cacheContent];
          uint64_t v20 = [v4 entryKey];
          [v19 setObject:&unk_1F1580600 forKeyedSubscript:v20];

          objc_sync_exit(v18);
        }
      }
    }
    uint64_t v21 = [(PLStorageCache *)self stagingEntryCache];
    uint64_t v22 = [v4 entryKey];
    BOOL v23 = [v21 objectForKeyedSubscript:v22];
    uint64_t v24 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "entryID"));
    [v23 setObject:v4 forKeyedSubscript:v24];

    [(PLStorageCache *)self setStagingEntryCacheSize:[(PLStorageCache *)self stagingEntryCacheSize] + 1];
    if (+[PLPlatform isiOS]
      && +[PLPlatform internalBuild])
    {
      id v25 = [(PLStorageCache *)self cacheContent];
      objc_sync_enter(v25);
      uint64_t v26 = [(PLStorageCache *)self cacheContent];
      uint64_t v27 = [v4 entryKey];
      uint64_t v28 = [v26 objectForKeyedSubscript:v27];
      int v29 = [v28 intValue];

      int v30 = v29 + 1;
      unint64_t v31 = [NSNumber numberWithInt:(v29 + 1)];
      uint64_t v32 = [(PLStorageCache *)self cacheContent];
      uint64_t v33 = [v4 entryKey];
      [v32 setObject:v31 forKeyedSubscript:v33];

      uint64_t v34 = PLLogCommon();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = [v4 entryKey];
        -[PLStorageCache insertIntoStagingEntryCache:](v35, buf, v30, v34);
      }

      objc_sync_exit(v25);
    }
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    v49 = __46__PLStorageCache_insertIntoStagingEntryCache___block_invoke_160;
    v50 = &unk_1E62538C8;
    v51 = @"PLStorageCache_Debug";
    if (insertIntoStagingEntryCache__defaultOnce_159 != -1) {
      dispatch_once(&insertIntoStagingEntryCache__defaultOnce_159, &block);
    }
    BOOL v36 = insertIntoStagingEntryCache__objectForKey == 0;

    if (!v36)
    {
      uint64_t v37 = [v4 entryKey];
      char v38 = [v37 isEqualToString:@"PLStorageOperator_EventPoint_PLLog"];

      if ((v38 & 1) == 0)
      {
        v39 = NSString;
        v40 = [v4 entryKey];
        uint64_t v41 = [v4 entryID];
        uint64_t v42 = [v39 stringWithFormat:@"stagingCache added %@ %lld", v40, v41, block, v48, v49, v50];

        v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        uint64_t v44 = [v43 lastPathComponent];
        uint64_t v45 = [NSString stringWithUTF8String:"-[PLStorageCache insertIntoStagingEntryCache:]"];
        +[PLCoreStorage logMessage:v42 fromFile:v44 fromFunction:v45 fromLineNumber:461];

        v46 = PLLogCommon();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
  }
}

- (NSMutableDictionary)stagingEntryCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)stagingEntryCacheSize
{
  return self->_stagingEntryCacheSize;
}

- (void)setStagingEntryCacheSize:(int64_t)a3
{
  self->_stagingEntryCacheSize = a3;
}

void __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke_169(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) stagingEntryCache];
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) entryKey];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "entryID"));
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    [v8 insertIntoStagingEntryCache:v9];
  }
}

- (void)setLastEntryCacheSize:(int64_t)a3
{
  self->_lastEntryCacheSize = a3;
}

- (int64_t)lastEntryCacheSize
{
  return self->_lastEntryCacheSize;
}

- (void)lastEntryCachePruneToDate:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (lastEntryCachePruneToDate__defaultOnce != -1) {
      dispatch_once(&lastEntryCachePruneToDate__defaultOnce, block);
    }
    if (lastEntryCachePruneToDate__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"begin: date=%@", v4];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      id v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLStorageCache lastEntryCachePruneToDate:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:158];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v11 = [(PLStorageCache *)self lastEntryCache];
  objc_sync_enter(v11);
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_64;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v12;
    if (lastEntryCachePruneToDate__defaultOnce_62 != -1) {
      dispatch_once(&lastEntryCachePruneToDate__defaultOnce_62, v26);
    }
    if (lastEntryCachePruneToDate__classDebugEnabled_63)
    {
      uint64_t v13 = [NSString stringWithFormat:@"in @synchronized: date=%@", v4];
      BOOL v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      uint64_t v15 = [v14 lastPathComponent];
      id v16 = [NSString stringWithUTF8String:"-[PLStorageCache lastEntryCachePruneToDate:]"];
      +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:161];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v18 = objc_opt_new();
  uint64_t v19 = [(PLStorageCache *)self lastEntryCache];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_69;
  v23[3] = &unk_1E6253D08;
  id v20 = v4;
  id v24 = v20;
  id v21 = v18;
  id v25 = v21;
  [v19 enumerateKeysAndObjectsUsingBlock:v23];

  uint64_t v22 = [(PLStorageCache *)self lastEntryCache];
  [v22 removeObjectsForKeys:v21];

  objc_sync_exit(v11);
}

- (void)flushStagingAggregateEntryCacheToDatabase
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id obj = [(PLStorageCache *)self stagingAggregateEntryCache];
  objc_sync_enter(obj);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v2 = [(PLStorageCache *)self stagingAggregateEntryCache];
  id v3 = [v2 allKeys];

  id v29 = v3;
  uint64_t v31 = [v3 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v48;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v48 != v30) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(void *)(*((void *)&v47 + 1) + 8 * v32);
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v4 = objc_opt_class();
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __59__PLStorageCache_flushStagingAggregateEntryCacheToDatabase__block_invoke;
          v44[3] = &unk_1E6253EC0;
          uint64_t v45 = @"aggregate";
          uint64_t v46 = v4;
          if (flushStagingAggregateEntryCacheToDatabase_defaultOnce != -1) {
            dispatch_once(&flushStagingAggregateEntryCacheToDatabase_defaultOnce, v44);
          }
          BOOL v5 = flushStagingAggregateEntryCacheToDatabase_classDebugEnabled == 0;

          if (!v5)
          {
            id v6 = [NSString stringWithFormat:@"entryKey=%@", v35];
            id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
            id v8 = [v7 lastPathComponent];
            uint64_t v9 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingAggregateEntryCacheToDatabase]"];
            +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:725];

            uint64_t v10 = PLLogCommon();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v6;
              _os_log_debug_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        uint64_t v34 = [(PLStorageCache *)self connectionForKey:v35];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v11 = [(PLStorageCache *)self stagingAggregateEntryCache];
        uint64_t v12 = [v11 objectForKeyedSubscript:v35];
        id v33 = [v12 allKeys];

        uint64_t v13 = [v33 countByEnumeratingWithState:&v40 objects:v51 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v41;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v41 != v14) {
                objc_enumerationMutation(v33);
              }
              uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * v15);
              uint64_t v17 = (void *)MEMORY[0x1C1869120]();
              if (+[PLDefaults debugEnabled])
              {
                uint64_t v18 = objc_opt_class();
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __59__PLStorageCache_flushStagingAggregateEntryCacheToDatabase__block_invoke_250;
                block[3] = &unk_1E6253EC0;
                char v38 = @"aggregate";
                uint64_t v39 = v18;
                if (flushStagingAggregateEntryCacheToDatabase_defaultOnce_248 != -1) {
                  dispatch_once(&flushStagingAggregateEntryCacheToDatabase_defaultOnce_248, block);
                }
                BOOL v19 = flushStagingAggregateEntryCacheToDatabase_classDebugEnabled_249 == 0;

                if (!v19)
                {
                  id v20 = [NSString stringWithFormat:@"matchingKeyToValue=%@", v16];
                  id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
                  uint64_t v22 = [v21 lastPathComponent];
                  BOOL v23 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingAggregateEntryCacheToDatabase]"];
                  +[PLCoreStorage logMessage:v20 fromFile:v22 fromFunction:v23 fromLineNumber:730];

                  id v24 = PLLogCommon();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v53 = v20;
                    _os_log_debug_impl(&dword_1BBD2F000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }
                }
              }
              id v25 = [(PLStorageCache *)self getQueryForAggregateEntryKey:v35 withMatchingKeyToValue:v16];
              id v26 = (id)[v34 performQuery:v25];

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v33 countByEnumeratingWithState:&v40 objects:v51 count:16];
          }
          while (v13);
        }

        uint64_t v27 = [(PLStorageCache *)self stagingAggregateEntryCache];
        [v27 removeObjectForKey:v35];

        ++v32;
      }
      while (v32 != v31);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v31);
  }

  objc_sync_exit(obj);
}

- (id)getEntryFromDBForEntryKey:(id)a3 withMatchingKeyToValue:(id)a4
{
  id v6 = a3;
  id v7 = [(PLStorageCache *)self matchingPairs:a4];
  id v8 = [NSString stringWithFormat:@"SELECT * FROM '%@' WHERE %@", v6, v7];
  uint64_t v9 = [(PLStorageCache *)self connectionForKey:v6];
  uint64_t v10 = [v9 performQuery:v8];

  if ([v10 count] == 1)
  {
    id v11 = [v10 firstObject];
    uint64_t v12 = +[PLEntry entryWithEntryKey:v6 withData:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)matchingPairs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = NSString;
        uint64_t v12 = [v5 objectForKeyedSubscript:v10];
        uint64_t v13 = [v11 stringWithFormat:@"%@=%@", v10, v12, (void)v16];
        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [v4 componentsJoinedByString:@" AND "];

  return v14;
}

void __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v114[7] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  context = (void *)MEMORY[0x1C1869120]();
  uint64_t v85 = a1;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_3;
    v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v112[4] = v7;
    if (ArrayReserved_block_invoke_4_defaultOnce != -1) {
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce, v112);
    }
    if (ArrayReserved_block_invoke_4_classDebugEnabled)
    {
      uint64_t v8 = [NSString stringWithFormat:@"entryKey=%@", v5];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      uint64_t v10 = [v9 lastPathComponent];
      id v11 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2"];
      +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:534];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v13 = (id *)(a1 + 32);
  v83 = [v14 connectionForKey:v5];
  uint64_t v15 = [*v13 countWarnings];
  long long v16 = [v15 objectForKeyedSubscript:v5];
  int v17 = [v16 intValue];

  int v18 = [*v13 limitOfType:@"WarningLimit" forEntryKey:v5];
  int v19 = v18;
  if (!*(unsigned char *)(*(void *)(*(void *)(v85 + 40) + 8) + 24))
  {
    unsigned __int16 v33 = 4 * (v17 >= v18);
    goto LABEL_35;
  }
  unint64_t v20 = [v6 count];
  double v21 = *(double *)(*(void *)(*(void *)(v85 + 48) + 8) + 24);
  int v22 = [*(id *)(v85 + 32) limitOfType:@"RateLimit" forEntryKey:v5];
  BOOL v23 = [*(id *)(v85 + 32) countSafetyDrop];
  id v24 = [v23 objectForKeyedSubscript:v5];
  int v25 = [v24 intValue];

  int v26 = [*(id *)(v85 + 32) limitOfType:@"SafetyDropLimit" forEntryKey:v5];
  if ((double)v20 / v21 > (double)v22)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v27 = objc_opt_class();
      v111[0] = MEMORY[0x1E4F143A8];
      v111[1] = 3221225472;
      v111[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_185;
      v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v111[4] = v27;
      if (ArrayReserved_block_invoke_4_defaultOnce_183 != -1) {
        dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_183, v111);
      }
      if (ArrayReserved_block_invoke_4_classDebugEnabled_184)
      {
        uint64_t v28 = [NSString stringWithFormat:@"rate exceeds threshold"];
        id v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        uint64_t v30 = [v29 lastPathComponent];
        uint64_t v31 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2"];
        +[PLCoreStorage logMessage:v28 fromFile:v30 fromFunction:v31 fromLineNumber:552];

        uint64_t v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if (v17 < v19) {
      unsigned __int16 v33 = 1;
    }
    else {
      unsigned __int16 v33 = 2;
    }
    uint64_t v34 = [NSNumber numberWithInt:(v17 + 1)];
    uint64_t v35 = [*(id *)(v85 + 32) countWarnings];
    [v35 setObject:v34 forKeyedSubscript:v5];

    BOOL v36 = [*(id *)(v85 + 32) countSafetyDrop];
    [v36 removeObjectForKey:v5];

    goto LABEL_35;
  }
  int v37 = v26;
  char v38 = [*(id *)(v85 + 32) countWarnings];
  uint64_t v39 = [v38 objectForKeyedSubscript:v5];
  if (!v39 || v17 <= v19)
  {

    goto LABEL_34;
  }

  if (v25 >= v37)
  {
LABEL_34:
    long long v48 = [*(id *)(v85 + 32) countWarnings];
    [v48 removeObjectForKey:v5];

    long long v49 = [*(id *)(v85 + 32) countSafetyDrop];
    [v49 removeObjectForKey:v5];

    unsigned __int16 v33 = 0;
    goto LABEL_35;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v40 = objc_opt_class();
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_191;
    v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v110[4] = v40;
    if (ArrayReserved_block_invoke_4_defaultOnce_189 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_189, v110);
    }
    if (ArrayReserved_block_invoke_4_classDebugEnabled_190)
    {
      long long v41 = [NSString stringWithFormat:@"safety drop"];
      long long v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      long long v43 = [v42 lastPathComponent];
      uint64_t v44 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2"];
      +[PLCoreStorage logMessage:v41 fromFile:v43 fromFunction:v44 fromLineNumber:570];

      uint64_t v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v46 = [NSNumber numberWithInt:(v25 + 1)];
  long long v47 = [*(id *)(v85 + 32) countSafetyDrop];
  [v47 setObject:v46 forKeyedSubscript:v5];

  unsigned __int16 v33 = 3;
LABEL_35:
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v50 = objc_opt_class();
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_197;
    v109[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v109[4] = v50;
    if (ArrayReserved_block_invoke_4_defaultOnce_195 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_195, v109);
    }
    if (ArrayReserved_block_invoke_4_classDebugEnabled_196)
    {
      v51 = objc_msgSend(NSString, "stringWithFormat:", @"state=%i", v33);
      v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      v53 = [v52 lastPathComponent];
      uint64_t v54 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2"];
      +[PLCoreStorage logMessage:v51 fromFile:v53 fromFunction:v54 fromLineNumber:587];

      uint64_t v55 = PLLogCommon();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x2020000000;
  int v108 = 0;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  int v104 = 0;
  uint64_t v56 = *(void **)(v85 + 32);
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_201;
  v92[3] = &unk_1E6253E98;
  v92[4] = v56;
  v96 = &v101;
  id v57 = v83;
  id v93 = v57;
  unsigned __int16 v100 = v33;
  uint64_t v58 = *(void *)(v85 + 40);
  v97 = &v105;
  uint64_t v98 = v58;
  id v59 = v6;
  id v94 = v59;
  id v60 = v5;
  uint64_t v61 = *(void *)(v85 + 56);
  id v95 = v60;
  uint64_t v99 = v61;
  [v56 enumerateEntryCache:v59 withBlock:v92];
  uint64_t v62 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_233;
  block[3] = &unk_1E6253EC0;
  v90 = @"LogCacheSize";
  uint64_t v91 = v62;
  if (ArrayReserved_block_invoke_4_defaultOnce_231 != -1) {
    dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_231, block);
  }
  BOOL v63 = ArrayReserved_block_invoke_4_classDebugEnabled_232 == 0;

  if (!v63)
  {
    uint64_t v64 = objc_opt_class();
    long long v65 = @"RateLimit";
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2_237;
    v86[3] = &unk_1E6253EC0;
    v87 = v65;
    uint64_t v88 = v64;
    if (ArrayReserved_block_invoke_4_defaultOnce_235 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_235, v86);
    }
    BOOL v66 = ArrayReserved_block_invoke_4_classDebugEnabled_236 != 0;

    BOOL v67 = !v66;
    if (v33 >= 2u) {
      BOOL v67 = 0;
    }
    if (!v67)
    {
      v68 = [*(id *)(v85 + 32) countWarnings];
      v69 = [v68 objectForKeyedSubscript:v60];
      uint64_t v70 = [v69 intValue];

      v71 = [*(id *)(v85 + 32) countSafetyDrop];
      v72 = [v71 objectForKeyedSubscript:v60];
      uint64_t v73 = [v72 intValue];

      uint64_t v74 = *(void *)(*(void *)(*(void *)(v85 + 64) + 8) + 40);
      v113[0] = @"timestampEnd";
      v113[1] = @"EntryKey";
      v114[0] = v74;
      v114[1] = v60;
      v113[2] = @"InsertCount";
      v84 = [NSNumber numberWithInt:*((unsigned int *)v106 + 6)];
      v114[2] = v84;
      v113[3] = @"UpdateCount";
      v75 = [NSNumber numberWithInt:*((unsigned int *)v102 + 6)];
      v114[3] = v75;
      v113[4] = @"State";
      v76 = [NSNumber numberWithShort:(__int16)v33];
      v114[4] = v76;
      v113[5] = @"WarningCount";
      v77 = [NSNumber numberWithInt:v70];
      v114[5] = v77;
      v113[6] = @"SafetyDropCount";
      v78 = [NSNumber numberWithInt:v73];
      v114[6] = v78;
      v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:7];
      v80 = [*(id *)(v85 + 32) lastCacheFlushDate];
      v81 = +[PLStorageOperator eventIntervalCacheSizeWithPayload:v79 withEntryDate:v80];

      [v81 setEntryID:0x8000000000000000];
      [v57 writeEntry:v81];
    }
  }

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);
}

- (NSMutableDictionary)countWarnings
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (int)limitOfType:(id)a3 forEntryKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[PLDefaults objectForKey:v6];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v7 objectForKeyedSubscript:v5],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:v5];
    int v10 = [v9 intValue];
  }
  else
  {
    int v10 = +[PLEntryDefinition limitOfType:v5 forEntryKey:v6];
  }

  return v10;
}

- (id)connectionForKey:(id)a3
{
  id v3 = a3;
  if (+[PPSEntryKey PPSEnabled:v3])
  {
    uint64_t v4 = +[PPSCoreStorage sharedSQLStorage];
    id v5 = [v4 connectionForKey:v3];
  }
  else
  {
    id v5 = +[PLSQLiteConnection sharedSQLiteConnection];
  }

  return v5;
}

- (NSMutableDictionary)countSafetyDrop
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)enumerateEntryCache:(id)a3 withBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  unsigned __int8 v20 = 0;
  uint64_t v7 = [v5 allKeys];
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * v13), (void)v16);
      v6[2](v6, v14, &v20);
      int v15 = v20;

      if (v15) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)updateStagingEntryCacheWithEntry:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v8;
      if (updateStagingEntryCacheWithEntry_withBlock__defaultOnce != -1) {
        dispatch_once(&updateStagingEntryCacheWithEntry_withBlock__defaultOnce, block);
      }
      if (updateStagingEntryCacheWithEntry_withBlock__classDebugEnabled)
      {
        id v9 = [NSString stringWithFormat:@"entry=%@", v6];
        uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        uint64_t v11 = [v10 lastPathComponent];
        uint64_t v12 = [NSString stringWithUTF8String:"-[PLStorageCache updateStagingEntryCacheWithEntry:withBlock:]"];
        +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:468];

        uint64_t v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if ([v6 writeToDB])
    {
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__3;
      v26[4] = __Block_byref_object_dispose__3;
      id v14 = v6;
      id v27 = v14;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = __Block_byref_object_copy__167;
      v24[4] = __Block_byref_object_dispose__168;
      id v25 = (id)MEMORY[0x1C1869370](v7);
      int v15 = [(PLStorageCache *)self stagingEntryCache];
      long long v16 = [v14 entryKey];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke_169;
      v23[3] = &unk_1E6253E48;
      void v23[4] = self;
      v23[5] = v24;
      v23[6] = v26;
      +[PLStorageCache syncAndDispatchForEntryCache:v15 forEntryKey:v16 withBlock:v23];

      _Block_object_dispose(v24, 8);
      _Block_object_dispose(v26, 8);
    }
    else if (+[PLDefaults debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke_166;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v17;
      if (updateStagingEntryCacheWithEntry_withBlock__defaultOnce_164 != -1) {
        dispatch_once(&updateStagingEntryCacheWithEntry_withBlock__defaultOnce_164, v28);
      }
      if (updateStagingEntryCacheWithEntry_withBlock__classDebugEnabled_165)
      {
        long long v18 = [NSString stringWithFormat:@"writeToDB=NO entry=%@", v6];
        long long v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
        unsigned __int8 v20 = [v19 lastPathComponent];
        double v21 = [NSString stringWithUTF8String:"-[PLStorageCache updateStagingEntryCacheWithEntry:withBlock:]"];
        +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:471];

        uint64_t v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
  }
}

- (void)flushStagingEntryCacheToDatabase
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke;
    v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v71[4] = v3;
    if (flushStagingEntryCacheToDatabase_defaultOnce != -1) {
      dispatch_once(&flushStagingEntryCacheToDatabase_defaultOnce, v71);
    }
    if (flushStagingEntryCacheToDatabase_classDebugEnabled)
    {
      uint64_t v4 = [NSString stringWithFormat:@"flushStagingEntryCacheToDatabase: start"];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:518];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v65 = 0;
  BOOL v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__3;
  v69 = __Block_byref_object_dispose__3;
  id v70 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  uint64_t v64 = 0;
  id v9 = (void *)v66[5];
  uint64_t v10 = [(PLStorageCache *)self lastCacheFlushDate];
  [v9 timeIntervalSinceDate:v10];
  uint64_t v12 = v11;

  uint64_t v64 = v12;
  uint64_t v59 = 0;
  id v60 = &v59;
  uint64_t v61 = 0x2020000000;
  BOOL v62 = 0;
  int64_t v13 = [(PLStorageCache *)self stagingEntryCacheSize];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_179;
  block[3] = &unk_1E6253E70;
  id v57 = @"MinCacheSizeLimit";
  uint64_t v58 = 200;
  if (flushStagingEntryCacheToDatabase_defaultOnce_178 != -1) {
    dispatch_once(&flushStagingEntryCacheToDatabase_defaultOnce_178, block);
  }
  uint64_t v14 = flushStagingEntryCacheToDatabase_objectForKey;

  BOOL v62 = v13 >= v14;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__3;
  uint64_t v54 = __Block_byref_object_dispose__3;
  id v55 = 0;
  if (+[PLUtilities isPowerlogHelperd])
  {
    uint64_t v15 = objc_opt_new();
    long long v16 = (void *)v51[5];
    void v51[5] = v15;
  }
  id v42 = [(PLStorageCache *)self stagingEntryCache];
  objc_sync_enter(v42);
  uint64_t v17 = [(PLStorageCache *)self stagingEntryCache];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2;
  v49[3] = &unk_1E6253EE8;
  v49[4] = self;
  void v49[5] = &v59;
  v49[6] = v63;
  v49[7] = &v50;
  v49[8] = &v65;
  [v17 enumerateKeysAndObjectsUsingBlock:v49];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v18 = [(PLStorageCache *)self countWarnings];
  id obj = [v18 allKeys];

  uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v72 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        BOOL v23 = [(PLStorageCache *)self stagingEntryCache];
        id v24 = [v23 objectForKeyedSubscript:v22];

        if (!v24)
        {
          id v25 = [(PLStorageCache *)self countWarnings];
          int v26 = [v25 objectForKeyedSubscript:v22];
          int v27 = [v26 intValue];

          LODWORD(v25) = [(PLStorageCache *)self limitOfType:@"WarningLimit" forEntryKey:v22];
          uint64_t v28 = [(PLStorageCache *)self countSafetyDrop];
          id v29 = [v28 objectForKeyedSubscript:v22];
          int v30 = [v29 intValue];

          int v31 = [(PLStorageCache *)self limitOfType:@"SafetyDropLimit" forEntryKey:v22];
          if (v27 >= (int)v25)
          {
            if (v30 < v31)
            {
              if (!*((unsigned char *)v60 + 24)) {
                continue;
              }
              uint64_t v32 = [NSNumber numberWithInt:(v30 + 1)];
              unsigned __int16 v33 = [(PLStorageCache *)self countSafetyDrop];
              [v33 setObject:v32 forKeyedSubscript:v22];

              goto LABEL_24;
            }
            if (!*((unsigned char *)v60 + 24)) {
              continue;
            }
          }
          uint64_t v34 = [(PLStorageCache *)self countSafetyDrop];
          [v34 removeObjectForKey:v22];

          uint64_t v32 = [(PLStorageCache *)self countWarnings];
          [v32 removeObjectForKey:v22];
LABEL_24:

          continue;
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v72 count:16];
    }
    while (v19);
  }

  uint64_t v35 = [(PLStorageCache *)self stagingEntryCache];
  [v35 removeAllObjects];

  [(PLStorageCache *)self setStagingEntryCacheSize:0];
  objc_sync_exit(v42);

  [(PLStorageCache *)self setLastCacheFlushDate:v66[5]];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v36 = objc_opt_class();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_3_241;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v44[4] = v36;
    if (flushStagingEntryCacheToDatabase_defaultOnce_239 != -1) {
      dispatch_once(&flushStagingEntryCacheToDatabase_defaultOnce_239, v44);
    }
    if (flushStagingEntryCacheToDatabase_classDebugEnabled_240)
    {
      int v37 = [NSString stringWithFormat:@"flushStagingEntryCacheToDatabase: end"];
      char v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      uint64_t v39 = [v38 lastPathComponent];
      uint64_t v40 = [NSString stringWithUTF8String:"-[PLStorageCache flushStagingEntryCacheToDatabase]"];
      +[PLCoreStorage logMessage:v37 fromFile:v39 fromFunction:v40 fromLineNumber:709];

      long long v41 = PLLogCommon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(&v65, 8);
}

- (NSDate)lastCacheFlushDate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  lastCacheFlushDate = v2->_lastCacheFlushDate;
  if (!lastCacheFlushDate)
  {
    uint64_t v4 = +[PowerlogCore sharedCore];
    uint64_t v5 = [v4 launchDate];
    id v6 = v2->_lastCacheFlushDate;
    v2->_lastCacheFlushDate = (NSDate *)v5;

    lastCacheFlushDate = v2->_lastCacheFlushDate;
  }
  id v7 = lastCacheFlushDate;
  objc_sync_exit(v2);

  return v7;
}

- (void)setLastCacheFlushDate:(id)a3
{
  uint64_t v4 = (NSDate *)a3;
  id obj = self;
  objc_sync_enter(obj);
  lastCacheFlushDate = obj->_lastCacheFlushDate;
  obj->_lastCacheFlushDate = v4;

  objc_sync_exit(obj);
}

uint64_t __36__PLStorageCache_sharedStorageCache__block_invoke()
{
  sharedStorageCache_sharedStorageCache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (PLStorageCache)init
{
  v16.receiver = self;
  v16.super_class = (Class)PLStorageCache;
  uint64_t v2 = [(PLStorageCache *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cacheContent = v2->_cacheContent;
    v2->_cacheContent = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    lastEntryCache = v2->_lastEntryCache;
    v2->_lastEntryCache = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    stagingEntryCache = v2->_stagingEntryCache;
    v2->_stagingEntryCache = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    stagingAggregateEntryCache = v2->_stagingAggregateEntryCache;
    v2->_stagingAggregateEntryCache = (NSMutableDictionary *)v9;

    v2->_lastEntryCacheSize = 0;
    v2->_stagingEntryCacheSize = 0;
    uint64_t v11 = objc_opt_new();
    countWarnings = v2->_countWarnings;
    v2->_countWarnings = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    countSafetyDrop = v2->_countSafetyDrop;
    v2->_countSafetyDrop = (NSMutableDictionary *)v13;
  }
  return v2;
}

- (void)logSizeOfStagingEntryCache
{
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"stagingEntryCacheSize=%ld", -[PLStorageCache stagingEntryCacheSize](self, "stagingEntryCacheSize"));
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
  uint64_t v5 = [v4 lastPathComponent];
  id v6 = [NSString stringWithUTF8String:"-[PLStorageCache logSizeOfStagingEntryCache]"];
  +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:74];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
  }

  uint64_t v8 = [(PLStorageCache *)self stagingEntryCache];
  [(PLStorageCache *)self logSizeOfEntryCache:v8];
}

- (void)logSizeOfLastEntryCache
{
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"lastEntryCacheSize=%ld", -[PLStorageCache lastEntryCacheSize](self, "lastEntryCacheSize"));
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
  uint64_t v5 = [v4 lastPathComponent];
  id v6 = [NSString stringWithUTF8String:"-[PLStorageCache logSizeOfLastEntryCache]"];
  +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:79];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
  }

  uint64_t v8 = [(PLStorageCache *)self lastEntryCache];
  [(PLStorageCache *)self logSizeOfEntryCache:v8];
}

- (void)logFullLastEntryCacheForEntryKey:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = [(PLStorageCache *)self lastEntryCache];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  uint64_t v8 = [v4 stringWithFormat:@"%@", v7];

  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
  uint64_t v10 = [v9 lastPathComponent];
  uint64_t v11 = [NSString stringWithUTF8String:"-[PLStorageCache logFullLastEntryCacheForEntryKey:]"];
  +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:84];

  uint64_t v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
  }
}

- (void)logStagingEntryCacheForEntryKey:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = [(PLStorageCache *)self stagingEntryCache];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  uint64_t v8 = [v4 stringWithFormat:@"%@", v7];

  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
  uint64_t v10 = [v9 lastPathComponent];
  uint64_t v11 = [NSString stringWithUTF8String:"-[PLStorageCache logStagingEntryCacheForEntryKey:]"];
  +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:88];

  uint64_t v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
  }
}

- (void)dumpStagingEntryCache
{
  id v3 = [(PLStorageCache *)self stagingEntryCache];
  [(PLStorageCache *)self dumpEntryCache:v3];
}

- (void)dumpLastEntryCache
{
  id v3 = [(PLStorageCache *)self lastEntryCache];
  [(PLStorageCache *)self dumpEntryCache:v3];
}

- (void)logSizeOfEntryCache:(id)a3
{
  id v3 = a3;
  objc_sync_enter(v3);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  long long v18 = __Block_byref_object_dispose__3;
  id v19 = (id)objc_opt_new();
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PLStorageCache_logSizeOfEntryCache___block_invoke;
  v9[3] = &unk_1E6253CB8;
  v9[4] = &v14;
  v9[5] = &v10;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];
  objc_msgSend((id)v15[5], "appendFormat:", @"-----\ntotalCount %ld", v11[3]);
  uint64_t v4 = [NSString stringWithFormat:@"tempStorage count:\n%@", v15[5]];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
  id v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLStorageCache logSizeOfEntryCache:]"];
  +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:114];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  objc_sync_exit(v3);
}

void __38__PLStorageCache_logSizeOfEntryCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    uint64_t v6 = [v5 count];
  }
  else {
    uint64_t v6 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendFormat:@"%@ %ld\n", v7, v6];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v6;
}

- (void)dumpEntryCache:(id)a3
{
  id v4 = a3;
  [(PLStorageCache *)self logSizeOfEntryCache:v4];
  id v5 = [NSString stringWithFormat:@"EntryCache DUMP!"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
  id v7 = [v6 lastPathComponent];
  uint64_t v8 = [NSString stringWithUTF8String:"-[PLStorageCache dumpEntryCache:]"];
  +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:120];

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
  }

  id v10 = v4;
  objc_sync_enter(v10);
  [v10 removeAllObjects];
  objc_sync_exit(v10);
}

- (id)cachedEntryForEntryKey:(id)a3 withEntryID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PLStorageCache *)self lastEntryCacheForEntryKey:v6];
  uint64_t v8 = v7;
  if (!v7 || [v7 entryID] != a4)
  {
    uint64_t v9 = [(PLStorageCache *)self stagingEntryCacheForEntryKey:v6 withID:a4];

    uint64_t v8 = (void *)v9;
  }
  id v10 = v8;

  return v10;
}

- (void)clearLastEntryCacheForEntryKey:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLStorageCache_clearLastEntryCacheForEntryKey___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (clearLastEntryCacheForEntryKey__defaultOnce != -1) {
      dispatch_once(&clearLastEntryCacheForEntryKey__defaultOnce, block);
    }
    if (clearLastEntryCacheForEntryKey__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"begin: entryKey=%@", v4];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      uint64_t v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLStorageCache clearLastEntryCacheForEntryKey:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:149];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v11 = [(PLStorageCache *)self lastEntryCache];
  objc_sync_enter(v11);
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__PLStorageCache_clearLastEntryCacheForEntryKey___block_invoke_55;
    v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v19[4] = v12;
    if (clearLastEntryCacheForEntryKey__defaultOnce_53 != -1) {
      dispatch_once(&clearLastEntryCacheForEntryKey__defaultOnce_53, v19);
    }
    if (clearLastEntryCacheForEntryKey__classDebugEnabled_54)
    {
      uint64_t v13 = [NSString stringWithFormat:@"in @synchronized: entryKey=%@", v4];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m"];
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLStorageCache clearLastEntryCacheForEntryKey:]"];
      +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:152];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  long long v18 = [(PLStorageCache *)self lastEntryCache];
  [v18 removeObjectForKey:v4];

  objc_sync_exit(v11);
}

BOOL __49__PLStorageCache_clearLastEntryCacheForEntryKey___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  clearLastEntryCacheForEntryKey__classDebugEnabled = result;
  return result;
}

BOOL __49__PLStorageCache_clearLastEntryCacheForEntryKey___block_invoke_55(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  clearLastEntryCacheForEntryKey__classDebugEnabled_54 = result;
  return result;
}

BOOL __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  lastEntryCachePruneToDate__classDebugEnabled = result;
  return result;
}

BOOL __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_64(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  lastEntryCachePruneToDate__classDebugEnabled_63 = result;
  return result;
}

BOOL __44__PLStorageCache_addToLastEntryCacheSubKey___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_classDebugEnabled = result;
  return result;
}

BOOL __38__PLStorageCache_addToLastEntryCache___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_2_classDebugEnabled = result;
  return result;
}

BOOL __38__PLStorageCache_addToLastEntryCache___block_invoke_87(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_2_classDebugEnabled_86 = result;
  return result;
}

- (id)stagingEntryCacheIDsForEntryKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [(PLStorageCache *)self stagingEntryCache];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PLStorageCache_stagingEntryCacheIDsForEntryKey___block_invoke;
  v9[3] = &unk_1E62539E0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  +[PLStorageCache syncAndDispatchForEntryCache:v5 forEntryKey:v6 withBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__PLStorageCache_stagingEntryCacheIDsForEntryKey___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) stagingEntryCache];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 allValues];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "entryID", (void)v12));
        [v10 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (int64_t)stagingEntryCacheSizeForEntryKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(PLStorageCache *)self stagingEntryCache];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PLStorageCache_stagingEntryCacheSizeForEntryKey___block_invoke;
  v9[3] = &unk_1E6253D58;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  +[PLStorageCache syncAndDispatchForEntryCache:v5 forEntryKey:v6 withBlock:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__PLStorageCache_stagingEntryCacheSizeForEntryKey___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stagingEntryCache];
  uint64_t v2 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 count];
}

- (id)stagingEntryCacheForEntryKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v5 = [(PLStorageCache *)self stagingEntryCache];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PLStorageCache_stagingEntryCacheForEntryKey___block_invoke;
  v9[3] = &unk_1E6253D58;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  +[PLStorageCache syncAndDispatchForEntryCache:v5 forEntryKey:v6 withBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__PLStorageCache_stagingEntryCacheForEntryKey___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) stagingEntryCache];
  uint64_t v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 allValues];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)stagingEntryCacheForEntryKey:(id)a3 withIDLessThan:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  id v7 = [(PLStorageCache *)self stagingEntryCache];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PLStorageCache_stagingEntryCacheForEntryKey_withIDLessThan___block_invoke;
  v11[3] = &unk_1E6253DD0;
  v11[4] = self;
  id v8 = v6;
  long long v13 = &v15;
  int64_t v14 = a4;
  id v12 = v8;
  +[PLStorageCache syncAndDispatchForEntryCache:v7 forEntryKey:v8 withBlock:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __62__PLStorageCache_stagingEntryCacheForEntryKey_withIDLessThan___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = [v2 stagingEntryCache];
  uint64_t v4 = [v3 objectForKeyedSubscript:a1[5]];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PLStorageCache_stagingEntryCacheForEntryKey_withIDLessThan___block_invoke_2;
  v6[3] = &unk_1E6253DA8;
  uint64_t v5 = a1[7];
  v6[4] = a1[6];
  v6[5] = v5;
  [v2 enumerateEntryCache:v4 withBlock:v6];
}

void __62__PLStorageCache_stagingEntryCacheForEntryKey_withIDLessThan___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 entryID] < *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)stagingEntryCacheForEntryKey:(id)a3 withComparisons:(id)a4 isSingleton:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  uint64_t v11 = [(PLStorageCache *)self stagingEntryCache];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__PLStorageCache_stagingEntryCacheForEntryKey_withComparisons_isSingleton___block_invoke;
  v18[3] = &unk_1E6253E20;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v12 = v10;
  id v21 = v12;
  BOOL v22 = a5;
  id v13 = v9;
  id v14 = v8;
  +[PLStorageCache syncAndDispatchForEntryCache:v11 forEntryKey:v14 withBlock:v18];

  uint64_t v15 = v21;
  id v16 = v12;

  return v16;
}

void __75__PLStorageCache_stagingEntryCacheForEntryKey_withComparisons_isSingleton___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__PLStorageCache_stagingEntryCacheForEntryKey_withComparisons_isSingleton___block_invoke_2;
  v4[3] = &unk_1E6253DF8;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  char v7 = *(unsigned char *)(a1 + 64);
  [v2 enumerateStagingEntryCacheForEntryKey:v3 withBlock:v4];
}

void __75__PLStorageCache_stagingEntryCacheForEntryKey_withComparisons_isSingleton___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4 && [v4 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v20 = a1;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v6)
    {
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v10 comparisonOperation] == 6)
        {
          uint64_t v11 = [v10 key];
          id v12 = [v3 objectForKeyedSubscript:v11];

          if (v12) {
            goto LABEL_27;
          }
        }
        else
        {
          int v13 = [v10 comparisonOperation];
          id v14 = [v10 key];
          uint64_t v15 = [v3 objectForKeyedSubscript:v14];
          id v16 = v15;
          if (v13 == 7)
          {

            if (!v16) {
              goto LABEL_27;
            }
          }
          else
          {
            uint64_t v17 = [v10 value];
            uint64_t v18 = [v16 plCompare:v17];

            if ((![v10 hasEqualComparisonComponent] || v18)
              && (![v10 hasGreaterThanComparisonComponent] || v18 != 1)
              && (![v10 hasLessThanComparisonComponent] || v18 != -1)
              && ([v10 comparisonOperation] != 1 || !v18))
            {
              goto LABEL_27;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);

    id v19 = *(void **)(v20 + 40);
  }
  else
  {
    id v19 = *(void **)(a1 + 40);
  }
  [v19 addObject:v3];
LABEL_28:
}

BOOL __37__PLStorageCache_entryIDForNewEntry___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  entryIDForNewEntry__classDebugEnabled = result;
  return result;
}

BOOL __37__PLStorageCache_entryIDForNewEntry___block_invoke_100(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  entryIDForNewEntry__classDebugEnabled_99 = result;
  return result;
}

BOOL __37__PLStorageCache_entryIDForNewEntry___block_invoke_115(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  entryIDForNewEntry__classDebugEnabled_114 = result;
  return result;
}

- (void)setNextEntryIDForEntryKey:(id)a3 toEntryID:(int64_t)a4
{
  uint64_t v6 = NSString;
  id v7 = a3;
  [v6 stringWithFormat:@"UPDATE SQLITE_SEQUENCE SET seq = %lld WHERE name = '%@'", a4, v7];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [(PLStorageCache *)self connectionForKey:v7];

  id v9 = (id)[v8 performQuery:v10];
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  addToStagingEntryCache__classDebugEnabled = result;
  return result;
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_3_classDebugEnabled = result;
  return result;
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke_134(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_3_classDebugEnabled_133 = result;
  return result;
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke_141(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_3_classDebugEnabled_140 = result;
  return result;
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke_147(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_3_classDebugEnabled_146 = result;
  return result;
}

BOOL __46__PLStorageCache_insertIntoStagingEntryCache___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  insertIntoStagingEntryCache__classDebugEnabled = result;
  return result;
}

BOOL __46__PLStorageCache_insertIntoStagingEntryCache___block_invoke_160(uint64_t a1)
{
  BOOL result = +[PLDefaults BOOLForKey:*(void *)(a1 + 32)];
  insertIntoStagingEntryCache__objectForKey = result;
  return result;
}

BOOL __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  updateStagingEntryCacheWithEntry_withBlock__classDebugEnabled = result;
  return result;
}

BOOL __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke_166(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  updateStagingEntryCacheWithEntry_withBlock__classDebugEnabled_165 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  flushStagingEntryCacheToDatabase_classDebugEnabled = result;
  return result;
}

int64_t __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_179(uint64_t a1)
{
  int64_t result = +[PLDefaults longForKey:*(void *)(a1 + 32) ifNotSet:*(void *)(a1 + 40)];
  flushStagingEntryCacheToDatabase_objectForKey = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_3(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_4_classDebugEnabled = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_185(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_4_classDebugEnabled_184 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_191(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_4_classDebugEnabled_190 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_197(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_4_classDebugEnabled_196 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2_202(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_5_classDebugEnabled = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_205(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_5_classDebugEnabled_204 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_211(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_5_classDebugEnabled_210 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_217(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_5_classDebugEnabled_216 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_223(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_5_classDebugEnabled_222 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_233(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_4_classDebugEnabled_232 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2_237(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_4_classDebugEnabled_236 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_3_241(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  flushStagingEntryCacheToDatabase_classDebugEnabled_240 = result;
  return result;
}

- (void)enumerateStagingEntryCacheForEntryKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PLStorageCache *)self stagingEntryCache];
  uint64_t v8 = [v9 objectForKeyedSubscript:v7];

  [(PLStorageCache *)self enumerateEntryCache:v8 withBlock:v6];
}

- (void)enumerateStagingEntryCacheWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PLStorageCache *)self stagingEntryCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PLStorageCache_enumerateStagingEntryCacheWithBlock___block_invoke;
  v7[3] = &unk_1E6253F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __54__PLStorageCache_enumerateStagingEntryCacheWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) enumerateEntryCache:a3 withBlock:*(void *)(a1 + 40)];
}

BOOL __59__PLStorageCache_flushStagingAggregateEntryCacheToDatabase__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  flushStagingAggregateEntryCacheToDatabase_classDebugEnabled = result;
  return result;
}

BOOL __59__PLStorageCache_flushStagingAggregateEntryCacheToDatabase__block_invoke_250(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  flushStagingAggregateEntryCacheToDatabase_classDebugEnabled_249 = result;
  return result;
}

BOOL __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  addToStagingAggregateEntryCache__classDebugEnabled = result;
  return result;
}

BOOL __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_6_classDebugEnabled = result;
  return result;
}

BOOL __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_263(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_6_classDebugEnabled_262 = result;
  return result;
}

BOOL __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_270(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_6_classDebugEnabled_269 = result;
  return result;
}

BOOL __70__PLStorageCache_getQueryForAggregateEntryKey_withMatchingKeyToValue___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  getQueryForAggregateEntryKey_withMatchingKeyToValue__classDebugEnabled = result;
  return result;
}

- (NSMutableDictionary)cacheContent
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCacheContent:(id)a3
{
}

- (void)setLastEntryCache:(id)a3
{
}

- (void)setStagingEntryCache:(id)a3
{
}

- (void)setStagingAggregateEntryCache:(id)a3
{
}

- (void)setCountWarnings:(id)a3
{
}

- (void)setCountSafetyDrop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countSafetyDrop, 0);
  objc_storeStrong((id *)&self->_countWarnings, 0);
  objc_storeStrong((id *)&self->_stagingAggregateEntryCache, 0);
  objc_storeStrong((id *)&self->_stagingEntryCache, 0);
  objc_storeStrong((id *)&self->_lastEntryCache, 0);
  objc_storeStrong((id *)&self->_cacheContent, 0);
  objc_storeStrong((id *)&self->_lastCacheFlushDate, 0);
}

- (void)insertIntoStagingEntryCache:(int)a3 .cold.2(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Flush cache cacheContent inserting %@ %d", buf, 0x12u);
}

@end