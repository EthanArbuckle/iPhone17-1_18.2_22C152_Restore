@interface BYSetupStateNotifier
+ (id)sharedNotifier;
- (BOOL)shouldRelaunchSetup;
- (BYSetupStateNotifier)init;
- (NSMutableArray)exclusiveNotificationBlocks;
- (NSMutableArray)generalStateNotificationBlocks;
- (NSMutableArray)relaunchStateNotificationBlocks;
- (NSMutableDictionary)specificStateNotificationBlocks;
- (OS_dispatch_queue)notificationQueue;
- (int)exclusiveNotificationToken;
- (int)shouldRemainAliveNotificationToken;
- (int)stateNotificationToken;
- (unint64_t)currentState;
- (unint64_t)state;
- (void)_beginObservingState;
- (void)_endObservingState;
- (void)_noLongerExclusiveNotificationFired;
- (void)_shouldRemainAliveNotificationFired;
- (void)_stateChangedTo:(unint64_t)a3;
- (void)addObserverWhenSetupIsNoLongerExclusiveWithNotificationBlock:(id)a3;
- (void)addRelaunchStateChangeObserver:(id)a3;
- (void)addStateChangeObserver:(id)a3;
- (void)addStateCompletionObserver:(id)a3 forState:(unint64_t)a4;
- (void)dealloc;
- (void)notifySetupShouldRemainAlive;
- (void)notifyStateChangedTo:(unint64_t)a3;
- (void)setExclusiveNotificationBlocks:(id)a3;
- (void)setExclusiveNotificationToken:(int)a3;
- (void)setGeneralStateNotificationBlocks:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setRelaunchStateNotificationBlocks:(id)a3;
- (void)setShouldRelaunchSetup:(BOOL)a3;
- (void)setShouldRemainAliveNotificationToken:(int)a3;
- (void)setSpecificStateNotificationBlocks:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateNotificationToken:(int)a3;
@end

@implementation BYSetupStateNotifier

uint64_t __36__BYSetupStateNotifier_currentState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (unint64_t)currentState
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(BYSetupStateNotifier *)self notificationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__BYSetupStateNotifier_currentState__block_invoke;
  v6[3] = &unk_1E5D2CE38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (id)sharedNotifier
{
  if (sharedNotifier_onceToken != -1) {
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)sharedNotifier_notifier;
  return v2;
}

uint64_t __38__BYSetupStateNotifier_sharedNotifier__block_invoke()
{
  sharedNotifier_notifier = objc_alloc_init(BYSetupStateNotifier);
  return MEMORY[0x1F41817F8]();
}

- (BYSetupStateNotifier)init
{
  v15.receiver = self;
  v15.super_class = (Class)BYSetupStateNotifier;
  v2 = [(BYSetupStateNotifier *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    dispatch_queue_t v4 = dispatch_queue_create("Setup State Notification Queue", 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    generalStateNotificationBlocks = v3->_generalStateNotificationBlocks;
    v3->_generalStateNotificationBlocks = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    specificStateNotificationBlocks = v3->_specificStateNotificationBlocks;
    v3->_specificStateNotificationBlocks = v8;

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    exclusiveNotificationBlocks = v3->_exclusiveNotificationBlocks;
    v3->_exclusiveNotificationBlocks = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    relaunchStateNotificationBlocks = v3->_relaunchStateNotificationBlocks;
    v3->_relaunchStateNotificationBlocks = v12;

    [(BYSetupStateNotifier *)v3 _beginObservingState];
  }
  return v3;
}

- (void)dealloc
{
  [(BYSetupStateNotifier *)self _endObservingState];
  v3.receiver = self;
  v3.super_class = (Class)BYSetupStateNotifier;
  [(BYSetupStateNotifier *)&v3 dealloc];
}

- (void)addStateChangeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(BYSetupStateNotifier *)self notificationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__BYSetupStateNotifier_addStateChangeObserver___block_invoke;
  v7[3] = &unk_1E5D2C1E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __47__BYSetupStateNotifier_addStateChangeObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) generalStateNotificationBlocks];
  objc_super v3 = (void *)MEMORY[0x1AD0DBFE0](*(void *)(a1 + 40));
  [v2 addObject:v3];

  if ([*(id *)(a1 + 32) state])
  {
    id v4 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__BYSetupStateNotifier_addStateChangeObserver___block_invoke_2;
    v6[3] = &unk_1E5D2CE60;
    id v5 = *(id *)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    dispatch_async(v4, v6);
  }
}

uint64_t __47__BYSetupStateNotifier_addStateChangeObserver___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) state];
  objc_super v3 = *(uint64_t (**)(uint64_t, void, uint64_t))(v1 + 16);
  return v3(v1, 0, v2);
}

- (void)addStateCompletionObserver:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(BYSetupStateNotifier *)self notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BYSetupStateNotifier_addStateCompletionObserver_forState___block_invoke;
  block[3] = &unk_1E5D2CE88;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(v7, block);
}

void __60__BYSetupStateNotifier_addStateCompletionObserver_forState___block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) state] >= *(void *)(a1 + 48))
  {
    uint64_t v2 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__BYSetupStateNotifier_addStateCompletionObserver_forState___block_invoke_2;
    block[3] = &unk_1E5D2C028;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(v2, block);
  }
  objc_super v3 = [*(id *)(a1 + 32) specificStateNotificationBlocks];
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v6 = (void *)MEMORY[0x1AD0DBFE0](*(void *)(a1 + 40));
  [v5 addObject:v6];

  id v7 = [*(id *)(a1 + 32) specificStateNotificationBlocks];
  id v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v7 setObject:v5 forKeyedSubscript:v8];
}

uint64_t __60__BYSetupStateNotifier_addStateCompletionObserver_forState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addObserverWhenSetupIsNoLongerExclusiveWithNotificationBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(BYSetupStateNotifier *)self notificationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__BYSetupStateNotifier_addObserverWhenSetupIsNoLongerExclusiveWithNotificationBlock___block_invoke;
  v7[3] = &unk_1E5D2C1E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __85__BYSetupStateNotifier_addObserverWhenSetupIsNoLongerExclusiveWithNotificationBlock___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) exclusiveNotificationBlocks];
  uint64_t v2 = (void *)MEMORY[0x1AD0DBFE0](*(void *)(a1 + 40));
  [v3 addObject:v2];
}

- (void)addRelaunchStateChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(BYSetupStateNotifier *)self notificationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__BYSetupStateNotifier_addRelaunchStateChangeObserver___block_invoke;
  v7[3] = &unk_1E5D2C1E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __55__BYSetupStateNotifier_addRelaunchStateChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) relaunchStateNotificationBlocks];
  id v3 = (void *)MEMORY[0x1AD0DBFE0](*(void *)(a1 + 40));
  [v2 addObject:v3];

  id v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__BYSetupStateNotifier_addRelaunchStateChangeObserver___block_invoke_2;
  v6[3] = &unk_1E5D2CE60;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v4, v6);
}

uint64_t __55__BYSetupStateNotifier_addRelaunchStateChangeObserver___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) shouldRelaunchSetup];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)notifyStateChangedTo:(unint64_t)a3
{
  if (a3 - 1 <= 2)
  {
    id v5 = (CFNotificationName *)(&off_1E5D2CEF8)[a3 - 1];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, *v5, 0, 0, 0);
  }
  BOOL is_valid_token = notify_is_valid_token([(BYSetupStateNotifier *)self stateNotificationToken]);
  id v8 = _BYLoggingFacility();
  uint64_t v9 = v8;
  if (!is_valid_token)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BYSetupStateNotifier notifyStateChangedTo:].cold.4(v9);
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BYSetupStateNotifier notifyStateChangedTo:](a3, v9);
  }

  uint32_t v10 = notify_set_state([(BYSetupStateNotifier *)self stateNotificationToken], a3);
  if (v10)
  {
    int v11 = v10;
    v12 = _BYLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(BYSetupStateNotifier *)a3 notifyStateChangedTo:v12];
    }
  }
  if (notify_post("com.apple.purplebuddy.setupStateChanged"))
  {
    uint64_t v9 = _BYLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BYSetupStateNotifier notifyStateChangedTo:]();
    }
LABEL_15:
  }
}

- (void)notifySetupShouldRemainAlive
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A7DED000, log, OS_LOG_TYPE_DEBUG, "Updating remaining alive notification...", v1, 2u);
}

- (void)_beginObservingState
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A7DED000, v0, v1, "Failed to get the register for state notification changes: %d", v2, v3, v4, v5, v6);
}

void __44__BYSetupStateNotifier__beginObservingState__block_invoke(uint64_t a1)
{
  uint64_t state64 = 0;
  if (notify_get_state([*(id *)(a1 + 32) stateNotificationToken], &state64))
  {
    uint64_t v2 = _BYLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __44__BYSetupStateNotifier__beginObservingState__block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _stateChangedTo:state64];
  }
}

uint64_t __44__BYSetupStateNotifier__beginObservingState__block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) stateNotificationToken];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

uint64_t __44__BYSetupStateNotifier__beginObservingState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noLongerExclusiveNotificationFired];
}

uint64_t __44__BYSetupStateNotifier__beginObservingState__block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shouldRemainAliveNotificationFired];
}

- (void)_endObservingState
{
  notify_cancel([(BYSetupStateNotifier *)self stateNotificationToken]);
  notify_cancel([(BYSetupStateNotifier *)self exclusiveNotificationToken]);
  [(BYSetupStateNotifier *)self setStateNotificationToken:0xFFFFFFFFLL];
  [(BYSetupStateNotifier *)self setExclusiveNotificationToken:0xFFFFFFFFLL];
}

- (void)_stateChangedTo:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(BYSetupStateNotifier *)self notificationQueue];
  dispatch_assert_queue_V2(v5);

  if ([(BYSetupStateNotifier *)self state] != a3)
  {
    unint64_t v6 = [(BYSetupStateNotifier *)self state];
    [(BYSetupStateNotifier *)self setState:a3];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [(BYSetupStateNotifier *)self generalStateNotificationBlocks];
    uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * v10);
          v12 = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __40__BYSetupStateNotifier__stateChangedTo___block_invoke;
          block[3] = &unk_1E5D2CEB0;
          void block[5] = v11;
          block[6] = v6;
          void block[4] = self;
          dispatch_async(v12, block);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }

    v13 = [(BYSetupStateNotifier *)self specificStateNotificationBlocks];
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BYSetupStateNotifier state](self, "state"));
    objc_super v15 = [v13 objectForKeyedSubscript:v14];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * v20);
          v22 = dispatch_get_global_queue(0, 0);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __40__BYSetupStateNotifier__stateChangedTo___block_invoke_2;
          v24[3] = &unk_1E5D2C028;
          v24[4] = v21;
          dispatch_async(v22, v24);

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v18);
    }
  }
}

uint64_t __40__BYSetupStateNotifier__stateChangedTo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) state];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v1, v3);
}

uint64_t __40__BYSetupStateNotifier__stateChangedTo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_noLongerExclusiveNotificationFired
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v3 = [(BYSetupStateNotifier *)self exclusiveNotificationBlocks];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        uint64_t v9 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __59__BYSetupStateNotifier__noLongerExclusiveNotificationFired__block_invoke;
        block[3] = &unk_1E5D2C028;
        void block[4] = v8;
        dispatch_async(v9, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  [(BYSetupStateNotifier *)self setShouldRelaunchSetup:0];
  BOOL v10 = [(BYSetupStateNotifier *)self shouldRelaunchSetup];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [(BYSetupStateNotifier *)self relaunchStateNotificationBlocks];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
        uint64_t v17 = dispatch_get_global_queue(0, 0);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __59__BYSetupStateNotifier__noLongerExclusiveNotificationFired__block_invoke_2;
        v18[3] = &unk_1E5D2CED8;
        v18[4] = v16;
        BOOL v19 = v10;
        dispatch_async(v17, v18);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v13);
  }
}

uint64_t __59__BYSetupStateNotifier__noLongerExclusiveNotificationFired__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__BYSetupStateNotifier__noLongerExclusiveNotificationFired__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_shouldRemainAliveNotificationFired
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A7DED000, v0, v1, "Failed to get the state of the should remain alive notification: %d", v2, v3, v4, v5, v6);
}

uint64_t __59__BYSetupStateNotifier__shouldRemainAliveNotificationFired__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSMutableArray)generalStateNotificationBlocks
{
  return self->_generalStateNotificationBlocks;
}

- (void)setGeneralStateNotificationBlocks:(id)a3
{
}

- (NSMutableDictionary)specificStateNotificationBlocks
{
  return self->_specificStateNotificationBlocks;
}

- (void)setSpecificStateNotificationBlocks:(id)a3
{
}

- (NSMutableArray)exclusiveNotificationBlocks
{
  return self->_exclusiveNotificationBlocks;
}

- (void)setExclusiveNotificationBlocks:(id)a3
{
}

- (NSMutableArray)relaunchStateNotificationBlocks
{
  return self->_relaunchStateNotificationBlocks;
}

- (void)setRelaunchStateNotificationBlocks:(id)a3
{
}

- (void)setNotificationQueue:(id)a3
{
}

- (BOOL)shouldRelaunchSetup
{
  return self->_shouldRelaunchSetup;
}

- (void)setShouldRelaunchSetup:(BOOL)a3
{
  self->_shouldRelaunchSetup = a3;
}

- (int)stateNotificationToken
{
  return self->_stateNotificationToken;
}

- (void)setStateNotificationToken:(int)a3
{
  self->_stateNotificationToken = a3;
}

- (int)shouldRemainAliveNotificationToken
{
  return self->_shouldRemainAliveNotificationToken;
}

- (void)setShouldRemainAliveNotificationToken:(int)a3
{
  self->_shouldRemainAliveNotificationToken = a3;
}

- (int)exclusiveNotificationToken
{
  return self->_exclusiveNotificationToken;
}

- (void)setExclusiveNotificationToken:(int)a3
{
  self->_exclusiveNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_relaunchStateNotificationBlocks, 0);
  objc_storeStrong((id *)&self->_exclusiveNotificationBlocks, 0);
  objc_storeStrong((id *)&self->_specificStateNotificationBlocks, 0);
  objc_storeStrong((id *)&self->_generalStateNotificationBlocks, 0);
}

- (void)notifyStateChangedTo:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A7DED000, v0, v1, "Failed to post state notification: %d", v2, v3, v4, v5, v6);
}

- (void)notifyStateChangedTo:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Failed to update state notification to %ld: %d", (uint8_t *)&v3, 0x12u);
}

- (void)notifyStateChangedTo:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_DEBUG, "Updating state notification to %ld...", (uint8_t *)&v2, 0xCu);
}

- (void)notifyStateChangedTo:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Unable to update state notification; state notification token is invalid!",
    v1,
    2u);
}

void __44__BYSetupStateNotifier__beginObservingState__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A7DED000, v0, v1, "Failed to get the state of the state notification: %d", v2, v3, v4, v5, v6);
}

@end