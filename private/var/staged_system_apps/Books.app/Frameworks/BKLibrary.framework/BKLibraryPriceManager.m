@interface BKLibraryPriceManager
- (BKLibraryManager)libraryManager;
- (BKLibraryPriceManager)initWithLibraryManager:(id)a3;
- (NSDate)expirationDate;
- (NSDictionary)seriesAssets;
- (NSMutableArray)listeners;
- (NSMutableDictionary)allStoreAssets;
- (NSMutableDictionary)completionHandlers;
- (NSMutableDictionary)prices;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)testQueue;
- (unint64_t)generationCount;
- (unint64_t)generationFetched;
- (void)_callCompletionHandlers:(id)a3;
- (void)_fetchPricesForStoreAssetIDs;
- (void)_fetchPricesForStoreAssets:(id)a3 forGeneration:(unint64_t)a4;
- (void)_internetReachabilityChanged:(id)a3;
- (void)_invalidate:(id)a3;
- (void)_notifyListeners:(id)a3;
- (void)addListener:(id)a3;
- (void)cancelForAssetID:(id)a3;
- (void)collectPricesForSeriesStoreIDs:(id)a3 isAudiobookSeries:(BOOL)a4;
- (void)dealloc;
- (void)fetchPriceForAssetID:(id)a3 completion:(id)a4;
- (void)invalidate:(id)a3;
- (void)removeListener:(id)a3;
- (void)setAllStoreAssets:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setGenerationCount:(unint64_t)a3;
- (void)setGenerationFetched:(unint64_t)a3;
- (void)setLibraryManager:(id)a3;
- (void)setListeners:(id)a3;
- (void)setPrices:(id)a3;
- (void)setSeriesAssets:(id)a3;
- (void)setTestQueue:(id)a3;
- (void)testPriceForStoreID:(id)a3 completion:(id)a4;
@end

@implementation BKLibraryPriceManager

- (BKLibraryPriceManager)initWithLibraryManager:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BKLibraryPriceManager;
  v5 = [(BKLibraryPriceManager *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_libraryManager, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iBooks.BKLibraryPriceManager.dispatchQueue", v8);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    prices = v6->_prices;
    v6->_prices = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    completionHandlers = v6->_completionHandlers;
    v6->_completionHandlers = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    listeners = v6->_listeners;
    v6->_listeners = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    allStoreAssets = v6->_allStoreAssets;
    v6->_allStoreAssets = (NSMutableDictionary *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("BCCloudAssetManager.testQueue", v19);
    testQueue = v6->_testQueue;
    v6->_testQueue = (OS_dispatch_queue *)v20;

    *(_OWORD *)&v6->_generationCount = xmmword_A5A20;
    v22 = +[NSNotificationCenter defaultCenter];
    v23 = +[BKReachability sharedReachabilityForInternetConnection];
    [v22 addObserver:v6 selector:"_internetReachabilityChanged:" name:@"kNetworkReachabilityChangedNotification" object:v23];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  id v4 = +[BKReachability sharedReachabilityForInternetConnection];
  [v3 removeObserver:self name:@"kNetworkReachabilityChangedNotification" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryPriceManager;
  [(BKLibraryPriceManager *)&v5 dealloc];
}

- (void)collectPricesForSeriesStoreIDs:(id)a3 isAudiobookSeries:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v12);
        v14 = [BKLibraryPriceManagerAsset alloc];
        uint64_t v15 = -[BKLibraryPriceManagerAsset initWithType:storeID:](v14, "initWithType:storeID:", v4, v13, (void)v20);
        [v7 setObject:v15 forKeyedSubscript:v13];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  id v16 = [v7 copy];
  [(BKLibraryPriceManager *)self setSeriesAssets:v16];

  uint64_t v17 = [(BKLibraryPriceManager *)self allStoreAssets];
  v18 = [(BKLibraryPriceManager *)self seriesAssets];
  [v17 addEntriesFromDictionary:v18];

  v19 = [(BKLibraryPriceManager *)self seriesAssets];
  [(BKLibraryPriceManager *)self _fetchPricesForStoreAssets:v19 forGeneration:[(BKLibraryPriceManager *)self generationCount]];
}

- (void)fetchPriceForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKLibraryPriceManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5E1EC;
  block[3] = &unk_D22F0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)cancelForAssetID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BKLibraryPriceManager *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5E5E4;
  v7[3] = &unk_D1418;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BKLibraryPriceManager *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5E708;
  v7[3] = &unk_D1418;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BKLibraryPriceManager *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5E840;
  v7[3] = &unk_D1418;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)invalidate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BKLibraryPriceManager *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5E9F4;
  v7[3] = &unk_D1548;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_invalidate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BKLibraryPriceManager *)self prices];
  [v5 removeAllObjects];

  id v6 = [(BKLibraryPriceManager *)self allStoreAssets];
  [v6 removeAllObjects];

  [(BKLibraryPriceManager *)self _callCompletionHandlers:0];
  id v7 = [(BKLibraryPriceManager *)self dispatchQueue];
  dispatch_suspend(v7);

  id v8 = [(BKLibraryPriceManager *)self libraryManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5EB08;
  v10[3] = &unk_D31D0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 allUnownedStoreAssetIDs:v10];
}

- (void)_internetReachabilityChanged:(id)a3
{
}

- (void)_fetchPricesForStoreAssetIDs
{
  v3 = [(BKLibraryPriceManager *)self generationFetched];
  if (v3 != (void *)[(BKLibraryPriceManager *)self generationCount])
  {
    [(BKLibraryPriceManager *)self setGenerationFetched:[(BKLibraryPriceManager *)self generationCount]];
    id v4 = [(BKLibraryPriceManager *)self allStoreAssets];
    [(BKLibraryPriceManager *)self _fetchPricesForStoreAssets:v4 forGeneration:[(BKLibraryPriceManager *)self generationCount]];
  }
}

- (void)_fetchPricesForStoreAssets:(id)a3 forGeneration:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [v5 allValues];
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = [v13 type];
        uint64_t v15 = [v13 storeID];
        if (v14) {
          id v16 = v7;
        }
        else {
          id v16 = v6;
        }
        [v16 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  uint64_t v17 = +[BCMBridgedCatalogService sharedInstance];
  id v18 = objc_alloc((Class)BFMRequestMetadata);
  v19 = +[NSString stringWithFormat:@"%s", "BKLibraryPriceManager.m"];
  id v20 = [v18 initWithFileID:v19 line:319];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_5F16C;
  v22[3] = &unk_D31F8;
  v22[4] = self;
  v22[5] = a4;
  [v17 fetchMixedAssetsWithBookIds:v6 audiobookIds:v7 relationships:0 views:0 additionalParameters:0 batchSize:0 metadata:v20 completionHandler:v22];
}

- (void)_notifyListeners:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryPriceManager *)self listeners];
  id v6 = [v5 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) nonretainedObjectValue:(void)v13];
        if (objc_opt_respondsToSelector()) {
          [v12 priceManager:self updatedPrices:v4];
        }

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_callCompletionHandlers:(id)a3
{
  id v23 = a3;
  long long v21 = self;
  id v4 = [(BKLibraryPriceManager *)self completionHandlers];
  id v5 = [v4 copy];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v22 = v5;
  id obj = [v5 allKeys];
  id v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v23 objectForKeyedSubscript:v10];
        id v12 = [v22 objectForKeyedSubscript:v10];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = objc_retainBlock(*(id *)(*((void *)&v24 + 1) + 8 * (void)j));
              id v18 = v17;
              if (v17) {
                (*((void (**)(id, uint64_t, void *))v17 + 2))(v17, v10, v11);
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
        v19 = [(BKLibraryPriceManager *)v21 completionHandlers];
        [v19 removeObjectForKey:v10];
      }
      id v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
}

- (void)testPriceForStoreID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(BKLibraryPriceManager *)self testQueue];
  dispatch_time_t v9 = dispatch_time(0, 15000000000);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5FA40;
  v12[3] = &unk_D1DE8;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_after(v9, v8, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (void)setLibraryManager:(id)a3
{
}

- (NSMutableDictionary)prices
{
  return self->_prices;
}

- (void)setPrices:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (NSMutableDictionary)allStoreAssets
{
  return self->_allStoreAssets;
}

- (void)setAllStoreAssets:(id)a3
{
}

- (NSDictionary)seriesAssets
{
  return self->_seriesAssets;
}

- (void)setSeriesAssets:(id)a3
{
}

- (OS_dispatch_queue)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(unint64_t)a3
{
  self->_generationCount = a3;
}

- (unint64_t)generationFetched
{
  return self->_generationFetched;
}

- (void)setGenerationFetched:(unint64_t)a3
{
  self->_generationFetched = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_seriesAssets, 0);
  objc_storeStrong((id *)&self->_allStoreAssets, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_prices, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end