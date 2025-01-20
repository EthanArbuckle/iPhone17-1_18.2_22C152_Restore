@interface RMXPCNotifications
+ (RMXPCNotifications)sharedNotifier;
- (BOOL)hasObserverForEvent:(id)a3;
- (BOOL)registered;
- (NSMutableDictionary)notificationObservers;
- (NSMutableSet)pendingNotifications;
- (OS_dispatch_queue)modificationQueue;
- (id)initPrivate;
- (void)_addXPCEvent:(id)a3;
- (void)_didReceiveNotificationForStream:(id)a3 notificationName:(id)a4;
- (void)_removeXPCEvent:(id)a3;
- (void)_setupEventStreamHandlerForStream:(id)a3;
- (void)_waitForQueue:(id)a3;
- (void)addObserverForEvent:(id)a3 observer:(id)a4;
- (void)registerForEvents:(id)a3;
- (void)removeObserverForEvent:(id)a3;
- (void)setModificationQueue:(id)a3;
- (void)setNotificationObservers:(id)a3;
- (void)setPendingNotifications:(id)a3;
- (void)setRegistered:(BOOL)a3;
@end

@implementation RMXPCNotifications

+ (RMXPCNotifications)sharedNotifier
{
  if (sharedNotifier_onceToken != -1) {
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_5_1);
  }
  v2 = (void *)sharedNotifier_notifier;

  return (RMXPCNotifications *)v2;
}

uint64_t __36__RMXPCNotifications_sharedNotifier__block_invoke()
{
  sharedNotifier_notifier = [[RMXPCNotifications alloc] initPrivate];

  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v12.receiver = self;
  v12.super_class = (Class)RMXPCNotifications;
  v2 = [(RMXPCNotifications *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_registered = 0;
    uint64_t v4 = objc_opt_new();
    pendingNotifications = v3->_pendingNotifications;
    v3->_pendingNotifications = (NSMutableSet *)v4;

    uint64_t v6 = objc_opt_new();
    notificationObservers = v3->_notificationObservers;
    v3->_notificationObservers = (NSMutableDictionary *)v6;

    id v8 = [NSString stringWithFormat:@"com.apple.remotemanagementd.xpcNotificationsQueue"];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 cStringUsingEncoding:4], 0);
    modificationQueue = v3->_modificationQueue;
    v3->_modificationQueue = (OS_dispatch_queue *)v9;
  }
  return v3;
}

- (void)registerForEvents:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(RMXPCNotifications *)self registered])
  {
    v5 = +[RMLog xpcNotifications];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[RMXPCNotifications registerForEvents:](v5);
    }
  }
  else
  {
    [(RMXPCNotifications *)self setRegistered:1];
    v5 = objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "streamName", (void)v12);
          if (([v5 containsObject:v11] & 1) == 0)
          {
            [(RMXPCNotifications *)self _setupEventStreamHandlerForStream:v11];
            [v5 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)hasObserverForEvent:(id)a3
{
  id v4 = a3;
  v5 = [(RMXPCNotifications *)self notificationObservers];
  id v6 = [v4 eventKey];

  uint64_t v7 = [v5 objectForKey:v6];
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (void)addObserverForEvent:(id)a3 observer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(RMXPCNotifications *)self modificationQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke;
  v11[3] = &unk_2646DD2F8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = [*(id *)(a1 + 32) eventKey];
    id v4 = [WeakRetained notificationObservers];
    v5 = [v4 objectForKey:v3];

    id v6 = +[RMLog xpcNotifications];
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke_cold_2();
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [WeakRetained notificationObservers];
      [v9 setObject:v8 forKeyedSubscript:v3];

      [WeakRetained _addXPCEvent:*(void *)(a1 + 32)];
      id v10 = [WeakRetained pendingNotifications];
      LODWORD(v9) = [v10 containsObject:v3];

      if (!v9) {
        goto LABEL_10;
      }
      v11 = [*(id *)(a1 + 32) streamName];
      id v12 = [*(id *)(a1 + 32) notificationName];
      [WeakRetained _didReceiveNotificationForStream:v11 notificationName:v12];

      id v7 = [WeakRetained pendingNotifications];
      [v7 removeObject:v3];
    }

LABEL_10:
  }
}

- (void)removeObserverForEvent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(RMXPCNotifications *)self modificationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__RMXPCNotifications_removeObserverForEvent___block_invoke;
  block[3] = &unk_2646DD320;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__RMXPCNotifications_removeObserverForEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [*(id *)(a1 + 32) eventKey];
    id v4 = [WeakRetained notificationObservers];
    v5 = [v4 objectForKey:v3];

    id v6 = +[RMLog xpcNotifications];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        __45__RMXPCNotifications_removeObserverForEvent___block_invoke_cold_2();
      }

      id v6 = [WeakRetained notificationObservers];
      [v6 removeObjectForKey:v3];
    }
    else if (v7)
    {
      __45__RMXPCNotifications_removeObserverForEvent___block_invoke_cold_1();
    }

    [WeakRetained _removeXPCEvent:*(void *)(a1 + 32)];
  }
}

- (void)_setupEventStreamHandlerForStream:(id)a3
{
  id v4 = a3;
  v5 = +[RMLog xpcNotifications];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RMXPCNotifications _setupEventStreamHandlerForStream:]();
  }

  id v6 = v4;
  BOOL v7 = (const char *)[v6 cStringUsingEncoding:4];
  id v8 = dispatch_get_global_queue(21, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__RMXPCNotifications__setupEventStreamHandlerForStream___block_invoke;
  v10[3] = &unk_2646DD348;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  xpc_set_event_stream_handler(v7, v8, v10);
}

void __56__RMXPCNotifications__setupEventStreamHandlerForStream___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  v3 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]));
  id v4 = +[RMLog xpcNotifications];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __56__RMXPCNotifications__setupEventStreamHandlerForStream___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }

  [*(id *)(a1 + 40) _didReceiveNotificationForStream:*(void *)(a1 + 32) notificationName:v3];
}

- (void)_addXPCEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 descriptor];
  id v8 = (id)_CFXPCCreateXPCObjectFromCFObject();

  id v5 = [v3 streamName];
  [v5 cStringUsingEncoding:4];
  id v6 = [v3 notificationName];

  id v7 = v6;
  [v7 cStringUsingEncoding:4];
  xpc_set_event();
}

- (void)_removeXPCEvent:(id)a3
{
  id v3 = a3;
  id v6 = [v3 streamName];
  [v6 cStringUsingEncoding:4];
  id v4 = [v3 notificationName];

  id v5 = v4;
  [v5 cStringUsingEncoding:4];
  xpc_set_event();
}

- (void)_didReceiveNotificationForStream:(id)a3 notificationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(RMXPCNotifications *)self modificationQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke;
  v11[3] = &unk_2646DD2F8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = +[RMXPCEvent eventKeyForStream:a1[4] notificationName:a1[5]];
    id v4 = [WeakRetained notificationObservers];
    id v5 = [v4 objectForKeyedSubscript:v3];

    id v6 = +[RMLog xpcNotifications];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_cold_2();
      }

      id v8 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_14;
      block[3] = &unk_2646DD370;
      id v11 = v5;
      id v12 = a1[4];
      id v13 = a1[5];
      dispatch_async(v8, block);

      id v9 = v11;
    }
    else
    {
      if (v7) {
        __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_cold_1();
      }

      id v9 = [WeakRetained pendingNotifications];
      [v9 addObject:v3];
    }
  }
}

uint64_t __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) didReceiveNotificationForStream:*(void *)(a1 + 40) notificationName:*(void *)(a1 + 48)];
}

- (void)_waitForQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(RMXPCNotifications *)self modificationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__RMXPCNotifications__waitForQueue___block_invoke;
  block[3] = &unk_2646DD398;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __36__RMXPCNotifications__waitForQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (NSMutableSet)pendingNotifications
{
  return self->_pendingNotifications;
}

- (void)setPendingNotifications:(id)a3
{
}

- (NSMutableDictionary)notificationObservers
{
  return self->_notificationObservers;
}

- (void)setNotificationObservers:(id)a3
{
}

- (OS_dispatch_queue)modificationQueue
{
  return self->_modificationQueue;
}

- (void)setModificationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);

  objc_storeStrong((id *)&self->_pendingNotifications, 0);
}

- (void)registerForEvents:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_224784000, log, OS_LOG_TYPE_FAULT, "Cannot register after registration has been done.", v1, 2u);
}

void __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "Adding observer for notification: %{public}@", v2, v3, v4, v5, v6);
}

void __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_224784000, v0, OS_LOG_TYPE_ERROR, "Only one observer can be registered for notification: %{public}@", v1, 0xCu);
}

void __45__RMXPCNotifications_removeObserverForEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "No observer registered for notification: %{public}@", v2, v3, v4, v5, v6);
}

void __45__RMXPCNotifications_removeObserverForEvent___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "Removing observer for notification: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setupEventStreamHandlerForStream:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "Adding handler for stream: %{public}@", v2, v3, v4, v5, v6);
}

void __56__RMXPCNotifications__setupEventStreamHandlerForStream___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_224784000, log, OS_LOG_TYPE_DEBUG, "Received XPC event stream: %{public}@, event name: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "Notification has no observer: %{public}@", v2, v3, v4, v5, v6);
}

void __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "Dispatching notification to observer: %{public}@", v2, v3, v4, v5, v6);
}

@end