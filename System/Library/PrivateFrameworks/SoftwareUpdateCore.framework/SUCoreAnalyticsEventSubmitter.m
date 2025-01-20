@interface SUCoreAnalyticsEventSubmitter
- (NSDictionary)events;
- (SUCoreAnalyticsEventSubmitter)init;
- (SUCoreLog)eventSubmitterLogger;
- (void)_queue_registerSendEvent:(id)a3;
- (void)_queue_removeAllEvents;
- (void)_queue_removeEvent:(id)a3;
- (void)_queue_removeEventsWithName:(id)a3;
- (void)_queue_setEvent:(id)a3;
- (void)_queue_submitAllEvents;
- (void)_queue_submitEvent:(id)a3;
- (void)_queue_submitEventsWithName:(id)a3;
- (void)removeAllEvents;
- (void)removeEvent:(id)a3;
- (void)removeEventsWithName:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventSubmitterLogger:(id)a3;
- (void)submitAllEvents;
- (void)submitEvent:(id)a3;
- (void)submitEventsWithName:(id)a3;
@end

@implementation SUCoreAnalyticsEventSubmitter

- (SUCoreAnalyticsEventSubmitter)init
{
  v11.receiver = self;
  v11.super_class = (Class)SUCoreAnalyticsEventSubmitter;
  v2 = [(SUCoreAnalyticsEventSubmitter *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    events = v2->_events;
    v2->_events = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.SUCore.SUCoreAnalyticsEventSubmitterQueue", v5);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"SUCoreAnalyticsEventSubmitter"];
    eventSubmitterLogger = v2->_eventSubmitterLogger;
    v2->_eventSubmitterLogger = (SUCoreLog *)v8;
  }
  return v2;
}

- (void)setEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke;
  v7[3] = &unk_2640DCE98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_setEvent:");
  }
  else
  {
    v3 = [v1 eventSubmitterLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke_cold_1();
    }
  }
}

- (void)removeEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke;
  v7[3] = &unk_2640DCE98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_removeEvent:");
  }
  else
  {
    v3 = [v1 eventSubmitterLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1();
    }
  }
}

- (void)removeEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SUCoreAnalyticsEventSubmitter_removeEventsWithName___block_invoke;
  v7[3] = &unk_2640DCE98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __54__SUCoreAnalyticsEventSubmitter_removeEventsWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_removeEventsWithName:");
  }
  else
  {
    v3 = [v1 eventSubmitterLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1();
    }
  }
}

- (void)removeAllEvents
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUCoreAnalyticsEventSubmitter_removeAllEvents__block_invoke;
  block[3] = &unk_2640DC338;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __48__SUCoreAnalyticsEventSubmitter_removeAllEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllEvents");
}

- (void)submitEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke;
  v7[3] = &unk_2640DCE98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 && ([v2 eventUUID], v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "_queue_submitEvent:", v5);
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) eventSubmitterLogger];
    v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke_cold_1();
    }
  }
}

- (void)submitEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke;
  v7[3] = &unk_2640DCE98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_submitEventsWithName:");
  }
  else
  {
    v3 = [v1 eventSubmitterLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke_cold_1();
    }
  }
}

- (void)submitAllEvents
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUCoreAnalyticsEventSubmitter_submitAllEvents__block_invoke;
  block[3] = &unk_2640DC338;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __48__SUCoreAnalyticsEventSubmitter_submitAllEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_submitAllEvents");
}

- (NSDictionary)events
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  objc_super v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__SUCoreAnalyticsEventSubmitter_events__block_invoke;
  v6[3] = &unk_2640DC360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __39__SUCoreAnalyticsEventSubmitter_events__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [NSDictionary dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 8)];

  return MEMORY[0x270F9A758]();
}

- (void)_queue_setEvent:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4 && ([v4 eventUUID], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "SET_EVENT: Adding CoreAnalytics event to submission queue: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    events = self->_events;
    uint64_t v9 = [v4 eventUUID];
    [(NSMutableDictionary *)events setSafeObject:v4 forKey:v9];
  }
  else
  {
    v10 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
    uint64_t v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke_cold_1();
    }
  }
}

- (void)_queue_removeEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4 && ([v4 eventUUID], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    events = self->_events;
    uint64_t v7 = [v4 eventUUID];
    id v8 = [(NSMutableDictionary *)events objectForKey:v7];

    uint64_t v9 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
    v10 = [v9 oslog];

    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        int v14 = 138543362;
        id v15 = v4;
        _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "REMOVE_EVENT: Successfully removed event %{public}@ from queue", (uint8_t *)&v14, 0xCu);
      }

      id v12 = self->_events;
      v10 = [v8 eventUUID];
      [(NSMutableDictionary *)v12 removeObjectForKey:v10];
    }
    else if (v11)
    {
      int v14 = 138543362;
      id v15 = v4;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "REMOVE_EVENT: Event %{public}@ does not exist. Nothing to do", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    uint64_t v13 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
    id v8 = [v13 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1();
    }
  }
}

- (void)_queue_removeEventsWithName:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_events allValues];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v21;
      *(void *)&long long v7 = 138543362;
      long long v19 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          BOOL v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "eventName", v19);
          int v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            int v14 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
            id v15 = [v14 oslog];

            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              v25 = v11;
              _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "REMOVE_EVENTS_WITH_NAME: Removing %{public}@", buf, 0xCu);
            }

            events = self->_events;
            v17 = [v11 eventUUID];
            [(NSMutableDictionary *)events removeObjectForKey:v17];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v18 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
    uint64_t v5 = [v18 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SUCoreAnalyticsEventSubmitter _queue_removeEventsWithName:]();
    }
  }
}

- (void)_queue_removeAllEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v3 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
  id v4 = [v3 oslog];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_20C8EA000, v4, OS_LOG_TYPE_DEFAULT, "REMOVE_ALL_EVENTS: Removing all events from submission queue", v5, 2u);
  }

  [(NSMutableDictionary *)self->_events removeAllObjects];
}

- (void)_queue_submitEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4
    && ([v4 eventUUID], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    events = self->_events;
    long long v7 = [v4 eventUUID];
    uint64_t v8 = [(NSMutableDictionary *)events objectForKey:v7];

    uint64_t v9 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
    v10 = [v9 oslog];

    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        int v13 = 138543362;
        int v14 = v8;
        _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "SUBMIT: Found event %{public}@. Sending", (uint8_t *)&v13, 0xCu);
      }

      [(SUCoreAnalyticsEventSubmitter *)self _queue_registerSendEvent:v8];
      [(SUCoreAnalyticsEventSubmitter *)self _queue_removeEvent:v8];
    }
    else
    {
      if (v11)
      {
        int v13 = 138543362;
        int v14 = v4;
        _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "SUBMIT: No event found matching %{public}@. Skipping", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    id v12 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
    uint64_t v8 = [v12 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SUCoreAnalyticsEventSubmitter _queue_submitEvent:]();
    }
  }
}

- (void)_queue_submitEventsWithName:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_events allValues];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v19;
      *(void *)&long long v7 = 138543362;
      long long v17 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v5);
          }
          BOOL v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "eventName", v17);
          int v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            int v14 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
            uint64_t v15 = [v14 oslog];

            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              long long v23 = v11;
              _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "SUBMIT_EVENTS_WITH_NAME: Submitting %{public}@", buf, 0xCu);
            }

            [(SUCoreAnalyticsEventSubmitter *)self _queue_registerSendEvent:v11];
            [(SUCoreAnalyticsEventSubmitter *)self _queue_removeEvent:v11];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v16 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
    uint64_t v5 = [v16 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SUCoreAnalyticsEventSubmitter _queue_submitEventsWithName:]();
    }
  }
}

- (void)_queue_submitAllEvents
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v3 = [(NSMutableDictionary *)self->_events allValues];
  id v4 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
  uint64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v23 = [v3 count];
    _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "[CoreAnalytics]: SUBMIT_ALL_EVENTS: Will submit %{public}lu total events", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v8 = 138543362;
    long long v16 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        int v13 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
        int v14 = [v13 oslog];

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v12 eventName];
          *(_DWORD *)buf = v16;
          uint64_t v23 = (uint64_t)v15;
          _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "[CoreAnalytics]: SUBMIT_ALL_EVENT: Sending event %{public}@", buf, 0xCu);
        }
        [(SUCoreAnalyticsEventSubmitter *)self _queue_registerSendEvent:v12];
        [(SUCoreAnalyticsEventSubmitter *)self _queue_removeEvent:v12];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_queue_registerSendEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v5 = [(SUCoreAnalyticsEventSubmitter *)self eventSubmitterLogger];
  id v6 = [v5 oslog];

  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[CoreAnalytics] SUBMIT: Calling SendEventLazy for %{public}@", buf, 0xCu);
    }

    uint64_t v7 = [v4 eventName];
    id v8 = v4;
    AnalyticsSendEventLazy();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SUCoreAnalyticsEventSubmitter _queue_registerSendEvent:]();
    }
  }
}

id __58__SUCoreAnalyticsEventSubmitter__queue_registerSendEvent___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) eventSubmitterLogger];
  v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "[CoreAnalytics] SUBMIT: Submitting CoreAnalytics event: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = [*(id *)(a1 + 40) eventPayload];

  return v5;
}

- (SUCoreLog)eventSubmitterLogger
{
  return self->_eventSubmitterLogger;
}

- (void)setEventSubmitterLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubmitterLogger, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

void __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "SET_EVENT: Nil event passed to setEvent", v2, v3, v4, v5, v6);
}

void __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "REMOVE_EVENT: Nil event name passed to removeEvent", v2, v3, v4, v5, v6);
}

void __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "SUBMIT_EVENT: Nil/invalid event passed to submit", v2, v3, v4, v5, v6);
}

void __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "SUBMIT_EVENTS_WITH_NAME: Nil event name passed to submitEvent", v2, v3, v4, v5, v6);
}

- (void)_queue_removeEventsWithName:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "REMOVE_EVENTS_WITH_NAME: Nil event name passed to removeEvent", v2, v3, v4, v5, v6);
}

- (void)_queue_submitEvent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "SUBMIT: nil event/uuid passed to submit", v2, v3, v4, v5, v6);
}

- (void)_queue_submitEventsWithName:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "SUBMIT_EVENTS_WITH_NAME: nil event name passed to submitEvent", v2, v3, v4, v5, v6);
}

- (void)_queue_registerSendEvent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "[CoreAnalytics] SUBMIT: Unable to register sending null CoreAnalytics event", v2, v3, v4, v5, v6);
}

@end