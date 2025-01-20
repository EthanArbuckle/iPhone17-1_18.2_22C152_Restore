@interface AXSupportDefaultsObserver
- (AXSupportDefaultsObserver)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startObservingPreference:(__CFString *)a3 andBroadcastDarwinNotification:(__CFString *)a4 postGlobally:(BOOL)a5;
- (void)startObservingPreference:(__CFString *)a3 andPerformBlock:(id)a4;
@end

@implementation AXSupportDefaultsObserver

- (void)startObservingPreference:(__CFString *)a3 andBroadcastDarwinNotification:(__CFString *)a4 postGlobally:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = (void *)MEMORY[0x192FCB1D0](self, a2);
  v10 = [MEMORY[0x1E4F29060] currentThread];
  char v11 = [v10 isMainThread];

  if ((v11 & 1) == 0)
  {
    v12 = AXSupportLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[AXSupportDefaultsObserver startObservingPreference:andBroadcastDarwinNotification:postGlobally:]();
    }
  }
  observedPrefs = self->_observedPrefs;
  v14 = a4;
  v15 = a3;
  [(NSMutableSet *)observedPrefs addObject:v15];
  v16 = [[AXDefaultsObserverPostDarwinNotificationAction alloc] initWithDarwinNotification:v14 postGlobally:v5];

  [(NSMutableArray *)self->_actions addObject:v16];
  [(NSUserDefaults *)self->_axDomain addObserver:self forKeyPath:v15 options:3 context:v16];
}

- (AXSupportDefaultsObserver)init
{
  v15.receiver = self;
  v15.super_class = (Class)AXSupportDefaultsObserver;
  v2 = [(AXSupportDefaultsObserver *)&v15 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v4 = [v3 initWithSuiteName:kAXSAccessibilityPreferenceDomain];
    axDomain = v2->_axDomain;
    v2->_axDomain = (NSUserDefaults *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observedPrefs = v2->_observedPrefs;
    v2->_observedPrefs = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v2->_actions;
    v2->_actions = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    actionLastNotifications = v2->_actionLastNotifications;
    v2->_actionLastNotifications = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AccessibilitySupport.lastNotificationsQueue", 0);
    lastNotificationsQueue = v2->_lastNotificationsQueue;
    v2->_lastNotificationsQueue = (OS_dispatch_queue *)v12;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_observedPrefs;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSUserDefaults *)self->_axDomain removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)AXSupportDefaultsObserver;
  [(AXSupportDefaultsObserver *)&v8 dealloc];
}

- (void)startObservingPreference:(__CFString *)a3 andPerformBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x192FCB1D0]();
  objc_super v8 = [MEMORY[0x1E4F29060] currentThread];
  char v9 = [v8 isMainThread];

  if ((v9 & 1) == 0)
  {
    long long v10 = AXSupportLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[AXSupportDefaultsObserver startObservingPreference:andBroadcastDarwinNotification:postGlobally:]();
    }
  }
  observedPrefs = self->_observedPrefs;
  long long v12 = a3;
  [(NSMutableSet *)observedPrefs addObject:v12];
  v13 = [[AXDefaultsObserverExecuteBlockNotificationAction alloc] initWithBlock:v6];
  [(NSMutableArray *)self->_actions addObject:v13];
  [(NSUserDefaults *)self->_axDomain addObserver:self forKeyPath:v12 options:3 context:v13];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6)
  {
    v13 = [MEMORY[0x1E4F29238] valueWithPointer:a6];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    id v30 = 0;
    lastNotificationsQueue = self->_lastNotificationsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__AXSupportDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E568BE90;
    v24 = &v25;
    block[4] = self;
    id v15 = v13;
    id v23 = v15;
    dispatch_sync(lastNotificationsQueue, block);
    v16 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
    v17 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if (([(id)v26[5] isEqual:v12] & 1) == 0 && (objc_msgSend(v16, "isEqual:", v17) & 1) == 0)
    {
      [a6 performForChangedDefault:v10];
      if (v12)
      {
        v18 = self->_lastNotificationsQueue;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __76__AXSupportDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v19[3] = &unk_1E568BEB8;
        v19[4] = self;
        id v20 = v12;
        id v21 = v15;
        dispatch_sync(v18, v19);
      }
    }

    _Block_object_dispose(&v25, 8);
  }
}

void __76__AXSupportDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __76__AXSupportDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 32) setObject:a1[5] forKey:a1[6]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNotificationsQueue, 0);
  objc_storeStrong((id *)&self->_actionLastNotifications, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_observedPrefs, 0);

  objc_storeStrong((id *)&self->_axDomain, 0);
}

- (void)startObservingPreference:andBroadcastDarwinNotification:postGlobally:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_190274000, v0, v1, "Must observe defaults on the main thread", v2, v3, v4, v5, v6);
}

@end