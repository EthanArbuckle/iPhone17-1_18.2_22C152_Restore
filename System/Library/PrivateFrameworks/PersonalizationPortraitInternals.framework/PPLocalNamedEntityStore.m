@interface PPLocalNamedEntityStore
+ (float)resolvedPerRecordDecayRateForFeatureProvider:(id)a3 perRecordDecayRate:(float)a4;
+ (id)defaultStore;
+ (id)recordsForNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5;
+ (void)sortAndTruncate:(id)a3 queryLimit:(unint64_t)a4;
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)cloudSyncWithError:(id *)a3;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllNamedEntitiesOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllNamedEntityFeedbackCountsOlderThanDate:(id)a3;
- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6;
- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5;
- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8;
- (BOOL)filterExistingNamedEntitiesWithShouldContinueBlock:(id)a3;
- (BOOL)flushDonationsWithError:(id *)a3;
- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterRankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)pruneOrphanedNamedEntityFeedbackCountsWithLimit:(int64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6;
- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4;
- (BOOL)removeMapItemsBeforeCutoffDate:(id)a3 error:(id *)a4;
- (NSString)invalidationNotificationOverride;
- (NSString)meaningfulChangeNotificationOverride;
- (PPLocalNamedEntityStore)init;
- (PPLocalNamedEntityStore)initWithStorage:(id)a3 topicStoreForNamedEntityMapping:(id)a4 lazyContactStoreForMapsFeedback:(id)a5 trialWrapper:(id)a6;
- (PPNamedEntityStorage)storage;
- (double)finalScoreFromRecordsUsingHybrid:(id)a3 streamingScorer:(id)a4 mlModel:(id)a5;
- (id)mapItemForPlaceName:(id)a3 error:(id *)a4;
- (id)namedEntityRecordsWithQuery:(id)a3 error:(id *)a4;
- (id)namedEntityToMatchedStringMappingForNamedEntities:(id)a3 timestamp:(double)a4 error:(id *)a5;
- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4;
- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 clientProcessName:(id)a5;
- (id)scoredEntityFromRecords:(id)a3 scoringDate:(id)a4 perRecordDecayRate:(float)a5 decayRate:(float)a6 sourceStats:(id)a7 decayedFeedbackCounts:(id)a8 streamingScorer:(id *)a9 mlModel:(id)a10;
- (uint64_t)_generateMapsSearchQueryResult;
- (void)_logDifferentiallyPrivateExtractionsWithDpCategory:(void *)a1 extractions:(void *)a2;
- (void)disableSyncForBundleIds:(id)a3;
- (void)processFeedback:(id)a3;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)runWithLockAcquired:(id)a3;
- (void)setInvalidationNotificationOverride:(id)a3;
- (void)setMeaningfulChangeNotificationOverride:(id)a3;
@end

@implementation PPLocalNamedEntityStore

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  char v18 = 0;
  unint64_t v17 = 0;
  char v12 = 0;
  if ([(PPNamedEntityStorage *)self->_storage deleteAllNamedEntitiesFromSourcesWithBundleId:v10 groupIds:v11 atLeastOneNamedEntityRemoved:&v18 deletedCount:&v17 error:a6])
  {
    topicStoreForNamedEntityMapping = self->_topicStoreForNamedEntityMapping;
    if (topicStoreForNamedEntityMapping) {
      char v12 = [(PPLocalTopicStore *)topicStoreForNamedEntityMapping deleteAllTopicsFromSourcesWithBundleId:v10 groupIds:v11 algorithm:4 deletedCount:0 error:a6];
    }
    else {
      char v12 = 1;
    }
  }
  if (v18)
  {
    id v14 = [(PPLocalNamedEntityStore *)self invalidationNotificationOverride];
    v15 = (const char *)[v14 UTF8String];
    if (!v15) {
      v15 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    }
    PPPostNotification(v15);
  }
  if (a5) {
    *a5 = v17;
  }

  return v12;
}

- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v36 = a5;
  v9 = pp_entities_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend(v8, "limit", v36);
    id v11 = [v8 fromDate];
    char v12 = [v11 description];
    v13 = [v8 toDate];
    id v14 = [v13 description];
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v69 = v14;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "iterNamedEntityRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);
  }
  if (![v8 limit])
  {
    LOBYTE(v26) = 1;
    goto LABEL_21;
  }
  v15 = (void *)[v8 copy];
  [v15 setLimit:-1];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v69 = __Block_byref_object_copy__5984;
  v70 = __Block_byref_object_dispose__5985;
  id v71 = 0;
  id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t v17 = [v8 limit];
  if (v17 >= 0x40) {
    uint64_t v18 = 64;
  }
  else {
    uint64_t v18 = v17;
  }
  id v71 = (id)objc_msgSend(v16, "initWithCapacity:", v18, v36);
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  char v62 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke;
  aBlock[3] = &unk_1E65D6110;
  v58 = v61;
  v59 = buf;
  id v57 = v36;
  v60 = v63;
  id v19 = v8;
  id v56 = v19;
  v20 = _Block_copy(aBlock);
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  id v21 = v19;
  v22 = v21;
  BOOL v23 = self != 0;
  if (self)
  {
    BOOL v24 = (unint64_t)([v21 locationConsumer] - 1) < 2;

    if (!v24)
    {
      BOOL v23 = 0;
      v25 = 0;
      goto LABEL_13;
    }
    v22 = +[PPLocalLocationStore defaultStore];
    v25 = [v22 homeOrWorkAddresses];
  }
  else
  {
    v25 = 0;
  }

  LOBYTE(v24) = self != 0;
LABEL_13:
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke_2;
  v45[3] = &unk_1E65D6138;
  id v27 = v25;
  id v46 = v27;
  v28 = _Block_copy(v45);
  storage = self->_storage;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke_3;
  v37[3] = &unk_1E65D6160;
  v40 = &v51;
  BOOL v44 = v24;
  id v30 = v28;
  id v38 = v30;
  v41 = &v47;
  v42 = buf;
  v31 = v20;
  id v39 = v31;
  v43 = v61;
  BOOL v26 = [(PPNamedEntityStorage *)storage iterNamedEntityRecordsWithQuery:v15 error:a4 block:v37];
  if (v26) {
    v31[2](v31);
  }
  if (v23 && v48[3])
  {
    v32 = pp_entities_log_handle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = v48[3];
      uint64_t v35 = v52[3];
      *(_DWORD *)v64 = 134218240;
      uint64_t v65 = v34;
      __int16 v66 = 2048;
      uint64_t v67 = v35;
      _os_log_debug_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEBUG, "iterNamedEntitiesRecordsWithQuery filtered %tu of %tu items due to map UI restriction", v64, 0x16u);
    }
  }
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(buf, 8);

LABEL_21:
  return v26;
}

void __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1CB79D060]();
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
        if (*(unsigned char *)(v8 + 24))
        {
          BOOL v9 = 1;
        }
        else
        {
          uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          BOOL v9 = v10 == objc_msgSend(*(id *)(a1 + 32), "limit", (void)v11);
          uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
        }
        *(unsigned char *)(v8 + 24) = v9;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v5) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "removeAllObjects", (void)v11);
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  char v15 = 0;
  unint64_t v14 = 0;
  char v9 = 0;
  if ([(PPNamedEntityStorage *)self->_storage deleteAllNamedEntitiesFromSourcesWithBundleId:v8 atLeastOneNamedEntityRemoved:&v15 deletedCount:&v14 error:a5])
  {
    topicStoreForNamedEntityMapping = self->_topicStoreForNamedEntityMapping;
    if (topicStoreForNamedEntityMapping) {
      char v9 = [(PPLocalTopicStore *)topicStoreForNamedEntityMapping deleteAllTopicsFromSourcesWithBundleId:v8 algorithm:4 deletedCount:0 error:a5];
    }
    else {
      char v9 = 1;
    }
  }
  if (v15)
  {
    id v11 = [(PPLocalNamedEntityStore *)self invalidationNotificationOverride];
    long long v12 = (const char *)[v11 UTF8String];
    if (!v12) {
      long long v12 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    }
    PPPostNotification(v12);
  }
  if (a4) {
    *a4 = v14;
  }

  return v9;
}

+ (id)defaultStore
{
  pthread_mutex_lock(&defaultStore_lock_6115);
  if (!defaultStore_instance_6116)
  {
    uint64_t v2 = objc_opt_new();
    id v3 = (void *)defaultStore_instance_6116;
    defaultStore_instance_6116 = v2;

    uint64_t v4 = (void *)defaultStore_instance_6116;
    if (defaultStore_instance_6116)
    {
      -[PPLocalNamedEntityStore _generateMapsSearchQueryResult](defaultStore_instance_6116);
      id location = 0;
      objc_initWeak(&location, v4);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__PPLocalNamedEntityStore__registerMapsQueryPrefetching__block_invoke;
      aBlock[3] = &unk_1E65DC540;
      objc_copyWeak(&v16, &location);
      uint64_t v5 = _Block_copy(aBlock);
      uint64_t v6 = +[PPAppLaunchMonitor sharedInstance];
      uint64_t v7 = *MEMORY[0x1E4F8A0A0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__PPLocalNamedEntityStore__registerMapsQueryPrefetching__block_invoke_393;
      v13[3] = &unk_1E65D63A0;
      v13[4] = v4;
      id v8 = v5;
      id v14 = v8;
      id v9 = (id)[v6 registerForAppLaunchWithBundleId:v7 queue:0 handler:v13];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v10 = pp_entities_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore defaultStore did not initialize, will try again later. Device may be Class C locked.", (uint8_t *)v13, 2u);
      }
    }
  }
  id v11 = (id)defaultStore_instance_6116;
  pthread_mutex_unlock(&defaultStore_lock_6115);
  return v11;
}

uint64_t __56__PPLocalNamedEntityStore__registerMapsQueryPrefetching__block_invoke_393(uint64_t a1)
{
  uint64_t v2 = pp_entities_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "Maps launch event handler invoked", v4, 2u);
  }

  return [MEMORY[0x1E4F93B18] runAsyncOnQueue:*(void *)(*(void *)(a1 + 32) + 32) afterDelaySeconds:*(void *)(a1 + 40) block:3.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningfulChangeNotificationOverride, 0);
  objc_storeStrong((id *)&self->_invalidationNotificationOverride, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_mapsPrefetchQueue, 0);
  objc_storeStrong((id *)&self->_lazyContactStoreForMapsFeedback, 0);
  objc_storeStrong((id *)&self->_topicStoreForNamedEntityMapping, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)setMeaningfulChangeNotificationOverride:(id)a3
{
}

- (NSString)meaningfulChangeNotificationOverride
{
  return self->_meaningfulChangeNotificationOverride;
}

- (void)setInvalidationNotificationOverride:(id)a3
{
}

- (NSString)invalidationNotificationOverride
{
  return self->_invalidationNotificationOverride;
}

- (PPNamedEntityStorage)storage
{
  return self->_storage;
}

- (void)runWithLockAcquired:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PPLocalNamedEntityStore_runWithLockAcquired___block_invoke;
  v7[3] = &unk_1E65D63C8;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __47__PPLocalNamedEntityStore_runWithLockAcquired___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)filterExistingNamedEntitiesWithShouldContinueBlock:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(void))a3;
  uint64_t v5 = objc_opt_new();
  if (v4[2](v4))
  {
    id v6 = [(PPTrialWrapper *)self->_trialWrapper lastTreatmentUpdateForNamespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"];
    storage = self->_storage;
    id v48 = 0;
    id v8 = [(PPNamedEntityStorage *)storage namedEntityFilterLastRunDateWithError:&v48];
    id v9 = v48;
    if (v6) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v8 == 0;
    }
    if (v10)
    {
      if (!v8
        || ([v6 earlierDate:v8],
            id v11 = objc_claimAutoreleasedReturnValue(),
            int v12 = [v11 isEqualToDate:v6],
            v11,
            !v12))
      {
        if (v4[2](v4))
        {
          *(void *)buf = 0;
          v43 = buf;
          uint64_t v44 = 0x3032000000;
          v45 = __Block_byref_object_copy__5984;
          id v46 = __Block_byref_object_dispose__5985;
          id v47 = 0;
          id v47 = (id)objc_opt_new();
          id v16 = objc_opt_new();
          if (v4[2](v4))
          {
            unint64_t v17 = self->_storage;
            uint64_t v18 = objc_opt_new();
            v41 = v9;
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __78__PPLocalNamedEntityStore_filterExistingNamedEntitiesWithShouldContinueBlock___block_invoke;
            v37[3] = &unk_1E65D6350;
            id v39 = v4;
            id v38 = v16;
            v40 = buf;
            [(PPNamedEntityStorage *)v17 iterNamedEntityRecordsAndIdsWithQuery:v18 error:&v41 block:v37];
            id v19 = v41;

            if ([*((id *)v43 + 5) count])
            {
              v20 = pp_entities_log_handle();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v21 = [*((id *)v43 + 5) count];
                *(_DWORD *)uint64_t v49 = 134217984;
                uint64_t v50 = v21;
                _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: dropping %tu named entities", v49, 0xCu);
              }

              uint64_t v35 = v19;
              uint64_t v36 = 0;
              BOOL v22 = [(PPNamedEntityStorage *)self->_storage deleteNamedEntitiesMatchingRowIds:*((void *)v43 + 5) atLeastOneNamedEntityRemoved:0 deletedCount:&v36 error:&v35];
              BOOL v23 = v35;

              if (!v22)
              {
                BOOL v24 = pp_entities_log_handle();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)uint64_t v49 = 138412290;
                  uint64_t v50 = (uint64_t)v23;
                  _os_log_error_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: error in dropping the named entities: %@", v49, 0xCu);
                }
              }
              uint64_t v25 = v36;
              if (v25 != [*((id *)v43 + 5) count])
              {
                BOOL v26 = pp_entities_log_handle();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v27 = [*((id *)v43 + 5) count];
                  *(_DWORD *)uint64_t v49 = 134218240;
                  uint64_t v50 = v27;
                  __int16 v51 = 2048;
                  uint64_t v52 = v36;
                  _os_log_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: dropped a different number of named entities than was expected. Expected %tu, found %tu", v49, 0x16u);
                }
              }
            }
            else
            {
              id v30 = pp_entities_log_handle();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)uint64_t v49 = 0;
                _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore: no named entities to drop.", v49, 2u);
              }

              BOOL v23 = v19;
            }
            v31 = self->_storage;
            uint64_t v34 = v23;
            char v13 = [(PPNamedEntityStorage *)v31 setNamedEntityFilterLastRunDate:v5 error:&v34];
            id v9 = v34;

            if (v13)
            {
              v32 = pp_entities_log_handle();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v49 = 0;
                _os_log_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: completed pruning of database for new filter.", v49, 2u);
              }
            }
            else
            {
              v32 = pp_entities_log_handle();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)uint64_t v49 = 138412290;
                uint64_t v50 = (uint64_t)v9;
                _os_log_error_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: unable to update the last runtime of the named entity filter. %@", v49, 0xCu);
              }
            }

            v29 = v39;
          }
          else
          {
            v29 = pp_entities_log_handle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v49 = 0;
              _os_log_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: deferring filtering of named entities after constructing filter.", v49, 2u);
            }
            char v13 = 0;
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          v28 = pp_entities_log_handle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: deferring filtering of named entiies before filtering operation.", buf, 2u);
          }

          char v13 = 0;
        }
        goto LABEL_47;
      }
      id v14 = pp_entities_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: not running filter as there is no need.", buf, 2u);
      }
    }
    else
    {
      id v14 = pp_entities_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: has previously run filter on default assets in the build.", buf, 2u);
      }
    }

    char v13 = 1;
LABEL_47:

    goto LABEL_48;
  }
  id v9 = pp_entities_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: deferring filtering of named entities before processing.", buf, 2u);
  }
  char v13 = 0;
LABEL_48:

  return v13;
}

void __78__PPLocalNamedEntityStore_filterExistingNamedEntitiesWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    if (([*(id *)(a1 + 32) isAcceptableRecord:v7] & 1) == 0)
    {
      id v8 = pp_entities_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 134217984;
        uint64_t v11 = a3;
        _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: filtering named entity with row id %lli", (uint8_t *)&v10, 0xCu);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addIndex:a3];
    }
  }
  else
  {
    id v9 = pp_entities_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: deferring filtering in progress.", (uint8_t *)&v10, 2u);
    }

    *a4 = 1;
  }
}

- (id)namedEntityToMatchedStringMappingForNamedEntities:(id)a3 timestamp:(double)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_opt_new();
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:a4];
  [v9 setScoringDate:v10];
  [v9 setToDate:v10];
  [v9 setOrderByName:1];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__5984;
  v32[4] = __Block_byref_object_dispose__5985;
  id v33 = 0;
  id v33 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v8];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5984;
  id v30 = __Block_byref_object_dispose__5985;
  id v31 = 0;
  id v31 = (id)objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PPLocalNamedEntityStore_namedEntityToMatchedStringMappingForNamedEntities_timestamp_error___block_invoke;
  aBlock[3] = &unk_1E65DC7A8;
  void aBlock[4] = v32;
  aBlock[5] = &v26;
  uint64_t v11 = _Block_copy(aBlock);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__5984;
  v23[4] = __Block_byref_object_dispose__5985;
  id v24 = 0;
  uint64_t v21 = v23;
  id v22 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__PPLocalNamedEntityStore_namedEntityToMatchedStringMappingForNamedEntities_timestamp_error___block_invoke_2;
  v19[3] = &unk_1E65D6328;
  id v12 = v11;
  id v20 = v12;
  BOOL v13 = [(PPLocalNamedEntityStore *)self iterNamedEntityRecordsWithQuery:v9 error:&v22 block:v19];
  id v14 = v22;
  char v15 = v14;
  if (v13)
  {
    id v16 = (id)v27[5];
  }
  else
  {
    if (a5 && v14) {
      *a5 = v14;
    }
    unint64_t v17 = pp_entities_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v15;
      _os_log_error_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_ERROR, "namedEntityToMatchedStringMappingForNamedEntities: error from iterNamedEntityRecordsWithQuery: %@", buf, 0xCu);
    }

    id v16 = 0;
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v32, 8);
  return v16;
}

void __93__PPLocalNamedEntityStore_namedEntityToMatchedStringMappingForNamedEntities_timestamp_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count])
  {
    id v6 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
          BOOL v13 = (void *)MEMORY[0x1CB79D060](v8);
          objc_msgSend(v5, "rangeOfString:options:", v12, 1, (void)v15);
          if (v14)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v5 forKeyedSubscript:v12];
            [v6 addObject:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v9 = v8;
      }
      while (v8);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) minusSet:v6];
  }
  else
  {
    *a3 = 1;
  }
}

void __93__PPLocalNamedEntityStore_namedEntityToMatchedStringMappingForNamedEntities_timestamp_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  id v5 = [v17 entity];
  uint64_t v6 = [v5 clusterIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v9 = [v17 entity];
    uint64_t v10 = [v9 clusterIdentifier];
    LOBYTE(v8) = [v8 isEqualToString:v10];

    if (v8) {
      goto LABEL_5;
    }
    uint64_t v11 = [v17 entity];
    uint64_t v12 = [v11 clusterIdentifier];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v15 = *(void *)(a1 + 32);
    id v5 = [v17 entity];
    long long v16 = [v5 name];
    (*(void (**)(uint64_t, void *, uint64_t))(v15 + 16))(v15, v16, a3);
  }
LABEL_5:
}

- (void)processFeedback:(id)a3
{
  uint64_t v236 = *MEMORY[0x1E4F143B8];
  id v162 = a3;
  id v3 = [v162 feedbackItems];
  if (self)
  {
    id v4 = objc_opt_new();
    long long v224 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v224 objects:v232 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v225;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v225 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v224 + 1) + 8 * i);
          uint64_t v10 = (void *)MEMORY[0x1CB79D060]();
          uint64_t v11 = [v9 itemString];
          uint64_t v12 = [v4 objectForKeyedSubscript:v11];
          BOOL v13 = v12 == 0;

          if (v13)
          {
            uint64_t v14 = objc_opt_new();
            [v4 setObject:v14 forKeyedSubscript:v11];
          }
          uint64_t v15 = [v4 objectForKeyedSubscript:v11];
          [v15 addObject:v9];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v224 objects:v232 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = 0;
  }

  long long v16 = [v162 clientIdentifier];
  int v17 = [v16 isEqualToString:@"mapssearch"];

  if (v17)
  {
    id v18 = v4;
    v193 = v18;
    if (self)
    {
      v178 = [v18 allKeys];
      id v19 = objc_opt_new();
      v176 = objc_opt_new();
      if ([v178 count])
      {
        uint64_t v20 = 0;
        uint64_t v21 = 0;
        unsigned int v169 = 0;
        while (1)
        {
          v171 = (void *)MEMORY[0x1CB79D060]();
          uint64_t v22 = (unint64_t)[v178 count] > 7 ? 8 : objc_msgSend(v178, "count");
          BOOL v23 = (void *)MEMORY[0x1CB79D060]();
          v173 = objc_msgSend(v178, "subarrayWithRange:", v20, v22);
          [v176 setMatchingIdentifiers:v173];
          id v24 = [(_PASLazyResult *)self->_lazyContactStoreForMapsFeedback result];
          *(void *)&long long v209 = v21;
          uint64_t v25 = [v24 contactsWithQuery:v176 error:&v209];
          id v26 = (id)v209;

          if (!v25) {
            break;
          }
          long long v222 = 0u;
          long long v223 = 0u;
          long long v220 = 0u;
          long long v221 = 0u;
          obuint64_t j = v25;
          uint64_t v184 = [obj countByEnumeratingWithState:&v220 objects:v232 count:16];
          if (v184)
          {
            uint64_t v182 = *(void *)v221;
            uint64_t v27 = v26;
            do
            {
              uint64_t v28 = 0;
              do
              {
                if (*(void *)v221 != v182)
                {
                  uint64_t v29 = v28;
                  objc_enumerationMutation(obj);
                  uint64_t v28 = v29;
                }
                uint64_t v187 = v28;
                id v30 = *(void **)(*((void *)&v220 + 1) + 8 * v28);
                context = (void *)MEMORY[0x1CB79D060]();
                v207[0] = v27;
                v195 = [v30 contactsContactIdentifierWithError:v207];
                id v191 = v207[0];

                if (v195)
                {
                  id v31 = [v30 localizedFullName];

                  if (v31)
                  {
                    v32 = [v30 localizedFullName];
                    id v33 = [v19 objectForKeyedSubscript:v32];
                    BOOL v34 = v33 == 0;

                    if (v34)
                    {
                      uint64_t v35 = objc_opt_new();
                      uint64_t v36 = [v30 localizedFullName];
                      [v19 setObject:v35 forKeyedSubscript:v36];
                    }
                    v37 = [v30 localizedFullName];
                    id v38 = [v19 objectForKeyedSubscript:v37];
                    id v39 = [v193 objectForKeyedSubscript:v195];
                    v40 = v39;
                    if (!v39)
                    {
                      v40 = (void *)MEMORY[0x1E4F1CBF0];
                    }
                    [v38 addObjectsFromArray:v40];
                  }
                  long long v216 = 0u;
                  long long v217 = 0u;
                  long long v214 = 0u;
                  long long v215 = 0u;
                  v41 = [v30 postalAddresses];
                  uint64_t v42 = [v41 countByEnumeratingWithState:&v214 objects:&v224 count:16];
                  if (v42)
                  {
                    uint64_t v43 = *(void *)v215;
                    do
                    {
                      for (uint64_t j = 0; j != v42; ++j)
                      {
                        if (*(void *)v215 != v43) {
                          objc_enumerationMutation(v41);
                        }
                        v45 = *(void **)(*((void *)&v214 + 1) + 8 * j);
                        id v46 = (void *)MEMORY[0x1CB79D060]();
                        id v47 = [v45 value];
                        id v48 = [v47 singleLineNormalizedAddressString];
                        if (v48)
                        {
                          uint64_t v49 = [v19 objectForKeyedSubscript:v48];
                          BOOL v50 = v49 == 0;

                          if (v50)
                          {
                            __int16 v51 = objc_opt_new();
                            [v19 setObject:v51 forKeyedSubscript:v48];
                          }
                          uint64_t v52 = [v19 objectForKeyedSubscript:v48];
                          uint64_t v53 = [v193 objectForKeyedSubscript:v195];
                          uint64_t v54 = v53;
                          if (!v53)
                          {
                            uint64_t v54 = (void *)MEMORY[0x1E4F1CBF0];
                          }
                          [v52 addObjectsFromArray:v54];
                        }
                      }
                      uint64_t v42 = [v41 countByEnumeratingWithState:&v214 objects:&v224 count:16];
                    }
                    while (v42);
                  }
                }
                else
                {
                  v41 = pp_entities_log_handle();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v191;
                    _os_log_error_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: error fetching contact identifier for contact. %@", buf, 0xCu);
                  }
                }

                uint64_t v28 = v187 + 1;
                uint64_t v27 = v191;
              }
              while (v187 + 1 != v184);
              uint64_t v184 = [obj countByEnumeratingWithState:&v220 objects:v232 count:16];
              uint64_t v27 = v191;
            }
            while (v184);
          }
          else
          {
            uint64_t v27 = v26;
          }
          uint64_t v21 = v27;

          v169 += 8;
          uint64_t v20 = v169;
          if ([v178 count] <= (unint64_t)v169) {
            goto LABEL_57;
          }
        }
        v55 = pp_entities_log_handle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v26;
          _os_log_error_impl(&dword_1CA9A8000, v55, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: error fetching maps related contacts: %@", buf, 0xCu);
        }

        uint64_t v21 = v26;
LABEL_57:
      }
      id v4 = v19;
      [v19 addEntriesFromDictionary:v193];
    }
    else
    {
      id v4 = 0;
    }
  }
  id v56 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v57 = [v4 allKeys];
  uint64_t v58 = [v56 initWithArray:v57];

  v59 = objc_opt_new();
  v161 = objc_opt_new();
  v60 = [v162 timestamp];
  [v161 setScoringDate:v60];

  v61 = [v162 timestamp];
  [v161 setToDate:v61];

  char v62 = [v162 clientBundleId];
  v63 = +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v62, 1);
  [v161 setExcludingSourceBundleIds:v63];

  [v161 setOrderByName:1];
  v207[0] = 0;
  v207[1] = v207;
  v207[2] = (id)0x3032000000;
  v207[3] = __Block_byref_object_copy__5984;
  v207[4] = __Block_byref_object_dispose__5985;
  v208 = &stru_1F253DF18;
  v205 = v207;
  id v206 = 0;
  v201[0] = MEMORY[0x1E4F143A8];
  v201[1] = 3221225472;
  v201[2] = __43__PPLocalNamedEntityStore_processFeedback___block_invoke;
  v201[3] = &unk_1E65D6300;
  id v159 = (id)v58;
  id v202 = v159;
  id v160 = v59;
  id v203 = v160;
  id v196 = v4;
  id v204 = v196;
  LOBYTE(v58) = [(PPLocalNamedEntityStore *)self iterNamedEntityRecordsWithQuery:v161 error:&v206 block:v201];
  id v158 = v206;
  if (v58)
  {
    if (![v160 count])
    {
LABEL_129:
      v138 = objc_opt_new();
      long long v199 = 0u;
      long long v200 = 0u;
      long long v197 = 0u;
      long long v198 = 0u;
      id v142 = v159;
      uint64_t v143 = [v142 countByEnumeratingWithState:&v197 objects:v219 count:16];
      if (v143)
      {
        uint64_t v144 = *(void *)v198;
        do
        {
          for (uint64_t k = 0; k != v143; ++k)
          {
            if (*(void *)v198 != v144) {
              objc_enumerationMutation(v142);
            }
            uint64_t v146 = *(void *)(*((void *)&v197 + 1) + 8 * k);
            v147 = (void *)MEMORY[0x1CB79D060]();
            v148 = [v196 objectForKeyedSubscript:v146];
            [v138 addObjectsFromArray:v148];
          }
          uint64_t v143 = [v142 countByEnumeratingWithState:&v197 objects:v219 count:16];
        }
        while (v143);
      }

      if ([v138 count])
      {
        id v149 = objc_alloc(MEMORY[0x1E4F89DA0]);
        v150 = [v162 timestamp];
        v151 = [v162 clientIdentifier];
        v152 = [v162 clientBundleId];
        v153 = [v162 mappingId];
        v154 = (void *)[v149 initWithFeedbackItems:v138 timestamp:v150 clientIdentifier:v151 clientBundleId:v152 mappingId:v153];

        +[PPFeedbackStorage logFeedback:v154 domain:1 domainStatus:1 inBackground:1];
      }
      goto LABEL_138;
    }
    id v64 = objc_alloc(MEMORY[0x1E4F89DA0]);
    uint64_t v65 = [v162 timestamp];
    __int16 v66 = [v162 clientIdentifier];
    uint64_t v67 = [v162 clientBundleId];
    v68 = [v162 mappingId];
    v69 = (void *)[v64 initWithFeedbackItems:v160 timestamp:v65 clientIdentifier:v66 clientBundleId:v67 mappingId:v68];

    +[PPFeedbackStorage logFeedback:v69 domain:1 domainStatus:2 inBackground:1];
    v70 = [v162 clientBundleId];
    id v71 = [v162 clientIdentifier];
    +[PPFeedbackUtils recordUserEventsFromFeedback:v162 matchingFeedbackItems:v160 clientBundleId:v70 clientIdentifier:v71 domain:1];

    id v72 = v69;
    v157 = v72;
    if (self)
    {
      v73 = [v72 clientBundleId];
      BOOL v74 = +[PPFeedbackUtils shouldSample:v73];

      if (v74)
      {
        os_log_t oslog = (os_log_t)objc_opt_new();
        [oslog setPredictionType:2];
        v75 = +[PPFeedbackUtils feedbackMetadataForBaseFeedback:v157];
        [oslog setFeedbackMetadata:v75];

        id v213 = 0;
        id v166 = v157;
        v76 = objc_opt_new();
        v77 = objc_opt_new();
        long long v216 = 0u;
        long long v217 = 0u;
        long long v214 = 0u;
        long long v215 = 0u;
        v78 = [v166 feedbackItems];
        uint64_t v79 = [v78 countByEnumeratingWithState:&v214 objects:v232 count:16];
        if (v79)
        {
          uint64_t v80 = *(void *)v215;
          do
          {
            for (uint64_t m = 0; m != v79; ++m)
            {
              if (*(void *)v215 != v80) {
                objc_enumerationMutation(v78);
              }
              v82 = *(void **)(*((void *)&v214 + 1) + 8 * m);
              v83 = [v82 itemString];
              [v76 addObject:v83];

              v84 = [v82 itemString];
              [v77 setObject:v82 forKeyedSubscript:v84];
            }
            uint64_t v79 = [v78 countByEnumeratingWithState:&v214 objects:v232 count:16];
          }
          while (v79);
        }

        v85 = [v166 timestamp];
        [v85 timeIntervalSince1970];
        v86 = -[PPLocalNamedEntityStore namedEntityToMatchedStringMappingForNamedEntities:timestamp:error:](self, "namedEntityToMatchedStringMappingForNamedEntities:timestamp:error:", v76, &v213);

        v179 = objc_opt_new();
        long long v231 = 0u;
        long long v230 = 0u;
        long long v229 = 0u;
        *(_OWORD *)buf = 0u;
        id v87 = v86;
        uint64_t v88 = [v87 countByEnumeratingWithState:buf objects:&v224 count:16];
        if (v88)
        {
          uint64_t v89 = *(void *)v229;
          do
          {
            for (uint64_t n = 0; n != v88; ++n)
            {
              if (*(void *)v229 != v89) {
                objc_enumerationMutation(v87);
              }
              uint64_t v91 = *(void *)(*(void *)&buf[8] + 8 * n);
              v92 = [v87 objectForKeyedSubscript:v91];
              v93 = [v77 objectForKeyedSubscript:v91];
              [v179 setObject:v92 forKeyedSubscript:v93];
            }
            uint64_t v88 = [v87 countByEnumeratingWithState:buf objects:&v224 count:16];
          }
          while (v88);
        }

        id v94 = v213;
        BOOL v156 = v179 != 0;
        v155 = v94;
        if (v179)
        {
          log = [[PPFeatureRedactor alloc] initWithTrialWrapper:self->_trialWrapper namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"];
          long long v211 = 0u;
          long long v212 = 0u;
          long long v209 = 0u;
          long long v210 = 0u;
          id v170 = v179;
          uint64_t v168 = [v170 countByEnumeratingWithState:&v209 objects:&v220 count:16];
          if (!v168)
          {
            id v163 = 0;
            goto LABEL_119;
          }
          id v163 = 0;
          uint64_t v164 = *(void *)v210;
          float v95 = *MEMORY[0x1E4F8A128];
          double v96 = v95;
          while (1)
          {
            for (iuint64_t i = 0; ii != v168; ++ii)
            {
              if (*(void *)v210 != v164) {
                objc_enumerationMutation(v170);
              }
              uint64_t v97 = *(void *)(*((void *)&v209 + 1) + 8 * ii);
              id obja = +[PPFeedbackUtils feedbackItemForPPFeedbackItem:v97];
              v98 = [v170 objectForKeyedSubscript:v97];
              v99 = [v166 clientBundleId];
              v174 = log;
              id v100 = v98;
              id v183 = v99;
              v192 = v100;
              v175 = [(PPNamedEntityStorage *)self->_storage decayedFeedbackCountsForClusterIdentifier:v100];
              v194 = +[PPStreamingNamedEntityScorer scoreInterpreterAggregationBytecode];
              contexta = +[PPStreamingNamedEntityScorer scoreInterpreterFinalBytecode];
              unint64_t v101 = 0;
              if (v194 && contexta)
              {
                unint64_t v102 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:v194];
                unint64_t v101 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:contexta] | v102;
              }
              v177 = [(PPNamedEntityStorage *)self->_storage sourceStats:v101 withExcludedAlgorithms:0];
              v188 = objc_opt_new();
              v103 = objc_opt_new();
              v104 = (void *)MEMORY[0x1CB79D060]();
              v105 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v192, 0);
              [v103 setMatchingNames:v105];

              [v103 setScoringDate:v188];
              *(void *)&long long v214 = 0;
              v106 = [(PPLocalNamedEntityStore *)self namedEntityRecordsWithQuery:v103 error:&v214];
              id v107 = (id)v214;
              v172 = v107;
              if (v106)
              {
                id v108 = objc_alloc(MEMORY[0x1E4F89E90]);
                v109 = [v106 firstObject];
                v110 = [v109 entity];
                v111 = [v110 name];
                v112 = [v111 lowercaseString];
                v113 = [v106 firstObject];
                v114 = [v113 entity];
                v115 = [v114 bestLanguage];
                v116 = [v108 initWithName:v112 category:0 dynamicCategory:0 language:v115 mostRelevantRecord:0];

                v117 = [[PPStreamingNamedEntityScorer alloc] initWithScoringDate:v188 perRecordDecayRate:v177 sourceStats:v96];
                id v118 = self;
                id v119 = self;
                v120 = [v106 firstObject];
                v121 = [v116 name];
                [(PPStreamingNamedEntityScorer *)v117 startNewClusterWithDecayedFeedbackCounts:v175 mostRelevantRecord:v120 dominantEntityName:v121];

                long long v226 = 0u;
                long long v227 = 0u;
                long long v224 = 0u;
                long long v225 = 0u;
                id v122 = v106;
                uint64_t v123 = [v122 countByEnumeratingWithState:&v224 objects:v232 count:16];
                if (v123)
                {
                  uint64_t v124 = *(void *)v225;
                  do
                  {
                    for (juint64_t j = 0; jj != v123; ++jj)
                    {
                      if (*(void *)v225 != v124) {
                        objc_enumerationMutation(v122);
                      }
                      [(PPStreamingNamedEntityScorer *)v117 addRecord:*(void *)(*((void *)&v224 + 1) + 8 * jj)];
                    }
                    uint64_t v123 = [v122 countByEnumeratingWithState:&v224 objects:v232 count:16];
                  }
                  while (v123);
                }

                *(void *)buf = 0;
                id v218 = 0;
                [(PPStreamingNamedEntityScorer *)v117 getFinalScoreWithAggregationResultOut:buf finalResultOut:&v218];
                float v127 = v126;
                id v128 = objc_alloc(MEMORY[0x1E4F93BB8]);
                v129 = [NSNumber numberWithDouble:v127];
                v130 = (void *)[v128 initWithFirst:v129 second:*(void *)buf];
              }
              else
              {
                id v163 = v107;
                v116 = pp_entities_log_handle();
                if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                {
                  v137 = NSStringFromSelector(sel_getScoredNamedEntityFeaturesWithNamedEntity_excludingSourceBundleId_decayRate_error_);
                  *(_DWORD *)v232 = 138412546;
                  id v233 = v137;
                  __int16 v234 = 2112;
                  id v235 = v163;
                  _os_log_error_impl(&dword_1CA9A8000, v116, OS_LOG_TYPE_ERROR, "error %@: %@", v232, 0x16u);
                }
                v130 = 0;
              }

              if (v130)
              {
                v131 = [v130 second];
                v132 = +[PPFeedbackUtils featuresForScoreDict:v131];
                v133 = [v132 mutableCopy];

                if (v133)
                {
                  [(PPFeatureRedactor *)v174 transformFeaturesInPlace:v133];
                  v134 = [v130 first];
                  [v134 floatValue];
                  v135 = +[PPFeedbackUtils scoredItemWithFeaturesForFeatureDictionary:score:](PPFeedbackUtils, "scoredItemWithFeaturesForFeatureDictionary:score:", v133);

                  goto LABEL_108;
                }
                v136 = pp_entities_log_handle();
                if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v232 = 0;
                  _os_log_error_impl(&dword_1CA9A8000, v136, OS_LOG_TYPE_ERROR, "nil result from +[PPRecordFeaturizer featuresForScoreDict]", v232, 2u);
                }

                v133 = 0;
              }
              else
              {
                v133 = pp_entities_log_handle();
                if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v232 = 138412290;
                  id v233 = v163;
                  _os_log_error_impl(&dword_1CA9A8000, v133, OS_LOG_TYPE_ERROR, "nil result from getScoredNamedEntityFeaturesWithNamedEntity: %@", v232, 0xCu);
                }
              }
              v135 = 0;
LABEL_108:

              [v135 addFeedbackItems:obja];
              [oslog addScoredItems:v135];
            }
            uint64_t v168 = [v170 countByEnumeratingWithState:&v209 objects:&v220 count:16];
            if (!v168)
            {
LABEL_119:

              +[PPFeedbackUtils addBoilerplateToFeedbackLog:oslog];
              v139 = [MEMORY[0x1E4F93728] sharedInstance];
              [v139 logMessage:oslog];

              goto LABEL_123;
            }
          }
        }
        if (v94) {
          id v163 = v94;
        }
        else {
          id v163 = 0;
        }
        pp_entities_log_handle();
        log = (PPFeatureRedactor *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&log->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v232 = 138412290;
          id v233 = v155;
          _os_log_error_impl(&dword_1CA9A8000, &log->super, OS_LOG_TYPE_ERROR, "logFeedbackSessionsWithFeedback: nil result from getMatchedNamedEntityForFeedback: %@", v232, 0xCu);
        }
LABEL_123:
      }
      else
      {
        pp_default_log_handle();
        os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v232 = 0;
          _os_log_debug_impl(&dword_1CA9A8000, oslog, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: No feedback session logs collection performed due to sampling.", v232, 2u);
        }
        id v163 = 0;
        BOOL v156 = 1;
      }

      id v140 = v163;
      if (v156) {
        goto LABEL_128;
      }
    }
    else
    {

      id v140 = 0;
    }
    v141 = pp_entities_log_handle();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v232 = 138412290;
      id v233 = v158;
      _os_log_error_impl(&dword_1CA9A8000, v141, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: feedback logging failed: %@", v232, 0xCu);
    }

LABEL_128:
    [(PPNamedEntityStorage *)self->_storage donateNamedEntityFeedback:v157];

    goto LABEL_129;
  }
  v138 = pp_default_log_handle();
  if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v232 = 138412290;
    id v233 = v158;
    _os_log_error_impl(&dword_1CA9A8000, v138, OS_LOG_TYPE_ERROR, "processFeedbackItems: error from iterNamedEntityRecordsWithQuery: %@", v232, 0xCu);
  }
LABEL_138:

  _Block_object_dispose(v207, 8);
}

void __43__PPLocalNamedEntityStore_processFeedback___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 entity];
  uint64_t v7 = [v6 clusterIdentifier];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [v5 entity];
    uint64_t v10 = [v9 clusterIdentifier];
    char v11 = [v10 isEqual:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    if ((v11 & 1) == 0)
    {
      uint64_t v29 = a3;
      uint64_t v12 = [v5 entity];
      uint64_t v13 = [v12 clusterIdentifier];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      id v31 = objc_opt_new();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      obuint64_t j = *(id *)(a1 + 32);
      uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            uint64_t v21 = (void *)MEMORY[0x1CB79D060]();
            id v22 = v5;
            BOOL v23 = [v5 entity];
            id v24 = [v23 name];
            [v24 rangeOfString:v20 options:1];
            uint64_t v26 = v25;

            if (v26)
            {
              uint64_t v27 = *(void **)(a1 + 40);
              uint64_t v28 = [*(id *)(a1 + 48) objectForKeyedSubscript:v20];
              [v27 addObjectsFromArray:v28];

              [v31 addObject:v20];
            }
            id v5 = v22;
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v17);
      }

      [*(id *)(a1 + 32) minusSet:v31];
      if (![*(id *)(a1 + 32) count]) {
        unsigned char *v29 = 1;
      }
    }
  }
  else
  {
  }
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v7 = pp_entities_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138739971;
    id v11 = v5;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "Named entity feedback received: %{sensitive}@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = +[PPInternalFeedback fromBaseFeedback:v5 storeType:1];
  [v8 storePendingFeedback:v9 storeType:1 error:0];

  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (void)disableSyncForBundleIds:(id)a3
{
}

- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v111 = a4;
  id v104 = a5;
  uint64_t v9 = pp_entities_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v111;
    __int16 v134 = 2048;
    uint64_t v135 = [v8 count];
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating %tu locations", buf, 0x16u);
  }

  v110 = [MEMORY[0x1E4F89FC8] currentLocaleLanguageCode];
  v103 = objc_opt_new();
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  obuint64_t j = v8;
  uint64_t v105 = [obj countByEnumeratingWithState:&v129 objects:v138 count:16];
  if (!v105)
  {
    id v106 = 0;
    BOOL v107 = 1;
    goto LABEL_75;
  }
  id v106 = 0;
  uint64_t v102 = *(void *)v130;
  BOOL v107 = 1;
  do
  {
    for (uint64_t i = 0; i != v105; ++i)
    {
      if (*(void *)v130 != v102) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v129 + 1) + 8 * i);
      uint64_t v108 = MEMORY[0x1CB79D060]();
      uint64_t v12 = objc_opt_new();
      [v11 score];
      double v14 = v13;
      double v15 = 0.5;
      if (v14 > 0.0) {
        objc_msgSend(v11, "score", 0.5);
      }
      double v16 = fmin(v15, 1.0);
      uint64_t v17 = [v11 locationName];

      if (v17)
      {
        uint64_t v18 = pp_entities_log_handle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v111;
          _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a name", buf, 0xCu);
        }

        id v19 = objc_alloc(MEMORY[0x1E4F89E90]);
        uint64_t v20 = [v11 locationName];
        uint64_t v21 = (void *)[v19 initWithName:v20 category:3 language:v110];

        id v22 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v21 score:v16];
        [v12 addObject:v22];
        BOOL v23 = [v11 mapItem];
        id v24 = [v11 locationName];
        id v128 = 0;
        [(PPLocalNamedEntityStore *)self donateMapItem:v23 forPlaceName:v24 error:&v128];
        id v25 = v128;

        if (v25)
        {
          uint64_t v26 = pp_entities_log_handle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v25;
            _os_log_error_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate map item for location name: %@", buf, 0xCu);
          }

          uint64_t v27 = +[PPMetricsUtils loggingQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke;
          block[3] = &unk_1E65DC568;
          id v126 = v111;
          id v127 = v25;
          dispatch_async(v27, block);
        }
      }
      else
      {
        id v25 = 0;
      }
      uint64_t v28 = [v11 streetAddress];

      if (v28)
      {
        uint64_t v29 = pp_entities_log_handle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v111;
          _os_log_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a street address", buf, 0xCu);
        }

        id v30 = objc_alloc(MEMORY[0x1E4F89E90]);
        id v31 = [v11 streetAddress];
        long long v32 = (void *)[v30 initWithName:v31 category:8 language:v110];

        long long v33 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v32 score:v16];
        [v12 addObject:v33];
      }
      long long v34 = [v11 city];

      if (v34)
      {
        long long v35 = pp_entities_log_handle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v111;
          _os_log_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a city", buf, 0xCu);
        }

        id v36 = objc_alloc(MEMORY[0x1E4F89E90]);
        uint64_t v37 = [v11 city];
        id v38 = (void *)[v36 initWithName:v37 category:9 language:v110];

        id v39 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v38 score:v16];
        [v12 addObject:v39];
      }
      v40 = [v11 stateOrProvince];

      if (v40)
      {
        v41 = pp_entities_log_handle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v111;
          _os_log_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a state", buf, 0xCu);
        }

        id v42 = objc_alloc(MEMORY[0x1E4F89E90]);
        uint64_t v43 = [v11 stateOrProvince];
        uint64_t v44 = (void *)[v42 initWithName:v43 category:10 language:v110];

        v45 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v44 score:v16];
        [v12 addObject:v45];
      }
      id v46 = [v11 country];

      if (v46)
      {
        id v47 = pp_entities_log_handle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v111;
          _os_log_impl(&dword_1CA9A8000, v47, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a country", buf, 0xCu);
        }

        id v48 = objc_alloc(MEMORY[0x1E4F89E90]);
        uint64_t v49 = [v11 country];
        BOOL v50 = (void *)[v48 initWithName:v49 category:11 language:v110];

        __int16 v51 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v50 score:v16];
        [v12 addObject:v51];
      }
      uint64_t v52 = [v11 streetAddress];

      if (v52)
      {
        uint64_t v53 = [v11 streetAddress];
        uint64_t v54 = [v11 city];
        v55 = [v11 stateOrProvince];
        id v56 = [v11 postalCode];
        id v57 = [v11 country];
        uint64_t v58 = +[PPNamedEntitySupport fullAddressForStreetAddress:v53 city:v54 state:v55 postalCode:v56 country:v57];

        if (v58)
        {
          v59 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v58 category:12 language:v110];
          v60 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v59 score:v16];
          [v12 addObject:v60];
          v61 = [v11 mapItem];
          id v124 = v25;
          [(PPLocalNamedEntityStore *)self donateMapItem:v61 forPlaceName:v58 error:&v124];
          id v62 = v124;

          if (v62)
          {
            v63 = pp_entities_log_handle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v62;
              _os_log_error_impl(&dword_1CA9A8000, v63, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate map item for full address: %@", buf, 0xCu);
            }
          }
          id v25 = v62;
        }
      }
      id v64 = [v11 unstructuredLocationString];

      if (v64)
      {
        uint64_t v65 = pp_entities_log_handle();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v111;
          _os_log_impl(&dword_1CA9A8000, v65, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating an unstructured location string", buf, 0xCu);
        }

        id v66 = objc_alloc(MEMORY[0x1E4F89E90]);
        uint64_t v67 = [v11 unstructuredLocationString];
        v68 = (void *)[v66 initWithName:v67 category:3 language:v110];

        v69 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v68 score:v16];
        [v12 addObject:v69];
        v70 = [v11 mapItem];
        id v71 = [v11 unstructuredLocationString];
        id v123 = v25;
        [(PPLocalNamedEntityStore *)self donateMapItem:v70 forPlaceName:v71 error:&v123];
        id v72 = v123;

        if (v72)
        {
          v73 = pp_entities_log_handle();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v72;
            _os_log_error_impl(&dword_1CA9A8000, v73, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate map item for unstructured location: %@", buf, 0xCu);
          }

          BOOL v74 = +[PPMetricsUtils loggingQueue];
          v120[0] = MEMORY[0x1E4F143A8];
          v120[1] = 3221225472;
          v120[2] = __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_348;
          v120[3] = &unk_1E65DC568;
          id v121 = v111;
          id v122 = v72;
          dispatch_async(v74, v120);
        }
      }
      else
      {
        id v72 = v25;
      }
      id v75 = objc_alloc(MEMORY[0x1E4F89F40]);
      v76 = [v11 documentId];
      if (v76)
      {
        v77 = (void *)[v75 initWithBundleId:v111 groupId:v104 documentId:v76 date:v103];
      }
      else
      {
        v78 = objc_opt_new();
        uint64_t v79 = [v78 UUIDString];
        v77 = (void *)[v75 initWithBundleId:v111 groupId:v104 documentId:v79 date:v103];
      }
      uint64_t v80 = pp_entities_log_handle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v95 = [v12 count];
        double v96 = [v77 documentId];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v111;
        __int16 v134 = 2048;
        uint64_t v135 = v95;
        __int16 v136 = 2112;
        v137 = v96;
        _os_log_debug_impl(&dword_1CA9A8000, v80, OS_LOG_TYPE_DEBUG, "PPLocationNamedEntities: %@ donated %tu entities under document ID %@", buf, 0x20u);
      }
      id v119 = v72;
      BOOL v81 = [(PPLocalNamedEntityStore *)self donateNamedEntities:v12 source:v77 algorithm:6 cloudSync:0 sentimentScore:&v119 error:0.0];
      id v82 = v119;

      if (v81)
      {
        if (!v107)
        {
          BOOL v107 = 0;
          uint64_t v89 = (void *)v108;
          goto LABEL_71;
        }
        id v115 = v82;
        if (self)
        {
          id v83 = v77;
          v84 = +[PPLocalLocationStore locationNamedEntityToPPScoredLocation:v11];
          v85 = +[PPLocalLocationStore defaultStore];
          *(void *)buf = v84;
          BOOL v107 = 1;
          v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
          char v87 = [v85 donateLocations:v86 source:v83 contextualNamedEntities:0 algorithm:6 cloudSync:0 error:&v115];

          id v88 = v115;
          uint64_t v89 = (void *)v108;
          if (v87)
          {
            id v82 = v88;
            goto LABEL_71;
          }
        }
        else
        {
          id v88 = v82;

          uint64_t v89 = (void *)v108;
        }
        id v97 = v88;

        v98 = pp_entities_log_handle();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v97;
          _os_log_error_impl(&dword_1CA9A8000, v98, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate locations: %@", buf, 0xCu);
        }

        v92 = +[PPMetricsUtils loggingQueue];
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_357;
        v112[3] = &unk_1E65DC568;
        id v113 = v111;
        id v82 = v97;
        id v114 = v82;
        dispatch_async(v92, v112);
        id v94 = &v114;
        v93 = &v113;
      }
      else
      {
        id v90 = v82;

        uint64_t v91 = pp_entities_log_handle();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v90;
          _os_log_error_impl(&dword_1CA9A8000, v91, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate entities: %@", buf, 0xCu);
        }

        v92 = +[PPMetricsUtils loggingQueue];
        v116[0] = MEMORY[0x1E4F143A8];
        v116[1] = 3221225472;
        v116[2] = __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_353;
        v116[3] = &unk_1E65DC568;
        id v117 = v111;
        id v82 = v90;
        id v118 = v82;
        dispatch_async(v92, v116);
        id v94 = &v118;
        v93 = &v117;
        uint64_t v89 = (void *)v108;
      }

      id v106 = v82;
      BOOL v107 = 0;
LABEL_71:
    }
    uint64_t v105 = [obj countByEnumeratingWithState:&v129 objects:v138 count:16];
  }
  while (v105);
LABEL_75:

  if (a6) {
    *a6 = v106;
  }
  [(PPLocalNamedEntityStore *)self flushDonationsWithError:a6];

  return v107;
}

void __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(void *)(a1 + 32)));
  [v3 setErrorMessage:@"PPEventKitImporter: failed to donate map item for location name."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  uint64_t v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

void __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_348(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(void *)(a1 + 32)));
  [v3 setErrorMessage:@"PPLocationNamedEntities: failed to donate map item for unstructured location."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  uint64_t v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

void __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_353(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(void *)(a1 + 32)));
  [v3 setErrorMessage:@"PPLocationNamedEntities: failed to donate entities."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  uint64_t v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

void __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_357(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(void *)(a1 + 32)));
  [v3 setErrorMessage:@"PPLocationNamedEntities: failed to donate locations."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  uint64_t v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = pp_entities_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "Invalidating named entity query cache due to clear operation.", (uint8_t *)&v15, 2u);
  }

  BOOL v8 = [(PPNamedEntityStorage *)self->_storage clearWithError:a3 deletedCount:a4];
  BOOL v9 = v8;
  if (a3 && !v8)
  {
    int v10 = pp_entities_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v14 = *a3;
      int v15 = 138412290;
      id v16 = v14;
      _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "clearWithError error: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v11 = [(PPLocalNamedEntityStore *)self invalidationNotificationOverride];
  uint64_t v12 = (const char *)[v11 UTF8String];
  if (!v12) {
    uint64_t v12 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
  }
  PPPostNotification(v12);

  return v9;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F5B560] userKnowledgeStore];
  if (v5)
  {
    uint64_t v6 = pp_entities_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: exporting locally-generated named entity records", buf, 2u);
    }

    uint64_t v7 = objc_opt_new();
    storage = self->_storage;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __46__PPLocalNamedEntityStore_cloudSyncWithError___block_invoke;
    v28[3] = &unk_1E65DA1D8;
    BOOL v9 = v7;
    uint64_t v29 = v9;
    [(PPNamedEntityStorage *)storage exportRecordsToDKWithShouldContinueBlock:v28];
    int v10 = pp_entities_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: synchronizing _DKKnowledgeStore", buf, 2u);
    }

    id v27 = 0;
    char v11 = [v5 synchronizeWithError:&v27];
    id v12 = v27;
    if (v11)
    {
      double v13 = pp_entities_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: importing remotely-generated named entity records", buf, 2u);
      }

      char v26 = 0;
      do
        [(PPNamedEntityStorage *)self->_storage importRemotelyGeneratedNamedEntityDKEventsWithLimit:[(PPNamedEntityStorage *)self->_storage duetReadBatchSize] isComplete:&v26 shouldContinueBlock:&__block_literal_global_341_6024];
      while (!v26);
      id v14 = pp_entities_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: processing _DKKnowledgeStore remote named entity deletions", buf, 2u);
      }

      [(PPNamedEntityStorage *)self->_storage processNewDKEventDeletions];
    }
    else
    {
      id v18 = [NSString alloc];
      id v19 = [v12 localizedDescription];
      uint64_t v20 = (__CFString *)[v18 initWithFormat:@"Unable to synchronize _DKKnowledgeStore: %@", v19];

      if (a3)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F89FD0];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        id v31 = v20;
        BOOL v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        *a3 = (id)[v21 initWithDomain:v22 code:1 userInfo:v23];
      }
      id v24 = pp_entities_log_handle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v33 = v20;
        _os_log_error_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (a3)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v16 = *MEMORY[0x1E4F89FD0];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v35[0] = @"Unable to connect to _DKKnowledgeStore";
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a3 = (id)[v15 initWithDomain:v16 code:1 userInfo:v17];
    }
    BOOL v9 = pp_entities_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v33 = @"Unable to connect to _DKKnowledgeStore";
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    char v11 = 0;
  }

  return v11;
}

BOOL __46__PPLocalNamedEntityStore_cloudSyncWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  return v1 > -600.0;
}

uint64_t __46__PPLocalNamedEntityStore_cloudSyncWithError___block_invoke_339()
{
  return 1;
}

- (BOOL)removeMapItemsBeforeCutoffDate:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)mapItemForPlaceName:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = pp_entities_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    uint64_t v9 = [v5 length];
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "map item being donated of length %tu", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (BOOL)pruneOrphanedNamedEntityFeedbackCountsWithLimit:(int64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  return [(PPNamedEntityStorage *)self->_storage pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit:a3 rowOffset:a4 deletedCount:a5 isComplete:a6];
}

- (BOOL)deleteAllNamedEntityFeedbackCountsOlderThanDate:(id)a3
{
  return [(PPNamedEntityStorage *)self->_storage deleteAllNamedEntityFeedbackCountRecordsOlderThanDate:a3];
}

- (BOOL)deleteAllNamedEntitiesOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  char v12 = 0;
  unint64_t v11 = 0;
  BOOL v7 = [(PPNamedEntityStorage *)self->_storage deleteAllNamedEntitiesOlderThanDate:a3 atLeastOneNamedEntityRemoved:&v12 deletedCount:&v11 error:a5];
  if (v12)
  {
    id v8 = [(PPLocalNamedEntityStore *)self invalidationNotificationOverride];
    uint64_t v9 = (const char *)[v8 UTF8String];
    if (!v9) {
      uint64_t v9 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    }
    PPPostNotification(v9);
  }
  if (a4) {
    *a4 = v11;
  }
  return v7;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  char v21 = 0;
  unint64_t v20 = 0;
  char v15 = 0;
  if ([(PPNamedEntityStorage *)self->_storage deleteAllNamedEntitiesFromSourcesWithBundleId:v12 groupId:v13 olderThanDate:v14 atLeastOneNamedEntityRemoved:&v21 deletedCount:&v20 error:a7])
  {
    topicStoreForNamedEntityMapping = self->_topicStoreForNamedEntityMapping;
    if (topicStoreForNamedEntityMapping) {
      char v15 = [(PPLocalTopicStore *)topicStoreForNamedEntityMapping deleteAllTopicsFromSourcesWithBundleId:v12 groupId:v13 algorithm:4 olderThan:v14 deletedCount:0 error:a7];
    }
    else {
      char v15 = 1;
    }
  }
  if (v21)
  {
    id v17 = [(PPLocalNamedEntityStore *)self invalidationNotificationOverride];
    id v18 = (const char *)[v17 UTF8String];
    if (!v18) {
      id v18 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    }
    PPPostNotification(v18);
  }
  if (a6) {
    *a6 = v20;
  }

  return v15;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  char v18 = 0;
  unint64_t v17 = 0;
  char v12 = 0;
  if ([(PPNamedEntityStorage *)self->_storage deleteAllNamedEntitiesFromSourcesWithBundleId:v10 documentIds:v11 atLeastOneNamedEntityRemoved:&v18 deletedCount:&v17 error:a6])
  {
    topicStoreForNamedEntityMapping = self->_topicStoreForNamedEntityMapping;
    if (topicStoreForNamedEntityMapping) {
      char v12 = [(PPLocalTopicStore *)topicStoreForNamedEntityMapping deleteAllTopicsFromSourcesWithBundleId:v10 documentIds:v11 algorithm:4 deletedCount:0 error:a6];
    }
    else {
      char v12 = 1;
    }
  }
  if (v18)
  {
    id v14 = [(PPLocalNamedEntityStore *)self invalidationNotificationOverride];
    char v15 = (const char *)[v14 UTF8String];
    if (!v15) {
      char v15 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    }
    PPPostNotification(v15);
  }
  if (a5) {
    *a5 = v17;
  }

  return v12;
}

- (BOOL)flushDonationsWithError:(id *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  locuint64_t k = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PPLocalNamedEntityStore_flushDonationsWithError___block_invoke;
  v8[3] = &unk_1E65D6218;
  v8[4] = &v9;
  [(_PASLock *)lock runWithLockAcquired:v8];
  if (*((unsigned char *)v10 + 24))
  {
    id v5 = [(PPLocalNamedEntityStore *)self meaningfulChangeNotificationOverride];
    uint64_t v6 = (const char *)[v5 UTF8String];
    if (!v6) {
      uint64_t v6 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesDidChangeMeaningfully";
    }
    PPPostNotification(v6);
  }
  _Block_object_dispose(&v9, 8);
  return 1;
}

void __51__PPLocalNamedEntityStore_flushDonationsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pp_entities_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "Flushing donations", v5, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3[8];
  v3[8] = 0;
}

- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8
{
  BOOL v9 = a6;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v71 = v12;
  if (!v12)
  {
    id v62 = v13;
    v63 = [MEMORY[0x1E4F28B00] currentHandler];
    [v63 handleFailureInMethod:a2, self, @"PPLocalNamedEntityStore.m", 886, @"Invalid parameter not satisfying: %@", @"entities" object file lineNumber description];

    id v13 = v62;
  }
  v70 = v13;
  if (!v13)
  {
    id v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2, self, @"PPLocalNamedEntityStore.m", 887, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];
  }
  id v14 = pp_entities_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v71 count];
    uint64_t v16 = [MEMORY[0x1E4F89EA8] describeAlgorithm:a5];
    *(_DWORD *)buf = 134218498;
    uint64_t v95 = v15;
    __int16 v96 = 2112;
    uint64_t v97 = (uint64_t)v70;
    __int16 v98 = 2112;
    uint64_t v99 = (uint64_t)v16;
    _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore received a donation of %tu named entities from source: %@, algorithm: %@", buf, 0x20u);
  }
  if ([v71 count])
  {
    unint64_t v17 = +[PPSettings sharedInstance];
    char v18 = [v70 bundleId];
    char v19 = [v17 bundleIdentifierIsEnabledForDonation:v18];

    if (v19)
    {
      if (v9)
      {
        unint64_t v20 = +[PPSettings sharedInstance];
        char v21 = [v70 bundleId];
        char v22 = [v20 bundleIdentifierIsEnabledForCloudKit:v21];

        if (v22)
        {
          unsigned int v65 = 1;
          goto LABEL_22;
        }
        char v26 = pp_entities_log_handle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v61 = [v70 bundleId];
          *(_DWORD *)buf = 138412290;
          uint64_t v95 = (uint64_t)v61;
          _os_log_debug_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore suppressed named entity cloudSync on donation from disabled bundleId: %@", buf, 0xCu);
        }
      }
      unsigned int v65 = 0;
LABEL_22:
      uint64_t v27 = [v71 count];
      uint64_t v84 = 0;
      v85 = &v84;
      uint64_t v86 = 0x3032000000;
      char v87 = __Block_byref_object_copy__5984;
      id v88 = __Block_byref_object_dispose__5985;
      id v89 = 0;
      locuint64_t k = self->_lock;
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke;
      v81[3] = &unk_1E65D6290;
      id v83 = &v84;
      id v29 = v71;
      id v82 = v29;
      [(_PASLock *)lock runWithLockAcquired:v81];
      uint64_t v30 = +[PPMetricsUtils loggingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke_2;
      block[3] = &unk_1E65D62B8;
      id v66 = v70;
      id v75 = v66;
      v76 = self;
      v78 = &v84;
      unint64_t v79 = a5;
      uint64_t v80 = v27;
      id v77 = v29;
      dispatch_async(v30, block);

      if ([(id)v85[5] count])
      {
        id v31 = pp_entities_log_handle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = [(id)v85[5] count];
          uint64_t v33 = [(id)v85[5] count];
          *(_DWORD *)buf = 134218496;
          uint64_t v95 = v27 - v32;
          __int16 v96 = 2048;
          uint64_t v97 = v27;
          __int16 v98 = 2048;
          uint64_t v99 = v33;
          _os_log_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: PPNamedEntityFilter filtered %tu entities. Prev count %tu, new count %tu.", buf, 0x20u);
        }

        id v34 = (id)v85[5];
        long long v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v34, "count"));
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        obuint64_t j = v34;
        uint64_t v36 = [obj countByEnumeratingWithState:&v90 objects:buf count:16];
        if (v36)
        {
          uint64_t v73 = *(void *)v91;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v91 != v73) {
                objc_enumerationMutation(obj);
              }
              id v38 = *(void **)(*((void *)&v90 + 1) + 8 * i);
              id v39 = (void *)MEMORY[0x1CB79D060]();
              v40 = [v38 item];
              v41 = [v35 objectForKeyedSubscript:v40];

              if (v41)
              {
                id v42 = [v41 scoredNamedEntity];
                [v42 score];
                double v44 = v43;
                unsigned int v45 = [v41 occurrencesInSource];
                [v38 score];
                double v47 = v46;
                int v48 = [v41 occurrencesInSource];

                id v49 = objc_alloc(MEMORY[0x1E4F89F00]);
                BOOL v50 = [v38 item];
                __int16 v51 = (void *)[v49 initWithItem:v50 score:(v47 + v44 * (double)v45) / (double)(v48 + 1)];

                uint64_t v52 = -[PPCoalescedScoredNamedEntity initWithScoredNamedEntity:occurrencesInSource:]([PPCoalescedScoredNamedEntity alloc], "initWithScoredNamedEntity:occurrencesInSource:", v51, (unsigned __int16)([v41 occurrencesInSource] + 1));
              }
              else
              {
                uint64_t v52 = [[PPCoalescedScoredNamedEntity alloc] initWithScoredNamedEntity:v38 occurrencesInSource:1];
              }
              uint64_t v53 = [v38 item];
              [v35 setObject:v52 forKeyedSubscript:v53];
            }
            uint64_t v36 = [obj countByEnumeratingWithState:&v90 objects:buf count:16];
          }
          while (v36);
        }

        uint64_t v54 = (void *)MEMORY[0x1CB79D060]();
        v55 = [v35 allValues];

        if ([v55 count])
        {
          id v56 = pp_entities_log_handle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            uint64_t v57 = [v55 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v95 = v57;
            _os_log_impl(&dword_1CA9A8000, v56, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore: writing %tu coalesced scored entities to the database.", buf, 0xCu);
          }

          if (![(PPNamedEntityStorage *)self->_storage donateNamedEntities:v55 source:v66 algorithm:a5 cloudSync:v65 decayRate:a8 sentimentScore:0.0 error:a7])
          {
            BOOL v25 = 0;
            goto LABEL_43;
          }
          [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_325];
        }
      }
      else
      {
        v55 = pp_default_log_handle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v58 = [v66 bundleId];
          *(_DWORD *)buf = 138412546;
          uint64_t v95 = (uint64_t)v58;
          __int16 v96 = 2048;
          uint64_t v97 = v27;
          _os_log_impl(&dword_1CA9A8000, v55, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: Received a donation that filtered to zero from bundle %@. Prev count %tu", buf, 0x16u);
        }
      }
      BOOL v25 = 1;
LABEL_43:

      _Block_object_dispose(&v84, 8);
      goto LABEL_44;
    }
    BOOL v23 = pp_entities_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v60 = [v70 bundleId];
      *(_DWORD *)buf = 138412290;
      uint64_t v95 = (uint64_t)v60;
      _os_log_debug_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore suppressed named entity donation from disabled bundleId: %@", buf, 0xCu);
    }
  }
  else
  {
    BOOL v23 = pp_entities_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [v70 bundleId];
      *(_DWORD *)buf = 138412290;
      uint64_t v95 = (uint64_t)v24;
      _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore received empty donation from %@", buf, 0xCu);
    }
  }

  BOOL v25 = 1;
LABEL_44:

  return v25;
}

void __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10[2] result];
  id v4 = [v3 filterScoredNamedEntities:*(void *)(a1 + 32)];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v4;
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

void __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke_2(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) bundleId];
  objc_msgSend(v2, "setDonationSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", v3));

  objc_msgSend(v2, "setAlgorithm:", +[PPMetricsUtils mapNamedEntityAlgorithmForPET2:](PPMetricsUtils, "mapNamedEntityAlgorithmForPET2:", *(void *)(a1 + 64)));
  id v4 = [*(id *)(a1 + 32) groupId];
  id v5 = +[PPMetricsUtils filterGroupIdAllowance:v4];
  [v2 setGroupId:v5];

  uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 48) concatenatedTreatmentNames];
  [v2 setActiveTreatments:v6];

  id v7 = [MEMORY[0x1E4F93728] sharedInstance];
  objc_msgSend(v7, "trackDistributionForMessage:value:", v2, (double)(unint64_t)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count"));

  id v8 = objc_opt_new();
  uint64_t v9 = [*(id *)(a1 + 32) language];
  [v8 setDetectedLanguage:v9];

  id v10 = [MEMORY[0x1E4F89FC8] currentLocaleLanguageCode];
  [v8 setSystemLanguage:v10];

  uint64_t v11 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  objc_msgSend(v8, "setLanguageCount:", objc_msgSend(v11, "count"));

  id v12 = [*(id *)(*(void *)(a1 + 40) + 48) concatenatedTreatmentNames];
  [v8 setActiveTreatments:v12];

  id v13 = [MEMORY[0x1E4F93728] sharedInstance];
  [v13 trackScalarForMessage:v8];

  id v14 = objc_opt_new();
  uint64_t v15 = [*(id *)(*(void *)(a1 + 40) + 48) concatenatedTreatmentNames];
  [v14 setActiveTreatments:v15];

  uint64_t v16 = *(void *)(a1 + 72);
  unint64_t v17 = v16 - [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  char v18 = [MEMORY[0x1E4F93728] sharedInstance];
  [v18 trackDistributionForMessage:v14 value:(double)v17];

  if (*(void *)(a1 + 64) != 16) {
    return;
  }
  uint64_t v19 = *(void *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  if (!v19) {
    goto LABEL_27;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  char v22 = +[PPConfiguration sharedInstance];
  BOOL v23 = [v22 differentiallyPrivateEntityLogLevels];
  id v24 = [v23 objectForKeyedSubscript:@"Extraction.low"];
  BOOL v25 = (void *)[v21 initWithArray:v24];

  id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v27 = +[PPConfiguration sharedInstance];
  uint64_t v28 = [v27 differentiallyPrivateEntityLogLevels];
  id v29 = [v28 objectForKeyedSubscript:@"Extraction.medium"];
  uint64_t v53 = (void *)[v26 initWithArray:v29];

  id v30 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v31 = +[PPConfiguration sharedInstance];
  uint64_t v32 = [v31 differentiallyPrivateEntityLogLevels];
  uint64_t v33 = [v32 objectForKeyedSubscript:@"Extraction.high"];
  __int16 v51 = (void *)[v30 initWithArray:v33];

  uint64_t v54 = objc_opt_new();
  uint64_t v52 = objc_opt_new();
  id v49 = v20;
  BOOL v50 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v34 = v20;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (!v35) {
    goto LABEL_24;
  }
  uint64_t v36 = v35;
  uint64_t v37 = *(void *)v57;
  do
  {
    for (uint64_t i = 0; i != v36; ++i)
    {
      if (*(void *)v57 != v37) {
        objc_enumerationMutation(v34);
      }
      id v39 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      v40 = (void *)MEMORY[0x1E4F89E90];
      v41 = objc_msgSend(v39, "item", v49);
      id v42 = objc_msgSend(v40, "describeCategory:", objc_msgSend(v41, "category"));

      double v43 = [v39 item];
      double v44 = [v43 dynamicCategory];

      if ([v25 containsObject:v42])
      {
LABEL_11:
        unsigned int v45 = [v39 item];
        double v46 = [v45 name];
        double v47 = v54;
LABEL_21:
        [v47 addObject:v46];

        goto LABEL_22;
      }
      if (v44)
      {
        if ([v25 containsObject:v44]) {
          goto LABEL_11;
        }
        if (([v53 containsObject:v42] & 1) != 0
          || [v53 containsObject:v44])
        {
LABEL_17:
          unsigned int v45 = [v39 item];
          double v46 = [v45 name];
          double v47 = v52;
          goto LABEL_21;
        }
        if (([v51 containsObject:v42] & 1) != 0
          || [v51 containsObject:v44])
        {
          goto LABEL_20;
        }
      }
      else
      {
        if ([v53 containsObject:v42]) {
          goto LABEL_17;
        }
        if ([v51 containsObject:v42])
        {
LABEL_20:
          unsigned int v45 = [v39 item];
          double v46 = [v45 name];
          double v47 = v50;
          goto LABEL_21;
        }
      }
LABEL_22:
    }
    uint64_t v36 = [v34 countByEnumeratingWithState:&v56 objects:v60 count:16];
  }
  while (v36);
LABEL_24:

  -[PPLocalNamedEntityStore _logDifferentiallyPrivateExtractionsWithDpCategory:extractions:](@"Extraction.low", v54);
  -[PPLocalNamedEntityStore _logDifferentiallyPrivateExtractionsWithDpCategory:extractions:](@"Extraction.medium", v52);
  -[PPLocalNamedEntityStore _logDifferentiallyPrivateExtractionsWithDpCategory:extractions:](@"Extraction.high", v50);
  int v48 = pp_entities_log_handle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v48, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore: completed logging of entities to differential privacy.", buf, 2u);
  }

  id v20 = v49;
LABEL_27:
}

void __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke_323(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 8) = 1;
}

- (void)_logDifferentiallyPrivateExtractionsWithDpCategory:(void *)a1 extractions:(void *)a2
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ([v4 count])
  {
    id v5 = [NSString alloc];
    uint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v7 = [v6 localeIdentifier];
    id v8 = [v5 initWithFormat:@"%@.%@.%@", @"com.apple.PersonalizationPortrait.NamedEntity", v3, v7];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:v8];
    [v9 record:v4];
    id v10 = pp_entities_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v12 = [v4 count];
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: logged %tu items of type %@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = pp_entities_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = (uint64_t)v3;
      _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: not logging any extractions matching %@", buf, 0xCu);
    }
  }
}

- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 clientProcessName:(id)a5
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v72 = a5;
  if ([v6 isForRecordMonitoring])
  {
    id v7 = +[PPConfiguration sharedInstance];
    objc_msgSend(v6, "setLimit:", objc_msgSend(v7, "namedEntityLoadAndMonitorInitialLoadLimit"));

    id v8 = pp_entities_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v72;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = [v6 limit];
      _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: overwrote query from %@ with limit %tu", buf, 0x16u);
    }
  }
  uint64_t v9 = pp_entities_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 limit];
    uint64_t v11 = [v6 fromDate];
    uint64_t v12 = [v11 description];
    __int16 v13 = [v6 toDate];
    id v14 = [v13 description];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    id v113 = v14;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "rankedNamedEntitiesWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);
  }
  unint64_t v73 = [v6 limit];
  uint64_t v15 = +[PPConfiguration sharedInstance];
  BOOL v16 = v73 > (int)[v15 maxNumberNamedEntities];

  if (v16)
  {
    unint64_t v17 = +[PPConfiguration sharedInstance];
    int v18 = [v17 maxNumberNamedEntities];

    unint64_t v73 = v18;
  }
  if ([v6 locationConsumer] == 3)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v113 = __Block_byref_object_copy__5984;
    id v114 = __Block_byref_object_dispose__5985;
    id v115 = 0;
    locuint64_t k = self->_lock;
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke;
    v108[3] = &unk_1E65D6218;
    v108[4] = buf;
    [(_PASLock *)lock runWithLockAcquired:v108];
    if ([*(id *)(*(void *)&buf[8] + 40) count] > v73)
    {
      uint64_t v20 = [*(id *)(*(void *)&buf[8] + 40) subarrayWithRange:0];
      id v21 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v20;
    }
    id v22 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v104 = 0;
    uint64_t v105 = &v104;
    uint64_t v106 = 0x2020000000;
    uint64_t v107 = 0;
    uint64_t v100 = 0;
    unint64_t v101 = &v100;
    uint64_t v102 = 0x2020000000;
    uint64_t v103 = 0;
    BOOL v23 = -[PPEvictingMinPriorityQueue initWithCapacity:]([PPEvictingMinPriorityQueue alloc], "initWithCapacity:", [v6 limit]);
    id v24 = [v6 scoringDate];
    BOOL v25 = v24;
    if (v24) {
      id v26 = v24;
    }
    else {
      id v26 = (id)objc_opt_new();
    }
    uint64_t v27 = v26;

    id v71 = +[PPStreamingNamedEntityScorer scoreInterpreterAggregationBytecode];
    v69 = +[PPStreamingNamedEntityScorer scoreInterpreterFinalBytecode];
    unint64_t v28 = 0;
    id v29 = self;
    if (v71 && v69)
    {
      unint64_t v30 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:v71];
      unint64_t v28 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:v69] | v30;
      id v29 = self;
    }
    id v31 = [(PPNamedEntityStorage *)v29->_storage sourceStats:v28 withExcludedAlgorithms:0];
    v98[0] = 0;
    v98[1] = v98;
    v98[2] = 0x3032000000;
    v98[3] = __Block_byref_object_copy__5984;
    v98[4] = __Block_byref_object_dispose__5985;
    id v99 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_2;
    aBlock[3] = &unk_1E65D6240;
    void aBlock[4] = v29;
    id v65 = v27;
    id v92 = v65;
    id v66 = v31;
    id v93 = v66;
    uint64_t v95 = v98;
    uint64_t v67 = v23;
    id v94 = v67;
    __int16 v96 = &v100;
    uint64_t v97 = &v104;
    uint64_t v32 = _Block_copy(aBlock);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v113 = __Block_byref_object_copy__5984;
    id v114 = __Block_byref_object_dispose__5985;
    id v115 = 0;
    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x3032000000;
    v89[3] = __Block_byref_object_copy__5984;
    v89[4] = __Block_byref_object_dispose__5985;
    id v90 = 0;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x3032000000;
    v87[3] = __Block_byref_object_copy__5984;
    v87[4] = __Block_byref_object_dispose__5985;
    id v88 = 0;
    uint64_t v33 = pp_entities_signpost_handle();
    os_signpost_id_t spid = os_signpost_id_generate(v33);

    id v34 = pp_entities_signpost_handle();
    uint64_t v35 = v34;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)v110 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v35, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPLocalNamedEntityStore.rankedNamedEntitiesWithQuery.aggregation", "", v110, 2u);
    }

    uint64_t v36 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPLocalNamedEntityStore-scoring" qosClass:qos_class_self()];
    dispatch_semaphore_t v37 = dispatch_semaphore_create(64);
    id v38 = (void *)[v6 copy];
    [v38 setOrderByName:1];
    [v38 setRemoveNearDuplicates:1];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_300;
    v79[3] = &unk_1E65D6268;
    uint64_t v84 = buf;
    v85 = v89;
    uint64_t v86 = v87;
    id v39 = v37;
    uint64_t v80 = v39;
    v40 = v36;
    BOOL v81 = v40;
    id v41 = v32;
    id v82 = self;
    id v83 = v41;
    id v42 = v79;
    double v43 = (void *)[v38 copy];
    [v43 setLimit:-1];
    id v109 = 0;
    BOOL v44 = [(PPLocalNamedEntityStore *)self iterNamedEntityRecordsWithQuery:v43 error:&v109 block:v42];

    id v45 = v109;
    if (!v44)
    {
      double v46 = pp_entities_log_handle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v110 = 138412290;
        id v111 = v45;
        _os_log_error_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_ERROR, "_unlimitedNamedEntityRecordsWithQuery: nil result from iterNamedEntityRecordsWithQuery: %@", v110, 0xCu);
      }

      if (a4) {
        *a4 = v45;
      }
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_303;
    block[3] = &unk_1E65DA068;
    id v77 = v89;
    id v47 = v41;
    id v76 = v47;
    v78 = v87;
    dispatch_sync(v40, block);
    int v48 = pp_entities_signpost_handle();
    id v49 = v48;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)v110 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v49, OS_SIGNPOST_INTERVAL_END, spid, "PPLocalNamedEntityStore.rankedNamedEntitiesWithQuery.aggregation", "", v110, 2u);
    }

    _Block_object_dispose(v87, 8);
    _Block_object_dispose(v89, 8);

    _Block_object_dispose(buf, 8);
    uint64_t v50 = v105[3];
    id v51 = v6;
    id v52 = v72;
    uint64_t v53 = +[PPMetricsUtils loggingQueue];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __86__PPLocalNamedEntityStore__petLoggingForQuery_resultCount_clientProcessName_hasError___block_invoke;
    id v113 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E65DC5D8;
    uint64_t v54 = (void (*)(uint64_t))v52;
    id v114 = v54;
    uint64_t v117 = v50;
    id v55 = v51;
    BOOL v118 = !v44;
    id v115 = v55;
    v116 = self;
    dispatch_async(v53, buf);

    if (v44)
    {
      uint64_t v56 = v101[3];
      uint64_t v57 = v105[3];
      long long v58 = pp_entities_log_handle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v59 = v101[3];
        v60 = +[PPConfiguration sharedInstance];
        [v60 scoreThresholdForNamedEntity];
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(double *)&buf[14] = v61;
        *(_WORD *)&buf[22] = 2048;
        id v113 = (uint64_t (*)(uint64_t, uint64_t))(v57 + v56);
        _os_log_impl(&dword_1CA9A8000, v58, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: filtered %tu items below threshold of %f out of %tu total.", buf, 0x20u);
      }
      id v22 = [(PPEvictingMinPriorityQueue *)v67 extractSortedMutableArray];
      if ([v22 count] > v73)
      {
        uint64_t v62 = [v22 subarrayWithRange:0];

        id v22 = (id)v62;
      }
    }
    else
    {
      v63 = pp_default_log_handle();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = 0;
        _os_log_error_impl(&dword_1CA9A8000, v63, OS_LOG_TYPE_ERROR, "Error encountered while scoring named entities: %@", buf, 0xCu);
      }

      id v22 = 0;
      if (a4) {
        *a4 = 0;
      }
    }

    _Block_object_dispose(v98, 8);
    _Block_object_dispose(&v100, 8);
    _Block_object_dispose(&v104, 8);
  }

  return v22;
}

uint64_t __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 24) result];
  return MEMORY[0x1F41817F8]();
}

void __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 count])
  {
    double v6 = *MEMORY[0x1E4F8A128];
    *(float *)&double v6 = *MEMORY[0x1E4F8A128];
    id v7 = [*(id *)(a1 + 32) scoredEntityFromRecords:v10 scoringDate:*(void *)(a1 + 40) perRecordDecayRate:*(void *)(a1 + 48) decayRate:v5 sourceStats:*(void *)(*(void *)(a1 + 64) + 8) + 40 decayedFeedbackCounts:0 streamingScorer:v6 mlModel:0.0];
    id v8 = *(id *)(a1 + 56);
    objc_sync_enter(v8);
    if (v7)
    {
      [*(id *)(a1 + 56) addObject:v7];
      uint64_t v9 = a1 + 80;
    }
    else
    {
      uint64_t v9 = a1 + 72;
    }
    ++*(void *)(*(void *)(*(void *)v9 + 8) + 24);
    objc_sync_exit(v8);
  }
}

void __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_300(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v5 = [v3 entity];
  double v6 = [v5 clusterIdentifier];
  LOBYTE(v4) = [v4 isEqualToString:v6];

  id v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if ((v4 & 1) == 0)
  {
    id v8 = v7;
    id v9 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (![v8 count]) {
      goto LABEL_9;
    }
    id v10 = +[PPConfiguration sharedInstance];
    if ([v10 use2StageScoreInterpreterForNEScoring])
    {
    }
    else
    {
      uint64_t v11 = +[PPConfiguration sharedInstance];
      int v12 = [v11 namedEntityScoringUsesHybrid];

      if (!v12)
      {
        if ([MEMORY[0x1E4F93B18] waitForSemaphore:*(void *)(a1 + 32) timeoutSeconds:0.0])
        {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_9:
          uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);
          uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
          unint64_t v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = v15;

          int v18 = [v3 entity];
          uint64_t v19 = [v18 clusterIdentifier];
          uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
          id v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;

          id v22 = [v3 entity];
          BOOL v23 = [v22 clusterIdentifier];

          if (v23)
          {
            if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
            {
LABEL_16:

              goto LABEL_17;
            }
            uint64_t v24 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 56), "decayedFeedbackCountsForClusterIdentifier:");
            uint64_t v25 = *(void *)(*(void *)(a1 + 80) + 8);
            id v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = v24;
          }
          else
          {
            uint64_t v27 = pp_default_log_handle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_FAULT, "Named entity record unexpectedly had nil cluster identifier while aggregating for scoring.", buf, 2u);
            }

            uint64_t v28 = *(void *)(*(void *)(a1 + 80) + 8);
            id v29 = *(void **)(v28 + 40);
            *(void *)(v28 + 40) = 0;

            id v26 = objc_opt_new();
            unint64_t v30 = [v26 UUIDString];
            uint64_t v31 = [v30 lowercaseString];
            uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
            uint64_t v33 = *(void **)(v32 + 40);
            *(void *)(v32 + 40) = v31;
          }
          goto LABEL_16;
        }
        id v34 = *(NSObject **)(a1 + 40);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_3;
        v36[3] = &unk_1E65DA018;
        id v40 = *(id *)(a1 + 56);
        id v37 = v8;
        id v38 = v9;
        id v39 = *(id *)(a1 + 32);
        dispatch_async(v34, v36);

        id v14 = v40;
LABEL_8:

        goto LABEL_9;
      }
    }
    [MEMORY[0x1E4F93B18] waitForSemaphore:*(void *)(a1 + 32)];
    __int16 v13 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_2_301;
    block[3] = &unk_1E65DA018;
    id v45 = *(id *)(a1 + 56);
    id v42 = v8;
    id v43 = v9;
    id v44 = *(id *)(a1 + 32);
    dispatch_async(v13, block);

    id v14 = v45;
    goto LABEL_8;
  }
  [v7 addObject:v3];
LABEL_17:
}

uint64_t __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_303(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

void __86__PPLocalNamedEntityStore__petLoggingForQuery_resultCount_clientProcessName_hasError___block_invoke(uint64_t a1)
{
  id v9 = (id)objc_opt_new();
  [v9 setBundleId:*(void *)(a1 + 32)];
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    unint64_t v3 = (unint64_t)log10((double)v2);
  }
  else {
    unint64_t v3 = 0;
  }
  [v9 setResultSizeLog10:v3];
  id v4 = [*(id *)(a1 + 40) scoringDate];
  [v9 setTimeSpec:v4 != 0];

  objc_msgSend(v9, "setLimitHit:", *(void *)(a1 + 56) > (unint64_t)objc_msgSend(*(id *)(a1 + 40), "limit"));
  id v5 = [*(id *)(a1 + 40) fromDate];
  [v9 setTimeLimited:v5 != 0];

  double v6 = [*(id *)(a1 + 40) excludingSourceBundleIds];
  objc_msgSend(v9, "setExclusionSpec:", objc_msgSend(v6, "count") != 0);

  [v9 setError:*(unsigned __int8 *)(a1 + 64)];
  id v7 = [*(id *)(*(void *)(a1 + 48) + 48) concatenatedTreatmentNames];
  [v9 setActiveTreatments:v7];

  id v8 = [MEMORY[0x1E4F93728] sharedInstance];
  [v8 trackScalarForMessage:v9];
}

intptr_t __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_2_301(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  unint64_t v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

intptr_t __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  unint64_t v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4
{
  return [(PPLocalNamedEntityStore *)self rankedNamedEntitiesWithQuery:a3 error:a4 clientProcessName:0];
}

- (id)scoredEntityFromRecords:(id)a3 scoringDate:(id)a4 perRecordDecayRate:(float)a5 decayRate:(float)a6 sourceStats:(id)a7 decayedFeedbackCounts:(id)a8 streamingScorer:(id *)a9 mlModel:(id)a10
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  if (![v16 count])
  {
    unint64_t v73 = 0;
    goto LABEL_55;
  }
  id v20 = v16;
  id v103 = v17;
  id v21 = v18;
  id v105 = v19;
  unint64_t v101 = v20;
  if (!self)
  {
    unint64_t v73 = 0;
    goto LABEL_54;
  }
  id v100 = v17;
  context = (void *)MEMORY[0x1CB79D060]();
  if ([v20 count])
  {
    if (v21) {
      goto LABEL_9;
    }
  }
  else
  {
    id v92 = [MEMORY[0x1E4F28B00] currentHandler];
    [v92 handleFailureInMethod:sel__defaultScoredEntityFromRecords_scoringDate_perRecordDecayRate_decayRate_sourceStats_decayedFeedbackCounts_streamingScorer_, self, @"PPLocalNamedEntityStore.m", 482, @"Invalid parameter not satisfying: %@", @"records.count > 0" object file lineNumber description];

    if (v21) {
      goto LABEL_9;
    }
  }
  id v22 = +[PPStreamingNamedEntityScorer scoreInterpreterAggregationBytecode];
  uint64_t v23 = +[PPStreamingNamedEntityScorer scoreInterpreterFinalBytecode];
  uint64_t v24 = (void *)v23;
  unint64_t v25 = 0;
  if (v22 && v23)
  {
    unint64_t v26 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:v22];
    unint64_t v25 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:v24] | v26;
  }
  id v21 = [(PPNamedEntityStorage *)self->_storage sourceStats:v25 withExcludedAlgorithms:0];

LABEL_9:
  id v93 = self;
  id v102 = v21;
  id v98 = v19;
  id v99 = v18;
  id v95 = v16;
  uint64_t v27 = [v20 objectAtIndexedSubscript:0];
  uint64_t v104 = [v27 entity];

  id v28 = v20;
  id v29 = objc_opt_new();
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v30 = v28;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v111 objects:v119 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v112 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = NSNumber;
        uint64_t v36 = [*(id *)(*((void *)&v111 + 1) + 8 * i) entity];
        id v37 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "category"));
        [v29 addObject:v37];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v111 objects:v119 count:16];
    }
    while (v32);
  }

  id v38 = [v29 allObjects];
  uint64_t v106 = MEMORY[0x1E4F143A8];
  uint64_t v107 = 3221225472;
  uint64_t v108 = __62__PPLocalNamedEntityStore__dominantEntityCategoryFromRecords___block_invoke;
  id v109 = &unk_1E65D6188;
  id v110 = v29;
  id v39 = v29;
  id v40 = [v38 sortedArrayUsingComparator:&v106];
  id v41 = [v40 lastObject];
  id v42 = (void *)[v41 unsignedIntegerValue];

  id v43 = v30;
  id v44 = objc_opt_new();
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v45 = v43;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v111 objects:v119 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v112;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v112 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = [*(id *)(*((void *)&v111 + 1) + 8 * j) entity];
        id v51 = [v50 name];
        [v44 addObject:v51];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v111 objects:v119 count:16];
    }
    while (v47);
  }

  id v52 = [v44 allObjects];
  uint64_t v106 = MEMORY[0x1E4F143A8];
  uint64_t v107 = 3221225472;
  uint64_t v108 = __58__PPLocalNamedEntityStore__dominantEntityNameFromRecords___block_invoke;
  id v109 = &unk_1E65D61B0;
  id v110 = v44;
  id v53 = v44;
  uint64_t v54 = [v52 sortedArrayUsingComparator:&v106];
  id v55 = [v54 lastObject];

  uint64_t v106 = MEMORY[0x1E4F143A8];
  uint64_t v107 = 3221225472;
  uint64_t v108 = __150__PPLocalNamedEntityStore__defaultScoredEntityFromRecords_scoringDate_perRecordDecayRate_decayRate_sourceStats_decayedFeedbackCounts_streamingScorer___block_invoke;
  id v109 = &__block_descriptor_40_e46_B24__0__PPNamedEntityRecord_8__NSDictionary_16l;
  id v110 = v42;
  uint64_t v56 = [MEMORY[0x1E4F28F60] predicateWithBlock:&v106];
  uint64_t v57 = [v45 filteredArrayUsingPredicate:v56];

  id v94 = v57;
  long long v58 = [v57 sortedArrayUsingComparator:&__block_literal_global_284];
  uint64_t v59 = [v58 lastObject];

  id v60 = objc_alloc(MEMORY[0x1E4F89E90]);
  float v61 = [v104 bestLanguage];
  uint64_t v96 = [v60 initWithName:v55 category:v42 dynamicCategory:0 language:v61 mostRelevantRecord:v59];

  id v62 = *a9;
  if (!*a9)
  {
    v63 = [[PPStreamingNamedEntityScorer alloc] initWithScoringDate:v103 perRecordDecayRate:v102 sourceStats:a5];
    id v64 = *a9;
    *a9 = v63;

    id v62 = *a9;
  }
  [v62 startNewClusterWithDecayedFeedbackCounts:v105 mostRelevantRecord:v59 dominantEntityName:v55];
  id v65 = +[PPConfiguration sharedInstance];
  int v66 = [v65 namedEntityScoringUsesHybrid];

  if (v66)
  {
    uint64_t v67 = [(NSCache *)v93->_modelCache objectForKey:@"scoring_model"];
    id v16 = v95;
    if (!v67)
    {
      trialWrapper = v93->_trialWrapper;
      *(void *)&long long v111 = 0;
      uint64_t v67 = [(PPTrialWrapper *)trialWrapper mlModelForModelName:@"PPModel_NE.mlmodelc" namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES" error:&v111];
      id v69 = (id)v111;
      if (!v67)
      {
        id v89 = v69;
        id v90 = pp_default_log_handle();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t v119 = 138412290;
          v120 = v89;
          _os_log_fault_impl(&dword_1CA9A8000, v90, OS_LOG_TYPE_FAULT, "PPLocalNamedEntityStore: unable to load scoring model with error: %@", v119, 0xCu);
        }

        long long v91 = pp_entities_log_handle();
        id v18 = v99;
        id v17 = v100;
        id v19 = v98;
        id v21 = v102;
        id v72 = v94;
        uint64_t v86 = (void *)v96;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v119 = 0;
          _os_log_error_impl(&dword_1CA9A8000, v91, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: unable to locate ML model.", v119, 2u);
        }

        unint64_t v73 = 0;
        goto LABEL_53;
      }

      [(NSCache *)v93->_modelCache setObject:v67 forKey:@"scoring_model"];
    }
    [(PPLocalNamedEntityStore *)v93 finalScoreFromRecordsUsingHybrid:v45 streamingScorer:*a9 mlModel:v67];
    double v71 = v70;

    id v72 = v57;
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v74 = v45;
    uint64_t v75 = [v74 countByEnumeratingWithState:&v111 objects:v119 count:16];
    id v72 = v57;
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v112;
      do
      {
        for (uint64_t k = 0; k != v76; ++k)
        {
          if (*(void *)v112 != v77) {
            objc_enumerationMutation(v74);
          }
          [*a9 addRecord:*(void *)(*((void *)&v111 + 1) + 8 * k)];
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v111 objects:v119 count:16];
      }
      while (v76);
    }

    [*a9 getFinalScore];
    double v71 = v79;
    id v16 = v95;
  }
  uint64_t v80 = +[PPConfiguration sharedInstance];
  [v80 scoreThresholdForNamedEntity];
  float v82 = v81;

  if (v71 <= 0.0) {
    int v83 = 1;
  }
  else {
    int v83 = v66;
  }
  double v84 = v82;
  BOOL v85 = v83 == 1 && v71 < v84;
  id v19 = v98;
  id v18 = v99;
  uint64_t v86 = (void *)v96;
  if (v85)
  {
    id v17 = v100;
    if (v66)
    {
      char v87 = pp_entities_log_handle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        double v116 = v71;
        __int16 v117 = 2048;
        double v118 = v84;
        _os_log_debug_impl(&dword_1CA9A8000, v87, OS_LOG_TYPE_DEBUG, "Portrait Scoring, filtering out score of %f below threshold of %f", buf, 0x16u);
      }
    }
    unint64_t v73 = 0;
  }
  else
  {
    unint64_t v73 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v96 score:v71];
    id v17 = v100;
  }
  id v21 = v102;
LABEL_53:

LABEL_54:

LABEL_55:
  return v73;
}

BOOL __150__PPLocalNamedEntityStore__defaultScoredEntityFromRecords_scoringDate_perRecordDecayRate_decayRate_sourceStats_decayedFeedbackCounts_streamingScorer___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 entity];
  BOOL v4 = [v3 category] == *(void *)(a1 + 32);

  return v4;
}

uint64_t __150__PPLocalNamedEntityStore__defaultScoredEntityFromRecords_scoringDate_perRecordDecayRate_decayRate_sourceStats_decayedFeedbackCounts_streamingScorer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 source];
  double v6 = [v5 date];
  id v7 = [v4 source];

  id v8 = [v7 date];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __58__PPLocalNamedEntityStore__dominantEntityNameFromRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 localizedCapitalizedString];
  int v8 = [v6 isEqualToString:v7];

  uint64_t v9 = [v5 localizedCapitalizedString];
  int v10 = [v5 isEqualToString:v9];

  unint64_t v11 = [*(id *)(a1 + 32) countForObject:v6];
  unint64_t v12 = [*(id *)(a1 + 32) countForObject:v5];

  if (v8 && !v10) {
    return 1;
  }
  if (v11 < v12) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = 1;
  }
  if (v11 == v12) {
    uint64_t v14 = 0;
  }
  if ((v10 ^ 1 | v8) == 1) {
    return v14;
  }
  else {
    return -1;
  }
}

uint64_t __62__PPLocalNamedEntityStore__dominantEntityCategoryFromRecords___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  uint64_t v9 = -1;
  if (v7 >= v8) {
    uint64_t v9 = 1;
  }
  if (v7 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (double)finalScoreFromRecordsUsingHybrid:(id)a3 streamingScorer:(id)a4 mlModel:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        [v8 addRecord:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v11);
  }
  id v25 = 0;
  [v8 getFinalScoreWithAggregationResultOut:0 finalResultOut:&v25];
  if (v25)
  {
    id v24 = 0;
    uint64_t v14 = [v9 predictionFromFeatures:v25 error:&v24];
    uint64_t v15 = v24;
    if (v14)
    {
      id v16 = [v14 featureValueForName:@"computed_score"];
      id v17 = [v16 multiArrayValue];

      if (v17)
      {
        id v18 = [v16 multiArrayValue];
        id v19 = [v18 objectAtIndexedSubscript:0];
        [v19 doubleValue];
        double v21 = v20;
      }
      else
      {
        [v16 doubleValue];
        double v21 = v22;
      }
    }
    else
    {
      id v16 = pp_default_log_handle();
      double v21 = -1.0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v15;
        _os_log_fault_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_FAULT, "PPLocalNamedEntityStore: unable to retrieve prediction %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v15 = pp_default_log_handle();
    double v21 = 0.0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_FAULT, "PPLocalLocationStore: the score interpreter provided a nil final output.", buf, 2u);
    }
  }

  return v21;
}

- (BOOL)iterRankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void, uint8_t *))a5;
  uint64_t v10 = pp_entities_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 limit];
    uint64_t v12 = [v8 fromDate];
    __int16 v13 = [v12 description];
    uint64_t v14 = [v8 toDate];
    uint64_t v15 = [v14 description];
    *(_DWORD *)buf = 134218498;
    uint64_t v33 = v11;
    __int16 v34 = 2112;
    uint64_t v35 = v13;
    __int16 v36 = 2112;
    id v37 = v15;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "iterRankedNamedEntitiesWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);
  }
  id v30 = 0;
  id v16 = [(PPLocalNamedEntityStore *)self rankedNamedEntitiesWithQuery:v8 error:&v30];
  id v17 = v30;
  if (v17)
  {
    id v18 = pp_entities_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = (uint64_t)v17;
      _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "iterRankedNamedEntitiesWithQuery: error from rankedNamedEntitiesWithQuery: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v17;
    }
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
LABEL_10:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v26 + 1) + 8 * v23);
        buf[0] = 0;
        v9[2](v9, v24, buf);
        if (buf[0]) {
          break;
        }
        if (v21 == ++v23)
        {
          uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v21) {
            goto LABEL_10;
          }
          break;
        }
      }
    }
  }
  return v17 == 0;
}

- (id)namedEntityRecordsWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = pp_entities_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 limit];
    id v9 = [v6 fromDate];
    uint64_t v10 = [v9 description];
    uint64_t v11 = [v6 toDate];
    uint64_t v12 = [v11 description];
    *(_DWORD *)buf = 134218498;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "namedEntityRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);
  }
  __int16 v13 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__PPLocalNamedEntityStore_namedEntityRecordsWithQuery_error___block_invoke;
  v18[3] = &unk_1E65DBE80;
  id v19 = v13;
  id v14 = v13;
  if ([(PPLocalNamedEntityStore *)self iterNamedEntityRecordsWithQuery:v6 error:a4 block:v18])
  {
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __61__PPLocalNamedEntityStore_namedEntityRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 entity];
  uint64_t v5 = [v4 category];

  if ((v5 | 4) == 0xC)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v8 = [v3 entity];
    id v9 = [v8 name];
    uint64_t v10 = [v9 lowercaseString];

    uint64_t v11 = [v6 containsObject:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v8 = v5;
  if (*(unsigned char *)(a1 + 80) && (v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(), id v5 = v8, v6))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v5];
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] == 64) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  return MEMORY[0x1F41817F8]();
}

- (PPLocalNamedEntityStore)init
{
  id v3 = +[PPSQLDatabase sharedInstance];
  if (v3)
  {
    id v4 = [[PPNamedEntityStorage alloc] initWithDatabase:v3];
    if (v4)
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F93B68]) initWithBlock:&__block_literal_global_6092];
      int v6 = +[PPLocalTopicStore defaultStore];
      id v7 = +[PPTrialWrapper sharedInstance];
      self = [(PPLocalNamedEntityStore *)self initWithStorage:v4 topicStoreForNamedEntityMapping:v6 lazyContactStoreForMapsFeedback:v5 trialWrapper:v7];

      id v8 = self;
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __31__PPLocalNamedEntityStore_init__block_invoke()
{
  return +[PPLocalContactStore defaultStore];
}

- (PPLocalNamedEntityStore)initWithStorage:(id)a3 topicStoreForNamedEntityMapping:(id)a4 lazyContactStoreForMapsFeedback:(id)a5 trialWrapper:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PPLocalNamedEntityStore.m", 181, @"Invalid parameter not satisfying: %@", @"storage" object file lineNumber description];
  }
  v37.receiver = self;
  v37.super_class = (Class)PPLocalNamedEntityStore;
  id v16 = [(PPNamedEntityStore *)&v37 _initFromSubclass];
  if (v16)
  {
    id v30 = v13;
    uint64_t v17 = objc_opt_new();
    id v18 = objc_alloc(MEMORY[0x1E4F93B68]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    void v35[2] = __120__PPLocalNamedEntityStore_initWithStorage_topicStoreForNamedEntityMapping_lazyContactStoreForMapsFeedback_trialWrapper___block_invoke;
    v35[3] = &unk_1E65D60C8;
    id v36 = v15;
    uint64_t v19 = [v18 initWithBlock:v35];
    uint64_t v20 = *(void **)(v17 + 16);
    *(void *)(v17 + 16) = v19;

    *(unsigned char *)(v17 + 8) = 0;
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v17];

    locuint64_t k = v16->_lock;
    v16->_locuint64_t k = (_PASLock *)v21;

    objc_storeStrong((id *)&v16->_storage, a3);
    objc_storeStrong((id *)&v16->_topicStoreForNamedEntityMapping, a4);
    objc_storeStrong((id *)&v16->_lazyContactStoreForMapsFeedback, a5);
    objc_storeStrong((id *)&v16->_trialWrapper, a6);
    id location = 0;
    objc_initWeak(&location, v16);
    trialWrapper = v16->_trialWrapper;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __120__PPLocalNamedEntityStore_initWithStorage_topicStoreForNamedEntityMapping_lazyContactStoreForMapsFeedback_trialWrapper___block_invoke_254;
    v32[3] = &unk_1E65DC540;
    objc_copyWeak(&v33, &location);
    id v24 = [(PPTrialWrapper *)trialWrapper addUpdateHandlerForNamespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES" block:v32];
    uint64_t v25 = objc_opt_new();
    modelCache = v16->_modelCache;
    v16->_modelCache = (NSCache *)v25;

    uint64_t v27 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.PersonalizationPortrait.mapsPrefetchQueue" qosClass:17];
    mapsPrefetchQueue = v16->_mapsPrefetchQueue;
    v16->_mapsPrefetchQueue = (OS_dispatch_queue *)v27;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    id v13 = v30;
  }

  return v16;
}

PPNamedEntityFilter *__120__PPLocalNamedEntityStore_initWithStorage_topicStoreForNamedEntityMapping_lazyContactStoreForMapsFeedback_trialWrapper___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v1 = *(void **)(a1 + 32);
  id v7 = 0;
  unint64_t v2 = [v1 mlModelForModelName:@"PPModel_NE_Filtering.mlmodelc" namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES" error:&v7];
  id v3 = v7;
  if (!v2)
  {
    id v4 = pp_entities_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: unable to fetch filtering model from Trial. %@", buf, 0xCu);
    }
  }
  id v5 = [[PPNamedEntityFilter alloc] initWithModel:v2];

  return v5;
}

void __120__PPLocalNamedEntityStore_initWithStorage_topicStoreForNamedEntityMapping_lazyContactStoreForMapsFeedback_trialWrapper___block_invoke_254(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[5] removeAllObjects];
    id v3 = pp_entities_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "Invalidating all caches as a result of named entity namespace update.", (uint8_t *)v4, 2u);
    }
  }
}

+ (float)resolvedPerRecordDecayRateForFeatureProvider:(id)a3 perRecordDecayRate:(float)a4
{
  id v5 = a3;
  int v6 = v5;
  if (a4 < 0.0)
  {
    id v7 = [v5 featureValueForName:@"algorithm"];
    uint64_t v8 = [v7 int64Value];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 0xA) {
      goto LABEL_7;
    }
    id v9 = (void *)*MEMORY[0x1E4F8A0A8];
    uint64_t v10 = [v6 featureValueForName:@"source_bundleId"];
    uint64_t v11 = [v10 stringValue];
    int v12 = [v9 isEqualToString:v11];

    id v13 = (double *)((unint64_t)(v8 - 5) >= 3 ? MEMORY[0x1E4F8A180] : MEMORY[0x1E4F8A1A8]);
    if (v12) {
LABEL_7:
    }
      id v13 = (double *)MEMORY[0x1E4F8A188];
    a4 = *v13;
  }
  if (a4 < 0.0) {
    a4 = 0.0;
  }

  return a4;
}

+ (id)recordsForNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v15 = objc_opt_new();
        id v16 = [v14 item];
        [v15 setEntity:v16];

        [v14 score];
        objc_msgSend(v15, "setInitialScore:");
        [v15 setSource:v8];
        [v15 setAlgorithm:a5];
        uint64_t v17 = [MEMORY[0x1E4F89FC8] osBuild];
        [v15 setExtractionOsBuild:v17];

        id v18 = +[PPTrialWrapper sharedInstance];
        objc_msgSend(v15, "setExtractionAssetVersion:", objc_msgSend(v18, "treatmentsHash"));

        [v9 addObject:v15];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v9;
}

+ (void)sortAndTruncate:(id)a3 queryLimit:(unint64_t)a4
{
  id v5 = a3;
  [v5 sortUsingComparator:&__block_literal_global_290];
  if ([v5 count] > a4) {
    objc_msgSend(v5, "removeObjectsInRange:", a4, objc_msgSend(v5, "count") - a4);
  }
}

uint64_t __54__PPLocalNamedEntityStore_sortAndTruncate_queryLimit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  [a2 score];
  double v7 = v6;
  [v5 score];
  double v9 = v8;

  return [v4 reverseCompareDouble:v7 withDouble:v9];
}

- (uint64_t)_generateMapsSearchQueryResult
{
  if (result)
  {
    double v1 = *(void **)(result + 8);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __57__PPLocalNamedEntityStore__generateMapsSearchQueryResult__block_invoke;
    v2[3] = &unk_1E65D6378;
    v2[4] = result;
    return [v1 runWithLockAcquired:v2];
  }
  return result;
}

void __56__PPLocalNamedEntityStore__registerMapsQueryPrefetching__block_invoke(uint64_t a1)
{
  unint64_t v2 = pp_entities_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Running Maps search query prefetch.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PPLocalNamedEntityStore _generateMapsSearchQueryResult]((uint64_t)WeakRetained);
}

void __57__PPLocalNamedEntityStore__generateMapsSearchQueryResult__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F93B60];
  id v4 = a2;
  id v5 = [v3 alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PPLocalNamedEntityStore__generateMapsSearchQueryResult__block_invoke_2;
  v8[3] = &unk_1E65D7BD8;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v6 = [v5 initWithBlock:v8 idleTimeout:240.0];
  double v7 = (void *)v4[3];
  v4[3] = v6;
}

id __57__PPLocalNamedEntityStore__generateMapsSearchQueryResult__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)os_transaction_create();
  id v3 = pp_entities_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "Maps search query: cache miss", buf, 2u);
  }

  id v4 = objc_opt_new();
  id v5 = +[PPConfiguration sharedInstance];
  [v5 mapsSearchQueryFromDateInterval];
  uint64_t v6 = objc_msgSend(v4, "dateByAddingTimeInterval:");

  double v7 = +[PPConfiguration sharedInstance];
  uint64_t v8 = [v7 mapsSearchQueryLimit];

  double v9 = [MEMORY[0x1E4F89EA0] locationQueryWithLimit:v8 fromDate:v6 consumerType:3];
  [v9 setLocationConsumer:0];
  uint64_t v10 = *(void **)(a1 + 32);
  id v17 = 0;
  uint64_t v11 = [v10 rankedNamedEntitiesWithQuery:v9 error:&v17 clientProcessName:@"suggestd"];
  id v12 = v17;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v14 = pp_entities_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "Failed to prefetch Maps search query: %@", buf, 0xCu);
    }

    id v13 = (id)objc_opt_new();
  }
  id v15 = v13;

  return v15;
}

@end