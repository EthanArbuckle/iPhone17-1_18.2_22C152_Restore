@interface APPersistentCache
- (APCacheGarbageCollector)garbageCollector;
- (APPersistentCache)initWithCacheSize:(int64_t)a3;
- (APPersistentCachedStoreTransactionalProtocol)persistentCacheStore;
- (OS_dispatch_queue)gcSchedulerQueue;
- (double)cacheObjectTTL;
- (id)_dumpCache;
- (id)_getLastGCDate;
- (void)_performGC:(id)a3 completionHandler:(id)a4;
- (void)_performGCWithCompletionHandler:(id)a3;
- (void)_setLastGCDate:(id)a3;
- (void)_setupNotifyListener;
- (void)setCacheObjectTTL:(double)a3;
- (void)setGarbageCollector:(id)a3;
- (void)start;
- (void)startGCWithCompletionHandler:(id)a3;
- (void)stopGC;
@end

@implementation APPersistentCache

- (APPersistentCache)initWithCacheSize:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)APPersistentCache;
  v4 = [(APPersistentCache *)&v13 init];
  if (v4)
  {
    uint64_t v5 = +[APPersistentCachedStore createWithTotalCostLimit:a3];
    persistentCacheStore = v4->_persistentCacheStore;
    v4->_persistentCacheStore = (APPersistentCachedStoreTransactionalProtocol *)v5;

    +[APPersistentCacheStoreProvider assignPersistentCacheStore:v4->_persistentCacheStore];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ap.cache-gc-scheduler", 0);
    gcSchedulerQueue = v4->_gcSchedulerQueue;
    v4->_gcSchedulerQueue = (OS_dispatch_queue *)v7;

    v4->_cacheObjectTTL = 172800.0;
    if (+[APSystemInternal isAppleInternalInstall])
    {
      v9 = +[APInternalCacheSettings settings];
      [v9 diagnosticsIntervalValue];
      double v11 = v10;

      if (v11 > 0.0) {
        [(APPersistentCachedStoreTransactionalProtocol *)v4->_persistentCacheStore enableDiagnosticsWithInterval:v11];
      }
    }
  }
  return v4;
}

- (void)start
{
  v3 = [(APPersistentCache *)self _getLastGCDate];
  v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Last garbage collection was performed on %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  [(APPersistentCache *)self _setupNotifyListener];
}

- (void)startGCWithCompletionHandler:(id)a3
{
}

- (void)stopGC
{
  id v2 = [(APPersistentCache *)self garbageCollector];
  [v2 stop];
}

- (void)_setupNotifyListener
{
  if (+[APSystemInternal isAppleInternalInstall])
  {
    objc_initWeak(&location, self);
    v3 = +[APTestingRig sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100183E7C;
    v7[3] = &unk_100238BC8;
    objc_copyWeak(&v8, &location);
    [v3 subscribeForMessage:@"cache-startgc-all" handler:v7];

    v4 = +[APTestingRig sharedInstance];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100183FF4;
    v5[3] = &unk_100238BC8;
    objc_copyWeak(&v6, &location);
    [v4 subscribeForMessage:@"cache-dump" handler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_performGCWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = +[NSDate now];
  [(APPersistentCache *)self cacheObjectTTL];
  id v7 = [v5 dateByAddingTimeInterval:-v6];

  [(APPersistentCache *)self _performGC:v7 completionHandler:v4];
}

- (void)_performGC:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Started garbage collection.", buf, 2u);
  }

  v9 = APLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Started garbage collection. Cut off date is: %{public}@.", buf, 0xCu);
  }

  double v10 = [(APPersistentCache *)self _getLastGCDate];
  if (v10)
  {
    double v11 = +[NSDate now];
    [v11 timeIntervalSinceDate:v10];
    double v13 = v12;
  }
  else
  {
    double v13 = -1.0;
  }
  v14 = [APCacheGarbageCollector alloc];
  v15 = [(APPersistentCache *)self persistentCacheStore];
  v16 = [(APCacheGarbageCollector *)v14 initWithCacheStore:v15 expirationDate:v6 timeSincePrevLaunch:v13];
  [(APPersistentCache *)self setGarbageCollector:v16];

  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v22, (id *)buf);
  id v17 = v7;
  id v21 = v17;
  v18 = [(APPersistentCache *)self garbageCollector];
  [v18 setCompletionHandler:&v20];

  v19 = [(APPersistentCache *)self garbageCollector];
  [v19 collect];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (id)_getLastGCDate
{
  id v2 = +[APPersistentCacheSettings settings];
  v3 = [v2 lastGarbageCollected];

  return v3;
}

- (void)_setLastGCDate:(id)a3
{
  id v3 = a3;
  id v4 = +[APPersistentCacheSettings settings];
  [v4 setLastGarbageCollected:v3];
}

- (id)_dumpCache
{
  id v2 = +[NSUUID UUID];
  id v3 = [v2 UUIDString];

  id v4 = NSTemporaryDirectory();
  int v5 = [v4 stringByAppendingPathComponent:v3];

  id v6 = [v5 stringByAppendingPathComponent:@"cache-dump.json"];
  id v7 = APLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138739971;
    id v51 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Started cache dump into '%{sensitive}@'", buf, 0xCu);
  }

  id v8 = [(APPersistentCache *)self persistentCacheStore];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v39 = v3;
    double v10 = [(APPersistentCache *)self persistentCacheStore];
    double v11 = [v10 performSelector:"enumerateIDsWithExtension:" withObject:@"b"];

    double v12 = +[NSFileManager defaultManager];
    v38 = v5;
    [v12 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

    v37 = v6;
    id v36 = v6;
    v43 = fopen((const char *)[v36 UTF8String], "w");
    fputs("[\n", v43);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    double v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v14)
    {
      id v15 = v14;
      v16 = self;
      char v17 = 1;
      uint64_t v18 = *(void *)v46;
      uint64_t v41 = *(void *)v46;
      do
      {
        v19 = 0;
        id v42 = v15;
        do
        {
          if (*(void *)v46 != v18) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v19);
          if ((v17 & 1) == 0) {
            fputs(",\n", v43);
          }
          id v22 = [(APPersistentCache *)v16 persistentCacheStore];
          v23 = [v22 objectForKey:v20];

          if (objc_opt_respondsToSelector())
          {
            id v24 = v13;
            v25 = [v23 performSelector:"toJSONObject"];
            if (v25)
            {
              id v44 = 0;
              v26 = +[NSJSONSerialization dataWithJSONObject:v25 options:15 error:&v44];
              id v27 = v44;
              v28 = v27;
              if (v26) {
                BOOL v29 = v27 == 0;
              }
              else {
                BOOL v29 = 0;
              }
              if (v29)
              {
                id v31 = [objc_alloc((Class)NSString) initWithData:v26 encoding:4];
              }
              else
              {
                v30 = [v23 identifier];
                id v31 = +[NSString stringWithFormat:@"{\"error\": \"Failed dataWithJSONObject with ID %@: %@ \"}\n", v30, v28];
              }
              v16 = self;
            }
            else
            {
              v28 = [v23 identifier];
              id v31 = +[NSString stringWithFormat:@"{\"error\": \"Failed toJSONObject with ID %@\"}\n", v28];
            }

            id v32 = v31;
            fputs((const char *)[v32 UTF8String], v43);

            double v13 = v24;
            uint64_t v18 = v41;
            id v15 = v42;
          }

          char v17 = 0;
          v19 = (char *)v19 + 1;
        }
        while (v15 != v19);
        id v15 = [v13 countByEnumeratingWithState:&v45 objects:v49 count:16];
        char v17 = 0;
      }
      while (v15);
    }

    fputs("\n]", v43);
    fclose(v43);
    v33 = APLogForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      id v51 = v36;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Completed cache dump into '%{sensitive}@'", buf, 0xCu);
    }

    v34 = (__CFString *)v36;
    int v5 = v38;
    id v3 = v39;
    id v6 = v37;
  }
  else
  {
    double v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Cache dump failed, something went wrong.", buf, 2u);
    }
    v34 = @"Cache dump failed, something went wrong.";
  }

  return v34;
}

- (APPersistentCachedStoreTransactionalProtocol)persistentCacheStore
{
  return self->_persistentCacheStore;
}

- (OS_dispatch_queue)gcSchedulerQueue
{
  return self->_gcSchedulerQueue;
}

- (APCacheGarbageCollector)garbageCollector
{
  return self->_garbageCollector;
}

- (void)setGarbageCollector:(id)a3
{
}

- (double)cacheObjectTTL
{
  return self->_cacheObjectTTL;
}

- (void)setCacheObjectTTL:(double)a3
{
  self->_cacheObjectTTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_garbageCollector, 0);
  objc_storeStrong((id *)&self->_gcSchedulerQueue, 0);

  objc_storeStrong((id *)&self->_persistentCacheStore, 0);
}

@end