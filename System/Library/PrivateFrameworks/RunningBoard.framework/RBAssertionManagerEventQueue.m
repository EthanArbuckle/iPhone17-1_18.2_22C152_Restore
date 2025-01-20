@interface RBAssertionManagerEventQueue
- (RBAssertionManagerEventQueue)initWithTimeProvider:(id)a3;
- (RBAssertionManagerQueueDelegate)delegate;
- (id)description;
- (unint64_t)count;
- (void)_queue_enqueueEventsForAssertion:(uint64_t)a1;
- (void)_queue_enqueueInvalidationEventForAssertion:(double)a3 startTime:;
- (void)_queue_enqueueProcessExpirationEventsForProcesses:(id *)a1;
- (void)_queue_enqueueWarningEventForAssertion:(double)a3 startTime:;
- (void)_queue_removeEventsForContext:(uint64_t)a1;
- (void)_queue_updateEventsForAssertion:(uint64_t)a1;
- (void)setDelegate:(id)a3;
- (void)updateEventsForAssertions:(id)a3;
@end

@implementation RBAssertionManagerEventQueue

- (void)updateEventsForAssertions:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_queue_enqueueWarningEventForAssertion:(double)a3 startTime:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    [v5 warningDuration];
    double v8 = v7;
    if ([v6 isActive])
    {
      if ([v6 isValid] && v8 > 0.0)
      {
        [v6 invalidationDuration];
        double v10 = fmax(v9 - v8, 0.0) + a3;
        v11 = objc_alloc_init(RBEventQueueEvent);
        [(RBEventQueueEvent *)v11 setContext:v6];
        [(RBEventQueueEvent *)v11 setEventTime:v10];
        uint64_t v12 = MEMORY[0x263EF8330];
        uint64_t v13 = 3221225472;
        v14 = __81__RBAssertionManagerEventQueue__queue_enqueueWarningEventForAssertion_startTime___block_invoke;
        v15 = &unk_2647C7BE8;
        id v16 = v6;
        uint64_t v17 = a1;
        [(RBEventQueueEvent *)v11 setAction:&v12];
        objc_msgSend(*(id *)(a1 + 24), "addEvent:", v11, v12, v13, v14, v15);
      }
    }
  }
}

void __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "target", (void)v11);
        double v10 = [v9 identity];

        if (v10) {
          [v2 addObject:v10];
        }
        -[RBAssertionManagerEventQueue _queue_updateEventsForAssertion:](*(void *)(a1 + 40), v8);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  -[RBAssertionManagerEventQueue _queue_enqueueProcessExpirationEventsForProcesses:](*(id **)(a1 + 40), v2);
}

- (void)_queue_updateEventsForAssertion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = rbs_assertion_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[RBAssertionManagerEventQueue _queue_updateEventsForAssertion:]((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }

    -[RBAssertionManagerEventQueue _queue_removeEventsForContext:](a1, v3);
    -[RBAssertionManagerEventQueue _queue_enqueueEventsForAssertion:](a1, v3);
  }
}

- (void)_queue_removeEventsForContext:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = rbs_assertion_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[RBAssertionManagerEventQueue _queue_removeEventsForContext:]((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }

    long long v11 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v12 = objc_msgSend(*(id *)(a1 + 24), "events", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v18 = [v17 context];

          if (v18 == v3) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    if ([v11 count]) {
      [*(id *)(a1 + 24) removeEvents:v11];
    }
  }
}

- (void)_queue_enqueueEventsForAssertion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && [v3 isActive] && objc_msgSend(v4, "isValid"))
  {
    uint64_t v5 = rbs_assertion_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[RBAssertionManagerEventQueue _queue_enqueueEventsForAssertion:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    long long v12 = *(void **)(a1 + 24);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__RBAssertionManagerEventQueue__queue_enqueueEventsForAssertion___block_invoke;
    v13[3] = &unk_2647C7B98;
    v13[4] = a1;
    id v14 = v4;
    [v12 batchModify:v13];
  }
}

void __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke_2;
  v5[3] = &unk_2647C7B98;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 batchModify:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

- (void)_queue_enqueueProcessExpirationEventsForProcesses:(id *)a1
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v26;
      *(void *)&long long v6 = 138543874;
      long long v22 = v6;
      v23 = v4;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(a1[4], "removeValueForIdentity:", v10, v22);
          if (v11) {
            [a1[3] removeEvent:v11];
          }
          id WeakRetained = objc_loadWeakRetained(a1 + 6);
          [WeakRetained eventQueue:a1 remainingRuntimeForProcessIdentity:v10];
          double v14 = v13;

          if (v14 <= 0.5)
          {
            [a1[4] removeIdentity:v10];
          }
          else
          {
            [a1[5] currentTime];
            double v16 = fmax(v14 + -5.0, 0.0) + v15;
            double v17 = v14 + v15;
            id v18 = rbs_assertion_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              long long v21 = [v10 shortDescription];
              *(_DWORD *)buf = v22;
              v30 = v21;
              __int16 v31 = 2048;
              double v32 = v16;
              __int16 v33 = 2048;
              double v34 = v17;
              _os_log_debug_impl(&dword_226AB3000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ - New process assertions warning time: %f expiration time: %f.", buf, 0x20u);

              uint64_t v4 = v23;
            }

            long long v19 = objc_alloc_init(RBEventQueueEvent);
            [(RBEventQueueEvent *)v19 setContext:v10];
            [(RBEventQueueEvent *)v19 setEventTime:v16];
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = __82__RBAssertionManagerEventQueue__queue_enqueueProcessExpirationEventsForProcesses___block_invoke;
            v24[3] = &unk_2647C7C10;
            v24[4] = a1;
            v24[5] = v10;
            *(double *)&v24[6] = v17;
            [(RBEventQueueEvent *)v19 setAction:v24];
            id v20 = (id)[a1[4] setValue:v19 forIdentity:v10];
            [a1[3] addEvent:v19];
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v7);
    }
  }
}

void __65__RBAssertionManagerEventQueue__queue_enqueueEventsForAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained eventQueue:*(void *)(a1 + 32) startTimeForAssertion:*(void *)(a1 + 40)];
  double v4 = v3;

  -[RBAssertionManagerEventQueue _queue_enqueueWarningEventForAssertion:startTime:](*(void *)(a1 + 32), *(void **)(a1 + 40), v4);
  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = *(void **)(a1 + 40);
  -[RBAssertionManagerEventQueue _queue_enqueueInvalidationEventForAssertion:startTime:](v5, v6, v4);
}

- (void)_queue_enqueueInvalidationEventForAssertion:(double)a3 startTime:
{
  id v5 = a2;
  long long v6 = v5;
  if (a1)
  {
    if ([v5 isActive])
    {
      if ([v6 isValid])
      {
        [v6 invalidationDuration];
        if (v7 > 0.0)
        {
          if ([v6 endPolicy])
          {
            [v6 invalidationDuration];
            double v9 = fmax(v8 + a3, 0.0);
            uint64_t v10 = objc_alloc_init(RBEventQueueEvent);
            [(RBEventQueueEvent *)v10 setContext:v6];
            [(RBEventQueueEvent *)v10 setEventTime:v9];
            uint64_t v11 = MEMORY[0x263EF8330];
            uint64_t v12 = 3221225472;
            double v13 = __86__RBAssertionManagerEventQueue__queue_enqueueInvalidationEventForAssertion_startTime___block_invoke;
            double v14 = &unk_2647C7BE8;
            id v15 = v6;
            uint64_t v16 = a1;
            [(RBEventQueueEvent *)v10 setAction:&v11];
            objc_msgSend(*(id *)(a1 + 24), "addEvent:", v10, v11, v12, v13, v14);
          }
        }
      }
    }
  }
}

- (RBAssertionManagerEventQueue)initWithTimeProvider:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RBAssertionManagerEventQueue;
  long long v6 = [(RBAssertionManagerEventQueue *)&v15 init];
  double v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x263F64650] createSyncingQueue:@"RBAssertionManagerEventQueue"];
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_alloc_init(RBProcessMap);
    expirationWarningEvents = v7->_expirationWarningEvents;
    v7->_expirationWarningEvents = v10;

    objc_storeStrong((id *)&v7->_timeProvider, a3);
    uint64_t v12 = [[RBEventQueue alloc] initWithQueue:v7->_queue timeProvider:v5];
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = v12;
  }
  return v7;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__RBAssertionManagerEventQueue_count__block_invoke;
  v5[3] = &unk_2647C7BC0;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__RBAssertionManagerEventQueue_count__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 24) count];
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v2);
}

- (id)description
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__RBAssertionManagerEventQueue_description__block_invoke;
  v5[3] = &unk_2647C7BC0;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__RBAssertionManagerEventQueue_description__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = [NSString alloc];
  id v3 = [(id)objc_opt_class() description];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) debugDescription];
  uint64_t v6 = [v2 initWithFormat:@"<%@| eventCount:%lu eventQueue:%@>", v3, v4, v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v9);
}

void __81__RBAssertionManagerEventQueue__queue_enqueueWarningEventForAssertion_startTime___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) isActive];
  id WeakRetained = rbs_assertion_log();
  BOOL v4 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_226AB3000, WeakRetained, OS_LOG_TYPE_INFO, "Assertion warning event: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
    [WeakRetained eventQueue:*(void *)(a1 + 40) handleWarningEventForAssertion:*(void *)(a1 + 32)];
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_226AB3000, WeakRetained, OS_LOG_TYPE_INFO, "Ignoring assertion warning event fired for inactive assertion: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

void __86__RBAssertionManagerEventQueue__queue_enqueueInvalidationEventForAssertion_startTime___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) isActive];
  id v3 = rbs_assertion_log();
  id WeakRetained = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_226AB3000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Assertion did invalidate due to timeout: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
    [WeakRetained eventQueue:*(void *)(a1 + 40) handleInvalidationEventForAssertion:*(void *)(a1 + 32)];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_226AB3000, WeakRetained, OS_LOG_TYPE_INFO, "Ignoring assertion timeout event fired for inactive assertion: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

void __82__RBAssertionManagerEventQueue__queue_enqueueProcessExpirationEventsForProcesses___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(*(void *)(a1 + 32) + 32) removeIdentity:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained eventQueue:*(void *)(a1 + 32) handleAssertionsExpirationWarningEventForProcessIdentity:*(void *)(a1 + 40) expirationTime:*(double *)(a1 + 48)];
}

- (RBAssertionManagerQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RBAssertionManagerQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_expirationWarningEvents, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_updateEventsForAssertion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queue_removeEventsForContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queue_enqueueEventsForAssertion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end