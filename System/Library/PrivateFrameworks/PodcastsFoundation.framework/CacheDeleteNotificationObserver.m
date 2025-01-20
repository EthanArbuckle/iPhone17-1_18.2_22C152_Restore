@interface CacheDeleteNotificationObserver
- (BOOL)beginObserving;
- (CacheDeleteNotificationObserver)initWithDelegate:(id)a3 observedPaths:(id)a4 notificationQueue:(id)a5;
- (CacheDeleteNotificationObserverDelegate)delegate;
- (NSArray)observedPaths;
- (OS_dispatch_queue)notificationQueue;
- (void)_onQueueBeginObserving;
- (void)_onQueueConfigurePurgeMarkerForVolume:(__CFArray *)a3;
- (void)_onQueueProcessNotifications:(__CFArray *)a3;
- (void)_onQueueSubscribeToNotificationsForVolume:(id)a3;
@end

@implementation CacheDeleteNotificationObserver

- (BOOL)beginObserving
{
  v3 = [(NSArray *)self->_observedPaths firstObject];

  if (v3)
  {
    objc_initWeak(&location, self);
    notificationQueue = self->_notificationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__CacheDeleteNotificationObserver_beginObserving__block_invoke;
    v6[3] = &unk_1E5E62098;
    objc_copyWeak(&v7, &location);
    dispatch_async(notificationQueue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3 != 0;
}

uint64_t __57__CacheDeleteNotificationObserver__onQueueBeginObserving__block_invoke(uint64_t a1, void *a2)
{
  return [a2 path];
}

void __49__CacheDeleteNotificationObserver_beginObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _onQueueBeginObserving];
    id WeakRetained = v2;
  }
}

- (void)_onQueueBeginObserving
{
  id v3 = [(NSArray *)self->_observedPaths mt_compactMap:&__block_literal_global_7];
  [(CacheDeleteNotificationObserver *)self _onQueueConfigurePurgeMarkerForVolume:v3];
  [(CacheDeleteNotificationObserver *)self _onQueueSubscribeToNotificationsForVolume:v3];
}

- (void)_onQueueConfigurePurgeMarkerForVolume:(__CFArray *)a3
{
  objc_initWeak(&location, self);
  CFIndex Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(a3, i);
      CacheDeleteInitPurgeMarker();
    }
  }
  objc_copyWeak(&v6, &location);
  CacheDeleteEnumerateRemovedFilesInDirectories();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (CacheDeleteNotificationObserver)initWithDelegate:(id)a3 observedPaths:(id)a4 notificationQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CacheDeleteNotificationObserver;
  v11 = [(CacheDeleteNotificationObserver *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_notificationQueue, a5);
    objc_storeStrong((id *)&v12->_observedPaths, a4);
    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatter = v12->_formatter;
    v12->_formatter = v13;

    [(NSDateFormatter *)v12->_formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSS"];
  }

  return v12;
}

void __73__CacheDeleteNotificationObserver__onQueueConfigurePurgeMarkerForVolume___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _onQueueProcessNotifications:a2];
    id WeakRetained = v4;
  }
}

- (void)_onQueueSubscribeToNotificationsForVolume:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = v4;
  objc_copyWeak(&v6, &location);
  CacheDeleteRegisterPurgeNotification();
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

- (void)_onQueueProcessNotifications:(__CFArray *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = a3;
  uint64_t v4 = [(__CFArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v23;
    *(void *)&long long v5 = 138412802;
    long long v20 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        id v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"historyDone", v20);

        if (v10)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained cacheDeleteObserverBecameSynchronizedWithFileSystem:self];
        }
        else
        {
          uint64_t v12 = [v9 objectForKeyedSubscript:@"path"];
          if (v12
            && (v13 = (void *)v12,
                [v9 objectForKeyedSubscript:@"timestamp"],
                v14 = objc_claimAutoreleasedReturnValue(),
                v14,
                v13,
                v14))
          {
            id WeakRetained = [v9 objectForKeyedSubscript:@"path"];
            v15 = [v9 objectForKeyedSubscript:@"timestamp"];
            objc_super v16 = [(NSDateFormatter *)self->_formatter dateFromString:v15];
            v17 = _MTLogCategoryDownload();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              v27 = v15;
              __int16 v28 = 2112;
              v29 = v16;
              __int16 v30 = 2112;
              v31 = WeakRetained;
              _os_log_impl(&dword_1AC9D5000, v17, OS_LOG_TYPE_DEFAULT, "Found cache deleted file ('%@' => %@): (%@)", buf, 0x20u);
            }

            id v18 = objc_loadWeakRetained((id *)&self->_delegate);
            [v18 cacheDeleteObserver:self didIdentifyCacheDeletedPath:WeakRetained deletedAtDate:v16];
          }
          else
          {
            id WeakRetained = _MTLogCategoryDownload();
            if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v9;
              _os_log_impl(&dword_1AC9D5000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Unhandled CacheDeleteEvent: %@", buf, 0xCu);
            }
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v19 = [(__CFArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
      uint64_t v6 = v19;
    }
    while (v19);
  }
}

void __77__CacheDeleteNotificationObserver__onQueueSubscribeToNotificationsForVolume___block_invoke(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 40));
  CacheDeleteEnumerateRemovedFilesInDirectories();
  objc_destroyWeak(&v1);
}

void __77__CacheDeleteNotificationObserver__onQueueSubscribeToNotificationsForVolume___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _onQueueProcessNotifications:a2];
    id WeakRetained = v4;
  }
}

- (CacheDeleteNotificationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CacheDeleteNotificationObserverDelegate *)WeakRetained;
}

- (NSArray)observedPaths
{
  return self->_observedPaths;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observedPaths, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end