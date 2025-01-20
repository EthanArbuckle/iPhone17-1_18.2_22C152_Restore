@interface PLCoreStorage
+ (id)additionalTables;
+ (id)allOperatorTablesToTrimConditionsForTrimDate:(id)a3;
+ (id)storageQueueNameForClass:(Class)a3;
+ (id)storageQueueNameForEntryKey:(id)a3;
+ (void)logMessage:(id)a3 fromFile:(id)a4 fromFunction:(id)a5 fromLineNumber:(int64_t)a6;
- (BOOL)flushCachesIfRequiredForEntryKey:(id)a3;
- (BOOL)setFileProtectionForPath:(id)a3 withLevel:(id)a4;
- (BOOL)shouldApply136229065A;
- (BOOL)storageLocked;
- (BOOL)storageReady;
- (NSMutableSet)safeCopyInProgress;
- (NSString)uuid;
- (OS_dispatch_queue)backgroundQueue;
- (OS_dispatch_queue)utilityQueue;
- (PLCFNotificationOperatorComposition)blockingFlushCachesCFNotification;
- (PLCFNotificationOperatorComposition)flushCachesCFNotification;
- (PLCFNotificationOperatorComposition)keybagFirstUnlockNotification;
- (PLCFNotificationOperatorComposition)keybagLockStatusNotification;
- (PLCoreStorage)init;
- (PLKQueue)profileDefaultsKQueue;
- (PLNSNotificationOperatorComposition)dailyTaskNotification;
- (PLSQLiteConnection)connection;
- (PLStorageOperator)storageOperator;
- (PLTimer)dailyTaskTimer;
- (PLTimer)flushCachesTimer;
- (PLXPCResponderOperatorComposition)XPCFlushCacheResponder;
- (PLXPCResponderOperatorComposition)archivesResponder;
- (PLXPCResponderOperatorComposition)batteryUIPlistsResponder;
- (PLXPCResponderOperatorComposition)blPathResponder;
- (PLXPCResponderOperatorComposition)quarantineCopyResponder;
- (PLXPCResponderOperatorComposition)quarantineResponder;
- (PLXPCResponderOperatorComposition)safeFileResponder;
- (PLXPCResponderOperatorComposition)upgradeLogsResponder;
- (id)aggregateEntriesForKey:(id)a3 withBucketLength:(double)a4 inTimeIntervalRange:(_PLTimeIntervalRange)a5;
- (id)entriesForKey:(id)a3;
- (id)entriesForKey:(id)a3 before:(BOOL)a4 timeInterval:(double)a5 count:(int64_t)a6 withFilters:(id)a7;
- (id)entriesForKey:(id)a3 inTimeRange:(_PLTimeIntervalRange)a4 withCountOfEntriesBefore:(int64_t)a5 withCountOfEntriesAfter:(int64_t)a6 withFilters:(id)a7;
- (id)entriesForKey:(id)a3 inTimeRange:(_PLTimeIntervalRange)a4 withFilters:(id)a5;
- (id)entriesForKey:(id)a3 startingFromRowID:(int64_t)a4 count:(int64_t)a5 withFilters:(id)a6;
- (id)entriesForKey:(id)a3 withComparisons:(id)a4;
- (id)entriesForKey:(id)a3 withProperties:(id)a4;
- (id)entriesForKey:(id)a3 withQuery:(id)a4;
- (id)entryForKey:(id)a3 withID:(int64_t)a4;
- (id)firstEntryForKey:(id)a3;
- (id)lastEntriesForKey:(id)a3 count:(int64_t)a4 withFilters:(id)a5;
- (id)lastEntryForKey:(id)a3;
- (id)lastEntryForKey:(id)a3 withComparisons:(id)a4 isSingleton:(BOOL)a5;
- (id)lastEntryForKey:(id)a3 withFilters:(id)a4;
- (id)lastEntryForKey:(id)a3 withIDLessThan:(int64_t)a4;
- (id)lastEntryForKey:(id)a3 withSubEntryKey:(id)a4;
- (id)processIDEntryForPid:(int)a3;
- (int64_t)blockingWriteEntry:(id)a3 withCompletionBlock:(id)a4;
- (int64_t)countOfEntriesForKey:(id)a3;
- (int64_t)generalEntryCacheSizeLimit;
- (int64_t)writeEntry:(id)a3;
- (signed)verifySchemaVersionOfTable:(id)a3 matchesExpectedVersion:(double)a4;
- (void)_updateEntry:(id)a3 withBlock:(id)a4;
- (void)addAggdModeKeys;
- (void)applyContainerPOSIXPermissions;
- (void)attemptToSendTaskingStartNotification;
- (void)blockingFlushCachesWithReason:(id)a3;
- (void)blockingFlushCachesWithReason:(id)a3 timeout:(int)a4;
- (void)blockingFlushQueues:(id)a3 withTimeout:(int)a4;
- (void)checkCacheSizeForFlush;
- (void)cleanupQuarantine;
- (void)cleanupTmp;
- (void)configureCacheFlush;
- (void)copyUpgradePowerlogsAtPath:(id)a3 toPath:(id)a4;
- (void)dailyTasks;
- (void)dealloc;
- (void)deleteAllEntriesForKey:(id)a3;
- (void)deleteAllEntriesForKey:(id)a3 beforeTimestamp:(id)a4;
- (void)deleteAllEntriesForKey:(id)a3 beforeTimestamp:(id)a4 withFilters:(id)a5;
- (void)deleteAllEntriesForKey:(id)a3 withFilters:(id)a4;
- (void)deleteEntry:(id)a3;
- (void)deleteEntryForKey:(id)a3 WithRowID:(int64_t)a4;
- (void)dispatchAsyncForEntryKey:(id)a3 withBlock:(id)a4;
- (void)dispatchSyncForEntryKey:(id)a3 withBlock:(id)a4;
- (void)flushCachesWithReason:(id)a3;
- (void)handleSchemaMismatchForTable:(id)a3 expectedVersion:(double)a4 schemaMatch:(signed __int16)a5;
- (void)init;
- (void)initOperatorDependancies;
- (void)loadDynamicValuesIntoEntry:(id)a3;
- (void)logMessage:(id)a3 fromFile:(id)a4 fromFunction:(id)a5 fromLineNumber:(int64_t)a6;
- (void)logPreUnlockState:(BOOL)a3;
- (void)processEntriesForKey:(id)a3 withProperties:(id)a4 withBlock:(id)a5;
- (void)registerDailyTasks;
- (void)registerDailyTasks_XPCActivity;
- (void)removeErroneousQualificationEntries;
- (void)removeOldPowerlogFiles;
- (void)reportPerfStats;
- (void)setAllNullValuesForEntryKey:(id)a3 forKey:(id)a4 toValue:(id)a5 withFilters:(id)a6;
- (void)setArchivesResponder:(id)a3;
- (void)setBackgroundQueue:(id)a3;
- (void)setBatteryUIPlistsResponder:(id)a3;
- (void)setBlPathResponder:(id)a3;
- (void)setBlockingFlushCachesCFNotification:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDailyTaskNotification:(id)a3;
- (void)setDailyTaskTimer:(id)a3;
- (void)setFlushCachesCFNotification:(id)a3;
- (void)setFlushCachesTimer:(id)a3;
- (void)setKeybagFirstUnlockNotification:(id)a3;
- (void)setKeybagLockStatusNotification:(id)a3;
- (void)setProfileDefaultsKQueue:(id)a3;
- (void)setQuarantineCopyResponder:(id)a3;
- (void)setQuarantineResponder:(id)a3;
- (void)setSafeCopyInProgress:(id)a3;
- (void)setSafeFileResponder:(id)a3;
- (void)setStorageLocked:(BOOL)a3;
- (void)setStorageOperator:(id)a3;
- (void)setStorageReady:(BOOL)a3;
- (void)setUpgradeLogsResponder:(id)a3;
- (void)setUtilityQueue:(id)a3;
- (void)setUuid:(id)a3;
- (void)setXPCFlushCacheResponder:(id)a3;
- (void)setupArrayForTableName:(id)a3 forColumnNamed:(id)a4 withValueType:(signed __int16)a5 withShouldIndexFKID:(BOOL)a6;
- (void)setupCompositeIndexOnTable:(id)a3 withColumns:(id)a4;
- (void)setupStorageForEntryKey:(id)a3;
- (void)setupStorageForOperator:(id)a3;
- (void)setupStorageForOperatorClass:(Class)a3;
- (void)setupStorageForOperatorName:(id)a3;
- (void)setupStorageVersions;
- (void)setupTableName:(id)a3 withEntryKeyConfig:(id)a4 withKeyOrder:(id)a5 isDynamic:(BOOL)a6 withShouldIndexFKID:(BOOL)a7;
- (void)startStorage;
- (void)stopStorage;
- (void)updateEntry:(id)a3 withBlock:(id)a4;
- (void)willSwitchUser;
- (void)writeAggregateEntry:(id)a3;
- (void)writeEntries:(id)a3 withCompletionBlock:(id)a4;
- (void)writeEntry:(id)a3 withCompletionBlock:(id)a4;
- (void)writeProportionateAggregateEntry:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5;
@end

@implementation PLCoreStorage

- (BOOL)storageReady
{
  return self->_storageReady;
}

- (void)writeEntry:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLCoreStorage_writeEntry_withCompletionBlock___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (writeEntry_withCompletionBlock__defaultOnce != -1) {
      dispatch_once(&writeEntry_withCompletionBlock__defaultOnce, block);
    }
    if (writeEntry_withCompletionBlock__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"entry=%@", v6];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLCoreStorage writeEntry:withCompletionBlock:]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:1605];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if (v6)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__5;
    v22 = __Block_byref_object_dispose__5;
    id v23 = v6;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__711;
    v16[4] = __Block_byref_object_dispose__712;
    id v17 = (id)MEMORY[0x1C1869370](v7);
    v14 = [(id)v19[5] entryKey];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__PLCoreStorage_writeEntry_withCompletionBlock___block_invoke_716;
    v15[3] = &unk_1E6254530;
    v15[4] = self;
    v15[5] = &v18;
    v15[6] = v16;
    [(PLCoreStorage *)self dispatchAsyncForEntryKey:v14 withBlock:v15];

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v18, 8);
  }
}

- (id)lastEntryForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[PLStorageCache sharedStorageCache];
    id v6 = [v5 lastEntryCacheForEntryKey:v4];

    if (!v6)
    {
      id v6 = [(PLCoreStorage *)self lastEntryForKey:v4 withFilters:&unk_1F1585AF0];
      if (v6)
      {
        id v7 = +[PLStorageCache sharedStorageCache];
        [v7 addToLastEntryCache:v6];

        uint64_t v8 = +[PLStorageCache sharedStorageCache];
        [v8 addToLastEntryCacheSubKey:v6];
      }
    }
    id v9 = v6;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)dispatchAsyncForEntryKey:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() storageQueueNameForEntryKey:v6];

  uint64_t v8 = +[PLUtilities workQueueForKey:v7];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PLCoreStorage_dispatchAsyncForEntryKey_withBlock___block_invoke;
  block[3] = &unk_1E6254508;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, block);
}

+ (id)storageQueueNameForEntryKey:(id)a3
{
  v3 = +[PLEntryKey operatorClassForEntryKey:a3];
  return (id)[(objc_class *)v3 storageQueueName];
}

- (void)checkCacheSizeForFlush
{
  v3 = +[PLStorageCache sharedStorageCache];
  uint64_t v4 = [v3 stagingEntryCacheSize];
  int64_t v5 = [(PLCoreStorage *)self generalEntryCacheSizeLimit];

  if (v4 > v5)
  {
    id v6 = +[PLUtilities workQueueForKey:@"CacheSizeFlush"];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLCoreStorage_checkCacheSizeForFlush__block_invoke;
    block[3] = &unk_1E62538C8;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

- (int64_t)generalEntryCacheSizeLimit
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PLCoreStorage_generalEntryCacheSizeLimit__block_invoke;
  v4[3] = &unk_1E6253E70;
  int64_t v5 = @"generalEntryCacheSize";
  uint64_t v6 = 500;
  if (generalEntryCacheSizeLimit_defaultOnce != -1) {
    dispatch_once(&generalEntryCacheSizeLimit_defaultOnce, v4);
  }
  int64_t v2 = generalEntryCacheSizeLimit_objectForKey;

  return v2;
}

- (BOOL)storageLocked
{
  if (storageLocked_onceToken != -1) {
    dispatch_once(&storageLocked_onceToken, &__block_literal_global_14);
  }
  return storageLocked_storageLocked;
}

- (void)writeProportionateAggregateEntry:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 timeIntervalSinceDate:v9];
  if (v11 <= 0.0)
  {
    v53 = self;
LABEL_28:
    [(PLCoreStorage *)v53 writeAggregateEntry:v8];
    goto LABEL_43;
  }
  double v12 = v11;
  v13 = [v8 entryKey];
  BOOL v14 = +[PLEntryDefinition isAggregateWallClockBucket:v13];

  v15 = +[PLTimeManager sharedInstance];
  v85 = self;
  BOOL v16 = v14;
  int v17 = [v15 bucketTimeStampForDate:v10 withTimeReference:v14 withBucketInterval:3600];

  uint64_t v18 = +[PLTimeManager sharedInstance];
  v19 = v85;
  int v20 = [v18 bucketTimeStampForDate:v9 withTimeReference:v16 withBucketInterval:3600];

  v89 = v8;
  id v84 = v10;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke;
    block[3] = &unk_1E6253EC0;
    v101 = @"writeAggregateEntry";
    uint64_t v102 = v21;
    if (writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce != -1) {
      dispatch_once(&writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce, block);
    }
    int v22 = writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled;

    if (v22)
    {
      id v82 = v10;
      id v23 = v9;
      v24 = [NSString stringWithFormat:@"Split Entry: startDate: %@, endDate: %@", v9, v82];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLCoreStorage writeProportionateAggregateEntry:withStartDate:withEndDate:]"];
      +[PLCoreStorage logMessage:v24 fromFile:v26 fromFunction:v27 fromLineNumber:1671];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      id v8 = v89;
      id v9 = v23;
      id v10 = v84;
      v19 = v85;
    }
  }
  double v29 = (double)v17;
  double v30 = (double)v20;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v31 = objc_opt_class();
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke_725;
    v97[3] = &unk_1E6253EC0;
    v98 = @"writeAggregateEntry";
    uint64_t v99 = v31;
    if (writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce_723 != -1) {
      dispatch_once(&writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce_723, v97);
    }
    int v32 = writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled_724;

    if (v32)
    {
      v33 = NSString;
      v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v20];
      v35 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v17];
      v36 = [v33 stringWithFormat:@"Split Entry: startHourBoundary: %@, endHourBoundary: %@", v34, v35];

      v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLCoreStorage writeProportionateAggregateEntry:withStartDate:withEndDate:]"];
      +[PLCoreStorage logMessage:v36 fromFile:v38 fromFunction:v39 fromLineNumber:1672];

      v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      id v10 = v84;
      v19 = v85;
    }
  }
  uint64_t v41 = ((v29 - v30) / 3600.0);
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v42 = objc_opt_class();
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke_731;
    v94[3] = &unk_1E6253EC0;
    v95 = @"writeAggregateEntry";
    uint64_t v96 = v42;
    if (writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce_729 != -1) {
      dispatch_once(&writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce_729, v94);
    }
    int v43 = writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled_730;

    if (v43)
    {
      uint64_t v41 = objc_msgSend(NSString, "stringWithFormat:", @"Split Entry: numberOfIntermediateHourTicks = %d", v41);
      v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      v45 = [v44 lastPathComponent];
      v46 = [NSString stringWithUTF8String:"-[PLCoreStorage writeProportionateAggregateEntry:withStartDate:withEndDate:]"];
      +[PLCoreStorage logMessage:v41 fromFile:v45 fromFunction:v46 fromLineNumber:1674];

      v47 = PLLogCommon();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      v19 = v85;
      LODWORD(v41) = ((v29 - v30) / 3600.0);
    }
  }
  if (!v41)
  {
    v53 = v19;
    goto LABEL_28;
  }
  [v9 timeIntervalSince1970];
  double v49 = v48;
  [v10 timeIntervalSince1970];
  double v51 = v50;
  v88 = (void *)[v8 copy];
  v52 = (void *)[v8 copy];
  id v83 = v9;
  if (v41 == 1) {
    v87 = 0;
  }
  else {
    v87 = (void *)[v8 copy];
  }
  v54 = (void *)MEMORY[0x1E4F1CA80];
  v55 = [v8 entryDefinition];
  v56 = +[PLEntryDefinition allAggregateKeysForEntryDefinition:v55];
  v57 = [v54 setWithArray:v56];

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = v57;
  uint64_t v58 = [obj countByEnumeratingWithState:&v90 objects:v103 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    double v60 = v51 - v29;
    double v61 = (v30 - v49 + 3600.0) / v12;
    double v62 = v60 / v12;
    uint64_t v63 = *(void *)v91;
    double v64 = 3600.0 / v12;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v91 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v66 = *(void *)(*((void *)&v90 + 1) + 8 * i);
        v67 = NSNumber;
        v68 = [v89 objectForKeyedSubscript:v66];
        [v68 doubleValue];
        v70 = [v67 numberWithDouble:v61 * v69];
        [v88 setObject:v70 forKeyedSubscript:v66];

        v71 = NSNumber;
        v72 = [v89 objectForKeyedSubscript:v66];
        [v72 doubleValue];
        v74 = [v71 numberWithDouble:v62 * v73];
        [v52 setObject:v74 forKeyedSubscript:v66];

        if (v41 != 1)
        {
          v75 = NSNumber;
          v76 = [v89 objectForKeyedSubscript:v66];
          [v76 doubleValue];
          v78 = [v75 numberWithDouble:v64 * v77];
          [v87 setObject:v78 forKeyedSubscript:v66];
        }
      }
      uint64_t v59 = [obj countByEnumeratingWithState:&v90 objects:v103 count:16];
    }
    while (v59);
  }

  id v9 = v83;
  [v88 setEntryDate:v83];
  [v52 setEntryDate:v84];
  [(PLCoreStorage *)v85 writeAggregateEntry:v88];
  [(PLCoreStorage *)v85 writeAggregateEntry:v52];
  if (v41 != 1)
  {
    int v79 = 1;
    do
    {
      v80 = (void *)[v87 copy];
      v81 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v30 + (double)v79 * 3600.0];
      [v80 setEntryDate:v81];

      [(PLCoreStorage *)v85 writeAggregateEntry:v80];
      ++v79;
    }
    while (v41 != v79);
  }

  id v8 = v89;
  id v10 = v84;
LABEL_43:
}

- (void)writeAggregateEntry:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke;
    block[3] = &unk_1E6253EC0;
    uint64_t v18 = @"writeAggregateEntry";
    uint64_t v19 = v5;
    if (writeAggregateEntry__defaultOnce != -1) {
      dispatch_once(&writeAggregateEntry__defaultOnce, block);
    }
    int v6 = writeAggregateEntry__classDebugEnabled;

    if (v6)
    {
      id v7 = [NSString stringWithFormat:@"entry=%@", v4];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLCoreStorage writeAggregateEntry:]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:1725];

      double v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  double v12 = [v4 entryKey];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_735;
  v14[3] = &unk_1E62539B8;
  id v15 = v4;
  BOOL v16 = self;
  id v13 = v4;
  [(PLCoreStorage *)self dispatchAsyncForEntryKey:v12 withBlock:v14];
}

- (id)lastEntryForKey:(id)a3 withSubEntryKey:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = +[PLStorageCache sharedStorageCache];
    id v9 = [v8 lastEntryCacheForEntryKey:v6 withSubEntryKey:v7];

    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      double v11 = +[PLEntryDefinition subEntryKeyKeyForEntryKey:v6];
      v17[0] = @"__NOCACHEDUMP__";
      double v12 = [NSString stringWithFormat:@"%@ = \"%@\"", v11, v7];
      v17[1] = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

      BOOL v14 = [(PLCoreStorage *)self lastEntryForKey:v6 withFilters:v13];
      if (v14)
      {
        id v15 = +[PLStorageCache sharedStorageCache];
        [v15 addToLastEntryCacheSubKey:v14];
      }
      id v10 = v14;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)lastEntryForKey:(id)a3 withFilters:(id)a4
{
  id v4 = [(PLCoreStorage *)self lastEntriesForKey:a3 count:1 withFilters:a4];
  if ([v4 count] == 1)
  {
    uint64_t v5 = [v4 firstObject];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)lastEntriesForKey:(id)a3 count:(int64_t)a4 withFilters:(id)a5
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = v8;
  if (a3)
  {
    if (!v8) {
      id v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v10 = a3;
    if ([v9 count]
      && ([v9 firstObject],
          double v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 isEqualToString:@"__NOCACHEDUMP__"],
          v11,
          v12))
    {
      id v13 = (void *)[v9 mutableCopy];
      [v13 removeObjectAtIndex:0];

      uint64_t v14 = 1;
      id v9 = v13;
    }
    else
    {
      uint64_t v14 = 0;
    }
    v21[0] = @"where";
    v21[1] = @"order by";
    v22[0] = v9;
    v22[1] = &unk_1F1586DF0;
    v21[2] = @"limit";
    if (a4 >= 0) {
      int64_t v15 = a4;
    }
    else {
      int64_t v15 = -a4;
    }
    BOOL v16 = [NSNumber numberWithLongLong:v15];
    v22[2] = v16;
    v21[3] = @"__NOCACHEDUMP__";
    int v17 = [NSNumber numberWithBool:v14];
    v22[3] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

    uint64_t v19 = [(PLCoreStorage *)self entriesForKey:v10 withProperties:v18];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)entriesForKey:(id)a3 withProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"__NOCACHEDUMP__"];
  if (!v8
    || (id v9 = (void *)v8,
        [v7 objectForKeyedSubscript:@"__NOCACHEDUMP__"],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 BOOLValue],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    if ([(PLCoreStorage *)self flushCachesIfRequiredForEntryKey:v6]
      && +[PLDefaults debugEnabled])
    {
      int v12 = [NSString stringWithFormat:@"Cache dumped for properties: %@", v7];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      uint64_t v14 = [v13 lastPathComponent];
      int64_t v15 = [NSString stringWithUTF8String:"-[PLCoreStorage entriesForKey:withProperties:]"];
      +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:1933];

      BOOL v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  int v17 = (void *)os_transaction_create();
  uint64_t v18 = (void *)MEMORY[0x1C1869120]();
  uint64_t v19 = +[PLStorageCache sharedStorageCache];
  int v20 = [v19 connectionForKey:v6];
  uint64_t v21 = [v20 entriesForKey:v6 withProperties:v7];

  int v22 = PLLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[PLCoreStorage entriesForKey:withProperties:]();
  }

  dispatch_time_t v23 = dispatch_time(0, 1000000000* +[PLDefaults longForKey:@"kPLXPCTransactionEndDelay" ifNotSet:60]);
  v24 = +[PLUtilities transactionWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PLCoreStorage_entriesForKey_withProperties___block_invoke;
  block[3] = &unk_1E62538C8;
  id v28 = v17;
  id v25 = v17;
  dispatch_after(v23, v24, block);

  return v21;
}

- (int64_t)blockingWriteEntry:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    int64_t v8 = [(PLCoreStorage *)self writeEntry:v6];
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

void __52__PLCoreStorage_dispatchAsyncForEntryKey_withBlock___block_invoke(uint64_t a1)
{
  int64_t v2 = (void *)MEMORY[0x1C1869120]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)writeEntry:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    BOOL v16 = __28__PLCoreStorage_writeEntry___block_invoke;
    int v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v5;
    if (writeEntry__defaultOnce != -1) {
      dispatch_once(&writeEntry__defaultOnce, &block);
    }
    if (writeEntry__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"entry=%@", v4, block, v15, v16, v17, v18];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      int64_t v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLCoreStorage writeEntry:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:1595];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  char v11 = +[PLStorageCache sharedStorageCache];
  int64_t v12 = [v11 addToStagingEntryCache:v4];

  [(PLCoreStorage *)self checkCacheSizeForFlush];
  return v12;
}

uint64_t __50__PLCoreStorage_writeEntries_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        int64_t v8 = +[PLStorageCache sharedStorageCache];
        [v8 addToStagingEntryCache:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) checkCacheSizeForFlush];
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (PLSQLiteConnection)connection
{
  return (PLSQLiteConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)writeEntries:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__5;
    int v22 = __Block_byref_object_dispose__5;
    id v23 = v6;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__711;
    v16[4] = __Block_byref_object_dispose__712;
    id v17 = (id)MEMORY[0x1C1869370](v7);
    int64_t v8 = [(id)v19[5] objectAtIndexedSubscript:0];
    id v9 = [v8 entryKey];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__PLCoreStorage_writeEntries_withCompletionBlock___block_invoke;
    v15[3] = &unk_1E6253E48;
    v15[4] = self;
    v15[5] = &v18;
    v15[6] = v16;
    [(PLCoreStorage *)self dispatchAsyncForEntryKey:v9 withBlock:v15];

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v18, 8);
  }
  else if (+[PLDefaults debugEnabled])
  {
    long long v10 = [NSString stringWithFormat:@"writeEntries: ERROR, no entries to write"];
    long long v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
    long long v12 = [v11 lastPathComponent];
    long long v13 = [NSString stringWithUTF8String:"-[PLCoreStorage writeEntries:withCompletionBlock:]"];
    +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:1575];

    uint64_t v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
}

- (void)_updateEntry:(id)a3 withBlock:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    int64_t v8 = +[PLStorageCache sharedStorageCache];
    [v8 updateStagingEntryCacheWithEntry:v7 withBlock:v6];

    [(PLCoreStorage *)self checkCacheSizeForFlush];
  }
}

- (void)flushCachesWithReason:(id)a3
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"Cache Size"]
    && (+[PLStorageCache sharedStorageCache],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 stagingEntryCacheSize],
        int64_t v7 = [(PLCoreStorage *)self generalEntryCacheSizeLimit],
        v5,
        v6 <= v7))
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v38 = objc_opt_class();
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __39__PLCoreStorage_flushCachesWithReason___block_invoke;
      v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v52[4] = v38;
      if (flushCachesWithReason__defaultOnce != -1) {
        dispatch_once(&flushCachesWithReason__defaultOnce, v52);
      }
      if (flushCachesWithReason__classDebugEnabled)
      {
        v33 = [NSString stringWithFormat:@"Cache size is fine!"];
        v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        v40 = [v39 lastPathComponent];
        uint64_t v41 = [NSString stringWithUTF8String:"-[PLCoreStorage flushCachesWithReason:]"];
        +[PLCoreStorage logMessage:v33 fromFile:v40 fromFunction:v41 fromLineNumber:1389];

        v37 = PLLogCommon();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        goto LABEL_19;
      }
    }
  }
  else
  {
    if (+[PLPlatform isiOS]
      && +[PLPlatform internalBuild])
    {
      v58[0] = v4;
      v57[0] = @"Reason";
      v57[1] = @"Size";
      int64_t v8 = NSNumber;
      id v9 = +[PLStorageCache sharedStorageCache];
      long long v10 = objc_msgSend(v8, "numberWithLong:", objc_msgSend(v9, "stagingEntryCacheSize"));
      v58[1] = v10;
      long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
      long long v12 = +[PLStorageOperator eventPointCacheFlushWithPayload:v11];

      long long v13 = +[PLStorageCache sharedStorageCache];
      [v13 addToStagingEntryCache:v12];
    }
    if ([v4 length])
    {
      uint64_t v47 = MEMORY[0x1E4F143A8];
      uint64_t v48 = 3221225472;
      double v49 = __39__PLCoreStorage_flushCachesWithReason___block_invoke_646;
      double v50 = &unk_1E6254470;
      id v51 = v4;
      AnalyticsSendEventLazy();
    }
    uint64_t v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v54 = v4;
      __int16 v55 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_DEFAULT, "Flush cache start with Reason: %@ on Queue:%s", buf, 0x16u);
    }

    if (([v4 isEqualToString:@"Timer"] & 1) == 0)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9C8];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __39__PLCoreStorage_flushCachesWithReason___block_invoke_648;
      v44[3] = &unk_1E6253E70;
      v45 = @"flushCachesInterval";
      uint64_t v46 = 900;
      if (flushCachesWithReason__defaultOnce_647 != -1) {
        dispatch_once(&flushCachesWithReason__defaultOnce_647, v44);
      }
      uint64_t v16 = flushCachesWithReason__objectForKey;

      id v17 = [v15 dateWithTimeIntervalSinceNow:(double)v16];
      uint64_t v18 = [(PLCoreStorage *)self flushCachesTimer];
      [v18 setFireDate:v17];
    }
    if (!+[PLUtilities isPowerlogHelperd])
    {
      uint64_t v19 = (void *)os_transaction_create();
      uint64_t v20 = (void *)MEMORY[0x1C1869120]();
      uint64_t v21 = [(PLCoreStorage *)self connection];
      [v21 beginTransaction];

      int v22 = +[PLStorageCache sharedStorageCache];
      [v22 flushStagingEntryCacheToDatabase];

      id v23 = [(PLCoreStorage *)self connection];
      [v23 endTransaction];

      v24 = (void *)MEMORY[0x1C1869120]();
      id v25 = [(PLCoreStorage *)self connection];
      [v25 beginTransaction];

      v26 = +[PLStorageCache sharedStorageCache];
      [v26 flushStagingAggregateEntryCacheToDatabase];

      v27 = [(PLCoreStorage *)self connection];
      [v27 endTransaction];

      dispatch_time_t v28 = dispatch_time(0, 60000000000);
      double v29 = +[PLUtilities transactionWorkQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__PLCoreStorage_flushCachesWithReason___block_invoke_2;
      block[3] = &unk_1E62538C8;
      id v43 = v19;
      id v30 = v19;
      dispatch_after(v28, v29, block);

      uint64_t v31 = +[PLStorageCache sharedStorageCache];
      int v32 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:-3600.0];
      [v31 lastEntryCachePruneToDate:v32];
    }
    if (+[PLDefaults debugEnabled])
    {
      v33 = [NSString stringWithFormat:@"Flush cache done with Reason: %@ on Queue:%s", v4, dispatch_queue_get_label(0)];
      v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      v35 = [v34 lastPathComponent];
      v36 = [NSString stringWithUTF8String:"-[PLCoreStorage flushCachesWithReason:]"];
      +[PLCoreStorage logMessage:v33 fromFile:v35 fromFunction:v36 fromLineNumber:1436];

      v37 = PLLogCommon();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
LABEL_19:
    }
  }
}

- (PLTimer)flushCachesTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 48, 1);
}

uint64_t __39__PLCoreStorage_checkCacheSizeForFlush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushCachesWithReason:@"Cache Size"];
}

void __51__PLCoreStorage_dispatchSyncForEntryKey_withBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1C1869120]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__PLCoreStorage_loadDynamicValuesIntoEntry___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  [v2 loadDynamicValuesIntoEntry:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) connection];
  [v3 loadArrayValuesIntoEntry:*(void *)(a1 + 40)];
}

- (void)loadDynamicValuesIntoEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 entryKey];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PLCoreStorage_loadDynamicValuesIntoEntry___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCoreStorage *)self dispatchSyncForEntryKey:v5 withBlock:v7];
}

- (void)dispatchSyncForEntryKey:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int64_t v7 = [(id)objc_opt_class() storageQueueNameForEntryKey:v6];

  id v8 = +[PLUtilities workQueueForKey:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__PLCoreStorage_dispatchSyncForEntryKey_withBlock___block_invoke;
  v10[3] = &unk_1E6254508;
  id v11 = v5;
  id v9 = v5;
  +[PLUtilities dispatchSyncIfNotCallerQueue:v8 withBlock:v10];
}

uint64_t __39__PLCoreStorage_updateEntry_withBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEntry:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withBlock:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)updateEntry:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__5;
  v13[4] = __Block_byref_object_dispose__5;
  id v8 = v6;
  id v14 = v8;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__711;
  v11[4] = __Block_byref_object_dispose__712;
  id v12 = (id)MEMORY[0x1C1869370](v7);
  id v9 = [v8 entryKey];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__PLCoreStorage_updateEntry_withBlock___block_invoke;
  v10[3] = &unk_1E6254530;
  void v10[4] = self;
  v10[5] = v13;
  v10[6] = v11;
  [(PLCoreStorage *)self dispatchAsyncForEntryKey:v9 withBlock:v10];

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

+ (id)storageQueueNameForClass:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0)
  {
    id v4 = @"storageQueue.shared";
  }
  else
  {
    id v5 = NSStringFromClass(a3);
    id v4 = [v5 stringByAppendingString:@".storageQueue"];
  }
  return v4;
}

- (BOOL)setFileProtectionForPath:(id)a3 withLevel:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultManager];
  uint64_t v12 = *MEMORY[0x1E4F28370];
  v13[0] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v11 = 0;
  LOBYTE(a3) = [v8 setAttributes:v9 ofItemAtPath:v7 error:&v11];

  return (char)a3;
}

void __30__PLCoreStorage_storageLocked__block_invoke()
{
  uint64_t v0 = MKBGetDeviceLockState();
  uint64_t v1 = MKBDeviceUnlockedSinceBoot();
  uint64_t v2 = v1;
  BOOL v4 = v0 == 1 && v1 == 0;
  storageLocked_storageLocked = v4;
  if (+[PLDefaults debugEnabled])
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Keybag lockstate=%d unlockedSinceBoot=%d", v0, v2);
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
    id v7 = [v6 lastPathComponent];
    id v8 = [NSString stringWithUTF8String:"-[PLCoreStorage storageLocked]_block_invoke"];
    +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:146];

    id v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
}

- (void)logPreUnlockState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v12 = v3;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "KEYBAG: Logging pre unlock state '%d'", buf, 8u);
  }

  id v6 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"preUnlock");
  long long v10 = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  id v8 = [(PLCoreStorage *)self storageOperator];
  [v8 logEventPointPreUnlock:v7];
}

- (PLCoreStorage)init
{
  v100[3] = *MEMORY[0x1E4F143B8];
  v90.receiver = self;
  v90.super_class = (Class)PLCoreStorage;
  uint64_t v2 = [(PLCoreStorage *)&v90 init];
  if (v2)
  {
    time_t v3 = time(0);
    srand(v3);
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __21__PLCoreStorage_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v4;
      if (init_defaultOnce_0 != -1) {
        dispatch_once(&init_defaultOnce_0, block);
      }
      if (init_classDebugEnabled_0)
      {
        id v5 = [NSString stringWithFormat:@"seeded random number generator, seed =%i", v3];
        id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        id v7 = [v6 lastPathComponent];
        id v8 = [NSString stringWithUTF8String:"-[PLCoreStorage init]"];
        +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:164];

        uint64_t v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    long long v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v11 = dispatch_get_global_queue(9, 0);
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("com.apple.powerlog.storage.background", v10, v11);
    backgroundQueue = v2->_backgroundQueue;
    v2->_backgroundQueue = (OS_dispatch_queue *)v12;

    id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v15 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.powerlog.storage.utility", v14, v15);
    utilityQueue = v2->_utilityQueue;
    v2->_utilityQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = +[PLUtilities containerPath];
    uint64_t v19 = [v18 stringByAppendingString:@"/Library/BatteryLife/"];
    v100[0] = v19;
    uint64_t v20 = +[PLUtilities containerPath];
    uint64_t v21 = [v20 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
    v100[1] = v21;
    v100[2] = @"/tmp/powerlog/";
    int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:3];

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v85 objects:v99 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v86 != v26) {
            objc_enumerationMutation(v23);
          }
          +[PLUtilities createAndChownDirectory:*(void *)(*((void *)&v85 + 1) + 8 * i)];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v85 objects:v99 count:16];
      }
      while (v25);
    }

    dispatch_time_t v28 = +[PLUtilities containerPath];
    double v29 = [v28 stringByAppendingString:@"/Library/BatteryLife/"];
    [(PLCoreStorage *)v2 setFileProtectionForPath:v29 withLevel:*MEMORY[0x1E4F28378]];

    id v30 = +[PLUtilities containerPath];
    uint64_t v31 = [v30 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
    v98 = v31;
    int v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v81 objects:v97 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v82;
      uint64_t v37 = *MEMORY[0x1E4F28358];
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v82 != v36) {
            objc_enumerationMutation(v33);
          }
          [(PLCoreStorage *)v2 setFileProtectionForPath:*(void *)(*((void *)&v81 + 1) + 8 * j) withLevel:v37];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v81 objects:v97 count:16];
      }
      while (v35);
    }

    v39 = [MEMORY[0x1E4F28CB8] defaultManager];
    v40 = +[PLUtilities containerPath];
    uint64_t v41 = [v40 stringByAppendingString:@"/Library/BatteryLife/CrashReporter/"];
    [v39 removeItemAtPath:v41 error:0];

    *(_WORD *)&v2->_storageLocked = 1;
    if ([(PLCoreStorage *)v2 storageLocked])
    {
      uint64_t v42 = PLLogCommon();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v42, OS_LOG_TYPE_DEFAULT, "KEYBAG: Locked", buf, 2u);
      }

      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __21__PLCoreStorage_init__block_invoke_60;
      v79[3] = &unk_1E62538C8;
      id v43 = v2;
      v80 = v43;
      v44 = (void *)MEMORY[0x1C1869370](v79);
      v45 = +[PLUtilities workQueueForClass:objc_opt_class()];
      uint64_t v46 = [PLCFNotificationOperatorComposition alloc];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __21__PLCoreStorage_init__block_invoke_65;
      v77[3] = &unk_1E6254368;
      id v78 = v44;
      id v47 = v44;
      uint64_t v48 = [(PLCFNotificationOperatorComposition *)v46 initWithWorkQueue:v45 forNotification:@"com.apple.mobile.keybagd.first_unlock" requireState:0 withBlock:v77];
      keybagFirstUnlockNotification = v43->_keybagFirstUnlockNotification;
      v43->_keybagFirstUnlockNotification = (PLCFNotificationOperatorComposition *)v48;
    }
    else
    {
      if (!+[PLUtilities isPowerlogHelperd]
        && _os_feature_enabled_impl())
      {
        [(PLCoreStorage *)v2 applyContainerPOSIXPermissions];
      }
      double v50 = PLLogCommon();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v50, OS_LOG_TYPE_DEFAULT, "KEYBAG: Unlocked", buf, 2u);
      }

      if (+[PLUtilities isPowerlogHelperd])
      {
        id v51 = +[PLUtilities containerPath];
        v52 = [v51 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];

        if (+[PLPlatform internalBuild])
        {
          v53 = +[PLDefaults objectForKey:@"BUI_DEMO_PATH" forApplicationID:@"com.apple.powerlogd" synchronize:1];
          id v54 = v53;
          if (v53)
          {
            __int16 v55 = NSString;
            v56 = [v53 pathExtension];
            v57 = [v55 stringWithFormat:@".%@", v56];
            int v58 = [v57 isEqualToString:@".PLSQL"];

            uint64_t v59 = [MEMORY[0x1E4F28CB8] defaultManager];
            int v60 = [v59 fileExistsAtPath:v54];

            double v61 = PLLogCommon();
            double v62 = v61;
            if (v58 && v60)
            {
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
                -[PLCoreStorage init]();
              }

              double v62 = v52;
              v52 = v54;
            }
            else if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              long long v92 = v54;
              __int16 v93 = 1024;
              int v94 = v58;
              __int16 v95 = 1024;
              int v96 = v60;
              _os_log_error_impl(&dword_1BBD2F000, v62, OS_LOG_TYPE_ERROR, "PLCoreStorage: Unable to load '%@'. Resorting to main DB... (hasDBExt = %d, fileExists = %d)", buf, 0x18u);
            }
          }
        }
        v67 = [[PLSQLiteConnection alloc] initWithFilePath:v52 withFlags:&unk_1F1585AC0];
        connection = v2->_connection;
        v2->_connection = v67;

        double v64 = PLLogCommon();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
          [(PLCoreStorage *)(id *)&v2->_connection init];
        }
      }
      else
      {
        uint64_t v63 = [PLSQLiteConnection alloc];
        v52 = +[PLUtilities containerPath];
        double v64 = [v52 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
        uint64_t v65 = [(PLSQLiteConnection *)v63 initWithFilePath:v64];
        uint64_t v66 = v2->_connection;
        v2->_connection = (PLSQLiteConnection *)v65;
      }
      if (!v2->_connection)
      {
        double v69 = [NSString stringWithFormat:@"no connection to DB"];
        v70 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        v71 = [v70 lastPathComponent];
        v72 = [NSString stringWithUTF8String:"-[PLCoreStorage init]"];
        +[PLCoreStorage logMessage:v69 fromFile:v71 fromFunction:v72 fromLineNumber:276];

        double v73 = PLLogCommon();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }

        +[PLUtilities exitWithReason:101];
      }
    }
    uint64_t v74 = objc_opt_new();
    safeCopyInProgress = v2->_safeCopyInProgress;
    v2->_safeCopyInProgress = (NSMutableSet *)v74;

    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_95);
    }
  }
  return v2;
}

BOOL __21__PLCoreStorage_init__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_0 = result;
  return result;
}

void __21__PLCoreStorage_init__block_invoke_60(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__PLCoreStorage_init__block_invoke_2;
  block[3] = &unk_1E62538C8;
  id v2 = *(id *)(a1 + 32);
  if (kPLTaskingEndNotification_block_invoke_onceToken != -1) {
    dispatch_once(&kPLTaskingEndNotification_block_invoke_onceToken, block);
  }
}

uint64_t __21__PLCoreStorage_init__block_invoke_2(uint64_t a1)
{
  id v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1BBD2F000, v2, OS_LOG_TYPE_DEFAULT, "KEYBAG: Unlock notification!", v4, 2u);
  }

  [*(id *)(a1 + 32) logPreUnlockState:0];
  return +[PLUtilities exitWithReason:1];
}

uint64_t __21__PLCoreStorage_init__block_invoke_65(uint64_t a1)
{
  id v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1BBD2F000, v2, OS_LOG_TYPE_DEFAULT, "KEYBAG: First unlock notification", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __21__PLCoreStorage_init__block_invoke_93()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1580750;
  v2[1] = &unk_1F1580768;
  v3[0] = @"BLOB";
  v3[1] = @"INTEGER";
  v2[2] = &unk_1F1580780;
  v2[3] = &unk_1F1580798;
  v3[2] = @"TEXT";
  v3[3] = @"REAL";
  v2[4] = &unk_1F15807B0;
  v2[5] = &unk_1F15807C8;
  v3[4] = @"INTEGER";
  v3[5] = @"INTEGER";
  v2[6] = &unk_1F15807E0;
  v2[7] = &unk_1F15807F8;
  v3[6] = @"INTEGER";
  v3[7] = @"REAL";
  v2[8] = &unk_1F1580810;
  v3[8] = @"BLOB";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  uint64_t v1 = (void *)PLVTypeToPLSQLiteType;
  PLVTypeToPLSQLiteType = v0;
}

- (BOOL)shouldApply136229065A
{
  return +[PLPlatform kPLDeviceClassIsOneOf:](PLPlatform, "kPLDeviceClassIsOneOf:", 200032, 200024, 200023, 200028, 200030, 200029, 200036, 200035, 200037, 200043, 200044, 200046, 200045, 200047, 0);
}

- (void)dealloc
{
  if (!+[PLUtilities isPowerlogHelperd])
  {
    time_t v3 = +[PLArchiveManager sharedInstance];
    [v3 setEnabled:0];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)PLCoreStorage;
  [(PLCoreStorage *)&v6 dealloc];
}

- (void)setupStorageVersions
{
  v18[3] = *MEMORY[0x1E4F143B8];
  time_t v3 = +[PowerlogCore sharedCore];
  uint64_t v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if ((v5 & 1) == 0 && !+[PLUtilities isPowerlogHelperd])
  {
    objc_super v6 = [(PLCoreStorage *)self connection];
    char v7 = [v6 tableExistsForTableName:@"PLCoreStorage_schemaVersions"];

    if (v7)
    {
      if ([(PLCoreStorage *)self verifySchemaVersionOfTable:@"PLCoreStorage_schemaVersions" matchesExpectedVersion:1.08])
      {
        [(PLCoreStorage *)self handleSchemaMismatchForTable:@"PLCoreStorage_schemaVersions" expectedVersion:2 schemaMatch:1.08];
      }
    }
    else
    {
      v16[0] = @"column-name";
      v16[1] = @"type";
      v17[0] = @"tableName";
      v17[1] = @"TEXT";
      v18[0] = &unk_1F15869B8;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
      v18[1] = v8;
      v14[0] = @"column-name";
      v14[1] = @"type";
      v15[0] = @"schemaVersion";
      v15[1] = @"REAL";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      v18[2] = v9;
      long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];

      uint64_t v11 = [(PLCoreStorage *)self connection];
      [v11 createTableName:@"PLCoreStorage_schemaVersions" withColumns:v10];

      dispatch_queue_t v12 = [(PLCoreStorage *)self connection];
      [v12 setSchemaVersion:@"PLCoreStorage_schemaVersions" forTableName:1.08];

      uint64_t v13 = [(PLCoreStorage *)self connection];
      [v13 createIndexOnTable:@"PLCoreStorage_schemaVersions" forColumn:@"tableName"];
    }
  }
}

- (void)startStorage
{
  if (+[PLUtilities PreUnlockTelemetryEnabled]
    || (+[PowerlogCore sharedCore],
        time_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 storage],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 storageLocked],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    objc_super v6 = (void *)MEMORY[0x1C1869120]();
    [(PLCoreStorage *)self setupStorageVersions];
    char v7 = +[PLUtilities workQueueForClass:objc_opt_class()];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__PLCoreStorage_startStorage__block_invoke;
    block[3] = &unk_1E62538C8;
    void block[4] = self;
    dispatch_async_and_wait(v7, block);

    id v8 = +[PLTimeManager sharedInstance];
    uint64_t v9 = [(PLCoreStorage *)self storageOperator];
    [v8 setStorageOperator:v9];

    long long v10 = +[PLTimeManager sharedInstance];
    [v10 initializeTimeOffsets];

    if (!+[PLUtilities isPowerlogHelperd]
      && !+[PLUtilities shouldLogPreUnlockTelemetry])
    {
      [(PLCoreStorage *)self cleanupTmp];
      [(PLCoreStorage *)self removeOldPowerlogFiles];
      if (+[PLDefaults BOOLForKey:@"removedIDIndex" ifNotSet:0])
      {
        uint64_t v11 = [(PLCoreStorage *)self connection];
        [v11 removeIDIndexes];

        +[PLDefaults setObject:MEMORY[0x1E4F1CC38] forKey:@"removedIDIndex" saveToDisk:1];
      }
      [(PLCoreStorage *)self registerDailyTasks];
      dispatch_queue_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v13 = [PLD_ManagedPreferencePath stringByAppendingString:@"/com.apple.powerlogd.plist"];
      char v14 = [v12 fileExistsAtPath:v13];

      uint64_t v15 = [PLKQueue alloc];
      dispatch_queue_t v16 = PLD_ManagedPreferencePath;
      id v17 = +[PLUtilities workQueueForKey:@"profileDefaultsKQueue"];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __29__PLCoreStorage_startStorage__block_invoke_2;
      v21[3] = &unk_1E6254390;
      char v22 = v14;
      void v21[4] = self;
      uint64_t v18 = [(PLKQueue *)v15 initWithPath:v16 withDispatchQueue:v17 withBlock:v21];

      [(PLCoreStorage *)self setProfileDefaultsKQueue:v18];
      uint64_t v19 = [(PLCoreStorage *)self profileDefaultsKQueue];
      [v19 setEnabled:1];

      [(PLCoreStorage *)self addAggdModeKeys];
      uint64_t v20 = +[PLUtilities workQueueForClass:objc_opt_class()];
      +[PLDefaults registerEPLNotificationWithQueue:v20];
    }
  }
}

void __29__PLCoreStorage_startStorage__block_invoke(uint64_t a1)
{
  +[PLEntryKey setupEntryObjectsForOperatorClass:objc_opt_class()];
  id v2 = +[PLOperator operator];
  [*(id *)(a1 + 32) setStorageOperator:v2];

  time_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 storageOperator];
  [v3 setupStorageForOperator:v4];
}

void __29__PLCoreStorage_startStorage__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  time_t v3 = [PLD_ManagedPreferencePath stringByAppendingString:@"/com.apple.powerlogd.plist"];
  int v4 = [v2 fileExistsAtPath:v3];

  if (*(unsigned __int8 *)(a1 + 40) != v4)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      char v14 = __29__PLCoreStorage_startStorage__block_invoke_3;
      uint64_t v15 = &unk_1E6253EC0;
      dispatch_queue_t v16 = @"profileDefaults";
      uint64_t v17 = v5;
      if (kPLTaskingEndNotification_block_invoke_2_defaultOnce != -1) {
        dispatch_once(&kPLTaskingEndNotification_block_invoke_2_defaultOnce, &v12);
      }
      int v6 = kPLTaskingEndNotification_block_invoke_2_classDebugEnabled;

      if (v6)
      {
        char v7 = [NSString stringWithFormat:@"*** WARNING *** SystemDebugProfile installed/uninstalled, bouncing powerlogd", v12, v13, v14, v15];
        id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        uint64_t v9 = [v8 lastPathComponent];
        long long v10 = [NSString stringWithUTF8String:"-[PLCoreStorage startStorage]_block_invoke_2"];
        +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:385];

        uint64_t v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 3, v12, v13, v14, v15);
  }
}

BOOL __29__PLCoreStorage_startStorage__block_invoke_3(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLTaskingEndNotification_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (void)addAggdModeKeys
{
  +[PLDefaults fullMode];
  PLADClientAddValueForScalarKey();
  if (+[PLDefaults fullMode]) {
    AnalyticsSendEventLazy();
  }
  +[PLDefaults liteMode];
  PLADClientAddValueForScalarKey();
  if (+[PLDefaults liteMode]) {
    AnalyticsSendEventLazy();
  }
  +[PLDefaults taskMode];
  PLADClientAddValueForScalarKey();
  if (+[PLDefaults taskMode])
  {
    AnalyticsSendEventLazy();
  }
}

void *__32__PLCoreStorage_addAggdModeKeys__block_invoke()
{
  return &unk_1F15869E0;
}

void *__32__PLCoreStorage_addAggdModeKeys__block_invoke_2()
{
  return &unk_1F1586A08;
}

void *__32__PLCoreStorage_addAggdModeKeys__block_invoke_3()
{
  return &unk_1F1586A30;
}

- (void)stopStorage
{
  time_t v3 = +[PLSubmissions sharedInstance];
  [v3 stopDRTasking];

  int v4 = +[PLRapidController sharedInstance];
  [v4 stopDRTasking];

  uint64_t v5 = +[PPSSafeguardController sharedInstance];
  [v5 unregisterDataCollectionActivity];

  [(PLCoreStorage *)self blockingFlushCachesWithReason:@"stopStorage"];
}

- (void)configureCacheFlush
{
  time_t v3 = [PLCFNotificationOperatorComposition alloc];
  int v4 = +[PLUtilities workQueueForClass:objc_opt_class()];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke;
  v20[3] = &unk_1E6253970;
  v20[4] = self;
  uint64_t v5 = [(PLCFNotificationOperatorComposition *)v3 initWithWorkQueue:v4 forNotification:@"com.apple.powerlogd.flushCaches" requireState:0 withBlock:v20];

  [(PLCoreStorage *)self setFlushCachesCFNotification:v5];
  int v6 = [PLCFNotificationOperatorComposition alloc];
  char v7 = +[PLUtilities workQueueForClass:objc_opt_class()];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke_2;
  v19[3] = &unk_1E6253970;
  v19[4] = self;
  id v8 = [(PLCFNotificationOperatorComposition *)v6 initWithWorkQueue:v7 forNotification:@"com.apple.powerlogd.blockingFlushCaches" requireState:0 withBlock:v19];

  [(PLCoreStorage *)self setBlockingFlushCachesCFNotification:v8];
  uint64_t v9 = [PLXPCResponderOperatorComposition alloc];
  backgroundQueue = self->_backgroundQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke_3;
  v18[3] = &unk_1E62543D8;
  void v18[4] = self;
  uint64_t v11 = [(PLXPCResponderOperatorComposition *)v9 initWithWorkQueue:backgroundQueue withRegistration:&unk_1F1586A58 withBlock:v18];
  [(PLCoreStorage *)self setXPCFlushCacheResponder:v11];
  if (+[PLDefaults BOOLForKey:@"CacheFlushTimerEnabled" ifNotSet:1])
  {
    uint64_t v12 = [PLTimer alloc];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0];
    double v14 = (double)+[PLDefaults longForKey:@"flushCachesInterval" ifNotSet:900];
    uint64_t v15 = +[PLUtilities workQueueForKey:@"CacheFlushTimer"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke_4;
    void v17[3] = &unk_1E6254400;
    v17[4] = self;
    dispatch_queue_t v16 = [(PLTimer *)v12 initWithFireDate:v13 withInterval:1 withTolerance:0 repeats:v15 withUserInfo:v17 withQueue:v14 withBlock:0.0];

    [(PLCoreStorage *)self setFlushCachesTimer:v16];
  }
}

uint64_t __36__PLCoreStorage_configureCacheFlush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushCachesWithReason:@"CFNotification"];
}

void __36__PLCoreStorage_configureCacheFlush__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) blockingFlushCachesWithReason:@"CFNotification"];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.powerlogd.blockingFlushCaches.complete", 0, 0, 4u);
}

void *__36__PLCoreStorage_configureCacheFlush__block_invoke_3(uint64_t a1)
{
  return &unk_1F1586A80;
}

void __36__PLCoreStorage_configureCacheFlush__block_invoke_4(uint64_t a1)
{
  id v2 = +[PLUtilities workQueueForClass:objc_opt_class()];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke_5;
  block[3] = &unk_1E62538C8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __36__PLCoreStorage_configureCacheFlush__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushCachesWithReason:@"Timer"];
}

- (void)initOperatorDependancies
{
  v60[6] = *MEMORY[0x1E4F143B8];
  [(PLCoreStorage *)self setStorageReady:1];
  if (+[PLUtilities shouldLogPreUnlockTelemetry])
  {
    [(PLCoreStorage *)self logPreUnlockState:1];
    [(PLCoreStorage *)self configureCacheFlush];
    return;
  }
  if (!+[PLUtilities isPowerlogHelperd])
  {
    [(PLCoreStorage *)self removeErroneousQualificationEntries];
    time_t v3 = [[PLXPCResponderOperatorComposition alloc] initWithWorkQueue:self->_backgroundQueue withRegistration:&unk_1F1586AA8 withBlock:&__block_literal_global_274];
    [(PLCoreStorage *)self setSafeFileResponder:v3];
    int v4 = [[PLXPCResponderOperatorComposition alloc] initWithWorkQueue:self->_backgroundQueue withRegistration:&unk_1F1586AD0 withBlock:&__block_literal_global_307];
    [(PLCoreStorage *)self setBlPathResponder:v4];
    uint64_t v5 = [[PLXPCResponderOperatorComposition alloc] initWithWorkQueue:self->_backgroundQueue withRegistration:&unk_1F1586AF8 withBlock:&__block_literal_global_316];
    [(PLCoreStorage *)self setArchivesResponder:v5];
    int v6 = [[PLXPCResponderOperatorComposition alloc] initWithWorkQueue:self->_backgroundQueue withRegistration:&unk_1F1586B20 withBlock:&__block_literal_global_328];
    [(PLCoreStorage *)self setQuarantineResponder:v6];
    char v7 = [[PLXPCResponderOperatorComposition alloc] initWithWorkQueue:self->_backgroundQueue withRegistration:&unk_1F1586B48 withBlock:&__block_literal_global_340];
    [(PLCoreStorage *)self setQuarantineCopyResponder:v7];
    id v8 = [[PLXPCResponderOperatorComposition alloc] initWithWorkQueue:self->_backgroundQueue withRegistration:&unk_1F1586B70 withBlock:&__block_literal_global_349];
    [(PLCoreStorage *)self setBatteryUIPlistsResponder:v8];
    uint64_t v9 = [PLXPCResponderOperatorComposition alloc];
    backgroundQueue = self->_backgroundQueue;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __41__PLCoreStorage_initOperatorDependancies__block_invoke_7;
    void v58[3] = &unk_1E62543D8;
    v58[4] = self;
    uint64_t v11 = [(PLXPCResponderOperatorComposition *)v9 initWithWorkQueue:backgroundQueue withRegistration:&unk_1F1586B98 withBlock:v58];
    [(PLCoreStorage *)self setUpgradeLogsResponder:v11];
    uint64_t v12 = +[PLSubmissions sharedInstance];
    uint64_t v13 = [(PLCoreStorage *)self storageOperator];
    [v12 setStorageOperator:v13];

    double v14 = +[PLArchiveManager sharedInstance];
    [v14 setEnabled:1];
  }
  BOOL v15 = [(PLCoreStorage *)self storageLocked];
  BOOL v16 = +[PLDefaults fullMode];
  if (!v15)
  {
    if (v16)
    {
      uint64_t v17 = kPLStorageModeFull;
      goto LABEL_16;
    }
    BOOL v18 = +[PLDefaults taskMode];
    uint64_t v17 = kPLStorageModeLite;
    uint64_t v19 = kPLStorageModeTask;
LABEL_14:
    if (v18) {
      uint64_t v17 = v19;
    }
    goto LABEL_16;
  }
  if (!v16)
  {
    BOOL v18 = +[PLDefaults taskMode];
    uint64_t v17 = kPLStorageModeLockedLite;
    uint64_t v19 = kPLStorageModeLockedTask;
    goto LABEL_14;
  }
  uint64_t v17 = kPLStorageModeLockedFull;
LABEL_16:
  uint64_t v20 = *v17;
  if (!+[PLUtilities isPowerlogHelperd])
  {
    if (+[PLDefaults objectExistsForKey:@"PLUUID"])
    {
      uint64_t v21 = +[PLDefaults objectForKey:@"PLUUID" synchronize:1];
      [(PLCoreStorage *)self setUuid:v21];
    }
    else
    {
      char v22 = [MEMORY[0x1E4F29128] UUID];
      id v23 = [v22 UUIDString];
      [(PLCoreStorage *)self setUuid:v23];

      uint64_t v21 = [(PLCoreStorage *)self uuid];
      +[PLDefaults setObject:v21 forKey:@"PLUUID" saveToDisk:1];
    }

    int64_t v24 = +[PLDefaults longForKey:@"PLExitReasonKey" ifNotSet:-1];
    +[PLDefaults setObject:0 forKey:@"PLExitReasonKey" saveToDisk:1];
    v56 = [(PLCoreStorage *)self storageOperator];
    v59[0] = @"Mode";
    v59[1] = @"Version";
    __int16 v55 = v20;
    v60[0] = v20;
    v60[1] = &unk_1F1584AF0;
    v59[2] = @"PID";
    uint64_t v25 = NSNumber;
    uint64_t v26 = [MEMORY[0x1E4F28F80] processInfo];
    objc_msgSend(v25, "numberWithInt:", objc_msgSend(v26, "processIdentifier"));
    dispatch_time_t v28 = v27 = (void *)0x1E4F28000;
    v60[2] = v28;
    v59[3] = @"ProcessName";
    double v29 = [MEMORY[0x1E4F28F80] processInfo];
    id v30 = [v29 processName];
    v60[3] = v30;
    v59[4] = @"ExitReason";
    uint64_t v31 = [NSNumber numberWithLong:v24];
    v60[4] = v31;
    v59[5] = @"DefaultsEnabled";
    BOOL v32 = +[PLDefaults BOOLForKey:@"logDefaultsToDB" ifNotSet:0];
    if (v32)
    {
      v27 = +[PLDefaults allDefaultsEnabled];
      [v27 description];
    }
    else
    {
      [MEMORY[0x1E4F1CA98] null];
    id v33 = };
    v60[5] = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:6];
    [v56 logEventForwardConfiguration:v34];

    if (v32)
    {

      id v33 = v27;
    }

    uint64_t v35 = +[PLSubmissions sharedInstance];
    [v35 taskingModeSafeguard];

    uint64_t v36 = +[PLSubmissions sharedInstance];
    [v36 taskingModeSetup];

    uint64_t v20 = v55;
  }
  uint64_t v37 = +[PLRapidController sharedInstance];
  [v37 registerDataCollectionActivity];

  if (+[PLPlatform internalBuild]
    && _os_feature_enabled_impl())
  {
    uint64_t v38 = +[PPSSafeguardController sharedInstance];
    [v38 registerDataCollectionActivity];
  }
  [(PLCoreStorage *)self configureCacheFlush];
  if (!+[PLUtilities isPowerlogHelperd])
  {
    v39 = [MEMORY[0x1E4FB36F8] sharedManager];
    [v39 registerUserSwitchStakeHolder:self];
  }
  v40 = (void *)MEMORY[0x1C1869120]();
  uint64_t v41 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v42 = +[PLUtilities containerPath];
  id v43 = [v41 fileURLWithPath:v42];

  v44 = [NSNumber numberWithBool:1];
  uint64_t v45 = *MEMORY[0x1E4F1C630];
  id v57 = 0;
  char v46 = [v43 setResourceValue:v44 forKey:v45 error:&v57];
  id v47 = v57;

  if ((v46 & 1) == 0)
  {
    uint64_t v48 = NSString;
    double v49 = [v43 lastPathComponent];
    double v50 = [v48 stringWithFormat:@"Error excluding %@ from backup %@", v49, v47];

    id v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
    v52 = [v51 lastPathComponent];
    v53 = [NSString stringWithUTF8String:"-[PLCoreStorage initOperatorDependancies]"];
    +[PLCoreStorage logMessage:v50 fromFile:v52 fromFunction:v53 fromLineNumber:797];

    id v54 = PLLogCommon();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [NSString stringWithFormat:@"Received safe log file request from %d, %@", a2, a3];
  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
  long long v10 = [v9 lastPathComponent];
  uint64_t v11 = [NSString stringWithUTF8String:"-[PLCoreStorage initOperatorDependancies]_block_invoke"];
  +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:494];

  uint64_t v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v70 = v8;
    _os_log_impl(&dword_1BBD2F000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  uint64_t v13 = (void *)[v7 mutableCopy];
  double v14 = +[PLFileStats logStartDate];
  BOOL v15 = [v14 convertFromMonotonicToSystem];

  BOOL v16 = +[PLFileStats logEndDate];
  uint64_t v17 = [v16 convertFromMonotonicToSystem];

  uint64_t v18 = [v13 objectForKeyedSubscript:@"clean"];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [v13 objectForKeyedSubscript:@"folder"];

    if (v20)
    {
      id v58 = v7;
      uint64_t v21 = [v13 objectForKeyedSubscript:@"folder"];
      char v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      buf[0] = 0;
      if ([v22 fileExistsAtPath:v21 isDirectory:buf] && buf[0])
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v23 = [v22 contentsOfDirectoryAtPath:v21 error:0];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v68 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v61 != v26) {
                objc_enumerationMutation(v23);
              }
              dispatch_time_t v28 = [v21 stringByAppendingString:*(void *)(*((void *)&v60 + 1) + 8 * i)];
              [v22 removeItemAtPath:v28 error:0];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v68 count:16];
          }
          while (v25);
        }
      }
      v66[0] = @"path";
      double v29 = [v13 objectForKeyedSubscript:@"folder"];
      v67[0] = v29;
      v66[1] = @"startDate";
      id v30 = v15;
      if (!v15)
      {
        id v30 = [MEMORY[0x1E4F1CA98] null];
      }
      v67[1] = v30;
      v66[2] = @"endDate";
      uint64_t v31 = v17;
      if (!v17)
      {
        uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
      }
      v67[2] = v31;
      BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
      if (v17)
      {
        if (v15)
        {
LABEL_21:

          id v7 = v58;
          goto LABEL_34;
        }
      }
      else
      {

        if (v15) {
          goto LABEL_21;
        }
      }

      goto LABEL_21;
    }
  }
  id v33 = [v13 objectForKeyedSubscript:@"path"];

  unint64_t v34 = 0x1E6253000uLL;
  if (v33)
  {
    uint64_t v35 = +[PLSubmissions sharedInstance];
    [v35 generatePLLSubmissionWithPayload:v13];
LABEL_24:

    goto LABEL_28;
  }
  id v59 = v7;
  uint64_t v36 = [MEMORY[0x1E4F1C9C8] filenameDateStringWithStartDate:v15 endDate:v17];
  uint64_t v37 = [v13 objectForKeyedSubscript:@"folder"];

  if (!v37)
  {
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:@"/tmp/powerlog/"];
    [v13 setObject:@"/tmp/powerlog/" forKeyedSubscript:@"folder"];
  }
  uint64_t v38 = NSString;
  v39 = [v13 objectForKeyedSubscript:@"folder"];
  v40 = +[PLUtilities shortUUIDString];
  uint64_t v41 = [v38 stringWithFormat:@"%@powerlog_%@_%@.PLSQL", v39, v36, v40];
  [v13 setObject:v41 forKeyedSubscript:@"path"];

  uint64_t v42 = +[PLSubmissions sharedInstance];
  [v42 generatePLLSubmissionWithPayload:v13];

  id v7 = v59;
  if (!v37)
  {
    uint64_t v47 = [v13 objectForKeyedSubscript:@"path"];
    uint64_t v35 = [(id)v47 lastPathComponent];

    uint64_t v48 = [v13 objectForKeyedSubscript:@"path"];
    double v49 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingString:v35];
    LOBYTE(v47) = +[PLUtilities moveItemAtPath:v48 toPath:v49 withName:v35 error:0];

    if ((v47 & 1) == 0)
    {
      double v50 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v51 = [v13 objectForKeyedSubscript:@"path"];
      v52 = [v13 objectForKeyedSubscript:@"path"];
      v53 = [v52 lastPathComponent];
      id v54 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingString:v53];
      [v50 moveItemAtPath:v51 toPath:v54 error:0];
    }
    __int16 v55 = [v13 objectForKeyedSubscript:@"path"];
    v56 = [v55 lastPathComponent];
    id v57 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingString:v56];
    [v13 setObject:v57 forKeyedSubscript:@"path"];

    id v7 = v59;
    unint64_t v34 = 0x1E6253000;
    goto LABEL_24;
  }
LABEL_28:
  id v43 = *(void **)(v34 + 1288);
  v44 = [v13 objectForKeyedSubscript:@"path"];
  [v43 markFileAsPurgeable:v44 withUrgency:512];

  v64[0] = @"path";
  uint64_t v21 = [v13 objectForKeyedSubscript:@"path"];
  v65[0] = v21;
  v64[1] = @"startDate";
  char v22 = v15;
  if (!v15)
  {
    char v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v65[1] = v22;
  v64[2] = @"endDate";
  uint64_t v45 = v17;
  if (!v17)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v65[2] = v45;
  BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
  if (v17)
  {
    if (v15) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  if (!v15) {
LABEL_34:
  }

LABEL_35:
  return v32;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_305()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  int v4 = @"BLPath";
  uint64_t v0 = +[PLUtilities containerPath];
  uint64_t v1 = [v0 stringByAppendingString:@"/Library/BatteryLife/"];
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a5 mutableCopy];
  int v6 = [v5 objectForKeyedSubscript:@"folder"];

  unint64_t v34 = v6;
  if (!v6)
  {
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:@"/tmp/powerlog/"];
    [v5 setObject:@"/tmp/powerlog/" forKeyedSubscript:@"folder"];
  }
  uint64_t v37 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = +[PLArchiveManager archiveEntriesFinished];
  uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v12 = [v5 objectForKeyedSubscript:@"disallow_resyncs"];
        if (![v12 BOOLValue])
        {

LABEL_12:
          double v14 = [v5 objectForKeyedSubscript:@"folder"];
          BOOL v15 = [v11 compressedPath];
          BOOL v16 = [v15 lastPathComponent];
          uint64_t v17 = [v14 stringByAppendingString:v16];

          uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v19 = [v11 compressedPath];
          [v18 copyItemAtPath:v19 toPath:v17 error:0];

          +[PLUtilities markFileAsPurgeable:v17 withUrgency:512];
          [v11 setSyncedOffDate:v37];

          continue;
        }
        char v13 = [v11 syncedOff];

        if ((v13 & 1) == 0) {
          goto LABEL_12;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v8);
  }

  if (!v34)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obja = +[PLArchiveManager allArchivePaths];
    uint64_t v20 = [obja countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(obja);
          }
          uint64_t v24 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          uint64_t v25 = [v5 objectForKeyedSubscript:@"folder"];
          uint64_t v26 = [v24 lastPathComponent];
          v27 = [v25 stringByAppendingString:v26];

          dispatch_time_t v28 = [MEMORY[0x1E4F28CB8] defaultManager];
          LODWORD(v26) = [v28 fileExistsAtPath:v27];

          if (v26)
          {
            double v29 = [v24 lastPathComponent];
            id v30 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingString:v29];
            +[PLUtilities moveItemAtPath:v27 toPath:v30 withName:v29 error:0];
            +[PLUtilities markFileAsPurgeable:v30 withUrgency:512];
          }
        }
        uint64_t v21 = [obja countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v21);
    }

    [v5 setObject:@"/var/mobile/Library/Logs/CrashReporter/" forKeyedSubscript:@"folder"];
  }
  char v46 = @"folder";
  uint64_t v31 = objc_msgSend(v5, "objectForKeyedSubscript:");
  uint64_t v47 = v31;
  BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];

  return v32;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v7 = 0x1E6253000uLL;
  uint64_t v8 = +[PLUtilities containerPath];
  uint64_t v9 = [v8 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
  long long v10 = [v6 contentsOfDirectoryAtPath:v9 error:0];

  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v30 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        BOOL v15 = [*(id *)(v7 + 1288) containerPath];
        BOOL v16 = [v15 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
        uint64_t v17 = [v16 stringByAppendingString:v14];

        uint64_t v18 = [v5 objectForKeyedSubscript:@"folder"];

        if (v18)
        {
          uint64_t v19 = [v5 objectForKeyedSubscript:@"folder"];
          uint64_t v20 = [v19 stringByAppendingString:v14];

          uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v5 objectForKeyedSubscript:@"folder"];
          id v23 = v22 = v7;
          uint64_t v24 = [v23 stringByAppendingString:v14];
          [v21 moveItemAtPath:v17 toPath:v24 error:0];

          unint64_t v7 = v22;
        }
        else
        {
          uint64_t v20 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingString:v14];
          [*(id *)(v7 + 1288) moveItemAtPath:v17 toPath:v20 withName:v14 error:0];
        }
        [*(id *)(v7 + 1288) markFileAsPurgeable:v20 withUrgency:512];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v12);
  }

  uint64_t v35 = @"folder";
  uint64_t v25 = objc_msgSend(v5, "objectForKeyedSubscript:");
  if (v25)
  {
    uint64_t v26 = [v5 objectForKeyedSubscript:@"folder"];
  }
  else
  {
    uint64_t v26 = @"/var/mobile/Library/Logs/CrashReporter/";
  }
  uint64_t v36 = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  if (v25) {

  }
  return v27;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  int v6 = [v5 objectForKeyedSubscript:@"folder"];
  if (v6)
  {
    unint64_t v7 = [v5 objectForKeyedSubscript:@"folder"];
  }
  else
  {
    unint64_t v7 = @"/var/mobile/Library/Logs/CrashReporter/";
  }

  uint64_t v8 = +[PLUtilities containerPath];
  uint64_t v9 = [v8 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
  +[PLUtilities PLCopyItemsFromPath:v9 toPath:v7];

  uint64_t v12 = @"folder";
  v13[0] = v7;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return v10;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = v9;
  if (v9
    && ([v9 objectForKeyedSubscript:@"folder"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    uint64_t v12 = +[PLUtilities containerPath];
    char v13 = [v12 stringByAppendingString:@"/Library/BatteryLife/Debug/"];

    uint64_t v14 = [v10 objectForKeyedSubscript:@"folder"];
    BOOL v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v16 = [v15 contentsOfDirectoryAtPath:v13 error:0];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __41__PLCoreStorage_initOperatorDependancies__block_invoke_6;
    uint64_t v26 = &unk_1E6254448;
    id v27 = v13;
    id v28 = v14;
    id v29 = v15;
    id v17 = v15;
    id v18 = v14;
    id v19 = v13;
    [v16 enumerateObjectsUsingBlock:&v23];
    uint64_t v30 = @"folder";
    uint64_t v20 = objc_msgSend(v10, "objectForKeyedSubscript:", @"folder", v23, v24, v25, v26);
    v31[0] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v21;
}

void __41__PLCoreStorage_initOperatorDependancies__block_invoke_6(uint64_t a1, void *a2)
{
  time_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 stringByAppendingString:v4];
  id v5 = [*(id *)(a1 + 40) stringByAppendingString:v4];

  [*(id *)(a1 + 48) copyItemAtPath:v6 toPath:v5 error:0];
  +[PLUtilities markFileAsPurgeable:v5 withUrgency:512];
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[a5 mutableCopy];
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __41__PLCoreStorage_initOperatorDependancies__block_invoke_7_cold_1((uint64_t)v6, v7);
  }

  if (v6
    && ([v6 objectForKeyedSubscript:@"folder"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = *(void **)(a1 + 32);
    long long v10 = +[PLUtilities containerPath];
    uint64_t v11 = [v10 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MajorVersion"];
    uint64_t v12 = [v6 objectForKeyedSubscript:@"folder"];
    [v9 copyUpgradePowerlogsAtPath:v11 toPath:v12];

    char v13 = *(void **)(a1 + 32);
    uint64_t v14 = +[PLUtilities containerPath];
    BOOL v15 = [v14 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MinorVersion"];
    BOOL v16 = [v6 objectForKeyedSubscript:@"folder"];
    [v13 copyUpgradePowerlogsAtPath:v15 toPath:v16];

    uint64_t v20 = @"folder";
    id v17 = [v6 objectForKeyedSubscript:@"folder"];
    v21[0] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v18;
}

- (void)copyUpgradePowerlogsAtPath:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v7 contentsOfDirectoryAtPath:v5 error:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke;
  v12[3] = &unk_1E6254448;
  id v13 = v5;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v5;
  [v8 enumerateObjectsUsingBlock:v12];
}

void __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] stringByAppendingPathComponent:v3];
  id v5 = [a1[5] contentsOfDirectoryAtPath:v4 error:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke_2;
  v8[3] = &unk_1E6254448;
  id v9 = v4;
  id v10 = v3;
  id v11 = a1[6];
  id v6 = v3;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 stringByAppendingPathComponent:v4];
  id v6 = [NSString stringWithFormat:@"%@_%@_%@", @"UpgradeLogs", *(void *)(a1 + 40), v4];

  id v7 = [*(id *)(a1 + 48) stringByAppendingPathComponent:v6];
  id v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke_2_cold_1();
  }

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  char v10 = [v9 copyItemAtPath:v5 toPath:v7 error:&v13];
  id v11 = v13;

  if (v10)
  {
    +[PLUtilities markFileAsPurgeable:v7 withUrgency:512];
  }
  else
  {
    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_error_impl(&dword_1BBD2F000, v12, OS_LOG_TYPE_ERROR, "Failed to copy upgrade logs at path: %@ to path: %@ with error: %@", buf, 0x20u);
    }
  }
}

- (void)removeOldPowerlogFiles
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtPath:@"/var/mobile/Library/BatteryLife" error:0];
}

- (void)registerDailyTasks
{
  +[PLDefaults doubleForKey:@"dbDailyTasksInterval" ifNotSet:-1.0];
  double v4 = v3;
  BOOL v5 = +[PLDefaults debugEnabled];
  if (v4 <= 0.0)
  {
    if (v5)
    {
      uint64_t v17 = objc_opt_class();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __35__PLCoreStorage_registerDailyTasks__block_invoke_409;
      v28[3] = &unk_1E6253EC0;
      id v29 = @"DailyTasks";
      uint64_t v30 = v17;
      if (registerDailyTasks_defaultOnce_407 != -1) {
        dispatch_once(&registerDailyTasks_defaultOnce_407, v28);
      }
      int v18 = registerDailyTasks_classDebugEnabled_408;

      if (v18)
      {
        id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Setting up dailyTaskNotification dbDailyTasksInterval=%f", *(void *)&v4);
        uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        uint64_t v21 = [v20 lastPathComponent];
        unint64_t v22 = [NSString stringWithUTF8String:"-[PLCoreStorage registerDailyTasks]"];
        +[PLCoreStorage logMessage:v19 fromFile:v21 fromFunction:v22 fromLineNumber:849];

        uint64_t v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    uint64_t v24 = [PLNSNotificationOperatorComposition alloc];
    utilityQueue = self->_utilityQueue;
    uint64_t v26 = *MEMORY[0x1E4F1C2E0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __35__PLCoreStorage_registerDailyTasks__block_invoke_414;
    v27[3] = &unk_1E6253970;
    v27[4] = self;
    __int16 v16 = [(PLNSNotificationOperatorComposition *)v24 initWithWorkQueue:utilityQueue forNotification:v26 withBlock:v27];
    [(PLCoreStorage *)self setDailyTaskNotification:v16];
  }
  else
  {
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__PLCoreStorage_registerDailyTasks__block_invoke;
      block[3] = &unk_1E6253EC0;
      long long v33 = @"DailyTasks";
      uint64_t v34 = v6;
      if (registerDailyTasks_defaultOnce != -1) {
        dispatch_once(&registerDailyTasks_defaultOnce, block);
      }
      int v7 = registerDailyTasks_classDebugEnabled;

      if (v7)
      {
        id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Setting up dailyTaskTimer with dbDailyTasksInterval=%f", *(void *)&v4);
        id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        char v10 = [v9 lastPathComponent];
        id v11 = [NSString stringWithUTF8String:"-[PLCoreStorage registerDailyTasks]"];
        +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:840];

        uint64_t v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    id v13 = [PLTimer alloc];
    id v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v4];
    id v15 = self->_utilityQueue;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __35__PLCoreStorage_registerDailyTasks__block_invoke_403;
    v31[3] = &unk_1E6254400;
    v31[4] = self;
    __int16 v16 = [(PLTimer *)v13 initWithFireDate:v14 withInterval:1 withTolerance:0 repeats:v15 withUserInfo:v31 withQueue:v4 withBlock:0.0];

    [(PLCoreStorage *)self setDailyTaskTimer:v16];
  }
}

BOOL __35__PLCoreStorage_registerDailyTasks__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  registerDailyTasks_classDebugEnabled = result;
  return result;
}

uint64_t __35__PLCoreStorage_registerDailyTasks__block_invoke_403(uint64_t a1)
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __35__PLCoreStorage_registerDailyTasks__block_invoke_2;
    id v13 = &unk_1E6253EC0;
    id v14 = @"DailyTasks";
    uint64_t v15 = v2;
    if (kPLTaskingEndNotification_block_invoke_3_defaultOnce != -1) {
      dispatch_once(&kPLTaskingEndNotification_block_invoke_3_defaultOnce, &v10);
    }
    int v3 = kPLTaskingEndNotification_block_invoke_3_classDebugEnabled;

    if (v3)
    {
      double v4 = objc_msgSend(NSString, "stringWithFormat:", @"DailyTasks timer!", v10, v11, v12, v13);
      BOOL v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      uint64_t v6 = [v5 lastPathComponent];
      int v7 = [NSString stringWithUTF8String:"-[PLCoreStorage registerDailyTasks]_block_invoke"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:843];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dailyTasks", v10, v11, v12, v13);
}

BOOL __35__PLCoreStorage_registerDailyTasks__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLTaskingEndNotification_block_invoke_3_classDebugEnabled = result;
  return result;
}

BOOL __35__PLCoreStorage_registerDailyTasks__block_invoke_409(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  registerDailyTasks_classDebugEnabled_408 = result;
  return result;
}

uint64_t __35__PLCoreStorage_registerDailyTasks__block_invoke_414(uint64_t a1)
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __35__PLCoreStorage_registerDailyTasks__block_invoke_2_415;
    id v13 = &unk_1E6253EC0;
    id v14 = @"DailyTasks";
    uint64_t v15 = v2;
    if (kPLTaskingEndNotification_block_invoke_4_defaultOnce != -1) {
      dispatch_once(&kPLTaskingEndNotification_block_invoke_4_defaultOnce, &v10);
    }
    int v3 = kPLTaskingEndNotification_block_invoke_4_classDebugEnabled;

    if (v3)
    {
      double v4 = objc_msgSend(NSString, "stringWithFormat:", @"DailyTasks notification!", v10, v11, v12, v13);
      BOOL v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      uint64_t v6 = [v5 lastPathComponent];
      int v7 = [NSString stringWithUTF8String:"-[PLCoreStorage registerDailyTasks]_block_invoke"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:852];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dailyTasks", v10, v11, v12, v13);
}

BOOL __35__PLCoreStorage_registerDailyTasks__block_invoke_2_415(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLTaskingEndNotification_block_invoke_4_classDebugEnabled = result;
  return result;
}

- (void)dailyTasks
{
  int v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "DailyTasks fire!", buf, 2u);
  }

  double v4 = [(PLCoreStorage *)self connection];
  [v4 removeEmptyOldTables];

  [(PLCoreStorage *)self cleanupTmp];
  [(PLCoreStorage *)self cleanupQuarantine];
  BOOL v5 = +[PLSubmissions sharedInstance];
  [v5 generateOTASubmissionAndSendTaskingEndSubmission:1];

  BOOL v6 = +[PLDefaults fullMode];
  int v7 = @"com.apple.powerlogd.litemodesize";
  if (v6) {
    int v7 = @"com.apple.powerlogd.fullmodesize";
  }
  id v8 = v7;
  id v9 = +[PLUtilities containerPath];
  uint64_t v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
  +[PLFileStats fileSizeAtPath:v10];
  PLADClientAddValueForScalarKey();

  BOOL v11 = +[PLDefaults fullMode];
  uint64_t v12 = @"litemode";
  if (v11) {
    uint64_t v12 = @"fullmode";
  }
  id v13 = v12;
  AnalyticsSendEventLazy();
  id v14 = +[PLArchiveManager lastArchivePath];
  if (v14)
  {
    [(__CFString *)v8 stringByAppendingString:@".compressed"];
    +[PLFileStats fileSizeAtPath:v14];
    PLADClientAddValueForScalarKey();
    uint64_t v17 = v13;
    id v18 = v14;
    AnalyticsSendEventLazy();
  }
  uint64_t v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_DEFAULT, "DailyTasks reporting perf stats to CA", buf, 2u);
  }

  [(PLCoreStorage *)self reportPerfStats];
  __int16 v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_DEFAULT, "DailyTasks done!", buf, 2u);
  }
}

id __27__PLCoreStorage_dailyTasks__block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = *(void *)(a1 + 32);
  v7[0] = @"mode";
  v7[1] = @"size";
  uint64_t v1 = NSNumber;
  uint64_t v2 = +[PLUtilities containerPath];
  int v3 = [v2 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
  double v4 = objc_msgSend(v1, "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v3));
  v7[2] = @"compressed";
  v8[1] = v4;
  v8[2] = MEMORY[0x1E4F1CC28];
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

id __27__PLCoreStorage_dailyTasks__block_invoke_2(uint64_t a1)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  v5[0] = @"mode";
  v5[1] = @"size";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v1));
  void v5[2] = @"compressed";
  v6[1] = v2;
  v6[2] = MEMORY[0x1E4F1CC38];
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

- (void)applyContainerPOSIXPermissions
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Applying container permissions", v2, v3, v4, v5, v6);
}

id __47__PLCoreStorage_applyContainerPOSIXPermissions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  [v2 setObject:v3 forKeyedSubscript:@"DidSetPermissions"];

  return v2;
}

- (void)reportPerfStats
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = [&unk_1F1585AD8 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v14;
    *(void *)&long long v3 = 138412290;
    long long v11 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(&unk_1F1585AD8);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v8 = +[PLUtilities getPerfStatsForProcess:](PLUtilities, "getPerfStatsForProcess:", v7, v11);
        id v9 = v8;
        if (v8)
        {
          uint64_t v12 = v8;
          AnalyticsSendEventLazy();
          uint64_t v10 = v12;
        }
        else
        {
          uint64_t v10 = PLLogCommon();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v11;
            uint64_t v18 = v7;
            _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_INFO, "DailyTasks perf stats not available for %@", buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [&unk_1F1585AD8 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v4);
  }
}

id __32__PLCoreStorage_reportPerfStats__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)cleanupTmp
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v3 = NSTemporaryDirectory();
  id v58 = 0;
  uint64_t v4 = [v2 contentsOfDirectoryAtPath:v3 error:&v58];
  id v5 = v58;

  id v43 = (id)objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v55;
    uint64_t v40 = *MEMORY[0x1E4F282C0];
    id v9 = @".PLSQL";
    do
    {
      uint64_t v10 = 0;
      uint64_t v46 = v7;
      do
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v54 + 1) + 8 * v10);
        if (([v11 hasSuffix:v9] & 1) != 0
          || ([v11 hasSuffix:@".PLSQL-shm"] & 1) != 0
          || [v11 hasSuffix:@".PLSQL-wal"])
        {
          if ([v11 hasPrefix:@"PLSafeFileInprogress_"])
          {
            uint64_t v12 = [v11 stringByReplacingOccurrencesOfString:@"PLSafeFileInprogress_" withString:&stru_1F15208F0];
            long long v13 = [v12 stringByReplacingOccurrencesOfString:v9 withString:&stru_1F15208F0];

            long long v14 = [(PLCoreStorage *)self safeCopyInProgress];
            char v15 = [v14 containsObject:v13];

            if ((v15 & 1) == 0) {
              [v43 addObject:v11];
            }
          }
          else
          {
            uint64_t v16 = v8;
            uint64_t v17 = v9;
            uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v19 = NSString;
            uint64_t v20 = NSTemporaryDirectory();
            uint64_t v21 = [v19 stringWithFormat:@"%@/%@", v20, v11];
            id v53 = v5;
            long long v13 = [v18 attributesOfItemAtPath:v21 error:&v53];
            id v22 = v53;

            uint64_t v23 = [v13 objectForKeyedSubscript:v40];
            [v23 timeIntervalSinceNow];
            if (v24 < -7200.0) {
              [v43 addObject:v11];
            }

            id v5 = v22;
            id v9 = v17;
            uint64_t v8 = v16;
            uint64_t v7 = v46;
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v7);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v44 = v43;
  uint64_t v25 = [v44 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v47 = *(void *)v50;
    do
    {
      uint64_t v27 = 0;
      id v28 = v5;
      uint64_t v42 = v26;
      do
      {
        if (*(void *)v50 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v29 = *(void *)(*((void *)&v49 + 1) + 8 * v27);
        uint64_t v30 = [MEMORY[0x1E4F28CB8] defaultManager];
        long long v31 = NSString;
        long long v32 = NSTemporaryDirectory();
        long long v33 = [v31 stringWithFormat:@"%@/%@", v32, v29];
        id v48 = v28;
        char v34 = [v30 removeItemAtPath:v33 error:&v48];
        id v5 = v48;

        if ((v34 & 1) == 0)
        {
          uint64_t v35 = [NSString stringWithFormat:@"unable to remove file %@ %@", v29, v5];
          uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
          uint64_t v37 = [v36 lastPathComponent];
          uint64_t v38 = [NSString stringWithUTF8String:"-[PLCoreStorage cleanupTmp]"];
          +[PLCoreStorage logMessage:v35 fromFile:v37 fromFunction:v38 fromLineNumber:1004];

          long long v39 = PLLogCommon();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v60 = v35;
            _os_log_impl(&dword_1BBD2F000, v39, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }

          uint64_t v26 = v42;
        }
        ++v27;
        id v28 = v5;
      }
      while (v26 != v27);
      uint64_t v26 = [v44 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v26);
  }
}

- (void)cleanupQuarantine
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v3 = +[PLUtilities containerPath];
  uint64_t v4 = [v3 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
  id v5 = [v2 contentsOfDirectoryAtPath:v4 error:0];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v45;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v44 + 1) + 8 * v9);
        long long v11 = +[PLUtilities containerPath];
        uint64_t v12 = [v11 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
        long long v13 = [v12 stringByAppendingString:v10];

        long long v14 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v15 = [v14 attributesOfItemAtPath:v13 error:0];

        uint64_t v16 = [v15 fileModificationDate];
        uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
        [v17 timeIntervalSinceDate:v16];
        double v19 = v18;

        if (v19 > 604800.0)
        {
          uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v20 removeItemAtPath:v13 error:0];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v7);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", 0);
  id v22 = +[PLUtilities containerPath];
  uint64_t v23 = [v22 stringByAppendingString:@"/Library/PerfPowerTelemetry/Quarantine/"];
  double v24 = [v21 contentsOfDirectoryAtPath:v23 error:0];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8 * v28);
        uint64_t v30 = +[PLUtilities containerPath];
        long long v31 = [v30 stringByAppendingString:@"/Library/PerfPowerTelemetry/Quarantine/"];
        long long v32 = [v31 stringByAppendingString:v29];

        long long v33 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v34 = [v33 attributesOfItemAtPath:v32 error:0];

        uint64_t v35 = [v34 fileModificationDate];
        uint64_t v36 = [MEMORY[0x1E4F1C9C8] date];
        [v36 timeIntervalSinceDate:v35];
        double v38 = v37;

        if (v38 > 604800.0)
        {
          long long v39 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v39 removeItemAtPath:v32 error:0];
        }
        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v26);
  }
}

- (void)handleSchemaMismatchForTable:(id)a3 expectedVersion:(double)a4 schemaMatch:(signed __int16)a5
{
  v214[3] = *MEMORY[0x1E4F143B8];
  int v7 = (unsigned __int16)a5;
  id v8 = a3;
  uint64_t v9 = [(PLCoreStorage *)self connection];
  [v9 schemaVersionForTable:v8];
  double v11 = v10;

  if (v11 != a4)
  {
    uint64_t v12 = [(PLCoreStorage *)self storageOperator];
    v214[0] = v8;
    v213[0] = @"TableName";
    v213[1] = @"PreviousVersion";
    long long v13 = [NSNumber numberWithDouble:v11];
    v214[1] = v13;
    v213[2] = @"CurrentVersion";
    long long v14 = [NSNumber numberWithDouble:a4];
    v214[2] = v14;
    char v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v214 forKeys:v213 count:3];
    [v12 logEventForwardSchemaChange:v15];
  }
  uint64_t v16 = 0;
  if (v7 <= 65533)
  {
    if (!v7)
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v17 = [NSString stringWithFormat:@"ERROR! Do not call handleSchemaMismatchForTable with PLSchemaVersionSame"];
        long long v87 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        long long v88 = [v87 lastPathComponent];
        v89 = [NSString stringWithUTF8String:"-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]"];
        +[PLCoreStorage logMessage:v17 fromFile:v88 fromFunction:v89 fromLineNumber:1048];

        uint64_t v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
LABEL_72:
        }
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
LABEL_73:

        uint64_t v16 = 0;
        goto LABEL_113;
      }
LABEL_76:
      uint64_t v16 = 0;
      goto LABEL_114;
    }
    if (v7 == 65533)
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v17 = [NSString stringWithFormat:@"ERROR! Do not call handleSchemaMismatchForTable with PLSchemaVersionNone"];
        double v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        double v19 = [v18 lastPathComponent];
        uint64_t v20 = [NSString stringWithUTF8String:"-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]"];
        +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:1052];

        uint64_t v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_72;
        }
        goto LABEL_73;
      }
      goto LABEL_76;
    }
    goto LABEL_99;
  }
  if (v7 == 65534)
  {
    objc_super v90 = [(PLCoreStorage *)self connection];
    objc_msgSend(NSString, "stringWithFormat:", @"ALTER TABLE '%@' RENAME TO 'PLOLD_%@_%f';",
      v8,
      v8,
    long long v91 = *(void *)&v11);
    id v92 = (id)[v90 performQuery:v91];

    __int16 v93 = [(PLCoreStorage *)self connection];
    LODWORD(v91) = [v93 tableExistsForTableName:v8];

    if (v91)
    {
      uint64_t v16 = [NSString stringWithFormat:@"unable to move %@", v8];
      goto LABEL_103;
    }
    int v94 = [NSString stringWithFormat:@"%@_Dynamic", v8];
    __int16 v95 = [(PLCoreStorage *)self connection];
    int v96 = [v95 tableExistsForTableName:v94];

    if (!v96) {
      goto LABEL_80;
    }
    v97 = [(PLCoreStorage *)self connection];
    objc_msgSend(NSString, "stringWithFormat:", @"ALTER TABLE '%@' RENAME TO 'PLOLD_%@_%f';",
      v94,
      v94,
    v98 = *(void *)&v11);
    id v99 = (id)[v97 performQuery:v98];

    v100 = [(PLCoreStorage *)self connection];
    LODWORD(v98) = [v100 tableExistsForTableName:v94];

    if (v98)
    {
      uint64_t v16 = [NSString stringWithFormat:@"unable to move %@", v94];
      int v7 = 3;
    }
    else
    {
LABEL_80:
      v157 = v94;
      id v152 = v8;
      objc_msgSend(NSString, "stringWithFormat:", @"SELECT name FROM sqlite_master WHERE type='table' AND name LIKE \"%@_Array_%%\" AND name NOT LIKE \"PLOLD_%@_Array_%%\";",
        v8,
      uint64_t v101 = v8);
      uint64_t v102 = [(PLCoreStorage *)self connection];
      v159 = (void *)v101;
      v103 = [v102 performQuery:v101];

      long long v194 = 0u;
      long long v195 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      id v104 = v103;
      uint64_t v105 = [v104 countByEnumeratingWithState:&v192 objects:v212 count:16];
      id v161 = v104;
      if (!v105) {
        goto LABEL_88;
      }
      uint64_t v106 = v105;
      uint64_t v107 = *(void *)v193;
      do
      {
        for (uint64_t i = 0; i != v106; ++i)
        {
          if (*(void *)v193 != v107) {
            objc_enumerationMutation(v161);
          }
          v109 = *(void **)(*((void *)&v192 + 1) + 8 * i);
          v110 = [(PLCoreStorage *)self connection];
          v111 = self;
          v112 = NSString;
          uint64_t v113 = [v109 objectForKeyedSubscript:@"name"];
          v114 = [v109 objectForKeyedSubscript:@"name"];
          objc_msgSend(v112, "stringWithFormat:", @"ALTER TABLE '%@' RENAME TO 'PLOLD_%@_%f';",
            v113,
            v114,
          v115 = *(void *)&v11);
          id v116 = (id)[v110 performQuery:v115];

          self = v111;
          v117 = [(PLCoreStorage *)v111 connection];
          v118 = [v109 objectForKeyedSubscript:@"name"];
          LOBYTE(v113) = [v117 tableExistsForTableName:v118];

          if (v113)
          {
            v136 = NSString;
            id v123 = [v109 objectForKeyedSubscript:@"name"];
            uint64_t v16 = [v136 stringWithFormat:@"unable to move %@", v123];
            int v7 = 3;
            v135 = v161;
            v134 = v161;
            id v8 = v152;
            int v94 = v157;
            goto LABEL_97;
          }
        }
        id v104 = v161;
        uint64_t v106 = [v161 countByEnumeratingWithState:&v192 objects:v212 count:16];
      }
      while (v106);
LABEL_88:

      uint64_t v119 = v152);
      v120 = self;
      v121 = [(PLCoreStorage *)self connection];
      v155 = (void *)v119;
      v122 = [v121 performQuery:v119];

      long long v190 = 0u;
      long long v191 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      id v123 = v122;
      uint64_t v124 = [v123 countByEnumeratingWithState:&v188 objects:v211 count:16];
      if (v124)
      {
        uint64_t v125 = v124;
        uint64_t v126 = *(void *)v189;
        do
        {
          for (uint64_t j = 0; j != v125; ++j)
          {
            if (*(void *)v189 != v126) {
              objc_enumerationMutation(v123);
            }
            v128 = *(void **)(*((void *)&v188 + 1) + 8 * j);
            v129 = [(PLCoreStorage *)v120 connection];
            v130 = NSString;
            v131 = [v128 objectForKeyedSubscript:@"name"];
            v132 = [v130 stringWithFormat:@"DROP INDEX %@;", v131];
            id v133 = (id)[v129 performQuery:v132];
          }
          uint64_t v125 = [v123 countByEnumeratingWithState:&v188 objects:v211 count:16];
        }
        while (v125);
      }

      self = v120;
      id v8 = v152;
      [(PLCoreStorage *)v120 setupStorageForEntryKey:v152];
      uint64_t v16 = 0;
      int v7 = 65534;
      v134 = v155;
      int v94 = v157;
      v135 = v161;
LABEL_97:
    }
LABEL_99:
    if ((v7 - 1) > 2) {
      goto LABEL_114;
    }
    if (v7 == 1)
    {

      int v137 = 0;
      uint64_t v16 = @"Previous Version Newer";
      uint64_t v138 = 1;
      goto LABEL_105;
    }
    if (v7 == 2)
    {

      uint64_t v16 = @"New File Required";
      int v137 = 1;
      uint64_t v138 = 2;
LABEL_105:
      v139 = [(PLCoreStorage *)self storageOperator];
      v204[0] = @"TableName";
      v204[1] = @"CurrentVersion";
      v205[0] = v16;
      v205[1] = &unk_1F1580828;
      v204[2] = @"PreviousVersion";
      v205[2] = &unk_1F1580828;
      v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v205 forKeys:v204 count:3];
      [v139 logEventForwardSchemaChange:v140];

      v141 = [NSString stringWithFormat:@"ERROR! PLSQLversion mismatch on %@! expectedVersion=%f schemaMatch=%d error=%@", v8, *(void *)&a4, v138, v16];
      v142 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      v143 = [v142 lastPathComponent];
      v144 = [NSString stringWithUTF8String:"-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]"];
      +[PLCoreStorage logMessage:v141 fromFile:v143 fromFunction:v144 fromLineNumber:1165];

      v145 = PLLogCommon();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      v146 = PLLogCommon();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v197 = v8;
        __int16 v198 = 2048;
        double v199 = a4;
        __int16 v200 = 1024;
        int v201 = v138;
        __int16 v202 = 2112;
        v203 = v16;
        _os_log_error_impl(&dword_1BBD2F000, v146, OS_LOG_TYPE_ERROR, "SQL mismatch on %@ (expected=%f schemaMatch=%d error=%@)", buf, 0x26u);
      }

      uint64_t v17 = [(PLCoreStorage *)self connection];
      if (v137) {
        uint64_t v147 = 1008;
      }
      else {
        uint64_t v147 = 1007;
      }
      +[PLUtilities exitWithReason:v147 connection:v17];
      goto LABEL_113;
    }
LABEL_103:
    int v137 = 0;
    uint64_t v138 = 3;
    goto LABEL_105;
  }
  v156 = self;
  id v22 = [(PLCoreStorage *)self connection];
  id v160 = [v22 tableInfo:v8];

  +[PLEntryDefinition definitionForEntryKey:v8];
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  v158 = long long v187 = 0u;
  +[PLEntryDefinition allKeysForEntryDefinition:](PLEntryDefinition, "allKeysForEntryDefinition:");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v153 = [obj countByEnumeratingWithState:&v184 objects:v210 count:16];
  if (!v153) {
    goto LABEL_44;
  }
  id v150 = *(id *)v185;
  do
  {
    uint64_t v23 = 0;
    do
    {
      if (*(id *)v185 != v150) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void *)(*((void *)&v184 + 1) + 8 * v23);
      uint64_t v25 = +[PLEntryDefinition keyConfigsForEntryDefinition:v158];
      uint64_t v26 = [v25 objectForKey:v24];
      uint64_t v27 = [v26 objectForKeyedSubscript:@"Type"];
      int v28 = [v27 shortValue];

      if (v28)
      {
        long long v179 = 0u;
        long long v180 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        id v29 = v160;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v177 objects:v209 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v178;
          while (2)
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v178 != v32) {
                objc_enumerationMutation(v29);
              }
              char v34 = [*(id *)(*((void *)&v177 + 1) + 8 * k) objectForKeyedSubscript:@"name"];
              char v35 = [v34 isEqualToString:v24];

              if (v35)
              {
                char v36 = 1;
                goto LABEL_26;
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v177 objects:v209 count:16];
            if (v31) {
              continue;
            }
            break;
          }
        }
        char v36 = 0;
LABEL_26:

        if (+[PLDefaults debugEnabled])
        {
          uint64_t v37 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __74__PLCoreStorage_handleSchemaMismatchForTable_expectedVersion_schemaMatch___block_invoke_540;
          block[3] = &unk_1E6253EC0;
          v175 = @"schemaMismatch";
          uint64_t v176 = v37;
          if (handleSchemaMismatchForTable_expectedVersion_schemaMatch__defaultOnce_538 != -1) {
            dispatch_once(&handleSchemaMismatchForTable_expectedVersion_schemaMatch__defaultOnce_538, block);
          }
          int v38 = handleSchemaMismatchForTable_expectedVersion_schemaMatch__classDebugEnabled_539;

          if (v38)
          {
            long long v39 = NSString;
            long long v40 = NSStringFromBOOL();
            long long v41 = [v39 stringWithFormat:@"%@ key=%@ existsInTable=%@", v8, v24, v40];

            long long v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
            long long v43 = [v42 lastPathComponent];
            long long v44 = [NSString stringWithUTF8String:"-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]"];
            +[PLCoreStorage logMessage:v41 fromFile:v43 fromFunction:v44 fromLineNumber:1117];

            long long v45 = PLLogCommon();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v197 = v41;
              _os_log_debug_impl(&dword_1BBD2F000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        if ((v36 & 1) == 0)
        {
          long long v46 = NSString;
          long long v47 = (void *)PLVTypeToPLSQLiteType;
          id v48 = +[PLEntryDefinition keyConfigsForEntryDefinition:v158];
          long long v49 = [v48 objectForKey:v24];
          uint64_t v50 = [v49 objectForKeyedSubscript:@"Type"];
          long long v51 = [v47 objectForKeyedSubscript:v50];
          long long v52 = [v46 stringWithFormat:@"ALTER TABLE '%@' ADD COLUMN '%@' %@;", v8, v24, v51];

          id v53 = [(PLCoreStorage *)v156 connection];
          id v54 = (id)[v53 performQuery:v52];
LABEL_41:
        }
      }
      else if (+[PLDefaults debugEnabled])
      {
        uint64_t v55 = objc_opt_class();
        v181[0] = MEMORY[0x1E4F143A8];
        v181[1] = 3221225472;
        v181[2] = __74__PLCoreStorage_handleSchemaMismatchForTable_expectedVersion_schemaMatch___block_invoke;
        v181[3] = &unk_1E6253EC0;
        v182 = @"schemaMismatch";
        uint64_t v183 = v55;
        if (handleSchemaMismatchForTable_expectedVersion_schemaMatch__defaultOnce != -1) {
          dispatch_once(&handleSchemaMismatchForTable_expectedVersion_schemaMatch__defaultOnce, v181);
        }
        int v56 = handleSchemaMismatchForTable_expectedVersion_schemaMatch__classDebugEnabled;

        if (v56)
        {
          long long v52 = [NSString stringWithFormat:@"%@ key=%@ skip arrays", v8, v24];
          long long v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
          id v58 = [v57 lastPathComponent];
          id v59 = [NSString stringWithUTF8String:"-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]"];
          +[PLCoreStorage logMessage:v52 fromFile:v58 fromFunction:v59 fromLineNumber:1105];

          id v53 = PLLogCommon();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v197 = v52;
            _os_log_debug_impl(&dword_1BBD2F000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
          goto LABEL_41;
        }
      }
      ++v23;
    }
    while (v23 != v153);
    uint64_t v153 = [obj countByEnumeratingWithState:&v184 objects:v210 count:16];
  }
  while (v153);
LABEL_44:

  BOOL v60 = +[PLEntryDefinition overridesEntryDateForEntryKey:v8];
  long long v61 = (void *)MEMORY[0x1E4F1CC08];
  if (v60) {
    long long v61 = &unk_1F1586BE8;
  }
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  id obja = v61;
  id v151 = [obja allKeys];
  uint64_t v62 = [v151 countByEnumeratingWithState:&v170 objects:v208 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v154 = *(void *)v171;
    do
    {
      for (uint64_t m = 0; m != v63; ++m)
      {
        if (*(void *)v171 != v154) {
          objc_enumerationMutation(v151);
        }
        uint64_t v65 = *(void *)(*((void *)&v170 + 1) + 8 * m);
        long long v166 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        id v66 = v160;
        uint64_t v67 = [v66 countByEnumeratingWithState:&v166 objects:v207 count:16];
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v167;
LABEL_53:
          uint64_t v70 = 0;
          while (1)
          {
            if (*(void *)v167 != v69) {
              objc_enumerationMutation(v66);
            }
            uint64_t v71 = [*(id *)(*((void *)&v166 + 1) + 8 * v70) objectForKeyedSubscript:@"name"];
            char v72 = [v71 isEqualToString:v65];

            if (v72) {
              break;
            }
            if (v68 == ++v70)
            {
              uint64_t v68 = [v66 countByEnumeratingWithState:&v166 objects:v207 count:16];
              if (v68) {
                goto LABEL_53;
              }
              goto LABEL_59;
            }
          }
        }
        else
        {
LABEL_59:

          double v73 = NSString;
          uint64_t v74 = (void *)PLVTypeToPLSQLiteType;
          v75 = [obja objectForKeyedSubscript:v65];
          v76 = [v74 objectForKeyedSubscript:v75];
          id v66 = [v73 stringWithFormat:@"ALTER TABLE '%@' ADD COLUMN '%@' %@;", v8, v65, v76];

          double v77 = [(PLCoreStorage *)v156 connection];
          id v78 = (id)[v77 performQuery:v66];
        }
      }
      uint64_t v63 = [v151 countByEnumeratingWithState:&v170 objects:v208 count:16];
    }
    while (v63);
  }

  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  int v79 = +[PLEntryDefinition allIndexKeysForEntryKey:v8];
  uint64_t v80 = [v79 countByEnumeratingWithState:&v162 objects:v206 count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    uint64_t v82 = *(void *)v163;
    do
    {
      for (uint64_t n = 0; n != v81; ++n)
      {
        if (*(void *)v163 != v82) {
          objc_enumerationMutation(v79);
        }
        uint64_t v84 = *(void *)(*((void *)&v162 + 1) + 8 * n);
        long long v85 = [(PLCoreStorage *)v156 connection];
        [v85 createIndexOnTable:v8 forColumn:v84];
      }
      uint64_t v81 = [v79 countByEnumeratingWithState:&v162 objects:v206 count:16];
    }
    while (v81);
  }

  long long v86 = [(PLCoreStorage *)v156 connection];
  [v86 setSchemaVersion:v8 forTableName:a4];

  uint64_t v16 = 0;
  uint64_t v17 = v160;
LABEL_113:

LABEL_114:
}

BOOL __74__PLCoreStorage_handleSchemaMismatchForTable_expectedVersion_schemaMatch___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  handleSchemaMismatchForTable_expectedVersion_schemaMatch__classDebugEnabled = result;
  return result;
}

BOOL __74__PLCoreStorage_handleSchemaMismatchForTable_expectedVersion_schemaMatch___block_invoke_540(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  handleSchemaMismatchForTable_expectedVersion_schemaMatch__classDebugEnabled_539 = result;
  return result;
}

- (signed)verifySchemaVersionOfTable:(id)a3 matchesExpectedVersion:(double)a4
{
  id v6 = a3;
  int v7 = [(PLCoreStorage *)self connection];
  int v8 = [v7 tableExistsForTableName:v6];

  if (v8)
  {
    uint64_t v9 = [(PLCoreStorage *)self connection];
    [v9 schemaVersionForTable:v6];
    double v11 = v10;

    if (v11 == 0.0)
    {
      signed __int16 v12 = -2;
    }
    else if (v11 == a4)
    {
      signed __int16 v12 = 0;
    }
    else if (v11 >= a4)
    {
      if (v11 <= a4) {
        signed __int16 v12 = 3;
      }
      else {
        signed __int16 v12 = 1;
      }
    }
    else if ((int)a4 == (int)v11)
    {
      signed __int16 v12 = -1;
    }
    else
    {
      signed __int16 v12 = -2;
    }
  }
  else
  {
    signed __int16 v12 = -3;
    double v11 = 0.0;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __67__PLCoreStorage_verifySchemaVersionOfTable_matchesExpectedVersion___block_invoke;
    uint64_t v24 = &unk_1E6253EC0;
    uint64_t v25 = @"schemaMismatch";
    uint64_t v26 = v13;
    if (verifySchemaVersionOfTable_matchesExpectedVersion__defaultOnce != -1) {
      dispatch_once(&verifySchemaVersionOfTable_matchesExpectedVersion__defaultOnce, &block);
    }
    int v14 = verifySchemaVersionOfTable_matchesExpectedVersion__classDebugEnabled;

    if (v14)
    {
      char v15 = [NSString stringWithFormat:@"%@ expectedVersion=%f schemaVersion=%f schemaMatch=%d", v6, *(void *)&a4, *(void *)&v11, v12, block, v22, v23, v24];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      uint64_t v17 = [v16 lastPathComponent];
      double v18 = [NSString stringWithUTF8String:"-[PLCoreStorage verifySchemaVersionOfTable:matchesExpectedVersion:]"];
      +[PLCoreStorage logMessage:v15 fromFile:v17 fromFunction:v18 fromLineNumber:1207];

      double v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }

  return v12;
}

BOOL __67__PLCoreStorage_verifySchemaVersionOfTable_matchesExpectedVersion___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  verifySchemaVersionOfTable_matchesExpectedVersion__classDebugEnabled = result;
  return result;
}

- (void)setupTableName:(id)a3 withEntryKeyConfig:(id)a4 withKeyOrder:(id)a5 isDynamic:(BOOL)a6 withShouldIndexFKID:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  char v15 = objc_opt_new();
  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = v16;
  uint64_t v70 = v13;
  uint64_t v65 = self;
  id v66 = v12;
  double v64 = v16;
  if (v8)
  {
    if (v7) {
      [v16 addObject:@"FK_ID"];
    }
    [v15 addObject:&unk_1F1586C10];
    double v18 = &unk_1F1586C38;
  }
  else
  {
    double v19 = +[PLEntryDefinition allIndexKeysForEntryKey:v12];
    [v17 addObjectsFromArray:v19];

    [v17 removeObject:@"FK_ID"];
    [v15 addObject:&unk_1F1586C10];
    if (+[PLEntryDefinition isAggregateForEntryKey:v12])
    {
      [v15 addObject:&unk_1F1586C60];
      [v15 addObject:&unk_1F1586C88];
      [v17 addObject:@"timestamp"];
      [v17 addObject:@"timeInterval"];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      uint64_t v20 = +[PLEntryDefinition allAggregatePrimaryKeysForEntryKey:v12];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v82 objects:v92 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v83 != v23) {
              objc_enumerationMutation(v20);
            }
            [v17 addObject:*(void *)(*((void *)&v82 + 1) + 8 * i)];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v82 objects:v92 count:16];
        }
        while (v22);
      }
      uint64_t v25 = v15;

      id v13 = v70;
      goto LABEL_18;
    }
    if (+[PLEntryDefinition overridesEntryDateForEntryKey:v12])
    {
      [v15 addObject:&unk_1F1586CB0];
      double v18 = &unk_1F1586CD8;
    }
    else
    {
      double v18 = &unk_1F1586D00;
    }
  }
  uint64_t v25 = v15;
  [v15 addObject:v18];
LABEL_18:
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v14;
  uint64_t v69 = [obj countByEnumeratingWithState:&v78 objects:v91 count:16];
  if (!v69) {
    goto LABEL_36;
  }
  uint64_t v68 = *(void *)v79;
  do
  {
    for (uint64_t j = 0; j != v69; ++j)
    {
      if (*(void *)v79 != v68) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void **)(*((void *)&v78 + 1) + 8 * j);
      int v28 = [v13 objectForKey:v27];
      id v29 = [v28 objectForKeyedSubscript:@"Type"];
      if ([v29 shortValue])
      {

LABEL_25:
        v87[0] = @"column-name";
        v87[1] = @"type";
        v88[0] = v27;
        uint64_t v30 = (void *)PLVTypeToPLSQLiteType;
        uint64_t v31 = [v13 objectForKey:v27];
        uint64_t v32 = [v31 objectForKeyedSubscript:@"Type"];
        long long v33 = [v30 objectForKeyedSubscript:v32];
        v88[1] = v33;
        char v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:2];
        [v25 addObject:v34];

        goto LABEL_34;
      }
      char v35 = [v13 objectForKey:v27];
      char v36 = [v35 objectForKeyedSubscript:@"TypeArraySize"];

      if (!v36) {
        goto LABEL_25;
      }
      uint64_t v37 = [v13 objectForKey:v27];
      int v38 = [v37 objectForKeyedSubscript:@"TypeArrayValue"];

      long long v39 = (void *)PLVTypeToPLSQLiteType;
      if (v38)
      {
        long long v40 = [v13 objectForKey:v27];
        long long v41 = [v40 objectForKeyedSubscript:@"TypeArrayValue"];
        uint64_t v31 = [v39 objectForKeyedSubscript:v41];
      }
      else
      {
        uint64_t v31 = [(id)PLVTypeToPLSQLiteType objectForKeyedSubscript:&unk_1F1580780];
      }
      for (uint64_t k = 0; ; uint64_t k = (k + 1))
      {
        long long v43 = [v70 objectForKey:v27];
        long long v44 = [v43 objectForKeyedSubscript:@"TypeArraySize"];
        int v45 = [v44 intValue];

        if ((int)k >= v45) {
          break;
        }
        v89[0] = @"column-name";
        long long v46 = objc_msgSend(v27, "stringByAppendingFormat:", @"_%d", k);
        v89[1] = @"type";
        v90[0] = v46;
        v90[1] = v31;
        long long v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:2];
        [v25 addObject:v47];
      }
      id v13 = v70;
LABEL_34:
    }
    uint64_t v69 = [obj countByEnumeratingWithState:&v78 objects:v91 count:16];
  }
  while (v69);
LABEL_36:

  id v48 = v25;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v49 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__PLCoreStorage_setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID___block_invoke;
    block[3] = &unk_1E6253EC0;
    v76 = @"setupTable";
    uint64_t v77 = v49;
    if (setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID__defaultOnce != -1) {
      dispatch_once(&setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID__defaultOnce, block);
    }
    int v50 = setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID__classDebugEnabled;

    if (v50)
    {
      long long v51 = [NSString stringWithFormat:@"tableName=%@ tableSchemaColumns=%@", v66, v25];
      long long v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      id v53 = [v52 lastPathComponent];
      id v54 = [NSString stringWithUTF8String:"-[PLCoreStorage setupTableName:withEntryKeyConfig:withKeyOrder:isDynamic:withShouldIndexFKID:]"];
      +[PLCoreStorage logMessage:v51 fromFile:v53 fromFunction:v54 fromLineNumber:1259];

      uint64_t v55 = PLLogCommon();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      id v13 = v70;
    }
  }
  int v56 = [(PLCoreStorage *)v65 connection];
  [v56 createTableName:v66 withColumns:v25];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v57 = v64;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v71 objects:v86 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v72;
    do
    {
      for (uint64_t m = 0; m != v59; ++m)
      {
        if (*(void *)v72 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void *)(*((void *)&v71 + 1) + 8 * m);
        uint64_t v63 = [(PLCoreStorage *)v65 connection];
        [v63 createIndexOnTable:v66 forColumn:v62];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v71 objects:v86 count:16];
    }
    while (v59);
  }
}

BOOL __94__PLCoreStorage_setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID__classDebugEnabled = result;
  return result;
}

- (void)setupArrayForTableName:(id)a3 forColumnNamed:(id)a4 withValueType:(signed __int16)a5 withShouldIndexFKID:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  void v21[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_opt_new();
  id v13 = [NSString stringWithFormat:@"%@_Array_%@", v11, v10];

  [v12 addObject:&unk_1F1586D28];
  [v12 addObject:&unk_1F1586D50];
  v20[0] = @"column-name";
  v20[1] = @"type";
  v21[0] = @"value";
  id v14 = (void *)PLVTypeToPLSQLiteType;
  char v15 = [NSNumber numberWithShort:v7];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];
  v21[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v12 addObject:v17];

  double v18 = [(PLCoreStorage *)self connection];
  [v18 createTableName:v13 withColumns:v12];

  if (v6)
  {
    double v19 = [(PLCoreStorage *)self connection];
    [v19 createIndexOnTable:v13 forColumn:@"FK_ID"];
  }
}

- (void)setupCompositeIndexOnTable:(id)a3 withColumns:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLCoreStorage *)self connection];
  [v8 createCompositeIndexOnTable:v7 forColumns:v6];
}

- (void)setupStorageForEntryKey:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!+[PLUtilities isPowerlogHelperd])
  {
    uint64_t v4 = +[PLEntryDefinition definitionForEntryKey:v3];
    long long v44 = +[PLEntryDefinition keyConfigsForEntryKey:v3];
    if (v44)
    {
      +[PLEntryDefinition schemaVersionForEntryKey:v3];
      double v6 = v5;
      uint64_t v7 = -[PLCoreStorage verifySchemaVersionOfTable:matchesExpectedVersion:](self, "verifySchemaVersionOfTable:matchesExpectedVersion:", v3);
      if (v6 > 0.0 && v7 == -3)
      {
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v9 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __41__PLCoreStorage_setupStorageForEntryKey___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          void block[4] = v9;
          if (setupStorageForEntryKey__defaultOnce != -1) {
            dispatch_once(&setupStorageForEntryKey__defaultOnce, block);
          }
          if (setupStorageForEntryKey__classDebugEnabled)
          {
            id v10 = [NSString stringWithFormat:@"No table for %@", v3];
            id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
            id v12 = [v11 lastPathComponent];
            id v13 = [NSString stringWithUTF8String:"-[PLCoreStorage setupStorageForEntryKey:]"];
            +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:1301];

            id v14 = PLLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
            }
          }
        }
        char v15 = [(PLCoreStorage *)self connection];
        [v15 setSchemaVersion:v3 forTableName:v6];

        uint64_t v16 = +[PLEntryDefinition sortedKeysFromEntryDefinition:v4];
        [(PLCoreStorage *)self setupTableName:v3 withEntryKeyConfig:v44 withKeyOrder:v16 isDynamic:0 withShouldIndexFKID:0];
        id v43 = v3;
        if (+[PLEntryDefinition hasArrayKeysForEntryKey:v3])
        {
          long long v41 = v16;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v17 = v4;
          id obj = +[PLEntryDefinition arrayKeysForEntryDefinition:v4];
          uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v47;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v47 != v20) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                uint64_t v23 = [v44 objectForKeyedSubscript:v22];
                uint64_t v24 = [v23 objectForKeyedSubscript:@"TypeArrayValue"];
                uint64_t v25 = [v24 shortValue];

                uint64_t v26 = +[PLEntryDefinition allIndexKeysForEntryDefinition:v17];
                uint64_t v27 = [v26 containsObject:@"FK_ID"];

                id v3 = v43;
                [(PLCoreStorage *)self setupArrayForTableName:v43 forColumnNamed:v22 withValueType:v25 withShouldIndexFKID:v27];
              }
              uint64_t v19 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
            }
            while (v19);
          }

          uint64_t v4 = v17;
          uint64_t v16 = v41;
        }
        if (+[PLEntryDefinition hasDynamicKeysForEntryDefinition:v4])
        {
          int v28 = +[PLEntryKey dynamicEntryKeyForEntryKey:v3];
          id v29 = +[PLEntryDefinition dynamicKeyConfigsForEntryDefinition:v4];
          uint64_t v30 = (void *)[v29 mutableCopy];

          uint64_t v31 = [v30 objectForKeyedSubscript:@"key"];

          if (v31)
          {
            uint64_t v32 = [v30 objectForKeyedSubscript:@"key"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              char v34 = [v30 objectForKeyedSubscript:@"key"];
              [v30 addEntriesFromDictionary:v34];

              [v30 removeObjectForKey:@"key"];
            }
          }
          else
          {
            char v35 = +[PLEntryDefinition sharedInstance];
            char v36 = objc_msgSend(v35, "commonTypeDict_StringFormat");
            [v30 setObject:v36 forKeyedSubscript:@"key"];
          }
          uint64_t v37 = [v30 allKeys];
          int v38 = [v37 sortedArrayUsingSelector:sel_compare_];

          long long v39 = +[PLEntryDefinition allIndexKeysForEntryDefinition:v4];
          uint64_t v40 = [v39 containsObject:@"FK_ID"];

          [(PLCoreStorage *)self setupTableName:v28 withEntryKeyConfig:v30 withKeyOrder:v38 isDynamic:1 withShouldIndexFKID:v40];
          id v3 = v43;
        }
      }
      else if (v7)
      {
        [(PLCoreStorage *)self handleSchemaMismatchForTable:v3 expectedVersion:v7 schemaMatch:v6];
      }
    }
  }
}

BOOL __41__PLCoreStorage_setupStorageForEntryKey___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  setupStorageForEntryKey__classDebugEnabled = result;
  return result;
}

- (void)setupStorageForOperator:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[PLUtilities isPowerlogHelperd]
    && !+[PLUtilities isPowerlogHelperd])
  {
    double v5 = +[PLEntryKey entryKeysForOperator:v4];
    if ([v5 count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      double v6 = objc_msgSend(v5, "copy", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [(PLCoreStorage *)self setupStorageForEntryKey:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)setupStorageForOperatorName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[PLUtilities isPowerlogHelperd])
  {
    double v5 = +[PLEntryKey entryKeysForOperatorName:v4];
    if ([v5 count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      double v6 = objc_msgSend(v5, "copy", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [(PLCoreStorage *)self setupStorageForEntryKey:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)setupStorageForOperatorClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!+[PLUtilities isPowerlogHelperd])
  {
    double v5 = +[PLEntryKey entryKeysForOperatorClass:a3];
    if ([v5 count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      double v6 = objc_msgSend(v5, "copy", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [(PLCoreStorage *)self setupStorageForEntryKey:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

BOOL __39__PLCoreStorage_flushCachesWithReason___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  flushCachesWithReason__classDebugEnabled = result;
  return result;
}

id __39__PLCoreStorage_flushCachesWithReason___block_invoke_646(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"Reason";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

int64_t __39__PLCoreStorage_flushCachesWithReason___block_invoke_648(uint64_t a1)
{
  int64_t result = +[PLDefaults longForKey:*(void *)(a1 + 32) ifNotSet:*(void *)(a1 + 40)];
  flushCachesWithReason__objectForKey = result;
  return result;
}

- (void)blockingFlushCachesWithReason:(id)a3
{
}

- (void)blockingFlushCachesWithReason:(id)a3 timeout:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLCoreStorage_blockingFlushCachesWithReason_timeout___block_invoke;
    block[3] = &unk_1E6253EC0;
    uint64_t v68 = @"blockingFlush";
    uint64_t v69 = v7;
    if (blockingFlushCachesWithReason_timeout__defaultOnce != -1) {
      dispatch_once(&blockingFlushCachesWithReason_timeout__defaultOnce, block);
    }
    int v8 = blockingFlushCachesWithReason_timeout__classDebugEnabled;

    if (v8)
    {
      uint64_t v9 = [NSString stringWithFormat:@"begin"];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      long long v11 = [v10 lastPathComponent];
      long long v12 = [NSString stringWithUTF8String:"-[PLCoreStorage blockingFlushCachesWithReason:timeout:]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:1444];

      long long v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v55 = v6;
  long long v14 = [MEMORY[0x1E4F1CA48] array];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  char v15 = +[PowerlogCore sharedCore];
  uint64_t v16 = [v15 agents];
  uint64_t v17 = [v16 allOperators];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v64 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = [*(id *)(*((void *)&v63 + 1) + 8 * i) className];
        [v14 addObject:v22];

        uint64_t v23 = +[PLCoreStorage storageQueueNameForClass:objc_opt_class()];
        [v14 addObject:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v19);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v24 = +[PowerlogCore sharedCore];
  uint64_t v25 = [v24 services];
  uint64_t v26 = [v25 allOperators];

  uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v60 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = [*(id *)(*((void *)&v59 + 1) + 8 * j) className];
        [v14 addObject:v31];

        uint64_t v32 = +[PLCoreStorage storageQueueNameForClass:objc_opt_class()];
        [v14 addObject:v32];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v28);
  }

  [(PLCoreStorage *)self blockingFlushQueues:v14 withTimeout:v4];
  [v14 removeAllObjects];
  [v14 addObject:@"PLTimeReferenceBaseband"];
  [v14 addObject:@"PLTimeReferenceSystem"];
  [v14 addObject:@"PLTimeReferenceKernel"];
  [v14 addObject:@"PLTimeManager"];
  if (!+[PLPlatform isHomePod])
  {
    long long v33 = +[PowerlogCore sharedCore];
    char v34 = [v33 accounting];

    if (v34)
    {
      char v35 = +[PowerlogCore sharedCore];
      char v36 = [v35 accounting];
      uint64_t v37 = [v36 className];
      [v14 addObject:v37];

      int v38 = +[PowerlogCore sharedCore];
      long long v39 = [v38 accounting];
      uint64_t v40 = +[PLCoreStorage storageQueueNameForClass:objc_opt_class()];
      [v14 addObject:v40];
    }
  }
  [(PLCoreStorage *)self blockingFlushQueues:v14 withTimeout:v4];
  [v14 removeAllObjects];
  long long v41 = (objc_class *)objc_opt_class();
  long long v42 = NSStringFromClass(v41);
  [v14 addObject:v42];

  [(PLCoreStorage *)self blockingFlushQueues:v14 withTimeout:v4];
  [v14 removeAllObjects];
  id v43 = (objc_class *)objc_opt_class();
  long long v44 = NSStringFromClass(v43);
  [v14 addObject:v44];

  [(PLCoreStorage *)self blockingFlushQueues:v14 withTimeout:v4];
  [v14 removeAllObjects];
  int v45 = +[PLCoreStorage storageQueueNameForClass:objc_opt_class()];
  [v14 addObject:v45];

  [(PLCoreStorage *)self blockingFlushQueues:v14 withTimeout:v4];
  [v14 removeAllObjects];
  [(PLCoreStorage *)self flushCachesWithReason:v55];
  long long v46 = (objc_class *)objc_opt_class();
  long long v47 = NSStringFromClass(v46);
  [v14 addObject:v47];

  [(PLCoreStorage *)self blockingFlushQueues:v14 withTimeout:v4];
  [v14 removeAllObjects];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v48 = objc_opt_class();
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __55__PLCoreStorage_blockingFlushCachesWithReason_timeout___block_invoke_673;
    v56[3] = &unk_1E6253EC0;
    id v57 = @"blockingFlush";
    uint64_t v58 = v48;
    if (blockingFlushCachesWithReason_timeout__defaultOnce_671 != -1) {
      dispatch_once(&blockingFlushCachesWithReason_timeout__defaultOnce_671, v56);
    }
    int v49 = blockingFlushCachesWithReason_timeout__classDebugEnabled_672;

    if (v49)
    {
      int v50 = [NSString stringWithFormat:@"end"];
      long long v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      uint64_t v52 = [v51 lastPathComponent];
      id v53 = [NSString stringWithUTF8String:"-[PLCoreStorage blockingFlushCachesWithReason:timeout:]"];
      +[PLCoreStorage logMessage:v50 fromFile:v52 fromFunction:v53 fromLineNumber:1507];

      id v54 = PLLogCommon();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __55__PLCoreStorage_blockingFlushCachesWithReason_timeout___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  blockingFlushCachesWithReason_timeout__classDebugEnabled = result;
  return result;
}

BOOL __55__PLCoreStorage_blockingFlushCachesWithReason_timeout___block_invoke_673(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  blockingFlushCachesWithReason_timeout__classDebugEnabled_672 = result;
  return result;
}

- (void)blockingFlushQueues:(id)a3 withTimeout:(int)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = 0x1E6253000uLL;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke;
    v59[3] = &unk_1E6253EC0;
    long long v60 = @"blockingFlush";
    uint64_t v61 = v7;
    if (blockingFlushQueues_withTimeout__defaultOnce != -1) {
      dispatch_once(&blockingFlushQueues_withTimeout__defaultOnce, v59);
    }
    int v8 = blockingFlushQueues_withTimeout__classDebugEnabled;

    if (v8)
    {
      uint64_t v9 = [NSString stringWithFormat:@"begin for queueNames=%@", v5];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      long long v11 = [v10 lastPathComponent];
      long long v12 = [NSString stringWithUTF8String:"-[PLCoreStorage blockingFlushQueues:withTimeout:]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:1511];

      long long v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v56;
    uint64_t v42 = *(void *)v56;
    id v43 = v15;
    do
    {
      uint64_t v19 = 0;
      uint64_t v44 = v17;
      do
      {
        if (*(void *)v56 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * v19);
        if ([*(id *)(v6 + 936) debugEnabled])
        {
          uint64_t v21 = objc_opt_class();
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_682;
          v52[3] = &unk_1E6253EC0;
          id v53 = @"blockingFlush";
          uint64_t v54 = v21;
          if (blockingFlushQueues_withTimeout__defaultOnce_680 != -1) {
            dispatch_once(&blockingFlushQueues_withTimeout__defaultOnce_680, v52);
          }
          int v22 = blockingFlushQueues_withTimeout__classDebugEnabled_681;

          if (v22)
          {
            uint64_t v23 = v14;
            unint64_t v24 = v6;
            uint64_t v25 = self;
            uint64_t v26 = [NSString stringWithFormat:@"waiting: %@", v20];
            uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
            uint64_t v28 = [v27 lastPathComponent];
            uint64_t v29 = [NSString stringWithUTF8String:"-[PLCoreStorage blockingFlushQueues:withTimeout:]"];
            +[PLCoreStorage logMessage:v26 fromFile:v28 fromFunction:v29 fromLineNumber:1515];

            uint64_t v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v63 = v26;
              _os_log_debug_impl(&dword_1BBD2F000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v25;
            unint64_t v6 = v24;
            dispatch_semaphore_t v14 = v23;
            id v15 = v43;
            uint64_t v17 = v44;
            uint64_t v18 = v42;
          }
        }
        uint64_t v31 = +[PLUtilities workQueueForKey:v20];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_686;
        block[3] = &unk_1E62544E0;
        int v49 = v14;
        int v50 = self;
        uint64_t v51 = v20;
        dispatch_async(v31, block);

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v17);
  }

  if ([v15 count])
  {
    unint64_t v32 = 0;
    do
    {
      dispatch_time_t v33 = dispatch_time(0, 1000000000 * a4);
      dispatch_semaphore_wait(v14, v33);
      ++v32;
    }
    while ([v15 count] > v32);
  }
  if ([*(id *)(v6 + 936) debugEnabled])
  {
    uint64_t v34 = objc_opt_class();
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_692;
    v45[3] = &unk_1E6253EC0;
    long long v46 = @"blockingFlush";
    uint64_t v47 = v34;
    if (blockingFlushQueues_withTimeout__defaultOnce_690 != -1) {
      dispatch_once(&blockingFlushQueues_withTimeout__defaultOnce_690, v45);
    }
    int v35 = blockingFlushQueues_withTimeout__classDebugEnabled_691;

    if (v35)
    {
      char v36 = [NSString stringWithFormat:@"end for queueNames=%@", v15];
      uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      int v38 = [v37 lastPathComponent];
      long long v39 = [NSString stringWithUTF8String:"-[PLCoreStorage blockingFlushQueues:withTimeout:]"];
      +[PLCoreStorage logMessage:v36 fromFile:v38 fromFunction:v39 fromLineNumber:1529];

      uint64_t v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  blockingFlushQueues_withTimeout__classDebugEnabled = result;
  return result;
}

BOOL __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_682(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  blockingFlushQueues_withTimeout__classDebugEnabled_681 = result;
  return result;
}

void __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_686(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_2;
    block[3] = &unk_1E6253EC0;
    uint64_t v10 = @"blockingFlush";
    uint64_t v11 = v2;
    if (kPLTaskingEndNotification_block_invoke_5_defaultOnce != -1) {
      dispatch_once(&kPLTaskingEndNotification_block_invoke_5_defaultOnce, block);
    }
    int v3 = kPLTaskingEndNotification_block_invoke_5_classDebugEnabled;

    if (v3)
    {
      uint64_t v4 = [NSString stringWithFormat:@"finished: %@", *(void *)(a1 + 48)];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      unint64_t v6 = [v5 lastPathComponent];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PLCoreStorage blockingFlushQueues:withTimeout:]_block_invoke"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:1520];

      int v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLTaskingEndNotification_block_invoke_5_classDebugEnabled = result;
  return result;
}

BOOL __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_692(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  blockingFlushQueues_withTimeout__classDebugEnabled_691 = result;
  return result;
}

- (BOOL)flushCachesIfRequiredForEntryKey:(id)a3
{
  id v4 = a3;
  id v5 = +[PLStorageCache sharedStorageCache];
  uint64_t v6 = [v5 stagingEntryCacheSizeForEntryKey:v4];

  if (v6 >= 1)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v7 = [NSString stringWithFormat:@"cache dump for query entryKey=%@ cacheSize=%ld", v4, v6];
      int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLCoreStorage flushCachesIfRequiredForEntryKey:]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:1536];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    long long v12 = [NSString stringWithFormat:@"Query EntryKey %@", v4];
    [(PLCoreStorage *)self flushCachesWithReason:v12];
  }
  return v6 > 0;
}

int64_t __43__PLCoreStorage_generalEntryCacheSizeLimit__block_invoke(uint64_t a1)
{
  int64_t result = +[PLDefaults longForKey:*(void *)(a1 + 32) ifNotSet:*(void *)(a1 + 40)];
  generalEntryCacheSizeLimit_objectForKey = result;
  return result;
}

BOOL __28__PLCoreStorage_writeEntry___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  writeEntry__classDebugEnabled = result;
  return result;
}

BOOL __48__PLCoreStorage_writeEntry_withCompletionBlock___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  writeEntry_withCompletionBlock__classDebugEnabled = result;
  return result;
}

void __48__PLCoreStorage_writeEntry_withCompletionBlock___block_invoke_716(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1C1869120]();
  [*(id *)(a1 + 32) writeEntry:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

BOOL __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled = result;
  return result;
}

BOOL __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke_725(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled_724 = result;
  return result;
}

BOOL __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke_731(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled_730 = result;
  return result;
}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  writeAggregateEntry__classDebugEnabled = result;
  return result;
}

void __37__PLCoreStorage_writeAggregateEntry___block_invoke_735(uint64_t a1)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 32) entryKey];
  BOOL v4 = +[PLEntryDefinition isAggregateWallClockBucket:v3];

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v5 = [*(id *)(a1 + 32) entryDefinition];
  uint64_t v6 = +[PLEntryDefinition aggregateBucketDefinitionsForEntryDefinition:v5];

  id obj = v6;
  uint64_t v74 = [v6 countByEnumeratingWithState:&v101 objects:v109 count:16];
  if (v74)
  {
    BOOL v72 = v4;
    uint64_t v73 = *(void *)v102;
    uint64_t v69 = v87;
    uint64_t v70 = v98;
    v76 = v2;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v102 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = v7;
        int v8 = *(void **)(*((void *)&v101 + 1) + 8 * v7);
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v9 = objc_opt_class();
          v97[0] = MEMORY[0x1E4F143A8];
          v97[1] = 3221225472;
          v98[0] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_2;
          v98[1] = &unk_1E6253EC0;
          id v99 = @"writeAggregateEntry";
          uint64_t v100 = v9;
          if (kPLTaskingEndNotification_block_invoke_6_defaultOnce != -1) {
            dispatch_once(&kPLTaskingEndNotification_block_invoke_6_defaultOnce, v97);
          }
          int v10 = kPLTaskingEndNotification_block_invoke_6_classDebugEnabled;

          if (v10)
          {
            uint64_t v11 = [NSString stringWithFormat:@"bucketIntervalNumber=%@", v8, v69, v70];
            long long v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
            long long v13 = [v12 lastPathComponent];
            dispatch_semaphore_t v14 = [NSString stringWithUTF8String:"-[PLCoreStorage writeAggregateEntry:]_block_invoke"];
            +[PLCoreStorage logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:1733];

            id v15 = PLLogCommon();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v108 = v11;
              _os_log_debug_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        [v8 doubleValue];
        double v17 = v16;
        uint64_t v18 = +[PLTimeManager sharedInstance];
        uint64_t v19 = [*(id *)(a1 + 32) entryDate];
        double v20 = (double)(int)[v18 bucketTimeStampForDate:v19 withTimeReference:v72 withBucketInterval:(int)v17];

        uint64_t v21 = [NSNumber numberWithDouble:v20];
        [v2 setObject:v21 forKeyedSubscript:@"timestamp"];

        int v22 = [NSNumber numberWithDouble:v17];
        [v2 setObject:v22 forKeyedSubscript:@"timeInterval"];

        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        uint64_t v23 = [*(id *)(a1 + 32) entryDefinition];
        unint64_t v24 = +[PLEntryDefinition allAggregatePrimaryKeysForEntryDefinition:v23];

        id v77 = v24;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v93 objects:v106 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v94;
          do
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v94 != v27) {
                objc_enumerationMutation(v77);
              }
              uint64_t v29 = *(void *)(*((void *)&v93 + 1) + 8 * v28);
              if (+[PLDefaults debugEnabled])
              {
                uint64_t v30 = objc_opt_class();
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_741;
                block[3] = &unk_1E6253EC0;
                long long v91 = @"writeAggregateEntry";
                uint64_t v92 = v30;
                if (kPLTaskingEndNotification_block_invoke_6_defaultOnce_739 != -1) {
                  dispatch_once(&kPLTaskingEndNotification_block_invoke_6_defaultOnce_739, block);
                }
                int v31 = kPLTaskingEndNotification_block_invoke_6_classDebugEnabled_740;

                if (v31)
                {
                  unint64_t v32 = [NSString stringWithFormat:@"primaryKey=%@", v29];
                  dispatch_time_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
                  uint64_t v34 = [v33 lastPathComponent];
                  int v35 = [NSString stringWithUTF8String:"-[PLCoreStorage writeAggregateEntry:]_block_invoke_2"];
                  +[PLCoreStorage logMessage:v32 fromFile:v34 fromFunction:v35 fromLineNumber:1745];

                  char v36 = PLLogCommon();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v108 = v32;
                    _os_log_debug_impl(&dword_1BBD2F000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  uint64_t v2 = v76;
                }
              }
              uint64_t v37 = [*(id *)(a1 + 32) objectForKeyedSubscript:v29];
              [v2 setObject:v37 forKeyedSubscript:v29];

              ++v28;
            }
            while (v26 != v28);
            uint64_t v26 = [v77 countByEnumeratingWithState:&v93 objects:v106 count:16];
          }
          while (v26);
        }

        if (+[PLDefaults debugEnabled])
        {
          uint64_t v38 = objc_opt_class();
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v87[0] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_748;
          v87[1] = &unk_1E6253EC0;
          long long v88 = @"writeAggregateEntry";
          uint64_t v89 = v38;
          if (kPLTaskingEndNotification_block_invoke_6_defaultOnce_746 != -1) {
            dispatch_once(&kPLTaskingEndNotification_block_invoke_6_defaultOnce_746, v86);
          }
          int v39 = kPLTaskingEndNotification_block_invoke_6_classDebugEnabled_747;

          if (v39)
          {
            uint64_t v40 = [NSString stringWithFormat:@"matchingKeyToValue=%@", v2];
            long long v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
            uint64_t v42 = [v41 lastPathComponent];
            id v43 = [NSString stringWithUTF8String:"-[PLCoreStorage writeAggregateEntry:]_block_invoke_2"];
            +[PLCoreStorage logMessage:v40 fromFile:v42 fromFunction:v43 fromLineNumber:1749];

            uint64_t v44 = PLLogCommon();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v108 = v40;
              _os_log_debug_impl(&dword_1BBD2F000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        int v45 = (void *)MEMORY[0x1E4F1CA80];
        long long v46 = [*(id *)(a1 + 32) entryDefinition];
        uint64_t v47 = +[PLEntryDefinition allAggregateKeysForEntryDefinition:v46];
        uint64_t v48 = [v45 setWithArray:v47];

        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v49 = v48;
        uint64_t v50 = [v49 countByEnumeratingWithState:&v82 objects:v105 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          id v78 = *(id *)v83;
          do
          {
            uint64_t v52 = 0;
            do
            {
              if (*(id *)v83 != v78) {
                objc_enumerationMutation(v49);
              }
              uint64_t v53 = *(void *)(*((void *)&v82 + 1) + 8 * v52);
              if (+[PLDefaults debugEnabled])
              {
                uint64_t v54 = objc_opt_class();
                v79[0] = MEMORY[0x1E4F143A8];
                v79[1] = 3221225472;
                v79[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_754;
                v79[3] = &unk_1E6253EC0;
                long long v80 = @"writeAggregateEntry";
                uint64_t v81 = v54;
                if (kPLTaskingEndNotification_block_invoke_6_defaultOnce_752 != -1) {
                  dispatch_once(&kPLTaskingEndNotification_block_invoke_6_defaultOnce_752, v79);
                }
                int v55 = kPLTaskingEndNotification_block_invoke_6_classDebugEnabled_753;

                if (v55)
                {
                  long long v56 = [NSString stringWithFormat:@"aggregateKey=%@", v53];
                  long long v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
                  long long v58 = [v57 lastPathComponent];
                  long long v59 = [NSString stringWithUTF8String:"-[PLCoreStorage writeAggregateEntry:]_block_invoke_2"];
                  +[PLCoreStorage logMessage:v56 fromFile:v58 fromFunction:v59 fromLineNumber:1754];

                  long long v60 = PLLogCommon();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v108 = v56;
                    _os_log_debug_impl(&dword_1BBD2F000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  uint64_t v2 = v76;
                }
              }
              uint64_t v61 = objc_opt_new();
              long long v62 = [*(id *)(a1 + 32) entryKey];
              [v61 setEntryKey:v62];

              long long v63 = (void *)[v2 mutableCopy];
              [v61 setMatchingKeyToValue:v63];

              long long v64 = (void *)[v49 mutableCopy];
              [v64 removeObject:v53];
              uint64_t v65 = [v64 allObjects];
              [v61 setOtherAggregateKeys:v65];

              [v61 setAggregateKey:v53];
              long long v66 = [*(id *)(a1 + 32) objectForKeyedSubscript:v53];
              [v66 doubleValue];
              objc_msgSend(v61, "setAggregateValue:");

              uint64_t v67 = [*(id *)(a1 + 32) entryDefinition];
              objc_msgSend(v61, "setAggregateFunction:", +[PLEntryDefinition aggregateFunctionForEntryDefinition:forKey:](PLEntryDefinition, "aggregateFunctionForEntryDefinition:forKey:", v67, v53));

              uint64_t v68 = +[PLStorageCache sharedStorageCache];
              [v68 addToStagingAggregateEntryCache:v61];

              ++v52;
            }
            while (v51 != v52);
            uint64_t v51 = [v49 countByEnumeratingWithState:&v82 objects:v105 count:16];
          }
          while (v51);
        }

        uint64_t v7 = v75 + 1;
      }
      while (v75 + 1 != v74);
      uint64_t v74 = [obj countByEnumeratingWithState:&v101 objects:v109 count:16];
    }
    while (v74);
  }
}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLTaskingEndNotification_block_invoke_6_classDebugEnabled = result;
  return result;
}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke_741(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLTaskingEndNotification_block_invoke_6_classDebugEnabled_740 = result;
  return result;
}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke_748(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLTaskingEndNotification_block_invoke_6_classDebugEnabled_747 = result;
  return result;
}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke_754(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLTaskingEndNotification_block_invoke_6_classDebugEnabled_753 = result;
  return result;
}

- (void)setAllNullValuesForEntryKey:(id)a3 forKey:(id)a4 toValue:(id)a5 withFilters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v30 = 0;
  int v31 = &v30;
  uint64_t v32 = 0x3032000000;
  dispatch_time_t v33 = __Block_byref_object_copy__5;
  uint64_t v34 = __Block_byref_object_dispose__5;
  id v14 = v10;
  id v35 = v14;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__5;
  uint64_t v28 = __Block_byref_object_dispose__5;
  id v15 = v11;
  id v29 = v15;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__5;
  v22[4] = __Block_byref_object_dispose__5;
  id v16 = v12;
  id v23 = v16;
  v20[0] = 0;
  v20[1] = v20;
  void v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__5;
  v20[4] = __Block_byref_object_dispose__5;
  id v17 = v13;
  id v21 = v17;
  [(PLCoreStorage *)self flushCachesIfRequiredForEntryKey:v25[5]];
  uint64_t v18 = v31[5];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__PLCoreStorage_setAllNullValuesForEntryKey_forKey_toValue_withFilters___block_invoke;
  v19[3] = &unk_1E6254558;
  v19[4] = self;
  void v19[5] = &v30;
  v19[6] = &v24;
  v19[7] = v22;
  v19[8] = v20;
  [(PLCoreStorage *)self dispatchAsyncForEntryKey:v18 withBlock:v19];
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __72__PLCoreStorage_setAllNullValuesForEntryKey_forKey_toValue_withFilters___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  [v2 setAllNullValuesForEntryKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) toValue:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withFilters:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (void)deleteEntry:(id)a3
{
  id v4 = a3;
  id v6 = [v4 entryKey];
  uint64_t v5 = [v4 entryID];

  [(PLCoreStorage *)self deleteEntryForKey:v6 WithRowID:v5];
}

- (void)deleteEntryForKey:(id)a3 WithRowID:(int64_t)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__5;
  id v15 = __Block_byref_object_dispose__5;
  id v6 = a3;
  id v16 = v6;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = a4;
  [(PLCoreStorage *)self flushCachesIfRequiredForEntryKey:v6];
  uint64_t v7 = +[PLStorageCache sharedStorageCache];
  [v7 clearLastEntryCacheForEntryKey:v6];

  uint64_t v8 = v12[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PLCoreStorage_deleteEntryForKey_WithRowID___block_invoke;
  v9[3] = &unk_1E6254530;
  v9[4] = self;
  v9[5] = &v11;
  v9[6] = v10;
  [(PLCoreStorage *)self dispatchAsyncForEntryKey:v8 withBlock:v9];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
}

void __45__PLCoreStorage_deleteEntryForKey_WithRowID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  [v2 deleteEntryForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withRowID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

- (void)deleteAllEntriesForKey:(id)a3
{
}

- (void)deleteAllEntriesForKey:(id)a3 withFilters:(id)a4
{
}

- (void)deleteAllEntriesForKey:(id)a3 beforeTimestamp:(id)a4
{
}

- (void)deleteAllEntriesForKey:(id)a3 beforeTimestamp:(id)a4 withFilters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x3032000000;
    int v22 = __Block_byref_object_copy__5;
    id v23 = __Block_byref_object_dispose__5;
    id v11 = v8;
    id v24 = v11;
    v17[0] = 0;
    v17[1] = v17;
    void v17[2] = 0x3032000000;
    void v17[3] = __Block_byref_object_copy__5;
    v17[4] = __Block_byref_object_dispose__5;
    id v18 = v9;
    v15[0] = 0;
    v15[1] = v15;
    void v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__5;
    v15[4] = __Block_byref_object_dispose__5;
    id v16 = v10;
    [(PLCoreStorage *)self flushCachesIfRequiredForEntryKey:v11];
    id v12 = +[PLStorageCache sharedStorageCache];
    [v12 clearLastEntryCacheForEntryKey:v11];

    uint64_t v13 = v20[5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __68__PLCoreStorage_deleteAllEntriesForKey_beforeTimestamp_withFilters___block_invoke;
    v14[3] = &unk_1E6254580;
    void v14[4] = self;
    v14[5] = v17;
    v14[6] = v15;
    v14[7] = &v19;
    [(PLCoreStorage *)self dispatchAsyncForEntryKey:v13 withBlock:v14];
    _Block_object_dispose(v15, 8);

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v19, 8);
  }
}

void __68__PLCoreStorage_deleteAllEntriesForKey_beforeTimestamp_withFilters___block_invoke(uint64_t a1)
{
  id v7 = (id)objc_opt_new();
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    uint64_t v3 = NSString;
    [v2 timeIntervalSince1970];
    uint64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"timestamp < %f", v4);
    [v7 addObject:v5];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_msgSend(v7, "addObjectsFromArray:");
  }
  if (![v7 count])
  {

    id v7 = 0;
  }
  id v6 = [*(id *)(a1 + 32) connection];
  [v6 deleteAllEntriesForKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withFilters:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (int64_t)countOfEntriesForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLStorageCache sharedStorageCache];
  int64_t v6 = [v5 stagingEntryCacheSizeForEntryKey:v4];

  id v7 = [(PLCoreStorage *)self connection];
  id v8 = [NSString stringWithFormat:@"SELECT COUNT(ID) AS count FROM %@;", v4];

  id v9 = [v7 performQuery:v8];

  if ([v9 count])
  {
    id v10 = [v9 objectAtIndexedSubscript:0];
    id v11 = [v10 objectForKeyedSubscript:@"count"];
    v6 += [v11 longValue];
  }
  return v6;
}

- (void)processEntriesForKey:(id)a3 withProperties:(id)a4 withBlock:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v38 = a4;
  id v7 = (void (**)(id, void))a5;
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PLCoreStorage_processEntriesForKey_withProperties_withBlock___block_invoke;
    block[3] = &unk_1E6253E70;
    uint64_t v65 = @"processEntriesBatchSize";
    uint64_t v66 = 10;
    if (processEntriesForKey_withProperties_withBlock__defaultOnce != -1) {
      dispatch_once(&processEntriesForKey_withProperties_withBlock__defaultOnce, block);
    }
    uint64_t v8 = processEntriesForKey_withProperties_withBlock__objectForKey;

    id v9 = [v38 objectForKeyedSubscript:@"__NOCACHEDUMP__"];
    if (!v9
      || ([v38 objectForKeyedSubscript:@"__NOCACHEDUMP__"],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 BOOLValue],
          v10,
          v9,
          (v11 & 1) == 0))
    {
      if ([(PLCoreStorage *)self flushCachesIfRequiredForEntryKey:v37]
        && +[PLDefaults debugEnabled])
      {
        id v12 = [NSString stringWithFormat:@"Cache dumped for properties: %@", v38];
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        id v14 = [v13 lastPathComponent];
        id v15 = [NSString stringWithUTF8String:"-[PLCoreStorage processEntriesForKey:withProperties:withBlock:]"];
        +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:1869];

        id v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__5;
    v62[4] = __Block_byref_object_dispose__5;
    id v17 = v37;
    id v63 = v17;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3032000000;
    v60[3] = __Block_byref_object_copy__5;
    v60[4] = __Block_byref_object_dispose__5;
    id v61 = v38;
    uint64_t v54 = 0;
    int v55 = &v54;
    uint64_t v56 = 0x3032000000;
    long long v57 = __Block_byref_object_copy__5;
    long long v58 = __Block_byref_object_dispose__5;
    id v59 = [MEMORY[0x1E4F1CA48] array];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __63__PLCoreStorage_processEntriesForKey_withProperties_withBlock___block_invoke_777;
    v53[3] = &unk_1E6254580;
    v53[4] = self;
    v53[5] = v62;
    v53[6] = v60;
    v53[7] = &v54;
    [(PLCoreStorage *)self dispatchSyncForEntryKey:v17 withBlock:v53];
    id v18 = [MEMORY[0x1E4F1CA48] array];
    int v19 = 0;
    while (1)
    {
      uint64_t v20 = v19;
      if ([(id)v55[5] count] <= (unint64_t)v19) {
        break;
      }
      unint64_t v21 = [(id)v55[5] count];
      if (v21 >= v8 + v19) {
        v19 += v8;
      }
      else {
        int v19 = v21;
      }
      int v22 = objc_msgSend((id)v55[5], "subarrayWithRange:", v20, v19 - (int)v20);
      [v18 addObject:v22];
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v18;
    uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v71 count:16];
    if (v23)
    {
      uint64_t v40 = *(void *)v50;
      do
      {
        uint64_t v24 = 0;
        uint64_t v42 = v23;
        do
        {
          if (*(void *)v50 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v49 + 1) + 8 * v24);
          context = (void *)MEMORY[0x1C1869120]();
          uint64_t v26 = NSString;
          uint64_t v27 = [v25 componentsJoinedByString:@", "];
          uint64_t v44 = [v26 stringWithFormat:@"ID IN (%@)", v27];

          v70[0] = MEMORY[0x1E4F1CC38];
          v69[0] = @"__NOCACHEDUMP__";
          v69[1] = @"where";
          uint64_t v68 = v44;
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
          v70[1] = v28;
          id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];

          uint64_t v30 = [(PLCoreStorage *)self entriesForKey:v17 withProperties:v29];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v31 = v30;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v67 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v46 != v33) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v35 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                char v36 = (void *)MEMORY[0x1C1869120]();
                v7[2](v7, v35);
              }
              uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v67 count:16];
            }
            while (v32);
          }

          ++v24;
        }
        while (v24 != v42);
        uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v71 count:16];
      }
      while (v23);
    }

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(v60, 8);

    _Block_object_dispose(v62, 8);
  }
}

int64_t __63__PLCoreStorage_processEntriesForKey_withProperties_withBlock___block_invoke(uint64_t a1)
{
  int64_t result = +[PLDefaults longForKey:*(void *)(a1 + 32) ifNotSet:*(void *)(a1 + 40)];
  processEntriesForKey_withProperties_withBlock__objectForKey = result;
  return result;
}

void __63__PLCoreStorage_processEntriesForKey_withProperties_withBlock___block_invoke_777(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"SELECT ID FROM '%@' ", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"where"];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v5 = [v4 componentsJoinedByString:@" AND "];
    [v2 appendFormat:@"WHERE %@ ", v5];
  }
  [v2 appendString:@";"];
  int64_t v6 = [*(id *)(a1 + 32) connection];
  id v7 = [v6 performQuery:v2];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        id v14 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) objectForKeyedSubscript:@"ID"];
        [v13 addObject:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)entriesForKey:(id)a3
{
  return [(PLCoreStorage *)self entriesForKey:a3 withComparisons:0];
}

- (id)entriesForKey:(id)a3 withComparisons:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v33 = self;
    id v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PLCoreStorage entriesForKey:withComparisons:].cold.5();
    }

    uint64_t v9 = +[PLStorageCache sharedStorageCache];
    uint64_t v10 = [v9 stagingEntryCacheIDsForEntryKey:v6];

    uint64_t v11 = +[PLStorageCache sharedStorageCache];
    uint64_t v12 = [v11 stagingEntryCacheForEntryKey:v6 withComparisons:v7 isSingleton:0];

    uint64_t v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLCoreStorage entriesForKey:withComparisons:].cold.4();
    }

    id v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PLCoreStorage entriesForKey:withComparisons:]();
    }

    long long v15 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          unint64_t v21 = [*(id *)(*((void *)&v34 + 1) + 8 * i) sqlWhereClause];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v18);
    }

    if ([v10 count])
    {
      int v22 = NSString;
      uint64_t v23 = [v10 allObjects];
      uint64_t v24 = [v23 componentsJoinedByString:@","];
      uint64_t v25 = [v22 stringWithFormat:@"ID NOT IN (%@)", v24];
      [v15 addObject:v25];
    }
    v38[0] = @"where";
    v38[1] = @"__NOCACHEDUMP__";
    v39[0] = v15;
    v39[1] = MEMORY[0x1E4F1CC38];
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    uint64_t v27 = [(PLCoreStorage *)v33 entriesForKey:v6 withProperties:v26];

    uint64_t v28 = PLLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[PLCoreStorage entriesForKey:withComparisons:]();
    }

    id v29 = [MEMORY[0x1E4F1CA48] arrayWithArray:v12];
    [v29 addObjectsFromArray:v27];
    uint64_t v30 = PLLogCommon();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[PLCoreStorage entriesForKey:withComparisons:]();
    }

    id v31 = [v29 sortedArrayUsingComparator:&__block_literal_global_812];
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

uint64_t __47__PLCoreStorage_entriesForKey_withComparisons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(a2, "entryID"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 entryID];

  uint64_t v9 = [v7 numberWithLongLong:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (id)entriesForKey:(id)a3 withQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PLCoreStorage *)self flushCachesIfRequiredForEntryKey:v6]
    && +[PLDefaults debugEnabled])
  {
    uint64_t v8 = [NSString stringWithFormat:@"Cache dumped for query: %@", v7];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
    uint64_t v10 = [v9 lastPathComponent];
    uint64_t v11 = [NSString stringWithUTF8String:"-[PLCoreStorage entriesForKey:withQuery:]"];
    +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:1992];

    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__5;
  uint64_t v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __41__PLCoreStorage_entriesForKey_withQuery___block_invoke;
  void v17[3] = &unk_1E6253D30;
  uint64_t v20 = &v21;
  v17[4] = self;
  id v13 = v6;
  id v18 = v13;
  id v14 = v7;
  id v19 = v14;
  [(PLCoreStorage *)self dispatchSyncForEntryKey:v13 withBlock:v17];
  id v15 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __41__PLCoreStorage_entriesForKey_withQuery___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) connection];
  uint64_t v2 = [v5 entriesForKey:*(void *)(a1 + 40) withQuery:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)entriesForKey:(id)a3 inTimeRange:(_PLTimeIntervalRange)a4 withFilters:(id)a5
{
  locatiouint64_t n = a4.location;
  v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v9 = NSString;
  double v10 = a4.location + a4.length;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_msgSend(v9, "stringWithFormat:", @"timestamp BETWEEN %f AND %f", *(void *)&location, *(void *)&v10);
  id v14 = [v8 arrayWithObject:v13];

  [v14 addObjectsFromArray:v11];
  v18[0] = @"where";
  v18[1] = @"order by";
  v19[0] = v14;
  v19[1] = &unk_1F1586D78;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v16 = [(PLCoreStorage *)self entriesForKey:v12 withProperties:v15];

  return v16;
}

- (id)entriesForKey:(id)a3 inTimeRange:(_PLTimeIntervalRange)a4 withCountOfEntriesBefore:(int64_t)a5 withCountOfEntriesAfter:(int64_t)a6 withFilters:(id)a7
{
  double length = a4.length;
  locatiouint64_t n = a4.location;
  id v13 = (void *)MEMORY[0x1E4F1CA48];
  id v14 = a7;
  id v15 = a3;
  id v16 = -[PLCoreStorage entriesForKey:inTimeRange:withFilters:](self, "entriesForKey:inTimeRange:withFilters:", v15, v14, location, length);
  uint64_t v17 = [v13 arrayWithArray:v16];

  if ([v17 count])
  {
    id v18 = [v17 firstObject];
    uint64_t v19 = [v18 entryID];

    uint64_t v20 = [v17 lastObject];
    uint64_t v21 = [v20 entryID];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __104__PLCoreStorage_entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters___block_invoke;
      block[3] = &unk_1E6253EC0;
      id v38 = @"query";
      uint64_t v39 = v22;
      if (entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters__defaultOnce != -1) {
        dispatch_once(&entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters__defaultOnce, block);
      }
      int v23 = entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters__classDebugEnabled;

      if (v23)
      {
        uint64_t v35 = v21;
        int64_t v36 = a6;
        uint64_t v34 = v19;
        uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"first=%lld last=%lld", v19, v21);
        uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        id v26 = [v25 lastPathComponent];
        uint64_t v27 = [NSString stringWithUTF8String:"-[PLCoreStorage entriesForKey:inTimeRange:withCountOfEntriesBefore:withCountOfEntriesAfter:withFilters:]"];
        +[PLCoreStorage logMessage:v24 fromFile:v26 fromFunction:v27 fromLineNumber:2017];

        uint64_t v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }

        uint64_t v21 = v35;
        a6 = v36;
        uint64_t v19 = v34;
      }
    }
    id v29 = [(PLCoreStorage *)self entriesForKey:v15 startingFromRowID:v19 + 1 count:a5 withFilters:v14];
    [v17 addObjectsFromArray:v29];

    uint64_t v30 = [(PLCoreStorage *)self entriesForKey:v15 startingFromRowID:v21 - 1 count:-a6 withFilters:v14];
  }
  else
  {
    id v31 = [(PLCoreStorage *)self entriesForKey:v15 before:1 timeInterval:a5 count:v14 withFilters:location];
    [v17 addObjectsFromArray:v31];

    uint64_t v30 = [(PLCoreStorage *)self entriesForKey:v15 before:0 timeInterval:a6 count:v14 withFilters:location + length];
  }
  uint64_t v32 = (void *)v30;

  [v17 addObjectsFromArray:v32];
  [v17 sortUsingComparator:&__block_literal_global_835];
  return v17;
}

BOOL __104__PLCoreStorage_entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters__classDebugEnabled = result;
  return result;
}

uint64_t __104__PLCoreStorage_entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters___block_invoke_832(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 entryID];
  if (v6 <= [v5 entryID])
  {
    uint64_t v8 = [v4 entryID];
    uint64_t v7 = v8 < [v5 entryID];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (id)entriesForKey:(id)a3 before:(BOOL)a4 timeInterval:(double)a5 count:(int64_t)a6 withFilters:(id)a7
{
  BOOL v9 = a4;
  v27[3] = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = a3;
  id v14 = objc_opt_new();
  id v15 = @">=";
  if (v9)
  {
    id v15 = @"<=";
    uint64_t v16 = MEMORY[0x1E4F1CC38];
  }
  else
  {
    uint64_t v16 = MEMORY[0x1E4F1CC28];
  }
  uint64_t v17 = [NSString stringWithFormat:@"timestamp %@ %f", v15, *(void *)&a5];
  [v14 addObject:v17];

  [v14 addObjectsFromArray:v12];
  v27[0] = v14;
  v26[0] = @"where";
  v26[1] = @"order by";
  uint64_t v24 = @"timestamp";
  uint64_t v25 = v16;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v27[1] = v18;
  v26[2] = @"limit";
  if (a6 >= 0) {
    int64_t v19 = a6;
  }
  else {
    int64_t v19 = -a6;
  }
  uint64_t v20 = [NSNumber numberWithLongLong:v19];
  v27[2] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  uint64_t v22 = [(PLCoreStorage *)self entriesForKey:v13 withProperties:v21];

  return v22;
}

- (id)entryForKey:(id)a3 withID:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[PLStorageCache sharedStorageCache];
  uint64_t v8 = [v7 cachedEntryForEntryKey:v6 withEntryID:a4];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    double v10 = [(PLCoreStorage *)self entriesForKey:v6 startingFromRowID:a4 count:1 withFilters:0];
    id v9 = 0;
    if ([v10 count] == 1)
    {
      id v9 = [v10 firstObject];
    }
  }
  return v9;
}

- (id)entriesForKey:(id)a3 startingFromRowID:(int64_t)a4 count:(int64_t)a5 withFilters:(id)a6
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1E4F1CC38];
  id v13 = (void *)MEMORY[0x1E4F1CC28];
  if (v11) {
    id v14 = v11;
  }
  else {
    id v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v15 = (void *)[v14 mutableCopy];
  if (a5 > 0) {
    id v12 = v13;
  }
  uint64_t v16 = @"<=";
  if (a5 > 0) {
    uint64_t v16 = @">=";
  }
  if (!a5) {
    uint64_t v16 = @"==";
  }
  if (a5 < 0) {
    a5 = -a5;
  }
  uint64_t v17 = [NSString stringWithFormat:@"ID %@ %lld", v16, a4];
  [v15 addObject:v17];

  v31[0] = v15;
  v30[0] = @"where";
  v30[1] = @"order by";
  uint64_t v28 = @"timestamp";
  id v29 = v12;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v31[1] = v18;
  v30[2] = @"limit";
  int64_t v19 = [NSNumber numberWithLongLong:a5];
  void v31[2] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

  if ((unint64_t)[v15 count] >= 2)
  {
    uint64_t v21 = [v15 firstObject];
    int v22 = [v21 isEqualToString:@"__NOCACHEDUMP__"];

    if (v22)
    {
      [v15 removeObjectAtIndex:0];
      int v23 = (void *)[v20 mutableCopy];
      [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"__NOCACHEDUMP__"];
      [v23 setObject:v15 forKeyedSubscript:@"where"];

      uint64_t v20 = v23;
    }
  }
  uint64_t v24 = [(PLCoreStorage *)self entriesForKey:v10 withProperties:v20];
  if ([v12 isEqual:MEMORY[0x1E4F1CC28]])
  {
    id v25 = [v24 sortedArrayUsingComparator:&__block_literal_global_855];
  }
  else
  {
    id v25 = v24;
  }
  id v26 = v25;

  return v26;
}

uint64_t __67__PLCoreStorage_entriesForKey_startingFromRowID_count_withFilters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 entryID];
  if (v6 <= [v5 entryID])
  {
    uint64_t v8 = [v4 entryID];
    uint64_t v7 = v8 < [v5 entryID];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (id)firstEntryForKey:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [(PLCoreStorage *)self entriesForKey:a3 withProperties:&unk_1F1586DC8];
    if ([v3 count])
    {
      id v4 = [v3 firstObject];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)lastEntryForKey:(id)a3 withComparisons:(id)a4 isSingleton:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if (v5)
    {
      id v10 = 0;
    }
    else
    {
      id v12 = +[PLStorageCache sharedStorageCache];
      id v10 = [v12 stagingEntryCacheIDsForEntryKey:v8];
    }
    id v13 = +[PLStorageCache sharedStorageCache];
    id v14 = [v13 stagingEntryCacheForEntryKey:v8 withComparisons:v9 isSingleton:v5];

    id v15 = [v14 firstObject];
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__PLCoreStorage_lastEntryForKey_withComparisons_isSingleton___block_invoke;
      block[3] = &unk_1E6253EC0;
      id v59 = @"lastEntryForKey:withComparisons:isSingleton:";
      uint64_t v60 = v16;
      if (lastEntryForKey_withComparisons_isSingleton__defaultOnce != -1) {
        dispatch_once(&lastEntryForKey_withComparisons_isSingleton__defaultOnce, block);
      }
      int v17 = lastEntryForKey_withComparisons_isSingleton__classDebugEnabled;

      if (v17)
      {
        long long v47 = v14;
        long long v49 = v10;
        id v18 = [NSString stringWithFormat:@"cacheEntry=%@", v15];
        int64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
        uint64_t v20 = [v19 lastPathComponent];
        uint64_t v21 = [NSString stringWithUTF8String:"-[PLCoreStorage lastEntryForKey:withComparisons:isSingleton:]"];
        +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:2164];

        int v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }

        id v14 = v47;
        id v10 = v49;
      }
    }
    if (v15 && (v5 || ([v15 existsInDB] & 1) == 0))
    {
      id v11 = v15;
    }
    else
    {
      long long v48 = v14;
      long long v50 = v10;
      int v23 = [MEMORY[0x1E4F1CA48] array];
      [v23 addObject:@"__NOCACHEDUMP__"];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v24 = v9;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v55 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = [*(id *)(*((void *)&v54 + 1) + 8 * i) sqlWhereClause];
            [v23 addObject:v29];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v61 count:16];
        }
        while (v26);
      }

      id v10 = v50;
      if ([v50 count])
      {
        uint64_t v30 = [v50 allObjects];
        id v31 = (void *)[v30 mutableCopy];

        if (v15)
        {
          uint64_t v32 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "entryID"));
          [v31 removeObject:v32];
        }
        uint64_t v33 = NSString;
        uint64_t v34 = [v31 componentsJoinedByString:@","];
        uint64_t v35 = [v33 stringWithFormat:@"ID NOT IN (%@)", v34];
        [v23 addObject:v35];
      }
      int64_t v36 = [(PLCoreStorage *)self lastEntryForKey:v8 withFilters:v23];
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v37 = objc_opt_class();
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __61__PLCoreStorage_lastEntryForKey_withComparisons_isSingleton___block_invoke_878;
        v51[3] = &unk_1E6253EC0;
        long long v52 = @"lastEntryForKey:withComparisons:isSingleton:";
        uint64_t v53 = v37;
        if (lastEntryForKey_withComparisons_isSingleton__defaultOnce_876 != -1) {
          dispatch_once(&lastEntryForKey_withComparisons_isSingleton__defaultOnce_876, v51);
        }
        int v38 = lastEntryForKey_withComparisons_isSingleton__classDebugEnabled_877;

        if (v38)
        {
          uint64_t v39 = [NSString stringWithFormat:@"dbEntry=%@", v36];
          uint64_t v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
          uint64_t v41 = [v40 lastPathComponent];
          uint64_t v42 = [NSString stringWithUTF8String:"-[PLCoreStorage lastEntryForKey:withComparisons:isSingleton:]"];
          +[PLCoreStorage logMessage:v39 fromFile:v41 fromFunction:v42 fromLineNumber:2188];

          id v43 = PLLogCommon();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }

          id v10 = v50;
        }
      }
      uint64_t v44 = [v36 entryID];
      if (v44 == [v15 entryID]) {
        long long v45 = v15;
      }
      else {
        long long v45 = v36;
      }
      id v11 = v45;

      id v14 = v48;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

BOOL __61__PLCoreStorage_lastEntryForKey_withComparisons_isSingleton___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  lastEntryForKey_withComparisons_isSingleton__classDebugEnabled = result;
  return result;
}

BOOL __61__PLCoreStorage_lastEntryForKey_withComparisons_isSingleton___block_invoke_878(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  lastEntryForKey_withComparisons_isSingleton__classDebugEnabled_877 = result;
  return result;
}

- (id)lastEntryForKey:(id)a3 withIDLessThan:(int64_t)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[PLStorageCache sharedStorageCache];
    id v8 = [v7 lastEntryCacheForEntryKey:v6];

    if ([v8 entryID] > a4)
    {
      id v9 = +[PLStorageCache sharedStorageCache];
      id v10 = [v9 stagingEntryCacheForEntryKey:v6 withIDLessThan:a4];

      if ([v10 entryID] <= a4)
      {
        id v8 = v10;
      }
      else
      {
        id v11 = objc_msgSend(NSString, "stringWithFormat:", @"ID < %lld", a4);
        v14[0] = v11;
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        id v8 = [(PLCoreStorage *)self lastEntryForKey:v6 withFilters:v12];
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)removeErroneousQualificationEntries
{
  uint64_t v2 = [(PLCoreStorage *)self connection];
  id v3 = (id)[v2 performQuery:@"DELETE FROM PLAccountingOperator_EventInterval_QualificationEvents WHERE QualificationID = 13;"];

  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_INFO, "Performed query to remove qualificationID = 13 from DB", v5, 2u);
  }
}

- (id)processIDEntryForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  void v16[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [PLValueComparison alloc];
  id v6 = [NSNumber numberWithInt:v3];
  uint64_t v7 = [(PLValueComparison *)v5 initWithKey:@"PID" withValue:v6 withComparisonOperation:0];

  id v8 = [PLValueComparison alloc];
  id v9 = NSNumber;
  id v10 = +[PLUtilities deviceBootTime];
  [v10 timeIntervalSince1970];
  id v11 = objc_msgSend(v9, "numberWithDouble:");
  id v12 = [(PLValueComparison *)v8 initWithKey:@"timestamp" withValue:v11 withComparisonOperation:2];

  v16[0] = v7;
  v16[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v14 = [(PLCoreStorage *)self lastEntryForKey:@"PLProcessMonitorAgent_EventForward_ProcessID" withComparisons:v13 isSingleton:1];

  return v14;
}

- (id)aggregateEntriesForKey:(id)a3 withBucketLength:(double)a4 inTimeIntervalRange:(_PLTimeIntervalRange)a5
{
  double length = a5.length;
  locatiouint64_t n = a5.location;
  id v9 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__5;
  uint64_t v33 = __Block_byref_object_dispose__5;
  id v34 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__PLCoreStorage_aggregateEntriesForKey_withBucketLength_inTimeIntervalRange___block_invoke;
  v23[3] = &unk_1E62545C8;
  double v26 = location;
  double v27 = length;
  double v28 = a4;
  uint64_t v25 = &v29;
  v23[4] = self;
  id v10 = v9;
  id v24 = v10;
  [(PLCoreStorage *)self dispatchSyncForEntryKey:v10 withBlock:v23];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PLCoreStorage_aggregateEntriesForKey_withBucketLength_inTimeIntervalRange___block_invoke_2;
    block[3] = &unk_1E6253EC0;
    uint64_t v21 = @"aggregate";
    uint64_t v22 = v11;
    if (aggregateEntriesForKey_withBucketLength_inTimeIntervalRange__defaultOnce != -1) {
      dispatch_once(&aggregateEntriesForKey_withBucketLength_inTimeIntervalRange__defaultOnce, block);
    }
    int v12 = aggregateEntriesForKey_withBucketLength_inTimeIntervalRange__classDebugEnabled;

    if (v12)
    {
      id v13 = [NSString stringWithFormat:@"entryResults=%@", v30[5]];
      id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m"];
      id v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLCoreStorage aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:]"];
      +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:2277];

      int v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v18 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v18;
}

void __77__PLCoreStorage_aggregateEntriesForKey_withBucketLength_inTimeIntervalRange___block_invoke(uint64_t a1)
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [NSString stringWithFormat:@"timestamp + timeInterval AS timestampEnd"];
  [v2 addObject:v3];
  id v4 = objc_opt_new();
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"timestamp <= %f AND %f <= timestampEnd", *(double *)(a1 + 56) + *(double *)(a1 + 64), *(void *)(a1 + 56));
  [v4 addObject:v5];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"timeInterval = %f", *(void *)(a1 + 72));
  [v4 addObject:v6];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v13[0] = @"where";
  v13[1] = @"select";
  v14[0] = v4;
  v14[1] = v2;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v10 = [v7 entriesForKey:v8 withProperties:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

BOOL __77__PLCoreStorage_aggregateEntriesForKey_withBucketLength_inTimeIntervalRange___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  aggregateEntriesForKey_withBucketLength_inTimeIntervalRange__classDebugEnabled = result;
  return result;
}

+ (id)allOperatorTablesToTrimConditionsForTrimDate:(id)a3
{
  v77[2] = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  uint64_t v3 = +[PowerlogCore sharedCore];
  id v4 = [v3 agents];
  v77[0] = v4;
  BOOL v5 = +[PowerlogCore sharedCore];
  id v6 = [v5 services];
  v77[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];

  uint64_t v8 = +[PowerlogCore sharedCore];
  id v9 = [v8 storage];
  uint64_t v10 = [v9 storageOperator];
  v76 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  int v12 = (void *)[v11 mutableCopy];

  if (!+[PLPlatform isHomePod])
  {
    id v13 = +[PowerlogCore sharedCore];
    id v14 = [v13 accounting];
    [v12 addObject:v14];
  }
  id v15 = +[PowerlogCore sharedCore];
  uint64_t v16 = [v15 agents];
  int v17 = [v16 allOperators];
  [v12 addObjectsFromArray:v17];

  id v18 = +[PowerlogCore sharedCore];
  int64_t v19 = [v18 services];
  uint64_t v20 = [v19 allOperators];
  long long v51 = v12;
  [v12 addObjectsFromArray:v20];

  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v7;
  uint64_t v22 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v53 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v69 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = [*(id *)(*((void *)&v68 + 1) + 8 * i) tablesToTrimConditionsForTrimDate:v55];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v65;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v65 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v64 + 1) + 8 * j);
              uint64_t v31 = [v21 objectForKeyedSubscript:v30];

              if (!v31)
              {
                uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
                [v21 setObject:v32 forKeyedSubscript:v30];
              }
              uint64_t v33 = [v21 objectForKeyedSubscript:v30];
              id v34 = [v25 objectForKeyedSubscript:v30];
              [v33 addObject:v34];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v64 objects:v74 count:16];
          }
          while (v27);
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v23);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v49 = v51;
  uint64_t v54 = [v49 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v54)
  {
    uint64_t v52 = *(void *)v61;
    do
    {
      for (uint64_t k = 0; k != v54; ++k)
      {
        if (*(void *)v61 != v52) {
          objc_enumerationMutation(v49);
        }
        int64_t v36 = [*(id *)(*((void *)&v60 + 1) + 8 * k) tablesToTrimConditionsForTrimDate:v55];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        uint64_t v37 = [v36 allKeys];
        uint64_t v38 = [v37 countByEnumeratingWithState:&v56 objects:v72 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v57;
          do
          {
            for (uint64_t m = 0; m != v39; ++m)
            {
              if (*(void *)v57 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void *)(*((void *)&v56 + 1) + 8 * m);
              id v43 = [v21 objectForKeyedSubscript:v42];

              if (!v43)
              {
                uint64_t v44 = [MEMORY[0x1E4F1CA48] array];
                [v21 setObject:v44 forKeyedSubscript:v42];
              }
              long long v45 = [v21 objectForKeyedSubscript:v42];
              long long v46 = [v36 objectForKeyedSubscript:v42];
              [v45 addObject:v46];
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v56 objects:v72 count:16];
          }
          while (v39);
        }
      }
      uint64_t v54 = [v49 countByEnumeratingWithState:&v60 objects:v73 count:16];
    }
    while (v54);
  }

  long long v47 = +[PPSSQLStorage trimConditionsForPLSQLWithTrimDate:v55];
  [v21 addEntriesFromDictionary:v47];

  return v21;
}

- (void)logMessage:(id)a3 fromFile:(id)a4 fromFunction:(id)a5 fromLineNumber:(int64_t)a6
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PLCoreStorage *)self storageOperator];
  v16[0] = @"message";
  v16[1] = @"file";
  v17[0] = v12;
  v17[1] = v11;
  void v17[2] = v10;
  void v16[2] = @"function";
  void v16[3] = @"line";
  id v14 = [NSNumber numberWithLong:a6];
  void v17[3] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  [v13 logEventPointPLLog:v15];
}

+ (void)logMessage:(id)a3 fromFile:(id)a4 fromFunction:(id)a5 fromLineNumber:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PLCoreStorage_logMessage_fromFile_fromFunction_fromLineNumber___block_invoke;
  block[3] = &unk_1E6254390;
  uint64_t v23 = @"PLLogToSyslogOnly";
  char v24 = 0;
  if (logMessage_fromFile_fromFunction_fromLineNumber__defaultOnce != -1) {
    dispatch_once(&logMessage_fromFile_fromFunction_fromLineNumber__defaultOnce, block);
  }
  int v12 = logMessage_fromFile_fromFunction_fromLineNumber__objectForKey;

  if (!v12)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __65__PLCoreStorage_logMessage_fromFile_fromFunction_fromLineNumber___block_invoke_2;
    int64_t v19 = &unk_1E6254390;
    uint64_t v20 = @"PLLogToSyslog";
    char v21 = 0;
    if (logMessage_fromFile_fromFunction_fromLineNumber__defaultOnce_927 != -1) {
      dispatch_once(&logMessage_fromFile_fromFunction_fromLineNumber__defaultOnce_927, &v16);
    }
    int v13 = logMessage_fromFile_fromFunction_fromLineNumber__objectForKey_928;

    if (v13) {
      NSLog(&stru_1F1525D30.isa, v11, v9, v16, v17, v18, v19);
    }
    if (+[PowerlogCore sharedCoreStarted])
    {
      id v14 = +[PowerlogCore sharedCore];
      id v15 = [v14 storage];
      [v15 logMessage:v9 fromFile:v10 fromFunction:v11 fromLineNumber:a6];

      goto LABEL_12;
    }
    if (!+[PLDefaults debugEnabled]) {
      goto LABEL_12;
    }
  }
  NSLog(&stru_1F1525D30.isa, v11, v9);
LABEL_12:
}

BOOL __65__PLCoreStorage_logMessage_fromFile_fromFunction_fromLineNumber___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  logMessage_fromFile_fromFunction_fromLineNumber__objectForKey = result;
  return result;
}

BOOL __65__PLCoreStorage_logMessage_fromFile_fromFunction_fromLineNumber___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  logMessage_fromFile_fromFunction_fromLineNumber__objectForKey_928 = result;
  return result;
}

- (void)willSwitchUser
{
}

+ (id)additionalTables
{
  if (+[PLDefaults taskMode]) {
    BOOL v2 = _additionalTables == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    uint64_t v3 = +[PLDefaults objectForKey:@"PLTaskingTables" ifNotSet:0];
    id v4 = (void *)_additionalTables;
    _additionalTables = v3;

    if (!_additionalTables)
    {
      uint64_t v5 = PLOSAPreferencesGetValue();
      id v6 = (void *)_additionalTables;
      _additionalTables = v5;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = (id)_additionalTables;
  }
  else {
    id v7 = 0;
  }
  return v7;
}

- (void)attemptToSendTaskingStartNotification
{
  uint64_t v3 = +[PLSubmissions sharedInstance];
  int v4 = [v3 taskingStarted];

  if (v4)
  {
    uint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Tasking started, send out notification to inform clients.", v7, 2u);
    }

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"kPLTaskingStartNotification" object:self];

    notify_post("kPLTaskingStartNotificationGlobal");
  }
}

- (void)setStorageLocked:(BOOL)a3
{
  self->_storageLocked = a3;
}

- (void)setConnection:(id)a3
{
}

- (void)setStorageReady:(BOOL)a3
{
  self->_storageReady = a3;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
}

- (PLKQueue)profileDefaultsKQueue
{
  return (PLKQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProfileDefaultsKQueue:(id)a3
{
}

- (PLTimer)dailyTaskTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDailyTaskTimer:(id)a3
{
}

- (void)setFlushCachesTimer:(id)a3
{
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)flushCachesCFNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFlushCachesCFNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)blockingFlushCachesCFNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBlockingFlushCachesCFNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)keybagFirstUnlockNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeybagFirstUnlockNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)keybagLockStatusNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setKeybagLockStatusNotification:(id)a3
{
}

- (PLXPCResponderOperatorComposition)safeFileResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSafeFileResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)XPCFlushCacheResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setXPCFlushCacheResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)blPathResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBlPathResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)archivesResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setArchivesResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)quarantineResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setQuarantineResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)quarantineCopyResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setQuarantineCopyResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)batteryUIPlistsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBatteryUIPlistsResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)upgradeLogsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setUpgradeLogsResponder:(id)a3
{
}

- (PLStorageOperator)storageOperator
{
  return (PLStorageOperator *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStorageOperator:(id)a3
{
}

- (NSMutableSet)safeCopyInProgress
{
  return (NSMutableSet *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSafeCopyInProgress:(id)a3
{
}

- (OS_dispatch_queue)backgroundQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBackgroundQueue:(id)a3
{
}

- (OS_dispatch_queue)utilityQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 184, 1);
}

- (void)setUtilityQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_safeCopyInProgress, 0);
  objc_storeStrong((id *)&self->_storageOperator, 0);
  objc_storeStrong((id *)&self->_upgradeLogsResponder, 0);
  objc_storeStrong((id *)&self->_batteryUIPlistsResponder, 0);
  objc_storeStrong((id *)&self->_quarantineCopyResponder, 0);
  objc_storeStrong((id *)&self->_quarantineResponder, 0);
  objc_storeStrong((id *)&self->_archivesResponder, 0);
  objc_storeStrong((id *)&self->_blPathResponder, 0);
  objc_storeStrong((id *)&self->_XPCFlushCacheResponder, 0);
  objc_storeStrong((id *)&self->_safeFileResponder, 0);
  objc_storeStrong((id *)&self->_keybagLockStatusNotification, 0);
  objc_storeStrong((id *)&self->_keybagFirstUnlockNotification, 0);
  objc_storeStrong((id *)&self->_blockingFlushCachesCFNotification, 0);
  objc_storeStrong((id *)&self->_flushCachesCFNotification, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_flushCachesTimer, 0);
  objc_storeStrong((id *)&self->_dailyTaskTimer, 0);
  objc_storeStrong((id *)&self->_profileDefaultsKQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)registerDailyTasks_XPCActivity
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  +[PLDefaults doubleForKey:@"dbDailyTasksInterval" ifNotSet:(double)(uint64_t)*MEMORY[0x1E4F141E8]];
  uint64_t v4 = v3;
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Setting up dailyTasks XPC activity with dbDailyTasksInterval = %f", buf, 0xCu);
  }

  id v6 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_38;
  handler[3] = &unk_1E6254868;
  uint64_t v9 = v4;
  handler[4] = self;
  id v8 = &__block_literal_global_18;
  xpc_activity_register("com.apple.powerlogd.dailyTasks", v6, handler);
}

BOOL __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke(uint64_t a1, void *a2, xpc_activity_state_t a3)
{
  void v16[5] = *MEMORY[0x1E4F143B8];
  v15[0] = &unk_1F1580870;
  v15[1] = &unk_1F1580888;
  v16[0] = @"RUN";
  v16[1] = @"DONE";
  void v15[2] = &unk_1F15808A0;
  v15[3] = &unk_1F15808B8;
  void v16[2] = @"WAIT";
  void v16[3] = @"DEFER";
  v15[4] = &unk_1F15808D0;
  void v16[4] = @"CONTINUE";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v5 = a2;
  id v6 = [v4 dictionaryWithObjects:v16 forKeys:v15 count:5];
  BOOL v7 = xpc_activity_set_state(v5, a3);

  id v8 = PLLogCommon();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [NSNumber numberWithLong:a3];
      uint64_t v11 = [v6 objectForKeyedSubscript:v10];
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_DEFAULT, "registerDailyTasks: set XPC activity state to %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_cold_1(a3, v6, v9);
  }

  return v7;
}

void __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
    {
      if (xpc_activity_should_defer(v3))
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        [*(id *)(a1 + 32) dailyTasks];
        uint64_t v12 = +[PLSubmissions sharedInstance];
        int v13 = [v12 workQueue];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        void v14[2] = __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_40;
        void v14[3] = &unk_1E6254840;
        id v16 = *(id *)(a1 + 40);
        id v15 = v3;
        dispatch_async(v13, v14);
      }
    }
  }
  else if (!state)
  {
    uint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "registerDailyTasks: Check in for XPC activity...", buf, 2u);
    }

    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F142F8], 1);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E4F141C8], (uint64_t)*(double *)(a1 + 48));
    xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
    uint64_t v7 = *MEMORY[0x1E4F141F8];
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E4F14170], 22 * *MEMORY[0x1E4F141F8]);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E4F141A8], 2 * v7);
    xpc_object_t v8 = xpc_activity_copy_criteria(v3);
    uint64_t v9 = v8;
    if (v8 && xpc_equal(v8, v6))
    {
      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        xpc_object_t v18 = v9;
        _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "registerDailyTasks: Existing criteria found { %@ }", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        xpc_object_t v18 = v6;
        _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_DEFAULT, "registerDailyTasks: Existing criteria not found, setting default criteria { %@ }...", buf, 0xCu);
      }

      xpc_activity_set_criteria(v3, v6);
    }
  }
}

uint64_t __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 5);
}

- (void)init
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLCoreStorage: 'BUI_DEMO_PATH' is valid.", v2, v3, v4, v5, v6);
}

void __41__PLCoreStorage_initOperatorDependancies__block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = &unk_1F1586BC0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "Received xpc request for registration: %@ and payload: %@", (uint8_t *)&v2, 0x16u);
}

void __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "Copying upgrade log at path: %@ to path: %@");
}

- (void)entriesForKey:withProperties:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "Callers of entriesForKey %@ withProperties %@");
}

- (void)entriesForKey:withComparisons:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "All entries found in cache and database: %@", v2, v3, v4, v5, v6);
}

- (void)entriesForKey:withComparisons:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Entries found in database: %@", v2, v3, v4, v5, v6);
}

- (void)entriesForKey:withComparisons:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Searching for matching entries in database", v2, v3, v4, v5, v6);
}

- (void)entriesForKey:withComparisons:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Entries found in cache: %@", v2, v3, v4, v5, v6);
}

- (void)entriesForKey:withComparisons:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Searching for matching entries in cache", v2, v3, v4, v5, v6);
}

void __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSNumber numberWithLong:a1];
  uint8_t v6 = [a2 objectForKeyedSubscript:v5];
  int v7 = 138412290;
  xpc_object_t v8 = v6;
  _os_log_error_impl(&dword_1BBD2F000, a3, OS_LOG_TYPE_ERROR, "registerDailyTasks: failed to set XPC activity state to %@", (uint8_t *)&v7, 0xCu);
}

@end