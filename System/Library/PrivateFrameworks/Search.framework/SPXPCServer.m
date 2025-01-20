@interface SPXPCServer
- (BOOL)shutdown;
- (id)_handlerForMessageName:(id)a3;
- (id)_highAvailabilityQueue;
- (id)defaultMessageHandler;
- (id)disconnectHandler;
- (id)firstConnectionBlock;
- (id)initListenerWithServiceName:(id)a3;
- (id)initListenerWithServiceName:(id)a3 onQueue:(id)a4 qos:(unsigned int)a5;
- (void)_handleNewConnection:(id)a3 qos:(unsigned int)a4;
- (void)dealloc;
- (void)setDefaultMessageHandler:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setFirstConnectionBlock:(id)a3;
- (void)setHandlerForMessageName:(id)a3 handler:(id)a4;
- (void)startListening;
@end

@implementation SPXPCServer

void __55__SPXPCServer_initListenerWithServiceName_onQueue_qos___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 69))
  {
    uint64_t v6 = MEMORY[0x223C2C4D0](v3);
    if (v6 == MEMORY[0x263EF86F0])
    {
      [v5 _handleNewConnection:v3 qos:v5[16]];
    }
    else
    {
      uint64_t v7 = v6;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        __55__SPXPCServer_initListenerWithServiceName_onQueue_qos___block_invoke_cold_1((uint64_t)v5, v7);
      }
    }
  }
}

- (void)_handleNewConnection:(id)a3 qos:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v7 = [[SPXPCConnection alloc] initWithXPCConnection:v6 qos:v4];
  from[1] = (id)MEMORY[0x263EF8330];
  from[2] = (id)3221225472;
  from[3] = __40__SPXPCServer__handleNewConnection_qos___block_invoke;
  from[4] = &unk_2644B2990;
  from[5] = self;
  v8 = v7;
  v18 = v8;
  tracing_dispatch_sync();
  if (!self->hadConnection)
  {
    self->hadConnection = 1;
    firstConnectionBlock = (void (**)(void))self->_firstConnectionBlock;
    if (firstConnectionBlock)
    {
      firstConnectionBlock[2]();
      id v10 = self->_firstConnectionBlock;
      self->_firstConnectionBlock = 0;
    }
  }
  from[0] = 0;
  objc_initWeak(from, v8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__SPXPCServer__handleNewConnection_qos___block_invoke_2;
  v14[3] = &unk_2644B3148;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, from);
  [(SPXPCConnection *)v8 setMessageHandler:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__SPXPCServer__handleNewConnection_qos___block_invoke_152;
  v11[3] = &unk_2644B3170;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, from);
  [(SPXPCConnection *)v8 setDisconnectHandler:v11];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(from);

  objc_destroyWeak(&location);
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_3(v3);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 69))
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v6)
    {
      uint64_t v7 = [v3 name];
      v8 = [v5 _handlerForMessageName:v7];

      if (v8)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_2(v3);
        }
        ((void (**)(void, id, id))v8)[2](v8, v6, v3);
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_1(v3);
      }
    }
  }
}

- (id)_handlerForMessageName:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_handlerMap objectForKey:v4];
  BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v6) {
      -[SPXPCServer _handlerForMessageName:]();
    }
  }
  else
  {
    if (v6) {
      -[SPXPCServer _handlerForMessageName:]();
    }
    v5 = (void *)MEMORY[0x223C2C030](self->_defaultMessageHandler);
  }
  uint64_t v7 = (void *)MEMORY[0x223C2C030](v5);

  return v7;
}

uint64_t __40__SPXPCServer__handleNewConnection_qos___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (BOOL)shutdown
{
  self->_shutdown = 1;
  return 1;
}

- (id)_highAvailabilityQueue
{
  if (_highAvailabilityQueue_onceToken != -1) {
    dispatch_once(&_highAvailabilityQueue_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)_highAvailabilityQueue_queue;

  return v2;
}

void __37__SPXPCServer__highAvailabilityQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_initially_inactive(0);
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v3 = dispatch_queue_create("searchd xpc high availability queue", v2);
  id v4 = (void *)_highAvailabilityQueue_queue;
  _highAvailabilityQueue_queue = (uint64_t)v3;

  v5 = _highAvailabilityQueue_queue;

  dispatch_activate(v5);
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_152(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v3 = [WeakRetained disconnectHandler];
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4)
  {
    v5 = WeakRetained[5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_153;
    v7[3] = &unk_2644B2990;
    v8 = WeakRetained;
    id v6 = v4;
    id v9 = v6;
    dispatch_sync(v5, v7);
    if (v3) {
      ((void (**)(void, id))v3)[2](v3, v6);
    }
  }
}

uint64_t __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_153(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (id)initListenerWithServiceName:(id)a3 onQueue:(id)a4 qos:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SPXPCServer;
  id v10 = [(SPXPCServer *)&v27 init];
  if (v10)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v8 UTF8String], v9, 1uLL);
    conn = v10->_conn;
    v10->_conn = mach_service;

    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("idle_timer", v13);
    timerQueue = v10->_timerQueue;
    v10->_timerQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v10->_eventQueue, a4);
    id v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    connections = v10->_connections;
    v10->_connections = v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v20 = dispatch_queue_create("connection_queue", v19);
    connectionsQueue = v10->_connectionsQueue;
    v10->_connectionsQueue = (OS_dispatch_queue *)v20;

    v10->_qos = a5;
    id location = 0;
    objc_initWeak(&location, v10);
    v22 = v10->_conn;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __55__SPXPCServer_initListenerWithServiceName_onQueue_qos___block_invoke;
    v24[3] = &unk_2644B3120;
    objc_copyWeak(&v25, &location);
    xpc_connection_set_event_handler(v22, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)startListening
{
}

- (id)initListenerWithServiceName:(id)a3
{
  id v4 = a3;
  v5 = [(SPXPCServer *)self _highAvailabilityQueue];
  id v6 = [(SPXPCServer *)self initListenerWithServiceName:v4 onQueue:v5 qos:33];

  return v6;
}

- (void)dealloc
{
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  id v6 = __22__SPXPCServer_dealloc__block_invoke;
  uint64_t v7 = &unk_2644B2A50;
  id v8 = self;
  tracing_dispatch_sync();
  v3.receiver = self;
  v3.super_class = (Class)SPXPCServer;
  [(SPXPCServer *)&v3 dealloc];
}

void __22__SPXPCServer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "setMessageHandler:", 0, (void)v10);
        [v7 setDisconnectHandler:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = 0;
}

- (void)setHandlerForMessageName:(id)a3 handler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    handlerMap = self->_handlerMap;
    if (!handlerMap)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v9 = self->_handlerMap;
      self->_handlerMap = v8;

      handlerMap = self->_handlerMap;
    }
    long long v10 = (void *)[v6 copy];
    [(NSMutableDictionary *)handlerMap setObject:v10 forKey:v11];
  }
  else
  {
    [(SPXPCServer *)self setDefaultMessageHandler:v6];
  }
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (id)defaultMessageHandler
{
  return self->_defaultMessageHandler;
}

- (void)setDefaultMessageHandler:(id)a3
{
}

- (id)firstConnectionBlock
{
  return self->_firstConnectionBlock;
}

- (void)setFirstConnectionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstConnectionBlock, 0);
  objc_storeStrong(&self->_defaultMessageHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_connectionsQueue, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)_handlerForMessageName:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E5D7000, &_os_log_internal, v0, "Use default handler for %@", v1, v2, v3, v4, v5);
}

- (void)_handlerForMessageName:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E5D7000, &_os_log_internal, v0, "Use specific handler for %@", v1, v2, v3, v4, v5);
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "No handler for %@", v2, 0xCu);
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_2(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E5D7000, &_os_log_internal, v2, "Passing message %@ to handler", v3, v4, v5, v6, v7);
}

void __40__SPXPCServer__handleNewConnection_qos___block_invoke_2_cold_3(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21E5D7000, &_os_log_internal, v2, "Got message %@ %@", v3, v4, v5, v6, v7);
}

void __55__SPXPCServer_initListenerWithServiceName_onQueue_qos___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  _StringForXPCType(a2);
  OUTLINED_FUNCTION_2_1(&dword_21E5D7000, &_os_log_internal, v2, "%@ %s", v3, v4, v5, v6, 2u);
}

@end