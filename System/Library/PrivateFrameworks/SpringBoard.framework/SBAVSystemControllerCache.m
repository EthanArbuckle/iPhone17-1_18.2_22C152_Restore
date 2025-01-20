@interface SBAVSystemControllerCache
+ (SBAVSystemControllerCache)sharedInstance;
- (BOOL)isAirplayDisplayActive;
- (BOOL)isAudioSessionPlaying;
- (BOOL)isFullyMuted;
- (BOOL)isRingerMuted;
- (NSArray)activeOutputDevices;
- (NSArray)pickableRoutes;
- (NSDictionary)activeAudioRouteInfo;
- (NSString)activeAudioRoute;
- (NSString)activeCategoryName;
- (OS_dispatch_workloop)avscOperationsWorkloop;
- (SBAVSystemControllerCache)init;
- (SBAVSystemControllerCache)initWithCallOutQueue:(id)a3 notificationCenter:(id)a4 dataProviderInitializer:(id)a5;
- (id)_backgroundQueryQueue_rebuildDataProvider;
- (id)_queryActiveOutputDevicesFromContext:(id)a3;
- (id)_queue_backgroundQueryCancellationSignalForNotificationCreatingIfNecessary:(id)a3;
- (void)_backgroundQueryQueue_rebuildDataProvider;
- (void)_queue_finishRebuildingCacheWithDataProvider:(id)a3 serverDeathSignal:(id)a4;
- (void)_queue_notifyObserversWithBlock:(id)a3;
- (void)_queue_rebuildCache;
- (void)_queue_signalBackgroundQueryCancellationForNotification:(id)a3;
- (void)_queue_updateActiveAudioRouteFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7;
- (void)_queue_updateActiveCategoryNameFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7;
- (void)_queue_updateActiveOutputDevicesFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7;
- (void)_queue_updateAirplayDisplayActiveFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7;
- (void)_queue_updateAudioSessionPlayingFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7;
- (void)_queue_updateFullyMutedFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7;
- (void)_queue_updatePickableRoutesFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7;
- (void)_queue_updateRingerMutedFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7;
- (void)_receiveUpdatedValueFromNotification:(id)a3;
- (void)_serverDied:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)fetchPickableRoutesWithCompletion:(id)a3;
@end

@implementation SBAVSystemControllerCache

- (void)_receiveUpdatedValueFromNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  v6 = [v4 name];
  v7 = [v4 userInfo];

  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke;
  v12[3] = &unk_1E6AF59B8;
  id v13 = v5;
  v14 = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(queue, v12);
}

- (void)_queue_updateAudioSessionPlayingFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  v14 = (void (**)(void))a6;
  id v15 = a7;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v26[3] = &unk_1E6AFD698;
  BOOL v28 = v10;
  v26[4] = self;
  id v16 = v15;
  id v27 = v16;
  v17 = (void (**)(void, void))MEMORY[0x1D948C7A0](v26);
  if (v10)
  {
    if (!v12)
    {
      v19 = self->_queue_dataProvider;
      backgroundQueryQueue = self->_backgroundQueryQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_60;
      block[3] = &unk_1E6AFD648;
      v22 = v19;
      v23 = self;
      id v24 = v13;
      v25 = v17;
      v18 = v19;
      dispatch_async(backgroundQueryQueue, block);

      goto LABEL_7;
    }
    v18 = [v12 objectForKey:*MEMORY[0x1E4F74EA0]];
    v14[2](v14);
  }
  else
  {
    v18 = [(SBAVSystemControllerDataProviding *)self->_queue_dataProvider attributeForKey:*MEMORY[0x1E4F74C78]];
  }
  ((void (**)(void, SBAVSystemControllerDataProviding *))v17)[2](v17, v18);
LABEL_7:
}

uint64_t __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = [a2 count] != 0;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned __int8 *)(v4 + 98) != v3)
    {
      *(unsigned char *)(v4 + 98) = v3;
      v5 = SBLogAVSystemControllerCache();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 98);
        *(_DWORD *)buf = 67109120;
        int v14 = v6;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updated audioSessionPlaying to %{BOOL}i", buf, 8u);
      }

      v7 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_56;
      v11[3] = &unk_1E6AFD670;
      v11[4] = v7;
      char v12 = v3;
      objc_msgSend(v7, "_queue_notifyObserversWithBlock:", v11);
    }
  }
  else
  {
    *(unsigned char *)(v4 + 98) = v3;
    v8 = SBLogAVSystemControllerCache();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 98);
      *(_DWORD *)buf = 67109120;
      int v14 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Initialized audioSessionPlaying to %{BOOL}i", buf, 8u);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = (uint64_t *)(a1 + 32);
  uint64_t v6 = *(void *)(v4 + 56);
  if (v3 != v6 || v6 == 0)
  {
    uint64_t v8 = *(void *)(v4 + 48);
    if (v3 != v8 || v8 == 0)
    {
      BOOL v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = objc_opt_class();
      objc_msgSend(v10, "stringWithFormat:", @"sender: <%@:%p>; data provider: <%@:%p>, output context: <%@:%p>",
        v11,
        v12,
        v13,
        *(void *)(*(void *)(a1 + 40) + 56),
        objc_opt_class(),
      int v14 = *(void *)(*(void *)(a1 + 40) + 48));
      uint64_t v15 = SBLogAVSystemControllerCache();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v16;
        __int16 v38 = 2114;
        v39 = v14;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring notification '%{public}@' from %{public}@", buf, 0x16u);
      }
      goto LABEL_20;
    }
  }
  v17 = SBLogAVSystemControllerCache();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

  v19 = SBLogAVSystemControllerCache();
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_cold_1(a1, v5, v20);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = v21;
    _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_INFO, "Notification '%@' received", buf, 0xCu);
  }

  v22 = [*(id *)(*(void *)(a1 + 40) + 64) objectForKeyedSubscript:*(void *)(a1 + 48)];
  int v14 = v22;
  if (v22)
  {
    uint64_t v23 = [v22 pointerValue];
    id v24 = (void (*)(void, uint64_t, void, void, void *, void *, void))[*(id *)(a1 + 40) methodForSelector:v23];
    id v25 = *(id *)(*(void *)(a1 + 40) + 88);
    v26 = objc_msgSend(*(id *)(a1 + 40), "_queue_backgroundQueryCancellationSignalForNotificationCreatingIfNecessary:", *(void *)(a1 + 48));
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_95;
    v33[3] = &unk_1E6AF5420;
    id v34 = v26;
    id v35 = v25;
    uint64_t v15 = v25;
    id v27 = v26;
    BOOL v28 = (void *)MEMORY[0x1D948C7A0](v33);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_2;
    v31[3] = &unk_1E6AF5290;
    v29 = *(void **)(a1 + 48);
    v31[4] = *(void *)(a1 + 40);
    id v32 = v29;
    v30 = (void *)MEMORY[0x1D948C7A0](v31);
    v24(*(void *)(a1 + 40), v23, *(void *)(a1 + 56), *(unsigned __int8 *)(*(void *)(a1 + 40) + 80), v28, v30, 0);

LABEL_20:
  }
}

- (id)_queue_backgroundQueryCancellationSignalForNotificationCreatingIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_notificationToBackgroundQueryCancellationSignalMap objectForKey:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F4F690]);
    [(NSMutableDictionary *)self->_notificationToBackgroundQueryCancellationSignalMap setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)_queue_updateActiveCategoryNameFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  int v14 = (void (**)(void))a6;
  id v15 = a7;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v34[3] = &unk_1E6AFD710;
  BOOL v36 = v10;
  v34[4] = self;
  id v16 = v15;
  id v35 = v16;
  v17 = (void (**)(void, void))MEMORY[0x1D948C7A0](v34);
  if (v10)
  {
    BOOL v18 = [v12 objectForKey:*MEMORY[0x1E4F74B90]];
    v19 = (SBAVSystemControllerDataProviding *)[v18 copy];

    if (v19)
    {
      v14[2](v14);
      ((void (**)(void, SBAVSystemControllerDataProviding *))v17)[2](v17, v19);
    }
    else
    {
      id v25 = self->_queue_dataProvider;
      backgroundQueryQueue = self->_backgroundQueryQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_65;
      block[3] = &unk_1E6AFD648;
      v30 = v25;
      v31 = self;
      id v32 = v13;
      v33 = v17;
      id v27 = v25;
      dispatch_async(backgroundQueryQueue, block);
    }
  }
  else
  {
    v19 = self->_queue_dataProvider;
    id v28 = 0;
    int v20 = [(SBAVSystemControllerDataProviding *)v19 getActiveCategoryVolume:0 andName:&v28];
    id v21 = v28;
    v22 = v21;
    if (!v20 || !v21)
    {
      uint64_t v23 = SBLogAVSystemControllerCache();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[SBAVSystemControllerCache _queue_updateActiveCategoryNameFromNotification:allowingBackgroundQueries:backgroundQueriesCancelledBlock:cancelBackgroundQueriesBlock:completion:]();
      }
    }
    id v24 = (void *)[v22 copy];

    ((void (**)(void, void *))v17)[2](v17, v24);
  }
}

uint64_t __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_signalBackgroundQueryCancellationForNotification:", *(void *)(a1 + 40));
}

void __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    if ((BSEqualStrings() & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), a2);
      int v9 = SBLogAVSystemControllerCache();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 104);
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v10;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Updated activeCategoryName to %@", buf, 0xCu);
      }

      uint64_t v11 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_61;
      v15[3] = &unk_1E6AFD6E8;
      v15[4] = v11;
      id v16 = v4;
      objc_msgSend(v11, "_queue_notifyObserversWithBlock:", v15);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), a2);
    id v12 = SBLogAVSystemControllerCache();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 104);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Initialized activeCategoryName to %@", buf, 0xCu);
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, v5, v6, v7, v8);
  }
}

- (void)_queue_signalBackgroundQueryCancellationForNotification:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKey:](self->_notificationToBackgroundQueryCancellationSignalMap, "objectForKey:");
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 signal];
    [(NSMutableDictionary *)self->_notificationToBackgroundQueryCancellationSignalMap removeObjectForKey:v6];
  }
}

- (void)_queue_updatePickableRoutesFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  BOOL v8 = a4;
  id v10 = a5;
  id v11 = a7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v24[3] = &unk_1E6AFD698;
  BOOL v26 = v8;
  v24[4] = self;
  id v12 = v11;
  id v25 = v12;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x1D948C7A0](v24);
  queue_dataProvider = self->_queue_dataProvider;
  if (v8)
  {
    id v15 = queue_dataProvider;
    backgroundQueryQueue = self->_backgroundQueryQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_81;
    block[3] = &unk_1E6AFD648;
    int v20 = v15;
    id v21 = self;
    id v22 = v10;
    uint64_t v23 = v13;
    v17 = v15;
    dispatch_async(backgroundQueryQueue, block);
  }
  else
  {
    uint64_t v18 = [(SBAVSystemControllerDataProviding *)queue_dataProvider attributeForKey:*MEMORY[0x1E4F74C50]];
    v17 = (SBAVSystemControllerDataProviding *)[v18 copy];

    ((void (**)(void, SBAVSystemControllerDataProviding *))v13)[2](v13, v17);
  }
}

- (void)_queue_notifyObserversWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_queue_observers allObjects];
  id v6 = (void *)[v5 copy];

  callOutQueue = self->_callOutQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__SBAVSystemControllerCache__queue_notifyObserversWithBlock___block_invoke;
  v10[3] = &unk_1E6AF6828;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(callOutQueue, v10);
}

uint64_t __50__SBAVSystemControllerCache_isAudioSessionPlaying__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 98);
  return result;
}

void __47__SBAVSystemControllerCache_activeCategoryName__block_invoke(uint64_t a1)
{
}

void __61__SBAVSystemControllerCache__queue_notifyObserversWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cache:*(void *)(a1 + 32) didUpdateAudioSessionPlaying:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)isAudioSessionPlaying
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SBAVSystemControllerCache_isAudioSessionPlaying__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)activeCategoryName
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__28;
  long long v10 = __Block_byref_object_dispose__28;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SBAVSystemControllerCache_activeCategoryName__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

uint64_t __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

uint64_t __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_66(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

uint64_t __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_95(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasBeenSignalled]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 40);
  return [v3 hasBeenSignalled];
}

void __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_65(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v15 = 0;
  int v3 = [v2 getActiveCategoryVolume:0 andName:&v15];
  id v4 = v15;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    long long v7 = SBLogAVSystemControllerCache();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_65_cold_1();
    }
  }
  uint64_t v8 = (void *)[v5 copy];

  char v9 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_66;
  v11[3] = &unk_1E6AFD6C0;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, v11);
}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_81(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attributeForKey:*MEMORY[0x1E4F74C50]];
  int v3 = (void *)[v2 copy];

  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E6AFD6C0;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = a1 + 32;
  if (*(unsigned char *)(a1 + 48))
  {
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)v5 + 128), a2);
      id v10 = SBLogAVSystemControllerCache();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

      id v12 = SBLogAVSystemControllerCache();
      id v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2(a1 + 32, v13, v14, v15, v16, v17, v18, v19);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Updated pickableRoutes", buf, 2u);
      }

      v30 = *(void **)v5;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_78;
      v32[3] = &unk_1E6AFD6E8;
      v32[4] = v30;
      id v33 = v4;
      objc_msgSend(v30, "_queue_notifyObserversWithBlock:", v32);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), a2);
    int v20 = SBLogAVSystemControllerCache();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

    id v22 = SBLogAVSystemControllerCache();
    uint64_t v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1(a1 + 32, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "Initialized pickableRoutes", buf, 2u);
    }
  }
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 16))(v31, v6, v7, v8, v9);
  }
}

- (SBAVSystemControllerCache)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBAVSystemControllerCache.m" lineNumber:54 description:@"-init is not allowed on SBAVSystemControllerCache"];

  return 0;
}

- (SBAVSystemControllerCache)initWithCallOutQueue:(id)a3 notificationCenter:(id)a4 dataProviderInitializer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)SBAVSystemControllerCache;
  id v12 = [(SBAVSystemControllerCache *)&v33 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_callOutQueue, a3);
    objc_storeStrong((id *)&v13->_notificationCenter, a4);
    uint64_t v14 = [v11 copy];
    id dataProviderInitializer = v13->_dataProviderInitializer;
    v13->_id dataProviderInitializer = (id)v14;

    uint64_t v16 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    queue_observers = v13->_queue_observers;
    v13->_queue_observers = (NSHashTable *)v16;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    notificationToHandlerMap = v13->_notificationToHandlerMap;
    v13->_notificationToHandlerMap = (NSMutableDictionary *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    notificationToBackgroundQueryCancellationSignalMap = v13->_notificationToBackgroundQueryCancellationSignalMap;
    v13->_notificationToBackgroundQueryCancellationSignalMap = (NSMutableDictionary *)v22;

    uint64_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v25 = BSDispatchQueueCreateWithQualityOfService();
    backgroundQueryQueue = v13->_backgroundQueryQueue;
    v13->_backgroundQueryQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = SBLogAVSystemControllerCache();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "Creating SBAVSystemControllerCache", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__SBAVSystemControllerCache_initWithCallOutQueue_notificationCenter_dataProviderInitializer___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    uint64_t v31 = v13;
    dispatch_block_t v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async((dispatch_queue_t)v13->_queue, v28);
  }
  return v13;
}

void __93__SBAVSystemControllerCache_initWithCallOutQueue_notificationCenter_dataProviderInitializer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F165C8] sharedAudioPresentationOutputContext];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  *(unsigned char *)(*(void *)(a1 + 32) + 144) = [*(id *)(*(void *)(a1 + 32) + 48) supportsMultipleOutputDevices];
  uint64_t v5 = [MEMORY[0x1E4F29238] valueWithPointer:sel__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F74BD8]];

  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithPointer:sel__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F74E40]];

  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithPointer:sel__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F74E98]];

  uint64_t v8 = [MEMORY[0x1E4F29238] valueWithPointer:sel__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F74BB8]];

  id v9 = [MEMORY[0x1E4F29238] valueWithPointer:sel__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F74E50]];

  id v10 = [MEMORY[0x1E4F29238] valueWithPointer:sel__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F74B88]];

  if (*(unsigned char *)(*(void *)(a1 + 32) + 144)) {
    id v11 = (id *)MEMORY[0x1E4F15F18];
  }
  else {
    id v11 = (id *)MEMORY[0x1E4F15F00];
  }
  id v12 = (void *)MEMORY[0x1E4F29238];
  id v13 = *v11;
  uint64_t v14 = [v12 valueWithPointer:sel__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v14 forKeyedSubscript:v13];

  uint64_t v15 = [MEMORY[0x1E4F29238] valueWithPointer:sel__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F74A88]];

  uint64_t v16 = [MEMORY[0x1E4F29238] valueWithPointer:sel__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F74C58]];

  [*(id *)(*(void *)(a1 + 32) + 16) addObserver:*(void *)(a1 + 32) selector:sel__serverDied_ name:*MEMORY[0x1E4F74E30] object:0];
  uint64_t v17 = *(void **)(a1 + 32);
  uint64_t v18 = (void *)v17[8];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__SBAVSystemControllerCache_initWithCallOutQueue_notificationCenter_dataProviderInitializer___block_invoke_2;
  v20[3] = &unk_1E6AFD5D8;
  BOOL v21 = v17;
  [v18 enumerateKeysAndObjectsUsingBlock:v20];
  uint64_t v19 = *(void **)(a1 + 32);

  objc_msgSend(v19, "_queue_rebuildCache");
}

uint64_t __93__SBAVSystemControllerCache_initWithCallOutQueue_notificationCenter_dataProviderInitializer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObserver:*(void *)(a1 + 32) selector:sel__receiveUpdatedValueFromNotification_ name:a2 object:0];
}

- (void)dealloc
{
  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBAVSystemControllerCache;
  [(SBAVSystemControllerCache *)&v3 dealloc];
}

+ (SBAVSystemControllerCache)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_102);
  }
  uint64_t v2 = (void *)sharedInstance___sharedInstance_7;
  return (SBAVSystemControllerCache *)v2;
}

void __43__SBAVSystemControllerCache_sharedInstance__block_invoke()
{
  v0 = [SBAVSystemControllerCache alloc];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v1 = [(SBAVSystemControllerCache *)v0 initWithCallOutQueue:MEMORY[0x1E4F14428] notificationCenter:v3 dataProviderInitializer:&__block_literal_global_40];
  uint64_t v2 = (void *)sharedInstance___sharedInstance_7;
  sharedInstance___sharedInstance_7 = v1;
}

uint64_t __43__SBAVSystemControllerCache_sharedInstance__block_invoke_2()
{
  return [MEMORY[0x1E4F74F68] sharedAVSystemController];
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBAVSystemControllerCache.m", 123, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SBAVSystemControllerCache_addObserver___block_invoke;
  block[3] = &unk_1E6AF5290;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

uint64_t __41__SBAVSystemControllerCache_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 40);
    return [v4 addObject:v3];
  }
  return result;
}

- (BOOL)isFullyMuted
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SBAVSystemControllerCache_isFullyMuted__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__SBAVSystemControllerCache_isFullyMuted__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 96);
  return result;
}

- (BOOL)isRingerMuted
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SBAVSystemControllerCache_isRingerMuted__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SBAVSystemControllerCache_isRingerMuted__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 97);
  return result;
}

- (BOOL)isAirplayDisplayActive
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBAVSystemControllerCache_isAirplayDisplayActive__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SBAVSystemControllerCache_isAirplayDisplayActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 99);
  return result;
}

- (NSString)activeAudioRoute
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__28;
  id v10 = __Block_byref_object_dispose__28;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SBAVSystemControllerCache_activeAudioRoute__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __45__SBAVSystemControllerCache_activeAudioRoute__block_invoke(uint64_t a1)
{
}

- (NSDictionary)activeAudioRouteInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__28;
  id v10 = __Block_byref_object_dispose__28;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SBAVSystemControllerCache_activeAudioRouteInfo__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __49__SBAVSystemControllerCache_activeAudioRouteInfo__block_invoke(uint64_t a1)
{
}

- (NSArray)pickableRoutes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__28;
  id v10 = __Block_byref_object_dispose__28;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SBAVSystemControllerCache_pickableRoutes__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __43__SBAVSystemControllerCache_pickableRoutes__block_invoke(uint64_t a1)
{
}

- (NSArray)activeOutputDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__28;
  id v10 = __Block_byref_object_dispose__28;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SBAVSystemControllerCache_activeOutputDevices__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __48__SBAVSystemControllerCache_activeOutputDevices__block_invoke(uint64_t a1)
{
}

- (void)fetchPickableRoutesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__SBAVSystemControllerCache_fetchPickableRoutesWithCompletion___block_invoke;
    v7[3] = &unk_1E6AF6828;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __63__SBAVSystemControllerCache_fetchPickableRoutesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 128);
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SBAVSystemControllerCache_fetchPickableRoutesWithCompletion___block_invoke_2;
  v6[3] = &unk_1E6AF5A78;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __63__SBAVSystemControllerCache_fetchPickableRoutesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (OS_dispatch_workloop)avscOperationsWorkloop
{
  avscOperationsWorkloop = self->_avscOperationsWorkloop;
  if (!avscOperationsWorkloop)
  {
    inactive = dispatch_workloop_create_inactive("SBAVSystemControllerCache.AVSCOperations");
    dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_activate(inactive);
    id v5 = self->_avscOperationsWorkloop;
    self->_avscOperationsWorkloop = (OS_dispatch_workloop *)inactive;

    avscOperationsWorkloop = self->_avscOperationsWorkloop;
  }
  return avscOperationsWorkloop;
}

- (void)_queue_updateFullyMutedFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = (void (**)(void))a6;
  id v15 = a7;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v29[3] = &unk_1E6AFBA88;
  BOOL v31 = v10;
  v29[4] = self;
  id v16 = v15;
  id v30 = v16;
  uint64_t v17 = (void (**)(void, void))MEMORY[0x1D948C7A0](v29);
  if (v10)
  {
    if (!v12)
    {
      BOOL v21 = self->_queue_dataProvider;
      backgroundQueryQueue = self->_backgroundQueryQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_50;
      block[3] = &unk_1E6AFD648;
      uint64_t v25 = v21;
      uint64_t v26 = self;
      id v27 = v13;
      dispatch_block_t v28 = v17;
      uint64_t v23 = v21;
      dispatch_async(backgroundQueryQueue, block);

      goto LABEL_7;
    }
    uint64_t v18 = [v12 objectForKey:*MEMORY[0x1E4F74AD0]];
    uint64_t v19 = [v18 BOOLValue];

    v14[2](v14);
  }
  else
  {
    uint64_t v20 = [(SBAVSystemControllerDataProviding *)self->_queue_dataProvider attributeForKey:*MEMORY[0x1E4F74BD0]];
    uint64_t v19 = [v20 BOOLValue];
  }
  v17[2](v17, v19);
LABEL_7:
}

uint64_t __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned __int8 *)(v3 + 96) == a2) {
      goto LABEL_9;
    }
    *(unsigned char *)(v3 + 96) = a2;
    id v4 = SBLogAVSystemControllerCache();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 96);
      int v9 = 67109120;
      int v10 = v5;
      uint64_t v6 = "Updated fullyMuted to %{BOOL}i";
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    *(unsigned char *)(v3 + 96) = a2;
    id v4 = SBLogAVSystemControllerCache();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 96);
      int v9 = 67109120;
      int v10 = v7;
      uint64_t v6 = "Initialized fullyMuted to %{BOOL}i";
      goto LABEL_7;
    }
  }

LABEL_9:
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_50(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attributeForKey:*MEMORY[0x1E4F74BD0]];
  char v3 = [v2 BOOLValue];

  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E6AFD620;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  char v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)_queue_updateRingerMutedFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = (void (**)(void))a6;
  id v15 = a7;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v29[3] = &unk_1E6AFBA88;
  BOOL v31 = v10;
  v29[4] = self;
  id v16 = v15;
  id v30 = v16;
  uint64_t v17 = (void (**)(void, void))MEMORY[0x1D948C7A0](v29);
  if (v10)
  {
    if (!v12)
    {
      BOOL v21 = self->_queue_dataProvider;
      backgroundQueryQueue = self->_backgroundQueryQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_55;
      block[3] = &unk_1E6AFD648;
      uint64_t v25 = v21;
      uint64_t v26 = self;
      id v27 = v13;
      dispatch_block_t v28 = v17;
      uint64_t v23 = v21;
      dispatch_async(backgroundQueryQueue, block);

      goto LABEL_7;
    }
    uint64_t v18 = [v12 objectForKey:*MEMORY[0x1E4F74E48]];
    uint64_t v19 = [v18 BOOLValue];

    v14[2](v14);
  }
  else
  {
    uint64_t v20 = [(SBAVSystemControllerDataProviding *)self->_queue_dataProvider attributeForKey:*MEMORY[0x1E4F74E38]];
    uint64_t v19 = [v20 BOOLValue];
  }
  v17[2](v17, v19);
LABEL_7:
}

uint64_t __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, int a2)
{
  char v2 = a2;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned __int8 *)(v4 + 97) != a2)
    {
      *(unsigned char *)(v4 + 97) = a2;
      int v5 = SBLogAVSystemControllerCache();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 97);
        *(_DWORD *)buf = 67109120;
        int v14 = v6;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updated ringerMuted to %{BOOL}i", buf, 8u);
      }

      id v7 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_51;
      v11[3] = &unk_1E6AFD670;
      void v11[4] = v7;
      char v12 = v2;
      objc_msgSend(v7, "_queue_notifyObserversWithBlock:", v11);
    }
  }
  else
  {
    *(unsigned char *)(v4 + 97) = a2;
    char v8 = SBLogAVSystemControllerCache();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 97);
      *(_DWORD *)buf = 67109120;
      int v14 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Initialized ringerMuted to %{BOOL}i", buf, 8u);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_51(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cache:*(void *)(a1 + 32) didUpdateRingerMuted:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_55(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) attributeForKey:*MEMORY[0x1E4F74E38]];
  char v3 = [v2 BOOLValue];

  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E6AFD620;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  char v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_60(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) attributeForKey:*MEMORY[0x1E4F74C78]];
  char v3 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E6AFD6C0;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

uint64_t __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
  {
    char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

void __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_61(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cache:*(void *)(a1 + 32) didUpdateActiveCategoryName:*(void *)(a1 + 40)];
  }
}

- (void)_queue_updateActiveAudioRouteFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  BOOL v8 = a4;
  id v10 = a5;
  id v11 = a7;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v26[3] = &unk_1E6AFD760;
  BOOL v28 = v8;
  v26[4] = self;
  id v12 = v11;
  id v27 = v12;
  id v13 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v26);
  queue_dataProvider = self->_queue_dataProvider;
  if (v8)
  {
    uint64_t v15 = queue_dataProvider;
    backgroundQueryQueue = self->_backgroundQueryQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_73;
    block[3] = &unk_1E6AFD648;
    uint64_t v22 = v15;
    uint64_t v23 = self;
    id v24 = v10;
    uint64_t v25 = v13;
    uint64_t v17 = v15;
    dispatch_async(backgroundQueryQueue, block);

    uint64_t v18 = v22;
  }
  else
  {
    uint64_t v19 = [(SBAVSystemControllerDataProviding *)queue_dataProvider attributeForKey:*MEMORY[0x1E4F74A78]];
    uint64_t v17 = (SBAVSystemControllerDataProviding *)[v19 copy];

    uint64_t v20 = [(SBAVSystemControllerDataProviding *)self->_queue_dataProvider attributeForKey:*MEMORY[0x1E4F74C68]];
    uint64_t v18 = (SBAVSystemControllerDataProviding *)[v20 copy];

    ((void (**)(void, SBAVSystemControllerDataProviding *, SBAVSystemControllerDataProviding *))v13)[2](v13, v17, v18);
  }
}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = a1 + 32;
  if (!*(unsigned char *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), a2);
    objc_storeStrong((id *)(*(void *)v8 + 120), a3);
    uint64_t v17 = SBLogAVSystemControllerCache();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

    uint64_t v19 = SBLogAVSystemControllerCache();
    uint64_t v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(*(void *)v8 + 112);
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v25;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "Initialized activeAudioRoute (and attributes) to %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (!BSEqualStrings() || (BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)v8 + 112), a2);
    objc_storeStrong((id *)(*(void *)v8 + 120), a3);
    id v13 = SBLogAVSystemControllerCache();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

    uint64_t v15 = SBLogAVSystemControllerCache();
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2();
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(*(void *)v8 + 112);
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v21;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Updated activeAudioRoute (and attributes) to %@", buf, 0xCu);
    }

    id v22 = *(id *)(*(void *)v8 + 136);
    uint64_t v23 = *(void **)v8;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_67;
    v26[3] = &unk_1E6AFD738;
    v26[4] = v23;
    id v27 = v6;
    id v28 = v7;
    id v29 = v22;
    uint64_t v20 = v22;
    objc_msgSend(v23, "_queue_notifyObserversWithBlock:", v26);

LABEL_13:
  }
  uint64_t v24 = *(void *)(a1 + 40);
  if (v24) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16))(v24, v9, v10, v11, v12);
  }
}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_67(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 cache:a1[4] didUpdateActiveAudioRoutingWithRoute:a1[5] routeAttributes:a1[6] activeOutputDevices:a1[7]];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 cache:a1[4] didUpdateActiveAudioRoute:a1[5]];
  }
}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_73(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) attributeForKey:*MEMORY[0x1E4F74A78]];
  id v3 = (void *)[v2 copy];

  id v4 = [*(id *)(a1 + 32) attributeForKey:*MEMORY[0x1E4F74C68]];
  int v5 = (void *)[v4 copy];

  id v6 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  v9[3] = &unk_1E6AFD788;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v10 = v3;
  id v11 = v5;
  id v7 = v5;
  id v8 = v3;
  dispatch_async(v6, v9);
}

uint64_t __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v3();
  }
  return result;
}

- (void)_queue_updateActiveOutputDevicesFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  BOOL v8 = a4;
  id v10 = a5;
  id v11 = a7;
  id v12 = self->_queue_activeOutputDevices;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v24[3] = &unk_1E6AFD7B0;
  BOOL v28 = v8;
  id v13 = v12;
  uint64_t v25 = v13;
  uint64_t v26 = self;
  id v14 = v11;
  id v27 = v14;
  uint64_t v15 = (void (**)(void, void))MEMORY[0x1D948C7A0](v24);
  queue_outputContext = self->_queue_outputContext;
  if (v8)
  {
    uint64_t v17 = queue_outputContext;
    backgroundQueryQueue = self->_backgroundQueryQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_77;
    v20[3] = &unk_1E6AFD648;
    void v20[4] = self;
    uint64_t v21 = v17;
    id v22 = v10;
    uint64_t v23 = v15;
    uint64_t v19 = v17;
    dispatch_async(backgroundQueryQueue, v20);
  }
  else
  {
    uint64_t v19 = [(SBAVSystemControllerCache *)self _queryActiveOutputDevicesFromContext:queue_outputContext];
    ((void (**)(void, AVOutputContext *))v15)[2](v15, v19);
  }
}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    if (BSEqualObjects()) {
      goto LABEL_15;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 136), a2);
    uint64_t v9 = SBLogAVSystemControllerCache();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

    id v11 = SBLogAVSystemControllerCache();
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2();
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Updated activeOutputDevices", buf, 2u);
    }

    id v17 = *(id *)(*(void *)(a1 + 40) + 112);
    id v18 = *(id *)(*(void *)(a1 + 40) + 120);
    uint64_t v19 = *(void **)(a1 + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_74;
    v22[3] = &unk_1E6AFD738;
    v22[4] = v19;
    id v23 = v17;
    id v24 = v18;
    id v25 = v4;
    id v20 = v18;
    id v16 = v17;
    objc_msgSend(v19, "_queue_notifyObserversWithBlock:", v22);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 136), a2);
    id v13 = SBLogAVSystemControllerCache();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

    uint64_t v15 = SBLogAVSystemControllerCache();
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Initialized activeOutputDevices", buf, 2u);
    }
  }

LABEL_15:
  uint64_t v21 = *(void *)(a1 + 48);
  if (v21) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 16))(v21, v5, v6, v7, v8);
  }
}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_74(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 cache:a1[4] didUpdateActiveAudioRoutingWithRoute:a1[5] routeAttributes:a1[6] activeOutputDevices:a1[7]];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 cache:a1[4] didUpdateActiveOutputDevices:a1[7]];
  }
}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_77(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _queryActiveOutputDevicesFromContext:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E6AFD6C0;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

uint64_t __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cache:*(void *)(a1 + 32) didUpdatePickableRoutes:*(void *)(a1 + 40)];
  }
}

- (void)_queue_updateAirplayDisplayActiveFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  BOOL v8 = a4;
  id v10 = a5;
  id v11 = a7;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v25[3] = &unk_1E6AFBA88;
  BOOL v27 = v8;
  v25[4] = self;
  id v12 = v11;
  id v26 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x1D948C7A0](v25);
  queue_dataProvider = self->_queue_dataProvider;
  if (v8)
  {
    uint64_t v15 = queue_dataProvider;
    backgroundQueryQueue = self->_backgroundQueryQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_85;
    block[3] = &unk_1E6AFD648;
    uint64_t v21 = v15;
    id v22 = self;
    id v23 = v10;
    id v24 = v13;
    id v17 = v15;
    dispatch_async(backgroundQueryQueue, block);
  }
  else
  {
    id v18 = [(SBAVSystemControllerDataProviding *)queue_dataProvider attributeForKey:*MEMORY[0x1E4F74B60]];
    uint64_t v19 = [v18 isEqualToString:*MEMORY[0x1E4F74BC0]];

    v13[2](v13, v19);
  }
}

uint64_t __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, int a2)
{
  char v2 = a2;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned __int8 *)(v4 + 99) != a2)
    {
      *(unsigned char *)(v4 + 99) = a2;
      uint64_t v5 = SBLogAVSystemControllerCache();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 99);
        *(_DWORD *)buf = 67109120;
        int v14 = v6;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updated airplayDisplayActive to %{BOOL}i", buf, 8u);
      }

      id v7 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_82;
      v11[3] = &unk_1E6AFD670;
      void v11[4] = v7;
      char v12 = v2;
      objc_msgSend(v7, "_queue_notifyObserversWithBlock:", v11);
    }
  }
  else
  {
    *(unsigned char *)(v4 + 99) = a2;
    BOOL v8 = SBLogAVSystemControllerCache();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 99);
      *(_DWORD *)buf = 67109120;
      int v14 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Initialized airplayDisplayActive to %{BOOL}i", buf, 8u);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cache:*(void *)(a1 + 32) didUpdateAirplayDisplayActive:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_85(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) attributeForKey:*MEMORY[0x1E4F74B60]];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F74BC0]];

  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E6AFD620;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  char v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (id)_queryActiveOutputDevicesFromContext:(id)a3
{
  if (self->_outputContextSupportsMultipleOutputDevices)
  {
    char v3 = [a3 outputDevices];
  }
  else
  {
    uint64_t v4 = [a3 outputDevice];
    if (v4) {
      [MEMORY[0x1E4F1C978] arrayWithObject:v4];
    }
    else {
    char v3 = [MEMORY[0x1E4F1C978] array];
    }
  }
  return v3;
}

- (void)_queue_rebuildCache
{
  queue_dataProvider = self->_queue_dataProvider;
  self->_queue_dataProvider = 0;

  queue_serverDeathSignal = self->_queue_serverDeathSignal;
  if (queue_serverDeathSignal) {
    [(BSAtomicSignal *)queue_serverDeathSignal signal];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F690]);
  objc_storeStrong((id *)&self->_queue_serverDeathSignal, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SBAVSystemControllerCache__queue_rebuildCache__block_invoke;
  v8[3] = &unk_1E6AF5290;
  id v9 = v5;
  id v10 = self;
  id v6 = v5;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async((dispatch_queue_t)self->_backgroundQueryQueue, v7);
}

void __48__SBAVSystemControllerCache__queue_rebuildCache__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasBeenSignalled])
  {
    char v2 = SBLogAVSystemControllerCache();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling rebuilding data provider since the server has died", buf, 2u);
    }
  }
  else
  {
    char v3 = objc_msgSend(*(id *)(a1 + 40), "_backgroundQueryQueue_rebuildDataProvider");
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__SBAVSystemControllerCache__queue_rebuildCache__block_invoke_88;
    block[3] = &unk_1E6AF4E00;
    uint64_t v4 = *(void **)(a1 + 32);
    void block[4] = *(void *)(a1 + 40);
    id v7 = v3;
    id v8 = v4;
    char v2 = v3;
    dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 32), v5);
  }
}

uint64_t __48__SBAVSystemControllerCache__queue_rebuildCache__block_invoke_88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishRebuildingCacheWithDataProvider:serverDeathSignal:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)_backgroundQueryQueue_rebuildDataProvider
{
  v21[10] = *MEMORY[0x1E4F143B8];
  char v3 = SBLogAVSystemControllerCache();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Rebuilding data provider", buf, 2u);
  }

  uint64_t v4 = (*((void (**)(void))self->_dataProviderInitializer + 2))();
  uint64_t v5 = *MEMORY[0x1E4F74C00];
  v21[0] = *MEMORY[0x1E4F74B88];
  v21[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F74E40];
  v21[2] = *MEMORY[0x1E4F74BD8];
  v21[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F74BB8];
  v21[4] = *MEMORY[0x1E4F74E98];
  v21[5] = v7;
  uint64_t v8 = *MEMORY[0x1E4F74A88];
  v21[6] = *MEMORY[0x1E4F74E50];
  v21[7] = v8;
  uint64_t v9 = *MEMORY[0x1E4F74E30];
  v21[8] = *MEMORY[0x1E4F74C58];
  v21[9] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:10];
  uint64_t v11 = *MEMORY[0x1E4F74EA8];
  id v19 = 0;
  int v12 = [v4 setAttribute:v10 forKey:v11 error:&v19];
  id v13 = v19;
  int v14 = SBLogAVSystemControllerCache();
  uint64_t v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Successfully subscribed to all necessary AVSystemController notifications.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBAVSystemControllerCache _backgroundQueryQueue_rebuildDataProvider]();
    }

    id v16 = SBLogCommon();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17) {
      NSLog(&cfstr_WeReallyShould.isa, v13);
    }
  }

  return v4;
}

- (void)_queue_finishRebuildingCacheWithDataProvider:(id)a3 serverDeathSignal:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [v8 hasBeenSignalled];
  id v10 = SBLogAVSystemControllerCache();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling finishing rebuilding cache since the server has died", buf, 2u);
    }
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Finishing rebuilding cache", buf, 2u);
    }

    objc_storeStrong((id *)&self->_queue_dataProvider, a3);
    *(void *)buf = 0;
    id v29 = buf;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke;
    v25[3] = &unk_1E6AF5290;
    id v12 = v8;
    id v26 = v12;
    BOOL v27 = self;
    id v13 = (void *)MEMORY[0x1D948C7A0](v25);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_3;
    v22[3] = &unk_1E6AFD800;
    id v24 = buf;
    id v14 = v13;
    id v23 = v14;
    uint64_t v15 = (void *)MEMORY[0x1D948C7A0](v22);
    notificationToHandlerMap = self->_notificationToHandlerMap;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_4;
    v18[3] = &unk_1E6AFD850;
    v18[4] = self;
    id v19 = v12;
    id v17 = v15;
    id v20 = v17;
    uint64_t v21 = buf;
    [(NSMutableDictionary *)notificationToHandlerMap enumerateKeysAndObjectsUsingBlock:v18];
    self->_queue_initialized = 1;

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hasBeenSignalled];
  if ((result & 1) == 0)
  {
    char v3 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_2;
    v4[3] = &unk_1E6AFD7D8;
    v4[4] = v3;
    return objc_msgSend(v3, "_queue_notifyObserversWithBlock:", v4);
  }
  return result;
}

void __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cacheDidRebuildAfterServerDeath:*(void *)(a1 + 32)];
  }
}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_3(uint64_t result)
{
  if (!--*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 pointerValue];
  id v7 = (void (*)(void, uint64_t, void, void, void *, void *, void *))[*(id *)(a1 + 32) methodForSelector:v6];
  id v8 = objc_msgSend(*(id *)(a1 + 32), "_queue_backgroundQueryCancellationSignalForNotificationCreatingIfNecessary:", v5);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_5;
  v21[3] = &unk_1E6AFD828;
  v21[4] = *(void *)(a1 + 32);
  id v9 = v8;
  id v22 = v9;
  id v23 = *(id *)(a1 + 40);
  id v10 = (void *)MEMORY[0x1D948C7A0](v21);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_6;
  v18[3] = &unk_1E6AF5FC8;
  v18[4] = *(void *)(a1 + 32);
  id v19 = v5;
  id v20 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = (void *)MEMORY[0x1D948C7A0](v18);
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_7;
  v15[3] = &unk_1E6AF5FC8;
  v15[4] = *(void *)(a1 + 32);
  id v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v13 = v9;
  id v14 = (void *)MEMORY[0x1D948C7A0](v15);
  v7(*(void *)(a1 + 32), v6, 0, *(unsigned __int8 *)(*(void *)(a1 + 32) + 80), v10, v12, v14);
}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_5(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  if ([*(id *)(a1 + 40) hasBeenSignalled]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 48);
  return [v3 hasBeenSignalled];
}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_6(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(a1 + 32), "_queue_signalBackgroundQueryCancellationForNotification:", *(void *)(a1 + 40));
  char v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_7(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  uint64_t result = [*(id *)(a1 + 40) hasBeenSignalled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

- (void)_serverDied:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__SBAVSystemControllerCache__serverDied___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v4;
  id v9 = self;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v7);
  dispatch_async((dispatch_queue_t)self->_queue, v6);
}

uint64_t __41__SBAVSystemControllerCache__serverDied___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v2 = SBLogAVSystemControllerCache();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    int v5 = 138412290;
    dispatch_block_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Notification '%@' received", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_queue_rebuildCache");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avscOperationsWorkloop, 0);
  objc_storeStrong((id *)&self->_backgroundQueryQueue, 0);
  objc_storeStrong((id *)&self->_queue_activeOutputDevices, 0);
  objc_storeStrong((id *)&self->_queue_pickableRoutes, 0);
  objc_storeStrong((id *)&self->_queue_activeAudioRouteInfo, 0);
  objc_storeStrong((id *)&self->_queue_activeAudioRoute, 0);
  objc_storeStrong((id *)&self->_queue_activeCategoryName, 0);
  objc_storeStrong((id *)&self->_queue_serverDeathSignal, 0);
  objc_storeStrong((id *)&self->_notificationToBackgroundQueryCancellationSignalMap, 0);
  objc_storeStrong((id *)&self->_notificationToHandlerMap, 0);
  objc_storeStrong((id *)&self->_queue_dataProvider, 0);
  objc_storeStrong((id *)&self->_queue_outputContext, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_dataProviderInitializer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
}

- (void)_queue_updateActiveCategoryNameFromNotification:allowingBackgroundQueries:backgroundQueriesCancelledBlock:cancelBackgroundQueriesBlock:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Failed to get active category name: %{public}@, dataProvider: %{public}@");
}

void __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_65_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Failed to get active category name: %{public}@, dataProvider: %{public}@ (background query)");
}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_7();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Initialized activeAudioRoute to %@; attributes: %@",
    v1,
    0x16u);
}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_7();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Updated activeAudioRoute to %@; attributes: %@",
    v1,
    0x16u);
}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "Initialized activeOutputDevices to %@", v2, v3, v4, v5, v6);
}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "Updated activeOutputDevices to %@", v2, v3, v4, v5, v6);
}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_backgroundQueryQueue_rebuildDataProvider
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Failed to subscribe to AVSystemController notifications due to error: %@", v1, 0xCu);
}

void __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  int v6 = 138412802;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Notification '%@' received from %p : %@", (uint8_t *)&v6, 0x20u);
}

@end