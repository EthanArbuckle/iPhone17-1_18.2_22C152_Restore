@interface FCSportsEventController
- (FCContentContext)context;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (FCSportsEventController)initWithContentDatabase:(id)a3 context:(id)a4 sportsEventRecordSource:(id)a5 tagController:(id)a6;
- (FCSportsEventRecordSource)sportsEventRecordSource;
- (FCTagController)tagController;
- (FCTagRecordSource)tagRecordSource;
- (NSCache)fastCache;
- (id)_cachedSportsEventForSportsEventID:(id)a3 fastCacheOnly:(BOOL)a4;
- (id)_cachedSportsEventsForSportsEventID:(id)a3 fastCacheOnly:(BOOL)a4;
- (id)_fetchOperationForSportsEventsWithIDs:(id)a3;
- (id)fastCachedSportsEventForID:(id)a3;
- (id)jsonEncodableObject;
- (id)slowCachedSportsEventForID:(id)a3;
- (void)_fetchSportsEventForSportsEventID:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6;
- (void)_fetchSportsEventsForSportsEventIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6;
- (void)_refreshSportsEventsBasedOnAgeForSportsEventIDs:(id)a3;
- (void)_saveSportsEventsToCache:(id)a3;
- (void)setAppConfigurationManager:(id)a3;
- (void)setContext:(id)a3;
- (void)setFastCache:(id)a3;
- (void)setSportsEventRecordSource:(id)a3;
- (void)setTagController:(id)a3;
- (void)setTagRecordSource:(id)a3;
- (void)sportsEventsFetchOperation:(id)a3 didFetchSportsEvents:(id)a4;
@end

@implementation FCSportsEventController

- (FCSportsEventController)initWithContentDatabase:(id)a3 context:(id)a4 sportsEventRecordSource:(id)a5 tagController:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FCSportsEventController;
  v13 = [(FCSportsEventController *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v14->_sportsEventRecordSource, a5);
    objc_storeStrong((id *)&v14->_tagController, a6);
    uint64_t v15 = objc_msgSend(v10, "news_core_ConfigurationManager");
    appConfigurationManager = v14->_appConfigurationManager;
    v14->_appConfigurationManager = (FCNewsAppConfigurationManager *)v15;

    v17 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    fastCache = v14->_fastCache;
    v14->_fastCache = v17;
  }
  return v14;
}

- (id)fastCachedSportsEventForID:(id)a3
{
  return [(FCSportsEventController *)self _cachedSportsEventForSportsEventID:a3 fastCacheOnly:1];
}

- (id)slowCachedSportsEventForID:(id)a3
{
  return [(FCSportsEventController *)self _cachedSportsEventForSportsEventID:a3 fastCacheOnly:0];
}

- (void)_refreshSportsEventsBasedOnAgeForSportsEventIDs:(id)a3
{
  v17 = self;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "loadDate", v17);
        id v11 = [v10 dateByAddingTimeInterval:3600.0];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        int v13 = objc_msgSend(v11, "fc_isEarlierThan:", v12);

        if (v13)
        {
          v14 = [v9 identifier];
          [v4 addObject:v14];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  if ([v4 count])
  {
    uint64_t v15 = [(FCSportsEventController *)v17 _fetchOperationForSportsEventsWithIDs:v4];
    [v15 setQualityOfService:17];
    [v15 setRelativePriority:-1];
    v16 = +[FCCachePolicy ignoreCacheCachePolicy];
    [v15 setCachePolicy:v16];

    [v15 start];
  }
}

- (void)_fetchSportsEventForSportsEventID:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "sportsEventID != nil");
      *(_DWORD *)buf = 136315906;
      long long v19 = "-[FCSportsEventController _fetchSportsEventForSportsEventID:cachePolicy:qualityOfService:completionHandler:]";
      __int16 v20 = 2080;
      long long v21 = "FCSportsEventController.m";
      __int16 v22 = 1024;
      int v23 = 114;
      __int16 v24 = 2114;
      v25 = v14;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v12) {
        goto LABEL_6;
      }
    }
    else if (!v12)
    {
      goto LABEL_6;
    }
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    goto LABEL_6;
  }
  id v17 = v10;
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__FCSportsEventController__fetchSportsEventForSportsEventID_cachePolicy_qualityOfService_completionHandler___block_invoke;
  v15[3] = &unk_1E5B4CA60;
  id v16 = v12;
  [(FCSportsEventController *)self _fetchSportsEventsForSportsEventIDs:v13 cachePolicy:v11 qualityOfService:a5 completionHandler:v15];

LABEL_6:
}

void __108__FCSportsEventController__fetchSportsEventForSportsEventID_cachePolicy_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v7 = [a2 allValues];
    uint64_t v6 = [v7 firstObject];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v6, v5);
  }
}

- (void)_fetchSportsEventsForSportsEventIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "sportsEventIDs != nil");
    *(_DWORD *)buf = 136315906;
    v45 = "-[FCSportsEventController _fetchSportsEventsForSportsEventIDs:cachePolicy:qualityOfService:completionHandler:]";
    __int16 v46 = 2080;
    v47 = "FCSportsEventController.m";
    __int16 v48 = 1024;
    int v49 = 136;
    __int16 v50 = 2114;
    v51 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
    {
LABEL_4:
      if (v11)
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_2;
        v38[3] = &unk_1E5B59950;
        v38[4] = self;
        id v39 = v10;
        int64_t v42 = a5;
        id v40 = v11;
        id v41 = v12;
        __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_2((uint64_t)v38);
      }
      else
      {
        int64_t v28 = a5;
        v30 = (void (**)(void, void, void))v12;
        int v13 = [MEMORY[0x1E4F1CA60] dictionary];
        v14 = [MEMORY[0x1E4F1CA48] array];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v29 = v10;
        id v15 = v10;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v35 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              long long v21 = [(FCSportsEventController *)self fastCache];
              __int16 v22 = [v21 objectForKey:v20];

              if (v22) {
                [v13 setObject:v22 forKey:v20];
              }
              else {
                [v14 addObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v17);
        }

        if ([v14 count])
        {
          int v23 = [(FCSportsEventController *)self _fetchOperationForSportsEventsWithIDs:v14];
          [v23 setQualityOfService:v28];
          id v12 = v30;
          if (v28 == 9) {
            uint64_t v24 = -1;
          }
          else {
            uint64_t v24 = v28 == 33 || v28 == 25;
          }
          id v11 = 0;
          id v10 = v29;
          [v23 setRelativePriority:v24];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_5;
          v31[3] = &unk_1E5B51660;
          v33 = v30;
          id v32 = v13;
          [v23 setFetchCompletionHandler:v31];
          v25 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
          [v25 addOperation:v23];
        }
        else
        {
          id v12 = v30;
          ((void (**)(void, void *, void))v30)[2](v30, v13, 0);
          id v11 = 0;
          id v10 = v29;
        }
      }
      goto LABEL_29;
    }
  }
  else if (v12)
  {
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v45 = "-[FCSportsEventController _fetchSportsEventsForSportsEventIDs:cachePolicy:qualityOfService:completionHandler:]";
    __int16 v46 = 2080;
    v47 = "FCSportsEventController.m";
    __int16 v48 = 1024;
    int v49 = 137;
    __int16 v50 = 2114;
    v51 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_29:
}

void __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _fetchOperationForSportsEventsWithIDs:*(void *)(a1 + 40)];
  [v2 setQualityOfService:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(a1 + 64);
  BOOL v4 = v3 == 33 || v3 == 25;
  if (v3 == 9) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = v4;
  }
  [v2 setRelativePriority:v5];
  [v2 setCachePolicy:*(void *)(a1 + 48)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5B559D8;
  id v8 = *(id *)(a1 + 56);
  [v2 setFetchCompletionHandler:v7];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v6 addOperation:v2];
}

void __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v8 = (void (**)(id, void, id))*(id *)(a1 + 32);
    id v7 = v5;
    v8[2](v8, 0, v7);
  }
  else
  {
    uint64_t v6 = objc_msgSend(a2, "fc_dictionaryWithKeySelector:", sel_identifier);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v8 = (void (**)(id, void, id))*(id *)(a1 + 40);
    id v7 = v5;
    v8[2](v8, 0, v7);
  }
  else
  {
    uint64_t v6 = objc_msgSend(a2, "fc_dictionaryWithKeySelector:", sel_identifier);
    if (v6) {
      [*(id *)(a1 + 32) addEntriesFromDictionary:v6];
    }
    objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_19_2);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_7()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

- (id)_cachedSportsEventForSportsEventID:(id)a3 fastCacheOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v14 = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v9 = [(FCSportsEventController *)self _cachedSportsEventsForSportsEventID:v8 fastCacheOnly:v4];
    id v10 = [v9 allValues];
    id v11 = [v10 firstObject];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "sportsEventID != nil");
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = "-[FCSportsEventController _cachedSportsEventForSportsEventID:fastCacheOnly:]";
      __int16 v17 = 2080;
      uint64_t v18 = "FCSportsEventController.m";
      __int16 v19 = 1024;
      int v20 = 211;
      __int16 v21 = 2114;
      __int16 v22 = v13;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)_cachedSportsEventsForSportsEventID:(id)a3 fastCacheOnly:(BOOL)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "sportsEventIDs != nil");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCSportsEventController _cachedSportsEventsForSportsEventID:fastCacheOnly:]";
    __int16 v31 = 2080;
    id v32 = "FCSportsEventController.m";
    __int16 v33 = 1024;
    int v34 = 218;
    __int16 v35 = 2114;
    long long v36 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v14 = [(FCSportsEventController *)self fastCache];
        id v15 = [v14 objectForKey:v13];

        if (v15) {
          [v6 setObject:v15 forKey:v13];
        }
        else {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  if ([v7 count] && !a4)
  {
    uint64_t v16 = [(FCSportsEventController *)self sportsEventRecordSource];
    __int16 v17 = [v16 cachedRecordsWithIDs:v7];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke;
    v22[3] = &unk_1E5B59998;
    v22[4] = self;
    id v23 = v6;
    [v17 enumerateRecordsAndInterestTokensWithBlock:v22];
  }
  uint64_t v18 = [v6 allValues];
  [(FCSportsEventController *)self _refreshSportsEventsBasedOnAgeForSportsEventIDs:v18];

  return v6;
}

void __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) tagController];
  id v8 = [v5 eventCompetitorTagIDs];
  uint64_t v9 = [v7 slowCachedTagsForIDs:v8];

  uint64_t v10 = [v5 eventCompetitorTagIDs];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_2;
  v40[3] = &unk_1E5B4F4B0;
  id v11 = v9;
  uint64_t v12 = *(void *)(a1 + 32);
  id v41 = v11;
  uint64_t v42 = v12;
  id v13 = v5;
  id v43 = v13;
  id v14 = objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", v40);

  uint64_t v15 = [v14 count];
  uint64_t v16 = [v13 eventCompetitorTagIDs];
  uint64_t v17 = [v16 count];

  if (v15 != v17)
  {
    uint64_t v18 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      log = v18;
      v30 = (objc_class *)objc_opt_class();
      __int16 v31 = NSStringFromClass(v30);
      id v32 = [v13 base];
      __int16 v33 = [v32 identifier];
      int v34 = [v13 eventCompetitorTagIDs];
      uint64_t v35 = [v34 count];
      uint64_t v36 = [v14 count];
      *(_DWORD *)buf = 138544130;
      v45 = v31;
      __int16 v46 = 2114;
      v47 = v33;
      __int16 v48 = 2050;
      uint64_t v49 = v35;
      __int16 v50 = 2050;
      uint64_t v51 = v36;
      _os_log_error_impl(&dword_1A460D000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch all competitor tags for sports event with id=%{public}@. Expected %{public}lu tags, but got %{public}lu", buf, 0x2Au);
    }
  }
  __int16 v19 = objc_msgSend(*(id *)(a1 + 32), "tagController", log);
  int v20 = [v13 eventLeagueTagID];
  __int16 v21 = [v19 slowCachedTagForID:v20];
  __int16 v22 = [v21 asSports];

  if (v22)
  {
    id v23 = v22;
    long long v24 = [FCSportsEvent alloc];
    long long v25 = [*(id *)(a1 + 32) context];
    long long v26 = [v25 assetManager];
    long long v27 = [(FCSportsEvent *)v24 initWithSportsEventRecord:v13 eventCompetitorTags:v14 eventLeagueTag:v23 assetManager:v26 interestToken:v6];

    int64_t v28 = *(void **)(a1 + 40);
    id v29 = [(FCSportsEvent *)v27 identifier];
    [v28 setObject:v27 forKey:v29];
  }
  else
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_23;
    v38[3] = &unk_1E5B4BE70;
    v38[4] = *(void *)(a1 + 32);
    id v39 = v13;
    __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_23((uint64_t)v38);
  }
}

id __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  char v5 = [v4 isSports];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_3;
    v8[3] = &unk_1E5B4F488;
    v8[4] = *(void *)(a1 + 40);
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v6 = __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_3((uint64_t)v8);
  }
  return v6;
}

uint64_t __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    BOOL v4 = v2;
    char v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) base];
    id v9 = [v8 identifier];
    int v10 = 138543874;
    id v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ encountered non-sports tag with id %{public}@ as a competitor tag for sports event with id %{public}@. Ignoring invalid competitor tag.", (uint8_t *)&v10, 0x20u);
  }
  return 0;
}

void __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_23(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    id v3 = v2;
    BOOL v4 = (objc_class *)objc_opt_class();
    char v5 = NSStringFromClass(v4);
    id v6 = [*(id *)(a1 + 40) base];
    uint64_t v7 = [v6 identifier];
    id v8 = [*(id *)(a1 + 40) eventLeagueTagID];
    int v9 = 138543874;
    int v10 = v5;
    __int16 v11 = 2114;
    __int16 v12 = v7;
    __int16 v13 = 2114;
    __int16 v14 = v8;
    _os_log_error_impl(&dword_1A460D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed to get league tag for sports event record, sports event discarded; sportsEventRecord identifier="
      "%{public}@, leagueTag identifier=%{public}@",
      (uint8_t *)&v9,
      0x20u);
  }
}

- (void)_saveSportsEventsToCache:(id)a3
{
  id v4 = a3;
  char v5 = [(FCSportsEventController *)self fastCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__FCSportsEventController__saveSportsEventsToCache___block_invoke;
  v7[3] = &unk_1E5B599C0;
  id v8 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v7];
}

void __52__FCSportsEventController__saveSportsEventsToCache___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKey:v4];
}

- (id)jsonEncodableObject
{
  v2 = [(FCSportsEventController *)self sportsEventRecordSource];
  id v3 = [v2 jsonEncodableObject];

  return v3;
}

- (id)_fetchOperationForSportsEventsWithIDs:(id)a3
{
  id v4 = a3;
  char v5 = [FCSportsEventsFetchOperation alloc];
  id v6 = [(FCSportsEventController *)self context];
  uint64_t v7 = [(FCSportsEventController *)self tagController];
  id v8 = [(FCSportsEventsFetchOperation *)v5 initWithContext:v6 tagController:v7 sportsEventIDs:v4 delegate:self];

  return v8;
}

- (void)sportsEventsFetchOperation:(id)a3 didFetchSportsEvents:(id)a4
{
}

- (NSCache)fastCache
{
  return self->_fastCache;
}

- (void)setFastCache:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (FCSportsEventRecordSource)sportsEventRecordSource
{
  return self->_sportsEventRecordSource;
}

- (void)setSportsEventRecordSource:(id)a3
{
}

- (FCTagRecordSource)tagRecordSource
{
  return self->_tagRecordSource;
}

- (void)setTagRecordSource:(id)a3
{
}

- (FCTagController)tagController
{
  return self->_tagController;
}

- (void)setTagController:(id)a3
{
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void)setAppConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong((id *)&self->_sportsEventRecordSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_fastCache, 0);
}

@end