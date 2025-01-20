@interface PXPhotoLibraryChangeDistributor
- (BOOL)areChangesPaused;
- (PXPhotoLibraryChangeDistributor)initWithPhotoLibrary:(id)a3;
- (id)beginPausingChangesWithTimeout:(double)a3 identifier:(id)a4;
- (void)_notifyPausedStateChange;
- (void)dealloc;
- (void)distributeChangeOnMainQueue:(id)a3;
- (void)endPausingChanges:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
- (void)registerChangeObserver:(id)a3;
- (void)registerInternalChangeObserver:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
- (void)unregisterInternalChangeObserver:(id)a3;
@end

@implementation PXPhotoLibraryChangeDistributor

uint64_t __58__PXPhotoLibraryChangeDistributor_registerChangeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)registerChangeObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__PXPhotoLibraryChangeDistributor_registerChangeObserver___block_invoke;
    v7[3] = &unk_1E5DD32A8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

- (PXPhotoLibraryChangeDistributor)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXPhotoLibraryChangeDistributor;
  v5 = [(PXPhotoLibraryChangeDistributor *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    internalObservers = v5->_internalObservers;
    v5->_internalObservers = (NSHashTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.photos.changeDistributor", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    objc_storeWeak((id *)&v5->_photoLibrary, v4);
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    changeDeliverySemaphore = v5->_changeDeliverySemaphore;
    v5->_changeDeliverySemaphore = (OS_dispatch_semaphore *)v12;

    dispatch_group_t v14 = dispatch_group_create();
    changePausingGroup = v5->_changePausingGroup;
    v5->_changePausingGroup = (OS_dispatch_group *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    changePausingTokens = v5->_changePausingTokens;
    v5->_changePausingTokens = (NSMutableSet *)v16;

    v18 = dispatch_get_global_queue(25, 0);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__PXPhotoLibraryChangeDistributor_initWithPhotoLibrary___block_invoke;
    v20[3] = &unk_1E5DD32A8;
    id v21 = v4;
    v22 = v5;
    dispatch_async(v18, v20);
  }
  return v5;
}

uint64_t __60__PXPhotoLibraryChangeDistributor_unregisterChangeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

uint64_t __66__PXPhotoLibraryChangeDistributor_registerInternalChangeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

uint64_t __56__PXPhotoLibraryChangeDistributor_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerChangeObserver:*(void *)(a1 + 40)];
}

- (void)unregisterChangeObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__PXPhotoLibraryChangeDistributor_unregisterChangeObserver___block_invoke;
    v7[3] = &unk_1E5DD32A8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

- (void)registerInternalChangeObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__PXPhotoLibraryChangeDistributor_registerInternalChangeObserver___block_invoke;
    v7[3] = &unk_1E5DD32A8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

void __59__PXPhotoLibraryChangeDistributor__notifyPausedStateChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_notifyPausedStateChange
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    dispatch_group_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary+PhotosUICore.m" lineNumber:245 description:@"must be on main thread"];
  }
  id v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [(PXPhotoLibraryChangeDistributor *)self areChangesPaused];
    uint64_t v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    v7 = [v6 currentMode];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v5;
    LOWORD(v22) = 2114;
    *(void *)((char *)&v22 + 2) = v7;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_INFO, "Change Distribution: Notifying paused state changed to: %d, runLoopMode = %{public}@", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&long long v22 = buf;
  *((void *)&v22 + 1) = 0x3032000000;
  objc_super v23 = __Block_byref_object_copy__179605;
  v24 = __Block_byref_object_dispose__179606;
  id v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PXPhotoLibraryChangeDistributor__notifyPausedStateChange__block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(queue, block);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = *(id *)(v22 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "photoLibraryChangesPausedDidChange", (void)v15);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(buf, 8);
}

- (id)beginPausingChangesWithTimeout:(double)a3 identifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary+PhotosUICore.m" lineNumber:199 description:@"must be on main thread"];
  }
  if (a3 < 0.0)
  {
    dispatch_group_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary+PhotosUICore.m" lineNumber:200 description:@"timeout must be >= 0"];
  }
  [v7 length];
  id v8 = [MEMORY[0x1E4F29128] UUID];
  BOOL v9 = [(PXPhotoLibraryChangeDistributor *)self areChangesPaused];
  [(NSMutableSet *)self->_changePausingTokens addObject:v8];
  dispatch_group_enter((dispatch_group_t)self->_changePausingGroup);
  uint64_t v10 = PLUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    double v19 = a3;
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2114;
    objc_super v23 = v8;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_INFO, "Change Distribution: beginPausingChangesWithTimeout: %lf, identifier: %{public}@, token: %{public}@", buf, 0x20u);
  }

  if (v9 != [(PXPhotoLibraryChangeDistributor *)self areChangesPaused]) {
    [(PXPhotoLibraryChangeDistributor *)self _notifyPausedStateChange];
  }
  if (a3 > 0.0)
  {
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PXPhotoLibraryChangeDistributor_beginPausingChangesWithTimeout_identifier___block_invoke;
    block[3] = &unk_1E5DD0F30;
    block[4] = self;
    id v16 = v8;
    id v17 = v7;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
  }
  return v8;
}

- (BOOL)areChangesPaused
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary+PhotosUICore.m" lineNumber:81 description:@"must be on main thread"];
  }
  return [(NSMutableSet *)self->_changePausingTokens count] != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changePausingTokens, 0);
  objc_storeStrong((id *)&self->_changePausingGroup, 0);
  objc_storeStrong((id *)&self->_changeDeliverySemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_internalObservers, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
}

- (void)endPausingChanges:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary+PhotosUICore.m" lineNumber:226 description:@"must be on main thread"];

    if (!v5) {
      goto LABEL_10;
    }
  }
  if ([(NSMutableSet *)self->_changePausingTokens containsObject:v5])
  {
    uint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_INFO, "Change Distribution: endPausingChanges for token: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    BOOL v7 = [(PXPhotoLibraryChangeDistributor *)self areChangesPaused];
    [(NSMutableSet *)self->_changePausingTokens removeObject:v5];
    if (v7 != [(PXPhotoLibraryChangeDistributor *)self areChangesPaused]) {
      [(PXPhotoLibraryChangeDistributor *)self _notifyPausedStateChange];
    }
    dispatch_group_leave((dispatch_group_t)self->_changePausingGroup);
    goto LABEL_13;
  }
LABEL_10:
  BOOL v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Change Distribution: Ignoring endPausingChanges for invalid token: %{public}@", (uint8_t *)&v10, 0xCu);
  }

LABEL_13:
}

uint64_t __77__PXPhotoLibraryChangeDistributor_beginPausingChangesWithTimeout_identifier___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      int v6 = 138543618;
      uint64_t v7 = v4;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_ERROR, "Change Distribution: Pause timed out for identifier: %{public}@, token: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    return [*(id *)(a1 + 32) endPausingChanges:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)distributeChangeOnMainQueue:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PXPhotoLibraryChangeDistributor_distributeChangeOnMainQueue___block_invoke;
  aBlock[3] = &unk_1E5DD32A8;
  id v6 = v5;
  id v15 = v6;
  id v16 = self;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary+PhotosUICore.m" lineNumber:183 description:@"must be on main thread"];
  }
  if ([(NSMutableSet *)self->_changePausingTokens count])
  {
    __int16 v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_INFO, "Change Distribution: Waiting for change delivery to be unpaused.", buf, 2u);
    }

    changePausingGroup = self->_changePausingGroup;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PXPhotoLibraryChangeDistributor_distributeChangeOnMainQueue___block_invoke_246;
    block[3] = &unk_1E5DD3128;
    uint64_t v12 = v7;
    dispatch_group_notify(changePausingGroup, MEMORY[0x1E4F14428], block);
  }
  else
  {
    v7[2](v7);
  }
}

void __63__PXPhotoLibraryChangeDistributor_distributeChangeOnMainQueue___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"observers"];
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"changeInstance"];
  uint64_t v12 = a1;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"preparedInfoByObserver"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v2;
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
        id v11 = [v4 objectForKey:v10];
        if (objc_opt_respondsToSelector()) {
          [v10 photoLibraryDidChangeOnMainQueue:v3 withPreparedInfo:v11];
        }
        if (objc_opt_respondsToSelector()) {
          [v10 photoLibraryDidChangeOnMainQueue:v3];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(v12 + 40) + 40));
}

uint64_t __63__PXPhotoLibraryChangeDistributor_distributeChangeOnMainQueue___block_invoke_246(uint64_t a1)
{
  uint64_t v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_INFO, "Change Distribution: Change delivery resumed.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[PXPhotosDataSourceSettings sharedInstance];
  [v4 delayChanges];
  double v6 = v5;

  if (v6 > 0.0) {
    [MEMORY[0x1E4F29060] sleepForTimeInterval:v6];
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__179605;
  v50 = __Block_byref_object_dispose__179606;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__179605;
  v44 = __Block_byref_object_dispose__179606;
  id v45 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXPhotoLibraryChangeDistributor_photoLibraryDidChange___block_invoke;
  block[3] = &unk_1E5DCCE38;
  void block[4] = self;
  void block[5] = &v46;
  void block[6] = &v40;
  dispatch_sync(queue, block);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = (id)v47[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v58 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * v11++) photoLibraryWillChange:v3];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v58 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = (id)v41[5];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
        uint64_t v18 = (void *)MEMORY[0x1AD10CB00]();
        if (objc_opt_respondsToSelector())
        {
          double v19 = [v17 prepareForPhotoLibraryChange:v3];
          if (v19) {
            [v12 setObject:v19 forKey:v17];
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v57 count:16];
    }
    while (v14);
  }

  __int16 v20 = PLUIGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    __int16 v22 = [v21 currentMode];
    *(_DWORD *)buf = 138543362;
    v56 = v22;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_INFO, "Change Distribution: photoLibraryDidChange calling distributeChangeOnMainQueue (runLoopMode: %{public}@)", buf, 0xCu);
  }
  uint64_t v23 = v41[5];
  v53[0] = @"observers";
  v53[1] = @"changeInstance";
  v54[0] = v23;
  v54[1] = v3;
  v53[2] = @"preparedInfoByObserver";
  v54[2] = v12;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
  uint64_t v52 = *MEMORY[0x1E4F1C3A0];
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  [(PXPhotoLibraryChangeDistributor *)self performSelectorOnMainThread:sel_distributeChangeOnMainQueue_ withObject:v24 waitUntilDone:1 modes:v25];

  uint64_t v26 = PLUIGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    v28 = [v27 currentMode];
    *(_DWORD *)buf = 138543362;
    v56 = v28;
    _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_INFO, "Change Distribution: photoLibraryDidChange returned from distributeChangeOnMainQueue (runLoopMode: %{public}@)", buf, 0xCu);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_changeDeliverySemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v29 = PLUIGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_INFO, "Change Distribution: photoLibraryDidChange delivered changes", buf, 2u);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
}

void __57__PXPhotoLibraryChangeDistributor_photoLibraryDidChange___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) allObjects];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 24) allObjects];
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)unregisterInternalChangeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PXPhotoLibraryChangeDistributor_unregisterInternalChangeObserver___block_invoke;
    v7[3] = &unk_1E5DD32A8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

uint64_t __68__PXPhotoLibraryChangeDistributor_unregisterInternalChangeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  [WeakRetained unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PXPhotoLibraryChangeDistributor;
  [(PXPhotoLibraryChangeDistributor *)&v4 dealloc];
}

@end