@interface SSDownloadQueue
+ (id)mediaDownloadKinds;
+ (id)softwareApplicationDownloadKinds;
- (BOOL)addDownload:(id)a3;
- (BOOL)canCancelDownload:(id)a3;
- (BOOL)cancelDownload:(id)a3;
- (BOOL)isUsingNetwork;
- (BOOL)reloadFromServer;
- (BOOL)shouldAutomaticallyFinishDownloads;
- (BOOL)startPreOrderDownload:(id)a3;
- (NSArray)downloads;
- (NSArray)placeholderDownloads;
- (NSArray)preorders;
- (NSSet)downloadKinds;
- (SSDownloadManager)downloadManager;
- (SSDownloadQueue)init;
- (SSDownloadQueue)initWithDownloadKinds:(id)a3;
- (id)_initWithDownloadManagerOptions:(id)a3;
- (id)downloadForItemIdentifier:(unint64_t)a3;
- (void)_handleDownloadsDidChange:(id)a3;
- (void)_handleDownloadsRemoved:(id)a3;
- (void)_messageObserversWithFunction:(void *)a3 context:(void *)a4;
- (void)_sendDownloadStatusChangedAtIndex:(int64_t)a3;
- (void)_sendQueueChangedWithRemovals:(id)a3;
- (void)_sendQueueNetworkUsageChanged;
- (void)_sendQueuePreOrdersChanged;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4;
- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4;
- (void)downloadManagerDownloadsDidChange:(id)a3;
- (void)downloadManagerNetworkUsageDidChange:(id)a3;
- (void)getDownloadsUsingBlock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setShouldAutomaticallyFinishDownloads:(BOOL)a3;
@end

@implementation SSDownloadQueue

- (id)_initWithDownloadManagerOptions:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SSDownloadQueue;
  v4 = [(SSDownloadQueue *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_autoFinishDownloads = 1;
    v6 = [[SSDownloadManager alloc] initWithManagerOptions:a3];
    v5->_downloadManager = v6;
    [(SSDownloadManager *)v6 addObserver:v5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SSDownloadQueue__initWithDownloadManagerOptions___block_invoke;
    block[3] = &unk_1E5BA73F8;
    block[4] = v5;
    dispatch_after(0, MEMORY[0x1E4F14428], block);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)__DaemonLaunchNotification, @"com.apple.iTunesStore.daemon.launched", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v5;
}

uint64_t __51__SSDownloadQueue__initWithDownloadManagerOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDownloadsDidChange:0];
}

- (SSDownloadQueue)init
{
  return [(SSDownloadQueue *)self initWithDownloadKinds:0];
}

- (SSDownloadQueue)initWithDownloadKinds:(id)a3
{
  if ([a3 count])
  {
    v5 = objc_alloc_init(SSDownloadManagerOptions);
    -[SSDownloadManagerOptions setDownloadKinds:](v5, "setDownloadKinds:", [a3 allObjects]);
    v6 = (objc_class *)objc_opt_class();
    [(SSDownloadManagerOptions *)v5 setPersistenceIdentifier:NSStringFromClass(v6)];
    -[SSDownloadManagerOptions setPrefetchedDownloadExternalProperties:](v5, "setPrefetchedDownloadExternalProperties:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"0", @"1", @"4", @"9", @"A", 0));
    -[SSDownloadManagerOptions setPrefetchedDownloadProperties:](v5, "setPrefetchedDownloadProperties:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"K", @"I", @"J", @"M", @"P", @"9", 0));
    v7 = [(SSDownloadQueue *)self _initWithDownloadManagerOptions:v5];

    return v7;
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"A download queue must have download kinds"];
    return 0;
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.iTunesStore.daemon.launched", 0);
  [(SSDownloadManager *)self->_downloadManager removeObserver:self];

  observers = self->_observers;
  if (observers) {
    CFRelease(observers);
  }
  v5.receiver = self;
  v5.super_class = (Class)SSDownloadQueue;
  [(SSDownloadQueue *)&v5 dealloc];
}

+ (id)mediaDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"book", @"coached-audio", @"document", @"feature-movie", @"song", @"music-video", @"podcast", @"ringtone", @"tv-episode", @"tone", @"videoPodcast", 0);
}

+ (id)softwareApplicationDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"software", 0);
}

- (BOOL)addDownload:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  objc_super v5 = dispatch_semaphore_create(0);
  downloadManager = self->_downloadManager;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__SSDownloadQueue_addDownload___block_invoke;
  v9[3] = &unk_1E5BA7420;
  v9[4] = v5;
  v9[5] = &v10;
  [(SSDownloadManager *)downloadManager addDownloads:v7 completionBlock:v9];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  LOBYTE(v5) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v5;
}

intptr_t __31__SSDownloadQueue_addDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  observers = self->_observers;
  if (!observers)
  {
    observers = CFSetCreateMutable(0, 0, 0);
    self->_observers = observers;
  }
  CFSetAddValue(observers, a3);
}

- (BOOL)cancelDownload:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (-[SSDownloadQueue canCancelDownload:](self, "canCancelDownload:"))
  {
    objc_super v5 = dispatch_semaphore_create(0);
    downloadManager = self->_downloadManager;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__SSDownloadQueue_cancelDownload___block_invoke;
    v10[3] = &unk_1E5BA7420;
    v10[4] = v5;
    v10[5] = &v11;
    [(SSDownloadManager *)downloadManager cancelDownloads:v7 completionBlock:v10];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

intptr_t __34__SSDownloadQueue_cancelDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)canCancelDownload:(id)a3
{
  return [(SSDownloadManager *)self->_downloadManager canCancelDownload:a3];
}

- (NSSet)downloadKinds
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(SSDownloadManagerOptions *)[(SSDownloadManager *)self->_downloadManager managerOptions] downloadKinds];
  return (NSSet *)[v2 setWithArray:v3];
}

- (SSDownloadManager)downloadManager
{
  v2 = self->_downloadManager;
  return v2;
}

- (NSArray)downloads
{
  return [(SSDownloadManager *)self->_downloadManager downloads];
}

- (void)getDownloadsUsingBlock:(id)a3
{
}

- (BOOL)isUsingNetwork
{
  return [(SSDownloadManager *)self->_downloadManager isUsingNetwork];
}

- (BOOL)reloadFromServer
{
  return 1;
}

- (void)removeObserver:(id)a3
{
  observers = self->_observers;
  if (observers) {
    CFSetRemoveValue(observers, a3);
  }
}

- (id)downloadForItemIdentifier:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = [(SSDownloadManager *)self->_downloadManager downloads];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id result = (id)[(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      char v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (SSGetItemIdentifierFromValue([v9 valueForProperty:@"7"]) == a3) {
          return v9;
        }
        char v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = (id)[(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSArray)placeholderDownloads
{
  return 0;
}

- (NSArray)preorders
{
  return 0;
}

- (BOOL)startPreOrderDownload:(id)a3
{
  return 0;
}

- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SSDownloadQueue_downloadManager_downloadsDidChange___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __54__SSDownloadQueue_downloadManager_downloadsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDownloadsDidChange:*(void *)(a1 + 40)];
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SSDownloadQueue_downloadManager_downloadStatesDidChange___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __59__SSDownloadQueue_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[*(id *)(a1 + 32) downloads];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (SSDownloadPhaseIsFinishedPhase((void *)[v9 downloadPhaseIdentifier]))
        {
          [v3 addObject:v9];
        }
        else
        {
          uint64_t v10 = [v2 indexOfObject:v9];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [*(id *)(a1 + 32) _sendDownloadStatusChangedAtIndex:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  if ([v3 count]) {
    [*(id *)(a1 + 32) _handleDownloadsRemoved:v3];
  }
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SSDownloadQueue_downloadManagerDownloadsDidChange___block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__SSDownloadQueue_downloadManagerDownloadsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDownloadsDidChange:0];
}

- (void)downloadManagerNetworkUsageDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SSDownloadQueue_downloadManagerNetworkUsageDidChange___block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__SSDownloadQueue_downloadManagerNetworkUsageDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendQueueNetworkUsageChanged];
}

- (void)_messageObserversWithFunction:(void *)a3 context:(void *)a4
{
  observers = self->_observers;
  if (observers)
  {
    CFSetRef Copy = CFSetCreateCopy(0, observers);
    if (Copy)
    {
      CFSetRef v9 = Copy;
      uint64_t v10 = self;
      CFSetApplyFunction(v9, (CFSetApplierFunction)a3, a4);
      CFRelease(v9);
    }
  }
}

- (void)_sendDownloadStatusChangedAtIndex:(int64_t)a3
{
  v3[0] = self;
  v3[1] = a3;
  [(SSDownloadQueue *)self _messageObserversWithFunction:__SendDownloadStatusChanged context:v3];
}

- (void)_sendQueueChangedWithRemovals:(id)a3
{
  v3[0] = self;
  v3[1] = a3;
  [(SSDownloadQueue *)self _messageObserversWithFunction:__SendQueueChanged context:v3];
}

- (void)_sendQueueNetworkUsageChanged
{
  v2[0] = self;
  v2[1] = 0;
  [(SSDownloadQueue *)self _messageObserversWithFunction:__SendNetworkUsageChanged context:v2];
}

- (void)_sendQueuePreOrdersChanged
{
  v2[0] = self;
  v2[1] = 0;
  [(SSDownloadQueue *)self _messageObserversWithFunction:__SendPreOrdersChanged context:v2];
}

- (void)_handleDownloadsDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [(SSDownloadManager *)self->_downloadManager downloads];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (!a3 || [a3 containsObject:*(void *)(*((void *)&v12 + 1) + 8 * v10)])
        {
          if (SSDownloadPhaseIsFinishedPhase((void *)[v11 downloadPhaseIdentifier])) {
            [v5 addObject:v11];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  [(SSDownloadQueue *)self _handleDownloadsRemoved:v5];
}

- (void)_handleDownloadsRemoved:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_autoFinishDownloads)
  {
    id v5 = (void *)[a3 allObjects];
    if ([v5 count]) {
      [(SSDownloadManager *)self->_downloadManager _willFinishDownloads:v5];
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v20 = 138412546;
    uint64_t v21 = objc_opt_class();
    __int16 v22 = 2048;
    uint64_t v23 = [a3 count];
    LODWORD(v19) = 22;
    v18 = &v20;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v20, v19);
      free(v10);
      SSFileLog(v6, @"%@", v12, v13, v14, v15, v16, v17, v11);
    }
  }
  -[SSDownloadQueue _sendQueueChangedWithRemovals:](self, "_sendQueueChangedWithRemovals:", a3, v18);
  if ([a3 count])
  {
    if (self->_autoFinishDownloads) {
      [(SSDownloadManager *)self->_downloadManager _finishDownloads:v5];
    }
  }
}

- (BOOL)shouldAutomaticallyFinishDownloads
{
  return self->_autoFinishDownloads;
}

- (void)setShouldAutomaticallyFinishDownloads:(BOOL)a3
{
  self->_autoFinishDownloads = a3;
}

@end