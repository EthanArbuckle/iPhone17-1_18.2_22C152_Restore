@interface RBProcessMonitorObserver
- (NSString)description;
- (NSString)stateCaptureTitle;
- (RBProcessMonitorObserver)initWithMonitor:(id)a3 forProcess:(id)a4 connection:(id)a5;
- (void)_checkForBadActorWithPendingStates:(id)a3;
- (void)_lock_addAllConfiguredStatesToPending;
- (void)_lock_addConfigurationStatesToPending:(id)a3;
- (void)_lock_clearPendingNonterminalStates;
- (void)_lock_rebuildConfiguration;
- (void)_lock_sendPendingStateUpdates;
- (void)addConfiguration:(id)a3;
- (void)dealloc;
- (void)didObserveProcessExit:(id)a3;
- (void)didResolvePreventLaunchPredicates:(id)a3;
- (void)invalidate;
- (void)processMonitor:(id)a3 didChangeProcessStates:(id)a4;
- (void)removeConfigurationWithIdentifier:(unint64_t)a3;
@end

@implementation RBProcessMonitorObserver

void __66__RBProcessMonitorObserver_processMonitor_didChangeProcessStates___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if ([*(id *)(*(void *)(a1 + 32) + 72) count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v2 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v2)
    {
      uint64_t v4 = v2;
      uint64_t v5 = *(void *)v35;
      *(void *)&long long v3 = 134218498;
      long long v26 = v3;
      uint64_t v27 = *(void *)v35;
      do
      {
        uint64_t v6 = 0;
        uint64_t v28 = v4;
        do
        {
          if (*(void *)v35 != v5) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
          v8 = objc_msgSend(v7, "process", v26);
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
          int v10 = [WeakRetained isEqual:v8];

          if (v10)
          {
            v11 = *(void **)(*(void *)(a1 + 32) + 48);
            v12 = [v8 identity];
            id v13 = (id)[v11 setValue:v7 forIdentity:v12];
          }
          else
          {
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            v12 = [*(id *)(*(void *)(a1 + 32) + 72) allValues];
            uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v44 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v31;
              while (2)
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v31 != v16) {
                    objc_enumerationMutation(v12);
                  }
                  v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                  v19 = [v18 stateDescriptor];

                  if (v19 && [v18 matchesProcess:v8])
                  {
                    v20 = rbs_monitor_log();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                    {
                      v24 = [v8 identity];
                      uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 16);
                      *(_DWORD *)buf = v26;
                      v39 = v7;
                      __int16 v40 = 2114;
                      v41 = v24;
                      __int16 v42 = 2114;
                      uint64_t v43 = v25;
                      _os_log_debug_impl(&dword_226AB3000, v20, OS_LOG_TYPE_DEBUG, "Sending state %p for %{public}@ to %{public}@", buf, 0x20u);
                    }
                    v21 = *(void **)(*(void *)(a1 + 32) + 48);
                    v22 = [v8 identity];
                    id v23 = (id)[v21 setValue:v7 forIdentity:v22];

                    objc_storeWeak((id *)(*(void *)(a1 + 32) + 88), v8);
                    goto LABEL_22;
                  }
                }
                uint64_t v15 = [v12 countByEnumeratingWithState:&v30 objects:v44 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
LABEL_22:
              uint64_t v5 = v27;
              uint64_t v4 = v28;
            }
          }

          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
      }
      while (v4);
    }

    objc_msgSend(*(id *)(a1 + 32), "_lock_sendPendingStateUpdates");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
}

- (void)_lock_sendPendingStateUpdates
{
  [*a1 count];
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_1_9(&dword_226AB3000, v1, v2, "Sending %d pending exit events to %{public}@", v3, v4, v5, v6, v7);
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_2(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  uint64_t v2 = *(unsigned char **)(a1 + 40);
  if (v2[98])
  {
    objc_msgSend(v2, "_lock_addAllConfiguredStatesToPending");
    *(unsigned char *)(*(void *)(a1 + 40) + 98) = 0;
    uint64_t v2 = *(unsigned char **)(a1 + 40);
  }
  v2[96] = 0;
  objc_msgSend(*(id *)(a1 + 40), "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
}

- (void)addConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSMutableDictionary *)self->_configurations count]) {
    [(RBProcessMonitoring *)self->_monitor addObserver:self];
  }
  configurations = self->_configurations;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  uint8_t v7 = [(NSMutableDictionary *)configurations objectForKey:v6];

  v8 = rbs_monitor_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      int v13 = 138543362;
      id v14 = v4;
      int v10 = "monitor changed to %{public}@";
LABEL_8:
      _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (v9)
  {
    int v13 = 138543362;
    id v14 = v4;
    int v10 = "monitor established %{public}@";
    goto LABEL_8;
  }

  [(RBProcessMonitorObserver *)self _lock_addConfigurationStatesToPending:v4];
  v11 = self->_configurations;
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  [(NSMutableDictionary *)v11 setObject:v4 forKey:v12];

  [(RBProcessMonitorObserver *)self _lock_rebuildConfiguration];
  [(RBProcessMonitorObserver *)self _lock_sendPendingStateUpdates];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_addConfigurationStatesToPending:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__6;
  long long v34 = __Block_byref_object_dispose__6;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__6;
  uint64_t v28 = __Block_byref_object_dispose__6;
  id v29 = 0;
  uint64_t v5 = [(RBProcessMonitoring *)self->_monitor monitorSerializationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__RBProcessMonitorObserver__lock_addConfigurationStatesToPending___block_invoke;
  block[3] = &unk_2647C8D38;
  v22 = &v30;
  block[4] = self;
  id v6 = v4;
  id v21 = v6;
  id v23 = &v24;
  dispatch_sync(v5, block);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)v31[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        pendingProcessState = self->_pendingProcessState;
        int v13 = objc_msgSend(v11, "process", (void)v16);
        id v14 = [v13 identity];
        id v15 = [(RBProcessMap *)pendingProcessState setValue:v11 forIdentity:v14];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v36 count:16];
    }
    while (v8);
  }

  if (([v6 events] & 2) != 0) {
    objc_storeStrong((id *)&self->_pendingPreventLaunchPredicates, (id)v25[5]);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)removeConfigurationWithIdentifier:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  configurations = self->_configurations;
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v8 = [(NSMutableDictionary *)configurations objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = self->_configurations;
    int v10 = [NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)v9 setObject:0 forKeyedSubscript:v10];

    [(RBProcessMonitorObserver *)self _lock_rebuildConfiguration];
    if (![(NSMutableDictionary *)self->_configurations count]) {
      [(RBProcessMonitoring *)self->_monitor removeObserver:self];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableDictionary *)self->_configurations count]) {
    [(RBProcessMonitoring *)self->_monitor removeObserver:self];
  }
  [(NSMutableDictionary *)self->_configurations removeAllObjects];
  [(RBProcessMap *)self->_pendingProcessState removeAllObjects];
  objc_storeWeak((id *)&self->_lastMatchedHandle, 0);
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_lock);
}

void __50__RBProcessMonitorObserver_didObserveProcessExit___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if ([*(id *)&(*v2)[18]._os_unfair_lock_opaque count])
  {
    id v3 = [*(id *)(a1 + 40) handle];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "allValues", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v9 events] && objc_msgSend(v9, "matchesProcess:", v3))
          {
            int v10 = rbs_monitor_log();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
              __50__RBProcessMonitorObserver_didObserveProcessExit___block_invoke_cold_1(v3, (uint64_t)v2, v10);
            }

            id v11 = objc_alloc_init(MEMORY[0x263F64560]);
            [v11 setProcess:v3];
            v12 = [*(id *)(a1 + 40) lastExitContext];
            [v11 setContext:v12];

            [*(id *)(*(void *)(a1 + 32) + 56) addObject:v11];
            objc_msgSend(*(id *)(a1 + 32), "_lock_sendPendingStateUpdates");

            goto LABEL_15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  os_unfair_lock_unlock(*v2 + 10);
}

- (void)processMonitor:(id)a3 didChangeProcessStates:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  RBSDispatchAsyncWithQoS();
}

- (void)_lock_rebuildConfiguration
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  self->_unsigned int qos = 9;
  objc_storeWeak((id *)&self->_lastMatchedHandle, 0);
  stateDescriptor = self->_stateDescriptor;
  self->_stateDescriptor = 0;

  id v4 = [MEMORY[0x263EFF9C0] set];
  id v5 = [(NSMutableDictionary *)self->_configurations allValues];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unsigned int qos = self->_qos;
        unsigned int v13 = [v11 serviceClass];
        if (qos <= v13) {
          unsigned int v14 = v13;
        }
        else {
          unsigned int v14 = qos;
        }
        self->_unsigned int qos = v14;
        long long v15 = [v11 stateDescriptor];
        long long v16 = v15;
        if (v15)
        {
          long long v17 = [v15 endowmentNamespaces];
          [v4 addObjectsFromArray:v17];

          v8 |= [v16 values];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v18 = (RBSProcessStateDescriptor *)objc_alloc_init(MEMORY[0x263F645E8]);
  long long v19 = self->_stateDescriptor;
  self->_stateDescriptor = v18;

  v20 = self->_stateDescriptor;
  id v21 = [v4 allObjects];
  [(RBSProcessStateDescriptor *)v20 setEndowmentNamespaces:v21];

  [(RBSProcessStateDescriptor *)self->_stateDescriptor setValues:v8];
}

uint64_t __66__RBProcessMonitorObserver__lock_addConfigurationStatesToPending___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) statesMatchingConfiguration:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 8) preventLaunchPredicates];
  return MEMORY[0x270F9A758]();
}

- (RBProcessMonitorObserver)initWithMonitor:(id)a3 forProcess:(id)a4 connection:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"RBProcessMonitorObserver.m", 97, @"Invalid parameter not satisfying: %@", @"process != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"RBProcessMonitorObserver.m", 96, @"Invalid parameter not satisfying: %@", @"monitor != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  id v29 = [MEMORY[0x263F08690] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"RBProcessMonitorObserver.m", 98, @"Invalid parameter not satisfying: %@", @"connection != nil" object file lineNumber description];

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)RBProcessMonitorObserver;
  unsigned int v13 = [(RBProcessMonitorObserver *)&v30 init];
  unsigned int v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_monitor, a3);
    objc_storeStrong((id *)&v14->_process, a4);
    objc_storeStrong((id *)&v14->_connection, a5);
    v14->_lock._os_unfair_lock_opaque = 0;
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    configurations = v14->_configurations;
    v14->_configurations = (NSMutableDictionary *)v15;

    long long v17 = objc_alloc_init(RBProcessMap);
    pendingProcessState = v14->_pendingProcessState;
    v14->_pendingProcessState = v17;

    uint64_t v19 = [MEMORY[0x263EFF980] array];
    pendingExitEvents = v14->_pendingExitEvents;
    v14->_pendingExitEvents = (NSMutableArray *)v19;

    id v21 = (void *)MEMORY[0x263F64650];
    long long v22 = [NSString stringWithFormat:@"RBProcessMonitorObserver:%@", v14->_process];
    uint64_t v23 = [v21 createBackgroundQueue:v22];
    calloutQueue = v14->_calloutQueue;
    v14->_calloutQueue = (OS_dispatch_queue *)v23;

    RBSMachAbsoluteTime();
    v14->_lastSend = v25;
  }

  return v14;
}

- (void)didObserveProcessExit:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  RBSDispatchAsyncWithQoS();
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [NSString alloc];
  id v5 = [(id)objc_opt_class() description];
  stateDescriptor = self->_stateDescriptor;
  uint64_t qos = self->_qos;
  uint64_t v8 = [(NSMutableDictionary *)self->_configurations entriesToStringWithIndent:2 debug:1];
  uint64_t v9 = (void *)[v4 initWithFormat:@"<%@| qos:%u qos:%@ configs:{\n%@\t}>", v5, qos, stateDescriptor, v8];

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v9;
}

- (void)_lock_clearPendingNonterminalStates
{
  os_unfair_lock_assert_owner(&self->_lock);
  pendingProcessState = self->_pendingProcessState;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__RBProcessMonitorObserver__lock_clearPendingNonterminalStates__block_invoke;
  v4[3] = &unk_2647C8D88;
  v4[4] = self;
  [(RBProcessMap *)pendingProcessState enumerateWithBlock:v4];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastMatchedHandle);
  objc_storeStrong((id *)&self->_stateDescriptor, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_pendingPreventLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_pendingExitEvents, 0);
  objc_storeStrong((id *)&self->_pendingProcessState, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

- (void)dealloc
{
  if (self->_connection)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[RBProcessMonitorObserver dealloc]"];
    [v3 handleFailureInFunction:v4 file:@"RBProcessMonitorObserver.m" lineNumber:115 description:@"must be invalidated before releasing"];
  }
  v5.receiver = self;
  v5.super_class = (Class)RBProcessMonitorObserver;
  [(RBProcessMonitorObserver *)&v5 dealloc];
}

- (void)_lock_addAllConfiguredStatesToPending
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(NSMutableDictionary *)self->_configurations allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(RBProcessMonitorObserver *)self _lock_addConfigurationStatesToPending:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)didResolvePreventLaunchPredicates:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  RBSDispatchAsyncWithQoS();
}

void __62__RBProcessMonitorObserver_didResolvePreventLaunchPredicates___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if ([*((id *)*v2 + 9) count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = objc_msgSend(*((id *)*v2 + 9), "allValues", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * i) events])
          {
            long long v8 = rbs_monitor_log();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
              __62__RBProcessMonitorObserver_didResolvePreventLaunchPredicates___block_invoke_cold_1((uint64_t)v2, v8);
            }

            long long v9 = *(void **)(a1 + 40);
            if (v9)
            {
              long long v10 = *v2;
              id v11 = v9;
              id v12 = (void *)v10[8];
              v10[8] = v11;
            }
            else
            {
              uint64_t v13 = [MEMORY[0x263EFFA08] set];
              id v12 = (void *)*((void *)*v2 + 8);
              *((void *)*v2 + 8) = v13;
            }

            objc_msgSend(*v2, "_lock_sendPendingStateUpdates");
            goto LABEL_17;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  os_unfair_lock_unlock((os_unfair_lock_t)*v2 + 10);
}

- (NSString)stateCaptureTitle
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(RBProcess *)self->_process description];
  uint64_t v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  return (NSString *)v7;
}

- (void)_checkForBadActorWithPendingStates:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_alloc_init(MEMORY[0x263F08760]);
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__6;
  v51 = __Block_byref_object_dispose__6;
  id v52 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__6;
  v45[4] = __Block_byref_object_dispose__6;
  uint64_t v46 = &stru_26DA9D688;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __63__RBProcessMonitorObserver__checkForBadActorWithPendingStates___block_invoke;
  v40[3] = &unk_2647C8D60;
  id v7 = v6;
  id v41 = v7;
  __int16 v42 = &v53;
  uint64_t v43 = &v47;
  v44 = v45;
  v39 = v4;
  [v4 enumerateWithBlock:v40];
  long long v8 = rbs_monitor_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = (RBProcess *)v54[3];
    unint64_t v10 = v48[5];
    *(_DWORD *)buf = 134218242;
    v58 = v9;
    __int16 v59 = 2114;
    unint64_t v60 = v10;
    _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "checkForBadActor: %lu instances of '%{public}@' have been terminated since last update read", buf, 0x16u);
  }

  RBSMachAbsoluteTime();
  double v12 = v11;
  double lastSend = self->_lastSend;
  unint64_t v14 = [(RBProcessMap *)self->_pendingProcessState count];
  if (_RBMaxPendingProcessStates_onceToken != -1) {
    dispatch_once(&_RBMaxPendingProcessStates_onceToken, &__block_literal_global_19);
  }
  if (v14 <= _RBMaxPendingProcessStates_maxPendingProcessStates || (double v15 = v12 - lastSend, v15 <= 2.0))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    unint64_t v16 = llround(v15);
    if (v16 >= 0x7FFFFF) {
      uint64_t v17 = 0x7FFFFFLL;
    }
    else {
      uint64_t v17 = v16;
    }
    uint64_t v18 = v54[3];
    uint64_t v19 = rbs_process_log();
    unint64_t v20 = v18 & 0x1FF | (v17 << 9) | 0xB10CCA1100000000;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      process = self->_process;
      unint64_t v36 = [(RBProcessMap *)self->_pendingProcessState count];
      if (_RBMaxPendingProcessStates_onceToken != -1) {
        dispatch_once(&_RBMaxPendingProcessStates_onceToken, &__block_literal_global_19);
      }
      uint64_t v37 = v54[3];
      uint64_t v38 = v48[5];
      *(_DWORD *)buf = 138544898;
      v58 = process;
      __int16 v59 = 2048;
      unint64_t v60 = v36;
      __int16 v61 = 1024;
      int v62 = _RBMaxPendingProcessStates_maxPendingProcessStates;
      __int16 v63 = 2048;
      double v64 = v15;
      __int16 v65 = 2048;
      uint64_t v66 = v37;
      __int16 v67 = 2114;
      uint64_t v68 = v38;
      __int16 v69 = 2048;
      unint64_t v70 = v20;
      _os_log_error_impl(&dword_226AB3000, v19, OS_LOG_TYPE_ERROR, "%{public}@ is over the maximum number of pending updates:%lu vs. %u.\nLast unread update sent %f seconds ago.\n%lu of those updates were for terminated '%{public}@' processes.\nExceptionCode %llx", buf, 0x44u);
    }

    id v21 = objc_alloc(MEMORY[0x263F64638]);
    long long v22 = NSString;
    uint64_t v23 = self->_process;
    unint64_t v24 = [(RBProcessMap *)self->_pendingProcessState count];
    if (_RBMaxPendingProcessStates_onceToken != -1) {
      dispatch_once(&_RBMaxPendingProcessStates_onceToken, &__block_literal_global_19);
    }
    double v25 = [v22 stringWithFormat:@"%@ is over the maximum number of pending updates:%lu vs. %u. Last unread update sent %f seconds ago. %lu of those updates were for terminated '%@' processes.", v23, v24, _RBMaxPendingProcessStates_maxPendingProcessStates, *(void *)&v15, v54[3], v48[5]];
    uint64_t v26 = (void *)[v21 initWithExplanation:v25];

    [v26 setExceptionCode:v20];
    [v26 setExceptionDomain:15];
    [v26 setMaximumTerminationResistance:50];
    [v26 setReportType:1];
    uint64_t v27 = [(RBProcess *)self->_process identity];
    uint64_t v28 = rbs_sp_telemetry_log();
    if (os_signpost_enabled(v28))
    {
      uint64_t v29 = [v27 embeddedApplicationIdentifier];
      objc_super v30 = (void *)v29;
      if (v29)
      {
        int v31 = 0;
        uint64_t v32 = (RBProcess *)v29;
      }
      else
      {
        uint64_t v33 = [v27 xpcServiceIdentifier];
        if (v33)
        {
          int v31 = 0;
          uint64_t v23 = (RBProcess *)v33;
          uint64_t v32 = (RBProcess *)v33;
        }
        else
        {
          uint64_t v32 = [v27 consistentLaunchdJobLabel];
          uint64_t v23 = 0;
          int v31 = 1;
        }
      }
      *(_DWORD *)buf = 138543362;
      v58 = v32;
      _os_signpost_emit_with_name_impl(&dword_226AB3000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RBProcessStatesMaxCountReached_ProcessTerminated", "BundleIdOverride=%{public, signpost.description:attribute}@ enableTelemetry=YES ", buf, 0xCu);
      if (v31) {

      }
      if (!v30) {
    }
      }

    long long v34 = self->_process;
    os_unfair_lock_unlock(p_lock);
    [(RBProcess *)v34 terminateWithContext:v26];
  }
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);
}

void __63__RBProcessMonitorObserver__checkForBadActorWithPendingStates___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 isEmbeddedApplication])
  {
    uint64_t v4 = [v8 embeddedApplicationIdentifier];
  }
  else if ([v8 isXPCService])
  {
    uint64_t v4 = [v8 xpcServiceIdentifier];
  }
  else
  {
    if (![v8 hasConsistentLaunchdJob])
    {
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    uint64_t v4 = [v8 consistentLaunchdJobLabel];
  }
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
    unint64_t v6 = [*(id *)(a1 + 32) countForObject:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v6 > *(void *)(v7 + 24))
    {
      *(void *)(v7 + 24) = v6;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
    }
  }
LABEL_11:
}

void __63__RBProcessMonitorObserver__lock_clearPendingNonterminalStates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isRunning]) {
    [*(id *)(*(void *)(a1 + 32) + 48) removeIdentity:v5];
  }
}

uint64_t __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkForBadActorWithPendingStates:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_108(uint64_t a1)
{
  uint64_t v2 = rbs_monitor_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_108_cold_1(a1);
  }

  id v3 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  uint64_t v4 = *(unsigned char **)(a1 + 40);
  if (v4[98])
  {
    objc_msgSend(v4, "_lock_addAllConfiguredStatesToPending");
    *(unsigned char *)(*(void *)(a1 + 40) + 98) = 0;
    uint64_t v4 = *(unsigned char **)(a1 + 40);
  }
  v4[97] = 0;
  objc_msgSend(*(id *)(a1 + 40), "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_111(uint64_t a1)
{
  uint64_t v2 = rbs_monitor_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_108_cold_1(a1);
  }

  id v3 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  uint64_t v4 = *(unsigned char **)(a1 + 40);
  if (v4[98])
  {
    objc_msgSend(v4, "_lock_addAllConfiguredStatesToPending");
    *(unsigned char *)(*(void *)(a1 + 40) + 98) = 0;
    uint64_t v4 = *(unsigned char **)(a1 + 40);
  }
  v4[97] = 0;
  objc_msgSend(*(id *)(a1 + 40), "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
}

void __50__RBProcessMonitorObserver_didObserveProcessExit___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [a1 identity];
  uint64_t v6 = *(void *)(*(void *)a2 + 16);
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_226AB3000, a3, OS_LOG_TYPE_DEBUG, "Sending exit event for %{public}@ to %{public}@", (uint8_t *)&v7, 0x16u);
}

void __62__RBProcessMonitorObserver_didResolvePreventLaunchPredicates___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_226AB3000, a2, OS_LOG_TYPE_DEBUG, "Sending prevent launch update to %{public}@", (uint8_t *)&v3, 0xCu);
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_108_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_1_9(&dword_226AB3000, v1, v2, "Sent %d pending exit events to %{public}@", v3, v4, v5, v6, v7);
}

@end