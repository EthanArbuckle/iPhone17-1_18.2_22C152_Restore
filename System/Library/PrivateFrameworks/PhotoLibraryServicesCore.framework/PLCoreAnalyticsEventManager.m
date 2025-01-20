@interface PLCoreAnalyticsEventManager
- (BOOL)allowEventPublish;
- (BOOL)hasEventWithName:(id)a3;
- (PLCoreAnalyticsEventManager)init;
- (id)_eventForEventName:(id)a3;
- (id)description;
- (id)descriptionForEventName:(id)a3;
- (id)rawEventForEventName:(id)a3;
- (id)valueForKey:(id)a3 onEventWithName:(id)a4;
- (void)_setPayloadValue:(id)a3 forKey:(id)a4 onEventWithName:(id)a5 eventBlock:(id)a6;
- (void)addRecordingTimedEventSnippetWithToken:(double)a3 forKey:(id)a4 onEventWithName:(id)a5;
- (void)mergePayload:(id)a3 onEventWithName:(id)a4;
- (void)publishAllEvents;
- (void)publishEventWithName:(id)a3;
- (void)removeEventWithName:(id)a3;
- (void)removePayloadValueForKey:(id)a3 onEventWithName:(id)a4;
- (void)setAllowEventPublish:(BOOL)a3;
- (void)setPayloadValue:(id)a3 forKey:(id)a4 onEventWithName:(id)a5;
- (void)setPayloadValue:(id)a3 forKey:(id)a4 onlyOnExistingEventWithName:(id)a5;
- (void)stopRecordingTimedEventWithToken:(double)a3 forKey:(id)a4 onEventWithName:(id)a5;
@end

@implementation PLCoreAnalyticsEventManager

- (void).cxx_destruct
{
}

- (void)setAllowEventPublish:(BOOL)a3
{
  self->_allowEventPublish = a3;
}

- (BOOL)allowEventPublish
{
  return self->_allowEventPublish;
}

- (void)publishAllEvents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableDictionary count](self->_eventMap, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__PLCoreAnalyticsEventManager_publishAllEvents__block_invoke;
  v14[3] = &unk_1E58A1EF8;
  id v4 = v3;
  id v15 = v4;
  v16 = self;
  PLRunWithUnfairLock(&self->_lock, v14);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v17 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "publish", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v17 count:16];
    }
    while (v7);
  }
}

uint64_t __47__PLCoreAnalyticsEventManager_publishAllEvents__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(*(void *)(a1 + 40) + 8) allValues];
  [v2 addObjectsFromArray:v3];

  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  return [v4 removeAllObjects];
}

- (void)publishEventWithName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    long long v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__3707;
    id v15 = __Block_byref_object_dispose__3708;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__PLCoreAnalyticsEventManager_publishEventWithName___block_invoke;
    v8[3] = &unk_1E589F9F8;
    v8[4] = self;
    long long v10 = &v11;
    id v6 = v4;
    id v9 = v6;
    PLRunWithUnfairLock(&self->_lock, v8);
    if ([(PLCoreAnalyticsEventManager *)self allowEventPublish])
    {
      [(id)v12[5] publish];
    }
    else
    {
      uint64_t v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v6;
        _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_DEFAULT, "CoreAnalyticsEventManager: publish to Core Analytics is disabled for event: %{public}@", buf, 0xCu);
      }
    }
    _Block_object_dispose(&v11, 8);
  }
}

uint64_t __52__PLCoreAnalyticsEventManager_publishEventWithName___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if (result)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _eventForEventName:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v7 removeObjectForKey:v6];
  }
  return result;
}

- (void)addRecordingTimedEventSnippetWithToken:(double)a3 forKey:(id)a4 onEventWithName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  if (a3 > 0.0 && v8 != 0 && v9 != 0)
  {
    double v13 = Current;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __93__PLCoreAnalyticsEventManager_addRecordingTimedEventSnippetWithToken_forKey_onEventWithName___block_invoke;
    v14[3] = &unk_1E589F9D0;
    void v14[4] = self;
    id v15 = v9;
    id v16 = v8;
    double v17 = v13;
    double v18 = a3;
    PLRunWithUnfairLock(&self->_lock, v14);
  }
}

void __93__PLCoreAnalyticsEventManager_addRecordingTimedEventSnippetWithToken_forKey_onEventWithName___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) _eventForEventName:*(void *)(a1 + 40)];
  v2 = [v9 payload];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v3 doubleValue];
  double v5 = v4;

  double v6 = v5 + *(double *)(a1 + 56) - *(double *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:v6];
  [v9 addKey:v7 value:v8];
}

- (void)stopRecordingTimedEventWithToken:(double)a3 forKey:(id)a4 onEventWithName:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  if (a3 > 0.0)
  {
    long long v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:Current - a3];
    [(PLCoreAnalyticsEventManager *)self setPayloadValue:v10 forKey:v11 onEventWithName:v8];
  }
}

- (id)rawEventForEventName:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3707;
  id v16 = __Block_byref_object_dispose__3708;
  id v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__PLCoreAnalyticsEventManager_rawEventForEventName___block_invoke;
    v9[3] = &unk_1E589F9F8;
    id v11 = &v12;
    v9[4] = self;
    id v10 = v4;
    PLRunWithUnfairLock(&self->_lock, v9);

    double v6 = (void *)v13[5];
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __52__PLCoreAnalyticsEventManager_rawEventForEventName___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (void)removeEventWithName:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__PLCoreAnalyticsEventManager_removeEventWithName___block_invoke;
    v7[3] = &unk_1E58A1EF8;
    v7[4] = self;
    id v8 = v4;
    PLRunWithUnfairLock(&self->_lock, v7);
  }
  else
  {
    double v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = 0;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __51__PLCoreAnalyticsEventManager_removeEventWithName___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (BOOL)hasEventWithName:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = -[PLCoreAnalyticsEventManager rawEventForEventName:](self, "rawEventForEventName:");
    BOOL v4 = v3 != 0;
  }
  else
  {
    double v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      uint64_t v8 = 0;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    return 0;
  }
  return v4;
}

- (void)removePayloadValueForKey:(id)a3 onEventWithName:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PLCoreAnalyticsEventManager_removePayloadValueForKey_onEventWithName___block_invoke;
    v10[3] = &unk_1E58A1508;
    v10[4] = self;
    id v11 = v7;
    id v12 = v6;
    PLRunWithUnfairLock(&self->_lock, v10);
  }
  else
  {
    uint64_t v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@ key: %{public}@", buf, 0x16u);
    }
  }
}

void __72__PLCoreAnalyticsEventManager_removePayloadValueForKey_onEventWithName___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _eventForEventName:*(void *)(a1 + 40)];
  [v2 removeKey:*(void *)(a1 + 48)];
}

- (void)mergePayload:(id)a3 onEventWithName:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PLCoreAnalyticsEventManager_mergePayload_onEventWithName___block_invoke;
    v10[3] = &unk_1E58A1508;
    v10[4] = self;
    id v11 = v7;
    id v12 = v6;
    PLRunWithUnfairLock(&self->_lock, v10);
  }
  else
  {
    uint64_t v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@ payload: %{public}@", buf, 0x16u);
    }
  }
}

void __60__PLCoreAnalyticsEventManager_mergePayload_onEventWithName___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _eventForEventName:*(void *)(a1 + 40)];
  [v2 mergePayload:*(void *)(a1 + 48)];
}

- (void)setPayloadValue:(id)a3 forKey:(id)a4 onlyOnExistingEventWithName:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PLCoreAnalyticsEventManager_setPayloadValue_forKey_onlyOnExistingEventWithName___block_invoke;
  v10[3] = &unk_1E589F9A8;
  id v11 = v8;
  id v9 = v8;
  [(PLCoreAnalyticsEventManager *)self _setPayloadValue:a3 forKey:a4 onEventWithName:v9 eventBlock:v10];
}

id __82__PLCoreAnalyticsEventManager_setPayloadValue_forKey_onlyOnExistingEventWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  BOOL v4 = [v3[1] objectForKeyedSubscript:*(void *)(a1 + 32)];

  return v4;
}

- (void)setPayloadValue:(id)a3 forKey:(id)a4 onEventWithName:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PLCoreAnalyticsEventManager_setPayloadValue_forKey_onEventWithName___block_invoke;
  v10[3] = &unk_1E589F9A8;
  id v11 = v8;
  id v9 = v8;
  [(PLCoreAnalyticsEventManager *)self _setPayloadValue:a3 forKey:a4 onEventWithName:v9 eventBlock:v10];
}

id __70__PLCoreAnalyticsEventManager_setPayloadValue_forKey_onEventWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 _eventForEventName:*(void *)(a1 + 32)];

  return v4;
}

- (void)_setPayloadValue:(id)a3 forKey:(id)a4 onEventWithName:(id)a5 eventBlock:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (!v11 || !v12)
  {
    __int16 v15 = PLBackendGetLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138543874;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v11;
    __int16 v27 = 2114;
    id v28 = v10;
    id v16 = "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@ key: %{public}@ value: %{public}@";
    uint64_t v17 = v15;
    uint32_t v18 = 32;
LABEL_7:
    _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_8;
  }
  if (v10)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__PLCoreAnalyticsEventManager__setPayloadValue_forKey_onEventWithName_eventBlock___block_invoke;
    v19[3] = &unk_1E589F980;
    v22 = v13;
    v19[4] = self;
    id v20 = v10;
    id v21 = v11;
    PLRunWithUnfairLock(&self->_lock, v19);

    __int16 v15 = v22;
    goto LABEL_8;
  }
  if ([v11 isEqualToString:@"error"]) {
    goto LABEL_9;
  }
  __int16 v15 = PLBackendGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v11;
    id v16 = "CoreAnalyticsEventManager: invalid value for event name: %{public}@ key: %{public}@";
    uint64_t v17 = v15;
    uint32_t v18 = 22;
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
}

void __82__PLCoreAnalyticsEventManager__setPayloadValue_forKey_onEventWithName_eventBlock___block_invoke(uint64_t a1)
{
  id v2 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (v2)
  {
    id v6 = v2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v4 = *(void *)(a1 + 48);
    if (isKindOfClass)
    {
      double v5 = build_error_event_string(*(void **)(a1 + 40));
      [v6 addKey:v4 value:v5];
    }
    else
    {
      [v6 addKey:*(void *)(a1 + 48) value:*(void *)(a1 + 40)];
    }
    id v2 = v6;
  }
}

- (id)valueForKey:(id)a3 onEventWithName:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__PLCoreAnalyticsEventManager_valueForKey_onEventWithName___block_invoke;
    v12[3] = &unk_1E589F958;
    v12[4] = self;
    id v13 = v7;
    id v14 = v6;
    id v9 = PLResultWithUnfairLock(&self->_lock, v12);
  }
  else
  {
    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@ key: %{public}@", buf, 0x16u);
    }

    id v9 = 0;
  }

  return v9;
}

id __59__PLCoreAnalyticsEventManager_valueForKey_onEventWithName___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _eventForEventName:*(void *)(a1 + 40)];
  id v3 = [v2 payload];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];

  return v4;
}

- (id)_eventForEventName:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMutableDictionary *)self->_eventMap objectForKeyedSubscript:v4];
  if (!v5)
  {
    double v5 = [[PLCoreAnalyticsEvent alloc] initWithEvent:v4 payload:0];
    [(NSMutableDictionary *)self->_eventMap setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)descriptionForEventName:(id)a3
{
  id v3 = [(PLCoreAnalyticsEventManager *)self _eventForEventName:a3];
  id v4 = [v3 debugDescription];

  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PLCoreAnalyticsEventManager;
  id v3 = [(PLCoreAnalyticsEventManager *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" Events: %@", self->_eventMap];

  return v4;
}

- (PLCoreAnalyticsEventManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLCoreAnalyticsEventManager;
  id v2 = [(PLCoreAnalyticsEventManager *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    eventMap = v2->_eventMap;
    v2->_eventMap = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_allowEventPublish = 1;
  }
  return v2;
}

@end