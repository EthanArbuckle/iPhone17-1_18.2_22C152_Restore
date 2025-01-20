@interface APCacheStore
- (APCacheStore)initWithFileStorage:(id)a3 memoryCache:(id)a4;
- (APCacheStore)initWithTotalCostLimit:(int64_t)a3;
- (APFileSystemAdapter)fileStorage;
- (APUnfairRecursiveLock)lock;
- (BOOL)_executeOperation:(id)a3;
- (BOOL)_hasObjectForKey:(id)a3;
- (BOOL)hasObjectForKey:(id)a3;
- (BOOL)isObjectAliveForKey:(id)a3;
- (NSCache)memoryCache;
- (NSMapTable)liveObjectsTracker;
- (id)_objectForKey:(id)a3 ignoreKeys:(id)a4;
- (id)createTransaction;
- (id)enumerateIDsWithExtension:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 ignoreKeys:(id)a4;
- (void)_printCacheStatistics;
- (void)enableDiagnosticsWithInterval:(double)a3;
- (void)evictObjectFromMemoryCacheForKey:(id)a3;
- (void)executeBlock:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3 transaction:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 transaction:(id)a5;
- (void)touchObjectForKey:(id)a3;
- (void)touchObjectForKey:(id)a3 transaction:(id)a4;
@end

@implementation APCacheStore

- (APCacheStore)initWithFileStorage:(id)a3 memoryCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)APCacheStore;
  v9 = [(APCacheStore *)&v15 init];
  if (v9)
  {
    v10 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    lock = v9->_lock;
    v9->_lock = v10;

    objc_storeStrong((id *)&v9->_fileStorage, a3);
    objc_storeStrong((id *)&v9->_memoryCache, a4);
    uint64_t v12 = +[NSMapTable weakToWeakObjectsMapTable];
    liveObjectsTracker = v9->_liveObjectsTracker;
    v9->_liveObjectsTracker = (NSMapTable *)v12;
  }
  return v9;
}

- (APCacheStore)initWithTotalCostLimit:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)NSCache);
  v6 = v5;
  if ((a3 & 0x8000000000000000) == 0) {
    [v5 setTotalCostLimit:a3];
  }
  id v7 = objc_alloc_init(APFileSystemAdapter);
  id v8 = [(APCacheStore *)self initWithFileStorage:v7 memoryCache:v6];

  return v8;
}

- (BOOL)hasObjectForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = +[NSString stringWithFormat:@"%@ key cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  v6 = [(APCacheStore *)self lock];
  [v6 lock];
  BOOL v7 = [(APCacheStore *)self _hasObjectForKey:v4];
  [v6 unlock];

  return v7;
}

- (BOOL)_hasObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(APCacheStore *)self memoryCache];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    id v8 = [(APCacheStore *)self fileStorage];
    unsigned __int8 v7 = [v8 fileExists:v4];
  }
  return v7;
}

- (id)objectForKey:(id)a3
{
  return [(APCacheStore *)self objectForKey:a3 ignoreKeys:0];
}

- (id)objectForKey:(id)a3 ignoreKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = +[NSString stringWithFormat:@"%@ key cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  v9 = [(APCacheStore *)self lock];
  [v9 lock];
  v10 = [(APCacheStore *)self _objectForKey:v6 ignoreKeys:v7];
  [v9 unlock];

  return v10;
}

- (id)_objectForKey:(id)a3 ignoreKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ++self->_diagnosticsOperations;
  id v8 = [(APCacheStore *)self memoryCache];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    uint64_t v10 = 8;
LABEL_5:
    ++*(Class *)((char *)&self->super.super.isa + v10);
    id v13 = v9;
    goto LABEL_6;
  }
  v11 = [(APCacheStore *)self liveObjectsTracker];
  v9 = [v11 objectForKey:v6];

  if (v9)
  {
    uint64_t v12 = [(APCacheStore *)self memoryCache];
    [v12 setObject:v9 forKey:v6];

    uint64_t v10 = 24;
    goto LABEL_5;
  }
  objc_super v15 = [(APCacheStore *)self fileStorage];
  id v28 = 0;
  v16 = [v15 readDataFromFile:v6 error:&v28];
  id v17 = v28;

  if (v17)
  {
    NSErrorDomain v18 = [v17 domain];
    NSErrorDomain v19 = v18;
    if (v18 != NSCocoaErrorDomain)
    {

LABEL_16:
      v24 = APLogForCategory();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
      *(_DWORD *)buf = 138543619;
      id v30 = v6;
      __int16 v31 = 2113;
      id v32 = v17;
      v25 = "Unable to read file %{public}@. Error: %{private}@";
      v26 = v24;
      uint32_t v27 = 22;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
      goto LABEL_19;
    }
    id v23 = [v17 code];

    if (v23 != (id)260) {
      goto LABEL_16;
    }
LABEL_20:
    id v13 = 0;
    goto LABEL_21;
  }
  if (![v16 length]) {
    goto LABEL_20;
  }
  uint64_t v20 = +[APCacheableBaseObject deserializeFromData:v16 ignoreKeys:v7];
  if (!v20)
  {
    v24 = APLogForCategory();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138543362;
    id v30 = v6;
    v25 = "Unable to deserialize object %{public}@.";
    v26 = v24;
    uint32_t v27 = 12;
    goto LABEL_18;
  }
  v21 = (void *)v20;
  v22 = [(APCacheStore *)self memoryCache];
  [v22 setObject:v21 forKey:v6];

  id v13 = v21;
LABEL_21:

LABEL_6:

  return v13;
}

- (void)removeObjectForKey:(id)a3
{
}

- (void)removeObjectForKey:(id)a3 transaction:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!v9)
  {
    id v7 = +[NSString stringWithFormat:@"%@ key cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  id v8 = [[APCacheStoreOperationRemove alloc] initWithCacheStore:self key:v9];
  if (v6) {
    [v6 addOperation:v8];
  }
  else {
    [(APCacheStore *)self _executeOperation:v8];
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)setObject:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v13)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = +[NSString stringWithFormat:@"%@ object cannot be nil", objc_opt_class()];
    APSimulateCrash();

    if (v8) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = +[NSString stringWithFormat:@"%@ key cannot be nil", objc_opt_class()];
  APSimulateCrash();

LABEL_3:
  uint64_t v10 = [[APCacheStoreOperationSet alloc] initWithCacheStore:self key:v8 object:v13];
  if (v9) {
    [v9 addOperation:v10];
  }
  else {
    [(APCacheStore *)self _executeOperation:v10];
  }
}

- (void)touchObjectForKey:(id)a3
{
}

- (void)touchObjectForKey:(id)a3 transaction:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!v11)
  {
    id v7 = +[NSString stringWithFormat:@"%@ key cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  id v8 = [APCacheStoreOperationTouch alloc];
  id v9 = +[NSDate now];
  uint64_t v10 = [(APCacheStoreOperationTouch *)v8 initWithCacheStore:self key:v11 timestamp:v9];

  if (v6) {
    [v6 addOperation:v10];
  }
  else {
    [(APCacheStore *)self _executeOperation:v10];
  }
}

- (id)createTransaction
{
  v2 = [[APCacheStoreTransaction alloc] initWithCacheStore:self];

  return v2;
}

- (void)executeBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(APCacheStore *)self lock];
  [v5 lock];
  v4[2](v4);

  [v5 unlock];
}

- (BOOL)_executeOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(APCacheStore *)self lock];
  [v5 lock];
  unsigned int v6 = [v4 execute];
  if (v6) {
    [v4 commit];
  }
  else {
    [v4 rollBack];
  }

  [v5 unlock];
  return v6;
}

- (BOOL)isObjectAliveForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = +[NSString stringWithFormat:@"%@ key cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  unsigned int v6 = [(APCacheStore *)self lock];
  [v6 lock];
  id v7 = [(APCacheStore *)self liveObjectsTracker];
  id v8 = [v7 objectForKey:v4];
  BOOL v9 = v8 != 0;

  [v6 unlock];
  return v9;
}

- (void)evictObjectFromMemoryCacheForKey:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v4 = +[NSString stringWithFormat:@"%@ key cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  id v5 = [(APCacheStore *)self lock];
  [v5 lock];
  unsigned int v6 = [(APCacheStore *)self memoryCache];
  [v6 removeObjectForKey:v8];

  id v7 = [(APCacheStore *)self liveObjectsTracker];
  [v7 removeObjectForKey:v8];

  [v5 unlock];
}

- (id)enumerateIDsWithExtension:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_APMapEnumerator);
  unsigned int v6 = [(APCacheStore *)self fileStorage];
  id v7 = [v6 enumeratorForFilesWithExtension:v4];

  [(_APMapEnumerator *)v5 setSrcEnumerator:v7];
  [(_APMapEnumerator *)v5 setTransformationBlock:&stru_100238840];

  return v5;
}

- (void)enableDiagnosticsWithInterval:(double)a3
{
  if (+[APSystemInternal isAppleInternalInstall])
  {
    self->_diagnosticsInterval = a3;
    if (a3 > 0.0)
    {
      id v5 = dispatch_get_global_queue(-2, 0);
      unsigned int v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 7uLL, v5);
      diagnostics_memory_event_source = self->_diagnostics_memory_event_source;
      self->_diagnostics_memory_event_source = v6;

      id v8 = self->_diagnostics_memory_event_source;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1001773DC;
      handler[3] = &unk_100233D50;
      objc_super v15 = v8;
      BOOL v9 = v8;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume(v9);
      objc_initWeak(&location, self);
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(self->_diagnosticsInterval * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001774B0;
      block[3] = &unk_100234B00;
      objc_copyWeak(&v12, &location);
      dispatch_after(v10, v5, block);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_printCacheStatistics
{
  v25 = [(APCacheStore *)self lock];
  [v25 lock];
  v3 = [(APCacheStore *)self liveObjectsTracker];
  id v4 = [v3 keyEnumerator];

  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    unsigned int v6 = (void *)v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    do
    {
      id v11 = [(APCacheStore *)self liveObjectsTracker];
      id v12 = [v11 objectForKey:v6];

      if (v12)
      {
        id v13 = [(APCacheStore *)self memoryCache];
        v14 = [v13 objectForKey:v6];

        id v15 = [v12 objectSize];
        if (v14)
        {
          v8 += (uint64_t)v15;
          ++v7;
        }
        else
        {
          v10 += (uint64_t)v15;
          ++v9;
        }
      }

      uint64_t v16 = [v4 nextObject];

      unsigned int v6 = (void *)v16;
    }
    while (v16);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  [v25 unlock];

  unint64_t diagnosticsOperations = self->_diagnosticsOperations;
  if (diagnosticsOperations)
  {
    double v18 = (double)self->_diagnosticsMemoryCacheHits * 100.0 / (double)diagnosticsOperations;
    double v19 = (double)self->_diagnosticsLiveObjectHits * 100.0 / (double)diagnosticsOperations;
  }
  else
  {
    double v18 = 0.0;
    double v19 = 0.0;
  }
  uint64_t v20 = APLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = +[NSByteCountFormatter stringFromByteCount:v8 countStyle:1];
    v22 = +[NSByteCountFormatter stringFromByteCount:v10 countStyle:1];
    *(_DWORD *)buf = 134219267;
    uint64_t v30 = v7;
    __int16 v31 = 2113;
    id v32 = v21;
    __int16 v33 = 2048;
    uint64_t v34 = v9;
    __int16 v35 = 2113;
    v36 = v22;
    __int16 v37 = 2048;
    double v38 = v18;
    __int16 v39 = 2048;
    double v40 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Cache Stats:\n\tCached Objects: %lu\n\tCached Objects Size: %{private}@\n\tAlive Uncached Objects: %lu\n\tAlive Uncached Objects Size: %{private}@\n\tMemory cache hits rate: %.2f%%\n\tLive objects hits rate: %.2f%%", buf, 0x3Eu);
  }
  objc_initWeak((id *)buf, self);
  dispatch_time_t v23 = dispatch_time(0, (uint64_t)(self->_diagnosticsInterval * 1000000000.0));
  v24 = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177868;
  block[3] = &unk_100234B00;
  objc_copyWeak(&v28, (id *)buf);
  dispatch_after(v23, v24, block);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

- (APFileSystemAdapter)fileStorage
{
  return self->_fileStorage;
}

- (NSCache)memoryCache
{
  return self->_memoryCache;
}

- (NSMapTable)liveObjectsTracker
{
  return self->_liveObjectsTracker;
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_liveObjectsTracker, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_fileStorage, 0);

  objc_storeStrong((id *)&self->_diagnostics_memory_event_source, 0);
}

@end