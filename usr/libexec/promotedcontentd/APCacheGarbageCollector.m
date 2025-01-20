@interface APCacheGarbageCollector
- (APCacheGarbageCollector)initWithCacheStore:(id)a3 expirationDate:(id)a4 timeSincePrevLaunch:(double)a5;
- (APPersistentCachedStoreTransactionalProtocol)cacheStore;
- (NSDate)expirationDate;
- (NSOperation)activeCleanupOperation;
- (NSOperationQueue)operationQueue;
- (NSString)objectKind;
- (double)timeSincePrevLaunch;
- (id)completionHandler;
- (int64_t)maxObjectLifeTimeDays;
- (void)_handleAncientItem:(id)a3;
- (void)_removeItem:(id)a3;
- (void)_removeItemInBlockForKey:(id)a3;
- (void)_reportStatisticsForDuration:(double)a3 storageInfo:(id)a4 cancelled:(BOOL)a5;
- (void)collect;
- (void)setActiveCleanupOperation:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setMaxObjectLifeTimeDays:(int64_t)a3;
- (void)setTimeSincePrevLaunch:(double)a3;
- (void)stop;
@end

@implementation APCacheGarbageCollector

- (APCacheGarbageCollector)initWithCacheStore:(id)a3 expirationDate:(id)a4 timeSincePrevLaunch:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)APCacheGarbageCollector;
  v11 = [(APCacheGarbageCollector *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cacheStore, a3);
    v13 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v12->_operationQueue;
    v12->_operationQueue = v13;

    [(NSOperationQueue *)v12->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v12->_operationQueue setName:@"com.apple.ap.cache-cleaner"];
    [(NSOperationQueue *)v12->_operationQueue setQualityOfService:9];
    objc_storeStrong((id *)&v12->_expirationDate, a4);
    v12->_timeSincePrevLaunch = a5;
  }

  return v12;
}

- (void)collect
{
  v3 = [(APCacheGarbageCollector *)self cacheStore];
  v4 = [v3 fileStorage];
  v5 = [v4 enumeratorForFilesWithExtension:0];

  atomic_store(0, &self->_removedObjectsCount);
  atomic_store(0, &self->_ancientObjectsCount);
  v6 = [APCacheStoreCleanupOperation alloc];
  v7 = [(APCacheGarbageCollector *)self expirationDate];
  v8 = [(APCacheStoreCleanupOperation *)v6 initWithFilesEnumerator:v5 expirationDate:v7];

  [(APCacheStoreCleanupOperation *)v8 maxObjectLifetime];
  if (v9 <= 0.0)
  {
    id v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Max object lifetime is zero.", (uint8_t *)&buf, 2u);
    }
  }
  [(APCacheStoreCleanupOperation *)v8 maxObjectLifetime];
  [(APCacheGarbageCollector *)self setMaxObjectLifeTimeDays:(uint64_t)(v11 / 86400.0)];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100174B90;
  v25[3] = &unk_100238800;
  v25[4] = self;
  [(APCacheStoreCleanupOperation *)v8 setRemovalBlock:v25];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100174BE8;
  v24[3] = &unk_100238800;
  v24[4] = self;
  [(APCacheStoreCleanupOperation *)v8 setAncientItemBlock:v24];
  if (+[APSystemInternal isAppleInternalInstall])
  {
    v12 = [v3 fileStorage];
    v13 = [v12 getStorageInfo];
  }
  else
  {
    v13 = 0;
  }
  objc_initWeak(&buf, self);
  id v14 = objc_alloc_init((Class)NSBlockOperation);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100174C40;
  v19[3] = &unk_10022E368;
  objc_copyWeak(&v22, &buf);
  v15 = v8;
  v20 = v15;
  id v16 = v13;
  id v21 = v16;
  [v14 addExecutionBlock:v19];
  [(APCacheGarbageCollector *)self setActiveCleanupOperation:v15];
  v17 = [(APCacheGarbageCollector *)self operationQueue];
  v26[0] = v15;
  v26[1] = v14;
  v18 = +[NSArray arrayWithObjects:v26 count:2];
  [v17 addOperations:v18 waitUntilFinished:0];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&buf);
}

- (void)stop
{
  id v2 = [(APCacheGarbageCollector *)self activeCleanupOperation];
  [v2 cancel];
}

- (void)_handleAncientItem:(id)a3
{
  id v4 = a3;
  atomic_fetch_add((atomic_uint *volatile)&self->_ancientObjectsCount, 1u);
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 2050;
    int64_t v9 = [(APCacheGarbageCollector *)self maxObjectLifeTimeDays];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Found an item '%{public}@' which is older than %{public}ld days.", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_removeItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(APCacheGarbageCollector *)self cacheStore];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100174FCC;
  v7[3] = &unk_100234B28;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 executeBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeItemInBlockForKey:(id)a3
{
  id v4 = a3;
  v5 = [(APCacheGarbageCollector *)self cacheStore];
  unsigned int v6 = [v5 isObjectAliveForKey:v4];

  if (!v6)
  {
    id v8 = [(APCacheGarbageCollector *)self cacheStore];
    id v7 = [v8 objectForKey:v4];

    unint64_t v9 = (unint64_t)[v7 garbageCollect];
    if ((v9 & 0x8000000000000000) != 0)
    {
      double v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v17 = 138543362;
        *(void *)&v17[4] = v4;
        v13 = "Failed to garbage collect object '%{public}@'.";
        id v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, v17, 0xCu);
      }
    }
    else
    {
      unint64_t v10 = v9;
      double v11 = APLogForCategory();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v12)
        {
          *(_DWORD *)v17 = 138543362;
          *(void *)&v17[4] = v4;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Successfully garbage collected object '%{public}@'.", v17, 0xCu);
        }

        atomic_fetch_add((atomic_uint *volatile)&self->_removedObjectsCount, v10);
        goto LABEL_15;
      }
      if (v12)
      {
        *(_DWORD *)v17 = 138543362;
        *(void *)&v17[4] = v4;
        v13 = "Skipped a GC candidate '%{public}@' because it can be in use or has related object.";
        id v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_INFO;
        goto LABEL_13;
      }
    }

LABEL_15:
    id v16 = [(APCacheGarbageCollector *)self cacheStore];
    [v16 evictObjectFromMemoryCacheForKey:v4];

    goto LABEL_16;
  }
  id v7 = APLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v17 = 138543362;
    *(void *)&v17[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Skipping a GC candidate '%{public}@' because it can be in use.", v17, 0xCu);
  }
LABEL_16:
}

- (void)_reportStatisticsForDuration:(double)a3 storageInfo:(id)a4 cancelled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  unsigned int v9 = +[APSystemInternal isAppleInternalInstall];
  if (v8 && v9)
  {
    if ([v8 allocatedSize])
    {
      float v10 = (float)(unint64_t)[v8 totalSize];
      float v11 = 1.0 - (float)(v10 / (float)(unint64_t)[v8 allocatedSize]);
    }
    else
    {
      float v11 = 0.0;
    }
    [(APCacheGarbageCollector *)self timeSincePrevLaunch];
    BOOL v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v25[0] = v12;
    v24[1] = @"Duration";
    v13 = +[NSNumber numberWithDouble:a3];
    v25[1] = v13;
    v24[2] = @"Cancelled";
    id v14 = +[NSNumber numberWithBool:v5];
    v25[2] = v14;
    v24[3] = @"TotalFiles";
    os_log_type_t v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 filesCount]);
    v25[3] = v15;
    v24[4] = @"TotalSize";
    id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 totalSize]);
    v25[4] = v16;
    void v24[5] = @"Fragmentation";
    *(float *)&double v17 = v11;
    v18 = +[NSNumber numberWithFloat:v17];
    void v25[5] = v18;
    v24[6] = @"RemovedFiles";
    uint64_t v19 = atomic_load(&self->_removedObjectsCount);
    v20 = +[NSNumber numberWithUnsignedInt:v19];
    v25[6] = v20;
    v24[7] = @"AncientFiles";
    uint64_t v21 = atomic_load(&self->_ancientObjectsCount);
    id v22 = +[NSNumber numberWithUnsignedInt:v21];
    v25[7] = v22;
    v23 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:8];

    +[APAnalytics sendEvent:@"gc" customPayload:v23];
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (APPersistentCachedStoreTransactionalProtocol)cacheStore
{
  return self->_cacheStore;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSString)objectKind
{
  return self->_objectKind;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (int64_t)maxObjectLifeTimeDays
{
  return self->_maxObjectLifeTimeDays;
}

- (void)setMaxObjectLifeTimeDays:(int64_t)a3
{
  self->_maxObjectLifeTimeDays = a3;
}

- (NSOperation)activeCleanupOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeCleanupOperation);

  return (NSOperation *)WeakRetained;
}

- (void)setActiveCleanupOperation:(id)a3
{
}

- (double)timeSincePrevLaunch
{
  return self->_timeSincePrevLaunch;
}

- (void)setTimeSincePrevLaunch:(double)a3
{
  self->_timeSincePrevLaunch = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeCleanupOperation);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_objectKind, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_cacheStore, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end