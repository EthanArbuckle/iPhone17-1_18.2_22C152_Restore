@interface SESXPCEventListener
+ (id)registerOnStream:(id)a3 forEvent:(id)a4 handler:(id)a5;
+ (id)sharedObject;
+ (void)kickoff;
- (SESXPCEventListener)init;
- (os_state_data_s)_dumpState;
- (void)_handleEvent:(id)a3 payload:(id)a4;
@end

@implementation SESXPCEventListener

+ (id)sharedObject
{
  if (sharedObject_onceToken_0 != -1) {
    dispatch_once(&sharedObject_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedObject_sharedObject_0;

  return v2;
}

uint64_t __35__SESXPCEventListener_sharedObject__block_invoke()
{
  sharedObject_sharedObject_0 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (SESXPCEventListener)init
{
  v13.receiver = self;
  v13.super_class = (Class)SESXPCEventListener;
  v2 = [(SESXPCEventListener *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.seserviced.sesxpclistener", v4);
    queue = v2->queue;
    v2->queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    registeredDelegates = v2->registeredDelegates;
    v2->registeredDelegates = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    pendingEvents = v2->pendingEvents;
    v2->pendingEvents = (NSMutableDictionary *)v9;

    v12 = v2;
    os_state_add_handler();
  }
  return v2;
}

uint64_t __27__SESXPCEventListener_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dumpState];
}

+ (void)kickoff
{
  id v2 = +[SESXPCEventListener sharedObject];
}

+ (id)registerOnStream:(id)a3 forEvent:(id)a4 handler:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[SESXPCEventListener sharedObject];
  dispatch_assert_queue_not_V2(v10[1]);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v11 = v10[1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SESXPCEventListener_registerOnStream_forEvent_handler___block_invoke;
  block[3] = &unk_2655D66B0;
  v12 = v10;
  v21 = v12;
  id v13 = v7;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  id v15 = v8;
  id v24 = v15;
  v25 = &v26;
  dispatch_sync(v11, block);
  v16 = SESDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = [(id)v27[5] count];
    *(_DWORD *)buf = 138412546;
    id v33 = v13;
    __int16 v34 = 1024;
    int v35 = v17;
    _os_log_impl(&dword_263826000, v16, OS_LOG_TYPE_INFO, "Registered client for stream %@ and returning %u pending events", buf, 0x12u);
  }

  id v18 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v18;
}

void __57__SESXPCEventListener_registerOnStream_forEvent_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = v2;
    [v2 addPointer:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) UTF8String];
    [*(id *)(a1 + 56) UTF8String];
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_set_event();
  }
  else
  {
    v3 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    [v3 addPointer:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
    dispatch_queue_t v5 = (const char *)[*(id *)(a1 + 40) UTF8String];
    v6 = *(void **)(a1 + 32);
    id v7 = v6[1];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __57__SESXPCEventListener_registerOnStream_forEvent_handler___block_invoke_2;
    v16 = &unk_2655D6688;
    int v17 = v6;
    id v18 = *(id *)(a1 + 40);
    xpc_set_event_stream_handler(v5, v7, &v13);
    id v8 = *(id *)(a1 + 40);
    [v8 UTF8String:v13, v14, v15, v16];
    [*(id *)(a1 + 56) UTF8String];
    xpc_object_t v9 = xpc_dictionary_create_empty();
    xpc_set_event();

    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
    }
  }
}

uint64_t __57__SESXPCEventListener_registerOnStream_forEvent_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEvent:*(void *)(a1 + 40) payload:a2];
}

- (void)_handleEvent:(id)a3 payload:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->queue);
  id v8 = [(NSMutableDictionary *)self->registeredDelegates objectForKey:v6];
  xpc_object_t v9 = SESDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2048;
    uint64_t v25 = [v8 count];
    _os_log_impl(&dword_263826000, v9, OS_LOG_TYPE_INFO, "Received event on stream %@ have %lu delegates", buf, 0x16u);
  }

  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v15) {
            [v15 onEvent:v6 eventPayload:v7, v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v10 = [(NSMutableDictionary *)self->pendingEvents objectForKeyedSubscript:v6];
    if (!self->pendingEvents)
    {
      uint64_t v16 = objc_opt_new();

      [(NSMutableDictionary *)self->pendingEvents setObject:v16 forKeyedSubscript:v6];
      id v10 = (id)v16;
    }
    [v10 addObject:v7];
  }
}

- (os_state_data_s)_dumpState
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"registeredStreams";
  v3 = [(NSMutableDictionary *)self->registeredDelegates keyEnumerator];
  v4 = [v3 allObjects];
  v11[1] = @"pendingEvents";
  v12[0] = v4;
  dispatch_queue_t v5 = [(NSMutableDictionary *)self->pendingEvents allKeys];
  v12[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  id v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:v6 format:200 options:0 error:0];
  id v8 = (os_state_data_s *)malloc_type_calloc(1uLL, [v7 length] + 200, 0xD8CAA496uLL);
  v8->var0 = 1;
  v8->var1.var1 = [v7 length];
  __strlcpy_chk();
  id v9 = v7;
  memcpy(v8->var4, (const void *)[v9 bytes], [v9 length]);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pendingEvents, 0);
  objc_storeStrong((id *)&self->registeredDelegates, 0);

  objc_storeStrong((id *)&self->queue, 0);
}

@end