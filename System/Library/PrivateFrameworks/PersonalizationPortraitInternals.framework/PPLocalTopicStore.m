@interface PPLocalTopicStore
+ (id)calibrateScoredTopic:(id)a3 calibrationTrie:(id)a4;
+ (id)defaultStore;
+ (id)recordsForTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5;
+ (void)sortAndTruncate:(id)a3 queryLimit:(unint64_t)a4;
- (BOOL)clearTopicScoresCache:(id *)a3;
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)cloudSyncWithError:(id *)a3;
- (BOOL)computeAndCacheTopicScores:(id *)a3;
- (BOOL)computeAndCacheTopicScoresWithShouldContinueBlock:(id)a3 error:(id *)a4;
- (BOOL)deleteAllTopicFeedbackCountsOlderThanDate:(id)a3;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 algorithm:(unint64_t)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 algorithm:(unint64_t)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 algorithm:(unint64_t)a5 olderThan:(id)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 algorithm:(unint64_t)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllTopicsWithTopicId:(id)a3 algorithm:(unint64_t)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9;
- (BOOL)flushDonationsWithError:(id *)a3;
- (BOOL)iterScoredTopicsWithQuery:(id)a3 error:(id *)a4 clientProcessName:(id)a5 block:(id)a6;
- (BOOL)iterScoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)pruneOrphanedTopicFeedbackCountsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6;
- (PPLocalTopicStore)init;
- (PPLocalTopicStore)initWithStorage:(id)a3 trialWrapper:(id)a4;
- (PPTopicStorage)storage;
- (PPTopicTransform)_topicTransformForId:(uint64_t)a1;
- (double)finalScoreFromRecordsUsingHybrid:(id)a3 streamingScorer:(id)a4 mlModel:(id)a5;
- (id)_coalesceScoredTopics:(void *)a3 exactMatchesInSourceText:;
- (id)_feedbackItemsByItemString:(void *)a1;
- (id)cachePath:(id *)a3;
- (id)cachedTopicScores;
- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4;
- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4 clientProcessName:(id)a5;
- (id)scoreTopics:(id)a3 scoringDate:(id)a4 decayRate:(double)a5 strictFiltering:(BOOL)a6 sourceStats:(id)a7 decayedFeedbackCounts:(id)a8 streamingScorer:(id *)a9 mlModel:(id)a10;
- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5;
- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 clientProcessName:(id)a6;
- (id)topicCacheSandboxExtensionToken:(id *)a3;
- (id)topicExtractionsFromText:(id)a3 clientProcessName:(id)a4 error:(id *)a5;
- (id)topicExtractionsFromText:(id)a3 error:(id *)a4;
- (id)topicRecordsWithQuery:(id)a3 error:(id *)a4;
- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5;
- (uint64_t)_defaultIterScoresForTopicMapping:(void *)a3 query:(void *)a4 error:(void *)a5 clientProcessName:(void *)a6 block:;
- (uint64_t)_logFeedbackSessionsWithFeedback:(void *)a3 error:;
- (void)_dpLoggingForMappingId:(void *)a3 mappedTopics:;
- (void)_logParametersForQuery:(void *)a3 client:(void *)a4 method:;
- (void)_petLoggingForMappedTopicQuery:(void *)a3 mappingId:(uint64_t)a4 count:(void *)a5 clientProcessName:(char)a6 hasError:;
- (void)disableSyncForBundleIds:(id)a3;
- (void)logDonationErrorForReason:(int64_t)a3 errorCode:(unint64_t)a4 source:(id)a5;
- (void)processFeedback:(id)a3;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4;
- (void)topicInvalidationCallback;
@end

@implementation PPLocalTopicStore

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  char v11 = 0;
  unint64_t v10 = 0;
  BOOL v8 = [(PPTopicStorage *)self->_storage deleteAllTopicsFromSourcesWithBundleId:a3 groupIds:a4 atLeastOneTopicRemoved:&v11 deletedCount:&v10 error:a6];
  if (v11) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  if (a5) {
    *a5 = v10;
  }
  return v8;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 algorithm:(unint64_t)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  char v12 = 0;
  unint64_t v11 = 0;
  BOOL v9 = [(PPTopicStorage *)self->_storage deleteAllTopicsFromSourcesWithBundleId:a3 groupIds:a4 algorithm:a5 atLeastOneTopicRemoved:&v12 deletedCount:&v11 error:a7];
  if (v12) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  if (a6) {
    *a6 = v11;
  }
  return v9;
}

+ (id)defaultStore
{
  pthread_mutex_lock(&defaultStore_lock_20751);
  if (!defaultStore_instance_20752)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance_20752;
    defaultStore_instance_20752 = v2;

    if (!defaultStore_instance_20752)
    {
      v4 = pp_topics_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPLocalTopicStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }
    }
  }
  id v5 = (id)defaultStore_instance_20752;
  pthread_mutex_unlock(&defaultStore_lock_20751);
  return v5;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  char v10 = 0;
  unint64_t v9 = 0;
  BOOL v7 = [(PPTopicStorage *)self->_storage deleteAllTopicsFromSourcesWithBundleId:a3 atLeastOneTopicRemoved:&v10 deletedCount:&v9 error:a5];
  if (v10) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  if (a4) {
    *a4 = v9;
  }
  return v7;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 algorithm:(unint64_t)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  char v11 = 0;
  unint64_t v10 = 0;
  BOOL v8 = [(PPTopicStorage *)self->_storage deleteAllTopicsFromSourcesWithBundleId:a3 algorithm:a4 atLeastOneTopicRemoved:&v11 deletedCount:&v10 error:a6];
  if (v11) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  if (a5) {
    *a5 = v10;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_cacheUpdateError, 0);
  objc_storeStrong((id *)&self->_cacheUpdateQueue, 0);
  objc_storeStrong((id *)&self->_cacheAsyncUpdateQueue, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_blocklist, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (PPTopicStorage)storage
{
  return self->_storage;
}

- (id)topicCacheSandboxExtensionToken:(id *)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E4F29268], "currentConnection", a3);
  id v5 = v4;
  if (v4)
  {
    [v4 auditToken];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }

  [(NSString *)self->_cachePath cStringUsingEncoding:4];
  uint64_t v6 = sandbox_extension_issue_file_to_process();
  if (v6)
  {
    BOOL v7 = (void *)v6;
    BOOL v8 = objc_msgSend([NSString alloc], "initWithUTF8String:", v6, v10, v11);
    free(v7);
  }
  else
  {
    BOOL v8 = 0;
  }
  return v8;
}

- (BOOL)clearTopicScoresCache:(id *)a3
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a3) = [v5 removeItemAtPath:self->_cachePath error:a3];

  return (char)a3;
}

- (BOOL)computeAndCacheTopicScoresWithShouldContinueBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((atomic_exchange(&self->_cacheUpdateEnqueued._Value, 1u) & 1) == 0)
  {
    BOOL v7 = (void *)MEMORY[0x1CB79D060]();
    cacheUpdateQueue = self->_cacheUpdateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PPLocalTopicStore_computeAndCacheTopicScoresWithShouldContinueBlock_error___block_invoke;
    block[3] = &unk_1E65DA2E8;
    block[4] = self;
    id v20 = v6;
    dispatch_sync(cacheUpdateQueue, block);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__20507;
  v17 = __Block_byref_object_dispose__20508;
  id v18 = 0;
  unint64_t v9 = self->_cacheUpdateQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PPLocalTopicStore_computeAndCacheTopicScoresWithShouldContinueBlock_error___block_invoke_384;
  v12[3] = &unk_1E65DA310;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(v9, v12);
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v10 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __77__PPLocalTopicStore_computeAndCacheTopicScoresWithShouldContinueBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 64));
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    uint64_t v2 = objc_opt_new();
    [v2 setRemoveNearDuplicates:1];
    v3 = *(void **)(a1 + 32);
    id v36 = 0;
    v4 = [v3 rankedTopicsWithQuery:v2 error:&v36];
    id v5 = v36;
    id v6 = v36;
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
    {
LABEL_26:

      return;
    }
    if (v4)
    {
      id obj = v5;
      id v29 = v6;
      v30 = v2;
      BOOL v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            v14 = [v13 item];
            uint64_t v15 = [v14 topicIdentifier];

            v16 = NSNumber;
            [v13 score];
            v17 = objc_msgSend(v16, "numberWithDouble:");
            [v7 setObject:v17 forKeyedSubscript:v15];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v39 count:16];
        }
        while (v10);
      }

      id v6 = v29;
      uint64_t v2 = v30;
      id v5 = obj;
    }
    else
    {
      BOOL v7 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v5);
    if (v6)
    {
      id v18 = pp_topics_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v6;
        _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "Iterating over PPTopicStore failed: %@", buf, 0xCu);
      }
    }
    else
    {
      if (!(*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
      {
        id v6 = 0;
LABEL_25:

        v4 = 0;
        goto LABEL_26;
      }
      v19 = *(void **)(*(void *)(a1 + 32) + 40);
      id v20 = [MEMORY[0x1E4F29128] UUID];
      v21 = [v20 UUIDString];
      id v18 = [v19 stringByAppendingFormat:@".new-%@", v21];

      id v31 = 0;
      v22 = [MEMORY[0x1E4F93B50] fileBackedDataWithPropertyList:v7 writtenToPath:v18 format:1 error:&v31];
      id v23 = v31;
      id v6 = v31;
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v23);
      if (v22)
      {
        v24 = (const std::__fs::filesystem::path *)[v18 fileSystemRepresentation];
        v25 = (const std::__fs::filesystem::path *)[*(id *)(*(void *)(a1 + 32) + 40) fileSystemRepresentation];
        rename(v24, v25, v26);
      }
      else
      {
        v27 = pp_topics_log_handle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v6;
          _os_log_error_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_ERROR, "Could not serialize and write plist: %@", buf, 0xCu);
        }
      }
    }

    goto LABEL_25;
  }
}

void __77__PPLocalTopicStore_computeAndCacheTopicScoresWithShouldContinueBlock_error___block_invoke_384(uint64_t a1)
{
}

- (BOOL)computeAndCacheTopicScores:(id *)a3
{
  return [(PPLocalTopicStore *)self computeAndCacheTopicScoresWithShouldContinueBlock:&__block_literal_global_379 error:a3];
}

uint64_t __48__PPLocalTopicStore_computeAndCacheTopicScores___block_invoke()
{
  return 1;
}

- (void)processFeedback:(id)a3
{
  uint64_t v218 = *MEMORY[0x1E4F143B8];
  id v140 = a3;
  v3 = [v140 mappingId];

  if (v3)
  {
    id v4 = v140;
    if (!self) {
      goto LABEL_99;
    }
    id v143 = v4;
    id v5 = [v4 feedbackItems];
    id v6 = -[PPLocalTopicStore _feedbackItemsByItemString:](v5);

    id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v8 = [v6 allKeys];
    uint64_t v9 = (void *)[v7 initWithArray:v8];

    uint64_t v10 = objc_opt_new();
    v142 = [v143 mappingId];
    if (!v142)
    {
      v132 = [MEMORY[0x1E4F28B00] currentHandler];
      [v132 handleFailureInMethod:sel__processMappedTopicPendingFeedback_ object:self file:@"PPLocalTopicStore.m" lineNumber:1790 description:@"Mapping ID was previously checked to be nonnull. Check for memory corruption"];
    }
    v141 = objc_opt_new();
    uint64_t v11 = [v143 timestamp];
    [v141 setScoringDate:v11];

    char v12 = [v143 timestamp];
    [v141 setToDate:v12];

    [v141 setMinimumComponentCount:1];
    uint64_t v13 = [v143 clientBundleId];
    v14 = +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v13, 0);
    [v141 setExcludingSourceBundleIds:v14];

    id v185 = 0;
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = __56__PPLocalTopicStore__processMappedTopicPendingFeedback___block_invoke;
    v181[3] = &unk_1E65DA298;
    id v138 = v9;
    id v182 = v138;
    id v139 = v10;
    id v183 = v139;
    id v165 = v6;
    id v184 = v165;
    BOOL v15 = [(PPLocalTopicStore *)self iterScoresForTopicMapping:v142 query:v141 error:&v185 block:v181];
    id v137 = v185;
    if (!v15)
    {
      oslog = pp_default_log_handle();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v212) = 138412290;
        *(void *)((char *)&v212 + 4) = v137;
        _os_log_error_impl(&dword_1CA9A8000, oslog, OS_LOG_TYPE_ERROR, "_processMappedTopicPendingFeedback: error from iterScoresForTopicMapping: %@", (uint8_t *)&v212, 0xCu);
      }
      goto LABEL_98;
    }
    oslog = objc_opt_new();
    v16 = objc_opt_new();
    -[PPLocalTopicStore _topicTransformForId:]((uint64_t)self, v142);
    id v160 = (id)objc_claimAutoreleasedReturnValue();
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    id obj = v138;
    uint64_t v167 = [obj countByEnumeratingWithState:&v177 objects:v195 count:16];
    if (v167)
    {
      uint64_t v162 = *(void *)v178;
      do
      {
        for (uint64_t i = 0; i != v167; ++i)
        {
          if (*(void *)v178 != v162) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v177 + 1) + 8 * i);
          context = (void *)MEMORY[0x1CB79D060]();
          if ([v18 length] && (objc_msgSend(v160, "containsMappedTopic:", v18) & 1) != 0)
          {
            v19 = [v165 objectForKeyedSubscript:v18];
            [oslog addObjectsFromArray:v19];
          }
          else
          {
            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            v19 = [v165 objectForKeyedSubscript:v18];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v173 objects:&v191 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v174;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v174 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  id v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89E30]), "initWithItemString:itemFeedbackType:", &stru_1F253DF18, objc_msgSend(*(id *)(*((void *)&v173 + 1) + 8 * j), "itemFeedbackType"));
                  [v16 addObject:v23];
                }
                uint64_t v20 = [v19 countByEnumeratingWithState:&v173 objects:&v191 count:16];
              }
              while (v20);
            }
          }
        }
        uint64_t v167 = [obj countByEnumeratingWithState:&v177 objects:v195 count:16];
      }
      while (v167);
    }

    if ([oslog count])
    {
      id v24 = objc_alloc(MEMORY[0x1E4F89DA0]);
      v25 = [v143 timestamp];
      v26 = [v143 clientIdentifier];
      v27 = [v143 clientBundleId];
      v28 = (void *)[v24 initWithFeedbackItems:oslog timestamp:v25 clientIdentifier:v26 clientBundleId:v27 mappingId:v142];

      +[PPFeedbackStorage logFeedback:v28 domain:0 domainStatus:4 inBackground:1];
    }
    if ([v16 count])
    {
      id v29 = objc_alloc(MEMORY[0x1E4F89DA0]);
      v30 = [v143 timestamp];
      id v31 = [v143 clientIdentifier];
      long long v32 = [v143 clientBundleId];
      long long v33 = (void *)[v29 initWithFeedbackItems:v16 timestamp:v30 clientIdentifier:v31 clientBundleId:v32 mappingId:v142];

      +[PPFeedbackStorage logFeedback:v33 domain:0 domainStatus:3 inBackground:1];
    }
    if (![v139 count])
    {
LABEL_97:

LABEL_98:
      id v4 = v143;
      goto LABEL_99;
    }
    id v34 = objc_alloc(MEMORY[0x1E4F89DA0]);
    long long v35 = [v143 timestamp];
    id v36 = [v143 clientIdentifier];
    v37 = [v143 clientBundleId];
    v136 = (void *)[v34 initWithFeedbackItems:v139 timestamp:v35 clientIdentifier:v36 clientBundleId:v37 mappingId:v142];

    +[PPFeedbackStorage logFeedback:v136 domain:0 domainStatus:5 inBackground:1];
    id v38 = [v136 feedbackItems];
    v39 = [v143 clientBundleId];
    uint64_t v40 = [v143 clientIdentifier];
    +[PPFeedbackUtils recordUserEventsFromFeedback:v143 matchingFeedbackItems:v38 clientBundleId:v39 clientIdentifier:v40 domain:0];

    v41 = [v143 timestamp];
    v42 = [v143 clientIdentifier];
    v43 = [v143 clientBundleId];
    id v44 = v139;
    id v135 = v41;
    id v134 = v42;
    id v133 = v43;
    id v45 = v142;
    id v46 = v44;
    id v146 = v45;
    v47 = objc_opt_new();
    long long v210 = 0u;
    long long v211 = 0u;
    *(_OWORD *)v208 = 0u;
    long long v209 = 0u;
    id v144 = v46;
    uint64_t v148 = [v144 countByEnumeratingWithState:v208 objects:&v212 count:16];
    if (v148)
    {
      uint64_t v145 = *(void *)v209;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v209 != v145)
          {
            uint64_t v49 = v48;
            objc_enumerationMutation(v144);
            uint64_t v48 = v49;
          }
          uint64_t v153 = v48;
          v50 = *(void **)(*(void *)&v208[8] + 8 * v48);
          id v155 = (id)MEMORY[0x1CB79D060]();
          v168 = [v50 itemString];
          id v190 = 0;
          v163 = [(PPLocalTopicStore *)self unmapMappedTopicIdentifier:v168 mappingIdentifier:v146 error:&v190];
          id obja = v190;
          if (v163)
          {
            long long v188 = 0u;
            long long v189 = 0u;
            long long v186 = 0u;
            long long v187 = 0u;
            contexta = v163;
            uint64_t v51 = [contexta countByEnumeratingWithState:&v186 objects:v206 count:16];
            if (v51)
            {
              uint64_t v52 = *(void *)v187;
              do
              {
                for (uint64_t k = 0; k != v51; ++k)
                {
                  if (*(void *)v187 != v52) {
                    objc_enumerationMutation(contexta);
                  }
                  uint64_t v54 = *(void *)(*((void *)&v186 + 1) + 8 * k);
                  v55 = (void *)MEMORY[0x1CB79D060]();
                  v56 = (void *)[[NSString alloc] initWithFormat:@"Q%@", v54];
                  v57 = [v47 objectForKeyedSubscript:v56];
                  BOOL v58 = v57 == 0;

                  if (v58)
                  {
                    v59 = objc_opt_new();
                    [v47 setObject:v59 forKeyedSubscript:v56];
                  }
                  v60 = [v47 objectForKeyedSubscript:v56];
                  v61 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v50, "itemFeedbackType"));
                  [v60 addObject:v61];
                }
                uint64_t v51 = [contexta countByEnumeratingWithState:&v186 objects:v206 count:16];
              }
              while (v51);
            }
          }
          else
          {
            contexta = pp_default_log_handle();
            if (os_log_type_enabled(contexta, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v201 = v168;
              __int16 v202 = 2112;
              id v203 = v146;
              __int16 v204 = 2112;
              id v205 = obja;
              _os_log_error_impl(&dword_1CA9A8000, contexta, OS_LOG_TYPE_ERROR, "Error while getting unmapped topics for mapped topic %@ under mapping %@: %@", buf, 0x20u);
            }
          }

          uint64_t v48 = v153 + 1;
        }
        while (v153 + 1 != v148);
        uint64_t v148 = [v144 countByEnumeratingWithState:v208 objects:&v212 count:16];
      }
      while (v148);
    }

    v62 = objc_opt_new();
    [v62 setScoringDate:v135];
    [v62 setToDate:v135];
    [v62 setOrderByIdentifier:1];
    id v63 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v64 = [v47 allKeys];
    v65 = (void *)[v63 initWithArray:v64];
    [v62 setMatchingTopicIds:v65];

    v66 = objc_opt_new();
    v206[0] = 0;
    v206[1] = v206;
    v206[2] = (id)0x3032000000;
    v206[3] = __Block_byref_object_copy__20507;
    v206[4] = __Block_byref_object_dispose__20508;
    v207 = &stru_1F253DF18;
    *(void *)&long long v186 = 0;
    *(void *)&long long v212 = MEMORY[0x1E4F143A8];
    *((void *)&v212 + 1) = 3221225472;
    v213 = __115__PPLocalTopicStore__mappedTopicsFilterPendingFeedbackItems_scoringDate_clientIdentifier_clientBundleId_mappingId___block_invoke;
    v214 = &unk_1E65DA2C0;
    v217 = v206;
    id v67 = v47;
    id v215 = v67;
    id v68 = v66;
    id v216 = v68;
    BOOL v69 = [(PPLocalTopicStore *)self iterTopicRecordsWithQuery:v62 error:&v186 block:&v212];
    id v70 = (id)v186;
    if (v69)
    {
      if (![v68 count])
      {
LABEL_92:

        _Block_object_dispose(v206, 8);
        v206[0] = 0;
        char v129 = -[PPLocalTopicStore _logFeedbackSessionsWithFeedback:error:](self, v136, v206);
        id v130 = v206[0];
        if ((v129 & 1) == 0)
        {
          v131 = pp_topics_log_handle();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v212) = 138412290;
            *(void *)((char *)&v212 + 4) = v130;
            _os_log_error_impl(&dword_1CA9A8000, v131, OS_LOG_TYPE_ERROR, "PPLocalTopicStore: error generating sessions %@", (uint8_t *)&v212, 0xCu);
          }
        }
        goto LABEL_97;
      }
      v71 = [objc_alloc(MEMORY[0x1E4F89DA0]) initWithFeedbackItems:v68 timestamp:v135 clientIdentifier:v134 clientBundleId:v133 mappingId:v146];
      [(PPTopicStorage *)self->_storage donateTopicFeedback:v71];
      v72 = objc_opt_new();
      [v72 setClientId:v134];
      [v72 setMappingId:v146];
      v73 = [(PPTrialWrapper *)self->_trialWrapper concatenatedTreatmentNames];
      [v72 setActiveTreatments:v73];

      v74 = [MEMORY[0x1E4F93728] sharedInstance];
      objc_msgSend(v74, "trackScalarForMessage:count:", v72, objc_msgSend(v68, "count"));
    }
    else
    {
      v71 = pp_default_log_handle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v208 = 138412290;
        *(void *)&v208[4] = v70;
        _os_log_error_impl(&dword_1CA9A8000, v71, OS_LOG_TYPE_ERROR, "_processTopicPendingFeedback: error from iterTopicRecordsWithQuery: %@", v208, 0xCu);
      }
    }

    goto LABEL_92;
  }
  id v4 = v140;
  if (self)
  {
    id v156 = v4;
    v75 = [v4 feedbackItems];
    uint64_t v76 = -[PPLocalTopicStore _feedbackItemsByItemString:](v75);

    id v77 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v78 = [(id)v76 allKeys];
    v79 = (void *)[v77 initWithArray:v78];

    v80 = objc_opt_new();
    v154 = objc_opt_new();
    v81 = [v156 timestamp];
    [v154 setScoringDate:v81];

    v82 = [v156 timestamp];
    [v154 setToDate:v82];

    [v154 setOrderByIdentifier:1];
    v83 = [v156 clientBundleId];
    v84 = +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v83, 0);
    [v154 setExcludingSourceBundleIds:v84];

    id v85 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v86 = [v156 feedbackItems];
    v87 = objc_msgSend(v86, "_pas_proxyArrayWithMapping:", &__block_literal_global_360);
    v88 = (void *)[v85 initWithArray:v87];
    [v154 setMatchingTopicIds:v88];

    *(void *)&long long v186 = 0;
    *((void *)&v186 + 1) = &v186;
    *(void *)&long long v187 = 0x3032000000;
    *((void *)&v187 + 1) = __Block_byref_object_copy__20507;
    *(void *)&long long v188 = __Block_byref_object_dispose__20508;
    *((void *)&v188 + 1) = &stru_1F253DF18;
    *(void *)&long long v177 = 0;
    v195[0] = MEMORY[0x1E4F143A8];
    v195[1] = 3221225472;
    v195[2] = __58__PPLocalTopicStore__processPortraitTopicPendingFeedback___block_invoke_2;
    v195[3] = &unk_1E65DA270;
    v199 = &v186;
    os_log_t osloga = v80;
    os_log_t v196 = osloga;
    id v166 = (id)v76;
    id v197 = v166;
    id v149 = v79;
    id v198 = v149;
    LOBYTE(v76) = [(PPLocalTopicStore *)self iterTopicRecordsWithQuery:v154 error:&v177 block:v195];
    id v147 = (id)v177;
    if (v76)
    {
      if ([osloga count])
      {
        id v89 = objc_alloc(MEMORY[0x1E4F89DA0]);
        v90 = [v156 timestamp];
        v91 = [v156 clientIdentifier];
        v92 = [v156 clientBundleId];
        v93 = [v156 mappingId];
        v94 = (void *)[v89 initWithFeedbackItems:osloga timestamp:v90 clientIdentifier:v91 clientBundleId:v92 mappingId:v93];

        +[PPFeedbackStorage logFeedback:v94 domain:0 domainStatus:2 inBackground:1];
        v95 = [v94 feedbackItems];
        uint64_t v96 = [v156 clientBundleId];
        v97 = [v156 clientIdentifier];
        +[PPFeedbackUtils recordUserEventsFromFeedback:v156 matchingFeedbackItems:v95 clientBundleId:v96 clientIdentifier:v97 domain:0];

        *(void *)&long long v173 = 0;
        LOBYTE(v96) = -[PPLocalTopicStore _logFeedbackSessionsWithFeedback:error:](self, v94, &v173);
        id v98 = (id)v173;
        if ((v96 & 1) == 0)
        {
          v99 = pp_topics_log_handle();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v212) = 138412290;
            *(void *)((char *)&v212 + 4) = v98;
            _os_log_error_impl(&dword_1CA9A8000, v99, OS_LOG_TYPE_ERROR, "PPLocalTopicStore: failed in session logging: %@", (uint8_t *)&v212, 0xCu);
          }
        }
        [(PPTopicStorage *)self->_storage donateTopicFeedback:v94];
      }
      objb = objc_opt_new();
      v100 = objc_opt_new();
      long long v193 = 0u;
      long long v194 = 0u;
      long long v191 = 0u;
      long long v192 = 0u;
      id v161 = v149;
      uint64_t v101 = [v161 countByEnumeratingWithState:&v191 objects:&v212 count:16];
      if (v101)
      {
        uint64_t v164 = *(void *)v192;
        do
        {
          uint64_t v169 = v101;
          for (uint64_t m = 0; m != v169; ++m)
          {
            if (*(void *)v192 != v164) {
              objc_enumerationMutation(v161);
            }
            v103 = *(void **)(*((void *)&v191 + 1) + 8 * m);
            contextb = (void *)MEMORY[0x1CB79D060]();
            v104 = (objc_class *)MEMORY[0x1E4F28FD8];
            id v105 = v103;
            v106 = (void *)[[v104 alloc] initWithPattern:@"Q[0-9]{1,10}" options:0 error:0];
            uint64_t v107 = objc_msgSend(v106, "rangeOfFirstMatchInString:options:range:", v105, 0, 0, objc_msgSend(v105, "length"));
            uint64_t v109 = v108;

            if (v107 == 0x7FFFFFFFFFFFFFFFLL && v109 == 0)
            {
              long long v210 = 0u;
              long long v211 = 0u;
              *(_OWORD *)v208 = 0u;
              long long v209 = 0u;
              v111 = [v166 objectForKeyedSubscript:v105];
              uint64_t v112 = [v111 countByEnumeratingWithState:v208 objects:v206 count:16];
              if (v112)
              {
                uint64_t v113 = *(void *)v209;
                do
                {
                  for (uint64_t n = 0; n != v112; ++n)
                  {
                    if (*(void *)v209 != v113) {
                      objc_enumerationMutation(v111);
                    }
                    v115 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89E30]), "initWithItemString:itemFeedbackType:", &stru_1F253DF18, objc_msgSend(*(id *)(*(void *)&v208[8] + 8 * n), "itemFeedbackType"));
                    [v100 addObject:v115];
                  }
                  uint64_t v112 = [v111 countByEnumeratingWithState:v208 objects:v206 count:16];
                }
                while (v112);
              }
            }
            else
            {
              v111 = [v166 objectForKeyedSubscript:v105];
              [objb addObjectsFromArray:v111];
            }
          }
          uint64_t v101 = [v161 countByEnumeratingWithState:&v191 objects:&v212 count:16];
        }
        while (v101);
      }

      if ([objb count])
      {
        id v116 = objc_alloc(MEMORY[0x1E4F89DA0]);
        v117 = [v156 timestamp];
        v118 = [v156 clientIdentifier];
        v119 = [v156 clientBundleId];
        v120 = [v156 mappingId];
        v121 = (void *)[v116 initWithFeedbackItems:objb timestamp:v117 clientIdentifier:v118 clientBundleId:v119 mappingId:v120];

        +[PPFeedbackStorage logFeedback:v121 domain:0 domainStatus:2 inBackground:1];
      }
      if ([v100 count])
      {
        id v122 = objc_alloc(MEMORY[0x1E4F89DA0]);
        v123 = [v156 timestamp];
        v124 = [v156 clientIdentifier];
        v125 = [v156 clientBundleId];
        v126 = [v156 mappingId];
        v127 = (void *)[v122 initWithFeedbackItems:v100 timestamp:v123 clientIdentifier:v124 clientBundleId:v125 mappingId:v126];

        +[PPFeedbackStorage logFeedback:v127 domain:0 domainStatus:0 inBackground:1];
      }

      v128 = objb;
    }
    else
    {
      v128 = pp_default_log_handle();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v212) = 138412290;
        *(void *)((char *)&v212 + 4) = v147;
        _os_log_error_impl(&dword_1CA9A8000, v128, OS_LOG_TYPE_ERROR, "_processTopicPendingFeedback: error from iterTopicRecordsWithQuery: %@", (uint8_t *)&v212, 0xCu);
      }
    }

    _Block_object_dispose(&v186, 8);
    id v4 = v156;
  }
LABEL_99:
}

- (id)_feedbackItemsByItemString:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x1CB79D060](v4);
        uint64_t v10 = objc_msgSend(v8, "itemString", (void)v15);
        uint64_t v11 = [v2 objectForKeyedSubscript:v10];

        if (!v11)
        {
          char v12 = objc_opt_new();
          [v2 setObject:v12 forKeyedSubscript:v10];
        }
        uint64_t v13 = [v2 objectForKeyedSubscript:v10];
        [v13 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }

  return v2;
}

uint64_t __58__PPLocalTopicStore__processPortraitTopicPendingFeedback___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v18 = a2;
  uint64_t v5 = [v18 topic];
  uint64_t v6 = [v5 clusterIdentifier];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = [v18 topic];
    uint64_t v9 = [v8 clusterIdentifier];
    char v10 = [v9 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [v18 topic];
      uint64_t v12 = [v11 topicIdentifier];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      long long v15 = *(void **)(a1 + 32);
      long long v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [v15 addObjectsFromArray:v16];

      [*(id *)(a1 + 48) removeObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      if (![*(id *)(a1 + 48) count]) {
        *a3 = 1;
      }
    }
  }
  else
  {
  }
  return MEMORY[0x1F41817F8]();
}

- (uint64_t)_logFeedbackSessionsWithFeedback:(void *)a3 error:
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = [v4 clientBundleId];
  BOOL v6 = +[PPFeedbackUtils shouldSample:v5];

  if (!v6)
  {
    long long v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "PPLocalTopicStore: No feedback session logs collection performed due to sampling.", buf, 2u);
    }

    uint64_t v16 = 1;
    goto LABEL_91;
  }
  uint64_t v7 = objc_opt_new();
  [v7 setPredictionType:1];
  id v8 = +[PPFeedbackUtils feedbackMetadataForBaseFeedback:v4];
  [v7 setFeedbackMetadata:v8];

  uint64_t v108 = [v4 feedbackItems];
  v123 = objc_opt_new();
  v119 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  [v9 setLimit:1000];
  char v10 = [v4 clientBundleId];
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1CB79D060]();
    id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v13 = [v4 clientBundleId];
    v14 = objc_msgSend(v12, "initWithObjects:", v13, 0);

    [v9 setExcludingSourceBundleIds:v14];
  }
  else
  {
    [v9 setExcludingSourceBundleIds:0];
  }

  id v145 = 0;
  long long v17 = [a1 rankedTopicsWithQuery:v9 error:&v145];
  id v18 = v145;
  id v19 = v18;
  if (!v17)
  {
    if (a3) {
      *a3 = v18;
    }
    v64 = pp_topics_log_handle();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v155 = (unint64_t)v19;
      _os_log_error_impl(&dword_1CA9A8000, v64, OS_LOG_TYPE_ERROR, "logFeedbackSessionsWithFeedback: nil result from rankedTopicsWithQuery: %@", buf, 0xCu);
    }

    unsigned __int8 v146 = 0;
    goto LABEL_90;
  }
  id v105 = a3;
  v114 = v18;
  uint64_t v107 = v9;
  v117 = v7;
  uint64_t v112 = v4;
  v118 = objc_opt_new();
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v106 = v17;
  id obj = v17;
  uint64_t v20 = [obj countByEnumeratingWithState:&v141 objects:v153 count:16];
  if (!v20) {
    goto LABEL_21;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v142;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v142 != v22) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(void **)(*((void *)&v141 + 1) + 8 * i);
      v25 = (void *)MEMORY[0x1CB79D060]();
      v26 = [v24 item];
      v27 = [v26 topicIdentifier];
      if ([v27 length])
      {
        v28 = [v24 item];
        id v29 = [v28 topicIdentifier];
        int v30 = [v29 characterAtIndex:0];

        if (v30 != 81) {
          goto LABEL_19;
        }
        id v31 = [v24 item];
        long long v32 = [v31 topicIdentifier];
        v26 = [v32 substringFromIndex:1];

        v27 = [v119 numberFromString:v26];
        if (v27) {
          [v118 addObject:v27];
        }
      }

LABEL_19:
    }
    uint64_t v21 = [obj countByEnumeratingWithState:&v141 objects:v153 count:16];
  }
  while (v21);
LABEL_21:

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v33 = v108;
  uint64_t v115 = [v33 countByEnumeratingWithState:&v137 objects:v152 count:16];
  if (v115)
  {
    uint64_t v113 = *(void *)v138;
    id v4 = v112;
    uint64_t v7 = v117;
    unint64_t v34 = 0x1E65D2000;
    id v110 = v33;
LABEL_23:
    id v35 = 0;
    while (1)
    {
      if (*(void *)v138 != v113) {
        objc_enumerationMutation(v33);
      }
      id v36 = *(void **)(*((void *)&v137 + 1) + 8 * (void)v35);
      v37 = (void *)MEMORY[0x1CB79D060]();
      int v38 = [v4 isMapped];
      v39 = [v36 itemString];
      uint64_t v40 = v39;
      if (v38) {
        break;
      }
      unint64_t v43 = [v39 length];

      if (v43 >= 2)
      {
        id v44 = [v36 itemString];
        int v45 = [v44 characterAtIndex:0];
        id v46 = [v36 itemString];
        v42 = v46;
        if (v45 == 81)
        {
          uint64_t v47 = [v46 substringFromIndex:1];

          v42 = (void *)v47;
        }

        uint64_t v48 = [v119 numberFromString:v42];
        if (v48)
        {
          uint64_t v49 = (void *)v48;
          id obja = v35;
          id v116 = v37;
          uint64_t v150 = v48;
          v151 = &unk_1F256B270;
          uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];

          v42 = (void *)v50;
          goto LABEL_34;
        }
LABEL_46:

        uint64_t v7 = v117;
      }
      id v35 = (char *)v35 + 1;
      if (v35 == (id)v115)
      {
        uint64_t v115 = [v33 countByEnumeratingWithState:&v137 objects:v152 count:16];
        if (v115) {
          goto LABEL_23;
        }
        goto LABEL_59;
      }
    }
    id obja = v35;
    v41 = [v4 mappingId];
    id v136 = v114;
    v42 = [a1 unmapMappedTopicIdentifier:v40 mappingIdentifier:v41 error:&v136];
    id v19 = v136;

    if (!v42)
    {
      v65 = pp_topics_log_handle();
      long long v17 = v106;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v155 = (unint64_t)v19;
        _os_log_error_impl(&dword_1CA9A8000, v65, OS_LOG_TYPE_ERROR, "logFeedbackSessionsWithFeedback: nil result from unmapMappedTopicIdentifier: %@", buf, 0xCu);
      }

      unsigned __int8 v146 = 0;
      uint64_t v7 = v117;
      goto LABEL_89;
    }
    id v116 = v37;
    v114 = v19;
LABEL_34:
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v51 = v118;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v132 objects:v149 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      unint64_t v54 = 0;
      uint64_t v55 = *(void *)v133;
LABEL_36:
      uint64_t v56 = 0;
      while (1)
      {
        if (*(void *)v133 != v55) {
          objc_enumerationMutation(v51);
        }
        v57 = *(void **)(*((void *)&v132 + 1) + 8 * v56);
        BOOL v58 = [v42 objectForKeyedSubscript:v57];

        if (v58)
        {
          id v59 = [NSString alloc];
          v60 = [v57 stringValue];
          v61 = (void *)[v59 initWithFormat:@"Q%@", v60];

          v62 = +[PPFeedbackUtils feedbackItemForPPFeedbackItem:v36];
          id v63 = [v123 objectForKeyedSubscript:v61];
          if (!v63)
          {
            id v63 = objc_opt_new();
            [v123 setObject:v63 forKeyedSubscript:v61];
          }
          [v63 addObject:v62];
          ++v54;

          if (v54 > 4) {
            break;
          }
        }
        if (v53 == ++v56)
        {
          uint64_t v53 = [v51 countByEnumeratingWithState:&v132 objects:v149 count:16];
          if (v53) {
            goto LABEL_36;
          }
          break;
        }
      }
    }

    id v33 = v110;
    id v4 = v112;
    unint64_t v34 = 0x1E65D2000;
    v37 = v116;
    id v35 = obja;
    goto LABEL_46;
  }
  uint64_t v7 = v117;
  unint64_t v34 = 0x1E65D2000uLL;
LABEL_59:

  v66 = objc_opt_new();
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v67 = v123;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v128 objects:v148 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v129;
    do
    {
      for (uint64_t j = 0; j != v69; ++j)
      {
        if (*(void *)v129 != v70) {
          objc_enumerationMutation(v67);
        }
        uint64_t v72 = *(void *)(*((void *)&v128 + 1) + 8 * j);
        [v66 addObject:v72];
        v73 = objc_opt_new();
        LODWORD(v74) = -1.0;
        v75 = [*(id *)(v34 + 3880) scoredItemWithFeaturesForFeatureDictionary:v73 score:v74];
        uint64_t v76 = [v67 objectForKeyedSubscript:v72];
        [v75 setFeedbackItems:v76];

        [v7 addScoredItems:v75];
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v128 objects:v148 count:16];
    }
    while (v69);
  }

  id v77 = pp_topics_log_handle();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
  {
    uint64_t v78 = [v67 count];
    *(_DWORD *)buf = 134283521;
    unint64_t v155 = v78;
    _os_log_impl(&dword_1CA9A8000, v77, OS_LOG_TYPE_INFO, "Feedback logging: retrieved features for %{private}lu topics: ", buf, 0xCu);
  }

  v79 = objc_opt_new();
  [v79 setLimit:1000];
  v80 = [v112 clientBundleId];
  if (v80)
  {
    v81 = (void *)MEMORY[0x1CB79D060]();
    id v82 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v83 = [v112 clientBundleId];
    v84 = objc_msgSend(v82, "initWithObjects:", v83, 0);

    [v79 setExcludingSourceBundleIds:v84];
  }
  else
  {
    [v79 setExcludingSourceBundleIds:0];
  }

  v111 = v66;
  [v79 setMatchingTopicIds:v66];
  id objb = v79;
  [a1 topicRecordsWithQuery:v79 error:v105];
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v85 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v86 = [v85 countByEnumeratingWithState:&v124 objects:v147 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    unint64_t v88 = 0;
    uint64_t v89 = *(void *)v125;
    while (2)
    {
      for (uint64_t k = 0; k != v87; ++k)
      {
        if (*(void *)v125 != v89) {
          objc_enumerationMutation(v85);
        }
        v91 = *(void **)(*((void *)&v124 + 1) + 8 * k);
        v92 = *(void **)(v34 + 3880);
        v93 = [v91 source];
        v94 = [v93 bundleId];
        LODWORD(v92) = [v92 shouldSampleExtraction:v94];

        if (!v92) {
          goto LABEL_80;
        }
        v95 = [v91 topic];
        uint64_t v96 = [v95 topicIdentifier];
        v97 = [v67 objectForKey:v96];

        if (v97)
        {
          if (v88 > 0x63)
          {
            uint64_t v7 = v117;
            unint64_t v34 = 0x1E65D2000;
            goto LABEL_86;
          }
          id v98 = objc_opt_new();
          v99 = objc_msgSend(MEMORY[0x1E4F89F98], "describeAlgorithm:", objc_msgSend(v91, "algorithm"));
          [v98 setAlgorithm:v99];

          v100 = [v91 source];
          uint64_t v101 = [v100 bundleId];
          [v98 setSourceBundleId:v101];

          [v91 initialScore];
          objc_msgSend(v98, "setScore:");
          uint64_t v7 = v117;
          [v117 addExtractedDonations:v98];
          ++v88;
        }
        else
        {
LABEL_80:
          uint64_t v7 = v117;
        }
        unint64_t v34 = 0x1E65D2000;
      }
      uint64_t v87 = [v85 countByEnumeratingWithState:&v124 objects:v147 count:16];
      if (v87) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v88 = 0;
  }
LABEL_86:

  v102 = pp_topics_log_handle();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134283521;
    unint64_t v155 = v88;
    _os_log_impl(&dword_1CA9A8000, v102, OS_LOG_TYPE_INFO, "Feedback logging: logged %{private}lu topic records: ", buf, 0xCu);
  }

  [*(id *)(v34 + 3880) addBoilerplateToFeedbackLog:v7];
  v103 = [MEMORY[0x1E4F93728] sharedInstance];
  [v103 logMessage:v7];

  unsigned __int8 v146 = 1;
  id v33 = v111;
  id v4 = v112;
  long long v17 = v106;
  id v19 = v114;
LABEL_89:

  uint64_t v9 = v107;
LABEL_90:

  uint64_t v16 = v146;
LABEL_91:

  return v16;
}

uint64_t __58__PPLocalTopicStore__processPortraitTopicPendingFeedback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemString];
}

void __56__PPLocalTopicStore__processMappedTopicPendingFeedback___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    BOOL v6 = *(void **)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:v8];
    [v6 addObjectsFromArray:v7];

    [*(id *)(a1 + 32) removeObject:v8];
    if (![*(id *)(a1 + 32) count]) {
      *a4 = 1;
    }
  }
}

- (PPTopicTransform)_topicTransformForId:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v5 = [v3 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1F253DF18];
    BOOL v6 = *(void **)(a1 + 24);
    uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"%@.dat", v5];
    id v8 = [v6 filepathForFactor:v7 namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];

    uint64_t v9 = pp_topics_log_handle();
    char v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "Loading topic transform file from: %@", buf, 0xCu);
      }

      uint64_t v11 = [[PPTopicTransform alloc] initWithPath:v8 mappingId:v3];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "Cannot locate asset path for transform resource: %@", buf, 0xCu);
      }

      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __115__PPLocalTopicStore__mappedTopicsFilterPendingFeedbackItems_scoringDate_clientIdentifier_clientBundleId_mappingId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 topic];
  uint64_t v5 = [v4 clusterIdentifier];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    uint64_t v7 = [v3 topic];
    id v8 = [v7 clusterIdentifier];
    char v9 = [v8 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    if ((v9 & 1) == 0)
    {
      id v23 = v3;
      char v10 = [v3 topic];
      uint64_t v11 = [v10 topicIdentifier];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v25 = *(void *)v27;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v27 != v25) {
              objc_enumerationMutation(obj);
            }
            long long v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
            id v18 = (void *)MEMORY[0x1CB79D060]();
            id v19 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
            uint64_t v20 = [v19 countForObject:v17];

            for (; v20; --v20)
            {
              uint64_t v21 = (void *)MEMORY[0x1CB79D060]();
              uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89E30]), "initWithItemString:itemFeedbackType:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), objc_msgSend(v17, "intValue"));
              [*(id *)(a1 + 40) addObject:v22];
            }
            ++v16;
          }
          while (v16 != v15);
          uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v15);
      }

      id v3 = v23;
    }
  }
  else
  {
  }
}

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v7 = pp_topics_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138739971;
    id v13 = v5;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPTopic universal search spotlight feedback received: %{sensitive}@", buf, 0xCu);
  }

  id v8 = +[PPMetricsUtils loggingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PPLocalTopicStore_registerUniversalSearchSpotlightFeedback_completion___block_invoke;
  block[3] = &unk_1E65DBE30;
  id v9 = v5;
  id v11 = v9;
  dispatch_async(v8, block);

  if (v6) {
    v6[2](v6, 1, 0);
  }
}

void __73__PPLocalTopicStore_registerUniversalSearchSpotlightFeedback_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [v2 clientBundleId];
  id v3 = [*(id *)(a1 + 32) clientIdentifier];
  +[PPFeedbackUtils recordUniversalSearchSpotlightStatsFromFeedback:v2 clientBundleId:v4 clientIdentifier:v3];
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void (**)(id, uint64_t, void))a4;
  int v7 = [v5 isMapped];
  id v8 = pp_topics_log_handle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (!v9) {
      goto LABEL_5;
    }
    int v13 = 138739971;
    id v14 = v5;
    char v10 = "Mapped Topic feedback received: %{sensitive}@";
  }
  else
  {
    if (!v9) {
      goto LABEL_5;
    }
    int v13 = 138739971;
    id v14 = v5;
    char v10 = "Topic feedback received: %{sensitive}@";
  }
  _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v13, 0xCu);
LABEL_5:

  id v11 = objc_opt_new();
  uint64_t v12 = +[PPInternalFeedback fromBaseFeedback:v5 storeType:2];
  [v11 storePendingFeedback:v12 storeType:2 error:0];

  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (void)disableSyncForBundleIds:(id)a3
{
}

- (void)logDonationErrorForReason:(int64_t)a3 errorCode:(unint64_t)a4 source:(id)a5
{
  id v8 = a5;
  BOOL v9 = +[PPMetricsUtils loggingQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__PPLocalTopicStore_logDonationErrorForReason_errorCode_source___block_invoke;
  v11[3] = &unk_1E65DA200;
  v11[4] = self;
  id v12 = v8;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  id v10 = v8;
  dispatch_async(v9, v11);
}

void __64__PPLocalTopicStore_logDonationErrorForReason_errorCode_source___block_invoke(void *a1)
{
  id v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setReason:", +[PPMetricsUtils mapTopicDonationErrorForPET2:](PPMetricsUtils, "mapTopicDonationErrorForPET2:", a1[6]));
  uint64_t v2 = [*(id *)(a1[4] + 24) concatenatedTreatmentNames];
  [v4 setActiveTreatments:v2];

  objc_msgSend(v4, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", a1[5]));
  [v4 setCode:a1[7]];
  id v3 = [MEMORY[0x1E4F93728] sharedInstance];
  [v3 trackScalarForMessage:v4];
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(PPTopicStorage *)self->_storage clearWithError:a3 deletedCount:a4];
  BOOL v7 = v6;
  if (a3 && !v6)
  {
    id v8 = pp_topics_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = *a3;
      int v11 = 138412290;
      id v12 = v10;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "clearWithError error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  return v7;
}

- (void)topicInvalidationCallback
{
  if (a1)
  {
    id v1 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PPLocalTopicStore_topicInvalidationCallback__block_invoke;
    block[3] = &unk_1E65DBE30;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __46__PPLocalTopicStore_topicInvalidationCallback__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_INFO, "PPLocalTopicStore invalidating topics", buf, 2u);
  }

  PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsInvalidated");
  id v3 = *(void **)(a1 + 32);
  id v10 = 0;
  char v4 = [v3 computeAndCacheTopicScores:&v10];
  id v5 = v10;
  if ((v4 & 1) == 0)
  {
    BOOL v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPLocalTopicStore had an error while trying to refresh the cache after topic invalidation: %@", buf, 0xCu);
    }

    BOOL v7 = *(void **)(a1 + 32);
    id v9 = v5;
    [v7 clearTopicScoresCache:&v9];
    id v8 = v9;

    id v5 = v8;
  }
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F5B560] userKnowledgeStore];
  if (v5)
  {
    BOOL v6 = pp_topics_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: exporting locally-generated topic records", buf, 2u);
    }

    BOOL v7 = objc_opt_new();
    storage = self->_storage;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __40__PPLocalTopicStore_cloudSyncWithError___block_invoke;
    v28[3] = &unk_1E65DA1D8;
    id v9 = v7;
    long long v29 = v9;
    [(PPTopicStorage *)storage exportRecordsToDKWithShouldContinueBlock:v28];
    id v10 = pp_topics_log_handle();
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
      uint64_t v13 = pp_topics_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: importing remotely-generated topic records", buf, 2u);
      }

      char v26 = 0;
      do
        [(PPTopicStorage *)self->_storage importRemotelyGeneratedTopicDKEventsWithLimit:[(PPTopicStorage *)self->_storage duetReadBatchSize] isComplete:&v26 shouldContinueBlock:&__block_literal_global_343];
      while (!v26);
      unint64_t v14 = pp_topics_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: processing _DKKnowledgeStore remote topic deletions", buf, 2u);
      }

      [(PPTopicStorage *)self->_storage processNewDKEventDeletions];
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
        uint64_t v31 = v20;
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        *a3 = (id)[v21 initWithDomain:v22 code:1 userInfo:v23];
      }
      id v24 = pp_topics_log_handle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v20;
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
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a3 = (id)[v15 initWithDomain:v16 code:1 userInfo:v17];
    }
    id v9 = pp_topics_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = @"Unable to connect to _DKKnowledgeStore";
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    char v11 = 0;
  }

  return v11;
}

BOOL __40__PPLocalTopicStore_cloudSyncWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  return v1 > -600.0;
}

uint64_t __40__PPLocalTopicStore_cloudSyncWithError___block_invoke_341()
{
  return 1;
}

- (BOOL)pruneOrphanedTopicFeedbackCountsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  return [(PPTopicStorage *)self->_storage pruneOrphanedTopicFeedbackCountRecordsWithLimit:a3 rowOffset:a4 deletedCount:a5 isComplete:a6];
}

- (BOOL)deleteAllTopicFeedbackCountsOlderThanDate:(id)a3
{
  return [(PPTopicStorage *)self->_storage deleteAllTopicFeedbackCountRecordsOlderThanDate:a3];
}

- (BOOL)deleteAllTopicsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  char v10 = 0;
  unint64_t v9 = 0;
  BOOL v7 = [(PPTopicStorage *)self->_storage deleteAllTopicsOlderThanDate:a3 atLeastOneTopicRemoved:&v10 deletedCount:&v9 error:a5];
  if (v10) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  if (a4) {
    *a4 = v9;
  }
  return v7;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 algorithm:(unint64_t)a5 olderThan:(id)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  char v13 = 0;
  unint64_t v12 = 0;
  BOOL v10 = [(PPTopicStorage *)self->_storage deleteAllTopicsFromSourcesWithBundleId:a3 groupId:a4 olderThanDate:a6 algorithm:a5 atLeastOneTopicRemoved:&v13 deletedCount:&v12 error:a8];
  if (v13) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  if (a7) {
    *a7 = v12;
  }
  return v10;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  char v12 = 0;
  unint64_t v11 = 0;
  BOOL v9 = [(PPTopicStorage *)self->_storage deleteAllTopicsFromSourcesWithBundleId:a3 groupId:a4 olderThanDate:a5 atLeastOneTopicRemoved:&v12 deletedCount:&v11 error:a7];
  if (v12) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  if (a6) {
    *a6 = v11;
  }
  return v9;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 algorithm:(unint64_t)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  char v12 = 0;
  unint64_t v11 = 0;
  BOOL v9 = [(PPTopicStorage *)self->_storage deleteAllTopicsFromSourcesWithBundleId:a3 documentIds:a4 algorithm:a5 atLeastOneTopicRemoved:&v12 deletedCount:&v11 error:a7];
  if (v12) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  if (a6) {
    *a6 = v11;
  }
  return v9;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  char v11 = 0;
  unint64_t v10 = 0;
  BOOL v8 = [(PPTopicStorage *)self->_storage deleteAllTopicsFromSourcesWithBundleId:a3 documentIds:a4 atLeastOneTopicRemoved:&v11 deletedCount:&v10 error:a6];
  if (v11) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  if (a5) {
    *a5 = v10;
  }
  return v8;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 algorithm:(unint64_t)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  char v9 = 0;
  BOOL v7 = [(PPTopicStorage *)self->_storage deleteAllTopicsWithTopicId:a3 algorithm:a4 atLeastOneTopicRemoved:&v9 deletedCount:a5 error:a6];
  if (v9) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  return v7;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  char v8 = 0;
  BOOL v6 = [(PPTopicStorage *)self->_storage deleteAllTopicsWithTopicId:a3 atLeastOneTopicRemoved:&v8 deletedCount:a4 error:a5];
  if (v8) {
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  }
  return v6;
}

- (BOOL)flushDonationsWithError:(id *)a3
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  locuint64_t k = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PPLocalTopicStore_flushDonationsWithError___block_invoke;
  v5[3] = &unk_1E65DA1B0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  if (*((unsigned char *)v7 + 24)) {
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsDidChangeMeaningfully");
  }
  _Block_object_dispose(&v6, 8);
  return 1;
}

void __45__PPLocalTopicStore_flushDonationsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = pp_topics_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "Flushing donations", v5, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3[8];
  v3[8] = 0;
}

- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9
{
  BOOL v11 = a6;
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v109 = [MEMORY[0x1E4F28B00] currentHandler];
    [v109 handleFailureInMethod:a2, self, @"PPLocalTopicStore.m", 1185, @"Invalid parameter not satisfying: %@", @"topics" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  id v110 = [MEMORY[0x1E4F28B00] currentHandler];
  [v110 handleFailureInMethod:a2, self, @"PPLocalTopicStore.m", 1186, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

LABEL_3:
  id v18 = pp_topics_log_handle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v15 count];
    uint64_t v20 = [MEMORY[0x1E4F89F98] describeAlgorithm:a5];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    long long v140 = v20;
    _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPLocalTopicStore received a donation of %tu topics from source: %@, algorithm: %@", buf, 0x20u);
  }
  id v21 = +[PPSettings sharedInstance];
  uint64_t v22 = [v16 bundleId];
  char v23 = [v21 bundleIdentifierIsEnabledForDonation:v22];

  if ((v23 & 1) == 0)
  {
    long long v28 = pp_topics_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v107 = [v16 bundleId];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v107;
      _os_log_debug_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEBUG, "Suppressed topic donation from disabled bundleId: %@", buf, 0xCu);
    }
    LOBYTE(v29) = 1;
    goto LABEL_71;
  }
  if (!v11) {
    goto LABEL_15;
  }
  id v24 = +[PPSettings sharedInstance];
  uint64_t v25 = [v16 bundleId];
  char v26 = [v24 bundleIdentifierIsEnabledForCloudKit:v25];

  if ((v26 & 1) == 0)
  {
    uint64_t v30 = pp_topics_log_handle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v108 = [v16 bundleId];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v108;
      _os_log_debug_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_DEBUG, "Suppressed topic cloudSync on donation from disabled bundleId: %@", buf, 0xCu);
    }
LABEL_15:
    unsigned int v27 = 0;
    goto LABEL_16;
  }
  unsigned int v27 = 1;
LABEL_16:
  id v114 = v15;
  id v115 = v17;
  id v116 = v16;
  if (a5 == 5
    && ([v16 documentId],
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        uint64_t v32 = *MEMORY[0x1E4F8A130],
        int v33 = [v31 hasPrefix:*MEMORY[0x1E4F8A130]],
        v31,
        v33))
  {
    unsigned int v113 = v27;
    id v34 = v15;
    id v35 = v16;
    id v36 = v35;
    uint64_t v112 = v34;
    if (self)
    {
      v120 = v35;
      id v122 = objc_opt_new();
      v37 = [(PPTrialWrapper *)self->_trialWrapper plistForFactorName:@"PhotosTopicMap.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
      long long v128 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      id v38 = v34;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v128 objects:buf count:16];
      uint64_t v111 = v32;
      if (!v39)
      {
        int v42 = 1;
        goto LABEL_69;
      }
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v129;
      uint64_t v119 = *MEMORY[0x1E4F89FD0];
      uint64_t v118 = *MEMORY[0x1E4F89FD8];
      int v42 = 1;
      while (1)
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v129 != v41) {
            objc_enumerationMutation(v38);
          }
          id v44 = *(void **)(*((void *)&v128 + 1) + 8 * v43);
          int v45 = [v44 item];
          id v46 = [v45 topicIdentifier];
          uint64_t v47 = [v37 objectForKeyedSubscript:v46];

          if (v47)
          {
            uint64_t v48 = [v44 item];
            uint64_t v49 = [v48 topicIdentifier];
            uint64_t v50 = [v37 objectForKeyedSubscript:v49];

            id v51 = objc_alloc(MEMORY[0x1E4F89F00]);
            uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F89F80]) initWithTopicIdentifier:v50];
            [v44 score];
            uint64_t v53 = objc_msgSend(v51, "initWithItem:score:", v52);

            [v122 addObject:v53];
LABEL_32:

            goto LABEL_33;
          }
          unint64_t v54 = pp_topics_log_handle();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            uint64_t v55 = [v44 item];
            uint64_t v56 = [v55 topicIdentifier];
            *(_DWORD *)long long v135 = 138739971;
            uint64_t v136 = (uint64_t)v56;
            _os_log_impl(&dword_1CA9A8000, v54, OS_LOG_TYPE_INFO, "PPLocalTopicStore: got unmatched photos topic: %{sensitive}@", v135, 0xCu);
          }
          if (a9)
          {
            id v57 = [NSString alloc];
            BOOL v58 = [v44 item];
            id v59 = [v58 topicIdentifier];
            uint64_t v60 = [v59 length];
            v61 = [v120 bundleId];
            uint64_t v50 = (void *)[v57 initWithFormat:@"No unmapping found for Photos topic to QID: topic.length:%tu donated from %@", v60, v61];

            v62 = pp_topics_log_handle();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long v135 = 138412290;
              uint64_t v136 = (uint64_t)v50;
              _os_log_error_impl(&dword_1CA9A8000, v62, OS_LOG_TYPE_ERROR, "%@", v135, 0xCu);
            }

            id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v133 = v118;
            long long v134 = v50;
            uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
            int v42 = 0;
            *a9 = (id)[v63 initWithDomain:v119 code:3 userInfo:v53];
            goto LABEL_32;
          }
          int v42 = 0;
LABEL_33:
          ++v43;
        }
        while (v40 != v43);
        uint64_t v64 = [v38 countByEnumeratingWithState:&v128 objects:buf count:16];
        uint64_t v40 = v64;
        if (!v64)
        {
LABEL_69:

          id v99 = objc_alloc(MEMORY[0x1E4F89F40]);
          id v36 = v120;
          v100 = [v120 bundleId];
          uint64_t v101 = [v120 groupId];
          v102 = [v120 documentId];
          v103 = [v102 stringByReplacingOccurrencesOfString:v111 withString:&stru_1F253DF18];
          v104 = [v120 date];
          id v105 = (void *)[v99 initWithBundleId:v100 groupId:v101 documentId:v103 date:v104];

          BOOL v29 = [(PPLocalTopicStore *)self donateTopics:v122 source:v105 algorithm:5 cloudSync:v113 sentimentScore:0 exactMatchesInSourceText:a9 error:a7] & v42;
          goto LABEL_70;
        }
      }
    }
    LOBYTE(v29) = 0;
LABEL_70:

    id v15 = v114;
    id v17 = v115;
    id v16 = v116;
  }
  else
  {
    unint64_t v123 = a5;
    id v65 = self;
    -[PPLocalTopicStore _coalesceScoredTopics:exactMatchesInSourceText:](self, v15, v17);
    id v66 = (id)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      id v67 = objc_opt_new();
      long long v128 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      id v68 = v66;
      uint64_t v69 = [v68 countByEnumeratingWithState:&v128 objects:buf count:16];
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = *(void *)v129;
        do
        {
          for (uint64_t i = 0; i != v70; ++i)
          {
            if (*(void *)v129 != v71) {
              objc_enumerationMutation(v68);
            }
            v73 = [*(id *)(*((void *)&v128 + 1) + 8 * i) first];
            [v67 addObject:v73];
          }
          uint64_t v70 = [v68 countByEnumeratingWithState:&v128 objects:buf count:16];
        }
        while (v70);
      }

      if ([v67 count])
      {
        double v74 = [(PPTopicBlocklist *)self->_blocklist indicesOfBlockedTopicsInScoredTopicArray:v67];
        if ([v74 count])
        {
          uint64_t v75 = [v67 count];
          uint64_t v76 = [v74 count];
          id v77 = pp_topics_log_handle();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            uint64_t v78 = [v67 count];
            *(_DWORD *)long long v135 = 134218240;
            uint64_t v136 = v78;
            __int16 v137 = 2048;
            uint64_t v138 = v75 - v76;
            _os_log_impl(&dword_1CA9A8000, v77, OS_LOG_TYPE_INFO, "PPLocalTopicStore filtering scored topic list from %tu to %tu", v135, 0x16u);
          }

          v79 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v67, "count"));
          [v79 removeIndexes:v74];
          id v65 = [v68 objectsAtIndexes:v79];

          id v17 = v115;
        }
        else
        {
          id v65 = v68;
        }
      }
      else
      {
        id v65 = v68;
      }
    }
    if ([v65 count])
    {
      v80 = objc_opt_new();
      v81 = objc_opt_new();
      long long v124 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id v82 = v65;
      uint64_t v83 = [v82 countByEnumeratingWithState:&v124 objects:v132 count:16];
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v85 = *(void *)v125;
        do
        {
          for (uint64_t j = 0; j != v84; ++j)
          {
            if (*(void *)v125 != v85) {
              objc_enumerationMutation(v82);
            }
            uint64_t v87 = *(void **)(*((void *)&v124 + 1) + 8 * j);
            unint64_t v88 = [v87 first];
            [v80 addObject:v88];

            uint64_t v89 = [v87 second];
            [v81 addObject:v89];
          }
          uint64_t v84 = [v82 countByEnumeratingWithState:&v124 objects:v132 count:16];
        }
        while (v84);
      }

      id v16 = v116;
      BOOL v29 = [(PPTopicStorage *)self->_storage donateTopics:v80 source:v116 algorithm:v123 cloudSync:v27 decayRate:v81 sentimentScore:a9 exactMatchesInSourceText:0.0 error:a7];
      id v15 = v114;
      if (v29)
      {
        v90 = [v116 bundleId];
        v91 = [v116 groupId];
        id v92 = v80;
        id v93 = v90;
        id v94 = v91;
        v95 = +[PPMetricsUtils loggingQueue];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __70__PPLocalTopicStore__logDonationForTopics_bundleId_algorithm_groupId___block_invoke;
        long long v140 = &unk_1E65DA228;
        id v96 = v93;
        id v141 = v96;
        long long v142 = self;
        id v97 = v92;
        id v143 = v97;
        unint64_t v145 = v123;
        id v98 = v94;
        id v144 = v98;
        dispatch_async(v95, buf);

        id v16 = v116;
        [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_331];
      }

      id v17 = v115;
    }
    else
    {
      LOBYTE(v29) = 1;
      id v16 = v116;
    }
  }
LABEL_71:

  return v29;
}

- (id)_coalesceScoredTopics:(void *)a3 exactMatchesInSourceText:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    BOOL v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    char v13 = __68__PPLocalTopicStore__coalesceScoredTopics_exactMatchesInSourceText___block_invoke;
    unint64_t v14 = &unk_1E65DA6F0;
    id v8 = v7;
    id v15 = v8;
    id v16 = v6;
    char v9 = (void *)MEMORY[0x1CB79D060]([v5 enumerateObjectsUsingBlock:&v11]);
    a1 = objc_msgSend(v8, "allValues", v11, v12, v13, v14);
  }
  return a1;
}

void __107__PPLocalTopicStore_donateTopics_source_algorithm_cloudSync_sentimentScore_exactMatchesInSourceText_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 8) = 1;
}

void __70__PPLocalTopicStore__logDonationForTopics_bundleId_algorithm_groupId___block_invoke(uint64_t a1)
{
  id v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setDonationSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(void *)(a1 + 32)));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 24) concatenatedTreatmentNames];
  [v8 setActiveTreatments:v2];

  id v3 = [MEMORY[0x1E4F93728] sharedInstance];
  objc_msgSend(v3, "trackScalarForMessage:count:", v8, objc_msgSend(*(id *)(a1 + 48), "count"));

  char v4 = objc_opt_new();
  objc_msgSend(v4, "setDonationSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(void *)(a1 + 32)));
  objc_msgSend(v4, "setAlgorithm:", +[PPMetricsUtils mapTopicAlgorithmForPET2:](PPMetricsUtils, "mapTopicAlgorithmForPET2:", *(void *)(a1 + 64)));
  id v5 = +[PPMetricsUtils filterGroupIdAllowance:*(void *)(a1 + 56)];
  [v4 setGroupId:v5];

  id v6 = [*(id *)(*(void *)(a1 + 40) + 24) concatenatedTreatmentNames];
  [v4 setActiveTreatments:v6];

  BOOL v7 = [MEMORY[0x1E4F93728] sharedInstance];
  objc_msgSend(v7, "trackDistributionForMessage:value:", v4, (double)(unint64_t)objc_msgSend(*(id *)(a1 + 48), "count"));
}

void __68__PPLocalTopicStore__coalesceScoredTopics_exactMatchesInSourceText___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v29 = v5;
  BOOL v7 = [v5 item];
  id v8 = [v6 objectForKeyedSubscript:v7];
  char v9 = [v8 first];

  unint64_t v10 = NSNumber;
  uint64_t v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  if ([v11 BOOLValue])
  {
    uint64_t v12 = [v10 numberWithInt:1];
  }
  else
  {
    char v13 = *(void **)(a1 + 32);
    unint64_t v14 = [v29 item];
    id v15 = [v13 objectForKeyedSubscript:v14];
    id v16 = [v15 second];
    uint64_t v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v16, "BOOLValue"));
  }
  if (v9)
  {
    id v17 = [v9 scoredTopic];
    [v17 score];
    double v19 = v18;
    [v29 score];
    long double v21 = v19 + v20 * exp2(-(double)[v9 occurrencesInSource]);

    id v22 = objc_alloc(MEMORY[0x1E4F89F00]);
    char v23 = [v29 item];
    id v24 = objc_msgSend(v22, "initWithItem:score:resultPosition:resultCount:", v23, objc_msgSend(v29, "resultPosition"), objc_msgSend(v29, "resultCount"), (double)v21);

    uint64_t v25 = -[PPCoalescedScoredTopic initWithScoredTopic:occurrencesInSource:]([PPCoalescedScoredTopic alloc], "initWithScoredTopic:occurrencesInSource:", v24, (unsigned __int16)([v9 occurrencesInSource] + 1));
  }
  else
  {
    uint64_t v25 = [[PPCoalescedScoredTopic alloc] initWithScoredTopic:v29 occurrencesInSource:1];
  }
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v25 second:v12];
  unsigned int v27 = *(void **)(a1 + 32);
  long long v28 = [v29 item];
  [v27 setObject:v26 forKeyedSubscript:v28];
}

- (id)topicExtractionsFromText:(id)a3 clientProcessName:(id)a4 error:(id *)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v9 = pp_topics_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v72 = [v7 length];
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPLocalTopicStore: topicExtractionsFromText called with text length %tu", buf, 0xCu);
  }

  unint64_t v10 = +[PPTopicExtractionPlugin sharedInstance];
  uint64_t v11 = [v10 extractionsFromText:v7 bundleId:v8];

  uint64_t v12 = pp_topics_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v52 = [v11 topicRecords];
    uint64_t v53 = [v52 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v72 = v53;
    _os_log_debug_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEBUG, "PPLocalTopicStore: topicExtractionsFromText found %tu topics", buf, 0xCu);
  }
  char v13 = [v11 topicRecords];

  if (v13)
  {
    id v55 = v8;
    id v56 = v7;
    unint64_t v14 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    unint64_t v54 = v11;
    id v15 = [v11 topicRecords];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v70 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v62 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          id v21 = objc_alloc(MEMORY[0x1E4F89F00]);
          id v22 = [v20 topic];
          [v20 initialScore];
          char v23 = objc_msgSend(v21, "initWithItem:score:", v22);
          [v14 addObject:v23];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v70 count:16];
      }
      while (v17);
    }

    if (self)
    {
      id v24 = -[PPLocalTopicStore _coalesceScoredTopics:exactMatchesInSourceText:](self, v14, 0);
      uint64_t v25 = objc_opt_new();
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v26 = v24;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:buf count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v66 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = [*(id *)(*((void *)&v65 + 1) + 8 * j) first];
            [v25 addObject:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:buf count:16];
        }
        while (v28);
      }

      id v32 = v25;
      if ([v32 count])
      {
        int v33 = [(PPTopicBlocklist *)self->_blocklist indicesOfBlockedTopicsInScoredTopicArray:v32];
        if ([v33 count])
        {
          uint64_t v34 = [v32 count];
          uint64_t v35 = [v33 count];
          id v36 = pp_topics_log_handle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            uint64_t v37 = [v32 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v72 = v37;
            __int16 v73 = 2048;
            uint64_t v74 = v34 - v35;
            _os_log_impl(&dword_1CA9A8000, v36, OS_LOG_TYPE_INFO, "PPLocalTopicStore filtering scored topic list from %tu to %tu", buf, 0x16u);
          }

          id v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v32, "count"));
          [v38 removeIndexes:v33];
          id v39 = [v32 objectsAtIndexes:v38];
        }
        else
        {
          id v39 = v32;
        }
        uint64_t v11 = v54;
      }
      else
      {
        id v32 = v32;
        id v39 = v32;
        uint64_t v11 = v54;
      }
    }
    else
    {
      id v32 = 0;
      id v39 = 0;
      uint64_t v11 = v54;
    }

    uint64_t v41 = pp_topics_log_handle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = [v39 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v72 = v42;
      _os_log_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_DEFAULT, "PPLocalTopicStore: topicExtractionsFromText finished coalescing and filtering with blocklist, %tu topics remain", buf, 0xCu);
    }

    uint64_t v43 = [v39 sortedArrayUsingComparator:&__block_literal_global_309];

    uint64_t v40 = objc_opt_new();
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v44 = v43;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v58;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v58 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = [*(id *)(*((void *)&v57 + 1) + 8 * k) scoredTopic];
          uint64_t v50 = [v49 item];
          [v40 addObject:v50];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v57 objects:v69 count:16];
      }
      while (v46);
    }

    id v8 = v55;
    id v7 = v56;
  }
  else
  {
    uint64_t v40 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v40;
}

uint64_t __70__PPLocalTopicStore_topicExtractionsFromText_clientProcessName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  id v6 = [a2 scoredTopic];
  [v6 score];
  double v8 = v7;
  char v9 = [v5 scoredTopic];

  [v9 score];
  uint64_t v11 = [v4 reverseCompareDouble:v8 withDouble:v10];

  return v11;
}

- (id)topicExtractionsFromText:(id)a3 error:(id *)a4
{
  return [(PPLocalTopicStore *)self topicExtractionsFromText:a3 clientProcessName:@"com.apple.proactive.PersonalizationPortrait.Internal" error:a4];
}

- (id)topicRecordsWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = pp_topics_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 limit];
    char v9 = [v6 fromDate];
    double v10 = [v9 description];
    uint64_t v11 = [v6 toDate];
    uint64_t v12 = [v11 description];
    *(_DWORD *)buf = 134218498;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    char v23 = v10;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "topicRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);
  }
  char v13 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__PPLocalTopicStore_topicRecordsWithQuery_error___block_invoke;
  v18[3] = &unk_1E65DBEA8;
  id v19 = v13;
  id v14 = v13;
  if ([(PPLocalTopicStore *)self iterTopicRecordsWithQuery:v6 error:a4 block:v18])
  {
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __49__PPLocalTopicStore_topicRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  -[PPLocalTopicStore _logParametersForQuery:client:method:]((uint64_t)self, v8, 0, @"iterTopicRecordsWithQuery");
  double v10 = pp_topics_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 limit];
    uint64_t v12 = [v8 fromDate];
    char v13 = [v12 description];
    id v14 = [v8 toDate];
    id v15 = [v14 description];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v41 = v15;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "iterTopicRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);
  }
  if ([v8 limit])
  {
    id v16 = (void *)[v8 copy];
    [v16 setLimit:-1];
    id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
    unint64_t v18 = [v8 limit];
    if (v18 >= 0x40) {
      uint64_t v19 = 64;
    }
    else {
      uint64_t v19 = v18;
    }
    double v20 = (void *)[v17 initWithCapacity:v19];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    char v39 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PPLocalTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke;
    aBlock[3] = &unk_1E65DA120;
    id v36 = v38;
    aBlock[4] = self;
    id v21 = v20;
    id v33 = v21;
    id v35 = v9;
    uint64_t v37 = buf;
    id v34 = v8;
    __int16 v22 = _Block_copy(aBlock);
    storage = self->_storage;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __59__PPLocalTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke_2;
    v28[3] = &unk_1E65DA148;
    id v24 = v21;
    id v29 = v24;
    uint64_t v25 = v22;
    id v30 = v25;
    uint64_t v31 = v38;
    BOOL v26 = [(PPTopicStorage *)storage iterTopicRecordsWithQuery:v16 error:a4 block:v28];
    if (v26) {
      v25[2](v25);
    }

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    LOBYTE(v26) = 1;
  }

  return v26;
}

- (void)_logParametersForQuery:(void *)a3 client:(void *)a4 method:
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v24 = v9;
    context = (void *)MEMORY[0x1CB79D060]();
    v25[0] = @"client";
    double v10 = v8;
    if (!v8)
    {
      double v10 = [MEMORY[0x1E4F1CA98] null];
    }
    v26[0] = v10;
    v25[1] = @"excludedBundleIds";
    uint64_t v11 = objc_msgSend(v7, "excludingSourceBundleIds", PPMetricsDispatcher);
    uint64_t v12 = [v11 allObjects];
    uint64_t v13 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @"");;
    id v14 = (void *)v13;
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    else {
      id v15 = &stru_1F253DF18;
    }
    v26[1] = v15;
    v25[2] = @"includedBundleIds";
    id v16 = [v7 matchingSourceBundleIds];
    id v17 = [v16 allObjects];
    uint64_t v18 = objc_msgSend(v17, "_pas_componentsJoinedByString:", @"");;
    uint64_t v19 = (void *)v18;
    if (v18) {
      double v20 = (__CFString *)v18;
    }
    else {
      double v20 = &stru_1F253DF18;
    }
    v26[2] = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    [v22 logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.TopicQueryReceived" payload:v21 inBackground:0];

    if (!v8) {
    id v9 = v24;
    }
  }
}

void __59__PPLocalTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1CB79D060]();
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    id v5 = v4;
    if (v3 && [v4 count])
    {
      id v6 = [*(id *)(v3 + 32) indicesOfBlockedTopicsInRecordArray:v5];
      if ([v6 count])
      {
        uint64_t v7 = [v5 count];
        uint64_t v8 = [v6 count];
        id v9 = pp_topics_log_handle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v24 = [v5 count];
          __int16 v25 = 2048;
          uint64_t v26 = v7 - v8;
          _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_INFO, "PPLocalTopicStore filtering topic record list from %tu to %tu", buf, 0x16u);
        }

        [v5 removeObjectsAtIndexes:v6];
      }
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
LABEL_11:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
        ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
        if (*(unsigned char *)(v15 + 24))
        {
          BOOL v16 = 1;
        }
        else
        {
          uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          BOOL v16 = v17 == objc_msgSend(*(id *)(a1 + 48), "limit", (void)v18);
          uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
        }
        *(unsigned char *)(v15 + 24) = v16;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12) {
            goto LABEL_11;
          }
          break;
        }
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "removeAllObjects", (void)v18);
}

uint64_t __59__PPLocalTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result == 64) {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return result;
}

- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = -[PPLocalTopicStore _topicTransformForId:]((uint64_t)self, v9);
  uint64_t v11 = [v10 QIDWeightsWithMappedTopicIdentifier:v8];
  uint64_t v12 = (void *)v11;
  if (a5 && !v11)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F89FD0];
    uint64_t v18 = *MEMORY[0x1E4F28588];
    uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Mapped topic ID (%@) not found in this mapping (%@).", v8, v9];
    v19[0] = v15;
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *a5 = [v13 errorWithDomain:v14 code:3 userInfo:v16];
  }
  return v12;
}

- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 clientProcessName:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  -[PPLocalTopicStore _logParametersForQuery:client:method:]((uint64_t)self, v10, v11, @"scoresForTopicMapping");
  id v58 = 0;
  id v12 = v9;
  id v13 = v10;
  id v14 = v11;
  uint64_t v15 = v14;
  uint64_t v53 = self;
  if (self)
  {
    BOOL v16 = -[PPEvictingMinPriorityQueue initWithCapacity:]([PPEvictingMinPriorityQueue alloc], "initWithCapacity:", [v13 limit]);
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __81__PPLocalTopicStore__defaultScoresForTopicMapping_query_clientProcessName_error___block_invoke;
    v59[3] = &unk_1E65DC338;
    uint64_t v17 = v16;
    long long v60 = v17;
    uint64_t v18 = self;
    long long v19 = v13;
    long long v20 = v13;
    long long v21 = v15;
    -[PPLocalTopicStore _defaultIterScoresForTopicMapping:query:error:clientProcessName:block:]((uint64_t)v18, v12, v20, &v58, v15, v59);
    id v22 = objc_alloc(MEMORY[0x1E4F1CA60]);
    [(PPEvictingMinPriorityQueue *)v17 count];
    uint64_t v24 = (void *)[v22 initWithCapacity:(unint64_t)v23];
    uint64_t v25 = [(PPEvictingMinPriorityQueue *)v17 count];
    if (v26 > 0.0)
    {
      do
      {
        uint64_t v27 = (void *)MEMORY[0x1CB79D060](v25);
        uint64_t v28 = [(PPEvictingMinPriorityQueue *)v17 popItem];
        id v29 = NSNumber;
        [v28 score];
        id v30 = objc_msgSend(v29, "numberWithDouble:");
        uint64_t v31 = [v28 item];
        [v24 setValue:v30 forKey:v31];

        uint64_t v25 = [(PPEvictingMinPriorityQueue *)v17 count];
      }
      while (v32 > 0.0);
    }
  }
  else
  {
    long long v19 = v13;
    long long v21 = v14;
    uint64_t v24 = 0;
  }
  id v33 = v21;

  id v34 = v58;
  -[PPLocalTopicStore _petLoggingForMappedTopicQuery:mappingId:count:clientProcessName:hasError:]((uint64_t)v53, v19, v12, [v24 count], v21, v24 == 0);
  unint64_t v35 = [v24 count];
  id v36 = +[PPConfiguration sharedInstance];
  int v37 = [v36 maxNumberMappedTopics];

  if (v35 <= v37)
  {
    -[PPLocalTopicStore _dpLoggingForMappingId:mappedTopics:]((uint64_t)v53, v12, v24);
    id v39 = v24;
  }
  else
  {
    id v51 = v34;
    uint64_t v52 = v12;
    context = (void *)MEMORY[0x1CB79D060]();
    id v38 = [v24 keysSortedByValueUsingComparator:&__block_literal_global_287];
    id v39 = (id)objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v40 = +[PPConfiguration sharedInstance];
    uint64_t v49 = v38;
    uint64_t v41 = objc_msgSend(v38, "subarrayWithRange:", 0, (int)objc_msgSend(v40, "maxNumberMappedTopics"));

    uint64_t v42 = [v41 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v47 = [v24 objectForKeyedSubscript:v46];
          [v39 setObject:v47 forKeyedSubscript:v46];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v54 objects:v61 count:16];
      }
      while (v43);
    }

    id v12 = v52;
    -[PPLocalTopicStore _dpLoggingForMappingId:mappedTopics:]((uint64_t)v53, v52, v39);

    id v34 = v51;
    id v33 = v21;
  }

  return v39;
}

- (void)_petLoggingForMappedTopicQuery:(void *)a3 mappingId:(uint64_t)a4 count:(void *)a5 clientProcessName:(char)a6 hasError:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  if (a1)
  {
    id v14 = +[PPMetricsUtils loggingQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__PPLocalTopicStore__petLoggingForMappedTopicQuery_mappingId_count_clientProcessName_hasError___block_invoke;
    v15[3] = &unk_1E65DA0F8;
    id v16 = v13;
    id v17 = v12;
    uint64_t v20 = a4;
    char v21 = a6;
    id v18 = v11;
    uint64_t v19 = a1;
    dispatch_async(v14, v15);
  }
}

- (void)_dpLoggingForMappingId:(void *)a3 mappedTopics:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = v5;
    if ([v7 isEqualToString:@"news-topics"])
    {
      id v8 = @"NewsTopic";
    }
    else
    {
      if (![v7 isEqualToString:@"podcasts-topics"])
      {
        int v33 = [v7 isEqualToString:@"high-level-topics"];
        if (v33) {
          id v34 = @"HighLevelTopic";
        }
        else {
          id v34 = 0;
        }

        id v9 = v34;
        if (!v33)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_7:
        id v35 = v5;
        id v10 = [NSString alloc];
        id v11 = [MEMORY[0x1E4F1CA20] currentLocale];
        id v12 = [v11 localeIdentifier];
        id v13 = (void *)[v10 initWithFormat:@"%@.%@.%@", @"com.apple.PersonalizationPortrait", v9, v12];

        id v14 = [v6 allValues];
        uint64_t v15 = objc_msgSend(v14, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1F256B260, &__block_literal_global_294_20651);
        [v15 doubleValue];
        double v17 = v16;

        id v18 = objc_opt_new();
        [v18 nextDouble];
        double v20 = v19;

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        char v21 = [v6 allKeys];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v37;
          double v25 = 0.0;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              uint64_t v28 = (void *)MEMORY[0x1CB79D060]();
              id v29 = [v6 objectForKeyedSubscript:v27];
              [v29 doubleValue];
              double v25 = v25 + v30;

              if (v25 / v17 >= v20)
              {
                uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:v13];
                uint64_t v40 = v27;
                double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
                [v31 record:v32];

                goto LABEL_17;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v41 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
LABEL_17:

        id v5 = v35;
        goto LABEL_18;
      }
      id v8 = @"PodcastTopic";
    }

    id v9 = v8;
    goto LABEL_7;
  }
LABEL_19:
}

id __57__PPLocalTopicStore__dpLoggingForMappingId_mappedTopics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1CB79D060]();
  id v7 = NSNumber;
  [v4 doubleValue];
  double v9 = v8;
  [v5 doubleValue];
  id v11 = [v7 numberWithDouble:v9 + v10];

  return v11;
}

uint64_t __73__PPLocalTopicStore_scoresForTopicMapping_query_error_clientProcessName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void __95__PPLocalTopicStore__petLoggingForMappedTopicQuery_mappingId_count_clientProcessName_hasError___block_invoke(uint64_t a1)
{
  id v9 = (id)objc_opt_new();
  [v9 setBundleId:*(void *)(a1 + 32)];
  [v9 setMappingId:*(void *)(a1 + 40)];
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    unint64_t v3 = (unint64_t)log10((double)v2);
  }
  else {
    unint64_t v3 = 0;
  }
  [v9 setResultSizeLog10:v3];
  id v4 = [*(id *)(a1 + 48) fromDate];
  [v9 setTimeLimited:v4 != 0];

  objc_msgSend(v9, "setLimitHit:", *(void *)(a1 + 64) > (unint64_t)objc_msgSend(*(id *)(a1 + 48), "limit"));
  id v5 = [*(id *)(a1 + 48) scoringDate];
  [v9 setTimeSpec:v5 != 0];

  id v6 = [*(id *)(a1 + 48) excludingSourceBundleIds];
  objc_msgSend(v9, "setExclusionSpec:", objc_msgSend(v6, "count") != 0);

  [v9 setError:*(unsigned __int8 *)(a1 + 72)];
  id v7 = [*(id *)(*(void *)(a1 + 56) + 24) concatenatedTreatmentNames];
  [v9 setActiveTreatments:v7];

  double v8 = [MEMORY[0x1E4F93728] sharedInstance];
  [v8 trackScalarForMessage:v9];
}

void __81__PPLocalTopicStore__defaultScoresForTopicMapping_query_clientProcessName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F89F00];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  [v6 doubleValue];
  double v10 = v9;

  id v11 = (id)[v8 initWithItem:v7 score:v10];
  [*(id *)(a1 + 32) addObject:v11];
}

- (uint64_t)_defaultIterScoresForTopicMapping:(void *)a3 query:(void *)a4 error:(void *)a5 clientProcessName:(void *)a6 block:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = v12;
  id v56 = v13;
  id v58 = a6;
  long long v54 = (void *)a1;
  long long v55 = v11;
  long long v60 = -[PPLocalTopicStore _topicTransformForId:](a1, v11);
  uint64_t v15 = [v60 outputTopicCount];
  if (v15 && [v12 limit])
  {
    uint64_t v53 = (void *)[v12 copy];
    [v53 setLimit:-1];
    uint64_t v66 = 0;
    long long v67 = (int *)&v66;
    uint64_t v68 = 0x2020000000;
    int v69 = 0;
    double v16 = objc_opt_new();
    double v17 = objc_opt_new();
    id v65 = 0;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __91__PPLocalTopicStore__defaultIterScoresForTopicMapping_query_error_clientProcessName_block___block_invoke;
    v61[3] = &unk_1E65DA090;
    id v50 = v16;
    id v62 = v50;
    id v51 = v17;
    id v63 = v51;
    long long v64 = &v66;
    unsigned int v57 = [v54 iterScoredTopicsWithQuery:v53 error:&v65 clientProcessName:0 block:v61];
    id v52 = v65;
    if (v57)
    {
      id v18 = v51;
      uint64_t v19 = [v18 mutableBytes];
      [v60 applyFeatureSmoothing:v19 vectorLength:v67[6]];
      id v20 = v18;
      uint64_t v21 = [v20 mutableBytes];
      [v60 applyFeatureScaling:v21 vectorLength:v67[6]];
      id v22 = v20;
      uint64_t v23 = [v22 mutableBytes];
      [v60 applyFeatureNormalization:v23 vectorLength:v67[6]];
      uint64_t v24 = [v50 mutableBytes];
      uint64_t v25 = [v22 mutableBytes];
      double v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * (int)v15];
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2 * (int)v15];
      id v49 = v26;
      uint64_t v28 = [v49 mutableBytes];
      id v48 = v27;
      uint64_t v29 = [v48 mutableBytes];
      if (v67[6] >= 1)
      {
        uint64_t v31 = 0;
        do
        {
          LODWORD(v30) = *(_DWORD *)(v25 + 4 * v31);
          [v60 addWeightedTopicScoreToBuffer:v28 countNonZeroComponentsInBuffer:v29 qid:*(unsigned int *)(v24 + 4 * v31++) score:v30];
        }
        while (v31 < v67[6]);
      }
      [v60 applyOutputScaling:v28 vectorLength:v15];
      if ([v14 scoreWithBiases]) {
        [v60 addBias:v28];
      }
      [v60 applyOutputActivation:v28];
      uint64_t v59 = 0;
      uint64_t v32 = 0;
      buf[0] = 0;
      if (v15 <= 1) {
        uint64_t v33 = 1;
      }
      else {
        uint64_t v33 = v15;
      }
      while (1)
      {
        float v34 = *(float *)(v28 + 4 * v32);
        [v60 threshold];
        if (v34 <= v35) {
          goto LABEL_24;
        }
        unint64_t v36 = *(unsigned __int16 *)(v29 + 2 * v32);
        if ([v14 minimumComponentCount] > v36) {
          goto LABEL_24;
        }
        long long v37 = (void *)MEMORY[0x1CB79D060]();
        if (!buf[0]) {
          break;
        }
LABEL_23:
        ++v59;
LABEL_24:
        if (v33 == ++v32)
        {
          -[PPLocalTopicStore _petLoggingForMappedTopicQuery:mappingId:count:clientProcessName:hasError:]((uint64_t)v54, v14, v55, v59, v56, 0);

          goto LABEL_32;
        }
      }
      long long v38 = v14;
      long long v39 = [v60 payloadForTopic:v32];
      if (!v39)
      {
        uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
        [v45 handleFailureInMethod:sel__defaultIterScoresForTopicMapping_query_error_clientProcessName_block_, v54, @"PPLocalTopicStore.m", 732, @"Invalid parameter not satisfying: %@", @"topicName" object file lineNumber description];
      }
      uint64_t v40 = [v14 matchingMappedTopicIds];
      if (v40)
      {
        uint64_t v42 = [v14 matchingMappedTopicIds];
        unsigned __int8 v43 = [v42 containsObject:v39];

        id v14 = v38;
        if (((v39 != 0) & v43) == 0) {
          goto LABEL_22;
        }
      }
      else if (!v39)
      {
LABEL_22:

        goto LABEL_23;
      }
      LODWORD(v41) = *(_DWORD *)(v28 + 4 * v32);
      uint64_t v44 = [NSNumber numberWithFloat:v41];
      v58[2](v58, v39, v44, buf);

      id v14 = v38;
      goto LABEL_22;
    }
    uint64_t v46 = pp_topics_log_handle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v71 = v52;
      _os_log_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_DEFAULT, "Encountered an error iterating scored topics: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v52;
    }
    -[PPLocalTopicStore _petLoggingForMappedTopicQuery:mappingId:count:clientProcessName:hasError:]((uint64_t)v54, v14, v11, 0, v56, 1);
LABEL_32:

    _Block_object_dispose(&v66, 8);
  }
  else
  {
    unsigned int v57 = 1;
  }

  return v57;
}

void __91__PPLocalTopicStore__defaultIterScoresForTopicMapping_query_error_clientProcessName_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 item];
  id v5 = [v4 topicIdentifier];
  unint64_t v6 = [v5 length];
  if (v6 < 0xC
    && (int v11 = 0,
        uint64_t v10 = 0,
        objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v10, 11, 0, 1, 0, 0, v6, 0), v10 == 81))
  {
    int v7 = atol((const char *)&v10 + 1);

    LODWORD(v10) = v7;
    if (v7 != -1)
    {
      [*(id *)(a1 + 32) appendBytes:&v10 length:4];
      [v3 score];
      *(float *)&double v8 = v8;
      int v9 = LODWORD(v8);
      [*(id *)(a1 + 40) appendBytes:&v9 length:4];
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
  else
  {
  }
}

- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5
{
  return [(PPLocalTopicStore *)self scoresForTopicMapping:a3 query:a4 error:a5 clientProcessName:0];
}

- (BOOL)iterScoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 block:(id)a6
{
  if (self) {
    LOBYTE(self) = -[PPLocalTopicStore _defaultIterScoresForTopicMapping:query:error:clientProcessName:block:]((uint64_t)self, a3, a4, a5, 0, a6);
  }
  return (char)self;
}

- (BOOL)iterScoredTopicsWithQuery:(id)a3 error:(id *)a4 clientProcessName:(id)a5 block:(id)a6
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v62 = a5;
  id v10 = a6;
  int v11 = [v9 scoringDate];
  uint64_t v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  id v14 = v13;

  self;
  id v65 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_TP_Agg.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
  self;
  id v63 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_TP_Final.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
  uint64_t v15 = 0;
  if (v65 && v63)
  {
    uint64_t v16 = +[PPStreamingTopicScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingTopicScorer, v65);
    uint64_t v15 = +[PPStreamingTopicScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingTopicScorer, v63) | v16;
  }
  storage = self->_storage;
  id v18 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F25698C0, 0);
  id v20 = [(PPTopicStorage *)storage sourceStats:v15 withExcludedAlgorithms:v19];

  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = __Block_byref_object_copy__20507;
  v100[4] = __Block_byref_object_dispose__20508;
  id v101 = 0;
  uint64_t v96 = 0;
  id v97 = (unsigned int *)&v96;
  uint64_t v98 = 0x2020000000;
  int v99 = 0;
  uint64_t v92 = 0;
  id v93 = (unsigned int *)&v92;
  uint64_t v94 = 0x2020000000;
  int v95 = 0;
  uint64_t v21 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPLocalTopicStore-processing" qosClass:qos_class_self()];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke;
  aBlock[3] = &unk_1E65D9FF0;
  aBlock[4] = self;
  id v59 = v14;
  id v84 = v59;
  id v64 = v9;
  id v85 = v64;
  id v60 = v20;
  id v86 = v60;
  uint64_t v89 = v100;
  v90 = &v92;
  v91 = &v96;
  id v61 = v21;
  id v87 = v61;
  id v58 = v10;
  id v88 = v58;
  id v22 = _Block_copy(aBlock);
  *(void *)id v105 = 0;
  *(void *)&v105[8] = v105;
  *(void *)&v105[16] = 0x3032000000;
  *(void *)&v105[24] = __Block_byref_object_copy__20507;
  v106 = __Block_byref_object_dispose__20508;
  id v107 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy__20507;
  v81[4] = __Block_byref_object_dispose__20508;
  id v82 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__20507;
  v79[4] = __Block_byref_object_dispose__20508;
  id v80 = 0;
  uint64_t v23 = pp_topics_signpost_handle();
  os_signpost_id_t v24 = os_signpost_id_generate(v23);

  uint64_t v25 = pp_topics_signpost_handle();
  double v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PPLocalTopicStore.iterScoredTopicsWithQuery.aggregation", "", buf, 2u);
  }

  uint64_t v27 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPLocalTopicStore-scoring" qosClass:qos_class_self()];
  dispatch_semaphore_t v28 = dispatch_semaphore_create(64);
  uint64_t v29 = (void *)[v64 copy];
  [v29 setOrderByIdentifier:1];
  [v29 setRemoveNearDuplicates:1];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_256;
  v71[3] = &unk_1E65DA040;
  uint64_t v76 = v105;
  id v77 = v81;
  uint64_t v78 = v79;
  double v30 = v28;
  uint64_t v72 = v30;
  uint64_t v31 = v27;
  __int16 v73 = v31;
  id v32 = v22;
  uint64_t v74 = self;
  id v75 = v32;
  uint64_t v33 = v71;
  float v34 = (void *)[v29 copy];
  [v34 setLimit:-1];
  id v102 = 0;
  BOOL v66 = [(PPLocalTopicStore *)self iterTopicRecordsWithQuery:v34 error:&v102 block:v33];

  id v35 = v102;
  if (v66)
  {
    id v36 = 0;
  }
  else
  {
    long long v37 = pp_topics_log_handle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v104 = v35;
      _os_log_error_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_ERROR, "_unlimitedTopicRecordsWithQuery: nil result from iterTopicRecordsWithQuery: %@", buf, 0xCu);
    }

    id v36 = v35;
  }

  id v38 = v36;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_261;
  block[3] = &unk_1E65DA068;
  int v69 = v81;
  id v39 = v32;
  id v68 = v39;
  uint64_t v70 = v79;
  dispatch_sync(v31, block);
  uint64_t v40 = pp_topics_signpost_handle();
  double v41 = v40;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v41, OS_SIGNPOST_INTERVAL_END, v24, "PPLocalTopicStore.iterScoredTopicsWithQuery.aggregation", "", buf, 2u);
  }

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);

  _Block_object_dispose(v105, 8);
  if (v66)
  {
    signed int v42 = atomic_load(v93 + 6);
    signed int v43 = atomic_load(v97 + 6);
    uint64_t v44 = pp_topics_log_handle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v45 = atomic_load(v93 + 6);
      uint64_t v46 = +[PPConfiguration sharedInstance];
      [v46 scoreThresholdForTopic];
      *(_DWORD *)id v105 = 67109632;
      *(_DWORD *)&v105[4] = v45;
      *(_WORD *)&v105[8] = 2048;
      *(double *)&v105[10] = v47;
      *(_WORD *)&v105[18] = 2048;
      *(void *)&v105[20] = v43 + (uint64_t)v42;
      _os_log_impl(&dword_1CA9A8000, v44, OS_LOG_TYPE_DEFAULT, "PPLocalTopicStore: filtered %d items below threshold of %f out of %tu total.", v105, 0x1Cu);
    }
    signed int v48 = atomic_load(v97 + 6);
    id v49 = v64;
    id v50 = v62;
    id v51 = +[PPMetricsUtils loggingQueue];
    uint64_t v52 = v48;
    *(void *)id v105 = MEMORY[0x1E4F143A8];
    *(void *)&v105[8] = 3221225472;
    *(void *)&v105[16] = __74__PPLocalTopicStore__petLoggingForQuery_count_clientProcessName_hasError___block_invoke;
    *(void *)&v105[24] = &unk_1E65DC5D8;
    uint64_t v53 = (void (*)(uint64_t))v50;
    v106 = v53;
    uint64_t v109 = v52;
    id v54 = v49;
    char v110 = 0;
    id v107 = v54;
    uint64_t v108 = self;
    dispatch_async(v51, v105);
  }
  else
  {
    long long v55 = pp_default_log_handle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v105 = 138412290;
      *(void *)&v105[4] = v38;
      _os_log_error_impl(&dword_1CA9A8000, v55, OS_LOG_TYPE_ERROR, "Error encountered while scoring named entities: %@", v105, 0xCu);
    }

    if (a4) {
      *a4 = v38;
    }
  }

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(v100, 8);

  return v66;
}

void __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    int v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) decayRate];
    id v10 = objc_msgSend(v7, "scoreTopics:scoringDate:decayRate:strictFiltering:sourceStats:decayedFeedbackCounts:streamingScorer:mlModel:", v5, v8, objc_msgSend(*(id *)(a1 + 48), "scoreWithStrictFiltering"), *(void *)(a1 + 56), v6, *(void *)(*(void *)(a1 + 80) + 8) + 40, v9, 0);
    if (v10)
    {
      atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1u);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_2;
      block[3] = &unk_1E65DA2E8;
      int v11 = *(NSObject **)(a1 + 64);
      id v14 = *(id *)(a1 + 72);
      id v13 = v10;
      dispatch_sync(v11, block);
    }
    else
    {
      atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 88) + 8) + 24), 1u);
    }
  }
}

void __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_256(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v5 = [v3 topic];
  id v6 = [v5 clusterIdentifier];
  LOBYTE(v4) = [v4 isEqualToString:v6];

  int v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if ((v4 & 1) == 0)
  {
    id v8 = v7;
    id v9 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (![v8 count]) {
      goto LABEL_8;
    }
    id v10 = +[PPConfiguration sharedInstance];
    if ([v10 use2StageScoreInterpreterForTPScoring])
    {
    }
    else
    {
      int v11 = +[PPConfiguration sharedInstance];
      int v12 = [v11 topicScoringUsesHybrid];

      if (!v12) {
        goto LABEL_8;
      }
    }
    [MEMORY[0x1E4F93B18] waitForSemaphore:*(void *)(a1 + 32)];
    id v13 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_2_257;
    block[3] = &unk_1E65DA018;
    id v39 = *(id *)(a1 + 56);
    id v36 = v8;
    id v37 = v9;
    id v38 = *(id *)(a1 + 32);
    dispatch_async(v13, block);

LABEL_8:
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    double v17 = [v3 topic];
    uint64_t v18 = [v17 clusterIdentifier];
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v21 = [v3 topic];
    id v22 = [v21 clusterIdentifier];

    if (v22)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v23 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 80), "decayedFeedbackCountsForClusterIdentifier:");
      uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      double v26 = pp_default_log_handle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        uint64_t v33 = [v3 topic];
        float v34 = [v33 topicIdentifier];
        *(_DWORD *)buf = 138412290;
        double v41 = v34;
        _os_log_fault_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_FAULT, "Topic record unexpectedly had nil cluster identifier while aggregating for scoring. %@", buf, 0xCu);
      }
      uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8);
      dispatch_semaphore_t v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = 0;

      uint64_t v25 = objc_opt_new();
      uint64_t v29 = [v25 UUIDString];
      uint64_t v30 = [v29 lowercaseString];
      uint64_t v31 = *(void *)(*(void *)(a1 + 64) + 8);
      id v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;
    }
    goto LABEL_15;
  }
  [v7 addObject:v3];
LABEL_16:
}

uint64_t __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_261(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

void __74__PPLocalTopicStore__petLoggingForQuery_count_clientProcessName_hasError___block_invoke(uint64_t a1)
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
  objc_msgSend(v9, "setLimitHit:", *(void *)(a1 + 56) > (unint64_t)objc_msgSend(*(id *)(a1 + 40), "limit"));
  id v4 = [*(id *)(a1 + 40) scoringDate];
  [v9 setTimeSpec:v4 != 0];

  id v5 = [*(id *)(a1 + 40) fromDate];
  [v9 setTimeLimited:v5 != 0];

  id v6 = [*(id *)(a1 + 40) excludingSourceBundleIds];
  objc_msgSend(v9, "setExclusionSpec:", objc_msgSend(v6, "count") != 0);

  [v9 setError:*(unsigned __int8 *)(a1 + 64)];
  int v7 = [*(id *)(*(void *)(a1 + 48) + 24) concatenatedTreatmentNames];
  [v9 setActiveTreatments:v7];

  id v8 = [MEMORY[0x1E4F93728] sharedInstance];
  [v8 trackScalarForMessage:v9];
}

intptr_t __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_2_257(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  unint64_t v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

uint64_t __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4 clientProcessName:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[PPLocalTopicStore _logParametersForQuery:client:method:]((uint64_t)self, v9, v8, @"rankedTopicsWithQuery");
  id v10 = (void *)[v9 copy];
  [v10 setLimit:-1];
  char v11 = [v9 scoreWithCalibration];
  int v12 = +[PPConfiguration sharedInstance];
  id v13 = [v12 topicCalibrationTrie];

  uint64_t v14 = [PPEvictingMinPriorityQueue alloc];
  uint64_t v15 = [v9 limit];

  uint64_t v16 = [(PPEvictingMinPriorityQueue *)v14 initWithCapacity:v15];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__PPLocalTopicStore_rankedTopicsWithQuery_error_clientProcessName___block_invoke;
  v21[3] = &unk_1E65D9FC8;
  char v24 = v11;
  id v22 = v13;
  uint64_t v23 = v16;
  double v17 = v16;
  id v18 = v13;
  [(PPLocalTopicStore *)self iterScoredTopicsWithQuery:v10 error:a4 clientProcessName:v8 block:v21];

  uint64_t v19 = [(PPEvictingMinPriorityQueue *)v17 extractSortedMutableArray];

  return v19;
}

void __67__PPLocalTopicStore_rankedTopicsWithQuery_error_clientProcessName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    if (*(unsigned char *)(a1 + 48))
    {
      id v6 = v3;
      uint64_t v5 = +[PPLocalTopicStore calibrateScoredTopic:v3 calibrationTrie:*(void *)(a1 + 32)];

      id v4 = (id)v5;
    }
    id v7 = v4;
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4
{
  return [(PPLocalTopicStore *)self rankedTopicsWithQuery:a3 error:a4 clientProcessName:0];
}

- (id)scoreTopics:(id)a3 scoringDate:(id)a4 decayRate:(double)a5 strictFiltering:(BOOL)a6 sourceStats:(id)a7 decayedFeedbackCounts:(id)a8 streamingScorer:(id *)a9 mlModel:(id)a10
{
  BOOL v13 = a6;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  if (![v16 count])
  {
    char v24 = 0;
    goto LABEL_52;
  }
  id v122 = v16;
  id v20 = v16;
  id v128 = v17;
  id v21 = v18;
  id v22 = v19;
  if (!self)
  {
    long long v127 = v21;
    char v24 = 0;
    goto LABEL_51;
  }
  id v120 = v19;
  id v121 = v18;
  uint64_t v119 = MEMORY[0x1CB79D060]();
  unint64_t v123 = self;
  if (v21)
  {
    long long v126 = 0;
    long long v127 = v21;
    uint64_t v23 = 0;
  }
  else
  {
    self;
    uint64_t v23 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_TP_Agg.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
    self;
    uint64_t v25 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_TP_Final.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
    double v26 = (void *)v25;
    uint64_t v27 = 0;
    if (v23 && v25)
    {
      uint64_t v28 = +[PPStreamingTopicScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingTopicScorer, v23);
      uint64_t v27 = +[PPStreamingTopicScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingTopicScorer, v26) | v28;
    }
    long long v126 = v26;
    storage = self->_storage;
    uint64_t v30 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F25698C0, 0);
    long long v127 = [(PPTopicStorage *)storage sourceStats:v27 withExcludedAlgorithms:v31];
  }
  id v32 = [v20 objectAtIndexedSubscript:0];
  uint64_t v33 = [v32 topic];

  id v34 = objc_alloc(MEMORY[0x1E4F89F80]);
  uint64_t v118 = v33;
  id v35 = [v33 topicIdentifier];
  id v36 = [v20 objectAtIndexedSubscript:0];
  uint64_t v124 = [v34 initWithTopicIdentifier:v35 mostRelevantRecord:v36];

  id v37 = (id *)*a9;
  long long v125 = v23;
  if (!*a9)
  {
    id v38 = [PPStreamingTopicScorer alloc];
    id v117 = v128;
    id v39 = v127;
    if (v38
      && (*(void *)__int16 v137 = v38,
          *(void *)&v137[8] = PPStreamingTopicScorer,
          (uint64_t v40 = objc_msgSendSuper2((objc_super *)v137, sel_init)) != 0))
    {
      double v41 = v40;
      unsigned int v116 = v13;
      self;
      uint64_t v42 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_TP_Agg.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
      if (v42)
      {
        signed int v43 = (void *)v42;
        id v114 = v22;
        id v115 = v17;
        self;
        uint64_t v44 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_TP_Final.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
        if (v44)
        {
          uint64_t v45 = v44;
          float v46 = *MEMORY[0x1E4F8A128];
          float v47 = v43;
          signed int v48 = [[PPScoreInterpreter alloc] initWithBytecode:v43];
          id v49 = (void *)v41[1];
          v41[1] = v48;

          id v50 = [[PPScoreInterpreter alloc] initWithBytecode:v45];
          id v51 = (void *)v41[2];
          v41[2] = v50;

          uint64_t v52 = [PPScoreDict alloc];
          unsigned int v113 = (void *)v45;
          uint64_t v53 = objc_opt_new();
          id v54 = [(PPScoreDict *)v52 initWithScoreInputSet:v53];

          *(float *)&double v55 = v46;
          [(PPScoreDict *)v54 setScalarValue:2 forIndex:v55];
          *(float *)&double v56 = (float)[v39 minRefCount];
          [(PPScoreDict *)v54 setScalarValue:6 forIndex:v56];
          *(float *)&double v57 = (float)[v39 maxRefCount];
          [(PPScoreDict *)v54 setScalarValue:7 forIndex:v57];
          [v39 avgRefCount];
          *(float *)&double v58 = v58;
          [(PPScoreDict *)v54 setScalarValue:8 forIndex:v58];
          [v39 medianRefCount];
          *(float *)&double v59 = v59;
          [(PPScoreDict *)v54 setScalarValue:9 forIndex:v59];
          *(float *)&double v60 = (float)[v39 uniqueBundleIdCount];
          [(PPScoreDict *)v54 setScalarValue:10 forIndex:v60];
          *(float *)&double v61 = (float)[v39 uniqueDocIdCount];
          [(PPScoreDict *)v54 setScalarValue:11 forIndex:v61];
          *(float *)&double v62 = (float)(unint64_t)[v39 recordCount];
          [(PPScoreDict *)v54 setScalarValue:23 forIndex:v62];
          *(float *)&double v63 = (float)v116;
          [(PPScoreDict *)v54 setScalarValue:16 forIndex:v63];
          id v64 = (void *)MEMORY[0x1E4F1CA20];
          id v65 = [MEMORY[0x1E4F1CA20] currentLocale];
          BOOL v66 = [v65 localeIdentifier];
          long long v67 = [v64 componentsFromLocaleIdentifier:v66];
          id v68 = [v67 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
          [(PPScoreDict *)v54 setObject:v68 forIndex:5];

          int v69 = v117;
          [(PPScoreDict *)v54 setObject:v117 forIndex:7];
          uint64_t v70 = [v39 earliestDate];
          [(PPScoreDict *)v54 setObject:v70 forIndex:9];

          id v71 = [v39 latestDate];
          [(PPScoreDict *)v54 setObject:v71 forIndex:10];

          uint64_t v72 = v113;
          __int16 v73 = (void *)v41[3];
          v41[3] = v54;
        }
        else
        {
          uint64_t v72 = v43;
          float v47 = v41;
          double v41 = 0;
          int v69 = v117;
        }
        uint64_t v74 = v41;

        double v41 = v47;
        id v22 = v114;
        id v17 = v115;
      }
      else
      {
        uint64_t v74 = 0;
        int v69 = v117;
      }
    }
    else
    {
      uint64_t v74 = 0;
      int v69 = v117;
    }

    id v75 = *a9;
    *a9 = v74;

    id v76 = self;
    id v77 = self;
    id v37 = (id *)*a9;
  }
  uint64_t v78 = [v20 objectAtIndexedSubscript:0];
  if (v37)
  {
    id v79 = v37[3];
    id v80 = v22;
    [v80 engagedExplicitly];
    *(float *)&double v81 = v81;
    [v79 setScalarValue:12 forIndex:v81];
    [v80 engagedImplicitly];
    *(float *)&double v82 = v82;
    [v79 setScalarValue:13 forIndex:v82];
    [v80 rejectedExplicitly];
    *(float *)&double v83 = v83;
    [v79 setScalarValue:14 forIndex:v83];
    [v80 rejectedImplicitly];
    *(float *)&double v84 = v84;
    [v79 setScalarValue:15 forIndex:v84];
    id v85 = [v80 latestDate];

    [v79 setObject:v85 forIndex:11];
  }
  id v86 = v22;

  id v87 = +[PPConfiguration sharedInstance];
  int v88 = [v87 topicScoringUsesHybrid];

  uint64_t v89 = v123;
  if (v88)
  {
    v90 = [(NSCache *)v123->_modelCache objectForKey:@"scoring_model"];
    v91 = (void *)v124;
    if (!v90)
    {
      trialWrapper = v123->_trialWrapper;
      *(void *)&long long v129 = 0;
      v90 = [(PPTrialWrapper *)trialWrapper mlModelForModelName:@"PPModel_TP.mlmodelc" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS" error:&v129];
      id v93 = (id)v129;
      if (v93)
      {
        uint64_t v94 = pp_topics_log_handle();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int16 v137 = 138412802;
          *(void *)&v137[4] = v93;
          *(_WORD *)&v137[12] = 2112;
          *(void *)&v137[14] = @"PPModel_TP.mlmodelc";
          __int16 v138 = 2112;
          long long v139 = @"PERSONALIZATION_PORTRAIT_TOPICS";
          _os_log_error_impl(&dword_1CA9A8000, v94, OS_LOG_TYPE_ERROR, "PPlocalTopciStore: error %@ in retrieving %@ model with namespace %@", v137, 0x20u);
        }

        v91 = (void *)v124;
      }

      if (!v90)
      {
        uint64_t v111 = pp_topics_log_handle();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int16 v137 = 0;
          _os_log_error_impl(&dword_1CA9A8000, v111, OS_LOG_TYPE_ERROR, "PPLocalTopicStore: unable to locate ML model.", v137, 2u);
        }

        char v24 = 0;
        id v19 = v120;
        id v18 = v121;
        id v97 = (void *)v119;
        goto LABEL_49;
      }
      uint64_t v89 = v123;
      [(NSCache *)v123->_modelCache setObject:v90 forKey:@"scoring_model"];
    }
    [(PPLocalTopicStore *)v89 finalScoreFromRecordsUsingHybrid:v20 streamingScorer:*a9 mlModel:v90];
    double v96 = v95;

    id v97 = (void *)v119;
  }
  else
  {
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id v98 = v20;
    uint64_t v99 = [v98 countByEnumeratingWithState:&v129 objects:v137 count:16];
    if (v99)
    {
      uint64_t v100 = v99;
      uint64_t v101 = *(void *)v130;
      do
      {
        for (uint64_t i = 0; i != v100; ++i)
        {
          if (*(void *)v130 != v101) {
            objc_enumerationMutation(v98);
          }
          -[PPStreamingTopicScorer addRecord:]((uint64_t)*a9, *(void **)(*((void *)&v129 + 1) + 8 * i));
        }
        uint64_t v100 = [v98 countByEnumeratingWithState:&v129 objects:v137 count:16];
      }
      while (v100);
    }

    if (*a9) {
      double v96 = -[PPStreamingTopicScorer getFinalScoreWithAggregationResultOut:finalResultOut:]((uint64_t)*a9, 0);
    }
    else {
      double v96 = 0.0;
    }
    id v97 = (void *)v119;
    v91 = (void *)v124;
  }
  v103 = +[PPConfiguration sharedInstance];
  [v103 scoreThresholdForTopic];
  float v105 = v104;

  if (v96 <= 0.0) {
    int v106 = 1;
  }
  else {
    int v106 = v88;
  }
  id v22 = v86;
  if (v106 == 1)
  {
    double v107 = v105;
    if (v96 < v107)
    {
      uint64_t v108 = pp_topics_log_handle();
      id v19 = v120;
      uint64_t v109 = v125;
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
      {
        double v112 = v107;
        if (!v88) {
          double v112 = 0.0;
        }
        *(_DWORD *)buf = 134218240;
        double v134 = v96;
        __int16 v135 = 2048;
        double v136 = v112;
        _os_log_debug_impl(&dword_1CA9A8000, v108, OS_LOG_TYPE_DEBUG, "Portrait Scoring, filtering out score of %f below threshold of %f", buf, 0x16u);
      }

      char v24 = 0;
      id v18 = v121;
      goto LABEL_50;
    }
  }
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v91 score:v96];
  id v19 = v120;
  id v18 = v121;
LABEL_49:
  uint64_t v109 = v125;
LABEL_50:

LABEL_51:

  id v16 = v122;
LABEL_52:

  return v24;
}

- (double)finalScoreFromRecordsUsingHybrid:(id)a3 streamingScorer:(id)a4 mlModel:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v7);
        }
        -[PPStreamingTopicScorer addRecord:]((uint64_t)v8, *(void **)(*((void *)&v27 + 1) + 8 * i));
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v11);
  }
  id v26 = 0;
  *(float *)&double v14 = -[PPStreamingTopicScorer getFinalScoreWithAggregationResultOut:finalResultOut:]((uint64_t)v8, (uint64_t)&v26);
  if (v26)
  {
    id v25 = 0;
    uint64_t v15 = objc_msgSend(v9, "predictionFromFeatures:error:", v26, &v25, v14);
    id v16 = v25;
    if (v15)
    {
      id v17 = [v15 featureValueForName:@"computed_score"];
      id v18 = [v17 multiArrayValue];

      if (v18)
      {
        id v19 = [v17 multiArrayValue];
        id v20 = [v19 objectAtIndexedSubscript:0];
        [v20 doubleValue];
        double v22 = v21;
      }
      else
      {
        [v17 doubleValue];
        double v22 = v23;
      }
    }
    else
    {
      id v17 = pp_default_log_handle();
      double v22 = -1.0;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v16;
        _os_log_fault_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_FAULT, "PPTopicStore: unable to retrieve prediction %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v16 = pp_default_log_handle();
    double v22 = 0.0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_FAULT, "PPLocalLocationStore: the score interpreter provided a nil final output.", buf, 2u);
    }
  }

  return v22;
}

- (id)cachedTopicScores
{
  return (id)[MEMORY[0x1E4F89FA8] cachedTopicScoresAtPath:self->_cachePath];
}

- (id)cachePath:(id *)a3
{
  return self->_cachePath;
}

- (PPLocalTopicStore)init
{
  id v3 = +[PPSQLDatabase sharedInstance];
  if (v3)
  {
    id v4 = [[PPTopicStorage alloc] initWithDatabase:v3];
    if (v4)
    {
      uint64_t v5 = +[PPTrialWrapper sharedInstance];
      self = [(PPLocalTopicStore *)self initWithStorage:v4 trialWrapper:v5];

      id v6 = self;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (PPLocalTopicStore)initWithStorage:(id)a3 trialWrapper:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PPLocalTopicStore.m", 169, @"Invalid parameter not satisfying: %@", @"storage" object file lineNumber description];
  }
  v40.receiver = self;
  v40.super_class = (Class)PPLocalTopicStore;
  uint64_t v10 = [(PPTopicStore *)&v40 _initFromSubclass];
  uint64_t v11 = (PPLocalTopicStore *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 10, a3);
    uint64_t v12 = objc_opt_new();
    modelCache = v11->_modelCache;
    v11->_modelCache = (NSCache *)v12;

    double v14 = objc_opt_new();
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v14];

    locuint64_t k = v11->_lock;
    v11->_locuint64_t k = (_PASLock *)v15;

    objc_storeStrong((id *)&v11->_trialWrapper, a4);
    id v17 = [[PPTopicBlocklist alloc] initWithTrialWrapper:v11->_trialWrapper];
    blocklist = v11->_blocklist;
    v11->_blocklist = v17;

    locatiouint64_t n = 0;
    objc_initWeak(&location, v11);
    trialWrapper = v11->_trialWrapper;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __50__PPLocalTopicStore_initWithStorage_trialWrapper___block_invoke;
    v37[3] = &unk_1E65DC540;
    objc_copyWeak(&v38, &location);
    id v20 = (void *)MEMORY[0x1CB79D060]([(PPTrialWrapper *)trialWrapper addUpdateHandlerForNamespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS" block:v37]);
    double v21 = [(PPTopicStorage *)v11->_storage parentDirectory];
    double v22 = [v21 stringByAppendingPathComponent:@"Topics"];

    double v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v36 = 0;
    char v24 = [v23 createDirectoryAtPath:v22 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v25 = v36;
    if ((v24 & 1) == 0)
    {
      id v26 = pp_default_log_handle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v25;
        _os_log_error_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_ERROR, "PPLocalTopicStore had an error while trying to create the cache directory: %@", buf, 0xCu);
      }
    }
    long long v27 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v28 = [v22 stringByAppendingPathComponent:@"ScoreCache"];
    cachePath = v11->_cachePath;
    v11->_cachePath = (NSString *)v28;

    uint64_t v30 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPLocalTopicStore-cache"];
    cacheUpdateQueue = v11->_cacheUpdateQueue;
    v11->_cacheUpdateQueue = (OS_dispatch_queue *)v30;

    uint64_t v32 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPLocalTopicStore-asyncCache" qosClass:9];
    cacheAsyncUpdateQueue = v11->_cacheAsyncUpdateQueue;
    v11->_cacheAsyncUpdateQueue = (OS_dispatch_queue *)v32;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __50__PPLocalTopicStore_initWithStorage_trialWrapper___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] removeAllObjects];
    id v3 = pp_topics_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "PPLocalTopicStore: invaliding model cache due to Trial update.", (uint8_t *)v4, 2u);
    }
  }
}

+ (id)recordsForTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
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
        double v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_opt_new();
        id v16 = [v14 item];
        [v15 setTopic:v16];

        [v14 score];
        objc_msgSend(v15, "setInitialScore:");
        [v15 setSource:v8];
        [v15 setAlgorithm:a5];
        id v17 = [MEMORY[0x1E4F89FC8] osBuild];
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

+ (id)calibrateScoredTopic:(id)a3 calibrationTrie:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = a4;
    id v7 = [v5 item];
    id v8 = [v7 topicIdentifier];
    id v9 = [v8 substringFromIndex:1];
    unsigned int v10 = [v6 payloadForString:v9];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F89F00]);
      uint64_t v12 = [v5 item];
      [v5 score];
      uint64_t v14 = objc_msgSend(v11, "initWithItem:score:", v12, (double)(1.0 - pow(1.0 - v13, (double)v10 / 100.0)));

      id v5 = (id)v14;
    }
  }
  id v15 = v5;

  return v15;
}

+ (void)sortAndTruncate:(id)a3 queryLimit:(unint64_t)a4
{
  id v5 = a3;
  [v5 sortUsingComparator:&__block_literal_global_20749];
  if ([v5 count] > a4) {
    objc_msgSend(v5, "removeObjectsInRange:", a4, objc_msgSend(v5, "count") - a4);
  }
}

uint64_t __48__PPLocalTopicStore_sortAndTruncate_queryLimit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  [a2 score];
  double v7 = v6;
  [v5 score];
  double v9 = v8;

  return [v4 reverseCompareDouble:v7 withDouble:v9];
}

@end