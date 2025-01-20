@interface RBProcessMonitor
+ (id)_clientStateForServerState:(void *)a3 process:;
- (NSString)description;
- (NSString)stateCaptureTitle;
- (OS_dispatch_queue)monitorSerializationQueue;
- (RBProcessMonitor)initWithStateCaptureManager:(id)a3 historialStatistics:(id)a4 xnuWrapper:(id)a5;
- (id)preventLaunchPredicates;
- (id)statesMatchingConfiguration:(id)a3;
- (id)statesMatchingPredicate:(id)a3;
- (void)_queue_adjustMemoryPageThresholdLimitationForProcess:(void *)a3 oldState:(void *)a4 newState:;
- (void)_queue_publishState:(void *)a3 forIdentity:;
- (void)_queue_suppressUpdatesForIdentity:(uint64_t)a1;
- (void)_queue_unsuppressUpdatesForIdentity:(uint64_t)a1;
- (void)_queue_updateServerState:(void *)a3 forProcess:(char)a4 force:;
- (void)addObserver:(id)a3;
- (void)didAddProcess:(id)a3 withState:(id)a4;
- (void)didRemoveProcess:(id)a3 withState:(id)a4;
- (void)didResolvePreventLaunchPredicates:(id)a3;
- (void)didUpdateProcessStates:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeStateForProcessIdentity:(id)a3;
- (void)suppressUpdatesForIdentity:(id)a3;
- (void)trackStateForProcessIdentity:(id)a3;
- (void)unsuppressUpdatesForIdentity:(id)a3;
@end

@implementation RBProcessMonitor

void __43__RBProcessMonitor_didUpdateProcessStates___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "identity", (void)v12);
        v9 = [*(id *)(*(void *)(a1 + 40) + 8) processForIdentity:v8];
        uint64_t v10 = *(void *)(a1 + 40);
        v11 = [v7 updatedState];
        -[RBProcessMonitor _queue_updateServerState:forProcess:force:](v10, v11, v9, 0);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)_queue_updateServerState:(void *)a3 forProcess:(char)a4 force:
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (!v7)
    {
      v31 = [MEMORY[0x263F08690] currentHandler];
      [v31 handleFailureInMethod:sel__queue_updateServerState_forProcess_force_ object:a1 file:@"RBProcessMonitor.m" lineNumber:285 description:@"serverState can not be nil"];
    }
    context = (void *)MEMORY[0x22A660FC0]();
    v9 = [v8 identity];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v7 identity];
    }
    long long v12 = v11;

    long long v13 = [*(id *)(a1 + 16) valueForIdentity:v12];
    long long v14 = +[RBProcessMonitor _clientStateForServerState:process:]((uint64_t)RBProcessMonitor, v7, v8);
    -[RBProcessMonitor _queue_adjustMemoryPageThresholdLimitationForProcess:oldState:newState:](a1, v12, v13, v14);
    char v37 = 0;
    if ((a4 & 1) != 0 || [v14 isDifferentFromState:v13 significantly:&v37])
    {
      if ([v8 isReported])
      {
        long long v15 = rbs_monitor_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = [v12 shortDescription];
          [v14 taskState];
          NSStringFromRBSTaskState();
          uint64_t v17 = v33 = a4;
          [v7 role];
          NSStringFromRBSRole();
          v18 = v32 = v13;
          v19 = [v14 endowmentInfos];
          *(_DWORD *)buf = 138544130;
          v39 = v16;
          __int16 v40 = 2114;
          v41 = v17;
          __int16 v42 = 2114;
          v43 = v18;
          __int16 v44 = 2112;
          v45 = v19;
          _os_log_impl(&dword_226AB3000, v15, OS_LOG_TYPE_DEFAULT, "Calculated state for %{public}@: %{public}@ (role: %{public}@) (endowments: %@) ", buf, 0x2Au);

          long long v13 = v32;
          a4 = v33;
        }
      }
      char v20 = [v14 isEmptyState];
      v21 = *(void **)(a1 + 16);
      if (v20) {
        id v22 = (id)[v21 removeValueForIdentity:v12];
      }
      else {
        id v23 = (id)[v21 setValue:v14 forIdentity:v12];
      }
      id v24 = (id)[*(id *)(a1 + 24) removeValueForIdentity:v12];
      if ((a4 & 1) != 0 || v37 || ([*(id *)(a1 + 40) containsObject:v12] & 1) == 0)
      {
        -[RBProcessMonitor _queue_publishState:forIdentity:](a1, v14, v12);
        -[RBProcessMonitor _queue_suppressUpdatesForIdentity:](a1, v12);
        dispatch_time_t v27 = dispatch_time(0, 100000000);
        v28 = *(NSObject **)(a1 + 104);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __62__RBProcessMonitor__queue_updateServerState_forProcess_force___block_invoke;
        block[3] = &unk_2647C7B98;
        block[4] = a1;
        id v36 = v12;
        dispatch_after(v27, v28, block);
      }
      else
      {
        v25 = rbs_monitor_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[RBProcessMonitor _queue_updateServerState:forProcess:force:]();
        }

        id v26 = (id)[*(id *)(a1 + 24) setValue:v14 forIdentity:v12];
      }
    }
    else
    {
      v29 = rbs_monitor_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = [v12 shortDescription];
        *(_DWORD *)buf = 138543362;
        v39 = v30;
        _os_log_impl(&dword_226AB3000, v29, OS_LOG_TYPE_INFO, "Ignoring insignificant state update for %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)_queue_suppressUpdatesForIdentity:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v4 = (id *)(a1 + 40);
    [v5 addObject:v3];
    if ([*v4 countForObject:v3] == 1)
    {
      v6 = rbs_monitor_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[RBProcessMonitor _queue_suppressUpdatesForIdentity:]((uint64_t)v3, v6);
      }
    }
    id v7 = rbs_monitor_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(RBProcessMonitor *)v4 _queue_suppressUpdatesForIdentity:v7];
    }
  }
}

+ (id)_clientStateForServerState:(void *)a3 process:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if (!v4)
  {
    uint64_t v9 = v6;
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:sel__clientStateForServerState_process_, v9, @"RBProcessMonitor.m", 210, @"Invalid parameter not satisfying: %@", @"serverState != nil" object file lineNumber description];
  }
  id v7 = [v4 clientStateForProcess:v5];

  return v7;
}

void __49__RBProcessMonitor_unsuppressUpdatesForIdentity___block_invoke(uint64_t a1)
{
}

void __47__RBProcessMonitor_suppressUpdatesForIdentity___block_invoke(uint64_t a1)
{
}

- (OS_dispatch_queue)monitorSerializationQueue
{
  return self->_queue;
}

- (id)statesMatchingConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 stateDescriptor];

  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(RBProcessMap *)self->_stateMap allValue];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v5 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v12 = [v11 process];
          if ([v4 matchesProcess:v12])
          {
            if (!v5)
            {
              id v5 = [MEMORY[0x263EFF980] array];
            }
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)statesMatchingPredicate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(RBProcessMap *)self->_stateMap allValue];
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "process", (void)v15);
        if ([v4 matchesProcess:v13]) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)removeObserver:(id)a3
{
  stateCaptureManager = self->_stateCaptureManager;
  id v5 = a3;
  [(RBStateCaptureManaging *)stateCaptureManager removeItem:v5];
  os_unfair_lock_lock(&self->_observersLock);
  [(NSMutableSet *)self->_observers removeObject:v5];

  [(RBHistoricalStatisticsMaintaining *)self->_historicalStatistics notifyMonitorCount:[(NSMutableSet *)self->_observers count]];
  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)addObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSMutableSet *)self->_observers addObject:v5];
  [(RBHistoricalStatisticsMaintaining *)self->_historicalStatistics notifyMonitorCount:[(NSMutableSet *)self->_observers count]];
  os_unfair_lock_unlock(p_observersLock);
  [(RBStateCaptureManaging *)self->_stateCaptureManager addItem:v5];
}

- (void)didUpdateProcessStates:(id)a3
{
  id v4 = a3;
  if ([v4 hasChanges])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__RBProcessMonitor_didUpdateProcessStates___block_invoke;
    v6[3] = &unk_2647C7B98;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_async(queue, v6);
  }
}

void __62__RBProcessMonitor__queue_updateServerState_forProcess_force___block_invoke(uint64_t a1)
{
}

- (void)_queue_unsuppressUpdatesForIdentity:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 40) countForObject:v3];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = rbs_monitor_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        [(RBProcessMonitor *)v5 _queue_unsuppressUpdatesForIdentity:v6];
      }

      [*(id *)(a1 + 40) removeObject:v3];
      if (v5 == 1)
      {
        id v7 = rbs_monitor_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[RBProcessMonitor _queue_unsuppressUpdatesForIdentity:]((uint64_t)v3, v7);
        }

        uint64_t v8 = [*(id *)(a1 + 24) valueForIdentity:v3];
        if (v8) {
          -[RBProcessMonitor _queue_publishState:forIdentity:](a1, v8, v3);
        }
        [*(id *)(a1 + 24) removeIdentity:v3];
      }
    }
  }
}

- (void)_queue_publishState:(void *)a3 forIdentity:
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = rbs_monitor_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[RBProcessMonitor _queue_publishState:forIdentity:]();
    }

    uint64_t v8 = [*(id *)(a1 + 32) valueForIdentity:v6];
    [v5 encodeWithPreviousState:v8];
    v25[0] = v5;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v14++), "processMonitor:didChangeProcessStates:", a1, v9, (void)v20);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    char v15 = [v5 isEmptyState];
    long long v16 = *(void **)(a1 + 32);
    if (v15)
    {
      id v17 = (id)[v16 removeValueForIdentity:v6];
      id v18 = (id)[*(id *)(a1 + 16) removeValueForIdentity:v6];
    }
    else
    {
      id v19 = (id)[v16 setValue:v5 forIdentity:v6];
    }
  }
}

- (id)preventLaunchPredicates
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  preventLaunchPredicates = self->_preventLaunchPredicates;
  if (preventLaunchPredicates)
  {
    uint64_t v4 = preventLaunchPredicates;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFFA08] set];
  }
  return v4;
}

- (void)didRemoveProcess:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__RBProcessMonitor_didRemoveProcess_withState___block_invoke;
  block[3] = &unk_2647C7A08;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

uint64_t __49__RBProcessMonitor_trackStateForProcessIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addIdentity:*(void *)(a1 + 40)];
}

void __44__RBProcessMonitor_didAddProcess_withState___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 8) addProcess:a1[5]];
  id v3 = (void *)a1[5];
  id v2 = (void *)a1[6];
  uint64_t v4 = a1[4];
  -[RBProcessMonitor _queue_updateServerState:forProcess:force:](v4, v2, v3, 1);
}

- (void)unsuppressUpdatesForIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__RBProcessMonitor_unsuppressUpdatesForIdentity___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)suppressUpdatesForIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__RBProcessMonitor_suppressUpdatesForIdentity___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)trackStateForProcessIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__RBProcessMonitor_trackStateForProcessIdentity___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)didAddProcess:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__RBProcessMonitor_didAddProcess_withState___block_invoke;
  block[3] = &unk_2647C7A08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __50__RBProcessMonitor_removeStateForProcessIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeIdentity:*(void *)(a1 + 40)];
}

- (void)removeStateForProcessIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__RBProcessMonitor_removeStateForProcessIdentity___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __47__RBProcessMonitor_didRemoveProcess_withState___block_invoke(uint64_t a1)
{
  -[RBProcessMonitor _queue_updateServerState:forProcess:force:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 1);
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 removeProcess:v3];
}

- (RBProcessMonitor)initWithStateCaptureManager:(id)a3 historialStatistics:(id)a4 xnuWrapper:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)RBProcessMonitor;
  id v12 = [(RBProcessMonitor *)&v31 init];
  if (v12)
  {
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("RBProcessMonitor", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    long long v16 = objc_alloc_init(RBProcessIndex);
    processIndex = v12->_processIndex;
    v12->_processIndex = v16;

    id v18 = objc_alloc_init(RBProcessMap);
    stateMap = v12->_stateMap;
    v12->_stateMap = v18;

    long long v20 = objc_alloc_init(RBProcessMap);
    suppressedState = v12->_suppressedState;
    v12->_suppressedState = v20;

    long long v22 = objc_alloc_init(RBProcessMap);
    publishedState = v12->_publishedState;
    v12->_publishedState = v22;

    id v24 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    suppressedIdentities = v12->_suppressedIdentities;
    v12->_suppressedIdentities = v24;

    v12->_observersLock._os_unfair_lock_opaque = 0;
    id v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    observers = v12->_observers;
    v12->_observers = v26;

    objc_storeStrong((id *)&v12->_stateCaptureManager, a3);
    objc_storeStrong((id *)&v12->_historicalStatistics, a4);
    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    runningVisibleApps = v12->_runningVisibleApps;
    v12->_runningVisibleApps = v28;

    objc_storeStrong((id *)&v12->_xnuWrapper, a5);
  }

  return v12;
}

- (void)didResolvePreventLaunchPredicates:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__RBProcessMonitor_didResolvePreventLaunchPredicates___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __54__RBProcessMonitor_didResolvePreventLaunchPredicates___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "didResolvePreventLaunchPredicates:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
}

- (NSString)stateCaptureTitle
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_queue_adjustMemoryPageThresholdLimitationForProcess:(void *)a3 oldState:(void *)a4 newState:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1 && [*(id *)(a1 + 96) ballastOffsetMB] && objc_msgSend(v7, "isApplication"))
  {
    if ([v8 taskState] == 4)
    {
      long long v10 = [v8 endowmentNamespaces];
      int v11 = [v10 containsObject:*MEMORY[0x263F646F0]];
    }
    else
    {
      int v11 = 0;
    }
    if ([v9 taskState] == 4)
    {
      uint64_t v12 = [v9 endowmentNamespaces];
      int v13 = [v12 containsObject:*MEMORY[0x263F646F0]];

      if (((v11 | v13 ^ 1) & 1) == 0)
      {
        [*(id *)(a1 + 88) addObject:v7];
        if ([*(id *)(a1 + 88) count] == 1)
        {
          if ([*(id *)(a1 + 96) setBallastDrained:0] < 0)
          {
            dispatch_queue_t v14 = rbs_general_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[RBProcessMonitor _queue_adjustMemoryPageThresholdLimitationForProcess:oldState:newState:]((uint64_t)v7, v14);
            }
          }
          char v15 = rbs_process_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138412290;
            id v19 = v7;
            _os_log_impl(&dword_226AB3000, v15, OS_LOG_TYPE_DEFAULT, "Foreground app is %@, setting ballast drained to NO", (uint8_t *)&v18, 0xCu);
          }
        }
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
    if (v11)
    {
      if ((v13 & 1) == 0)
      {
        [*(id *)(a1 + 88) removeObject:v7];
        if (![*(id *)(a1 + 88) count])
        {
          if ([*(id *)(a1 + 96) setBallastDrained:1] < 0)
          {
            long long v16 = rbs_process_log();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              int v18 = 138412290;
              id v19 = v7;
              _os_log_impl(&dword_226AB3000, v16, OS_LOG_TYPE_DEFAULT, "Error setting ballast drained to YES for %@", (uint8_t *)&v18, 0xCu);
            }
          }
          id v17 = rbs_process_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138412290;
            id v19 = v7;
            _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_DEFAULT, "The last foreground app removed was app is %@, setting ballast drained to YES", (uint8_t *)&v18, 0xCu);
          }
        }
      }
    }
  }
}

- (NSString)description
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v4 = (void *)[(NSMutableSet *)self->_observers copy];
  os_unfair_lock_unlock(p_observersLock);
  uint64_t v5 = [v4 count];
  id v6 = [NSString alloc];
  id v7 = [(id)objc_opt_class() description];
  id v8 = [v4 allObjects];
  id v9 = [v8 componentsJoinedByString:@",\n\t"];
  long long v10 = (void *)[v6 initWithFormat:@"<%@| count:%lu observers:{\n\t%@\n\t}>", v7, v5, v9];

  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xnuWrapper, 0);
  objc_storeStrong((id *)&self->_runningVisibleApps, 0);
  objc_storeStrong((id *)&self->_historicalStatistics, 0);
  objc_storeStrong((id *)&self->_preventLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_stateCaptureManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_suppressedIdentities, 0);
  objc_storeStrong((id *)&self->_publishedState, 0);
  objc_storeStrong((id *)&self->_suppressedState, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
}

- (void)_queue_updateServerState:forProcess:force:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_226AB3000, v0, v1, "SUPPRESSING state update for %{public}@: %{public}@");
}

- (void)_queue_suppressUpdatesForIdentity:(NSObject *)a3 .cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 countForObject:a2];
  int v6 = 134218242;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_226AB3000, a3, OS_LOG_TYPE_DEBUG, "Incrementing suppression state to %lu for %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_queue_suppressUpdatesForIdentity:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_226AB3000, a2, OS_LOG_TYPE_DEBUG, "BEGIN suppressing state updates for %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_unsuppressUpdatesForIdentity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_226AB3000, a2, OS_LOG_TYPE_DEBUG, "END suppressing state updates for %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_unsuppressUpdatesForIdentity:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a1 - 1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_226AB3000, a2, a3, "Decrementing suppression state to %lu for %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_queue_publishState:forIdentity:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_226AB3000, v0, v1, "Sending state update for %{public}@: %{public}@");
}

- (void)_queue_adjustMemoryPageThresholdLimitationForProcess:(uint64_t)a1 oldState:(NSObject *)a2 newState:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2082;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Error setting ballast drained for %@: %{public}s", (uint8_t *)&v6, 0x16u);
}

@end