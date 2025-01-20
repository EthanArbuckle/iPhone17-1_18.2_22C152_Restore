@interface TPSEventsHistoryController
+ (void)removeEventHistoryCache;
- (NSDictionary)contextualEventsForIdentifiers;
- (NSMutableDictionary)contextualEventIdentifierToContextualEventMap;
- (OS_dispatch_queue)eventQueue;
- (TPSEventsHistoryController)initWithTipStatusController:(id)a3;
- (TPSTipStatusController)tipStatusController;
- (id)_contextualEventForIdentifier:(id)a3;
- (id)allContextualEvents;
- (id)contextualEventsBySourceMap;
- (id)contextualEventsForIdentifiers:(id)a3;
- (id)debugDescription;
- (void)_addEvents:(id)a3 contentIdentifier:(id)a4 eventSinceDate:(id)a5 minObservationCount:(unint64_t)a6;
- (void)_persistUserInfo:(id)a3 forObserverIdentifiers:(id)a4;
- (void)_setContextualEvent:(id)a3 forIdentifier:(id)a4;
- (void)addEventsFromTriggerEvents:(id)a3 desiredOutcomeEvents:(id)a4 contentIdentifier:(id)a5 eventSinceDate:(id)a6;
- (void)processEventProviderQueryResults:(id)a3 completionHandler:(id)a4;
- (void)removeCacheData;
- (void)removeObserverIdentifiers:(id)a3;
- (void)removeObserverIdentifiers:(id)a3 fromEventIdentifiers:(id)a4;
- (void)restartTrackingForEventIdentifiers:(id)a3 date:(id)a4;
- (void)setContextualEventIdentifierToContextualEventMap:(id)a3;
- (void)setContextualEventsForIdentifiers:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setTipStatusController:(id)a3;
- (void)updateCacheData;
@end

@implementation TPSEventsHistoryController

+ (void)removeEventHistoryCache
{
}

- (TPSEventsHistoryController)initWithTipStatusController:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSEventsHistoryController;
  v6 = [(TPSEventsHistoryController *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tipStatusController, a3);
    v8 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [MEMORY[0x1E4FAF4B0] unarchivedObjectOfClasses:v11 forKey:@"DeliveryEventIdentifierToDeliveryEventMap"];
    contextualEventIdentifierToContextualEventMap = v7->_contextualEventIdentifierToContextualEventMap;
    v7->_contextualEventIdentifierToContextualEventMap = (NSMutableDictionary *)v12;

    if (!v7->_contextualEventIdentifierToContextualEventMap)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
      v15 = v7->_contextualEventIdentifierToContextualEventMap;
      v7->_contextualEventIdentifierToContextualEventMap = (NSMutableDictionary *)v14;
    }
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.tips.TPSEventsHistoryController.eventQueue", v16);
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = (OS_dispatch_queue *)v17;
  }
  return v7;
}

- (NSDictionary)contextualEventsForIdentifiers
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  v3 = [(TPSEventsHistoryController *)self eventQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__TPSEventsHistoryController_contextualEventsForIdentifiers__block_invoke;
  v6[3] = &unk_1E6E6B758;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __60__TPSEventsHistoryController_contextualEventsForIdentifiers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) contextualEventIdentifierToContextualEventMap];
  uint64_t v3 = [v5 count];
  if (v3)
  {
    v1 = [*(id *)(a1 + 32) contextualEventIdentifierToContextualEventMap];
    id v4 = (void *)[v1 copy];
  }
  else
  {
    id v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (v3)
  {
  }
}

- (id)contextualEventsBySourceMap
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__15;
  id v14 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__15;
  v7[4] = __Block_byref_object_dispose__15;
  id v8 = 0;
  uint64_t v3 = [(TPSEventsHistoryController *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__TPSEventsHistoryController_contextualEventsBySourceMap__block_invoke;
  block[3] = &unk_1E6E6C828;
  block[4] = self;
  block[5] = v7;
  block[6] = &v9;
  dispatch_sync(v3, block);

  id v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);

  return v4;
}

void __57__TPSEventsHistoryController_contextualEventsBySourceMap__block_invoke(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 32) allValues];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *(id *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "matchedDate", (void)v21);
        if (v11)
        {
          id v12 = (void *)v11;
          uint64_t v13 = [v10 status];

          if (v13) {
            continue;
          }
        }
        uint64_t v14 = [v10 type];
        v15 = [NSNumber numberWithInteger:v14];
        v16 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:v15];
        if (!v16)
        {
          v16 = [MEMORY[0x1E4F1CA48] array];
          dispatch_queue_t v17 = *(void **)(*(void *)(a1[6] + 8) + 40);
          if (!v17)
          {
            uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
            uint64_t v19 = *(void *)(a1[6] + 8);
            objc_super v20 = *(void **)(v19 + 40);
            *(void *)(v19 + 40) = v18;

            dispatch_queue_t v17 = *(void **)(*(void *)(a1[6] + 8) + 40);
          }
          [v17 setObject:v16 forKeyedSubscript:v15];
        }
        [v16 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

- (id)allContextualEvents
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__15;
  uint64_t v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  uint64_t v3 = [(TPSEventsHistoryController *)self eventQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__TPSEventsHistoryController_allContextualEvents__block_invoke;
  v6[3] = &unk_1E6E6B758;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __49__TPSEventsHistoryController_allContextualEvents__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) allValues];

  return MEMORY[0x1F41817F8]();
}

- (id)contextualEventsForIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[TPSEventsHistoryController _contextualEventForIdentifier:](self, "_contextualEventForIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];

  return v12;
}

- (id)_contextualEventForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__15;
  long long v16 = __Block_byref_object_dispose__15;
  id v17 = 0;
  id v5 = [(TPSEventsHistoryController *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TPSEventsHistoryController__contextualEventForIdentifier___block_invoke;
  block[3] = &unk_1E6E6C550;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __60__TPSEventsHistoryController__contextualEventForIdentifier___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)_setContextualEvent:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(TPSEventsHistoryController *)self eventQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__TPSEventsHistoryController__setContextualEvent_forIdentifier___block_invoke;
  v11[3] = &unk_1E6E6C850;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__TPSEventsHistoryController__setContextualEvent_forIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [WeakRetained contextualEventIdentifierToContextualEventMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)_addEvents:(id)a3 contentIdentifier:(id)a4 eventSinceDate:(id)a5 minObservationCount:(unint64_t)a6
{
  unint64_t v22 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v9;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
        id v17 = objc_msgSend(MEMORY[0x1E4FAF440], "identifierFromEventInfoDictionary:", v16, v22);
        uint64_t v18 = [(TPSEventsHistoryController *)self _contextualEventForIdentifier:v17];
        if (v18)
        {
          if (!v11) {
            goto LABEL_9;
          }
LABEL_8:
          [v18 setEventSinceDate:v11];
          [v18 setMatchedDate:0];
          [v18 removeAllObservations];
          goto LABEL_9;
        }
        uint64_t v19 = [[TPSContextualEventBuilder alloc] initWithDictionary:v16];
        objc_super v20 = [(TPSContextualEventBuilder *)v19 contextualEvent];
        uint64_t v18 = v20;
        if (v20)
        {
          if (v22 != 0x7FFFFFFFFFFFFFFFLL && [v20 status] == 1) {
            [v18 setMinObservationCount:v22];
          }
          [(TPSEventsHistoryController *)self _setContextualEvent:v18 forIdentifier:v17];
        }

        if (v11) {
          goto LABEL_8;
        }
LABEL_9:
        [v18 addObserverIdentifier:v10];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v21 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v13 = v21;
    }
    while (v21);
  }
}

- (void)addEventsFromTriggerEvents:(id)a3 desiredOutcomeEvents:(id)a4 contentIdentifier:(id)a5 eventSinceDate:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v15)
  {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if ([MEMORY[0x1E4FAF3F8] isInternalDevice])
    {
      uint64_t v14 = [MEMORY[0x1E4FAF450] triggerMinObservationCount];
      if ((unint64_t)(v14 - 1) < 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v13 = v14;
      }
    }
    [(TPSEventsHistoryController *)self _addEvents:v15 contentIdentifier:v11 eventSinceDate:v12 minObservationCount:v13];
  }
  if (v10) {
    [(TPSEventsHistoryController *)self _addEvents:v10 contentIdentifier:v11 eventSinceDate:v12 minObservationCount:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (void)processEventProviderQueryResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  if ([v6 count])
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    objc_super v20 = __Block_byref_object_copy__15;
    uint64_t v21 = __Block_byref_object_dispose__15;
    id v22 = 0;
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__15;
    id v15 = __Block_byref_object_dispose__15;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke;
    v10[3] = &unk_1E6E6C8A0;
    v10[4] = self;
    v10[5] = &v17;
    v10[6] = &v11;
    [v6 enumerateObjectsUsingBlock:v10];
    [(id)v18[5] minusSet:v12[5]];
    uint64_t v8 = [(id)v18[5] allObjects];
    id v9 = [(id)v12[5] allObjects];
    v7[2](v7, v8, v9);

    [(TPSEventsHistoryController *)self updateCacheData];
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

void __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) _contextualEventForIdentifier:v4];
  if (v5)
  {
    id v6 = [v3 resultDate];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v9 = v8;

    uint64_t v10 = [v5 eventSinceDate];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v12 = [v5 eventSinceDate];
      uint64_t v13 = [v12 compare:v9];

      if (v13 == 1)
      {
        uint64_t v14 = [MEMORY[0x1E4FAF480] discoverability];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v5 eventSinceDate];
          *(_DWORD *)buf = 138412546;
          v47 = v15;
          __int16 v48 = 2112;
          uint64_t v49 = (uint64_t)v9;
          _os_log_impl(&dword_1E4492000, v14, OS_LOG_TYPE_DEFAULT, "Event since date (%@) for delivery event is later in time than result date (%@). Skipping result...", buf, 0x16u);
        }
        goto LABEL_30;
      }
    }
    id v16 = [v9 dateByAddingTimeInterval:-180.0];
    [v5 setEventSinceDate:v16];

    uint64_t v17 = [v3 bookmark];
    [v5 setBookmark:v17];

    uint64_t v18 = [v3 bookmark];

    if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4FAF480] discoverability];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_2(v3);
      }
    }
    objc_super v20 = [v3 observationMap];
    int v21 = [v5 observedWithResults:v20];

    id v22 = [v5 observerIdentifiers];
    long long v23 = [v22 allObjects];

    long long v24 = [v5 observationMap];

    if (v24)
    {
      long long v25 = [v5 observationMap];
      long long v26 = [v25 allValues];

      long long v27 = [MEMORY[0x1E4FAF480] discoverability];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v38 = [v3 identifier];
        *(_DWORD *)buf = 138412802;
        v47 = v38;
        __int16 v48 = 2048;
        uint64_t v49 = [v26 count];
        __int16 v50 = 1024;
        int v51 = [v5 minObservationCount];
        _os_log_impl(&dword_1E4492000, v27, OS_LOG_TYPE_DEFAULT, "Event %@, current observation count: %zd. Expected observation count: %d ", buf, 0x1Cu);
      }
      v28 = [MEMORY[0x1E4FAF480] discoverability];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_1(v5);
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_15;
    aBlock[3] = &unk_1E6E6C878;
    uint64_t v45 = *(void *)(a1 + 40);
    id v29 = v5;
    id v40 = v29;
    id v41 = v9;
    uint64_t v14 = v23;
    uint64_t v30 = *(void *)(a1 + 32);
    v42 = v14;
    uint64_t v43 = v30;
    id v44 = v3;
    v31 = (void (**)(void *, id))_Block_copy(aBlock);
    if ([v29 status] == 1)
    {
      if (!v21) {
        goto LABEL_29;
      }
    }
    else if (v21)
    {
      v32 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v32)
      {
        uint64_t v33 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v34 = *(void *)(*(void *)(a1 + 48) + 8);
        v35 = *(void **)(v34 + 40);
        *(void *)(v34 + 40) = v33;

        v32 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      [v32 addObjectsFromArray:v14];
      v36 = [MEMORY[0x1E4FAF480] discoverability];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [v29 identifier];
        *(_DWORD *)buf = 138412290;
        v47 = v37;
        _os_log_impl(&dword_1E4492000, v36, OS_LOG_TYPE_DEFAULT, "Event %@ invalidated due to absent event observed.", buf, 0xCu);
      }
      goto LABEL_29;
    }
    v31[2](v31, v29);
LABEL_29:

LABEL_30:
  }
}

void __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  [*(id *)(a1 + 32) setMatchedDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setBookmark:0];
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "addObjectsFromArray:");
    id v7 = *(void **)(a1 + 56);
    id v8 = [*(id *)(a1 + 64) userInfo];
    [v7 _persistUserInfo:v8 forObserverIdentifiers:*(void *)(a1 + 48)];
  }
  id v9 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    uint64_t v11 = [*(id *)(a1 + 32) matchedDate];
    int v12 = 138412546;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_impl(&dword_1E4492000, v9, OS_LOG_TYPE_DEFAULT, "Event %@, matched at %@.", (uint8_t *)&v12, 0x16u);
  }
}

- (void)_persistUserInfo:(id)a3 forObserverIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__TPSEventsHistoryController__persistUserInfo_forObserverIdentifiers___block_invoke;
    v8[3] = &unk_1E6E6C188;
    id v9 = v6;
    uint64_t v10 = self;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

void __70__TPSEventsHistoryController__persistUserInfo_forObserverIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__TPSEventsHistoryController__persistUserInfo_forObserverIdentifiers___block_invoke_2;
  v6[3] = &unk_1E6E6C8C8;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __70__TPSEventsHistoryController__persistUserInfo_forObserverIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 tipStatusController];
  [v8 updateUserInfoForIdentifier:*(void *)(a1 + 40) key:v7 value:v6];

  id v9 = [*(id *)(a1 + 32) tipStatusController];
  [v9 updateCacheData];
}

- (void)removeObserverIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  id v6 = [(TPSEventsHistoryController *)self eventQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__TPSEventsHistoryController_removeObserverIdentifiers___block_invoke;
  v9[3] = &unk_1E6E6C850;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __56__TPSEventsHistoryController_removeObserverIdentifiers___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained contextualEventIdentifierToContextualEventMap];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __56__TPSEventsHistoryController_removeObserverIdentifiers___block_invoke_2;
  id v8 = &unk_1E6E6C8F0;
  id v9 = a1[4];
  id v10 = a1[5];
  [v3 enumerateKeysAndObjectsUsingBlock:&v5];

  id v4 = objc_msgSend(WeakRetained, "contextualEventIdentifierToContextualEventMap", v5, v6, v7, v8);
  [v4 removeObjectsForKeys:a1[5]];
}

void __56__TPSEventsHistoryController_removeObserverIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [v6 removeObserverIdentifiers:*(void *)(a1 + 32)];
  if ([v6 canBeRemoved])
  {
    [*(id *)(a1 + 40) addObject:v5];
    id v7 = [MEMORY[0x1E4FAF480] discoverability];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 description];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1E4492000, v7, OS_LOG_TYPE_DEFAULT, "Remove unused contextualEvent: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)removeObserverIdentifiers:(id)a3 fromEventIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(TPSEventsHistoryController *)self eventQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__TPSEventsHistoryController_removeObserverIdentifiers_fromEventIdentifiers___block_invoke;
  v11[3] = &unk_1E6E6C850;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __77__TPSEventsHistoryController_removeObserverIdentifiers_fromEventIdentifiers___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__TPSEventsHistoryController_removeObserverIdentifiers_fromEventIdentifiers___block_invoke_2;
  v7[3] = &unk_1E6E6C918;
  v7[4] = WeakRetained;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v7];
  id v6 = [WeakRetained contextualEventIdentifierToContextualEventMap];
  [v6 removeObjectsForKeys:v5];
}

void __77__TPSEventsHistoryController_removeObserverIdentifiers_fromEventIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) contextualEventIdentifierToContextualEventMap];
  id v5 = [v4 objectForKeyedSubscript:v3];

  [v5 removeObserverIdentifiers:*(void *)(a1 + 40)];
  if ([v5 canBeRemoved])
  {
    [*(id *)(a1 + 48) addObject:v3];
    id v6 = [MEMORY[0x1E4FAF480] discoverability];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 debugDescription];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_1E4492000, v6, OS_LOG_TYPE_DEFAULT, "Remove unused contextualEvent: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)restartTrackingForEventIdentifiers:(id)a3 date:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TPSEventsHistoryController *)self contextualEventsForIdentifiers:v6];
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v10 = v9;
  uint64_t v11 = [MEMORY[0x1E4FAF480] discoverability];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1E4492000, v11, OS_LOG_TYPE_DEFAULT, "Restart tracking for event identifiers: %@ on %@", buf, 0x16u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v17, "setMatchedDate:", 0, (void)v18);
        [v17 removeAllObservations];
        [v17 setEventSinceDate:v10];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)updateCacheData
{
  objc_initWeak(&location, self);
  id v3 = [(TPSEventsHistoryController *)self eventQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__TPSEventsHistoryController_updateCacheData__block_invoke;
  v4[3] = &unk_1E6E6C940;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__TPSEventsHistoryController_updateCacheData__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)MEMORY[0x1E4FAF4B0];
  uint64_t v2 = [WeakRetained contextualEventIdentifierToContextualEventMap];
  [v1 archivedDataWithRootObject:v2 forKey:@"DeliveryEventIdentifierToDeliveryEventMap"];
}

- (void)removeCacheData
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4492000, log, OS_LOG_TYPE_DEBUG, "Remove TPSEventHistoryController cache.", v1, 2u);
}

void __45__TPSEventsHistoryController_removeCacheData__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained contextualEventIdentifierToContextualEventMap];
  [v1 removeAllObjects];

  [WeakRetained updateCacheData];
}

- (id)debugDescription
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@", self];
  [v3 appendFormat:@"%@ = %@\n", @"DeliveryEventIdentifierToDeliveryEventMap", self->_contextualEventIdentifierToContextualEventMap];

  return v3;
}

- (void)setContextualEventsForIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (void)setTipStatusController:(id)a3
{
}

- (NSMutableDictionary)contextualEventIdentifierToContextualEventMap
{
  return self->_contextualEventIdentifierToContextualEventMap;
}

- (void)setContextualEventIdentifierToContextualEventMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualEventIdentifierToContextualEventMap, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);

  objc_storeStrong((id *)&self->_contextualEventsForIdentifiers, 0);
}

void __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_1(void *a1)
{
  v1 = [a1 observationMap];
  OUTLINED_FUNCTION_2(&dword_1E4492000, v2, v3, "Dates: %@", v4, v5, v6, v7, 2u);
}

void __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_2(void *a1)
{
  v1 = [a1 bookmark];
  OUTLINED_FUNCTION_2(&dword_1E4492000, v2, v3, "Bookmark: %@", v4, v5, v6, v7, 2u);
}

@end