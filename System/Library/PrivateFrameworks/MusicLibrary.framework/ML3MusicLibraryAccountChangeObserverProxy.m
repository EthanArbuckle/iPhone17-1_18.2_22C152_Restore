@interface ML3MusicLibraryAccountChangeObserverProxy
+ (ML3MusicLibraryAccountChangeObserverProxy)sharedProxy;
- (NSHashTable)readonlyObservers;
- (NSHashTable)weakObservers;
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)serialQueue;
- (id)_init;
- (void)addAccountChangeObserver:(id)a3;
- (void)emergencyDisconnectWithCompletion:(id)a3;
- (void)performDatabasePathChange:(id)a3 completion:(id)a4;
- (void)removeAccountChangeObserver:(id)a3;
- (void)terminateForFailureToPerformDatabasePathChange;
@end

@implementation ML3MusicLibraryAccountChangeObserverProxy

void __70__ML3MusicLibraryAccountChangeObserverProxy_addAccountChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) weakObservers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)addAccountChangeObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ - addAccountChangeObserver: %{public}@", buf, 0x16u);
  }

  v6 = [(ML3MusicLibraryAccountChangeObserverProxy *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ML3MusicLibraryAccountChangeObserverProxy_addAccountChangeObserver___block_invoke;
  v8[3] = &unk_1E5FB83D0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (NSHashTable)weakObservers
{
  v3 = [(ML3MusicLibraryAccountChangeObserverProxy *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  weakObservers = self->_weakObservers;
  if (!weakObservers)
  {
    v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v6 = self->_weakObservers;
    self->_weakObservers = v5;

    weakObservers = self->_weakObservers;
  }

  return weakObservers;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

+ (ML3MusicLibraryAccountChangeObserverProxy)sharedProxy
{
  if (sharedProxy_onceToken != -1) {
    dispatch_once(&sharedProxy_onceToken, &__block_literal_global_24344);
  }
  id v2 = (void *)sharedProxy___sharedProxy;

  return (ML3MusicLibraryAccountChangeObserverProxy *)v2;
}

uint64_t __56__ML3MusicLibraryAccountChangeObserverProxy_sharedProxy__block_invoke()
{
  sharedProxy___sharedProxy = [[ML3MusicLibraryAccountChangeObserverProxy alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)ML3MusicLibraryAccountChangeObserverProxy;
  id v2 = [(ML3MusicLibraryAccountChangeObserverProxy *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.medialibrary.change-proxy-serial-queue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.medialibrary.change-proxy-callout-queue", MEMORY[0x1E4F14430]);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_weakObservers, 0);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (NSHashTable)readonlyObservers
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__24320;
  v11 = __Block_byref_object_dispose__24321;
  id v12 = 0;
  dispatch_queue_t v3 = [(ML3MusicLibraryAccountChangeObserverProxy *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__ML3MusicLibraryAccountChangeObserverProxy_readonlyObservers__block_invoke;
  v6[3] = &unk_1E5FB8360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSHashTable *)v4;
}

void __62__ML3MusicLibraryAccountChangeObserverProxy_readonlyObservers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) weakObservers];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeAccountChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ML3MusicLibraryAccountChangeObserverProxy *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ML3MusicLibraryAccountChangeObserverProxy_removeAccountChangeObserver___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __73__ML3MusicLibraryAccountChangeObserverProxy_removeAccountChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) weakObservers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)terminateForFailureToPerformDatabasePathChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(ML3MusicLibraryAccountChangeObserverProxy *)self readonlyObservers];
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - terminateForFailureToPrepareForAccountChange - Observers: %{public}@", buf, 0x16u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(ML3MusicLibraryAccountChangeObserverProxy *)self readonlyObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) terminateForFailureToPerformDatabasePathChange];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [(ML3MusicLibraryAccountChangeObserverProxy *)self readonlyObservers];
    *(_DWORD *)buf = 138543618;
    v30 = self;
    __int16 v31 = 2114;
    v32 = v5;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - emergencyDisconnectWithCompletion - Observers: %{public}@", buf, 0x16u);
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F77A50]) initWithName:@"Emergency Disconnect"];
  [v16 beginTransaction];
  uint64_t v6 = dispatch_group_create();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [(ML3MusicLibraryAccountChangeObserverProxy *)self readonlyObservers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        dispatch_group_enter(v6);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke;
        v22[3] = &unk_1E5FB8098;
        v22[4] = self;
        v23 = v6;
        [v12 emergencyDisconnectWithCompletion:v22];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  long long v13 = [(ML3MusicLibraryAccountChangeObserverProxy *)self calloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke_3;
  block[3] = &unk_1E5FB7BD8;
  id v19 = v16;
  v20 = self;
  id v21 = v17;
  id v14 = v17;
  id v15 = v16;
  dispatch_group_notify(v6, v13, block);
}

void __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) calloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke_2;
  block[3] = &unk_1E5FB8298;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) endTransaction];
  id v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ - emergencyDisconnectWithCompletion - Calling completion block", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke_2(uint64_t a1)
{
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v19 = a4;
  uint64_t v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(ML3MusicLibraryAccountChangeObserverProxy *)self readonlyObservers];
    *(_DWORD *)buf = 138543875;
    v32 = self;
    __int16 v33 = 2113;
    id v34 = v20;
    __int16 v35 = 2114;
    v36 = v7;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ - performDatabasePathChange: - newPath=%{private}@ Observers=%{public}@", buf, 0x20u);
  }
  uint64_t v8 = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = self;
  uint64_t v10 = [(ML3MusicLibraryAccountChangeObserverProxy *)self readonlyObservers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        dispatch_group_enter(v8);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke;
        v24[3] = &unk_1E5FB8098;
        v24[4] = v9;
        long long v25 = v8;
        [v15 performDatabasePathChange:v20 completion:v24];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  v16 = [(ML3MusicLibraryAccountChangeObserverProxy *)v9 calloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke_3;
  block[3] = &unk_1E5FB7BD8;
  void block[4] = v9;
  id v22 = v20;
  id v23 = v19;
  id v17 = v19;
  id v18 = v20;
  dispatch_group_notify(v8, v16, block);
}

void __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) calloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke_2;
  block[3] = &unk_1E5FB8298;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke_3(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ - performDatabasePathChange: - Calling completion block - newPath=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke_2(uint64_t a1)
{
}

@end