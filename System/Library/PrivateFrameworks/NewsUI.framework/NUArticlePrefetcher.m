@interface NUArticlePrefetcher
- (FCKeyedOperationQueue)prefetchQueue;
- (NSCountedSet)interestedArticleIDs;
- (NSMutableDictionary)articleDataProviderCache;
- (NSMutableDictionary)headlinesForArticles;
- (NSMutableDictionary)interestModificationDates;
- (NSMutableSet)failedArticleIDs;
- (NSTimer)reprocessTimer;
- (NUArticleDataProviderFactory)articleDataProviderFactory;
- (NUArticleFactory)articleFactory;
- (NUArticlePrefetcher)init;
- (NUArticlePrefetcher)initWithArticleFactory:(id)a3 articleDataProviderFactory:(id)a4;
- (OS_dispatch_queue)workQueue;
- (id)_prefetchDataProviderWithArticleID:(id)a3 completion:(id)a4;
- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5;
- (id)prefetchedArticleDataProviderForArticleID:(id)a3;
- (unint64_t)highWaterMark;
- (void)_didChangeInterestedArticleIDs;
- (void)_flushDataProviderIfNeededForHeadline:(id)a3;
- (void)_flushUnusedDataProvidersIfNeeded;
- (void)_reprocessInterestedArticleIDs;
- (void)_revisitSuspendedState;
- (void)addPrefetchInterestInArticleID:(id)a3 headline:(id)a4;
- (void)prefetchArticleID:(id)a3 headline:(id)a4 completion:(id)a5;
- (void)removePrefetchInterestInArticleID:(id)a3;
- (void)setArticleDataProviderCache:(id)a3;
- (void)setArticleDataProviderFactory:(id)a3;
- (void)setArticleFactory:(id)a3;
- (void)setFailedArticleIDs:(id)a3;
- (void)setHeadlinesForArticles:(id)a3;
- (void)setHighWaterMark:(unint64_t)a3;
- (void)setInterestModificationDates:(id)a3;
- (void)setInterestedArticleIDs:(id)a3;
- (void)setPrefetchQueue:(id)a3;
- (void)setReprocessTimer:(id)a3;
@end

@implementation NUArticlePrefetcher

- (NUArticlePrefetcher)initWithArticleFactory:(id)a3 articleDataProviderFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)NUArticlePrefetcher;
  v9 = [(NUArticlePrefetcher *)&v29 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_articleFactory, a3);
    objc_storeStrong((id *)&v10->_articleDataProviderFactory, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F59520]) initWithDelegate:v10 maxConcurrentOperationCount:1];
    prefetchQueue = v10->_prefetchQueue;
    v10->_prefetchQueue = (FCKeyedOperationQueue *)v11;

    [(FCKeyedOperationQueue *)v10->_prefetchQueue setExecutionQueue:MEMORY[0x263EF83A0]];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v15 = dispatch_queue_create("NUArticlePrefetcher.work", v14);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    articleDataProviderCache = v10->_articleDataProviderCache;
    v10->_articleDataProviderCache = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    failedArticleIDs = v10->_failedArticleIDs;
    v10->_failedArticleIDs = v19;

    v21 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    interestedArticleIDs = v10->_interestedArticleIDs;
    v10->_interestedArticleIDs = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    headlinesForArticles = v10->_headlinesForArticles;
    v10->_headlinesForArticles = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    interestModificationDates = v10->_interestModificationDates;
    v10->_interestModificationDates = v25;

    v27 = [MEMORY[0x263F08A00] defaultCenter];
    [v27 addObserver:v10 selector:sel__revisitSuspendedState name:*MEMORY[0x263F08450] object:0];

    [(NUArticlePrefetcher *)v10 _revisitSuspendedState];
  }

  return v10;
}

- (void)_revisitSuspendedState
{
}

void __45__NUArticlePrefetcher__revisitSuspendedState__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08AB0] processInfo];
  if ([v3 isLowPowerModeEnabled])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) setSuspended:1];
  }
  else
  {
    v2 = [MEMORY[0x263F59548] sharedNetworkReachability];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setSuspended:", objc_msgSend(v2, "isLowDataModeEnabled"));
  }
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v2 = [*(id *)(a1 + 32) articleDataProviderFactory];
    id v4 = [v2 createArticleDataProviderWithArticle:*(void *)(a1 + 40)];

    id v3 = [*(id *)(a1 + 32) articleDataProviderCache];
    [v3 setObject:v4 forKey:*(void *)(a1 + 48)];

    [*(id *)(a1 + 32) _flushUnusedDataProvidersIfNeeded];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = NUSharedLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v5;
    _os_log_impl(&dword_2221C5000, v4, OS_LOG_TYPE_DEFAULT, "will prefetch contents of article ID %{public}@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_32;
  v9[3] = &unk_2645FF678;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 48);
  id v12 = v3;
  uint64_t v13 = v7;
  id v14 = v6;
  id v8 = v3;
  [v8 loadContextWithCompletionBlock:v9];
}

- (NUArticleDataProviderFactory)articleDataProviderFactory
{
  return self->_articleDataProviderFactory;
}

- (void)addPrefetchInterestInArticleID:(id)a3 headline:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F08B88] isMainThread];
  id v8 = [(NUArticlePrefetcher *)self interestedArticleIDs];
  uint64_t v9 = [v8 countForObject:v6];

  id v10 = [(NUArticlePrefetcher *)self interestedArticleIDs];
  [v10 addObject:v6];

  id v11 = [(NUArticlePrefetcher *)self interestModificationDates];
  id v12 = [MEMORY[0x263EFF910] date];
  [v11 setObject:v12 forKey:v6];

  if (v7)
  {
    [(NUArticlePrefetcher *)self _flushDataProviderIfNeededForHeadline:v7];
    uint64_t v13 = [(NUArticlePrefetcher *)self headlinesForArticles];
    [v13 setObject:v7 forKey:v6];
  }
  if (!v9)
  {
    id v14 = NUSharedLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_2221C5000, v14, OS_LOG_TYPE_DEFAULT, "added prefetch interest in article ID %{public}@", (uint8_t *)&v15, 0xCu);
    }

    [(NUArticlePrefetcher *)self _didChangeInterestedArticleIDs];
  }
}

- (NSMutableDictionary)interestModificationDates
{
  return self->_interestModificationDates;
}

- (void)_reprocessInterestedArticleIDs
{
  [MEMORY[0x263F08B88] isMainThread];
  unint64_t v3 = [(NUArticlePrefetcher *)self highWaterMark];
  id v4 = [(NUArticlePrefetcher *)self interestedArticleIDs];
  unint64_t v5 = [v4 count];

  if (v3 <= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v3;
  }
  [(NUArticlePrefetcher *)self setHighWaterMark:v6];
  id v7 = (void *)MEMORY[0x263EFF9D8];
  id v8 = [(NUArticlePrefetcher *)self interestedArticleIDs];
  uint64_t v9 = [v8 allObjects];
  id v10 = [v7 orderedSetWithArray:v9];
  id v11 = [(NUArticlePrefetcher *)self prefetchQueue];
  [v11 setKeyQueue:v10];

  id v12 = [(NUArticlePrefetcher *)self reprocessTimer];
  [v12 invalidate];

  [(NUArticlePrefetcher *)self setReprocessTimer:0];
}

- (NSCountedSet)interestedArticleIDs
{
  return self->_interestedArticleIDs;
}

- (NSTimer)reprocessTimer
{
  return self->_reprocessTimer;
}

- (unint64_t)highWaterMark
{
  return self->_highWaterMark;
}

- (void)setHighWaterMark:(unint64_t)a3
{
  self->_highWaterMark = a3;
}

- (FCKeyedOperationQueue)prefetchQueue
{
  return self->_prefetchQueue;
}

- (id)_prefetchDataProviderWithArticleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F08B88] isMainThread];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F59590]) initWithOptions:1];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke;
  v34[3] = &unk_2645FF6A0;
  id v9 = v6;
  id v35 = v9;
  id v10 = v8;
  id v36 = v10;
  id v11 = v7;
  v37 = self;
  id v38 = v11;
  id v12 = (void (**)(void, void))MEMORY[0x223C968A0](v34);
  uint64_t v13 = [(NUArticlePrefetcher *)self articleDataProviderCache];
  id v14 = [v13 objectForKey:v9];

  if (v14)
  {
    ((void (**)(void, void *))v12)[2](v12, v14);
  }
  else
  {
    int v15 = [(NUArticlePrefetcher *)self headlinesForArticles];
    id v16 = [v15 objectForKeyedSubscript:v9];

    uint64_t v17 = [(NUArticlePrefetcher *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_3;
    block[3] = &unk_2645FF6F0;
    id v29 = v16;
    v30 = self;
    id v31 = v9;
    v33 = v39;
    v32 = v12;
    id v18 = v16;
    dispatch_async(v17, block);
  }
  v19 = (void *)MEMORY[0x263F593D8];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_6;
  v24[3] = &unk_2645FE220;
  v27 = v39;
  id v20 = v10;
  id v25 = v20;
  id v21 = v11;
  id v26 = v21;
  v22 = [v19 cancelHandlerWithBlock:v24];

  _Block_object_dispose(v39, 8);

  return v22;
}

- (NSMutableDictionary)articleDataProviderCache
{
  return self->_articleDataProviderCache;
}

- (NSMutableDictionary)headlinesForArticles
{
  return self->_headlinesForArticles;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_flushUnusedDataProvidersIfNeeded
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F08B88] isMainThread];
  unint64_t v3 = [(NUArticlePrefetcher *)self articleDataProviderCache];
  unint64_t v4 = [v3 count];
  unint64_t v5 = [(NUArticlePrefetcher *)self highWaterMark];

  if (v4 > v5)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = [(NUArticlePrefetcher *)self articleDataProviderCache];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
          uint64_t v13 = [(NUArticlePrefetcher *)self interestedArticleIDs];
          uint64_t v14 = [v13 countForObject:v12];

          if (!v14) {
            [v6 addObject:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __56__NUArticlePrefetcher__flushUnusedDataProvidersIfNeeded__block_invoke;
    v21[3] = &unk_2645FF718;
    v21[4] = self;
    [v6 sortUsingComparator:v21];
    while ([v6 count])
    {
      int v15 = [(NUArticlePrefetcher *)self articleDataProviderCache];
      unint64_t v16 = [v15 count];
      unint64_t v17 = [(NUArticlePrefetcher *)self highWaterMark];

      if (v16 <= v17) {
        break;
      }
      id v18 = objc_msgSend(v6, "fc_popFirstObject");
      v19 = [(NUArticlePrefetcher *)self articleDataProviderCache];
      [v19 removeObjectForKey:v18];

      id v20 = [(NUArticlePrefetcher *)self failedArticleIDs];
      [v20 removeObject:v18];
    }
  }
}

- (void)_didChangeInterestedArticleIDs
{
  [MEMORY[0x263F08B88] isMainThread];
  unint64_t v3 = [(NUArticlePrefetcher *)self reprocessTimer];

  if (!v3)
  {
    id v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__reprocessInterestedArticleIDs selector:0 userInfo:0 repeats:0.01];
    [(NUArticlePrefetcher *)self setReprocessTimer:v4];
  }
}

- (void)setReprocessTimer:(id)a3
{
}

- (void)_flushDataProviderIfNeededForHeadline:(id)a3
{
  id v14 = a3;
  [MEMORY[0x263F08B88] isMainThread];
  id v4 = [(NUArticlePrefetcher *)self articleDataProviderCache];
  unint64_t v5 = [v14 identifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = v6;
    if (([v14 isDisplayingAsNativeAd] & 1) == 0)
    {
      uint64_t v8 = [v7 article];
      id v9 = [v8 headline];

      if (v9 != v14)
      {
        uint64_t v10 = [(NUArticlePrefetcher *)self articleDataProviderCache];
        uint64_t v11 = [v14 identifier];
        [v10 removeObjectForKey:v11];

        uint64_t v12 = [(NUArticlePrefetcher *)self failedArticleIDs];
        uint64_t v13 = [v14 identifier];
        [v12 removeObject:v13];
      }
    }
  }
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_3(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) articleFactory];
  id v4 = v3;
  if (v2)
  {
    unint64_t v5 = [v3 createArticleForHeadline:*(void *)(a1 + 32)];
  }
  else
  {
    v11[0] = *(void *)(a1 + 48);
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    id v7 = [v4 createArticlesForArticleIDs:v6];
    unint64_t v5 = [v7 firstObject];
  }
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v8 = v5;
  FCPerformBlockOnMainThread();
}

- (NUArticleFactory)articleFactory
{
  return self->_articleFactory;
}

- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F08B88];
  id v9 = a4;
  [v8 isMainThread];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__NUArticlePrefetcher_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke;
  v13[3] = &unk_2645FF650;
  id v14 = v7;
  id v10 = v7;
  uint64_t v11 = [(NUArticlePrefetcher *)self _prefetchDataProviderWithArticleID:v9 completion:v13];

  return v11;
}

- (NUArticlePrefetcher)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[NUArticlePrefetcher init]";
    __int16 v9 = 2080;
    id v10 = "NUArticlePrefetcher.m";
    __int16 v11 = 1024;
    int v12 = 89;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_2221C5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  unint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NUArticlePrefetcher init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)removePrefetchInterestInArticleID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [MEMORY[0x263F08B88] isMainThread];
  unint64_t v5 = [(NUArticlePrefetcher *)self interestedArticleIDs];
  uint64_t v6 = [v5 countForObject:v4];

  id v7 = [(NUArticlePrefetcher *)self interestedArticleIDs];
  [v7 removeObject:v4];

  id v8 = [(NUArticlePrefetcher *)self interestModificationDates];
  __int16 v9 = [MEMORY[0x263EFF910] date];
  [v8 setObject:v9 forKey:v4];

  id v10 = [(NUArticlePrefetcher *)self headlinesForArticles];
  [v10 removeObjectForKey:v4];

  if (v6 == 1)
  {
    __int16 v11 = NUSharedLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_2221C5000, v11, OS_LOG_TYPE_DEFAULT, "removed prefetch interest in article ID %{public}@", (uint8_t *)&v12, 0xCu);
    }

    [(NUArticlePrefetcher *)self _didChangeInterestedArticleIDs];
  }
}

- (void)prefetchArticleID:(id)a3 headline:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x263F08B88];
  id v11 = a4;
  [v10 isMainThread];
  [(NUArticlePrefetcher *)self addPrefetchInterestInArticleID:v8 headline:v11];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke;
  v15[3] = &unk_2645FF628;
  id v16 = v8;
  unint64_t v17 = self;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = [(NUArticlePrefetcher *)self _prefetchDataProviderWithArticleID:v13 completion:v15];
}

void __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6 = a4;
  if (a3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke_cold_1(a1);
  }
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v7 = objc_alloc(MEMORY[0x263F59500]);
  uint64_t v8 = MEMORY[0x263EF83A0];
  id v9 = MEMORY[0x263EF83A0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke_23;
  v11[3] = &unk_2645FEDE0;
  objc_copyWeak(&v13, &location);
  id v12 = *(id *)(a1 + 32);
  id v10 = (void *)[v7 initWithCallbackQueue:v8 removeInterestBlock:v11];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke_23(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removePrefetchInterestInArticleID:*(void *)(a1 + 32)];
}

- (id)prefetchedArticleDataProviderForArticleID:(id)a3
{
  id v4 = a3;
  [MEMORY[0x263F08B88] isMainThread];
  unint64_t v5 = [(NUArticlePrefetcher *)self failedArticleIDs];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = [(NUArticlePrefetcher *)self articleDataProviderCache];
    id v7 = [v8 objectForKey:v4];
  }

  return v7;
}

uint64_t __82__NUArticlePrefetcher_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a4;
  char v6 = NUSharedLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_32_cold_1(a1, v7);
    }

    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_34;
    id v20 = &unk_2645FF500;
    uint64_t v8 = (id *)v21;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    v21[0] = v9;
    v21[1] = v10;
    id v22 = *(id *)(a1 + 32);
    FCPerformBlockOnMainThread();
    id v11 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_2;
    v14[3] = &unk_2645FF4D8;
    id v16 = *(id *)(a1 + 64);
    id v15 = v5;
    [v11 executeOnce:v14];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v12;
      _os_log_impl(&dword_2221C5000, v7, OS_LOG_TYPE_DEFAULT, "did prefetch contents of article ID %{public}@", buf, 0xCu);
    }

    id v13 = *(void **)(a1 + 40);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_33;
    v23[3] = &unk_2645FE158;
    uint64_t v8 = &v24;
    id v24 = *(id *)(a1 + 64);
    [v13 executeOnce:v23];
  }
}

uint64_t __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_34(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) articleDataProviderCache];
  id v4 = [v3 objectForKey:*(void *)(a1 + 48)];

  if (v2 == v4)
  {
    id v5 = [*(id *)(a1 + 40) failedArticleIDs];
    [v5 addObject:*(void *)(a1 + 48)];
  }
}

uint64_t __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_6(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_7;
  v2[3] = &unk_2645FE158;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 executeOnce:v2];
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F592B8] code:1 userInfo:0];
  (*(void (**)(uint64_t, void, uint64_t, id))(v1 + 16))(v1, 0, 1, v2);
}

uint64_t __56__NUArticlePrefetcher__flushUnusedDataProvidersIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 interestModificationDates];
  id v9 = [v8 objectForKey:v7];

  uint64_t v10 = [*(id *)(a1 + 32) interestModificationDates];
  id v11 = [v10 objectForKey:v6];

  uint64_t v12 = [v9 compare:v11];
  return v12;
}

- (void)setArticleFactory:(id)a3
{
}

- (void)setArticleDataProviderFactory:(id)a3
{
}

- (void)setPrefetchQueue:(id)a3
{
}

- (void)setArticleDataProviderCache:(id)a3
{
}

- (NSMutableSet)failedArticleIDs
{
  return self->_failedArticleIDs;
}

- (void)setFailedArticleIDs:(id)a3
{
}

- (void)setInterestedArticleIDs:(id)a3
{
}

- (void)setHeadlinesForArticles:(id)a3
{
}

- (void)setInterestModificationDates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reprocessTimer, 0);
  objc_storeStrong((id *)&self->_interestModificationDates, 0);
  objc_storeStrong((id *)&self->_headlinesForArticles, 0);
  objc_storeStrong((id *)&self->_interestedArticleIDs, 0);
  objc_storeStrong((id *)&self->_failedArticleIDs, 0);
  objc_storeStrong((id *)&self->_articleDataProviderCache, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_articleDataProviderFactory, 0);

  objc_storeStrong((id *)&self->_articleFactory, 0);
}

void __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)[[NSString alloc] initWithFormat:@"prefetch unexpectedly cancelled for article ID %@", *(void *)(a1 + 32)];
  *(_DWORD *)buf = 136315906;
  id v3 = "-[NUArticlePrefetcher prefetchArticleID:headline:completion:]_block_invoke";
  __int16 v4 = 2080;
  id v5 = "NUArticlePrefetcher.m";
  __int16 v6 = 1024;
  int v7 = 141;
  __int16 v8 = 2114;
  id v9 = v1;
  _os_log_error_impl(&dword_2221C5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_32_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2221C5000, a2, OS_LOG_TYPE_ERROR, "failed to prefetch contents of article ID %{public}@", (uint8_t *)&v3, 0xCu);
}

@end