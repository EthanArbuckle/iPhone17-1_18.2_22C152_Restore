@interface VUIMPMediaItemDownloadController
- (BOOL)isRestoreDownload;
- (BOOL)supportsCancellation;
- (BOOL)supportsPausing;
- (MPMediaItem)mediaItem;
- (NSHashTable)observers;
- (OS_dispatch_queue)observerDispatchQueue;
- (OS_dispatch_queue)serialProcessingDispatchQueue;
- (VUIMPMediaItemDownloadController)init;
- (VUIMPMediaItemDownloadController)initWithMediaItem:(id)a3 state:(id)a4 serialProcessingDispatchQueue:(id)a5;
- (VUIMPMediaItemDownloadControllerState)state;
- (void)_enqueueAsyncProcessingQueueBlock:(id)a3;
- (void)_enqueueAsyncStrongSelfProcessingQueueBlock:(id)a3;
- (void)_enqueueObserverQueueBlock:(id)a3;
- (void)_notifyObservers:(id)a3 stateDidChange:(id)a4;
- (void)_onProcessingQueue_setState:(id)a3;
- (void)_setState:(id)a3;
- (void)addObserver:(id)a3;
- (void)cancelDownload;
- (void)invalidate;
- (void)pauseDownload;
- (void)removeObserver:(id)a3;
- (void)resumeDownload;
- (void)setMediaItem:(id)a3;
- (void)setObserverDispatchQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSerialProcessingDispatchQueue:(id)a3;
- (void)setState:(id)a3;
@end

@implementation VUIMPMediaItemDownloadController

- (VUIMPMediaItemDownloadController)initWithMediaItem:(id)a3 state:(id)a4 serialProcessingDispatchQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)VUIMPMediaItemDownloadController;
  v12 = [(VUIMPMediaItemDownloadController *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaItem, a3);
    uint64_t v14 = [v10 copy];
    state = v13->_state;
    v13->_state = (VUIMPMediaItemDownloadControllerState *)v14;

    objc_storeStrong((id *)&v13->_serialProcessingDispatchQueue, a5);
    uint64_t v16 = dispatch_get_global_queue(21, 0);
    observerDispatchQueue = v13->_observerDispatchQueue;
    v13->_observerDispatchQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v18;
  }
  return v13;
}

- (VUIMPMediaItemDownloadController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMPMediaItemDownloadControllerState)state
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(VUIMPMediaItemDownloadControllerState *)v2->_state copy];
  objc_sync_exit(v2);

  return (VUIMPMediaItemDownloadControllerState *)v3;
}

- (BOOL)supportsPausing
{
  return 1;
}

- (BOOL)supportsCancellation
{
  return ![(VUIMPMediaItemDownloadController *)self isRestoreDownload];
}

- (BOOL)isRestoreDownload
{
  return 0;
}

- (void)invalidate
{
}

uint64_t __46__VUIMPMediaItemDownloadController_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_onProcessingQueue_invalidate");
}

- (void)cancelDownload
{
}

void __50__VUIMPMediaItemDownloadController_cancelDownload__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsCancellation]) {
    objc_msgSend(v2, "_onProcessingQueue_cancelDownload");
  }
}

- (void)pauseDownload
{
}

void __49__VUIMPMediaItemDownloadController_pauseDownload__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsPausing]) {
    objc_msgSend(v2, "_onProcessingQueue_pauseDownload");
  }
}

- (void)resumeDownload
{
}

void __50__VUIMPMediaItemDownloadController_resumeDownload__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsPausing]) {
    objc_msgSend(v2, "_onProcessingQueue_resumeDownload");
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"observer" format];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VUIMPMediaItemDownloadController_addObserver___block_invoke;
  v6[3] = &unk_1E6DF9D88;
  id v7 = v4;
  id v5 = v4;
  [(VUIMPMediaItemDownloadController *)self _enqueueAsyncStrongSelfProcessingQueueBlock:v6];
}

void __48__VUIMPMediaItemDownloadController_addObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 observers];
  [v3 addObject:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"observer" format];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VUIMPMediaItemDownloadController_removeObserver___block_invoke;
  v6[3] = &unk_1E6DF9D88;
  id v7 = v4;
  id v5 = v4;
  [(VUIMPMediaItemDownloadController *)self _enqueueAsyncStrongSelfProcessingQueueBlock:v6];
}

void __51__VUIMPMediaItemDownloadController_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 observers];
  [v3 removeObject:*(void *)(a1 + 32)];
}

- (void)_setState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__VUIMPMediaItemDownloadController__setState___block_invoke;
  v6[3] = &unk_1E6DF9D88;
  id v7 = v4;
  id v5 = v4;
  [(VUIMPMediaItemDownloadController *)self _enqueueAsyncStrongSelfProcessingQueueBlock:v6];
}

uint64_t __46__VUIMPMediaItemDownloadController__setState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_onProcessingQueue_setState:", *(void *)(a1 + 32));
}

- (void)_enqueueAsyncStrongSelfProcessingQueueBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__VUIMPMediaItemDownloadController__enqueueAsyncStrongSelfProcessingQueueBlock___block_invoke;
  v6[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(VUIMPMediaItemDownloadController *)self _enqueueAsyncProcessingQueueBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __80__VUIMPMediaItemDownloadController__enqueueAsyncStrongSelfProcessingQueueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_enqueueAsyncProcessingQueueBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMPMediaItemDownloadController *)self serialProcessingDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VUIMPMediaItemDownloadController__enqueueAsyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E6DF3DD0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __70__VUIMPMediaItemDownloadController__enqueueAsyncProcessingQueueBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_enqueueObserverQueueBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMPMediaItemDownloadController *)self observerDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VUIMPMediaItemDownloadController__enqueueObserverQueueBlock___block_invoke;
  block[3] = &unk_1E6DF3DD0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __63__VUIMPMediaItemDownloadController__enqueueObserverQueueBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_onProcessingQueue_setState:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(VUIMPMediaItemDownloadControllerState *)v5->_state isEqual:v4])
  {
    uint64_t v6 = [v4 copy];
    state = v5->_state;
    v5->_state = (VUIMPMediaItemDownloadControllerState *)v6;

    id v8 = (void *)[v4 copy];
    id v9 = [(VUIMPMediaItemDownloadController *)v5 observers];
    id v10 = (void *)[v9 copy];

    objc_initWeak(&location, v5);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__VUIMPMediaItemDownloadController__onProcessingQueue_setState___block_invoke;
    v13[3] = &unk_1E6DF3F90;
    objc_copyWeak(&v16, &location);
    id v11 = v10;
    id v14 = v11;
    id v12 = v8;
    id v15 = v12;
    [(VUIMPMediaItemDownloadController *)v5 _enqueueObserverQueueBlock:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v5);
}

void __64__VUIMPMediaItemDownloadController__onProcessingQueue_setState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _notifyObservers:*(void *)(a1 + 32) stateDidChange:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_notifyObservers:(id)a3 stateDidChange:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 mediaItemDownloadController:self stateDidChange:v7];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (OS_dispatch_queue)observerDispatchQueue
{
  return self->_observerDispatchQueue;
}

- (void)setObserverDispatchQueue:(id)a3
{
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (void)setState:(id)a3
{
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_observerDispatchQueue, 0);
}

@end