@interface FCPersonalizationData
+ (BOOL)requiresBatchedSync;
+ (BOOL)requiresHighPriorityFirstSync;
+ (BOOL)requiresPushNotificationSupport;
+ (id)backingRecordIDs;
+ (id)backingRecordZoneIDs;
+ (id)commandStoreFileName;
+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4;
+ (id)desiredKeys;
+ (id)localStoreFilename;
+ (int64_t)commandQueueUrgency;
+ (unint64_t)localStoreVersion;
+ (void)configureKeyValueStoreForJSONHandling:(id)a3;
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (FCPersonalizationData)init;
- (FCPersonalizationData)initWithAggregates:(id)a3;
- (FCPersonalizationData)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (NSData)pbData;
- (NSDictionary)allAggregates;
- (id)aggregateForFeatureKey:(id)a3;
- (id)aggregateStore;
- (id)aggregatesForFeatureKeys:(id)a3;
- (id)aggregatesForFeatures:(id)a3;
- (id)baselineAggregateWithConfigurableValues:(id)a3;
- (id)createAggregateWith:(id)a3 clicks:(double)a4 impressions:(double)a5;
- (id)d_allGlobalAggregates;
- (id)generateDerivedData;
- (id)localStoreMigrator;
- (id)lookupAggregatesWith:(id)a3 creationBlock:(id)a4;
- (id)recordsForRestoringZoneName:(id)a3;
- (void)_applicationDidEnterBackground;
- (void)_reloadTreatment;
- (void)_unsafeReloadTreatment;
- (void)_updateWithRemoteRecord:(void *)a3 profile:;
- (void)_writeToLocalStoreWithCompletionHandler:(uint64_t)a1;
- (void)activityObservingApplicationWillTerminate;
- (void)activityObservingApplicationWindowDidBecomeBackground;
- (void)activityObservingApplicationWindowDidBecomeForeground;
- (void)clearPersonalizationData;
- (void)configurationManager:(id)a3 configurationDidChange:(id)a4;
- (void)d_allResults:(id)a3 completion:(id)a4;
- (void)enumerateAggregatesUsingBlock:(id)a3;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)modifyLocalAggregatesForFeatureKeys:(id)a3 withAction:(unint64_t)a4 actionCount:(unint64_t)a5 defaultClicks:(double)a6 defaultImpressions:(double)a7 impressionBias:(double)a8 groupBias:(double)a9;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)prepareAggregatesForUseWithCompletionHandler:(id)a3;
- (void)setAggregates:(uint64_t)a1;
- (void)syncWithCompletion:(id)a3;
- (void)updateAggregatesWith:(id)a3 creationBlock:(id)a4 updateBlock:(id)a5;
- (void)updateFeatures:(id)a3 withAction:(unint64_t)a4 displayRank:(int64_t)a5 groupRank:(int64_t)a6 groupType:(int64_t)a7 individually:(BOOL)a8 configurableValues:(id)a9;
@end

@implementation FCPersonalizationData

void __44__FCPersonalizationData_generateDerivedData__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 136, 1);
  }
  v4 = [Property defaultScoringConfig];
  [v4 decayFactor];
  double v6 = v5;

  v7 = [FCDerivedPersonalizationData alloc];
  v8 = *(void **)(a1 + 32);
  if (v8) {
    v8 = (void *)v8[14];
  }
  v12 = v8;
  uint64_t v9 = [(FCDerivedPersonalizationData *)v7 initWithAggregates:v12 scoringType:2 decayRate:v6];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __48__FCPersonalizationData__saveReadableAggregates__block_invoke(uint64_t a1)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = *(void **)(a1 + 32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48__FCPersonalizationData__saveReadableAggregates__block_invoke_2;
  v30[3] = &unk_1E5B5B3D0;
  id v4 = v2;
  id v31 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v30];
  v35[0] = v4;
  v34[0] = @"aggregates";
  v34[1] = @"lastUpdated";
  double v5 = NSString;
  double v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  v8 = objc_msgSend(v5, "stringWithFormat:", @"%f", v7);
  v35[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  id v29 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:1 error:&v29];
  id v11 = v29;
  id v12 = v11;
  if (v10)
  {
    v13 = (void *)MEMORY[0x1E4F1CB10];
    v14 = [*(id *)(a1 + 40) localStore];
    v15 = [v14 storeDirectory];
    v16 = [v13 fileURLWithPath:v15];
    v17 = [v16 URLByAppendingPathComponent:@"personalization-aggregates"];
    v18 = [v17 URLByAppendingPathExtension:@"json"];

    if (v18)
    {
      v19 = [v18 path];
      id v26 = v12;
      int v20 = [v10 writeToFile:v19 options:1 error:&v26];
      id v21 = v26;

      v22 = FCPersonalizationLog;
      if (v20)
      {
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = [v18 path];
          *(_DWORD *)buf = 138412290;
          id v33 = v24;
          _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEFAULT, "Successfully saved readable aggregates at %@.", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v21;
        _os_log_error_impl(&dword_1A460D000, v22, OS_LOG_TYPE_ERROR, "Error when saving readable aggregates: %@", buf, 0xCu);
      }
      id v12 = v21;
    }
    else
    {
      v25 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A460D000, v25, OS_LOG_TYPE_ERROR, "Failed to construct file URL for saving readable aggregates", buf, 2u);
      }
      v18 = 0;
    }
  }
  else
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __48__FCPersonalizationData__saveReadableAggregates__block_invoke_3;
    v27[3] = &unk_1E5B4C018;
    id v12 = v11;
    id v28 = v12;
    __48__FCPersonalizationData__saveReadableAggregates__block_invoke_3((uint64_t)v27);
    v18 = v28;
  }
}

+ (unint64_t)localStoreVersion
{
  return 3;
}

+ (id)localStoreFilename
{
  return @"personalization-data";
}

+ (void)configureKeyValueStoreForJSONHandling:(id)a3
{
}

+ (id)commandStoreFileName
{
  return @"personalization-data-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 0;
}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  if (objc_msgSend((id)-[FCPersonalizationData superclass](self, "superclass"), "instancesRespondToSelector:", sel_activityObservingApplicationWindowDidBecomeForeground))
  {
    v3.receiver = self;
    v3.super_class = (Class)FCPersonalizationData;
    [(FCPrivateDataController *)&v3 activityObservingApplicationWindowDidBecomeForeground];
  }
}

- (void)loadLocalCachesFromStore
{
  objc_super v3 = [(FCPrivateDataController *)self localStore];
  id v4 = [v3 objectForKey:@"pb-data"];
  pbData = self->_pbData;
  self->_pbData = v4;

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  dispatch_async(accessQueue, block);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke_49;
  v10[3] = &unk_1E5B4C018;
  v10[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:v10];
  if (NFInternalBuild())
  {
    uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v8 = [v7 BOOLForKey:@"personalization_erase_all"];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v9 setBool:0 forKey:@"personalization_erase_all"];

      [(FCPersonalizationData *)self clearPersonalizationData];
    }
  }
}

- (void)_reloadTreatment
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = (void *)FCPersonalizationDataAccessUnique;
    if (dispatch_get_specific((const void *)FCPersonalizationDataAccessUnique) != v2
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_super v3 = (void *)[[NSString alloc] initWithFormat:@"accessing protected data from outside the queue"];
      int v4 = 136315906;
      double v5 = "-[FCPersonalizationData _reloadTreatment]";
      __int16 v6 = 2080;
      uint64_t v7 = "FCPersonalizationData.m";
      __int16 v8 = 1024;
      int v9 = 627;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);
    }
    -[FCPersonalizationData _unsafeReloadTreatment](a1);
  }
}

- (void)_unsafeReloadTreatment
{
  if (a1)
  {
    id v2 = [a1 context];
    id v6 = [v2 configurationManager];

    objc_super v3 = [v6 configuration];
    int v4 = [v3 personalizationTreatment];
    objc_setProperty_atomic(a1, v5, v4, 136);
  }
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 1;
}

void __79__FCPersonalizationData_initWithContext_pushNotificationCenter_storeDirectory___block_invoke(uint64_t a1)
{
}

- (void)_updateWithRemoteRecord:(void *)a3 profile:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    __int16 v8 = (void *)FCPersonalizationDataAccessUnique;
    if (dispatch_get_specific((const void *)FCPersonalizationDataAccessUnique) != v8
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)[[NSString alloc] initWithFormat:@"accessing protected data from outside the queue"];
      int v25 = 136315906;
      id v26 = "-[FCPersonalizationData _updateWithRemoteRecord:profile:]";
      __int16 v27 = 2080;
      id v28 = "FCPersonalizationData.m";
      __int16 v29 = 1024;
      int v30 = 466;
      __int16 v31 = 2114;
      v32 = v24;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v25, 0x26u);
    }
    if (!v6) {
      goto LABEL_8;
    }
    id v9 = a1[15];
    if (!v9) {
      goto LABEL_8;
    }
    id v10 = v9;
    id v11 = [v10 modificationDate];
    uint64_t v12 = [v6 modificationDate];

    int v13 = objc_msgSend(v11, "fc_isEarlierThan:", v12);
    if (v13)
    {
LABEL_8:
      v14 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_INFO, "will update personalization data from a new remote record", (uint8_t *)&v25, 2u);
      }
      id v15 = a1[14];
      objc_msgSend(objc_getProperty(a1, v16, 136, 1), "clicksToImpressionsRatioMaximum");
      +[FCModifyPersonalizationOperation applyAggregates:toProfile:maxRatio:](FCModifyPersonalizationOperation, "applyAggregates:toProfile:maxRatio:", v15, v7);

      v17 = [v7 aggregatesByFeatureKey];
      v18 = (void *)[v17 mutableCopy];
      v19 = v18;
      if (!v18)
      {
        v19 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      objc_storeStrong(a1 + 14, v19);
      if (!v18) {

      }
      objc_storeStrong(a1 + 15, a2);
      int v20 = (void *)FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = a1[14];
        v22 = v20;
        uint64_t v23 = [v21 count];
        int v25 = 134217984;
        id v26 = (const char *)v23;
        _os_log_impl(&dword_1A460D000, v22, OS_LOG_TYPE_DEFAULT, "did update personalization data from a new remote record with %lu aggregates", (uint8_t *)&v25, 0xCu);
      }
    }
  }
}

void __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_INFO, "will load personalization data from disk", (uint8_t *)&v24, 2u);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F82B18]);
  int v4 = [*(id *)(a1 + 32) pbData];
  SEL v5 = (void *)[v3 initWithData:v4];

  id v6 = [v5 aggregates];
  id v7 = objc_msgSend(v6, "fc_dictionaryWithKeyBlock:", &__block_literal_global_173);
  __int16 v8 = (void *)[v7 mutableCopy];
  -[FCPersonalizationData setAggregates:](*(void *)(a1 + 32), v8);

  id v9 = [v5 remoteRecord];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 objectForKeyedSubscript:@"data"];

    if (!v11)
    {
      uint64_t v12 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        _os_log_error_impl(&dword_1A460D000, v12, OS_LOG_TYPE_ERROR, "ignoring locally-cached PersonalizationProfile record since it lost its data when decoding", (uint8_t *)&v24, 2u);
      }

      id v10 = 0;
    }
  }
  int v13 = +[FCModifyPersonalizationOperation personalizationProfileFromRecord:v10];
  -[FCPersonalizationData _updateWithRemoteRecord:profile:](*(id **)(a1 + 32), v10, v13);
  v14 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = *(void **)(a1 + 32);
    if (v15) {
      id v15 = (void *)v15[14];
    }
    SEL v16 = v15;
    v17 = v14;
    uint64_t v18 = [v16 count];
    LODWORD(v24) = 134217984;
    *(void *)((char *)&v24 + 4) = v18;
    _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "did load personalization data from disk with %lu aggregates", (uint8_t *)&v24, 0xCu);
  }
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19 && NFInternalBuild())
  {
    int v20 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_DEFAULT, "Will save readable aggregates.", (uint8_t *)&v24, 2u);
    }
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:*(void *)(v19 + 112) copyItems:1];
    v22 = FCPersistenceQueue();
    *(void *)&long long v24 = MEMORY[0x1E4F143A8];
    *((void *)&v24 + 1) = 3221225472;
    int v25 = __48__FCPersonalizationData__saveReadableAggregates__block_invoke;
    id v26 = &unk_1E5B4BE70;
    id v27 = v21;
    uint64_t v28 = v19;
    id v23 = v21;
    dispatch_async(v22, &v24);
  }
}

- (void)setAggregates:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (NSData)pbData
{
  return self->_pbData;
}

- (FCPersonalizationData)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FCPersonalizationData;
  id v9 = [(FCPrivateDataController *)&v22 initWithContext:v8 pushNotificationCenter:a4 storeDirectory:a5];
  if (v9)
  {
    id v10 = [v8 configurationManager];
    [v10 addObserver:v9];

    id v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v12 = dispatch_queue_create("FCPersonalizationData.aggregatesAccessQueue", v11);
    int v13 = (void *)*((void *)v9 + 16);
    *((void *)v9 + 16) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v9 + 16), (const void *)FCPersonalizationDataAccessUnique, (void *)FCPersonalizationDataAccessUnique, 0);
    v14 = [[FCTimedOperationThrottler alloc] initWithDelegate:v9];
    [(FCTimedOperationThrottler *)v14 setCooldownTime:30.0];
    id v15 = (void *)*((void *)v9 + 18);
    *((void *)v9 + 18) = v14;
    SEL v16 = v14;

    v17 = [v8 appActivityMonitor];
    [v17 addObserver:v9];

    uint64_t v18 = *((void *)v9 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__FCPersonalizationData_initWithContext_pushNotificationCenter_storeDirectory___block_invoke;
    block[3] = &unk_1E5B4C018;
    id v21 = v9;
    dispatch_async(v18, block);
  }
  return (FCPersonalizationData *)v9;
}

- (id)generateDerivedData
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = (void *)[[NSString alloc] initWithFormat:@"This operation must not be performed on the main thread."];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCPersonalizationData generateDerivedData]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCPersonalizationData.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v9) = 243;
    WORD2(v9) = 2114;
    *(void *)((char *)&v9 + 6) = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v9 = __Block_byref_object_copy__78;
  *((void *)&v9 + 1) = __Block_byref_object_dispose__78;
  id v10 = 0;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__FCPersonalizationData_generateDerivedData__block_invoke;
  v7[3] = &unk_1E5B4F3B0;
  v7[4] = self;
  v7[5] = buf;
  dispatch_sync(accessQueue, v7);
  id v4 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v4;
}

- (id)localStoreMigrator
{
  id v3 = [FCPersonalizationDataMigrator alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__FCPersonalizationData_localStoreMigrator__block_invoke;
  v6[3] = &unk_1E5B4C840;
  v6[4] = self;
  id v4 = [(FCPersonalizationDataMigrator *)v3 initWithTreatmentProvider:v6];
  return v4;
}

void __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke_49(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localStore];
  id v6 = [v2 objectForKeyedSubscript:@"last-successful-download-date"];

  if (!v6
    || ([MEMORY[0x1E4F1C9C8] date],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 timeIntervalSinceDate:v6],
        double v5 = v4,
        v3,
        v5 > 86400.0))
  {
    [*(id *)(a1 + 32) markAsDirty];
  }
}

- (FCPersonalizationData)init
{
  id v3 = objc_opt_new();
  double v4 = [(FCPersonalizationData *)self initWithAggregates:v3];

  return v4;
}

- (FCPersonalizationData)initWithAggregates:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCPersonalizationData;
  double v5 = [(FCPrivateDataController *)&v15 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create("FCPersonalizationData.aggregatesAccessQueue", v7);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;

    id v10 = v5->_accessQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__FCPersonalizationData_initWithAggregates___block_invoke;
    v12[3] = &unk_1E5B4BE70;
    int v13 = v5;
    id v14 = v4;
    dispatch_async(v10, v12);
  }
  return v5;
}

void __44__FCPersonalizationData_initWithAggregates___block_invoke(uint64_t a1)
{
}

- (void)modifyLocalAggregatesForFeatureKeys:(id)a3 withAction:(unint64_t)a4 actionCount:(unint64_t)a5 defaultClicks:(double)a6 defaultImpressions:(double)a7 impressionBias:(double)a8 groupBias:(double)a9
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  SEL v16 = (char *)a3;
  if ([MEMORY[0x1E4F29060] isMainThread]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v26 = (void *)[[NSString alloc] initWithFormat:@"This operation must not be performed on the main thread."];
    *(_DWORD *)buf = 136315906;
    __int16 v31 = "-[FCPersonalizationData modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpres"
          "sions:impressionBias:groupBias:]";
    __int16 v32 = 2080;
    uint64_t v33 = "FCPersonalizationData.m";
    __int16 v34 = 1024;
    int v35 = 169;
    __int16 v36 = 2114;
    v37 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v17 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = v17;
    NSStringFromFCPersonalizationAction(a4);
    uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    __int16 v31 = v19;
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "Processing action %@ for features %@", buf, 0x16u);
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F82B08]);
  [v20 setDefaultClicks:a6];
  [v20 setDefaultImpressions:a7];
  [v20 setImpressionBias:a8];
  [v20 setGroupBias:a9];
  id v21 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v20, "setTimestamp:", objc_msgSend(v21, "fc_millisecondTimeIntervalSince1970"));

  [v20 addAction:a4 count:a5];
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __142__FCPersonalizationData_modifyLocalAggregatesForFeatureKeys_withAction_actionCount_defaultClicks_defaultImpressions_impressionBias_groupBias___block_invoke;
  block[3] = &unk_1E5B4C738;
  void block[4] = self;
  id v23 = v16;
  uint64_t v28 = v23;
  id v24 = v20;
  id v29 = v24;
  dispatch_sync(accessQueue, block);
  if (self) {
    saveThrottler = self->_saveThrottler;
  }
  else {
    saveThrottler = 0;
  }
  [(FCOperationThrottler *)saveThrottler tickle];
}

void __142__FCPersonalizationData_modifyLocalAggregatesForFeatureKeys_withAction_actionCount_defaultClicks_defaultImpressions_impressionBias_groupBias___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 136, 1);
  }
  id v4 = Property;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        uint64_t v11 = *(void *)(a1 + 32);
        if (v11) {
          dispatch_queue_t v12 = *(void **)(v11 + 112);
        }
        else {
          dispatch_queue_t v12 = 0;
        }
        objc_msgSend(v12, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * v9), (void)v19);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F82B00]);
          [v13 setFeatureKey:v10];
          uint64_t v14 = *(void *)(a1 + 32);
          if (v14) {
            objc_super v15 = *(void **)(v14 + 112);
          }
          else {
            objc_super v15 = 0;
          }
          [v15 setObject:v13 forKeyedSubscript:v10];
        }
        if (([*(id *)(a1 + 48) applyToAggregate:v13 withTreatment:v4] & 1) == 0
          && ![v13 eventCount]
          && ([v10 isEqualToString:@"f0"] & 1) == 0)
        {
          uint64_t v16 = *(void *)(a1 + 32);
          if (v16) {
            v17 = *(void **)(v16 + 112);
          }
          else {
            v17 = 0;
          }
          [v17 removeObjectForKey:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v18 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v7 = v18;
    }
    while (v18);
  }
}

- (void)clearPersonalizationData
{
  [MEMORY[0x1E4F29060] isMainThread];
  id v3 = [FCRemoveRecordsCommand alloc];
  id v4 = [(id)objc_opt_class() backingRecordIDs];
  id v5 = [(FCRemoveRecordsCommand *)v3 initWithRecordIDs:v4];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v5];
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__FCPersonalizationData_clearPersonalizationData__block_invoke;
  block[3] = &unk_1E5B4C018;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __49__FCPersonalizationData_clearPersonalizationData__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 112);
  }
  else {
    id v3 = 0;
  }
  [v3 removeAllObjects];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 120), 0);
  }
}

- (id)d_allGlobalAggregates
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__78;
  id v10 = __Block_byref_object_dispose__78;
  id v11 = 0;
  if (self) {
    self = (FCPersonalizationData *)self->_accessQueue;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__FCPersonalizationData_d_allGlobalAggregates__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(&self->super.super, v5);
  id v3 = [(FCPersonalizationData *)v2 aggregatesForFeatureKeys:v7[5]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__FCPersonalizationData_d_allGlobalAggregates__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[14];
  }
  uint64_t v6 = v2;
  uint64_t v3 = [v6 allKeys];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)aggregateStore
{
  uint64_t v2 = [[FCReadonlyPersonalizationAggregateStore alloc] initWithGenerator:self];
  return v2;
}

- (void)syncWithCompletion:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__FCPersonalizationData_syncWithCompletion___block_invoke;
  v8[3] = &unk_1E5B5B338;
  uint64_t v10 = v5;
  id v9 = v4;
  v7.receiver = self;
  v7.super_class = (Class)FCPersonalizationData;
  id v6 = v4;
  [(FCPrivateDataController *)&v7 syncWithCompletion:v8];
}

void __44__FCPersonalizationData_syncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v7 = v6;
  uint64_t v8 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    double v10 = v7 - *(double *)(a1 + 40);
    int v11 = 134217984;
    double v12 = v10;
    _os_log_debug_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEBUG, "took %.3fs to sync personalization data", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

+ (BOOL)requiresPushNotificationSupport
{
  return 0;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)backingRecordIDs
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"SharedPersonalizationProfile"];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  return 0;
}

+ (id)desiredKeys
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"data";
  v4[1] = @"version";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

uint64_t __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke_45(uint64_t a1, void *a2)
{
  return [a2 featureKey];
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v25 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "recordID", v25);
        uint64_t v14 = [v13 recordName];
        int v15 = [v14 isEqualToString:@"SharedPersonalizationProfile"];

        if (v15)
        {
          if (self) {
            accessQueue = self->_accessQueue;
          }
          else {
            accessQueue = 0;
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __73__FCPersonalizationData_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
          block[3] = &unk_1E5B4BE70;
          void block[4] = v12;
          void block[5] = self;
          dispatch_async(accessQueue, block);
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v25;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    while (2)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        if (objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "isEqualToString:", @"SharedPersonalizationProfile", v25))
        {
          if (self) {
            long long v22 = self->_accessQueue;
          }
          else {
            long long v22 = 0;
          }
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __73__FCPersonalizationData_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2;
          v26[3] = &unk_1E5B4C018;
          v26[4] = self;
          dispatch_async(v22, v26);
          goto LABEL_25;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  id v23 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v24 = [(FCPrivateDataController *)self localStore];
  [v24 setObject:v23 forKeyedSubscript:@"last-successful-download-date"];
}

void __73__FCPersonalizationData_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1)
{
  id v2 = +[FCModifyPersonalizationOperation personalizationProfileFromRecord:*(void *)(a1 + 32)];
  -[FCPersonalizationData _updateWithRemoteRecord:profile:](*(id **)(a1 + 40), *(void **)(a1 + 32), v2);
}

void __73__FCPersonalizationData_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && *(void *)(v1 + 120))
  {
    id v3 = +[FCModifyPersonalizationOperation personalizationProfileFromRecord:0];
    -[FCPersonalizationData _updateWithRemoteRecord:profile:](*(id **)(a1 + 32), 0, v3);
  }
}

id __43__FCPersonalizationData_localStoreMigrator__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_13;
  }
  if (!v3[16]) {
    goto LABEL_16;
  }
  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    goto LABEL_16;
  }
  uint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "self.accessQueue");
  *(_DWORD *)buf = 136315906;
  int v11 = "-[FCPersonalizationData localStoreMigrator]_block_invoke";
  __int16 v12 = 2080;
  uint64_t v13 = "FCPersonalizationData.m";
  __int16 v14 = 1024;
  int v15 = 427;
  __int16 v16 = 2114;
  id v17 = v9;
  _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
LABEL_16:
    if (objc_getProperty(v3, a2, 136, 1)) {
      goto LABEL_7;
    }
    id v5 = *(void **)(a1 + 32);
  }
  else
  {
LABEL_13:
    id v5 = 0;
  }
  -[FCPersonalizationData _unsafeReloadTreatment](v5);
LABEL_7:
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v4, 136, 1);
  }
  id v7 = Property;
  return v7;
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F19D88]];
}

- (id)recordsForRestoringZoneName:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__78;
  uint64_t v13 = __Block_byref_object_dispose__78;
  id v14 = 0;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__FCPersonalizationData_recordsForRestoringZoneName___block_invoke;
  v8[3] = &unk_1E5B4C258;
  void v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(accessQueue, v8);
  if (v10[5])
  {
    v15[0] = v10[5];
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __53__FCPersonalizationData_recordsForRestoringZoneName___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    id v2 = *(void **)(v1 + 120);
  }
  else {
    id v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (void)_writeToLocalStoreWithCompletionHandler:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)FCPersonalizationDataAccessUnique;
    if (dispatch_get_specific((const void *)FCPersonalizationDataAccessUnique) != v4
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = (void *)[[NSString alloc] initWithFormat:@"accessing protected data from outside the queue"];
      *(_DWORD *)buf = 136315906;
      long long v21 = "-[FCPersonalizationData _writeToLocalStoreWithCompletionHandler:]";
      __int16 v22 = 2080;
      id v23 = "FCPersonalizationData.m";
      __int16 v24 = 1024;
      int v25 = 489;
      __int16 v26 = 2114;
      long long v27 = v16;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v5 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "will generate personalization data for disk", buf, 2u);
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F82B18]);
    id v7 = [*(id *)(a1 + 112) allValues];
    uint64_t v8 = (void *)[v7 mutableCopy];
    [v6 setAggregates:v8];

    [v6 setRemoteRecord:*(void *)(a1 + 120)];
    uint64_t v9 = FCDeviceIdentifierForVendor();
    [v6 setCurrentInstanceIdentifier:v9];

    uint64_t v10 = [v6 data];
    uint64_t v11 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *(id *)(a1 + 112);
      uint64_t v13 = v11;
      uint64_t v14 = [v12 count];
      *(_DWORD *)buf = 134217984;
      long long v21 = (const char *)v14;
      _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "did generate personalization data for disk with %lu aggregates", buf, 0xCu);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__FCPersonalizationData__writeToLocalStoreWithCompletionHandler___block_invoke;
    v17[3] = &unk_1E5B4E088;
    v17[4] = a1;
    id v18 = v10;
    id v19 = v3;
    id v15 = v10;
    FCPerformBlockOnMainThread(v17);
  }
}

uint64_t __65__FCPersonalizationData__writeToLocalStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) localStore];
  [v3 setObject:v2 forKeyedSubscript:@"pb-data"];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

- (void)_applicationDidEnterBackground
{
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    uint64_t v2 = [(id)a1 localStore];
    id v3 = [v2 objectForKeyedSubscript:@"last-successful-download-date"];

    id v4 = [(id)a1 context];
    id v5 = [v4 networkReachability];
    if ([v5 isNetworkReachable]
      && [(id)a1 isSyncingEnabled]
      && v3)
    {
      char v6 = *(unsigned char *)(a1 + 96);

      if (v6) {
        goto LABEL_15;
      }
      id v7 = [(id)a1 localStore];
      id v4 = [v7 objectForKeyedSubscript:@"last-successful-upload-date"];

      uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v9 = [v8 BOOLForKey:@"upload_personalization_data_often"];

      if (!v4
        || (!v9 ? (double v10 = 3600.0) : (double v10 = 0.0),
            [MEMORY[0x1E4F1C9C8] date],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            [v11 timeIntervalSinceDate:v4],
            double v13 = v12,
            v11,
            v13 >= v10))
      {
        uint64_t v14 = [(id)a1 localStore];
        id v15 = [v14 objectForKeyedSubscript:@"below-minimum-version"];
        char v16 = [v15 BOOLValue];

        if ((v16 & 1) == 0)
        {
          char v17 = 1;
          *(unsigned char *)(a1 + 96) = 1;
LABEL_16:
          id v18 = [(id)a1 context];
          id v19 = [v18 backgroundTaskable];

          uint64_t v37 = 0;
          uint64_t v38 = &v37;
          uint64_t v39 = 0x2020000000;
          uint64_t v40 = 0;
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          void v34[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke;
          v34[3] = &unk_1E5B4F3B0;
          id v20 = v19;
          id v35 = v20;
          __int16 v36 = &v37;
          uint64_t v21 = objc_msgSend(v20, "fc_beginBackgroundTaskWithName:expirationHandler:", @"Personalization Upload", v34);
          v38[3] = v21;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_2;
          aBlock[3] = &unk_1E5B5B380;
          uint64_t v31 = a1;
          long long v32 = &v37;
          char v33 = v17;
          id v30 = v20;
          id v22 = v20;
          id v23 = _Block_copy(aBlock);
          __int16 v24 = *(NSObject **)(a1 + 128);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_4;
          block[3] = &unk_1E5B4F9F8;
          char v28 = v17;
          void block[4] = a1;
          id v27 = v23;
          id v25 = v23;
          dispatch_async(v24, block);

          _Block_object_dispose(&v37, 8);
          return;
        }
LABEL_15:
        char v17 = 0;
        goto LABEL_16;
      }
    }
    else
    {
    }
    goto LABEL_15;
  }
}

uint64_t __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_3;
  v2[3] = &unk_1E5B5B380;
  id v3 = *(id *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_3(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      *(unsigned char *)(v3 + 96) = 0;
    }
  }
  return result;
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_4(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 136, 1);
  }
  id v4 = Property;
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_5;
  v7[3] = &unk_1E5B58110;
  char v10 = *(unsigned char *)(a1 + 48);
  v7[4] = v5;
  id v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v6 = v4;
  -[FCPersonalizationData _writeToLocalStoreWithCompletionHandler:](v5, v7);
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localStore];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_6;
  void v4[3] = &unk_1E5B58110;
  char v7 = *(unsigned char *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 saveWithCompletionHandler:v4];
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      uint64_t v3 = *(NSObject **)(v2 + 128);
    }
    else {
      uint64_t v3 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_7;
    block[3] = &unk_1E5B4E088;
    void block[4] = v2;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    dispatch_async(v3, block);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_7(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(FCModifyPersonalizationOperation);
  uint64_t v3 = [*(id *)(a1 + 32) context];
  id v4 = [v3 internalPrivateDataContext];
  id v5 = [v4 privateDatabase];
  [(FCModifyPersonalizationOperation *)v2 setDatabase:v5];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 112);
  }
  else {
    uint64_t v7 = 0;
  }
  [(FCModifyPersonalizationOperation *)v2 setAggregates:v7];
  [(FCModifyPersonalizationOperation *)v2 setTreatment:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 120);
  }
  else {
    uint64_t v9 = 0;
  }
  [(FCModifyPersonalizationOperation *)v2 setRemoteRecord:v9];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_8;
  uint64_t v14 = &unk_1E5B5B3A8;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 48);
  [(FCModifyPersonalizationOperation *)v2 setSaveCompletionHandler:&v11];
  char v10 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue", v11, v12, v13, v14, v15);
  [v10 addOperation:v2];
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  char v10 = v9;
  if (!v7 || !v8)
  {
    uint64_t v11 = [v9 domain];
    if ([v11 isEqualToString:@"FCErrorDomain"])
    {
      uint64_t v12 = [v10 code];

      if (v12 == 6)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_12;
        v13[3] = &unk_1E5B4C018;
        v13[4] = *(void *)(a1 + 32);
        FCPerformBlockOnMainThread(v13);
        goto LABEL_9;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_9;
  v14[3] = &unk_1E5B57F60;
  v14[4] = *(void *)(a1 + 32);
  id v15 = v8;
  id v16 = v7;
  id v17 = *(id *)(a1 + 40);
  FCPerformBlockOnMainThread(v14);

LABEL_9:
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_9(id *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [a1[4] localStore];
  [v3 setObject:v2 forKeyedSubscript:@"last-successful-download-date"];

  id v4 = [a1[4] localStore];
  [v4 setObject:v2 forKeyedSubscript:@"last-successful-upload-date"];

  id v5 = a1[4];
  if (v5) {
    uint64_t v6 = *((void *)v5 + 16);
  }
  else {
    uint64_t v6 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_10;
  v7[3] = &unk_1E5B57F60;
  v7[4] = v5;
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  dispatch_async(v6, v7);
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_10(uint64_t a1)
{
  -[FCPersonalizationData _updateWithRemoteRecord:profile:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_11;
  v3[3] = &unk_1E5B4CC80;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 56);
  -[FCPersonalizationData _writeToLocalStoreWithCompletionHandler:](v2, v3);
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_11(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localStore];
  [v2 saveWithCompletionHandler:*(void *)(a1 + 40)];
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_12(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) localStore];
  [v1 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"below-minimum-version"];
}

void __48__FCPersonalizationData__saveReadableAggregates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dictionaryRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __48__FCPersonalizationData__saveReadableAggregates__block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Error when saving readable aggregates: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)activityObservingApplicationWindowDidBecomeBackground
{
  -[FCPersonalizationData _applicationDidEnterBackground]((uint64_t)self);
  if (objc_msgSend((id)-[FCPersonalizationData superclass](self, "superclass"), "instancesRespondToSelector:", sel_activityObservingApplicationWindowDidBecomeBackground))
  {
    v3.receiver = self;
    v3.super_class = (Class)FCPersonalizationData;
    [(FCPersonalizationData *)&v3 activityObservingApplicationWindowDidBecomeBackground];
  }
}

- (void)activityObservingApplicationWillTerminate
{
  -[FCPersonalizationData _applicationDidEnterBackground]((uint64_t)self);
  if (objc_msgSend((id)-[FCPersonalizationData superclass](self, "superclass"), "instancesRespondToSelector:", sel_activityObservingApplicationWillTerminate))
  {
    v3.receiver = self;
    v3.super_class = (Class)FCPersonalizationData;
    [(FCPersonalizationData *)&v3 activityObservingApplicationWillTerminate];
  }
}

- (id)aggregatesForFeatureKeys:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__78;
  id v16 = __Block_byref_object_dispose__78;
  id v17 = 0;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FCPersonalizationData_aggregatesForFeatureKeys___block_invoke;
  block[3] = &unk_1E5B4C230;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__FCPersonalizationData_aggregatesForFeatureKeys___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    id v2 = (void *)v2[14];
  }
  uint64_t v3 = a1[5];
  id v7 = v2;
  uint64_t v4 = objc_msgSend(v7, "fc_subdictionaryWithCopiesForKeys:", v3);
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)enumerateAggregatesUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = (void *)[[NSString alloc] initWithFormat:@"This operation must not be performed on the main thread."];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCPersonalizationData enumerateAggregatesUsingBlock:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCPersonalizationData.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v13) = 728;
    WORD2(v13) = 2114;
    *(void *)((char *)&v13 + 6) = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v13 = __Block_byref_object_copy__78;
  *((void *)&v13 + 1) = __Block_byref_object_dispose__78;
  id v14 = 0;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FCPersonalizationData_enumerateAggregatesUsingBlock___block_invoke;
  block[3] = &unk_1E5B4C258;
  void block[4] = self;
  void block[5] = buf;
  dispatch_sync(accessQueue, block);
  id v6 = *(void **)(*(void *)&buf[8] + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__FCPersonalizationData_enumerateAggregatesUsingBlock___block_invoke_2;
  v9[3] = &unk_1E5B5B3F8;
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  _Block_object_dispose(buf, 8);
}

void __55__FCPersonalizationData_enumerateAggregatesUsingBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[14];
  }
  uint64_t v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __55__FCPersonalizationData_enumerateAggregatesUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)aggregateForFeatureKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v11 count:1];

  id v7 = -[FCPersonalizationData aggregatesForFeatureKeys:](self, "aggregatesForFeatureKeys:", v6, v11, v12);
  id v8 = [v7 allValues];
  id v9 = [v8 firstObject];

  return v9;
}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__FCPersonalizationData_configurationManager_configurationDidChange___block_invoke;
  block[3] = &unk_1E5B4C018;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __69__FCPersonalizationData_configurationManager_configurationDidChange___block_invoke(uint64_t a1)
{
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = (void *)[[NSString alloc] initWithFormat:@"This operation must not be performed on the main thread."];
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "-[FCPersonalizationData operationThrottler:performAsyncOperationWithCompletion:]";
    __int16 v13 = 2080;
    id v14 = "FCPersonalizationData.m";
    __int16 v15 = 1024;
    int v16 = 761;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
LABEL_7:
    accessQueue = 0;
    goto LABEL_5;
  }
  if (!self) {
    goto LABEL_7;
  }
LABEL_4:
  accessQueue = self->_accessQueue;
LABEL_5:
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__FCPersonalizationData_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v9[3] = &unk_1E5B4CC80;
  void v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(accessQueue, v9);
}

void __80__FCPersonalizationData_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
}

id __63__FCPersonalizationData_configureKeyValueStoreForJSONHandling___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  int v8 = [v7 isEqualToString:@"pb-data"];

  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F82B18]) initWithData:v5];
    if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "localPersonalizationData");
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = "+[FCPersonalizationData configureKeyValueStoreForJSONHandling:]_block_invoke";
      __int16 v20 = 2080;
      uint64_t v21 = "FCPersonalizationData.m";
      __int16 v22 = 1024;
      int v23 = 780;
      __int16 v24 = 2114;
      id v25 = v17;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v10 = [v9 dictionaryRepresentation];
    goto LABEL_18;
  }
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v11 = v4;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;
  int v13 = [v12 isEqualToString:@"remote_record_data"];

  if (v13)
  {
    id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];
    id v14 = [v9 objectForKeyedSubscript:@"data"];
    __int16 v15 = (void *)[objc_alloc(MEMORY[0x1E4F82B20]) initWithData:v14];
    id v10 = [v15 dictionaryRepresentation];

LABEL_18:
    goto LABEL_20;
  }
  id v10 = v5;
LABEL_20:

  return v10;
}

- (void)updateAggregatesWith:(id)a3 creationBlock:(id)a4 updateBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke;
  v15[3] = &unk_1E5B5B448;
  id v16 = v8;
  __int16 v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(accessQueue, v15);
}

void __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_2;
  void v4[3] = &unk_1E5B5B420;
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 56);
  [v2 enumerateObjectsUsingBlock:v4];
}

void __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_2(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)a1[4];
  if (v4) {
    id v4 = (void *)v4[14];
  }
  id v5 = v4;
  id v6 = [v5 objectForKeyedSubscript:v3];
  if (v6 || (uint64_t v8 = a1[5]) == 0)
  {
    id v7 = v6;
  }
  else
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v7;

  if (v9)
  {
    id v10 = v9;
    id v11 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_debug_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEBUG, "Updating aggregate %@", buf, 0xCu);
    }
    (*(void (**)(void))(a1[6] + 16))();
    id v12 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_debug_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEBUG, "Updated aggregate %@", buf, 0xCu);
    }
    uint64_t v13 = a1[4];
    if (v13) {
      id v14 = *(void **)(v13 + 112);
    }
    else {
      id v14 = 0;
    }
    [v14 setObject:v10 forKeyedSubscript:v3];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_3;
    v15[3] = &unk_1E5B4C018;
    id v16 = v3;
    __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_3((uint64_t)v15);
    id v10 = v16;
  }
}

void __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Ignoring update for aggregate %@ because it doesn't exist already and this update didn't specify the option to create the aggregate", (uint8_t *)&v4, 0xCu);
  }
}

- (id)lookupAggregatesWith:(id)a3 creationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__78;
  __int16 v22 = __Block_byref_object_dispose__78;
  id v23 = 0;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke;
  v13[3] = &unk_1E5B5B498;
  id v14 = v6;
  __int16 v15 = self;
  id v16 = v7;
  __int16 v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, v13);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke_2;
  v9[3] = &unk_1E5B59150;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v4;
  id v12 = v5;
  uint64_t v6 = objc_msgSend(v2, "fc_dictionary:", v9);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke_3;
  v8[3] = &unk_1E5B5B470;
  uint64_t v5 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v6 = (void *)a1[6];
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v6;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  id v9 = v3;
  if (v4) {
    uint64_t v4 = (void *)v4[14];
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v5 objectForKeyedSubscript:v9];
  if (v6 || (uint64_t v7 = *(void *)(a1 + 48)) == 0)
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v9];
  }
  else
  {
    uint64_t v8 = (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

- (id)createAggregateWith:(id)a3 clicks:(double)a4 impressions:(double)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  [v8 setFeatureKey:v7];

  [v8 setClicks:a4];
  [v8 setImpressions:a5];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v8, "setTimestamp:", objc_msgSend(v9, "fc_millisecondTimeIntervalSince1970"));

  uint64_t v10 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    uint64_t v13 = v8;
    _os_log_debug_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEBUG, "Created personalization aggregate %@", (uint8_t *)&v12, 0xCu);
  }
  return v8;
}

- (NSDictionary)allAggregates
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__78;
  uint64_t v10 = __Block_byref_object_dispose__78;
  id v11 = 0;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __38__FCPersonalizationData_allAggregates__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __38__FCPersonalizationData_allAggregates__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __38__FCPersonalizationData_allAggregates__block_invoke_2;
  v5[3] = &unk_1E5B4BF78;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionary:", v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __38__FCPersonalizationData_allAggregates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__FCPersonalizationData_allAggregates__block_invoke_3;
  v7[3] = &unk_1E5B4CA10;
  id v8 = v3;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __38__FCPersonalizationData_allAggregates__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveThrottler, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_remoteRecord, 0);
  objc_storeStrong((id *)&self->_aggregates, 0);
  objc_storeStrong((id *)&self->_pbData, 0);
}

- (id)baselineAggregateWithConfigurableValues:(id)a3
{
  return FCPersonalizationAggregateBaselineAggregateWithConfigurableValues(self, a3);
}

- (id)aggregatesForFeatures:(id)a3
{
  return FCPersonalizationAggregateAggregatesForFeatures(self, a3);
}

- (void)updateFeatures:(id)a3 withAction:(unint64_t)a4 displayRank:(int64_t)a5 groupRank:(int64_t)a6 groupType:(int64_t)a7 individually:(BOOL)a8 configurableValues:(id)a9
{
  BOOL v43 = a8;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v46 = a9;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    __int16 v15 = MEMORY[0x1E4F14500];
    uint64_t v16 = *(void *)v48;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v47 + 1) + 8 * v17);
        uint64_t v19 = [v18 personalizationIdentifier];

        if (v19)
        {
          [v10 addObject:v18];
          uint64_t v20 = [v18 personalizationIdentifier];
          [v11 addObject:v20];
LABEL_8:

          goto LABEL_10;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"Found a personalization feature without a personalization identifier"];
          *(_DWORD *)buf = 136315906;
          v53 = "-[FCPersonalizationData(FCPersonalizationAggregate) updateFeatures:withAction:displayRank:groupRank:grou"
                "pType:individually:configurableValues:]";
          __int16 v54 = 2080;
          v55 = "FCPersonalizationAggregate.m";
          __int16 v56 = 1024;
          int v57 = 347;
          __int16 v58 = 2114;
          v59 = v20;
          _os_log_error_impl(&dword_1A460D000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          goto LABEL_8;
        }
LABEL_10:
        ++v17;
      }
      while (v14 != v17);
      uint64_t v21 = [v12 countByEnumeratingWithState:&v47 objects:v60 count:16];
      uint64_t v14 = v21;
    }
    while (v21);
  }

  __int16 v22 = +[FCBaselineFeature baselineFeature];
  id v23 = [v22 personalizationIdentifier];
  __int16 v24 = [(FCPersonalizationData *)self aggregateForFeatureKey:v23];

  if (!v24)
  {
    __int16 v24 = FCPersonalizationAggregateDefaultBaselineAggregateWithConfigurableValues(v46);
  }
  double v25 = FCPersonalizationAggregateImpressionBiasForAction(a4, a5, a6, v46);
  double v26 = FCPersonalizationAggregateGroupBiasForGroupType(a7, v46);
  [v46 featureImpressionPrior];
  double v28 = v27;
  long long v29 = [v46 defaultScoringConfig];
  [v29 decayFactor];
  objc_msgSend(v24, "personalizationValueWithBaseline:decayRate:", 0);
  double v31 = v28 * v30;
  [v46 featureImpressionPrior];
  uint64_t v32 = 1;
  [(FCPersonalizationData *)self modifyLocalAggregatesForFeatureKeys:v11 withAction:a4 actionCount:1 defaultClicks:v31 defaultImpressions:v33 impressionBias:v25 groupBias:v26];

  long long v34 = +[FCBaselineFeature baselineFeature];
  id v35 = [v34 personalizationIdentifier];
  v51 = v35;
  __int16 v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  if (v43) {
    uint64_t v32 = [v11 count];
  }
  [v24 clicks];
  double v38 = v37;
  [v24 impressions];
  [(FCPersonalizationData *)self modifyLocalAggregatesForFeatureKeys:v36 withAction:a4 actionCount:v32 defaultClicks:v38 defaultImpressions:v39 impressionBias:v25 groupBias:v26];
}

- (void)prepareAggregatesForUseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__FCPersonalizationData_FCPersonalizationAggregate__prepareAggregatesForUseWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5B50C10;
  id v7 = v4;
  id v5 = v4;
  [(FCPrivateDataController *)self performFirstSyncWithCallbackQueue:MEMORY[0x1E4F14428] completion:v6];
}

uint64_t __98__FCPersonalizationData_FCPersonalizationAggregate__prepareAggregatesForUseWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)d_allResults:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke;
  v10[3] = &unk_1E5B5BB80;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(FCPrivateDataController *)self forceSyncWithCompletion:v10];
}

void __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_2;
  block[3] = &unk_1E5B4F930;
  id v3 = *(id *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_2(id *a1)
{
  uint64_t v2 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_3;
  aBlock[3] = &unk_1E5B50C58;
  id v3 = v2;
  id v14 = v3;
  uint64_t v16 = 10;
  id v15 = a1[5];
  id v4 = _Block_copy(aBlock);
  id v5 = objc_msgSend(a1[4], "d_allGlobalAggregates");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_5;
  v10[3] = &unk_1E5B5BB58;
  id v11 = v3;
  id v12 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  v6[2](v6);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_6;
  v8[3] = &unk_1E5B4CA88;
  id v9 = a1[6];
  FCPerformBlockOnMainThread(v8);
}

void __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_3(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 48))
  {
    uint64_t v2 = (void *)[*(id *)(a1 + 32) copy];
    [*(id *)(a1 + 32) removeAllObjects];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_4;
    v5[3] = &unk_1E5B4C7C0;
    id v3 = *(id *)(a1 + 40);
    id v6 = v2;
    id v7 = v3;
    id v4 = v2;
    FCPerformBlockOnMainThread(v5);
  }
}

uint64_t __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = +[FCPersonalizationFeature featureForIdentifier:a2];
  if (v5)
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end