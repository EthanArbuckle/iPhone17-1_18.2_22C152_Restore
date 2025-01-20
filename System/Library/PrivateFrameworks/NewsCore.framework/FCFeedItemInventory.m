@interface FCFeedItemInventory
- (BOOL)_isRefreshNeeded;
- (FCAsyncSerialQueue)feedItemsRefreshSerialQueue;
- (FCCloudContext)context;
- (FCFeedItemInventory)init;
- (FCFeedItemInventory)initWithContext:(id)a3 feedItemService:(id)a4 readingHistory:(id)a5 filePath:(id)a6 version:(unsigned int)a7 refreshInterval:(double)a8 loggingKey:(id)a9;
- (FCFeedItemServiceType)feedItemService;
- (FCOnce)loadFromCacheOnce;
- (FCOperationThrottler)targetedRescoreThrottler;
- (FCPBFeedItemInventory)latestInventory;
- (NFUnfairLock)articleIDsToRescoreLock;
- (NSArray)allFeedItems;
- (NSMutableSet)articleIDsToRescore;
- (NSString)filePath;
- (NSString)loggingKey;
- (double)refreshInterval;
- (id)_loadInventoryFromCache;
- (id)_refreshIfNeeded;
- (id)allFeedItemScoreProfilesForConfigurationSet:(int64_t)a3 scoringVersion:(unint64_t)a4;
- (id)allFeedItemsWithTopic:(id)a3;
- (unsigned)version;
- (void)_adoptInventory:(id)a3;
- (void)_populateScoreProfilesForFeedItems:(id)a3;
- (void)_populateScoreProfilesForFeedItems:(id)a3 configurationSet:(int64_t)a4;
- (void)_prepareForUse;
- (void)_rescoreInventoryIfNeeded:(id)a3 forScoringVersion:(unint64_t)a4;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
- (void)refreshIfNeededWithCompletion:(id)a3;
- (void)setLatestInventory:(id)a3;
@end

@implementation FCFeedItemInventory

- (FCFeedItemInventory)initWithContext:(id)a3 feedItemService:(id)a4 readingHistory:(id)a5 filePath:(id)a6 version:(unsigned int)a7 refreshInterval:(double)a8 loggingKey:(id)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)FCFeedItemInventory;
  v22 = [(FCFeedItemInventory *)&v39 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_context, a3);
    objc_storeStrong((id *)&v23->_feedItemService, a4);
    uint64_t v24 = [v20 copy];
    filePath = v23->_filePath;
    v23->_filePath = (NSString *)v24;

    v23->_version = a7;
    v23->_refreshInterval = a8;
    uint64_t v26 = [v21 copy];
    loggingKey = v23->_loggingKey;
    v23->_loggingKey = (NSString *)v26;

    v28 = [[FCOnce alloc] initWithOptions:1];
    loadFromCacheOnce = v23->_loadFromCacheOnce;
    v23->_loadFromCacheOnce = v28;

    v30 = [[FCAsyncSerialQueue alloc] initWithQualityOfService:25];
    feedItemsRefreshSerialQueue = v23->_feedItemsRefreshSerialQueue;
    v23->_feedItemsRefreshSerialQueue = v30;

    [v19 addObserver:v23];
    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    articleIDsToRescoreLock = v23->_articleIDsToRescoreLock;
    v23->_articleIDsToRescoreLock = (NFUnfairLock *)v32;

    uint64_t v34 = [MEMORY[0x1E4F1CA80] set];
    articleIDsToRescore = v23->_articleIDsToRescore;
    v23->_articleIDsToRescore = (NSMutableSet *)v34;

    v36 = [[FCTimedOperationThrottler alloc] initWithDelegate:v23];
    [(FCTimedOperationThrottler *)v36 setCooldownTime:5.0];
    targetedRescoreThrottler = v23->_targetedRescoreThrottler;
    v23->_targetedRescoreThrottler = (FCOperationThrottler *)v36;
  }
  return v23;
}

- (FCFeedItemInventory)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedItemInventory init]";
    __int16 v9 = 2080;
    v10 = "FCFeedItemInventory.m";
    __int16 v11 = 1024;
    int v12 = 86;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFeedItemInventory init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSArray)allFeedItems
{
  [(FCFeedItemInventory *)self _prepareForUse];
  v3 = [(FCFeedItemInventory *)self latestInventory];
  uint64_t v4 = [v3 feedItems];
  v5 = v4;
  if (!v4) {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (id)allFeedItemScoreProfilesForConfigurationSet:(int64_t)a3 scoringVersion:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(FCFeedItemInventory *)self _prepareForUse];
  v7 = +[FCMapTable mapTableWithKeyOptions:512 valueOptions:0];
  v8 = [(FCFeedItemInventory *)self latestInventory];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  __int16 v9 = [v8 feedItems];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (!v10)
  {

    goto LABEL_22;
  }
  uint64_t v11 = v10;
  v25 = self;
  uint64_t v26 = v8;
  uint64_t v12 = *(void *)v28;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
      if (a3 == 11)
      {
        uint64_t v15 = [*(id *)(*((void *)&v27 + 1) + 8 * i) scoreProfiles];
        uint64_t v16 = [v15 forYouGroupScoreProfile];
      }
      else
      {
        if (a3)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v19 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
            *(_DWORD *)buf = 136315906;
            uint64_t v32 = "-[FCFeedItemInventory allFeedItemScoreProfilesForConfigurationSet:scoringVersion:]";
            __int16 v33 = 2080;
            uint64_t v34 = "FCFeedItemInventory.m";
            __int16 v35 = 1024;
            LODWORD(v36[0]) = 122;
            WORD2(v36[0]) = 2114;
            *(void *)((char *)v36 + 6) = v19;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          continue;
        }
        uint64_t v15 = [*(id *)(*((void *)&v27 + 1) + 8 * i) scoreProfiles];
        uint64_t v16 = [v15 defaultScoreProfile];
      }
      id v17 = (void *)v16;

      if (v17)
      {
        if ([v17 scoringVersion] != a4)
        {
          id v20 = (void *)FCFeedItemInventoryLog;
          if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = v20;
            v22 = [(FCFeedItemInventory *)v25 loggingKey];
            uint64_t v23 = [v17 scoringVersion];
            *(_DWORD *)buf = 138543874;
            uint64_t v32 = v22;
            __int16 v33 = 2048;
            uint64_t v34 = (char *)v23;
            __int16 v35 = 2048;
            v36[0] = a4;
            _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] rescoring inventory because cached scored version of %llu doesn't match %llu", buf, 0x20u);
          }
          v8 = v26;
          [(FCFeedItemInventory *)v25 _rescoreInventoryIfNeeded:v26 forScoringVersion:a4];
          goto LABEL_22;
        }
        id v18 = [[FCFeedPersonalizedItemScoreProfile alloc] initWithPBScoreProfile:v17];
        [v7 setObject:v18 forKey:v14];
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v11) {
      continue;
    }
    break;
  }

  v8 = v26;
LABEL_22:

  return v7;
}

- (id)allFeedItemsWithTopic:(id)a3
{
  id v4 = a3;
  v5 = [(FCFeedItemInventory *)self allFeedItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__FCFeedItemInventory_allFeedItemsWithTopic___block_invoke;
  v9[3] = &unk_1E5B56FB8;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v9);

  return v7;
}

uint64_t __45__FCFeedItemInventory_allFeedItemsWithTopic___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 topicIDs];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (void)refreshIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  [(FCFeedItemInventory *)self _prepareForUse];
  v5 = [(FCFeedItemInventory *)self _refreshIfNeeded];
  id v6 = zalgo();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__FCFeedItemInventory_refreshIfNeededWithCompletion___block_invoke;
  v9[3] = &unk_1E5B4CA88;
  id v10 = v4;
  id v7 = v4;
  id v8 = (id)[v5 alwaysOn:v6 always:v9];
}

uint64_t __53__FCFeedItemInventory_refreshIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__74;
  uint64_t v26 = __Block_byref_object_dispose__74;
  id v27 = 0;
  id v8 = [(FCFeedItemInventory *)self articleIDsToRescoreLock];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v21[3] = &unk_1E5B4C258;
  v21[4] = self;
  v21[5] = &v22;
  [v8 performWithLockSync:v21];

  __int16 v9 = (id)FCFeedItemInventoryLog;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(FCFeedItemInventory *)self loggingKey];
    uint64_t v11 = [(id)v23[5] count];
    *(_DWORD *)buf = 138543618;
    long long v29 = v10;
    __int16 v30 = 2048;
    uint64_t v31 = v11;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing %ld article IDs for targeted rescoring", buf, 0x16u);
  }
  if ([(id)v23[5] count])
  {
    uint64_t v12 = [(FCFeedItemInventory *)self feedItemsRefreshSerialQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2;
    v13[3] = &unk_1E5B5A840;
    v13[4] = self;
    uint64_t v15 = &v22;
    id v14 = v7;
    [v12 enqueueBlock:v13];
  }
  else
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_18;
    id v19 = &unk_1E5B4CA88;
    id v20 = (void (**)(void))v7;
    v20[2]();
  }
  _Block_object_dispose(&v22, 8);
}

void __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) articleIDsToRescore];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) articleIDsToRescore];
  [v6 removeAllObjects];
}

uint64_t __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) latestInventory];
  v5 = [v4 feedItems];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_3;
  v16[3] = &unk_1E5B5A818;
  v16[4] = *(void *)(a1 + 48);
  id v6 = objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v16);

  id v7 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    __int16 v9 = v7;
    id v10 = [v8 loggingKey];
    uint64_t v11 = [v6 count];
    *(_DWORD *)buf = 138543618;
    id v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] identified %ld feed items for targeted rescoring", buf, 0x16u);
  }
  if ([v6 count])
  {
    uint64_t v12 = *(void **)(a1 + 32);
    __int16 v13 = [v4 feedItems];
    [v12 _populateScoreProfilesForFeedItems:v13];

    [*(id *)(a1 + 32) _adoptInventory:v4];
    v3[2](v3);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v14 = v3;
    uint64_t v15 = (void (**)(void))*(id *)(a1 + 40);
    v14[2](v14);
    v15[2]();
  }
}

uint64_t __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = [a2 articleID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_19(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_opt_new();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__FCFeedItemInventory_readingHistory_didChangeFeaturesForArticles___block_invoke;
  v17[3] = &unk_1E5B56A18;
  id v7 = v6;
  id v18 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v17];

  id v8 = [(FCFeedItemInventory *)self articleIDsToRescoreLock];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__FCFeedItemInventory_readingHistory_didChangeFeaturesForArticles___block_invoke_2;
  v15[3] = &unk_1E5B4BE70;
  v15[4] = self;
  id v9 = v7;
  id v16 = v9;
  [v8 performWithLockSync:v15];

  id v10 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    uint64_t v12 = [(FCFeedItemInventory *)self loggingKey];
    uint64_t v13 = [v9 count];
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v12;
    __int16 v21 = 2048;
    uint64_t v22 = v13;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueuing %ld article IDs for targeted rescoring", buf, 0x16u);
  }
  id v14 = [(FCFeedItemInventory *)self targetedRescoreThrottler];
  [v14 tickle];
}

void __67__FCFeedItemInventory_readingHistory_didChangeFeaturesForArticles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 unsignedIntegerValue]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __67__FCFeedItemInventory_readingHistory_didChangeFeaturesForArticles___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) articleIDsToRescore];
  [v2 unionSet:*(void *)(a1 + 40)];
}

- (void)_prepareForUse
{
  uint64_t v3 = [(FCFeedItemInventory *)self loadFromCacheOnce];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__FCFeedItemInventory__prepareForUse__block_invoke;
  v4[3] = &unk_1E5B4C018;
  v4[4] = self;
  [v3 executeOnce:v4];
}

void __37__FCFeedItemInventory__prepareForUse__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _loadInventoryFromCache];
  [*(id *)(a1 + 32) setLatestInventory:v2];
}

- (id)_refreshIfNeeded
{
  if ([(FCFeedItemInventory *)self _isRefreshNeeded])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2;
    v6[3] = &unk_1E5B4EEF0;
    v6[4] = self;
    uint64_t v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke;
    v7[3] = &unk_1E5B4E758;
    v7[4] = self;
    uint64_t v4 = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke((uint64_t)v7);
  }
  return v4;
}

id __39__FCFeedItemInventory__refreshIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F81BF0]);
  id v3 = [*(id *)(a1 + 32) latestInventory];
  uint64_t v4 = (void *)[v2 initWithValue:v3];

  return v4;
}

void __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) feedItemsRefreshSerialQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_3;
  v10[3] = &unk_1E5B5A8B8;
  id v11 = v5;
  id v12 = v6;
  v10[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  [v7 enqueueBlock:v10];
}

void __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_3(id *a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_4;
  aBlock[3] = &unk_1E5B5A868;
  id v39 = a1[5];
  id v4 = v3;
  id v40 = v4;
  id v5 = _Block_copy(aBlock);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_5;
  v35[3] = &unk_1E5B544B8;
  id v36 = a1[6];
  id v6 = v4;
  id v37 = v6;
  id v7 = _Block_copy(v35);
  if (([a1[4] _isRefreshNeeded] & 1) == 0)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_6;
    v33[3] = &unk_1E5B4C7C0;
    uint64_t v17 = v5;
    v33[4] = a1[4];
    uint64_t v34 = v17;
    __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_6((uint64_t)v33);
    id v18 = v34;
    goto LABEL_16;
  }
  id v8 = [a1[4] latestInventory];

  id v9 = (void *)FCFeedItemInventoryLog;
  BOOL v10 = os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      id v11 = a1[4];
      id v12 = v9;
      uint64_t v13 = [v11 loggingKey];
      id v14 = [a1[4] latestInventory];
      uint64_t v15 = [v14 lastRefreshed];
      id v16 = [v15 nsDate];
      *(_DWORD *)buf = 138543618;
      v42 = v13;
      __int16 v43 = 2114;
      v44 = v16;
      _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] will refresh because last refresh was at %{public}@", buf, 0x16u);

LABEL_8:
    }
  }
  else if (v10)
  {
    id v19 = a1[4];
    id v12 = v9;
    uint64_t v13 = [v19 loggingKey];
    *(_DWORD *)buf = 138543362;
    v42 = v13;
    _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] will refresh because there is no cached instance", buf, 0xCu);
    goto LABEL_8;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v21 = v20;
  uint64_t v22 = [a1[4] latestInventory];
  if (v22)
  {
    uint64_t v23 = [FCFeedItemServiceCursor alloc];
    uint64_t v24 = [v22 lastRefreshed];
    uint64_t v25 = [v22 feedItems];
    uint64_t v26 = (void *)v25;
    if (v25) {
      uint64_t v27 = v25;
    }
    else {
      uint64_t v27 = MEMORY[0x1E4F1CBF0];
    }
    id v18 = [(FCFeedItemServiceCursor *)v23 initWithLastRefreshed:v24 feedItems:v27];
  }
  else
  {
    id v18 = 0;
  }
  long long v28 = [a1[4] feedItemService];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_28;
  v29[3] = &unk_1E5B5A890;
  v29[4] = a1[4];
  id v30 = v7;
  uint64_t v32 = v21;
  id v31 = v5;
  [v28 fetchFeedItemsWithCursor:v18 completion:v29];

LABEL_16:
}

uint64_t __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
  id v5 = [*(id *)(a1 + 32) latestInventory];
  id v4 = (void *)[v3 initWithValue:v5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

void __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2_29;
    v23[3] = &unk_1E5B4E088;
    v23[4] = *(void *)(a1 + 32);
    id v24 = v6;
    id v25 = *(id *)(a1 + 40);
    __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2_29(v23);
  }
  else
  {
    id v8 = (void *)FCFeedItemInventoryLog;
    if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      BOOL v10 = v8;
      id v11 = [v9 loggingKey];
      uint64_t v12 = [v5 count];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      unint64_t v14 = (unint64_t)(fmax(v13 - *(double *)(a1 + 56), 0.0) * 1000.0);
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v11;
      __int16 v28 = 2048;
      unint64_t v29 = v12;
      __int16 v30 = 2048;
      unint64_t v31 = v14;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully fetched %lu feed items in %llums, will generate score profiles", buf, 0x20u);
    }
    [*(id *)(a1 + 32) _populateScoreProfilesForFeedItems:v5];
    uint64_t v15 = (void *)FCFeedItemInventoryLog;
    if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *(void **)(a1 + 32);
      uint64_t v17 = v15;
      id v18 = [v16 loggingKey];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      unint64_t v20 = (unint64_t)(fmax(v19 - *(double *)(a1 + 56), 0.0) * 1000.0);
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v18;
      __int16 v28 = 2048;
      unint64_t v29 = v20;
      _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully refreshed in %llums", buf, 0x16u);
    }
    uint64_t v21 = objc_alloc_init(FCPBFeedItemInventory);
    -[FCPBFeedItemInventory setInventoryVersion:](v21, "setInventoryVersion:", [*(id *)(a1 + 32) version]);
    [(FCPBFeedItemInventory *)v21 setFeedItemVersion:24];
    uint64_t v22 = [MEMORY[0x1E4F82A18] date];
    [(FCPBFeedItemInventory *)v21 setLastRefreshed:v22];

    [(FCPBFeedItemInventory *)v21 setFeedItems:v5];
    [*(id *)(a1 + 32) _adoptInventory:v21];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2_29(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)a1[4];
    id v4 = v2;
    id v5 = [v3 loggingKey];
    uint64_t v6 = a1[5];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] failed to refresh with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_adoptInventory:(id)a3
{
  [(FCFeedItemInventory *)self setLatestInventory:a3];
  id v4 = FCPersistenceQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__FCFeedItemInventory__adoptInventory___block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  dispatch_async(v4, block);
}

void __39__FCFeedItemInventory__adoptInventory___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) latestInventory];
  id v3 = [v2 data];

  id v4 = [*(id *)(a1 + 32) filePath];
  id v16 = 0;
  int v5 = [v3 writeToFile:v4 options:1 error:&v16];
  id v6 = v16;

  id v7 = (void *)FCFeedItemInventoryLog;
  BOOL v8 = os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      id v9 = *(void **)(a1 + 32);
      __int16 v10 = v7;
      uint64_t v11 = [v9 loggingKey];
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v3, "length"), 0);
      *(_DWORD *)buf = 138543618;
      id v18 = v11;
      __int16 v19 = 2114;
      id v20 = v12;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully persisted with size: %{public}@", buf, 0x16u);
    }
  }
  else if (v8)
  {
    double v13 = *(void **)(a1 + 32);
    unint64_t v14 = v7;
    uint64_t v15 = [v13 loggingKey];
    *(_DWORD *)buf = 138543618;
    id v18 = v15;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] failed to persist with error: %{public}@", buf, 0x16u);
  }
}

- (BOOL)_isRefreshNeeded
{
  id v3 = [(FCFeedItemInventory *)self latestInventory];
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 lastRefreshed];
    id v6 = [v5 nsDate];
    objc_msgSend(v6, "fc_timeIntervalUntilNow");
    double v8 = v7;
    [(FCFeedItemInventory *)self refreshInterval];
    BOOL v10 = v8 > v9;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_rescoreInventoryIfNeeded:(id)a3 forScoringVersion:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(FCFeedItemInventory *)self feedItemsRefreshSerialQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__FCFeedItemInventory__rescoreInventoryIfNeeded_forScoringVersion___block_invoke;
  v9[3] = &unk_1E5B5A8E0;
  void v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  [v7 enqueueBlock:v9];
}

void __67__FCFeedItemInventory__rescoreInventoryIfNeeded_forScoringVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 latestInventory];
  id v6 = v5;
  if (v5 == *(void **)(a1 + 40))
  {
    unint64_t v11 = [v5 feedItems];
    uint64_t v12 = [v11 lastObject];
    double v13 = [v12 scoreProfiles];
    double v9 = [v13 defaultScoreProfile];

    if (v9)
    {
      if ([v9 scoringVersion] == *(void *)(a1 + 48))
      {
        unint64_t v14 = (void *)FCFeedItemInventoryLog;
        if (!os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        uint64_t v15 = *(void **)(a1 + 32);
        id v16 = v14;
        uint64_t v17 = [v15 loggingKey];
        int v25 = 138543362;
        uint64_t v26 = v17;
        id v18 = "[%{public}@] not rescoring inventory due to version match";
      }
      else
      {
        uint64_t v21 = *(void **)(a1 + 32);
        uint64_t v22 = [v6 feedItems];
        [v21 _populateScoreProfilesForFeedItems:v22];

        [*(id *)(a1 + 32) _adoptInventory:v6];
        uint64_t v23 = (void *)FCFeedItemInventoryLog;
        if (!os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        id v24 = *(void **)(a1 + 32);
        id v16 = v23;
        uint64_t v17 = [v24 loggingKey];
        int v25 = 138543362;
        uint64_t v26 = v17;
        id v18 = "[%{public}@] rescored inventory";
      }
    }
    else
    {
      __int16 v19 = (void *)FCFeedItemInventoryLog;
      if (!os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      id v20 = *(void **)(a1 + 32);
      id v16 = v19;
      uint64_t v17 = [v20 loggingKey];
      int v25 = 138543362;
      uint64_t v26 = v17;
      id v18 = "[%{public}@] not rescoring inventory due to no score profile";
    }
    _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v25, 0xCu);

    goto LABEL_13;
  }
  double v7 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    double v9 = v7;
    id v10 = [v8 loggingKey];
    int v25 = 138543362;
    uint64_t v26 = v10;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] did not rescore inventory because it is no longer the latest", (uint8_t *)&v25, 0xCu);

LABEL_13:
  }
  v4[2](v4);
}

- (id)_loadInventoryFromCache
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = (void *)[[NSString alloc] initWithFormat:@"This operation must not be performed on the main thread."];
    *(_DWORD *)buf = 136315906;
    __int16 v33 = "-[FCFeedItemInventory _loadInventoryFromCache]";
    __int16 v34 = 2080;
    __int16 v35 = "FCFeedItemInventory.m";
    __int16 v36 = 1024;
    *(_DWORD *)id v37 = 378;
    *(_WORD *)&v37[4] = 2114;
    *(void *)&v37[6] = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  int v5 = (void *)MEMORY[0x1E4F1C9B8];
  id v6 = [(FCFeedItemInventory *)self filePath];
  double v7 = [v5 dataWithContentsOfFile:v6];

  if (!v7)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke;
    v31[3] = &unk_1E5B4C840;
    v31[4] = self;
    __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke((uint64_t)v31);
    id v20 = (FCPBFeedItemInventory *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  id v8 = v7;
  double v9 = [[FCPBFeedItemInventory alloc] initWithData:v8];
  id v10 = v9;
  if (v9)
  {
    unint64_t v11 = v9;
    unsigned int v12 = [(FCPBFeedItemInventory *)v11 inventoryVersion];
    if (v12 == [(FCFeedItemInventory *)self version])
    {
      if ([(FCPBFeedItemInventory *)v11 feedItemVersion] == 24)
      {
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v14 = v13;
        uint64_t v15 = (void *)FCFeedItemInventoryLog;
        if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
        {
          log = v15;
          id v24 = [(FCFeedItemInventory *)self loggingKey];
          id v16 = [(FCPBFeedItemInventory *)v11 feedItems];
          uint64_t v17 = [v16 count];
          id v18 = [(FCPBFeedItemInventory *)v11 lastRefreshed];
          __int16 v19 = [v18 nsDate];
          *(_DWORD *)buf = 138544130;
          __int16 v33 = v24;
          __int16 v34 = 2048;
          __int16 v35 = (char *)(fmax(v14 - v4, 0.0) * 1000.0);
          __int16 v36 = 2048;
          *(void *)id v37 = v17;
          *(_WORD *)&v37[8] = 2114;
          *(void *)&v37[10] = v19;
          _os_log_impl(&dword_1A460D000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded cached data in %llums with %lu feed items and last-refresh date %{public}@", buf, 0x2Au);
        }
        id v20 = v11;
        goto LABEL_16;
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_43;
      v26[3] = &unk_1E5B4E868;
      v26[4] = self;
      uint64_t v27 = v11;
      __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_43((uint64_t)v26);
      id v20 = (FCPBFeedItemInventory *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = v27;
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_42;
      v28[3] = &unk_1E5B4E868;
      v28[4] = self;
      unint64_t v29 = v11;
      __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_42((uint64_t)v28);
      id v20 = (FCPBFeedItemInventory *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = v29;
    }

LABEL_16:
    goto LABEL_17;
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_41;
  v30[3] = &unk_1E5B4C840;
  v30[4] = self;
  __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_41((uint64_t)v30);
  id v20 = (FCPBFeedItemInventory *)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
  return v20;
}

uint64_t __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(void **)(a1 + 32);
    double v4 = v2;
    int v5 = [v3 loggingKey];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] found no cached data on disk", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_41(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(void **)(a1 + 32);
    double v4 = v2;
    int v5 = [v3 loggingKey];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] failed to initialize inventory from cached data", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_42(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(void **)(a1 + 32);
    double v4 = v2;
    int v5 = [v3 loggingKey];
    int v6 = [*(id *)(a1 + 40) inventoryVersion];
    int v7 = [*(id *)(a1 + 32) version];
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 1024;
    int v12 = v6;
    __int16 v13 = 1024;
    int v14 = v7;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring cached data because its inventory version %u does not match the current version %u", (uint8_t *)&v9, 0x18u);
  }
  return 0;
}

uint64_t __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_43(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(void **)(a1 + 32);
    double v4 = v2;
    int v5 = [v3 loggingKey];
    int v6 = [*(id *)(a1 + 40) feedItemVersion];
    int v8 = 138543874;
    int v9 = v5;
    __int16 v10 = 1024;
    int v11 = v6;
    __int16 v12 = 1024;
    int v13 = 24;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring cached data because its feed item version %u does not match the current version %u", (uint8_t *)&v8, 0x18u);
  }
  return 0;
}

- (void)_populateScoreProfilesForFeedItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  [(FCFeedItemInventory *)self _populateScoreProfilesForFeedItems:v4 configurationSet:0];
  [(FCFeedItemInventory *)self _populateScoreProfilesForFeedItems:v4 configurationSet:11];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7;
  int v9 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    int v11 = [(FCFeedItemInventory *)self loggingKey];
    int v12 = 138543874;
    int v13 = v11;
    __int16 v14 = 2048;
    unint64_t v15 = (unint64_t)(fmax(v8 - v6, 0.0) * 1000.0);
    __int16 v16 = 2048;
    uint64_t v17 = [v4 count];
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] took %llums to generate score profiles for %ld items", (uint8_t *)&v12, 0x20u);
  }
}

- (void)_populateScoreProfilesForFeedItems:(id)a3 configurationSet:(int64_t)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  context = (void *)MEMORY[0x1A6260FD0]();
  double v7 = [(FCFeedItemInventory *)self context];
  double v8 = [v7 feedPersonalizer];
  int v25 = v6;
  int v9 = [v8 sortItems:v6 options:1 configurationSet:a4];

  uint64_t v23 = v9;
  __int16 v10 = [v9 scoreProfiles];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    __int16 v14 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v17 = [v10 objectForKey:v16];
        uint64_t v18 = [v16 scoreProfiles];

        if (!v18)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F82BB8]);
          [v16 setScoreProfiles:v19];
        }
        if (a4 == 11)
        {
          id v20 = [v17 pbScoreProfile];
          uint64_t v21 = [v16 scoreProfiles];
          [v21 setForYouGroupScoreProfile:v20];
          goto LABEL_12;
        }
        if (!a4)
        {
          id v20 = [v17 pbScoreProfile];
          uint64_t v21 = [v16 scoreProfiles];
          [v21 setDefaultScoreProfile:v20];
LABEL_12:

          goto LABEL_15;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
          *(_DWORD *)buf = 136315906;
          unint64_t v31 = "-[FCFeedItemInventory _populateScoreProfilesForFeedItems:configurationSet:]";
          __int16 v32 = 2080;
          __int16 v33 = "FCFeedItemInventory.m";
          __int16 v34 = 1024;
          int v35 = 444;
          __int16 v36 = 2114;
          id v37 = v22;
          _os_log_error_impl(&dword_1A460D000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
LABEL_15:
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v12);
  }
}

- (FCCloudContext)context
{
  return self->_context;
}

- (FCFeedItemServiceType)feedItemService
{
  return self->_feedItemService;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (unsigned)version
{
  return self->_version;
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (NSString)loggingKey
{
  return self->_loggingKey;
}

- (FCOnce)loadFromCacheOnce
{
  return self->_loadFromCacheOnce;
}

- (FCPBFeedItemInventory)latestInventory
{
  return (FCPBFeedItemInventory *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLatestInventory:(id)a3
{
}

- (FCAsyncSerialQueue)feedItemsRefreshSerialQueue
{
  return self->_feedItemsRefreshSerialQueue;
}

- (NSMutableSet)articleIDsToRescore
{
  return self->_articleIDsToRescore;
}

- (NFUnfairLock)articleIDsToRescoreLock
{
  return self->_articleIDsToRescoreLock;
}

- (FCOperationThrottler)targetedRescoreThrottler
{
  return self->_targetedRescoreThrottler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedRescoreThrottler, 0);
  objc_storeStrong((id *)&self->_articleIDsToRescoreLock, 0);
  objc_storeStrong((id *)&self->_articleIDsToRescore, 0);
  objc_storeStrong((id *)&self->_feedItemsRefreshSerialQueue, 0);
  objc_storeStrong((id *)&self->_latestInventory, 0);
  objc_storeStrong((id *)&self->_loadFromCacheOnce, 0);
  objc_storeStrong((id *)&self->_loggingKey, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_feedItemService, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end