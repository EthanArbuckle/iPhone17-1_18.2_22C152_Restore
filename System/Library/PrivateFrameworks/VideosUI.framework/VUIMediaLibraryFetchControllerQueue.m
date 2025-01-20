@interface VUIMediaLibraryFetchControllerQueue
+ (id)defaultQueueWithMediaLibrary:(id)a3;
- (BOOL)isPaused;
- (BOOL)shouldFetchOnResume;
- (NSArray)fetchControllers;
- (NSMutableArray)mutableFetchControllers;
- (NSOperationQueue)serialFetchOperationQueue;
- (OS_dispatch_queue)serialProcessingDispatchQueue;
- (VUIDelayOperation)delayContentsChangeOperation;
- (VUIMediaLibrary)mediaLibrary;
- (VUIMediaLibraryFetchControllerQueue)init;
- (VUIMediaLibraryFetchControllerQueue)initWithMediaLibrary:(id)a3;
- (VUIMediaLibraryFetchControllerQueueDelegate)delegate;
- (VUIMediaLibraryFetchControllerQueueOperation)currentFetchOperation;
- (VUINowPlayingObserver)nowPlayingObserver;
- (unint64_t)mediaLibraryRevision;
- (void)_addStateObserverForFetchControllers:(id)a3;
- (void)_delayContentsChangeOperationDidComplete:(id)a3;
- (void)_enqueueAsyncProcessingQueueBlock:(id)a3;
- (void)_enqueueControllerFetchOperation;
- (void)_enqueueProcessingQueueBlock:(id)a3 synchronous:(BOOL)a4;
- (void)_enqueueSyncProcessingQueueBlock:(id)a3;
- (void)_handleMediaLibraryContentsChange;
- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3;
- (void)_notifyDelegateFetchDidComplete;
- (void)_queueOperationDidComplete:(id)a3;
- (void)_removeStateObserverForFetchControllers:(id)a3;
- (void)addFetchController:(id)a3;
- (void)addFetchControllers:(id)a3;
- (void)dealloc;
- (void)nowPlayingObserver:(id)a3 latestObservationDidChange:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseFetching;
- (void)removeFetchController:(id)a3;
- (void)removeFetchControllers:(id)a3;
- (void)resumeFetching;
- (void)setCurrentFetchOperation:(id)a3;
- (void)setDelayContentsChangeOperation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setMediaLibraryRevision:(unint64_t)a3;
- (void)setMutableFetchControllers:(id)a3;
- (void)setNowPlayingObserver:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setSerialFetchOperationQueue:(id)a3;
- (void)setSerialProcessingDispatchQueue:(id)a3;
- (void)setShouldFetchOnResume:(BOOL)a3;
@end

@implementation VUIMediaLibraryFetchControllerQueue

+ (id)defaultQueueWithMediaLibrary:(id)a3
{
  id v3 = a3;
  if (defaultQueueWithMediaLibrary____onceToken != -1) {
    dispatch_once(&defaultQueueWithMediaLibrary____onceToken, &__block_literal_global_20);
  }
  id v4 = (id)defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier;
  objc_sync_enter(v4);
  v5 = [v3 identifier];
  v6 = [(id)defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier objectForKey:v5];
  if (!v6)
  {
    v6 = [[VUIMediaLibraryFetchControllerQueue alloc] initWithMediaLibrary:v3];
    [(id)defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier setObject:v6 forKey:v5];
  }

  objc_sync_exit(v4);
  return v6;
}

void __68__VUIMediaLibraryFetchControllerQueue_defaultQueueWithMediaLibrary___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier;
  defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier = (uint64_t)v0;
}

- (VUIMediaLibraryFetchControllerQueue)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaLibraryFetchControllerQueue)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUIMediaLibraryFetchControllerQueue;
  v6 = [(VUIMediaLibraryFetchControllerQueue *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
    v7->_mediaLibraryRevision = [(VUIMediaLibrary *)v7->_mediaLibrary revision];
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableFetchControllers = v7->_mutableFetchControllers;
    v7->_mutableFetchControllers = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.videosui.VUIMediaLibraryFetchControllerQueue.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v7->_serialProcessingDispatchQueue;
    v7->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    serialFetchOperationQueue = v7->_serialFetchOperationQueue;
    v7->_serialFetchOperationQueue = v12;

    [(NSOperationQueue *)v7->_serialFetchOperationQueue setMaxConcurrentOperationCount:1];
    v14 = objc_alloc_init(VUINowPlayingObserver);
    nowPlayingObserver = v7->_nowPlayingObserver;
    v7->_nowPlayingObserver = v14;

    [(VUINowPlayingObserver *)v7->_nowPlayingObserver setDelegate:v7];
    [(VUINowPlayingObserver *)v7->_nowPlayingObserver startObserving];
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v7 selector:sel__handleMediaLibraryContentsDidChangeNotification_ name:@"VUIMediaLibraryContentsDidChangeNotification" object:v7->_mediaLibrary];
  }
  return v7;
}

- (void)dealloc
{
  [(VUINowPlayingObserver *)self->_nowPlayingObserver setDelegate:0];
  [(VUINowPlayingObserver *)self->_nowPlayingObserver stopObserving];
  [(VUIMediaLibraryFetchControllerQueue *)self _removeStateObserverForFetchControllers:self->_mutableFetchControllers];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIMediaLibraryFetchControllerQueue;
  [(VUIMediaLibraryFetchControllerQueue *)&v4 dealloc];
}

- (NSArray)fetchControllers
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__VUIMediaLibraryFetchControllerQueue_fetchControllers__block_invoke;
  v4[3] = &unk_1E6DF53A8;
  v4[4] = &v5;
  [(VUIMediaLibraryFetchControllerQueue *)self _enqueueSyncProcessingQueueBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __55__VUIMediaLibraryFetchControllerQueue_fetchControllers__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 mutableFetchControllers];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)addFetchController:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v7 count:1];

    -[VUIMediaLibraryFetchControllerQueue addFetchControllers:](self, "addFetchControllers:", v6, v7, v8);
  }
}

- (void)addFetchControllers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__VUIMediaLibraryFetchControllerQueue_addFetchControllers___block_invoke;
    v5[3] = &unk_1E6DF53D0;
    id v6 = v4;
    id v7 = self;
    [(VUIMediaLibraryFetchControllerQueue *)self _enqueueSyncProcessingQueueBlock:v5];
  }
}

void __59__VUIMediaLibraryFetchControllerQueue_addFetchControllers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[VUIMediaLibraryFetchController _logStringWithFetchControllers:*(void *)(a1 + 32)];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Adding fetch controllers to queue: %@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 40) _addStateObserverForFetchControllers:*(void *)(a1 + 32)];
  id v6 = [v3 mutableFetchControllers];

  [v6 addObjectsFromArray:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _enqueueControllerFetchOperation];
}

- (void)removeFetchController:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[VUIMediaLibraryFetchControllerQueue removeFetchControllers:](self, "removeFetchControllers:", v6, v7, v8);
}

- (void)removeFetchControllers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__VUIMediaLibraryFetchControllerQueue_removeFetchControllers___block_invoke;
    v5[3] = &unk_1E6DF53D0;
    id v6 = v4;
    id v7 = self;
    [(VUIMediaLibraryFetchControllerQueue *)self _enqueueSyncProcessingQueueBlock:v5];
  }
}

void __62__VUIMediaLibraryFetchControllerQueue_removeFetchControllers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[VUIMediaLibraryFetchController _logStringWithFetchControllers:*(void *)(a1 + 32)];
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Passed fetch controllers to remove from queue: %@", buf, 0xCu);
  }
  id v6 = [v3 mutableFetchControllers];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "indexOfObjectIdenticalTo:", v13, (void)v16) != 0x7FFFFFFFFFFFFFFFLL) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = VUIDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = +[VUIMediaLibraryFetchController _logStringWithFetchControllers:v7];
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Actually removing fetch controllers from queue: %@", buf, 0xCu);
  }
  [*(id *)(a1 + 40) _removeStateObserverForFetchControllers:v7];
  [v6 removeObjectsInArray:v7];
}

- (void)pauseFetching
{
}

uint64_t __52__VUIMediaLibraryFetchControllerQueue_pauseFetching__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPaused:1];
}

- (void)resumeFetching
{
}

uint64_t __53__VUIMediaLibraryFetchControllerQueue_resumeFetching__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPaused:0];
}

- (void)nowPlayingObserver:(id)a3 latestObservationDidChange:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__VUIMediaLibraryFetchControllerQueue_nowPlayingObserver_latestObservationDidChange___block_invoke;
  v7[3] = &unk_1E6DF5418;
  id v8 = v5;
  id v6 = v5;
  [(VUIMediaLibraryFetchControllerQueue *)self _enqueueAsyncProcessingQueueBlock:v7];
}

void __85__VUIMediaLibraryFetchControllerQueue_nowPlayingObserver_latestObservationDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) nowPlayingAppBundleIdentifier];
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 bundleIdentifier];

  int v7 = [v4 isEqualToString:v6];
  id v8 = VUIDefaultLogObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = [v3 mediaLibrary];
      uint64_t v11 = [v10 title];
      uint64_t v12 = *(void *)(a1 + 32);
      int v16 = 138412546;
      long long v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaLibraryFetchControllerQueue for %@ has detected playback has begun. Observation = %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v13 = [v3 mediaLibrary];
      v14 = [v13 title];
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138412546;
      long long v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaLibraryFetchControllerQueue for %@ has detected playback has ended. Will begin a refetch. Observation = %@", (uint8_t *)&v16, 0x16u);
    }
    id v8 = [v3 mediaLibrary];
    [v8 _postContentsDidChangeNotification];
  }
}

- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"VUIMediaLibraryContentsDidChangeUserInfoKeyContentsChange"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__VUIMediaLibraryFetchControllerQueue__handleMediaLibraryContentsDidChangeNotification___block_invoke;
  v7[3] = &unk_1E6DF5418;
  id v8 = v5;
  id v6 = v5;
  [(VUIMediaLibraryFetchControllerQueue *)self _enqueueAsyncProcessingQueueBlock:v7];
}

void __88__VUIMediaLibraryFetchControllerQueue__handleMediaLibraryContentsDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 mediaLibrary];
    id v6 = [v5 title];
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    BOOL v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "[%@] - Received contents change: %@", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(v3, "setMediaLibraryRevision:", objc_msgSend(*(id *)(a1 + 32), "revision"));
  [v3 _handleMediaLibraryContentsChange];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if (a6 != &VUIMediaLibraryFetchControllerStateKVOContext)
  {
    v19.receiver = self;
    v19.super_class = (Class)VUIMediaLibraryFetchControllerQueue;
    id v11 = a5;
    [(VUIMediaLibraryFetchControllerQueue *)&v19 observeValueForKeyPath:a3 ofObject:v10 change:v11 context:a6];
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v12 = *MEMORY[0x1E4F284E0];
  id v13 = a5;
  v14 = [v13 objectForKey:v12];
  uint64_t v15 = [v14 unsignedIntegerValue];

  int v16 = [v13 objectForKey:*MEMORY[0x1E4F284C8]];

  uint64_t v17 = [v16 unsignedIntegerValue];
  if (v15 == 2 && v17 == 0)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__VUIMediaLibraryFetchControllerQueue_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v20[3] = &unk_1E6DF5418;
    id v21 = v10;
    [(VUIMediaLibraryFetchControllerQueue *)self _enqueueAsyncProcessingQueueBlock:v20];
    id v11 = v21;
    goto LABEL_9;
  }
LABEL_10:
}

void __86__VUIMediaLibraryFetchControllerQueue_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)(a1 + 32);
  id v4 = a2;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v3 logName];
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Fetch controller (%@) has resumed. Will enqueue a new fetch operation to pick up any changes.", (uint8_t *)&v7, 0xCu);
  }
  [v4 _handleMediaLibraryContentsChange];
}

- (void)_addStateObserverForFetchControllers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) addObserver:self forKeyPath:@"state" options:3 context:VUIMediaLibraryFetchControllerStateKVOContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_removeStateObserverForFetchControllers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) removeObserver:self forKeyPath:@"state" context:VUIMediaLibraryFetchControllerStateKVOContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_handleMediaLibraryContentsChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIMediaLibraryFetchControllerQueue *)self delayContentsChangeOperation];
  id v4 = VUIDefaultLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = [(VUIMediaLibraryFetchControllerQueue *)self mediaLibrary];
      uint64_t v7 = [v6 title];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "[%@] - Delay contents change operation is active. Waiting for delay to expire", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = [(VUIMediaLibraryFetchControllerQueue *)self mediaLibrary];
      long long v9 = [v8 title];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "[%@] - Creating delay contents change operation", buf, 0xCu);
    }
    id v4 = [MEMORY[0x1E4FB3C88] delayOperationWithDelay:1.0];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v4);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__VUIMediaLibraryFetchControllerQueue__handleMediaLibraryContentsChange__block_invoke;
    v10[3] = &unk_1E6DF5440;
    objc_copyWeak(&v11, (id *)buf);
    objc_copyWeak(&v12, &location);
    [v4 setCompletionBlock:v10];
    [(VUIMediaLibraryFetchControllerQueue *)self setDelayContentsChangeOperation:v4];
    [v4 start];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __72__VUIMediaLibraryFetchControllerQueue__handleMediaLibraryContentsChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && ([v2 isCancelled] & 1) == 0) {
    [WeakRetained _delayContentsChangeOperationDidComplete:v2];
  }
}

- (void)_delayContentsChangeOperationDidComplete:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__VUIMediaLibraryFetchControllerQueue__delayContentsChangeOperationDidComplete___block_invoke;
  v6[3] = &unk_1E6DF5418;
  id v7 = v4;
  id v5 = v4;
  [(VUIMediaLibraryFetchControllerQueue *)self _enqueueAsyncProcessingQueueBlock:v6];
}

void __80__VUIMediaLibraryFetchControllerQueue__delayContentsChangeOperationDidComplete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 delayContentsChangeOperation];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    uint64_t v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 mediaLibrary];
      uint64_t v8 = [v7 title];
      int v9 = 138412546;
      long long v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = [v3 mediaLibraryRevision];
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Delay contents change operation has completed. Starting fetching of controllers for revision: %lu", (uint8_t *)&v9, 0x16u);
    }
    [v3 _enqueueControllerFetchOperation];
    [v3 setDelayContentsChangeOperation:0];
  }
}

- (void)_queueOperationDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "[VUIMediaLibraryFetchControllerQueue] - VUIMediaLibraryFetchControllerQueueOperation has completed. Notifying delegates", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__VUIMediaLibraryFetchControllerQueue__queueOperationDidComplete___block_invoke;
  v7[3] = &unk_1E6DF5418;
  id v8 = v4;
  id v6 = v4;
  [(VUIMediaLibraryFetchControllerQueue *)self _enqueueAsyncProcessingQueueBlock:v7];
}

void __66__VUIMediaLibraryFetchControllerQueue__queueOperationDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 currentFetchOperation];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    [v5 setCurrentFetchOperation:0];
    [v5 _notifyDelegateFetchDidComplete];
  }
}

- (void)_enqueueControllerFetchOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(VUIMediaLibraryFetchControllerQueue *)self isPaused])
  {
    id v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(VUIMediaLibraryFetchControllerQueue *)self mediaLibrary];
      id v5 = [v4 title];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v5;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "[%@] - Fetching is paused so the fetch has been deferred. It will start when fetching is resumed", buf, 0xCu);
    }
    [(VUIMediaLibraryFetchControllerQueue *)self setShouldFetchOnResume:1];
  }
  else
  {
    id v6 = [(VUIMediaLibraryFetchControllerQueue *)self mutableFetchControllers];
    id v7 = [[VUIMediaLibraryFetchControllerQueueOperation alloc] initWithFetchControllers:v6 mediaLibraryRevision:[(VUIMediaLibraryFetchControllerQueue *)self mediaLibraryRevision]];
    id v8 = [(VUIMediaLibraryFetchControllerQueue *)self currentFetchOperation];
    [v8 cancel];

    [(VUIMediaLibraryFetchControllerQueue *)self setCurrentFetchOperation:v7];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__VUIMediaLibraryFetchControllerQueue__enqueueControllerFetchOperation__block_invoke;
    v10[3] = &unk_1E6DF5440;
    objc_copyWeak(&v11, (id *)buf);
    objc_copyWeak(&v12, &location);
    [(VUIMediaLibraryFetchControllerQueueOperation *)v7 setCompletionBlock:v10];
    int v9 = [(VUIMediaLibraryFetchControllerQueue *)self serialFetchOperationQueue];
    [v9 addOperation:v7];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __71__VUIMediaLibraryFetchControllerQueue__enqueueControllerFetchOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && ([v2 isCancelled] & 1) == 0) {
    [WeakRetained _queueOperationDidComplete:v2];
  }
}

- (void)setPaused:(BOOL)a3
{
  BOOL paused = self->_paused;
  if (paused != a3)
  {
    BOOL v6 = [(VUIMediaLibraryFetchControllerQueue *)self shouldFetchOnResume];
    self->_BOOL paused = a3;
    [(VUIMediaLibraryFetchControllerQueue *)self setShouldFetchOnResume:0];
    if (paused && v6)
    {
      [(VUIMediaLibraryFetchControllerQueue *)self _enqueueControllerFetchOperation];
    }
  }
}

- (void)_enqueueProcessingQueueBlock:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__VUIMediaLibraryFetchControllerQueue__enqueueProcessingQueueBlock_synchronous___block_invoke;
    v11[3] = &unk_1E6DF5468;
    id v8 = &v12;
    id v12 = v6;
    [(VUIMediaLibraryFetchControllerQueue *)self _enqueueSyncProcessingQueueBlock:v11];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__VUIMediaLibraryFetchControllerQueue__enqueueProcessingQueueBlock_synchronous___block_invoke_2;
    v9[3] = &unk_1E6DF5468;
    id v8 = &v10;
    id v10 = v6;
    [(VUIMediaLibraryFetchControllerQueue *)self _enqueueAsyncProcessingQueueBlock:v9];
  }
}

uint64_t __80__VUIMediaLibraryFetchControllerQueue__enqueueProcessingQueueBlock_synchronous___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__VUIMediaLibraryFetchControllerQueue__enqueueProcessingQueueBlock_synchronous___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_enqueueAsyncProcessingQueueBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMediaLibraryFetchControllerQueue *)self serialProcessingDispatchQueue];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__VUIMediaLibraryFetchControllerQueue__enqueueAsyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __73__VUIMediaLibraryFetchControllerQueue__enqueueAsyncProcessingQueueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_enqueueSyncProcessingQueueBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMediaLibraryFetchControllerQueue *)self serialProcessingDispatchQueue];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__VUIMediaLibraryFetchControllerQueue__enqueueSyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__VUIMediaLibraryFetchControllerQueue__enqueueSyncProcessingQueueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_notifyDelegateFetchDidComplete
{
  id v3 = [(VUIMediaLibraryFetchControllerQueue *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    id v4 = [(VUIMediaLibraryFetchControllerQueue *)self mediaLibrary];
    id v5 = [v4 manager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__VUIMediaLibraryFetchControllerQueue__notifyDelegateFetchDidComplete__block_invoke;
    v6[3] = &unk_1E6DF5490;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    [v5 _enqueueCompletionQueueBlock:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __70__VUIMediaLibraryFetchControllerQueue__notifyDelegateFetchDidComplete__block_invoke(uint64_t a1)
{
  id v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "[VUIMediaLibraryFetchControllerQueue] - Notifying fetch did complete", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) fetchDidCompleteForMediaLibraryFetchControllerQueue:WeakRetained];
  }
}

- (VUIMediaLibraryFetchControllerQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIMediaLibraryFetchControllerQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)mutableFetchControllers
{
  return self->_mutableFetchControllers;
}

- (void)setMutableFetchControllers:(id)a3
{
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)shouldFetchOnResume
{
  return self->_shouldFetchOnResume;
}

- (void)setShouldFetchOnResume:(BOOL)a3
{
  self->_shouldFetchOnResume = a3;
}

- (unint64_t)mediaLibraryRevision
{
  return self->_mediaLibraryRevision;
}

- (void)setMediaLibraryRevision:(unint64_t)a3
{
  self->_mediaLibraryRevision = a3;
}

- (VUIMediaLibraryFetchControllerQueueOperation)currentFetchOperation
{
  return self->_currentFetchOperation;
}

- (void)setCurrentFetchOperation:(id)a3
{
}

- (VUIDelayOperation)delayContentsChangeOperation
{
  return self->_delayContentsChangeOperation;
}

- (void)setDelayContentsChangeOperation:(id)a3
{
}

- (NSOperationQueue)serialFetchOperationQueue
{
  return self->_serialFetchOperationQueue;
}

- (void)setSerialFetchOperationQueue:(id)a3
{
}

- (VUINowPlayingObserver)nowPlayingObserver
{
  return self->_nowPlayingObserver;
}

- (void)setNowPlayingObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);
  objc_storeStrong((id *)&self->_serialFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_delayContentsChangeOperation, 0);
  objc_storeStrong((id *)&self->_currentFetchOperation, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_mutableFetchControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end