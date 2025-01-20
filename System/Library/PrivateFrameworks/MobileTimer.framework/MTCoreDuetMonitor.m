@interface MTCoreDuetMonitor
- (MTAlarmStorage)alarmStorage;
- (MTCoreDuetMonitor)initWithAlarmStorage:(id)a3;
- (NSMutableDictionary)alarmStatesByAlarmID;
- (NSMutableDictionary)alarmsByID;
- (OS_dispatch_queue)serialQueue;
- (_CDClientContext)context;
- (_DKKnowledgeStore)knowledgeStore;
- (id)metadataForAlarm:(id)a3;
- (void)_queue_writeAlarmToKnowledgeStore:(id)a3 category:(id)a4;
- (void)_queue_writeCurrentStateToContextStore;
- (void)_queue_writeNextAlarmStateToContextStore:(id)a3;
- (void)handleSystemReady;
- (void)source:(id)a3 didAddAlarms:(id)a4;
- (void)source:(id)a3 didChangeNextAlarm:(id)a4;
- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5;
- (void)source:(id)a3 didRemoveAlarms:(id)a4;
- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5;
- (void)source:(id)a3 didUpdateAlarms:(id)a4;
- (void)updateAlarmCaches:(id)a3;
- (void)updateLastModifiedDateForAlarms:(id)a3;
- (void)updateStateForAlarm:(id)a3 alarmEvent:(unint64_t)a4;
- (void)updateStateForNextAlarm:(id)a3;
- (void)writeAlarmEventToBiome:(id)a3 ofType:(unint64_t)a4;
- (void)writeAlarmEventsToBiome:(id)a3 ofType:(unint64_t)a4;
- (void)writeAlarmToKnowledgeStore:(id)a3 alarmEvent:(unint64_t)a4;
- (void)writeAlarmUpdatedEventForAlarms:(id)a3;
@end

@implementation MTCoreDuetMonitor

- (MTCoreDuetMonitor)initWithAlarmStorage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTCoreDuetMonitor;
  v6 = [(MTCoreDuetMonitor *)&v20 init];
  v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    [v5 registerObserver:v6];
    objc_storeStrong((id *)&v6->_alarmStorage, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mobiletimerd.MTCoreDuetMonitor", v8);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    alarmStatesByAlarmID = v6->_alarmStatesByAlarmID;
    v6->_alarmStatesByAlarmID = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    alarmsByID = v6->_alarmsByID;
    v6->_alarmsByID = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F5B6A8] userContext];
    context = v6->_context;
    v6->_context = (_CDClientContext *)v15;

    uint64_t v17 = [MEMORY[0x1E4F5B560] knowledgeStore];
    knowledgeStore = v6->_knowledgeStore;
    v6->_knowledgeStore = (_DKKnowledgeStore *)v17;
  }
  return v6;
}

- (void)handleSystemReady
{
  v1 = [a1 alarmStorage];
  v2 = [v1 alarms];
  [v2 count];
  OUTLINED_FUNCTION_2_3(&dword_19CC95000, v3, v4, "[Triggers] %{public}@ handleSystemReadyWithAlarmStorage %lu alarms", v5, v6, v7, v8, 2u);
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  id v5 = a4;
  uint64_t v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[MTCoreDuetMonitor source:didAddAlarms:]();
  }

  [(MTCoreDuetMonitor *)self updateAlarmCaches:v5];
  [(MTCoreDuetMonitor *)self writeAlarmEventsToBiome:v5 ofType:3];
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v5 = a4;
  uint64_t v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[MTCoreDuetMonitor source:didUpdateAlarms:]();
  }

  [(MTCoreDuetMonitor *)self updateLastModifiedDateForAlarms:v5];
  [(MTCoreDuetMonitor *)self writeAlarmUpdatedEventForAlarms:v5];
}

- (void)source:(id)a3 didChangeNextAlarm:(id)a4
{
  id v5 = a4;
  uint64_t v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[MTCoreDuetMonitor source:didChangeNextAlarm:]();
  }

  [(MTCoreDuetMonitor *)self updateStateForNextAlarm:v5];
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = MTLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a5];
    int v12 = 138543874;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_debug_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEBUG, "[Triggers] %{public}@ didSnoozeAlarm: %{public}@, snoozeAction: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  dispatch_queue_t v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_INFO, "[Triggers] %{public}@ Telling context store and knowledge store that alarm (%{public}@) has snoozed", (uint8_t *)&v12, 0x16u);
  }

  if (a5 == 1) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = 7;
  }
  [(MTCoreDuetMonitor *)self updateStateForAlarm:v7 alarmEvent:v10];
  [(MTCoreDuetMonitor *)self writeAlarmToKnowledgeStore:v7 alarmEvent:v10];
  [(MTCoreDuetMonitor *)self writeAlarmEventToBiome:v7 ofType:2];
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = MTLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a5];
    int v13 = 138543874;
    __int16 v14 = self;
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    _os_log_debug_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEBUG, "[Triggers] %{public}@ didDismissAlarm: %{public}@, dismissAction: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  dispatch_queue_t v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543618;
    __int16 v14 = self;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_INFO, "[Triggers] %{public}@ Telling context store and knowledge store that alarm (%{public}@) has been dismissed", (uint8_t *)&v13, 0x16u);
  }

  if (a5 < 0xC && ((0xCE7u >> a5) & 1) != 0)
  {
    uint64_t v11 = qword_19CD53C90[a5];
    [(MTCoreDuetMonitor *)self updateStateForAlarm:v7 alarmEvent:v11];
    [(MTCoreDuetMonitor *)self writeAlarmToKnowledgeStore:v7 alarmEvent:v11];
    [(MTCoreDuetMonitor *)self writeAlarmEventToBiome:v7 ofType:1];
  }
  else
  {
    uint64_t v10 = MTLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[MTCoreDuetMonitor source:didDismissAlarm:dismissAction:]((uint64_t)self, a5);
    }
  }
}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = MTLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a5];
    int v13 = 138543874;
    __int16 v14 = self;
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    _os_log_debug_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEBUG, "[Triggers] %{public}@ didFireAlarm: %{public}@, triggerType: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  dispatch_queue_t v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543618;
    __int16 v14 = self;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_INFO, "[Triggers] %{public}@ Telling context store and knowledge store that alarm (%{public}@) has fired", (uint8_t *)&v13, 0x16u);
  }

  if (a5 >= 6)
  {
    uint64_t v11 = MTLogForCategory(3);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[MTCoreDuetMonitor source:didFireAlarm:triggerType:]((uint64_t)self, a5);
    }
  }
  else
  {
    uint64_t v10 = qword_19CD53CF0[a5];
    [(MTCoreDuetMonitor *)self updateStateForAlarm:v7 alarmEvent:v10];
    [(MTCoreDuetMonitor *)self writeAlarmToKnowledgeStore:v7 alarmEvent:v10];
    [(MTCoreDuetMonitor *)self writeAlarmEventToBiome:v7 ofType:0];
  }
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v5 = a4;
  uint64_t v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[MTCoreDuetMonitor source:didRemoveAlarms:]();
  }

  id v7 = [(MTCoreDuetMonitor *)self serialQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MTCoreDuetMonitor_source_didRemoveAlarms___block_invoke;
  v9[3] = &unk_1E5915000;
  id v10 = v5;
  uint64_t v11 = self;
  id v8 = v5;
  dispatch_async(v7, v9);
}

uint64_t __44__MTCoreDuetMonitor_source_didRemoveAlarms___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "alarmStatesByAlarmID", (void)v13);
        dispatch_queue_t v9 = [v7 alarmID];
        [v8 removeObjectForKey:v9];

        id v10 = [*(id *)(a1 + 40) alarmsByID];
        uint64_t v11 = [v7 alarmID];
        [v10 removeObjectForKey:v11];

        [*(id *)(a1 + 40) writeAlarmEventToBiome:v7 ofType:5];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_writeCurrentStateToContextStore");
}

- (void)updateStateForAlarm:(id)a3 alarmEvent:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(MTCoreDuetMonitor *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MTCoreDuetMonitor_updateStateForAlarm_alarmEvent___block_invoke;
    block[3] = &unk_1E5915258;
    block[4] = self;
    id v9 = v6;
    unint64_t v10 = a4;
    dispatch_async(v7, block);
  }
}

uint64_t __52__MTCoreDuetMonitor_updateStateForAlarm_alarmEvent___block_invoke(uint64_t a1)
{
  id v2 = MTDictionaryRepresentationOfAlarm(*(void **)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = [*(id *)(a1 + 32) alarmStatesByAlarmID];
  uint64_t v4 = [*(id *)(a1 + 40) alarmID];
  [v3 setObject:v2 forKeyedSubscript:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  return objc_msgSend(v5, "_queue_writeCurrentStateToContextStore");
}

- (void)updateAlarmCaches:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTCoreDuetMonitor *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MTCoreDuetMonitor_updateAlarmCaches___block_invoke;
  v7[3] = &unk_1E5915000;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__MTCoreDuetMonitor_updateAlarmCaches___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = MTDictionaryRepresentationOfAlarm(v7, 0);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "alarmStatesByAlarmID", (void)v15);
        unint64_t v10 = [v7 alarmID];
        [v9 setObject:v8 forKeyedSubscript:v10];

        uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 32);
        int v12 = (void *)[v7 copy];
        long long v13 = [v7 alarmID];
        [v11 setObject:v12 forKey:v13];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_writeCurrentStateToContextStore");
}

- (void)updateLastModifiedDateForAlarms:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTCoreDuetMonitor *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MTCoreDuetMonitor_updateLastModifiedDateForAlarms___block_invoke;
  v7[3] = &unk_1E5915000;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__MTCoreDuetMonitor_updateLastModifiedDateForAlarms___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 40) alarmStatesByAlarmID];
        id v9 = [v7 alarmID];
        unint64_t v10 = [v8 objectForKeyedSubscript:v9];
        uint64_t v11 = (void *)[v10 mutableCopy];

        int v12 = [v7 lastModifiedDate];
        long long v13 = v12;
        if (!v12)
        {
          v1 = [MEMORY[0x1E4F1C9C8] distantPast];
          long long v13 = v1;
        }
        long long v14 = [MEMORY[0x1E4F5B6B8] modifiedDateKey];
        [v11 setValue:v13 forKey:v14];

        if (!v12) {
        long long v15 = [*(id *)(a1 + 40) alarmStatesByAlarmID];
        }
        long long v16 = [v7 alarmID];
        [v15 setObject:v11 forKeyedSubscript:v16];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_writeCurrentStateToContextStore");
}

- (void)updateStateForNextAlarm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTCoreDuetMonitor *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MTCoreDuetMonitor_updateStateForNextAlarm___block_invoke;
  v7[3] = &unk_1E5915000;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__MTCoreDuetMonitor_updateStateForNextAlarm___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_writeNextAlarmStateToContextStore:", *(void *)(a1 + 40));
}

- (void)_queue_writeCurrentStateToContextStore
{
  uint64_t v3 = [(MTCoreDuetMonitor *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v7 = [MEMORY[0x1E4F5B6B8] keyPathForCurrentAlarms];
  id v4 = [(MTCoreDuetMonitor *)self alarmStatesByAlarmID];
  uint64_t v5 = [v4 allValues];
  id v6 = [MEMORY[0x1E4F5B6A8] userContext];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

- (void)_queue_writeNextAlarmStateToContextStore:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MTCoreDuetMonitor *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = 0x1E4F5B000uLL;
  if (v4)
  {
    id v7 = v4;
    long long v18 = [MEMORY[0x1E4F5B6B8] alarmIDKey];
    v19[0] = v18;
    id v8 = [v7 alarmID];
    v20[0] = v8;
    id v9 = [MEMORY[0x1E4F5B6B8] modifiedDateKey];
    v19[1] = v9;
    unint64_t v10 = [v7 lastModifiedDate];
    uint64_t v11 = v10;
    if (!v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v20[1] = v11;
    int v12 = [MEMORY[0x1E4F5B6B8] expectedFireDateKey];
    v19[2] = v12;
    long long v13 = [v7 nextFireDate];
    long long v14 = v13;
    if (!v13)
    {
      long long v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    v20[2] = v14;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    if (!v13) {

    }
    if (!v10) {
    unint64_t v6 = 0x1E4F5B000;
    }
  }
  else
  {
    long long v15 = 0;
  }
  long long v16 = [*(id *)(v6 + 1720) keyPathForNextAlarm];
  long long v17 = [MEMORY[0x1E4F5B6A8] userContext];
  [v17 setObject:v15 forKeyedSubscript:v16];
}

- (void)writeAlarmToKnowledgeStore:(id)a3 alarmEvent:(unint64_t)a4
{
  id v6 = a3;
  if (a4 <= 7 && ((1 << a4) & 0xA6) != 0)
  {
    id v7 = [(MTCoreDuetMonitor *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MTCoreDuetMonitor_writeAlarmToKnowledgeStore_alarmEvent___block_invoke;
    block[3] = &unk_1E5915258;
    unint64_t v10 = a4;
    block[4] = self;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

void __59__MTCoreDuetMonitor_writeAlarmToKnowledgeStore_alarmEvent___block_invoke(void *a1)
{
  switch(a1[6])
  {
    case 1:
    case 2:
      v1 = (void *)a1[4];
      uint64_t v2 = a1[5];
      uint64_t v3 = [MEMORY[0x1E4F5B480] firing];
      goto LABEL_5;
    case 5:
      v1 = (void *)a1[4];
      uint64_t v2 = a1[5];
      uint64_t v3 = [MEMORY[0x1E4F5B480] stopped];
      goto LABEL_5;
    case 7:
      v1 = (void *)a1[4];
      uint64_t v2 = a1[5];
      uint64_t v3 = [MEMORY[0x1E4F5B480] snoozed];
LABEL_5:
      id v4 = (id)v3;
      objc_msgSend(v1, "_queue_writeAlarmToKnowledgeStore:category:", v2);

      break;
    default:
      return;
  }
}

- (void)_queue_writeAlarmToKnowledgeStore:(id)a3 category:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTCoreDuetMonitor *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [MEMORY[0x1E4F1C9C8] now];
  unint64_t v10 = [MEMORY[0x1E4F5B5F8] alarmStream];
  uint64_t v11 = [(MTCoreDuetMonitor *)self metadataForAlarm:v7];

  int v12 = [MEMORY[0x1E4F5B510] eventWithStream:v10 startDate:v9 endDate:v9 value:v6 metadata:v11];

  long long v13 = [(MTCoreDuetMonitor *)self knowledgeStore];
  v18[0] = v12;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v17 = 0;
  [v13 saveObjects:v14 error:&v17];
  id v15 = v17;

  if (v15)
  {
    long long v16 = MTLogForCategory(3);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MTCoreDuetMonitor _queue_writeAlarmToKnowledgeStore:category:]();
    }
  }
}

- (id)metadataForAlarm:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithCapacity:2];
  id v6 = [v4 alarmID];
  id v7 = [v6 UUIDString];
  id v8 = [MEMORY[0x1E4F5B478] alarmID];
  [v5 setValue:v7 forKey:v8];

  id v9 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v10 = [v4 isSleepAlarm];

  uint64_t v11 = [v9 numberWithBool:v10];
  int v12 = [MEMORY[0x1E4F5B478] isSleep];
  [v5 setObject:v11 forKey:v12];

  return v5;
}

- (void)writeAlarmUpdatedEventForAlarms:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTCoreDuetMonitor *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MTCoreDuetMonitor_writeAlarmUpdatedEventForAlarms___block_invoke;
  v7[3] = &unk_1E5915000;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__MTCoreDuetMonitor_writeAlarmUpdatedEventForAlarms___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    long long v21 = v24;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v7 = *(void **)(*(void *)(a1 + 40) + 32);
        id v8 = objc_msgSend(v6, "alarmID", v21);
        id v9 = [v7 objectForKey:v8];

        if (v9)
        {
          uint64_t v10 = +[MTChangeSet changeSetWithChangesFromObject:v9 toObject:v6];
          if ([v10 hasChangeForProperty:@"MTAlarmLastModifiedDate"])
          {
            if ([v10 hasChangeForProperty:@"MTAlarmEnabled"])
            {
              uint64_t v11 = MTLogForCategory(3);
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                int v12 = [v6 alarmID];
                *(_DWORD *)buf = 138412290;
                v30 = v12;
                _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_INFO, "[Triggers writeAlarmUpdatedEventForAlarms] set isEnableDisableModification for alarm %@", buf, 0xCu);
              }
              int v13 = 1;
            }
            else
            {
              int v13 = 0;
            }
            if (([v10 hasChangeForProperty:@"MTAlarmHour"] & 1) != 0
              || [v10 hasChangeForProperty:@"MTAlarmMinute"])
            {
              long long v16 = MTLogForCategory(3);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                id v17 = [v6 alarmID];
                *(_DWORD *)buf = 138412290;
                v30 = v17;
                _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_INFO, "[Triggers writeAlarmUpdatedEventForAlarms] set isTimeDifferenceModification for alarm %@", buf, 0xCu);
              }
LABEL_26:
              [*(id *)(a1 + 40) writeAlarmEventToBiome:v6 ofType:4];
              goto LABEL_27;
            }
          }
          else
          {
            int v13 = 0;
          }

          if (v13) {
            goto LABEL_26;
          }
        }
        else
        {
          long long v14 = MTLogForCategory(3);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            __53__MTCoreDuetMonitor_writeAlarmUpdatedEventForAlarms___block_invoke_cold_1(&v23, v21, v14);
          }
        }
        id v15 = MTLogForCategory(3);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_INFO, "[Triggers writeAlarmUpdatedEventForAlarms] isTimeDifferenceModification and isEnableDisableModification are false", buf, 2u);
        }

LABEL_27:
        long long v18 = *(void **)(*(void *)(a1 + 40) + 32);
        long long v19 = (void *)[v6 copy];
        long long v20 = [v6 alarmID];
        [v18 setObject:v19 forKey:v20];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v3);
  }
}

- (void)writeAlarmEventToBiome:(id)a3 ofType:(unint64_t)a4
{
  id v5 = a3;
  if (+[MTDeviceListener hasBeenUnlockedSinceBoot])
  {
    id v6 = [MEMORY[0x1E4F504C8] alarmStream];
    id v7 = objc_alloc(MEMORY[0x1E4F502D0]);
    id v8 = [v5 alarmID];
    id v9 = objc_msgSend(v7, "initWithEventType:alarmID:isSleepAlarm:", a4, v8, objc_msgSend(v5, "isSleepAlarm"));

    uint64_t v10 = [v6 source];
    [v10 sendEvent:v9];
  }
  else
  {
    id v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[MTCoreDuetMonitor writeAlarmEventToBiome:ofType:](a4);
    }
  }
}

- (void)writeAlarmEventsToBiome:(id)a3 ofType:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (+[MTDeviceListener hasBeenUnlockedSinceBoot])
  {
    id v6 = [MEMORY[0x1E4F504C8] alarmStream];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
          id v13 = objc_alloc(MEMORY[0x1E4F502D0]);
          long long v14 = [v12 alarmID];
          id v15 = objc_msgSend(v13, "initWithEventType:alarmID:isSleepAlarm:", a4, v14, objc_msgSend(v12, "isSleepAlarm"));

          long long v16 = [v6 source];
          [v16 sendEvent:v15];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v5 = v17;
  }
  else
  {
    id v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[MTCoreDuetMonitor writeAlarmEventToBiome:ofType:](a4);
    }
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (NSMutableDictionary)alarmStatesByAlarmID
{
  return self->_alarmStatesByAlarmID;
}

- (NSMutableDictionary)alarmsByID
{
  return self->_alarmsByID;
}

- (_CDClientContext)context
{
  return self->_context;
}

- (_DKKnowledgeStore)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_alarmStatesByAlarmID, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)source:didAddAlarms:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_19CC95000, v0, v1, "[Triggers] %{public}@ didAddAlarms: %{public}@");
}

- (void)source:didUpdateAlarms:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_19CC95000, v0, v1, "[Triggers] %{public}@ didUpdateAlarms: %{public}@");
}

- (void)source:didChangeNextAlarm:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_19CC95000, v0, v1, "[Triggers] %{public}@ didChangeNextAlarm: %{public}@");
}

- (void)source:(uint64_t)a1 didDismissAlarm:(uint64_t)a2 dismissAction:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3(&dword_19CC95000, v3, v4, "[Triggers] %{public}@ Ignoring dismissAction (%{public}@)", v5, v6, v7, v8, v9);
}

- (void)source:(uint64_t)a1 didFireAlarm:(uint64_t)a2 triggerType:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3(&dword_19CC95000, v3, v4, "[Triggers] %{public}@ Ignoring triggerType (%{public}@)", v5, v6, v7, v8, v9);
}

- (void)source:didRemoveAlarms:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_19CC95000, v0, v1, "[Triggers] %{public}@ didRemoveAlarms: %{public}@");
}

- (void)_queue_writeAlarmToKnowledgeStore:category:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_19CC95000, v0, OS_LOG_TYPE_ERROR, "%{public}@ could not save objects to knowledge store with error: %{public}@", v1, 0x16u);
}

void __53__MTCoreDuetMonitor_writeAlarmUpdatedEventForAlarms___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "[Triggers writeAlarmUpdatedEventForAlarms] could not find old alarm", buf, 2u);
}

- (void)writeAlarmEventToBiome:(uint64_t)a1 ofType:.cold.1(uint64_t a1)
{
  os_log_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_4_1(&dword_19CC95000, v2, v3, "Did NOT save alarm biome event of type: %@ because device is class c locked", v4, v5, v6, v7, 2u);
}

@end