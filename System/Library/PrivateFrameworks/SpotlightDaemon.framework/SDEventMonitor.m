@interface SDEventMonitor
+ (id)sharedInstance;
- (NSMutableDictionary)eventHandlers;
- (OS_dispatch_queue)queue;
- (SDEventMonitor)init;
- (id)_init;
- (void)_startMonitoringEventsForStream:(unint64_t)a3;
- (void)registerHandler:(id)a3 forEventName:(id)a4;
- (void)setEventHandlers:(id)a3;
- (void)setQueue:(id)a3;
- (void)startMonitoringEvents;
- (void)unregisterHandler:(id)a3 forEventName:(id)a4;
@end

@implementation SDEventMonitor

- (SDEventMonitor)init
{
  return 0;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)SDEventMonitor;
  v2 = [(SDEventMonitor *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.searchd.eventMonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    eventHandlers = v2->_eventHandlers;
    v2->_eventHandlers = (NSMutableDictionary *)v6;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SDEventMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __32__SDEventMonitor_sharedInstance__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) _init];
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)startMonitoringEvents
{
  [(SDEventMonitor *)self _startMonitoringEventsForStream:1];
  [(SDEventMonitor *)self _startMonitoringEventsForStream:0];
}

- (void)_startMonitoringEventsForStream:(unint64_t)a3
{
  v5 = "com.apple.distnoted.matching";
  if (a3 != 1) {
    v5 = 0;
  }
  if (a3) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = "com.apple.notifyd.matching";
  }
  v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SDEventMonitor _startMonitoringEventsForStream:]((uint64_t)v6, v7);
  }

  v8 = [(SDEventMonitor *)self queue];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke;
  handler[3] = &unk_264509268;
  handler[4] = self;
  handler[5] = v6;
  handler[6] = a3;
  xpc_set_event_stream_handler(v6, v8, handler);
}

void __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_queue_t v4 = objc_msgSend(NSString, "stringWithCString:encoding:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86C8]), 4);
  v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "Received \"%s\" notification for keyName:%@", buf, 0x16u);
  }

  v7 = [*(id *)(a1 + 32) eventHandlers];
  v8 = [v7 objectForKeyedSubscript:v4];

  if (v8)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke_6;
    v18[3] = &unk_264509240;
    id v19 = v8;
    uint64_t v9 = MEMORY[0x223C48320](v18);
    v10 = (void (**)(void, void, void, void, void))v9;
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11 != 1)
    {
      if (!v11) {
        (*(void (**)(uint64_t, void, void *, void, void))(v9 + 16))(v9, *(void *)(a1 + 32), v4, 0, 0);
      }
      goto LABEL_17;
    }
    uint64_t v12 = xpc_dictionary_get_value(v3, "UserInfo");
    v13 = (void *)v12;
    if (v12)
    {
      if (MEMORY[0x223C48A20](v12) == MEMORY[0x263EF8708])
      {
        v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        if (v16)
        {
          v17 = 0;
        }
        else
        {
          v17 = _SDEventMonitorErrorMake(@"Failed to convert user info XPC dictionary to CF dictionary.");
        }
        ((void (**)(void, void, void *, void *, void *))v10)[2](v10, *(void *)(a1 + 32), v4, v16, v17);

        goto LABEL_16;
      }
      v14 = @"User info was not a dictionary.";
    }
    else
    {
      v14 = @"Didn't get any user info from event.";
    }
    v15 = _SDEventMonitorErrorMake(v14);
    ((void (**)(void, void, void *, void, void *))v10)[2](v10, *(void *)(a1 + 32), v4, 0, v15);

LABEL_16:
LABEL_17:
  }
}

void __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * v16);
        v18 = SDTransactionCreate(&unk_26D0C8E90);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke_2;
        block[3] = &unk_264509218;
        uint64_t v27 = v17;
        id v22 = v9;
        id v23 = v10;
        id v24 = v11;
        id v25 = v12;
        id v26 = v18;
        id v19 = v18;
        dispatch_async(MEMORY[0x263EF83A0], block);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }
}

void __50__SDEventMonitor__startMonitoringEventsForStream___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  v2 = *(void **)(a1 + 64);
  SDTransactionDone(v2);
}

- (void)registerHandler:(id)a3 forEventName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SDEventMonitor registerHandler:forEventName:]((uint64_t)v7, v8);
  }

  id v9 = [(SDEventMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SDEventMonitor_registerHandler_forEventName___block_invoke;
  block[3] = &unk_264507140;
  void block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync(v9, block);
}

void __47__SDEventMonitor_registerHandler_forEventName___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventHandlers];
  id v5 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v5)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    id v3 = [*(id *)(a1 + 32) eventHandlers];
    [v3 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  dispatch_queue_t v4 = (void *)[*(id *)(a1 + 48) copy];
  [v5 addObject:v4];
}

- (void)unregisterHandler:(id)a3 forEventName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SDEventMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SDEventMonitor_unregisterHandler_forEventName___block_invoke;
  block[3] = &unk_264507140;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __49__SDEventMonitor_unregisterHandler_forEventName___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) eventHandlers];
  v2 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = (void *)MEMORY[0x223C48320](*(void *)(a1 + 48));
  [v2 removeObject:v3];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)eventHandlers
{
  return self->_eventHandlers;
}

- (void)setEventHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_startMonitoringEventsForStream:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "Monitoring notifications for \"%s\"", (uint8_t *)&v2, 0xCu);
}

- (void)registerHandler:(uint64_t)a1 forEventName:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "Registering handler for \"%@\"", (uint8_t *)&v2, 0xCu);
}

@end