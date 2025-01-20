@interface STMSizer
+ (id)containersWithClass:(unint64_t)a3;
+ (id)listOfUsedPathsInOverrides:(id)a3;
+ (id)sharedAppSizer;
- (NSArray)rootPaths;
- (STMSizer)initWithPrefsKey:(id)a3;
- (id)addContainer:(id)a3;
- (id)addContainers:(id)a3;
- (id)addURL:(id)a3;
- (id)addURL:(id)a3 usingFastSizingIfPossible:(BOOL)a4;
- (id)addURLs:(id)a3;
- (id)addURLs:(id)a3 usingFastSizingIfPossible:(BOOL)a4;
- (id)cachePathOfContainer:(id)a3;
- (id)cacheSizeForContainer:(id)a3;
- (id)containersForApp:(id)a3;
- (id)pathOfContainer:(id)a3;
- (id)sizeForContainer:(id)a3;
- (id)sizeForURL:(id)a3;
- (id)updatedCacheSizeForContainer:(id)a3;
- (id)updatedSizeForContainer:(id)a3;
- (id)updatedSizeForURL:(id)a3;
- (void)_asyncProcessPendingEvents:(id)a3;
- (void)addApp:(id)a3;
- (void)addApps:(id)a3;
- (void)dealloc;
- (void)flushCacheAsynchronously;
- (void)processEvents:(id)a3;
- (void)processPendingEvents;
- (void)reloadAppContainer:(id)a3;
- (void)setEvent:(id)a3 forItem:(id)a4;
- (void)setRootPaths:(id)a3;
- (void)startSizer;
- (void)stopSizer;
@end

@implementation STMSizer

+ (id)sharedAppSizer
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__STMSizer_Apps__sharedAppSizer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAppSizer_onceToken != -1) {
    dispatch_once(&sharedAppSizer_onceToken, block);
  }
  v2 = (void *)sharedAppSizer__gSizer;

  return v2;
}

void __32__STMSizer_Apps__sharedAppSizer__block_invoke(uint64_t a1)
{
  v2 = [[STMSizer alloc] initWithPrefsKey:@"AppSizes"];
  v3 = (void *)sharedAppSizer__gSizer;
  sharedAppSizer__gSizer = (uint64_t)v2;

  objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"/private/var/containers/", @"/private/var/mobile/Containers/", @"/private/var/PersonaVolumes", 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = +[STAppOverrides overrides];
  v6 = [v4 listOfUsedPathsInOverrides:v5];
  [v7 addObjectsFromArray:v6];

  [(id)sharedAppSizer__gSizer setRootPaths:v7];
}

- (id)containersForApp:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  if ([v3 userVisible])
  {
    v5 = [v3 appContainer];
    if (v5) {
      [v4 addObject:v5];
    }
    v6 = [v3 dataContainers];
    if ([v6 count]) {
      [v4 addObjectsFromArray:v6];
    }
    id v7 = [v3 sharedContainers];

    if ([v7 count]) {
      [v4 addObjectsFromArray:v7];
    }
  }

  return v4;
}

- (void)addApp:(id)a3
{
  id v5 = [(STMSizer *)self containersForApp:a3];
  id v4 = [(STMSizer *)self addContainers:v5];
}

- (void)addApps:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", 4 * objc_msgSend(v4, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [(STMSizer *)self containersForApp:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  v12 = +[STContainer containersWithClass:4 personaUniqueString:0];
  if ([v12 count]) {
    [v5 addObjectsFromArray:v12];
  }
  v24 = v12;
  v13 = [(STMSizer *)self addContainers:v5];
  v25 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v26 + 1) + 8 * j) itemPath];
        if ([v19 length])
        {
          v20 = NSURL;
          v21 = [v19 stringByAppendingPathComponent:@"Library/Caches/"];
          v22 = [v20 fileURLWithPath:v21];

          if (v22) {
            [v25 addObject:v22];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

  id v23 = [(STMSizer *)self addURLs:v25 usingFastSizingIfPossible:1];
}

- (void)reloadAppContainer:(id)a3
{
  id v7 = [a3 appContainer];
  id v4 = [v7 url];
  id v5 = [v4 path];

  if ([v5 length])
  {
    id v6 = [[STMSizeCacheEntry alloc] initWithContainer:v7];
    [(STMSizeCache *)self addItem:v6];
    [(STMSizeCacheEntry *)v6 calculateSize];
  }
}

+ (id)listOfUsedPathsInOverrides:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] setWithCapacity:5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v3, "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) includeFsPaths];
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [v4 allObjects];

  return v11;
}

- (STMSizer)initWithPrefsKey:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)STMSizer;
  id v3 = [(STMSizeCache *)&v16 initWithPrefsKey:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_pendingEventsLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    pendingEventsByPath = v4->_pendingEventsByPath;
    v4->_pendingEventsByPath = (NSMutableDictionary *)v5;

    if (!_gSharedFSQueue)
    {
      uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v9 = dispatch_queue_create("fsevtQ", v8);
      v10 = (void *)_gSharedFSQueue;
      _gSharedFSQueue = (uint64_t)v9;

      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v13 = dispatch_queue_create("updateQ", v12);
      long long v14 = (void *)_gSharedUpdateQueue;
      _gSharedUpdateQueue = (uint64_t)v13;
    }
  }
  return v4;
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t fsStream = (uint64_t)v2->_fsStream;
  if (fsStream)
  {
    FSEventStreamGetLatestEventId(v2->_fsStream);
    STLog(1, @"Stop <FSEventStream: %p> at #%llu", v4, v5, v6, v7, v8, v9, fsStream);
    FSEventStreamStop(v2->_fsStream);
    FSEventStreamInvalidate(v2->_fsStream);
    FSEventStreamRelease(v2->_fsStream);
    v2->_uint64_t fsStream = 0;
  }
  objc_sync_exit(v2);

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v11 = _gSharedUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __19__STMSizer_dealloc__block_invoke;
  block[3] = &unk_264305098;
  dispatch_semaphore_t v15 = v10;
  v12 = v10;
  dispatch_async(v11, block);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  v13.receiver = v2;
  v13.super_class = (Class)STMSizer;
  [(STMSizeCache *)&v13 dealloc];
}

intptr_t __19__STMSizer_dealloc__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setRootPaths:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 count];
  STLog(1, @"Recreating FSEventStream, -setRootPaths called with %ld paths", v7, v8, v9, v10, v11, v12, v6);
  BOOL streamRunning = v5->_streamRunning;
  uint64_t fsStream = (uint64_t)v5->_fsStream;
  if (fsStream)
  {
    FSEventStreamGetLatestEventId(v5->_fsStream);
    STLog(1, @"Stop <FSEventStream: %p> at #%llu", v21, v22, v23, v24, v25, v26, fsStream);
    FSEventStreamStop(v5->_fsStream);
    FSEventStreamInvalidate(v5->_fsStream);
    FSEventStreamRelease(v5->_fsStream);
    v5->_uint64_t fsStream = 0;
    v5->_BOOL streamRunning = 0;
  }
  else
  {
    STLog(1, @"\tNo FSEventStream to stop", v13, v14, v15, v16, v17, v18, v49);
  }
  long long v27 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v28 = v4;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = STMakeDirPath(*(void **)(*((void *)&v51 + 1) + 8 * i));
        [v27 addObject:v32];
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v29);
  }

  objc_storeStrong((id *)&v5->_rootPaths, v27);
  if ([v27 count])
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = v5;
    uint64_t v33 = [(STMSizeCache *)v5 cacheEventID];
    if (v33) {
      FSEventStreamEventId v34 = v33;
    }
    else {
      FSEventStreamEventId v34 = -1;
    }
    FSEventStreamRef v35 = FSEventStreamCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (FSEventStreamCallback)_FSEventStreamCallback, &context, (CFArrayRef)v27, v34, 1.0, 0x10u);
    v5->_uint64_t fsStream = v35;
    [(STMSizeCache *)v5 cacheEventID];
    STLog(1, @"\tNew <FSEventStream: %p> at #%llu", v36, v37, v38, v39, v40, v41, (uint64_t)v35);
    FSEventStreamSetDispatchQueue(v5->_fsStream, (dispatch_queue_t)_gSharedFSQueue);
    if (streamRunning)
    {
      uint64_t v42 = (uint64_t)v5->_fsStream;
      [(STMSizeCache *)v5 cacheEventID];
      STLog(1, @"Starting <FSEventStream: %p> at #%llu", v43, v44, v45, v46, v47, v48, v42);
      FSEventStreamStart(v5->_fsStream);
      v5->_BOOL streamRunning = 1;
    }
  }

  objc_sync_exit(v5);
}

- (void)startSizer
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  v2 = obj;
  uint64_t fsStream = (uint64_t)obj->_fsStream;
  if (fsStream)
  {
    FSEventStreamGetLatestEventId(obj->_fsStream);
    STLog(1, @"Starting <FSEventStream: %p> at #%llu", v4, v5, v6, v7, v8, v9, fsStream);
    FSEventStreamStart(obj->_fsStream);
    v2 = obj;
    obj->_BOOL streamRunning = 1;
  }
  objc_sync_exit(v2);
}

- (void)stopSizer
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  v2 = obj;
  uint64_t fsStream = (uint64_t)obj->_fsStream;
  if (fsStream)
  {
    FSEventStreamGetLatestEventId(obj->_fsStream);
    STLog(1, @"Stop <FSEventStream: %p> at #%llu", v4, v5, v6, v7, v8, v9, fsStream);
    FSEventStreamStop(obj->_fsStream);
    v2 = obj;
    obj->_BOOL streamRunning = 0;
  }
  objc_sync_exit(v2);
}

- (void)processPendingEvents
{
  if ([(NSMutableDictionary *)self->_pendingEventsByPath count])
  {
    os_unfair_lock_lock(&self->_pendingEventsLock);
    id v5 = (id)[(NSMutableDictionary *)self->_pendingEventsByPath copy];
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    pendingEventsByPath = self->_pendingEventsByPath;
    self->_pendingEventsByPath = v3;

    os_unfair_lock_unlock(&self->_pendingEventsLock);
    [(STMSizeCache *)self updateLastCacheEventID:[(STMSizeCache *)self processCacheEvents:v5]];
  }
}

- (void)_asyncProcessPendingEvents:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__STMSizer__asyncProcessPendingEvents___block_invoke;
  block[3] = &unk_264305098;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)_gSharedUpdateQueue, block);
}

uint64_t __39__STMSizer__asyncProcessPendingEvents___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPendingEvents];
}

- (void)setEvent:(id)a3 forItem:(id)a4
{
  id v10 = a3;
  uint64_t v6 = [a4 itemPath];
  unint64_t v7 = [v10 evtID];
  uint64_t v8 = [(NSMutableDictionary *)self->_pendingEventsByPath objectForKey:v6];
  uint64_t v9 = v8;
  if (!v8 || [v8 evtID] <= v7) {
    [(NSMutableDictionary *)self->_pendingEventsByPath setObject:v10 forKey:v6];
  }
}

- (void)processEvents:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_pendingEventsLock);
  uint64_t v5 = [v4 count];
  STLog(1, @"Processing %ld STMSizeCacheEvent", v6, v7, v8, v9, v10, v11, v5);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v4;
  uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v17 = [v16 path];
        if ([v16 flags])
        {
          uint64_t v18 = [(STMSizeCache *)self itemsContainedByPath:v17];
          v19 = @"FSEvents triggering deep rescan at %@, invalidating %lu cache entries";
LABEL_10:
          [v18 count];
          STLog(4, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v17);
          goto LABEL_11;
        }
        uint64_t v18 = [(STMSizeCache *)self itemsContainingPath:v17];
        v19 = @"FSEvent at %@ is invalidating %lu cache entries containing it";
        if ((unint64_t)[v18 count] >= 0xB) {
          goto LABEL_10;
        }
LABEL_11:
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v26 = v18;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v34 != v29) {
                objc_enumerationMutation(v26);
              }
              [(STMSizer *)self setEvent:v16 forItem:*(void *)(*((void *)&v33 + 1) + 8 * j)];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v28);
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(&self->_pendingEventsLock);
  if ([(NSMutableDictionary *)self->_pendingEventsByPath count])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__STMSizer_processEvents___block_invoke;
    block[3] = &unk_264305098;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __26__STMSizer_processEvents___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__asyncProcessPendingEvents_ object:0];
  v2 = *(void **)(a1 + 32);

  return [v2 performSelector:sel__asyncProcessPendingEvents_ withObject:0 afterDelay:0.1];
}

- (void)flushCacheAsynchronously
{
  if (self->_streamRunning)
  {
    FSEventStreamFlushAsync(self->_fsStream);
    STLog(1, @"Flushing <FSEventStream: %p> asynchronously, latest event id passed: %llu", v3, v4, v5, v6, v7, v8, (uint64_t)self->_fsStream);
  }
}

- (NSArray)rootPaths
{
  return self->_rootPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPaths, 0);

  objc_storeStrong((id *)&self->_pendingEventsByPath, 0);
}

- (id)addURL:(id)a3
{
  return [(STMSizer *)self addURL:a3 usingFastSizingIfPossible:0];
}

- (id)addURL:(id)a3 usingFastSizingIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 path];
  uint64_t v8 = [(STMSizeCache *)self itemForPath:v7];

  if (v8)
  {
    [(STMSizeCacheEntry *)v8 setItem:v6];
    uint64_t v9 = [(STMSizeCacheEntry *)v8 itemSize];
    if (v9) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 0;
    }
    [(STMSizeCacheEntry *)v8 setStatus:v10];
  }
  else
  {
    uint64_t v8 = [[STMSizeCacheEntry alloc] initWithURL:v6 usingFastSizingIfPossible:v4];
    if (v8) {
      [(STMSizeCache *)self addItem:v8];
    }
  }

  return v8;
}

- (id)addURLs:(id)a3
{
  return [(STMSizer *)self addURLs:a3 usingFastSizingIfPossible:0];
}

- (id)addURLs:(id)a3 usingFastSizingIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[STMSizer addURL:usingFastSizingIfPossible:](self, "addURL:usingFastSizingIfPossible:", *(void *)(*((void *)&v15 + 1) + 8 * i), v4, (void)v15);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)sizeForURL:(id)a3
{
  BOOL v4 = [a3 path];
  uint64_t v5 = [(STMSizeCache *)self sizeOfItemForPath:v4];

  return v5;
}

- (id)updatedSizeForURL:(id)a3
{
  BOOL v4 = [a3 path];
  uint64_t v5 = [(STMSizeCache *)self updatedSizeOfItemForPath:v4];

  return v5;
}

- (id)pathOfContainer:(id)a3
{
  uint64_t v3 = [a3 url];
  BOOL v4 = [v3 path];

  return v4;
}

- (id)cachePathOfContainer:(id)a3
{
  uint64_t v3 = [(STMSizer *)self pathOfContainer:a3];
  BOOL v4 = [v3 stringByAppendingPathComponent:@"Library/Caches/"];

  return v4;
}

- (id)addContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STMSizer *)self pathOfContainer:v4];
  if ([v5 length])
  {
    id v6 = [[STMSizeCacheEntry alloc] initWithContainer:v4];
    [(STMSizeCache *)self addItem:v6];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)addContainers:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[STMSizer addContainer:](self, "addContainer:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)sizeForContainer:(id)a3
{
  id v4 = [(STMSizer *)self pathOfContainer:a3];
  uint64_t v5 = [(STMSizeCache *)self sizeOfItemForPath:v4];

  return v5;
}

- (id)updatedSizeForContainer:(id)a3
{
  id v4 = [(STMSizer *)self pathOfContainer:a3];
  uint64_t v5 = [(STMSizeCache *)self updatedSizeOfItemForPath:v4];

  return v5;
}

- (id)cacheSizeForContainer:(id)a3
{
  id v4 = [(STMSizer *)self cachePathOfContainer:a3];
  uint64_t v5 = [(STMSizeCache *)self sizeOfItemForPath:v4];

  return v5;
}

- (id)updatedCacheSizeForContainer:(id)a3
{
  id v4 = [(STMSizer *)self cachePathOfContainer:a3];
  uint64_t v5 = [(STMSizeCache *)self updatedSizeOfItemForPath:v4];

  return v5;
}

+ (id)containersWithClass:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[STContainer containersWithClass:7 personaUniqueString:0];
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "identifier", (void)v13);
        if ([v11 length]) {
          [v4 setObject:v10 forKey:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

@end