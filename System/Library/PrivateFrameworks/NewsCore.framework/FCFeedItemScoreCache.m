@interface FCFeedItemScoreCache
- (FCFeedItemScoreCache)initWithFeedPersonalizer:(id)a3;
- (FCFeedPersonalizing)feedPersonalizer;
- (FCThreadSafeMutableDictionary)scoreProfilesByConfigurationSet;
- (id)scoreProfilesForFeedItems:(id)a3 configurationSet:(int64_t)a4;
- (void)_accessScoreCacheForForConfigurationSet:(int64_t)a3 withBlock:(id)a4;
- (void)addScoreProfiles:(id)a3 configurationSet:(int64_t)a4;
@end

@implementation FCFeedItemScoreCache

- (FCFeedItemScoreCache)initWithFeedPersonalizer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCFeedItemScoreCache;
  v6 = [(FCFeedItemScoreCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedPersonalizer, a3);
    uint64_t v8 = objc_opt_new();
    scoreProfilesByConfigurationSet = v7->_scoreProfilesByConfigurationSet;
    v7->_scoreProfilesByConfigurationSet = (FCThreadSafeMutableDictionary *)v8;
  }
  return v7;
}

- (id)scoreProfilesForFeedItems:(id)a3 configurationSet:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__89;
  v19 = __Block_byref_object_dispose__89;
  id v20 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__FCFeedItemScoreCache_scoreProfilesForFeedItems_configurationSet___block_invoke;
  v10[3] = &unk_1E5B5C118;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  v13 = &v15;
  int64_t v14 = a4;
  [(FCFeedItemScoreCache *)self _accessScoreCacheForForConfigurationSet:a4 withBlock:v10];
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __67__FCFeedItemScoreCache_scoreProfilesForFeedItems_configurationSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __67__FCFeedItemScoreCache_scoreProfilesForFeedItems_configurationSet___block_invoke_2;
  v32[3] = &unk_1E5B56FB8;
  id v5 = v3;
  id v33 = v5;
  id v6 = objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v32);
  uint64_t v7 = [v6 count];
  id v8 = (void *)FCOperationLog;
  BOOL v9 = os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = v8;
      uint64_t v11 = [v6 count];
      uint64_t v12 = [*(id *)(a1 + 32) count];
      v13 = FCStringFromFeedPersonalizationConfigurationSet(*(void *)(a1 + 56));
      *(_DWORD *)buf = 134218498;
      unint64_t v35 = v11;
      __int16 v36 = 2048;
      uint64_t v37 = v12;
      __int16 v38 = 2114;
      v39 = v13;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "score cache is missing %lu of %lu requested feed item scores, context=%{public}@", buf, 0x20u);
    }
    int64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v15 = [*(id *)(a1 + 40) feedPersonalizer];
    v16 = [v15 sortItems:v6 options:1 configurationSet:*(void *)(a1 + 56)];

    uint64_t v17 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)MEMORY[0x1E4F1C9C8];
      v19 = v17;
      id v20 = [v18 date];
      [v20 timeIntervalSinceDate:v14];
      unint64_t v22 = (unint64_t)(fmax(v21, 0.0) * 1000.0);
      uint64_t v23 = [v6 count];
      v24 = FCStringFromFeedPersonalizationConfigurationSet(*(void *)(a1 + 56));
      *(_DWORD *)buf = 134218498;
      unint64_t v35 = v22;
      __int16 v36 = 2048;
      uint64_t v37 = v23;
      __int16 v38 = 2114;
      v39 = v24;
      _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "score cache took %llums to score %lu feed items, context=%{public}@", buf, 0x20u);
    }
    v25 = [v16 scoreProfiles];
    [v5 addObjectsFromMapTable:v25];

    goto LABEL_9;
  }
  if (v9)
  {
    v26 = *(void **)(a1 + 32);
    int64_t v14 = v8;
    uint64_t v27 = [v26 count];
    v28 = FCStringFromFeedPersonalizationConfigurationSet(*(void *)(a1 + 56));
    *(_DWORD *)buf = 134218242;
    unint64_t v35 = v27;
    __int16 v36 = 2114;
    uint64_t v37 = (uint64_t)v28;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "score cache has all %lu requested feed item scores, context=%{public}@", buf, 0x16u);

LABEL_9:
  }
  uint64_t v29 = [v5 copy];
  uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
  v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;
}

BOOL __67__FCFeedItemScoreCache_scoreProfilesForFeedItems_configurationSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)addScoreProfiles:(id)a3 configurationSet:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__FCFeedItemScoreCache_addScoreProfiles_configurationSet___block_invoke;
  v8[3] = &unk_1E5B5C140;
  id v9 = v6;
  id v7 = v6;
  [(FCFeedItemScoreCache *)self _accessScoreCacheForForConfigurationSet:a4 withBlock:v8];
}

uint64_t __58__FCFeedItemScoreCache_addScoreProfiles_configurationSet___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObjectsFromMapTable:*(void *)(a1 + 32)];
}

- (void)_accessScoreCacheForForConfigurationSet:(int64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(FCFeedItemScoreCache *)self scoreProfilesByConfigurationSet];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__FCFeedItemScoreCache__accessScoreCacheForForConfigurationSet_withBlock___block_invoke;
  v9[3] = &unk_1E5B5C168;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 readWriteWithAccessor:v9];
}

void __74__FCFeedItemScoreCache__accessScoreCacheForForConfigurationSet_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v4 = [v6 objectForKey:v3];

  if (!v4)
  {
    v4 = +[FCMapTable mapTableWithKeyOptions:0 valueOptions:0];
    id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    [v6 setObject:v4 forKey:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (FCThreadSafeMutableDictionary)scoreProfilesByConfigurationSet
{
  return self->_scoreProfilesByConfigurationSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreProfilesByConfigurationSet, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end