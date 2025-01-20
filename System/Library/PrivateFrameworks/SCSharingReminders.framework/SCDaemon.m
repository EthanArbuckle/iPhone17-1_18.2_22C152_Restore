@interface SCDaemon
+ (id)sharedDaemon;
- (NSArray)XPCListenerPairs;
- (NSArray)activeXPCListenerPairs;
- (NSArray)backgroundSystemTasks;
- (NSArray)notifyDListeners;
- (OS_dispatch_queue)workQueue;
- (SCDaemon)init;
- (id)_listenersByEventName;
- (void)registerBackgroundSystemTasks;
- (void)registerXPCEventHandlers;
- (void)setActiveXPCListenerPairs:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)start;
- (void)wakeXPCListeners;
@end

@implementation SCDaemon

+ (id)sharedDaemon
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__SCDaemon_sharedDaemon__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemon_onceToken != -1) {
    dispatch_once(&sharedDaemon_onceToken, block);
  }
  v2 = (void *)sharedDaemon___sharedDaemon;
  return v2;
}

uint64_t __24__SCDaemon_sharedDaemon__block_invoke(uint64_t a1)
{
  sharedDaemon___sharedDaemon = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (SCDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCDaemon;
  v2 = [(SCDaemon *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.safetycheckd.queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)start
{
  [(SCDaemon *)self wakeXPCListeners];
  [(SCDaemon *)self registerXPCEventHandlers];
  [(SCDaemon *)self registerBackgroundSystemTasks];
}

- (void)wakeXPCListeners
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_queue_t v3 = [(SCDaemon *)self XPCListenerPairs];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) first];
        [v8 resume];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(SCDaemon *)self setActiveXPCListenerPairs:v3];
}

- (void)registerXPCEventHandlers
{
  dispatch_queue_t v3 = [(SCDaemon *)self _listenersByEventName];
  workQueue = self->_workQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __36__SCDaemon_registerXPCEventHandlers__block_invoke;
  handler[3] = &unk_265497128;
  id v7 = v3;
  id v5 = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", workQueue, handler);
}

void __36__SCDaemon_registerXPCEventHandlers__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_queue_t v3 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]));
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) handleXPCEventWithName:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)registerBackgroundSystemTasks
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_queue_t v3 = [(SCDaemon *)self backgroundSystemTasks];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        long long v9 = [(SCDaemon *)self workQueue];
        [v8 registerForTaskUsingQueue:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_listenersByEventName
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  dispatch_queue_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [(SCDaemon *)self notifyDListeners];
  uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v6 = [v5 interestedEvents];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * j);
              long long v12 = [v3 objectForKey:v11];
              if (!v12)
              {
                long long v12 = [MEMORY[0x263EFF980] array];
                [v3 setObject:v12 forKey:v11];
              }
              [v12 addObject:v5];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v8);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }

  return v3;
}

- (NSArray)XPCListenerPairs
{
  v21[1] = *MEMORY[0x263EF8340];
  long long v20 = @"com.apple.safetycheckd";
  v2 = objc_alloc_init(SCSharingReminderDelegate);
  v21[0] = v2;
  dispatch_queue_t v3 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  uint64_t v4 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v10 = [v3 valueForKey:v9];
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v9];
        [v11 setDelegate:v10];
        long long v12 = +[SCPair pairWithFirst:v11 second:v10];
        [v4 addObject:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSArray *)v4;
}

- (NSArray)notifyDListeners
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(SCSharingReminderXPCService);
  v5[0] = v2;
  dispatch_queue_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (NSArray)backgroundSystemTasks
{
  v2 = objc_opt_new();
  dispatch_queue_t v3 = +[SCSharingReminderXPCService tasks];
  [v2 addObjectsFromArray:v3];

  return (NSArray *)v2;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSArray)activeXPCListenerPairs
{
  return self->_activeXPCListenerPairs;
}

- (void)setActiveXPCListenerPairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeXPCListenerPairs, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end