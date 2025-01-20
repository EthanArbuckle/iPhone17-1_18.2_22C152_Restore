@interface SLHighlightsCache
+ (id)highlightFetchQueue;
+ (id)highlightQueryHandlerQueue;
+ (id)sharedCache;
+ (id)userInitiatedHighlightFetchQueue;
- (NSArray)highlights;
- (NSHashTable)delegates;
- (NSMutableDictionary)highlightsCache;
- (NSString)appIdentifier;
- (OS_dispatch_group)initialFetchGroup;
- (OS_dispatch_queue)initialFetchWaitingQueue;
- (OS_dispatch_queue)threadSafePropertyQueue;
- (SLHighlightsCache)init;
- (SLInteractionHandler)interactionHandler;
- (id)_updateHighlightsWithPreviousUpdateBlock:(id)a3 debounceInterval:(unint64_t)a4;
- (id)clientUpdateHighlightsBlock;
- (id)currentDelegates;
- (id)systemUpdateHighlightsBlock;
- (int)notificationTokenDeleteHighlights;
- (int)notificationTokenRefreshHighlights;
- (int)notificationTokenScreenTimeChange;
- (void)_fetchAndUpdateHighlightsImmediately;
- (void)_leaveInitialFetchGroupIfNecessary;
- (void)_notifyDelegatesWithNotificationType:(int64_t)a3 withHighlights:(id)a4;
- (void)_registerNotifications;
- (void)_updateHighlightsForSystemNotification;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)didDeleteHighlightsOrAttributions;
- (void)fetchHighlightsWithLimit:(unint64_t)a3 reason:(id)a4 variant:(id)a5 completionBlock:(id)a6;
- (void)fetchHighlightsWithLimit:(unint64_t)a3 variant:(id)a4 completionBlock:(id)a5;
- (void)interactionHandler;
- (void)removeDelegate:(id)a3;
- (void)runAfterInitialFetch:(id)a3 onQueue:(id)a4;
- (void)setClientUpdateHighlightsBlock:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setHighlights:(id)a3;
- (void)setHighlightsCache:(id)a3;
- (void)setInitialFetchGroup:(id)a3;
- (void)setInitialFetchWaitingQueue:(id)a3;
- (void)setInteractionHandler:(id)a3;
- (void)setSystemUpdateHighlightsBlock:(id)a3;
- (void)updateHighlights;
@end

@implementation SLHighlightsCache

void __38__SLHighlightsCache_initialFetchGroup__block_invoke(uint64_t a1)
{
}

uint64_t __25__SLHighlightsCache_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerNotifications];
}

void __53__SLHighlightsCache_userInitiatedHighlightFetchQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SocialLayer.UserInitiatedHighlightFetchQueue", v2);
  v1 = (void *)userInitiatedHighlightFetchQueue_queue;
  userInitiatedHighlightFetchQueue_queue = (uint64_t)v0;
}

void __47__SLHighlightsCache_highlightQueryHandlerQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SocialLayer.HighlightQueryHandlerQueue", v2);
  v1 = (void *)highlightQueryHandlerQueue_queue;
  highlightQueryHandlerQueue_queue = (uint64_t)v0;
}

void __31__SLHighlightsCache_highlights__block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v6 = [*(id *)(a1[4] + 24) objectForKey:*(void *)(*(void *)(a1[6] + 8) + 40)];
  uint64_t v3 = [v2 arrayWithArray:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  [*(id *)(a1 + 32) setHighlights:*(void *)(a1 + 40)];
  uint64_t v3 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2_cold_2(v2);
  }

  if (*(void *)(a1 + 56))
  {
    uint64_t v4 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)setHighlights:(id)a3
{
  id v4 = a3;
  v5 = [(SLHighlightsCache *)self highlights];
  char v6 = [v4 isEqualToArray:v5];

  if ((v6 & 1) == 0)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__8;
    v12[4] = __Block_byref_object_dispose__8;
    id v13 = [(SLHighlightsCache *)self appIdentifier];
    v7 = [(SLHighlightsCache *)self threadSafePropertyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__SLHighlightsCache_setHighlights___block_invoke;
    block[3] = &unk_1E58A90D8;
    block[4] = self;
    id v10 = v4;
    v11 = v12;
    dispatch_barrier_sync(v7, block);

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__SLHighlightsCache_setHighlights___block_invoke_2;
    v8[3] = &unk_1E58A8720;
    v8[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    _Block_object_dispose(v12, 8);
  }
}

void __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained highlights];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [WeakRetained highlights];
    char v6 = [v5 isEqualToArray:*(void *)(a1 + 32)];

    if ((v6 & 1) == 0)
    {
      id v14 = WeakRetained;
      v7 = [WeakRetained currentDelegates];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector())
            {
              [v12 legacyDidAddHighlights];
              id v13 = SLFrameworkLogHandle();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v22 = v12;
                _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_DEFAULT, "legacyDidAddHighlights: delegate: %@", buf, 0xCu);
              }
            }
            else
            {
              id v13 = SLFrameworkLogHandle();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke_cold_1(&v15, v16);
              }
            }

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
        }
        while (v9);
      }

      id WeakRetained = v14;
    }
  }
}

void __79__SLHighlightsCache__updateHighlightsWithPreviousUpdateBlock_debounceInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchAndUpdateHighlightsImmediately];
}

- (void)_fetchAndUpdateHighlightsImmediately
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SLHighlightsCache *)self highlights];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke;
  v5[3] = &unk_1E58A9038;
  objc_copyWeak(&v7, &location);
  id v4 = v3;
  id v6 = v4;
  [(SLHighlightsCache *)self fetchHighlightsWithLimit:0x7FFFFFFFFFFFFFFFLL reason:0 variant:0 completionBlock:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)fetchHighlightsWithLimit:(unint64_t)a3 reason:(id)a4 variant:(id)a5 completionBlock:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v25 = a3;
    _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_DEFAULT, "Fetching highlights with limit: %lu", buf, 0xCu);
  }

  if ([v10 isEqualToString:@"deleteHighlights"]) {
    +[SLHighlightsCache userInitiatedHighlightFetchQueue];
  }
  else {
  id v14 = +[SLHighlightsCache highlightFetchQueue];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke;
  block[3] = &unk_1E58A9128;
  id v19 = v11;
  long long v20 = self;
  id v22 = v12;
  unint64_t v23 = a3;
  id v21 = v10;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  dispatch_async(v14, block);
}

- (void)_registerNotifications
{
}

+ (id)highlightFetchQueue
{
  if (highlightFetchQueue_onceToken != -1) {
    dispatch_once(&highlightFetchQueue_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)highlightFetchQueue_queue;
  return v2;
}

void __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (![v2 length])
  {
    id v3 = (id)*MEMORY[0x1E4F8A190];

    id v2 = v3;
  }
  id v4 = [*(id *)(a1 + 40) interactionHandler];
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 48);
  id v18 = 0;
  id v7 = [v4 fetchInteractionsWithLimit:v5 reason:v6 variant:v2 error:&v18];
  id v8 = v18;

  if (v7)
  {
    uint64_t v9 = +[SLHighlightsCache highlightQueryHandlerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2;
    block[3] = &unk_1E58A9100;
    void block[4] = *(void *)(a1 + 40);
    id v15 = v7;
    id v17 = *(id *)(a1 + 56);
    id v16 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v8 localizedDescription];
      uint64_t v12 = *(void *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      long long v20 = v11;
      __int16 v21 = 2048;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      _os_log_error_impl(&dword_19BE17000, v10, OS_LOG_TYPE_ERROR, "Failed to obtain results due to %@. Limit: %lu, Variant: %@", buf, 0x20u);
    }
  }
  [*(id *)(a1 + 40) _leaveInitialFetchGroupIfNecessary];
}

- (SLInteractionHandler)interactionHandler
{
  interactionHandler = self->_interactionHandler;
  if (!interactionHandler)
  {
    id v4 = [(SLHighlightsCache *)self currentDelegates];
    uint64_t v5 = [v4 firstObject];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v5 appIdentifierForHighlightsCache];
      id v7 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[SLHighlightsCache interactionHandler]();
      }

      if ([v6 length]) {
        id v8 = [[SLInteractionHandler alloc] initWithAppIdentifier:v6];
      }
      else {
        id v8 = objc_alloc_init(SLInteractionHandler);
      }
      uint64_t v9 = self->_interactionHandler;
      self->_interactionHandler = v8;
    }
    interactionHandler = self->_interactionHandler;
  }
  return interactionHandler;
}

- (void)_leaveInitialFetchGroupIfNecessary
{
  id v3 = [(SLHighlightsCache *)self initialFetchGroup];
  if (v3)
  {
    id v4 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_INFO, "Leaving initial fetch group to invoke callbacks waiting on the first fetch.", v5, 2u);
    }

    dispatch_group_leave(v3);
    [(SLHighlightsCache *)self setInitialFetchGroup:0];
  }
}

+ (id)highlightQueryHandlerQueue
{
  if (highlightQueryHandlerQueue_onceToken != -1) {
    dispatch_once(&highlightQueryHandlerQueue_onceToken, &__block_literal_global_14);
  }
  id v2 = (void *)highlightQueryHandlerQueue_queue;
  return v2;
}

- (OS_dispatch_group)initialFetchGroup
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__8;
  id v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  id v3 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SLHighlightsCache_initialFetchGroup__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (OS_dispatch_group *)v4;
}

- (void)updateHighlights
{
  id v3 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "_updateHighlights for client: ", v6, 2u);
  }

  id v4 = [(SLHighlightsCache *)self clientUpdateHighlightsBlock];
  uint64_t v5 = [(SLHighlightsCache *)self _updateHighlightsWithPreviousUpdateBlock:v4 debounceInterval:0];
  [(SLHighlightsCache *)self setClientUpdateHighlightsBlock:v5];
}

- (void)setClientUpdateHighlightsBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SLHighlightsCache_setClientUpdateHighlightsBlock___block_invoke;
  v7[3] = &unk_1E58A9088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

- (id)clientUpdateHighlightsBlock
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__40;
  id v11 = __Block_byref_object_dispose__41;
  id v12 = 0;
  id v3 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SLHighlightsCache_clientUpdateHighlightsBlock__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = _Block_copy((const void *)v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_updateHighlightsWithPreviousUpdateBlock:(id)a3 debounceInterval:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SLHighlightsCache _updateHighlightsWithPreviousUpdateBlock:debounceInterval:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  id v15 = _Block_copy(v6);
  id v16 = v15;
  if (v15) {
    dispatch_block_cancel(v15);
  }
  id v17 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19BE17000, v17, OS_LOG_TYPE_DEFAULT, "_updateHighlightsWithPreviousUpdateBlock: ", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SLHighlightsCache__updateHighlightsWithPreviousUpdateBlock_debounceInterval___block_invoke;
  block[3] = &unk_1E58A85E0;
  objc_copyWeak(&v24, buf);
  dispatch_block_t v18 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_time_t v19 = dispatch_time(0, 1000000000 * a4);
  long long v20 = +[SLHighlightsCache highlightFetchQueue];
  dispatch_after(v19, v20, v18);

  __int16 v21 = _Block_copy(v18);
  objc_destroyWeak(&v24);
  objc_destroyWeak(buf);

  return v21;
}

- (NSArray)highlights
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__8;
  uint64_t v13 = __Block_byref_object_dispose__8;
  id v14 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__8;
  v7[4] = __Block_byref_object_dispose__8;
  id v8 = [(SLHighlightsCache *)self appIdentifier];
  id v3 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SLHighlightsCache_highlights__block_invoke;
  block[3] = &unk_1E58A90B0;
  void block[4] = self;
  void block[5] = &v9;
  block[6] = v7;
  dispatch_sync(v3, block);

  id v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);
  return (NSArray *)v4;
}

- (OS_dispatch_queue)threadSafePropertyQueue
{
  return self->_threadSafePropertyQueue;
}

- (NSString)appIdentifier
{
  id v3 = [(SLInteractionHandler *)self->_interactionHandler appIdentifier];
  if (v3)
  {
    id v4 = [(SLInteractionHandler *)self->_interactionHandler appIdentifier];
  }
  else
  {
    id v4 = @"highlights";
  }

  return (NSString *)v4;
}

- (void)setInitialFetchGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SLHighlightsCache_setInitialFetchGroup___block_invoke;
  v7[3] = &unk_1E58A8680;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

+ (id)userInitiatedHighlightFetchQueue
{
  if (userInitiatedHighlightFetchQueue_onceToken != -1) {
    dispatch_once(&userInitiatedHighlightFetchQueue_onceToken, &__block_literal_global_11);
  }
  id v2 = (void *)userInitiatedHighlightFetchQueue_queue;
  return v2;
}

- (id)currentDelegates
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__8;
  uint64_t v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  id v3 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SLHighlightsCache_currentDelegates__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SLHighlightsCache_addDelegate___block_invoke;
  v7[3] = &unk_1E58A8680;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

+ (id)sharedCache
{
  id WeakRetained = (SLHighlightsCache *)objc_loadWeakRetained(&sSharedCache);
  if (!WeakRetained)
  {
    id WeakRetained = objc_alloc_init(SLHighlightsCache);
    objc_storeWeak(&sSharedCache, WeakRetained);
  }
  return WeakRetained;
}

- (SLHighlightsCache)init
{
  v19.receiver = self;
  v19.super_class = (Class)SLHighlightsCache;
  id v2 = [(SLHighlightsCache *)&v19 init];
  id v3 = v2;
  if (v2)
  {
    v2->_notificationTokenRefreshHighlights = -1;
    v2->_notificationTokenDeleteHighlights = -1;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SocialLayer.PropertyQueue", v4);
    threadSafePropertyQueue = v3->_threadSafePropertyQueue;
    v3->_threadSafePropertyQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    highlightsCache = v3->_highlightsCache;
    v3->_highlightsCache = v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v3->_delegates;
    v3->_delegates = (NSHashTable *)v9;

    dispatch_group_t v11 = dispatch_group_create();
    initialFetchGroup = v3->_initialFetchGroup;
    v3->_initialFetchGroup = (OS_dispatch_group *)v11;

    uint64_t v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.SocialLayer.InitialFetchWaitingQueue", v13);
    initialFetchWaitingQueue = v3->_initialFetchWaitingQueue;
    v3->_initialFetchWaitingQueue = (OS_dispatch_queue *)v14;

    dispatch_group_enter((dispatch_group_t)v3->_initialFetchGroup);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__SLHighlightsCache_init__block_invoke;
    block[3] = &unk_1E58A8720;
    dispatch_block_t v18 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return v3;
}

void __42__SLHighlightsCache_setInitialFetchGroup___block_invoke(uint64_t a1)
{
}

uint64_t __52__SLHighlightsCache_setClientUpdateHighlightsBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = _Block_copy(*(const void **)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

uint64_t __48__SLHighlightsCache_clientUpdateHighlightsBlock__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 40));
  return MEMORY[0x1F41817F8]();
}

void __37__SLHighlightsCache_currentDelegates__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegates];
  id v2 = [v6 allObjects];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

uint64_t __33__SLHighlightsCache_addDelegate___block_invoke(uint64_t a1)
{
  id v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33__SLHighlightsCache_addDelegate___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return [*(id *)(*(void *)(a1 + 40) + 56) addObject:*(void *)(a1 + 32)];
}

void __40__SLHighlightsCache_highlightFetchQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SocialLayer.HighlightFetchQueue", v2);
  v1 = (void *)highlightFetchQueue_queue;
  highlightFetchQueue_queue = (uint64_t)v0;
}

- (void)runAfterInitialFetch:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(SLHighlightsCache *)self initialFetchWaitingQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke;
  v11[3] = &unk_1E58A9010;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained initialFetchGroup];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  if (v3)
  {
    uint64_t v4 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[SLHighlightsCache runAfterInitialFetch:onQueue:]_block_invoke";
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_INFO, "%s Waiting on initial fetch group before running target block.", buf, 0xCu);
    }

    uint64_t v5 = [WeakRetained initialFetchGroup];
    dispatch_time_t v6 = dispatch_time(0, 3000000000);
    intptr_t v7 = dispatch_group_wait(v5, v6);

    if (v7) {
      *((unsigned char *)v26 + 24) = 1;
    }
    uint64_t v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (*((unsigned char *)v26 + 24)) {
        id v9 = @"YES";
      }
      else {
        id v9 = @"NO";
      }
      *(_DWORD *)buf = 136315394;
      v30 = "-[SLHighlightsCache runAfterInitialFetch:onQueue:]_block_invoke";
      __int16 v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_INFO, "%s Finished waiting on initial fetch group, and invoking target block. didTimeout: %@", buf, 0x16u);
    }

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_22;
    v23[3] = &unk_1E58A8FE8;
    id v10 = (id *)v24;
    dispatch_group_t v11 = *(NSObject **)(a1 + 32);
    v24[0] = *(id *)(a1 + 40);
    v24[1] = &v25;
    id v12 = v23;
  }
  else
  {
    id v13 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_24;
    v21[3] = &unk_1E58A8FE8;
    id v10 = (id *)v22;
    dispatch_group_t v11 = *(NSObject **)(a1 + 32);
    v22[0] = *(id *)(a1 + 40);
    v22[1] = &v25;
    id v12 = v21;
  }
  dispatch_async(v11, v12);

  _Block_object_dispose(&v25, 8);
}

uint64_t __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SLHighlightsCache_removeDelegate___block_invoke;
  v7[3] = &unk_1E58A8680;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

uint64_t __36__SLHighlightsCache_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __36__SLHighlightsCache_removeDelegate___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return [*(id *)(*(void *)(a1 + 40) + 56) removeObject:*(void *)(a1 + 32)];
}

void __43__SLHighlightsCache__registerNotifications__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_19BE17000, v1, OS_LOG_TYPE_DEFAULT, "_updateHighlights for SLSocialHighlightsRefreshedNotification: ", v3, 2u);
  }

  id v2 = objc_loadWeakRetained(&to);
  [v2 _updateHighlightsForSystemNotification];

  objc_destroyWeak(&to);
}

void __43__SLHighlightsCache__registerNotifications__block_invoke_31(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_19BE17000, v1, OS_LOG_TYPE_DEFAULT, "_updateHighlights for SLScreenTimeConversationDidObserveChangesNotification: ", v3, 2u);
  }

  id v2 = objc_loadWeakRetained(&to);
  [v2 _updateHighlightsForSystemNotification];

  objc_destroyWeak(&to);
}

void __43__SLHighlightsCache__registerNotifications__block_invoke_33(uint64_t a1)
{
  id v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "SLHighlightsCache notify_register_dispatch: com.apple.spotlight.SyndicatedContentDeleted observed.", buf, 2u);
  }

  objc_copyWeak(&to, (id *)(a1 + 32));
  id v3 = objc_loadWeakRetained(&to);
  [v3 didDeleteHighlightsOrAttributions];

  objc_destroyWeak(&to);
}

- (void)_updateHighlightsForSystemNotification
{
  id v3 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "_updateHighlightsForSystemNotification: ", v6, 2u);
  }

  uint64_t v4 = [(SLHighlightsCache *)self systemUpdateHighlightsBlock];
  uint64_t v5 = [(SLHighlightsCache *)self _updateHighlightsWithPreviousUpdateBlock:v4 debounceInterval:5];
  [(SLHighlightsCache *)self setSystemUpdateHighlightsBlock:v5];
}

- (void)didDeleteHighlightsOrAttributions
{
}

void __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    id v3 = [*(id *)(a1 + 32) highlights];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_3();
      }

      id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v7 = [*(id *)(a1 + 32) highlights];
      uint64_t v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
      id v10 = [*(id *)(a1 + 32) highlights];
      dispatch_group_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v52 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            uint64_t v18 = [v17 identifier];
            [v8 setObject:v17 forKey:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v51 objects:v57 count:16];
        }
        while (v14);
      }

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      uint64_t v19 = [*(id *)(a1 + 32) highlights];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v48 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            uint64_t v25 = [v24 identifier];
            [v11 setObject:v24 forKey:v25];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v56 count:16];
        }
        while (v21);
      }
      uint64_t v26 = a1;

      v42 = v11;
      uint64_t v27 = [v11 allKeys];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      char v28 = [v8 allKeys];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v55 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v44;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v44 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v43 + 1) + 8 * k);
            char v34 = [v27 containsObject:v33];
            v35 = [v8 objectForKey:v33];
            if (v34)
            {
              v36 = [v42 objectForKey:v33];
              if (([v35 isEqual:v36] & 1) == 0) {
                *(unsigned char *)(*(void *)(*(void *)(v26 + 56) + 8) + 24) = 1;
              }
            }
            else
            {
              [*(id *)(*(void *)(*(void *)(v26 + 48) + 8) + 40) addObject:v35];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v55 count:16];
        }
        while (v30);
      }

      uint64_t v37 = [*(id *)(*(void *)(*(void *)(v26 + 48) + 8) + 40) count];
      v38 = SLFrameworkLogHandle();
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
      if (v37)
      {
        if (v39) {
          __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_2(v26 + 48);
        }

        [*(id *)(v26 + 32) _notifyDelegatesWithNotificationType:2 withHighlights:*(void *)(*(void *)(*(void *)(v26 + 48) + 8) + 40)];
      }
      else
      {
        if (v39) {
          __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_1();
        }
      }
      if (*(unsigned char *)(*(void *)(*(void *)(v26 + 56) + 8) + 24)) {
        [*(id *)(v26 + 32) _notifyDelegatesWithNotificationType:1 withHighlights:0];
      }
    }
    else
    {
      v40 = *(void **)(a1 + 32);
      uint64_t v41 = *(void *)(a1 + 40);
      [v40 _notifyDelegatesWithNotificationType:2 withHighlights:v41];
    }
  }
}

- (void)_notifyDelegatesWithNotificationType:(int64_t)a3 withHighlights:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(SLHighlightsCache *)self currentDelegates];
  uint64_t v8 = v7;
  switch(a3)
  {
    case 2:
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v16 = [v7 countByEnumeratingWithState:&v28 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v8);
            }
            uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              [v20 legacyDidRemoveHighlights:v6];
            }
            else
            {
              uint64_t v21 = SLFrameworkLogHandle();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                -[SLHighlightsCache _notifyDelegatesWithNotificationType:withHighlights:].cold.4(&v38, v39);
              }
            }
          }
          uint64_t v17 = [v8 countByEnumeratingWithState:&v28 objects:v44 count:16];
        }
        while (v17);
      }
      break;
    case 1:
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v22 = [v7 countByEnumeratingWithState:&v32 objects:v45 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v33 != v24) {
              objc_enumerationMutation(v8);
            }
            uint64_t v26 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            if (objc_opt_respondsToSelector())
            {
              [v26 legacyDidAddHighlights];
            }
            else
            {
              uint64_t v27 = SLFrameworkLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke_cold_1(&v38, v39);
              }
            }
          }
          uint64_t v23 = [v8 countByEnumeratingWithState:&v32 objects:v45 count:16];
        }
        while (v23);
      }
      break;
    case 0:
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v41;
        do
        {
          for (uint64_t k = 0; k != v10; ++k)
          {
            if (*(void *)v41 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * k);
            uint64_t v14 = SLFrameworkLogHandle();
            uint64_t v15 = v14;
            if (v13)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
                -[SLHighlightsCache _notifyDelegatesWithNotificationType:withHighlights:](&v38, v39);
              }

              [v13 highlightsChanged];
            }
            else
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                -[SLHighlightsCache _notifyDelegatesWithNotificationType:withHighlights:](&v36, v37);
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v10);
      }
      break;
  }
}

- (id)systemUpdateHighlightsBlock
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40;
  uint64_t v11 = __Block_byref_object_dispose__41;
  id v12 = 0;
  id v3 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SLHighlightsCache_systemUpdateHighlightsBlock__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  uint64_t v4 = _Block_copy((const void *)v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __48__SLHighlightsCache_systemUpdateHighlightsBlock__block_invoke(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setSystemUpdateHighlightsBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLHighlightsCache *)self threadSafePropertyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SLHighlightsCache_setSystemUpdateHighlightsBlock___block_invoke;
  v7[3] = &unk_1E58A9088;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

uint64_t __52__SLHighlightsCache_setSystemUpdateHighlightsBlock___block_invoke(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v3 + 48) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

void __35__SLHighlightsCache_setHighlights___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 24);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithArray:a1[5]];
  [v2 setObject:v3 forKey:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

uint64_t __35__SLHighlightsCache_setHighlights___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegatesWithNotificationType:0 withHighlights:0];
}

- (void)fetchHighlightsWithLimit:(unint64_t)a3 variant:(id)a4 completionBlock:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    unint64_t v12 = a3;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "Fetching highlights with limit: %lu", (uint8_t *)&v11, 0xCu);
  }

  [(SLHighlightsCache *)self fetchHighlightsWithLimit:a3 reason:0 variant:v9 completionBlock:v8];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLHighlightsConsumer: Dealloc called. Canceling listening to highlight change notifcations", v2, v3, v4, v5, v6);
}

- (NSMutableDictionary)highlightsCache
{
  return self->_highlightsCache;
}

- (void)setHighlightsCache:(id)a3
{
}

- (void)setDelegates:(id)a3
{
}

- (void)setInteractionHandler:(id)a3
{
}

- (OS_dispatch_queue)initialFetchWaitingQueue
{
  return self->_initialFetchWaitingQueue;
}

- (void)setInitialFetchWaitingQueue:(id)a3
{
}

- (int)notificationTokenRefreshHighlights
{
  return self->_notificationTokenRefreshHighlights;
}

- (int)notificationTokenScreenTimeChange
{
  return self->_notificationTokenScreenTimeChange;
}

- (int)notificationTokenDeleteHighlights
{
  return self->_notificationTokenDeleteHighlights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialFetchWaitingQueue, 0);
  objc_storeStrong((id *)&self->_threadSafePropertyQueue, 0);
  objc_storeStrong((id *)&self->_interactionHandler, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong(&self->_systemUpdateHighlightsBlock, 0);
  objc_storeStrong(&self->_clientUpdateHighlightsBlock, 0);
  objc_storeStrong((id *)&self->_initialFetchGroup, 0);
  objc_storeStrong((id *)&self->_highlightsCache, 0);
}

void __50__SLHighlightsCache_runAfterInitialFetch_onQueue___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__SLHighlightsCache_addDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __36__SLHighlightsCache_removeDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)interactionHandler
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "Initializing Highlights cache with applicationIdentifier: %@", v2, v3, v4, v5, v6);
}

- (void)_updateHighlightsWithPreviousUpdateBlock:(uint64_t)a3 debounceInterval:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__SLHighlightsCache__fetchAndUpdateHighlightsImmediately__block_invoke_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_3(a1, a2);
  OUTLINED_FUNCTION_4_1(&dword_19BE17000, v2, v3, "Delegate does not respond to legacyDidAddHighlights", v4);
}

void __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLHighlightsCache didDeleteHighlightsOrAttributions: No highlights were found to have been deleted.", v2, v3, v4, v5, v6);
}

void __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_2(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)a1 + 8) + 40) count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v1, v2, "SLHighlightsCache didDeleteHighlightsOrAttributions: Notify delegates of deletion of %lu highlights", v3, v4, v5, v6, v7);
}

void __54__SLHighlightsCache_didDeleteHighlightsOrAttributions__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLHighlightsCache didDeleteHighlightsOrAttributions: successfully fetched new highlights", v2, v3, v4, v5, v6);
}

- (void)_notifyDelegatesWithNotificationType:(unsigned char *)a1 withHighlights:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_3(a1, a2);
  OUTLINED_FUNCTION_4_1(&dword_19BE17000, v2, v3, "Delegate does not respond to highlightsChanged", v4);
}

- (void)_notifyDelegatesWithNotificationType:(unsigned char *)a1 withHighlights:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_3(a1, a2);
  _os_log_debug_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEBUG, "Informing delegate highlights did change.", v3, 2u);
}

- (void)_notifyDelegatesWithNotificationType:(unsigned char *)a1 withHighlights:(unsigned char *)a2 .cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_3(a1, a2);
  OUTLINED_FUNCTION_4_1(&dword_19BE17000, v2, v3, "Delegate does not respond to legacyDidRemoveHighlights", v4);
}

void __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "in completion block", v2, v3, v4, v5, v6);
}

void __77__SLHighlightsCache_fetchHighlightsWithLimit_reason_variant_completionBlock___block_invoke_2_cold_2(id *a1)
{
  [*a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v1, v2, "Got %tu results from InteractionHandler", v3, v4, v5, v6, v7);
}

@end