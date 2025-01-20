@interface VIAEventCache
- (VIAEventCache)initWithQueue:(id)a3;
- (VIAnalyticsTestingDelegate)testingDelegate;
- (id)_cachedEventsForBundleID:(id)a3;
- (id)cachedEventForBundleID:(id)a3 queryID:(unint64_t)a4;
- (void)cacheEvent:(id)a3;
- (void)setTestingDelegate:(id)a3;
@end

@implementation VIAEventCache

- (VIAEventCache)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VIAEventCache;
  v6 = [(VIAEventCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = objc_opt_new();
    appToEventMap = v7->_appToEventMap;
    v7->_appToEventMap = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)cacheEvent:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 originatingApplication];
  v6 = [(VIAEventCache *)self _cachedEventsForBundleID:v5];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "queryID"));
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    v9 = [v6 objectForKeyedSubscript:v7];
    id v10 = (id)[v9 mutableCopy];

    if (!v10) {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    [v10 addObject:v4];
    objc_super v11 = (void *)[v10 copy];
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "queryID"));
    [v6 setObject:v11 forKeyedSubscript:v12];

    id v13 = v6;
    if ((unint64_t)[v13 count] >= 0x65)
    {
      v14 = [v13 allKeys];
      v15 = [v14 sortedArrayUsingSelector:sel_compare_];
      v16 = [v15 firstObject];

      if (v16) {
        [v13 removeObjectForKey:v16];
      }
    }
  }
  else
  {
    id v29 = v4;
    uint64_t v30 = v7;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    v31[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v19 = (void *)[v18 mutableCopy];
    appToEventMap = self->_appToEventMap;
    v21 = [v4 originatingApplication];
    [(NSMutableDictionary *)appToEventMap setObject:v19 forKeyedSubscript:v21];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);

  if (WeakRetained)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_testingDelegate);
    v24 = [v4 feedback];
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = [v4 originatingApplication];
    v28 = [(VIAEventCache *)self _cachedEventsForBundleID:v27];
    objc_msgSend(v23, "didCacheEventName:currentCacheSize:", v26, objc_msgSend(v28, "count"));
  }
}

- (id)cachedEventForBundleID:(id)a3 queryID:(unint64_t)a4
{
  queue = self->_queue;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v8 = [(NSMutableDictionary *)self->_appToEventMap objectForKeyedSubscript:v7];

  v9 = [NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [v8 objectForKeyedSubscript:v9];
  objc_super v11 = (void *)[v10 copy];

  return v11;
}

- (id)_cachedEventsForBundleID:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = [(NSMutableDictionary *)self->_appToEventMap objectForKeyedSubscript:v5];

  return v6;
}

- (VIAnalyticsTestingDelegate)testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
  return (VIAnalyticsTestingDelegate *)WeakRetained;
}

- (void)setTestingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_appToEventMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end