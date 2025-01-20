@interface ActivitySummaryCache
+ (ActivitySummaryCache)sharedInstance;
+ (id)healthStore;
+ (void)setHealthStore:(id)a3;
- (ActivitySummaryCache)init;
- (id)activitySummaryForCacheIndex:(int64_t)a3;
- (id)objectForCacheIndex:(int64_t)a3;
- (int64_t)earliestActivitySummaryIndex;
- (int64_t)fitnessStartOfWeekOffset;
- (int64_t)latestActivitySummaryIndex;
- (int64_t)numberOfActivitySummaries;
- (void)loadDataIfNeeded;
- (void)removeObjectForCacheIndex:(int64_t)a3;
- (void)setObject:(id)a3 forCacheIndex:(int64_t)a4;
- (void)startActivitySummaryQuery;
@end

@implementation ActivitySummaryCache

- (void)loadDataIfNeeded
{
  if (!self->_query)
  {
    _HKInitializeLogging();
    v3 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[FASC] Initialize and start activity summary query", v4, 2u);
    }
    [(ActivitySummaryCache *)self startActivitySummaryQuery];
  }
}

- (int64_t)numberOfActivitySummaries
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DDC8C;
  v5[3] = &unk_1008ADA88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (ActivitySummaryCache)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012650;
  block[3] = &unk_1008AB950;
  block[4] = a1;
  if (qword_10096B5A0 != -1) {
    dispatch_once(&qword_10096B5A0, block);
  }
  v2 = (void *)qword_10096B5A8;

  return (ActivitySummaryCache *)v2;
}

- (void)setObject:(id)a3 forCacheIndex:(int64_t)a4
{
  id v6 = a3;
  readWriteQueue = self->_readWriteQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DDCC4;
  block[3] = &unk_1008AD828;
  id v10 = v6;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(readWriteQueue, block);
}

- (ActivitySummaryCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)ActivitySummaryCache;
  v2 = [(ActivitySummaryCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    readWriteQueue = v2->_readWriteQueue;
    v2->_readWriteQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cache = v2->_cache;
    v2->_cache = v5;
  }
  return v2;
}

- (void)startActivitySummaryQuery
{
  objc_initWeak(location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100087124;
  v30[3] = &unk_1008ABD40;
  objc_copyWeak(&v31, location);
  uint64_t v3 = objc_retainBlock(v30);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100151688;
  v28[3] = &unk_1008AB8D8;
  objc_copyWeak(&v29, location);
  v4 = objc_retainBlock(v28);
  v5 = +[NSDate date];
  id v6 = _HKActivityCacheDateComponentsFromCacheIndex();
  v7 = +[NSDate distantFuture];
  objc_super v8 = +[NSCalendar hk_gregorianCalendar];
  uint64_t v9 = _HKActivityCacheDateComponentsFromDate();

  id v10 = +[HKQuery predicateForActivitySummariesBetweenStartDateComponents:v6 endDateComponents:v9];
  id v11 = objc_alloc((Class)HKActivitySummaryQuery);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002C3BC;
  v24[3] = &unk_1008ADAB0;
  v12 = v4;
  id v26 = v12;
  id v13 = v5;
  id v25 = v13;
  v14 = v3;
  id v27 = v14;
  v15 = (HKActivitySummaryQuery *)[v11 initWithPredicate:v10 resultsHandler:v24];
  query = self->_query;
  self->_query = v15;

  v17 = self->_query;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001517C0;
  v21[3] = &unk_1008ADAD8;
  v18 = v12;
  id v22 = v18;
  v19 = v14;
  id v23 = v19;
  [(HKActivitySummaryQuery *)v17 setUpdateHandler:v21];
  [(HKActivitySummaryQuery *)self->_query setShouldIncludeActivitySummaryPrivateProperties:1];
  [(HKActivitySummaryQuery *)self->_query setShouldIncludeActivitySummaryStatistics:0];
  [(HKActivitySummaryQuery *)self->_query setDebugIdentifier:@"ActivitySummaryCache.activitySummaryQuery"];
  v20 = [(id)objc_opt_class() healthStore];
  [v20 executeQuery:self->_query];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

- (id)objectForCacheIndex:(int64_t)a3
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001515A8;
  id v11 = sub_1001515B8;
  id v12 = 0;
  readWriteQueue = self->_readWriteQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087344;
  block[3] = &unk_1008ADA60;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(readWriteQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)activitySummaryForCacheIndex:(int64_t)a3
{
  return [(ActivitySummaryCache *)self objectForCacheIndex:a3];
}

- (int64_t)latestActivitySummaryIndex
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DCC38;
  v5[3] = &unk_1008ADA88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)setHealthStore:(id)a3
{
}

+ (id)healthStore
{
  return (id)qword_10096B590;
}

- (void)removeObjectForCacheIndex:(int64_t)a3
{
  readWriteQueue = self->_readWriteQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100151548;
  v4[3] = &unk_1008AD108;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(readWriteQueue, v4);
}

- (int64_t)earliestActivitySummaryIndex
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10015166C;
  v5[3] = &unk_1008ADA88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)fitnessStartOfWeekOffset
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_readWriteQueue, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end