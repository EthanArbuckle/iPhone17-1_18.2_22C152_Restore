@interface STStorageMediaMonitor
+ (id)listOfUsedDataClassesInOverrides:(id)a3;
+ (id)sharedMonitor;
- (BOOL)isAsynchronouslyLoaded;
- (BOOL)isMonitoring;
- (BOOL)isUpdating;
- (NSArray)usedDataClasses;
- (NSDictionary)atcDictionary;
- (OS_dispatch_queue)refreshQueue;
- (OS_dispatch_source)refreshTimer;
- (STStorageMediaMonitor)init;
- (id)photosLibToken;
- (unint64_t)refreshStartTimestamp;
- (void)_updateATCData;
- (void)loadingComplete:(id)a3;
- (void)mpLibraryChanged:(id)a3;
- (void)setAtcDictionary:(id)a3;
- (void)setIsAsynchronouslyLoaded:(BOOL)a3;
- (void)setIsMonitoring:(BOOL)a3;
- (void)setIsUpdating:(BOOL)a3;
- (void)setPhotosLibToken:(id)a3;
- (void)setRefreshQueue:(id)a3;
- (void)setRefreshStartTimestamp:(unint64_t)a3;
- (void)setRefreshTimer:(id)a3;
- (void)setUsedDataClasses:(id)a3;
- (void)startMonitor;
- (void)stopMonitor;
- (void)sync;
- (void)updateATCData;
@end

@implementation STStorageMediaMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken_1 != -1) {
    dispatch_once(&sharedMonitor_onceToken_1, &__block_literal_global_8);
  }
  v2 = (void *)sharedMonitor__monitor_0;

  return v2;
}

uint64_t __38__STStorageMediaMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor__monitor_0 = objc_alloc_init(STStorageMediaMonitor);

  return MEMORY[0x270F9A758]();
}

- (STStorageMediaMonitor)init
{
  v27.receiver = self;
  v27.super_class = (Class)STStorageMediaMonitor;
  id v2 = [(STStorageMediaMonitor *)&v27 init];
  if (v2)
  {
    v3 = +[STAppOverrides overrides];
    uint64_t v4 = +[STStorageMediaMonitor listOfUsedDataClassesInOverrides:v3];
    v5 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v4;

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_loadingComplete_ name:@"STNotify_LoadingComplete" object:0];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);

    v9 = dispatch_queue_attr_make_initially_inactive(v8);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.storagesettings.queue.ATCRefresh", v9);
    v11 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v10;

    v12 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v2 + 3));
    dispatch_source_set_timer(v12, 0, 0x6FC23AC00uLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __29__STStorageMediaMonitor_init__block_invoke;
    handler[3] = &unk_264305098;
    id v13 = v2;
    id v26 = v13;
    dispatch_source_set_event_handler(v12, handler);
    [v13 setRefreshTimer:v12];
    v14 = [MEMORY[0x263F24B30] sharedInstance];
    v15 = [v14 getCurrentUsage];
    [v13 setAtcDictionary:v15];

    v16 = [*((id *)v2 + 6) componentsJoinedByString:@","];
    v24 = [v13 atcDictionary];
    STLog(1, @"%s:%d ATC used data classes: %@; current usage: %@",
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      (uint64_t)"-[STStorageMediaMonitor init]");
  }
  return (STStorageMediaMonitor *)v2;
}

uint64_t __29__STStorageMediaMonitor_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateATCData];
}

- (void)startMonitor
{
  if (self->_isMonitoring)
  {
    STLog(1, @"media monitor monitoring calls are unbalanced", v2, v3, v4, v5, v6, v7, v22);
    [(STStorageMediaMonitor *)self updateATCData];
  }
  else
  {
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel_mpLibraryChanged_ name:*MEMORY[0x263F11418] object:0];

    dispatch_queue_t v10 = [(STStorageMediaMonitor *)self refreshQueue];
    v11 = ALRegisterForPhotosAndVideosCount();
    [(STStorageMediaMonitor *)self setPhotosLibToken:v11];

    v12 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v12 beginGeneratingLibraryChangeNotifications];

    id v13 = [(STStorageMediaMonitor *)self refreshTimer];
    dispatch_resume(v13);

    [(STStorageMediaMonitor *)self setIsMonitoring:1];
    v14 = [MEMORY[0x263F24B30] sharedInstance];
    v15 = [v14 getCurrentUsage];
    [(STStorageMediaMonitor *)self setAtcDictionary:v15];

    v23 = [(STStorageMediaMonitor *)self atcDictionary];
    STLog(1, @"%s:%d ATC %@", v16, v17, v18, v19, v20, v21, (uint64_t)"-[STStorageMediaMonitor startMonitor]");

    [(STStorageMediaMonitor *)self updateATCData];
  }
}

uint64_t __37__STStorageMediaMonitor_startMonitor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  STLog(1, @"%s:%d Photos/Videos change detected", a3, a4, a5, a6, a7, a8, (uint64_t)"-[STStorageMediaMonitor startMonitor]_block_invoke");
  v9 = *(void **)(a1 + 32);

  return [v9 _updateATCData];
}

- (void)stopMonitor
{
  if (self->_isMonitoring)
  {
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 removeObserver:self name:*MEMORY[0x263F11418] object:0];

    dispatch_queue_t v10 = [(STStorageMediaMonitor *)self photosLibToken];
    ALUnregisterForPhotosAndVideosCount();

    [(STStorageMediaMonitor *)self setPhotosLibToken:0];
    v11 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v11 endGeneratingLibraryChangeNotifications];

    v12 = [(STStorageMediaMonitor *)self refreshTimer];
    dispatch_suspend(v12);

    [(STStorageMediaMonitor *)self setIsMonitoring:0];
  }
  else
  {
    STLog(1, @"media monitor monitoring calls are unbalanced", v2, v3, v4, v5, v6, v7, v14);
  }
}

- (void)updateATCData
{
  refreshQueue = self->_refreshQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__STStorageMediaMonitor_updateATCData__block_invoke;
  block[3] = &unk_264305098;
  block[4] = self;
  dispatch_async(refreshQueue, block);
}

uint64_t __38__STStorageMediaMonitor_updateATCData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateATCData];
}

- (void)_updateATCData
{
  uint64_t v3 = [(STStorageMediaMonitor *)self refreshQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(STStorageMediaMonitor *)self isUpdating];
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if (v4)
  {
    [(STStorageMediaMonitor *)self refreshStartTimestamp];
    STLog(1, @"%s:%d ATC update is already in progress, running for %0.3f s", v6, v7, v8, v9, v10, v11, (uint64_t)"-[STStorageMediaMonitor _updateATCData]");
  }
  else
  {
    [(STStorageMediaMonitor *)self setRefreshStartTimestamp:v5];
    [(STStorageMediaMonitor *)self setIsUpdating:1];
    STLog(1, @"%s:%d Start updating ATC current usage", v12, v13, v14, v15, v16, v17, (uint64_t)"-[STStorageMediaMonitor _updateATCData]");
    uint64_t v18 = [MEMORY[0x263F24B30] sharedInstance];
    usedDataClasses = self->_usedDataClasses;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __39__STStorageMediaMonitor__updateATCData__block_invoke;
    v20[3] = &unk_2643055D8;
    v20[4] = self;
    [v18 getCurrentUsageWithUpdatedDataClasses:usedDataClasses withCompletion:v20];
  }
}

void __39__STStorageMediaMonitor__updateATCData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) refreshQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__STStorageMediaMonitor__updateATCData__block_invoke_2;
  v6[3] = &unk_2643050C0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __39__STStorageMediaMonitor__updateATCData__block_invoke_2(uint64_t a1)
{
  clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  [*(id *)(a1 + 32) refreshStartTimestamp];
  STLog(1, @"%s:%d ATC update completed in %0.3fs %@", v2, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageMediaMonitor _updateATCData]_block_invoke_2");
  [*(id *)(a1 + 32) setAtcDictionary:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setIsUpdating:0];
  [*(id *)(a1 + 32) setIsAsynchronouslyLoaded:1];
  uint64_t v8 = +[STStorageDataNotifier sharedNotifier];
  [v8 postMediaSizesChanged];
}

- (void)sync
{
  uint64_t v3 = (void *)MEMORY[0x21D463BC0](self, a2);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = [MEMORY[0x263F24B30] sharedInstance];
  usedDataClasses = self->_usedDataClasses;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__STStorageMediaMonitor_sync__block_invoke;
  v8[3] = &unk_264305600;
  v8[4] = self;
  dispatch_semaphore_t v9 = v4;
  uint64_t v7 = v4;
  [v5 getCurrentUsageWithUpdatedDataClasses:usedDataClasses withCompletion:v8];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __29__STStorageMediaMonitor_sync__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  STLog(1, @"%s:%d ATC %@", v3, v4, v5, v6, v7, v8, (uint64_t)"-[STStorageMediaMonitor sync]_block_invoke");
  [*(id *)(a1 + 32) setAtcDictionary:v11];

  dispatch_semaphore_t v9 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v9);
}

- (void)loadingComplete:(id)a3
{
  STLog(1, @"%s:%d Loading complete, activating ATC refresh", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageMediaMonitor loadingComplete:]");
  dispatch_semaphore_t v9 = [(STStorageMediaMonitor *)self refreshQueue];
  dispatch_activate(v9);

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 removeObserver:self name:@"STNotify_LoadingComplete" object:0];
  [(STStorageMediaMonitor *)self updateATCData];
}

- (void)mpLibraryChanged:(id)a3
{
  STLog(1, @"%s:%d Media library change detected", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageMediaMonitor mpLibraryChanged:]");

  [(STStorageMediaMonitor *)self updateATCData];
}

+ (id)listOfUsedDataClassesInOverrides:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9C0] setWithCapacity:5];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v18 = v3;
  obuint64_t j = [v3 allValues];
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        dispatch_semaphore_t v9 = [v8 includeMediaUsage];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = [*(id *)(*((void *)&v21 + 1) + 8 * j) componentsSeparatedByString:@":"];
              uint64_t v15 = [v14 firstObject];

              if (v15) {
                [v4 addObject:v15];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  uint64_t v16 = [v4 allObjects];

  return v16;
}

- (NSDictionary)atcDictionary
{
  return self->_atcDictionary;
}

- (void)setAtcDictionary:(id)a3
{
}

- (BOOL)isAsynchronouslyLoaded
{
  return self->_isAsynchronouslyLoaded;
}

- (void)setIsAsynchronouslyLoaded:(BOOL)a3
{
  self->_isAsynchronouslyLoaded = a3;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

- (OS_dispatch_queue)refreshQueue
{
  return self->_refreshQueue;
}

- (void)setRefreshQueue:(id)a3
{
}

- (OS_dispatch_source)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
}

- (unint64_t)refreshStartTimestamp
{
  return self->_refreshStartTimestamp;
}

- (void)setRefreshStartTimestamp:(unint64_t)a3
{
  self->_refreshStartTimestamp = a3;
}

- (NSArray)usedDataClasses
{
  return self->_usedDataClasses;
}

- (void)setUsedDataClasses:(id)a3
{
}

- (id)photosLibToken
{
  return self->_photosLibToken;
}

- (void)setPhotosLibToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_photosLibToken, 0);
  objc_storeStrong((id *)&self->_usedDataClasses, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);

  objc_storeStrong((id *)&self->_atcDictionary, 0);
}

@end