@interface PUIPosterSnapshotter
+ (id)completionQueue;
- (BOOL)_assertionLock_mainQueue_updateAssertionsForExtension;
- (BOOL)isValid;
- (PFPosterExtensionInstance)extensionInstance;
- (PUIPosterSnapshotter)initWithExtensionInstance:(id)a3;
- (id)extensionInfoString;
- (id)logIdentifier;
- (void)_assertionLock_invalidateSessionAssertions;
- (void)_assertionLock_mainQueue_updateAssertionsForExtension;
- (void)_lock_retryStartupLater;
- (void)_mainQueue_executeNextSnapshotIfPossible;
- (void)_mainQueue_extensionProcessDidInterrupt;
- (void)_mainQueue_lock_startExtension;
- (void)_teardownAllSnapshots;
- (void)dealloc;
- (void)enqueueSnapshotRequest:(id)a3 completion:(id)a4;
- (void)extensionInstanceDidInvalidate:(id)a3;
- (void)extensionInstanceProcessDidInterrupt:(id)a3;
- (void)fireSceneDeactivationErrorForTesting:(id)a3;
- (void)installRequestAsActive:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)sceneSnapshotterDidFinish:(id)a3 result:(id)a4 error:(id)a5;
@end

@implementation PUIPosterSnapshotter

+ (id)completionQueue
{
  if (completionQueue_onceToken != -1) {
    dispatch_once(&completionQueue_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)completionQueue_completionQueue;
  return v2;
}

void __39__PUIPosterSnapshotter_completionQueue__block_invoke()
{
  v0 = [MEMORY[0x263F29C50] serial];
  id v4 = [v0 serviceClass:33 relativePriority:10];

  v1 = [v4 attributes];
  uint64_t v2 = BSDispatchQueueCreateWithAttributes();
  v3 = (void *)completionQueue_completionQueue;
  completionQueue_completionQueue = v2;
}

- (void)dealloc
{
  [(PUIPosterSnapshotter *)self _teardownAllSnapshots];
  [(PFPosterExtensionInstance *)self->_extensionInstance removeInstanceObserver:self];
  [(PUIPosterSnapshotter *)self _assertionLock_invalidateSessionAssertions];
  v3.receiver = self;
  v3.super_class = (Class)PUIPosterSnapshotter;
  [(PUIPosterSnapshotter *)&v3 dealloc];
}

- (PUIPosterSnapshotter)initWithExtensionInstance:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)PUIPosterSnapshotter;
    v7 = [(PUIPosterSnapshotter *)&v14 init];
    if (v7)
    {
      uint64_t v8 = objc_opt_new();
      lock_enqueuedSnapshots = v7->_lock_enqueuedSnapshots;
      v7->_lock_enqueuedSnapshots = (NSMutableArray *)v8;

      uint64_t v10 = objc_opt_new();
      invalidationSignal = v7->_invalidationSignal;
      v7->_invalidationSignal = (BSAtomicSignal *)v10;

      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v7->_extensionInstance, a3);
      [v6 addInstanceObserver:v7];
    }

    return v7;
  }
  else
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extensionInstance"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotter initWithExtensionInstance:]();
    }
    [v13 UTF8String];
    result = (PUIPosterSnapshotter *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)extensionInfoString
{
  objc_super v3 = [(PFPosterExtensionInstance *)self->_extensionInstance extension];
  id v4 = NSString;
  id v5 = [v3 localizedName];
  v6 = [(PFPosterExtensionInstance *)self->_extensionInstance instanceIdentifier];
  v7 = [v4 stringWithFormat:@"%@ id: %@", v5, v6];

  return v7;
}

- (id)logIdentifier
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(PUIPosterSnapshotter *)self extensionInfoString];
  [v3 appendString:v4 withName:@"extension"];

  id v5 = [v3 build];

  return v5;
}

- (void)enqueueSnapshotRequest:(id)a3 completion:(id)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[_PUIPosterEnqueuedSnapshot alloc] initWithRequest:v7 completion:v6];

  if ([(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled])
  {
    if (v6)
    {
      v9 = [(id)objc_opt_class() completionQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__PUIPosterSnapshotter_enqueueSnapshotRequest_completion___block_invoke;
      block[3] = &unk_265471250;
      id v25 = v6;
      dispatch_async(v9, block);
    }
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v11 = PUILogSnapshotter();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(_PUIPosterEnqueuedSnapshot *)v8 logIdentifier];
      *(_DWORD *)buf = 138543618;
      v27 = self;
      __int16 v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_25A0AF000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) adding snapshot to queue: %{public}@", buf, 0x16u);
    }
    [(NSMutableArray *)self->_lock_enqueuedSnapshots addObject:v8];
    lock_enqueuedSnapshots = self->_lock_enqueuedSnapshots;
    objc_super v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"priority" ascending:0];
    v36[0] = v14;
    v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:0];
    v36[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    [(NSMutableArray *)lock_enqueuedSnapshots sortUsingDescriptors:v16];

    if (self->_lock_state)
    {
      v17 = PUILogSnapshotter();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [(PUIPosterSnapshotter *)self logIdentifier];
        v19 = [(_PUIPosterEnqueuedSnapshot *)v8 logIdentifier];
        unint64_t v20 = self->_lock_state - 1;
        if (v20 > 2) {
          v21 = @"Idle";
        }
        else {
          v21 = *(&off_265471338 + v20);
        }
        uint64_t v22 = [(NSMutableArray *)self->_lock_enqueuedSnapshots count];
        v23 = [(PUIPosterSceneSnapshotter *)self->_lock_sceneSnapshotter logIdentifier];
        *(_DWORD *)buf = 138544386;
        v27 = v18;
        __int16 v28 = 2114;
        v29 = v19;
        __int16 v30 = 2114;
        v31 = v21;
        __int16 v32 = 2050;
        uint64_t v33 = v22;
        __int16 v34 = 2114;
        v35 = v23;
        _os_log_impl(&dword_25A0AF000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: (%{public}@) Snapshot enqueued and waiting (state: %{public}@, queue length %{public}lu, current snapshot: %{public}@)", buf, 0x34u);
      }
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      self->_lock_state = 1;
      os_unfair_lock_unlock(&self->_lock);
      BSDispatchMain();
    }
  }
}

void __58__PUIPosterSnapshotter_enqueueSnapshotRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __58__PUIPosterSnapshotter_enqueueSnapshotRequest_completion___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_executeNextSnapshotIfPossible");
}

- (void)_mainQueue_executeNextSnapshotIfPossible
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  int v4 = *(unsigned __int8 *)(a2 + 65);
  int v5 = 136315650;
  id v6 = "-[PUIPosterSnapshotter _mainQueue_executeNextSnapshotIfPossible]";
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl(&dword_25A0AF000, log, OS_LOG_TYPE_ERROR, "Snapshotter state error: shouldn't call %s while waiting: for retry? %d; for extension? %d",
    (uint8_t *)&v5,
    0x18u);
}

- (void)_lock_retryStartupLater
{
  if (!self->_lock_waitingForRetry)
  {
    self->_lock_waitingForRetry = 1;
    objc_initWeak(&location, self);
    dispatch_time_t v2 = dispatch_time(0, 2000000000);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __47__PUIPosterSnapshotter__lock_retryStartupLater__block_invoke;
    v3[3] = &unk_265471278;
    objc_copyWeak(&v4, &location);
    dispatch_after(v2, MEMORY[0x263EF83A0], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __47__PUIPosterSnapshotter__lock_retryStartupLater__block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v2 = WeakRetained + 8;
    int v3 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 8);
    LOBYTE(v3[16]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v2);
    [(os_unfair_lock_s *)v3 _mainQueue_executeNextSnapshotIfPossible];
    WeakRetained = v3;
  }
}

- (void)_teardownAllSnapshots
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v3 = [(PUIPosterSnapshotter *)self logIdentifier];
  id v4 = PUILogSnapshotter();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(NSMutableArray *)self->_lock_enqueuedSnapshots count];
    *(_DWORD *)buf = 138543618;
    v31 = v3;
    __int16 v32 = 2048;
    uint64_t v33 = v5;
    _os_log_impl(&dword_25A0AF000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Tearing down %lu enqueued snapshots", buf, 0x16u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = self->_lock_enqueuedSnapshots;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * v10);
        v12 = [(id)objc_opt_class() completionQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __45__PUIPosterSnapshotter__teardownAllSnapshots__block_invoke;
        block[3] = &unk_265471108;
        id v23 = v3;
        uint64_t v24 = v11;
        dispatch_async(v12, block);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)self->_lock_enqueuedSnapshots removeAllObjects];
  if (self->_lock_sceneSnapshotter)
  {
    v13 = PUILogSnapshotter();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v3;
      _os_log_impl(&dword_25A0AF000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Tearing down active scene snapshotter", buf, 0xCu);
    }

    [(PUIPosterSceneSnapshotter *)self->_lock_sceneSnapshotter setDelegate:0];
    objc_super v14 = [(PUIPosterSceneSnapshotter *)self->_lock_sceneSnapshotter snapshotInfo];
    v15 = [(id)objc_opt_class() completionQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __45__PUIPosterSnapshotter__teardownAllSnapshots__block_invoke_33;
    v19[3] = &unk_265471108;
    id v20 = v3;
    id v21 = v14;
    id v16 = v14;
    dispatch_async(v15, v19);

    [(PUIPosterSceneSnapshotter *)self->_lock_sceneSnapshotter invalidate];
    lock_sceneSnapshotter = self->_lock_sceneSnapshotter;
    self->_lock_sceneSnapshotter = 0;
  }
  os_unfair_lock_unlock(lock);
}

void __45__PUIPosterSnapshotter__teardownAllSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = PUILogSnapshotter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) logIdentifier];
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_25A0AF000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) Invalidated on queue: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 40) completion];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
    ((void (**)(void, void, void *))v5)[2](v5, 0, v6);
  }
  [*(id *)(a1 + 40) invalidate];
}

void __45__PUIPosterSnapshotter__teardownAllSnapshots__block_invoke_33(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = PUILogSnapshotter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) logIdentifier];
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_25A0AF000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) Invalidated active scene snapshotter for: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 40) completion];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
    ((void (**)(void, void, void *))v5)[2](v5, 0, v6);
  }
  [*(id *)(a1 + 40) invalidate];
}

- (void)sceneSnapshotterDidFinish:(id)a3 result:(id)a4 error:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v8 = (PUIPosterSceneSnapshotter *)a3;
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = [(PUIPosterSceneSnapshotter *)v8 snapshotInfo];
  [(PUIPosterSceneSnapshotter *)v8 setDelegate:0];
  if (v9
    || ([(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled] & 1) != 0
    || (int)[v11 retryCount] < 1)
  {
    objc_super v14 = PUILogSnapshotter();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v11 logIdentifier];
      *(_DWORD *)buf = 138543618;
      long long v26 = self;
      __int16 v27 = 2114;
      long long v28 = v15;
      _os_log_impl(&dword_25A0AF000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) scene snapshotter finished for: %{public}@", buf, 0x16u);
    }
    id v16 = [v11 completion];
    if (v16)
    {
      v17 = [(id)objc_opt_class() completionQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__PUIPosterSnapshotter_sceneSnapshotterDidFinish_result_error___block_invoke;
      block[3] = &unk_2654712A0;
      id v24 = v16;
      id v22 = v9;
      id v23 = v10;
      dispatch_async(v17, block);
    }
  }
  else
  {
    v12 = PUILogSnapshotter();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v11 logIdentifier];
      *(_DWORD *)buf = 138543618;
      long long v26 = self;
      __int16 v27 = 2114;
      long long v28 = v13;
      _os_log_impl(&dword_25A0AF000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) Retrying scene snapshotter for: %{public}@", buf, 0x16u);
    }
    objc_msgSend(v11, "setRetryCount:", objc_msgSend(v11, "retryCount") - 1);
    [(NSMutableArray *)self->_lock_enqueuedSnapshots insertObject:v11 atIndex:0];
  }
  if (self->_lock_sceneSnapshotter == v8)
  {
    v18 = PUILogSnapshotter();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v26 = self;
      _os_log_impl(&dword_25A0AF000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) next in line!", buf, 0xCu);
    }

    lock_sceneSnapshotter = self->_lock_sceneSnapshotter;
    self->_lock_sceneSnapshotter = 0;

    self->_lock_state = 3;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __63__PUIPosterSnapshotter_sceneSnapshotterDidFinish_result_error___block_invoke_34;
    v20[3] = &unk_265470EC8;
    v20[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v20);
  }
  [(PUIPosterSceneSnapshotter *)v8 invalidate];
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __63__PUIPosterSnapshotter_sceneSnapshotterDidFinish_result_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __63__PUIPosterSnapshotter_sceneSnapshotterDidFinish_result_error___block_invoke_34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_executeNextSnapshotIfPossible");
}

- (void)_mainQueue_lock_startExtension
{
  if (!self->_lock_waitingForStartExtension)
  {
    self->_lock_waitingForStartExtension = 1;
    lock_mainQueue_process = self->_lock_mainQueue_process;
    self->_lock_mainQueue_process = 0;

    id v4 = [MEMORY[0x263F5F450] sharedWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke;
    block[3] = &unk_265470EC8;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = PUILogSnapshotter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_25A0AF000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) Booting extension (if necessary)", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 88);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_36;
  v7[3] = &unk_2654712F0;
  v7[4] = v4;
  return [v5 bootupExtensionInstance:v7];
}

void __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = PUILogSnapshotter();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_25A0AF000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Booted extension", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_37;
  block[3] = &unk_2654712C8;
  void block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_37(id *a1)
{
  dispatch_time_t v2 = (os_unfair_lock_s **)(a1 + 4);
  if (([*((id *)a1[4] + 9) hasBeenSignalled] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[4] + 8);
    *((unsigned char *)a1[4] + 65) = 0;
    id v3 = a1[5];
    if (v3)
    {
      if (([v3 isValid] & 1) == 0)
      {
        uint64_t v4 = PUILogSnapshotter();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_37_cold_2((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
        }
      }
      objc_storeStrong((id *)a1[4] + 6, a1[5]);
      os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 8);
      objc_msgSend(a1[4], "_mainQueue_executeNextSnapshotIfPossible");
    }
    else
    {
      uint64_t v11 = PUILogSnapshotter();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_37_cold_1(v2, (uint64_t)a1, v11);
      }

      id v12 = [a1[6] domain];
      if ([v12 isEqualToString:*MEMORY[0x263F5F468]])
      {
        uint64_t v13 = [a1[6] code];

        if (v13 == 2)
        {
          os_unfair_lock_unlock(*v2 + 8);
          [(os_unfair_lock_s *)*v2 invalidate];
          return;
        }
      }
      else
      {
      }
      [(os_unfair_lock_s *)*v2 _lock_retryStartupLater];
      os_unfair_lock_unlock(*v2 + 8);
    }
  }
}

- (void)extensionInstanceProcessDidInterrupt:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__PUIPosterSnapshotter_extensionInstanceProcessDidInterrupt___block_invoke;
  v3[3] = &unk_265471278;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __61__PUIPosterSnapshotter_extensionInstanceProcessDidInterrupt___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_extensionProcessDidInterrupt");
}

- (void)_mainQueue_extensionProcessDidInterrupt
{
  dispatch_time_t v2 = [a1 logIdentifier];
  uint64_t v9 = [a1[5] logIdentifier];
  OUTLINED_FUNCTION_9(&dword_25A0AF000, v3, v4, "(%{public}@) Extension process interrupted while snapshotting: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)extensionInstanceDidInvalidate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PUILogSnapshotter();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_25A0AF000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) PFPosterExtensionInstance did invalidate: %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PUIPosterSnapshotter_extensionInstanceDidInvalidate___block_invoke;
  block[3] = &unk_265471278;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __55__PUIPosterSnapshotter_extensionInstanceDidInvalidate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (BOOL)_assertionLock_mainQueue_updateAssertionsForExtension
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (([(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled] & 1) == 0)
  {
    id v4 = self->_lock_mainQueue_process;
    uint64_t v5 = (void *)MEMORY[0x263F64630];
    uint64_t v6 = [(PFPosterExtensionInstance *)self->_extensionInstance hostConfiguration];
    id v7 = [v6 rbsProcessIdentity];
    uint64_t v8 = [v5 targetWithProcessIdentity:v7];

    uint64_t v9 = (void *)MEMORY[0x263F29BE0];
    if (v4) {
      [(_EXExtensionProcess *)v4 auditToken];
    }
    else {
      memset(v39, 0, sizeof(v39));
    }
    __int16 v10 = [v9 tokenFromAuditToken:v39];
    id v11 = [(PFPosterExtensionInstance *)self->_extensionInstance extension];
    uint64_t v12 = [v11 posterExtensionBundleIdentifier];

    uint64_t v13 = [(PUIPosterSnapshotter *)self logIdentifier];
    if (!v8)
    {
      v17 = PUILogSnapshotter();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(PUIPosterSnapshotter *)(uint64_t)v13 _assertionLock_mainQueue_updateAssertionsForExtension];
      }
      goto LABEL_27;
    }
    if (![(RBSAssertion *)self->_assertionLock_memoryAssertion isValid]
      || ([(RBSAssertion *)self->_assertionLock_memoryAssertion target],
          objc_super v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 isEqual:v8],
          v14,
          (v15 & 1) == 0))
    {
      [(RBSAssertion *)self->_assertionLock_memoryAssertion invalidate];
      assertionLock_memoryAssertion = self->_assertionLock_memoryAssertion;
      self->_assertionLock_memoryAssertion = 0;

      v17 = objc_msgSend(MEMORY[0x263F64408], "pf_posterUpdateRuntimeAssertionForTarget:explanation:", v8, v13);
      id v38 = 0;
      char v18 = [v17 acquireWithError:&v38];
      id v19 = v38;
      id v20 = PUILogSnapshotter();
      id v21 = v20;
      if ((v18 & 1) == 0)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[PUIPosterSnapshotter _assertionLock_mainQueue_updateAssertionsForExtension]();
        }
LABEL_26:

LABEL_27:
        BOOL v3 = 0;
LABEL_28:

        goto LABEL_29;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v13;
        _os_log_impl(&dword_25A0AF000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot acquired memory assertion", buf, 0xCu);
      }

      id v22 = self->_assertionLock_memoryAssertion;
      self->_assertionLock_memoryAssertion = (RBSAssertion *)v17;
      id v23 = v17;
    }
    if ([(RBSAssertion *)self->_assertionLock_runtimeAssertion isValid])
    {
      id v24 = [(RBSAssertion *)self->_assertionLock_runtimeAssertion target];
      char v25 = [v24 isEqual:v8];

      if (v25)
      {
        BOOL v3 = 1;
LABEL_29:

        return v3;
      }
    }
    [(RBSAssertion *)self->_assertionLock_runtimeAssertion invalidate];
    assertionLock_runtimeAssertion = self->_assertionLock_runtimeAssertion;
    self->_assertionLock_runtimeAssertion = 0;

    v17 = objc_msgSend(MEMORY[0x263F64408], "pui_posterRuntimeAssertionForTarget:explanation:sceneType:auditToken:posterProviderBundleIdentifier:", v8, v13, @"PosterKit.rendering", v10, v12);
    id v37 = 0;
    char v33 = [v17 acquireWithError:&v37];
    id v19 = v37;
    uint64_t v34 = PUILogSnapshotter();
    id v21 = v34;
    if (v33)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v13;
        _os_log_impl(&dword_25A0AF000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot acquired runtime assertion", buf, 0xCu);
      }

      v35 = self->_assertionLock_runtimeAssertion;
      self->_assertionLock_runtimeAssertion = (RBSAssertion *)v17;
      v17 = v17;

      BOOL v3 = 1;
      goto LABEL_28;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotter _assertionLock_mainQueue_updateAssertionsForExtension]();
    }
    goto LABEL_26;
  }
  return 0;
}

- (void)_assertionLock_invalidateSessionAssertions
{
  [(RBSAssertion *)self->_assertionLock_memoryAssertion invalidate];
  assertionLock_memoryAssertion = self->_assertionLock_memoryAssertion;
  self->_assertionLock_memoryAssertion = 0;

  [(RBSAssertion *)self->_assertionLock_runtimeAssertion invalidate];
  assertionLock_runtimeAssertion = self->_assertionLock_runtimeAssertion;
  self->_assertionLock_runtimeAssertion = 0;
}

- (BOOL)isValid
{
  return [(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled] ^ 1;
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(BSAtomicSignal *)self->_invalidationSignal signal])
  {
    BOOL v3 = PUILogSnapshotter();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      uint64_t v6 = self;
      _os_log_impl(&dword_25A0AF000, v3, OS_LOG_TYPE_DEFAULT, "PUIPosterSnapshotter invalidate: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [(PUIPosterSnapshotter *)self _teardownAllSnapshots];
    [(PFPosterExtensionInstance *)self->_extensionInstance removeInstanceObserver:self];
    extensionInstance = self->_extensionInstance;
    self->_extensionInstance = 0;

    os_unfair_lock_lock(&self->_assertionLock);
    [(PUIPosterSnapshotter *)self _assertionLock_invalidateSessionAssertions];
    os_unfair_lock_unlock(&self->_assertionLock);
  }
}

- (void)installRequestAsActive:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((MEMORY[0x25A2F5BF0]("-[PUIPosterSnapshotter installRequestAsActive:completion:]") & 1) == 0)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_BSIsInternalInstall(__PRETTY_FUNCTION__)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotter installRequestAsActive:completion:].cold.4();
    }
LABEL_17:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D4A90);
  }
  if (!v7)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"request"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotter installRequestAsActive:completion:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D4AF4);
  }
  if (!v8)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotter installRequestAsActive:completion:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D4B58);
  }
  if (!self->_extensionInstance)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_extensionInstance"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotter installRequestAsActive:completion:]();
    }
    goto LABEL_17;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__PUIPosterSnapshotter_installRequestAsActive_completion___block_invoke;
  block[3] = &unk_265471318;
  void block[4] = self;
  id v15 = v7;
  id v16 = v8;
  SEL v17 = a2;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__PUIPosterSnapshotter_installRequestAsActive_completion___block_invoke(void *a1)
{
  if (*(void *)(a1[4] + 40))
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"self->_lock_sceneSnapshotter == nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __58__PUIPosterSnapshotter_installRequestAsActive_completion___block_invoke_cold_1();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    id v7 = [[_PUIPosterEnqueuedSnapshot alloc] initWithRequest:a1[5] completion:a1[6]];
    [(_PUIPosterEnqueuedSnapshot *)v7 setRetryCount:0];
    dispatch_time_t v2 = [[PUIPosterSceneSnapshotter alloc] initWithExtensionInstance:*(void *)(a1[4] + 88) snapshotInfo:v7];
    [(PUIPosterSceneSnapshotter *)v2 setDelegate:a1[4]];
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 32));
    uint64_t v3 = a1[4];
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
    int v5 = v2;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
  }
}

- (void)fireSceneDeactivationErrorForTesting:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x25A2F5BF0]("-[PUIPosterSnapshotter fireSceneDeactivationErrorForTesting:]"))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__PUIPosterSnapshotter_fireSceneDeactivationErrorForTesting___block_invoke;
    block[3] = &unk_265471108;
    void block[4] = self;
    id v8 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_BSIsInternalInstall(__PRETTY_FUNCTION__)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotter fireSceneDeactivationErrorForTesting:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __61__PUIPosterSnapshotter_fireSceneDeactivationErrorForTesting___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  [*(id *)(*(void *)(a1 + 32) + 40) fireSceneDeactivationErrorForTesting:*(void *)(a1 + 40)];
  dispatch_time_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 32);
  os_unfair_lock_unlock(v2);
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);
  objc_storeStrong((id *)&self->_lock_mainQueue_process, 0);
  objc_storeStrong((id *)&self->_lock_sceneSnapshotter, 0);
  objc_storeStrong((id *)&self->_assertionLock_memoryAssertion, 0);
  objc_storeStrong((id *)&self->_assertionLock_runtimeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_enqueuedSnapshots, 0);
}

- (void)initWithExtensionInstance:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  dispatch_time_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_37_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 48);
  OUTLINED_FUNCTION_5(&dword_25A0AF000, a2, a3, "(%{public}@) Error booting extension process:'%@'", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_37_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_assertionLock_mainQueue_updateAssertionsForExtension
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_25A0AF000, v0, v1, "(%{public}@) Snapshot could not acquire memory assertion: %{public}@");
}

- (void)installRequestAsActive:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  dispatch_time_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)installRequestAsActive:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  dispatch_time_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)installRequestAsActive:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  dispatch_time_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)installRequestAsActive:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  dispatch_time_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __58__PUIPosterSnapshotter_installRequestAsActive_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 56));
  dispatch_time_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)fireSceneDeactivationErrorForTesting:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  dispatch_time_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end