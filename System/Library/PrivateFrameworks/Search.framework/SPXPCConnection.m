@interface SPXPCConnection
- (NSString)bundleID;
- (NSString)serviceName;
- (SPXPCConnection)initWithServiceName:(id)a3 onQueue:(id)a4;
- (SPXPCConnection)initWithXPCConnection:(id)a3 qos:(unsigned int)a4;
- (id)context;
- (id)disconnectHandler;
- (id)eventQueue;
- (id)eventQueueWithQOS:(unsigned int)a3;
- (id)messageHandler;
- (void)_handleXPCError:(id)a3;
- (void)_handleXPCMessage:(id)a3;
- (void)_sendInteractiveMessage:(id)a3 handler:(id)a4;
- (void)_sendMessage:(id)a3 handler:(id)a4;
- (void)_setEventHandlerOnConnection:(id)a3;
- (void)barrier:(id)a3;
- (void)dealloc;
- (void)sendInteractiveMessage:(id)a3 withReply:(id)a4;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)setContext:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)shutdown;
@end

@implementation SPXPCConnection

- (id)context
{
  return self->_context;
}

void __51__SPXPCConnection__sendInteractiveMessage_handler___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _createXPCMessage];
  if (v2)
  {
    v3 = *(_xpc_connection_s **)(a1 + 40);
    if (*(void *)(a1 + 56))
    {
      xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v3, v2);
      if (v4)
      {
        v5 = [*(id *)(a1 + 48) eventQueue];
        id v7 = *(id *)(a1 + 56);
        id v6 = v4;
        tracing_dispatch_async();
      }
    }
    else
    {
      xpc_connection_send_message(v3, v2);
    }
  }
}

- (NSString)bundleID
{
  bundleID = self->_bundleID;
  if (!bundleID)
  {
    [@"application-identifier" UTF8String];
    uint64_t v4 = xpc_connection_copy_entitlement_value();
    v5 = (void *)v4;
    if (v4)
    {
      if (MEMORY[0x223C2C4D0](v4) == MEMORY[0x263EF8798])
      {
        string_ptr = xpc_string_get_string_ptr(v5);
        if (string_ptr)
        {
          id v7 = (NSString *)[[NSString alloc] initWithUTF8String:string_ptr];
          v8 = self->_bundleID;
          self->_bundleID = v7;
        }
      }
    }

    bundleID = self->_bundleID;
  }

  return bundleID;
}

- (SPXPCConnection)initWithXPCConnection:(id)a3 qos:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  if (!v8)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SPXPCConnection.m" lineNumber:75 description:@"Must have xpc_connection"];
  }
  v15.receiver = self;
  v15.super_class = (Class)SPXPCConnection;
  v9 = [(SPXPCConnection *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conn, a3);
    conn = v10->_conn;
    v12 = [(SPXPCConnection *)v10 eventQueueWithQOS:v4];
    xpc_connection_set_target_queue(conn, v12);

    [(SPXPCConnection *)v10 _setEventHandlerOnConnection:v10->_conn];
    xpc_connection_resume(v10->_conn);
  }

  return v10;
}

- (id)eventQueueWithQOS:(unsigned int)a3
{
  eventQueue = self->_eventQueue;
  if (!eventQueue)
  {
    self->_ownsQueue = 1;
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)a3, 0);
    id v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.search.XPCEvent", v7);
    v9 = self->_eventQueue;
    self->_eventQueue = v8;

    eventQueue = self->_eventQueue;
  }

  return eventQueue;
}

void __48__SPXPCConnection__setEventHandlerOnConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x223C2BE00]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = MEMORY[0x223C2C4D0](v3);
  if (v6 == MEMORY[0x263EF8720])
  {
    [WeakRetained _handleXPCError:v3];
  }
  else
  {
    uint64_t v7 = v6;
    if (v6 == MEMORY[0x263EF8708])
    {
      [WeakRetained _handleXPCMessage:v3];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      v9 = _StringForXPCType(v7);
      _os_log_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_INFO, "Ignoring unexpected event of type %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_handleXPCMessage:(id)a3
{
  if (self->_messageHandler)
  {
    id v4 = a3;
    id v5 = [[SPXPCMessage alloc] _initWithXPCMessage:v4 onConnection:self];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[SPXPCConnection _handleXPCMessage:](v5);
    }
    (*((void (**)(void))self->_messageHandler + 2))();
  }
}

- (void)sendMessage:(id)a3
{
}

- (void)setMessageHandler:(id)a3
{
}

- (void)setDisconnectHandler:(id)a3
{
}

- (void)_sendMessage:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 name];

  if (!v9)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SPXPCConnection.m" lineNumber:126 description:@"Message must have a name"];
  }
  if (self->_conn)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[SPXPCConnection _sendMessage:handler:]();
    }
    uint64_t v10 = (void *)[v7 _createXPCMessage];
    if (v10)
    {
      conn = self->_conn;
      if (v8)
      {
        v12 = [(SPXPCConnection *)self eventQueue];
        xpc_connection_send_message_with_reply(conn, v10, v12, v8);
      }
      else
      {
        xpc_connection_send_message(self->_conn, v10);
      }
    }
  }
}

- (SPXPCConnection)initWithServiceName:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SPXPCConnection;
  id v8 = [(SPXPCConnection *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventQueue, a4);
    uint64_t v10 = (const char *)[v6 UTF8String];
    v11 = [(SPXPCConnection *)v9 eventQueue];
    xpc_connection_t mach_service = xpc_connection_create_mach_service(v10, v11, 0);
    conn = v9->_conn;
    v9->_conn = mach_service;

    [(SPXPCConnection *)v9 _setEventHandlerOnConnection:v9->_conn];
    xpc_connection_resume(v9->_conn);
  }

  return v9;
}

- (void)_setEventHandlerOnConnection:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SPXPCConnection__setEventHandlerOnConnection___block_invoke;
  v5[3] = &unk_2644B3120;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)eventQueue
{
  eventQueue = self->_eventQueue;
  if (!eventQueue)
  {
    self->_ownsQueue = 1;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v5 = qos_class_self();
    id v6 = dispatch_queue_attr_make_with_qos_class(v4, v5, 0);
    id v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.search.XPCEvent", v6);
    id v8 = self->_eventQueue;
    self->_eventQueue = v7;

    eventQueue = self->_eventQueue;
  }

  return eventQueue;
}

- (void)sendInteractiveMessage:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      -[SPXPCConnection sendMessage:withReply:]((uint64_t)self, v6);
      if (v7) {
        goto LABEL_4;
      }
    }
    else if (v7)
    {
LABEL_4:
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      v19 = __52__SPXPCConnection_sendInteractiveMessage_withReply___block_invoke;
      v20 = &unk_2644B30F8;
      v21 = self;
      id v22 = v7;
      v16 = (void *)MEMORY[0x223C2C030](&v17);

LABEL_9:
      -[SPXPCConnection _sendInteractiveMessage:handler:](self, "_sendInteractiveMessage:handler:", v6, v16, v17, v18, v19, v20, v21);

      goto LABEL_10;
    }
    v16 = 0;
    goto LABEL_9;
  }
  if (v8) {
    -[SPXPCConnection sendMessage:withReply:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
LABEL_10:
}

- (void)_sendInteractiveMessage:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 name];

  if (!v9)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SPXPCConnection.m" lineNumber:141 description:@"Message must have a name"];
  }
  if (self->_conn)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[SPXPCConnection _sendMessage:handler:]();
    }
    uint64_t v10 = self->_conn;
    uint64_t v11 = dispatch_get_global_queue(33, 0);
    id v14 = v7;
    id v15 = v8;
    uint64_t v12 = v10;
    tracing_dispatch_async();
  }
}

- (void)setContext:(id)a3
{
}

- (void)dealloc
{
}

- (NSString)serviceName
{
  conn = self->_conn;
  if (conn)
  {
    conn = [NSString stringWithUTF8String:xpc_connection_get_name(conn)];
  }

  return (NSString *)conn;
}

uint64_t __51__SPXPCConnection__sendInteractiveMessage_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      -[SPXPCConnection sendMessage:withReply:]((uint64_t)self, v6);
      if (v7) {
        goto LABEL_4;
      }
    }
    else if (v7)
    {
LABEL_4:
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      v19 = __41__SPXPCConnection_sendMessage_withReply___block_invoke;
      v20 = &unk_2644B30F8;
      v21 = self;
      id v22 = v7;
      v16 = (void *)MEMORY[0x223C2C030](&v17);

LABEL_9:
      -[SPXPCConnection _sendMessage:handler:](self, "_sendMessage:handler:", v6, v16, v17, v18, v19, v20, v21);

      goto LABEL_10;
    }
    v16 = 0;
    goto LABEL_9;
  }
  if (v8) {
    -[SPXPCConnection sendMessage:withReply:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
LABEL_10:
}

void __41__SPXPCConnection_sendMessage_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x223C2C4D0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __41__SPXPCConnection_sendMessage_withReply___block_invoke_cold_1(a1, v3);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = v4;
    if (v4 == MEMORY[0x263EF8708])
    {
      id v6 = [[SPXPCMessage alloc] _initWithXPCMessage:v3 onConnection:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      BOOL v8 = _StringForXPCType(v5);
      _os_log_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_INFO, "Ignoring unexpected event of type %s", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __52__SPXPCConnection_sendInteractiveMessage_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x223C2C4D0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __41__SPXPCConnection_sendMessage_withReply___block_invoke_cold_1(a1, v3);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = v4;
    if (v4 == MEMORY[0x263EF8708])
    {
      id v6 = [[SPXPCMessage alloc] _initWithXPCMessage:v3 onConnection:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      BOOL v8 = _StringForXPCType(v5);
      _os_log_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_INFO, "Ignoring unexpected event of type %s", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)barrier:(id)a3
{
}

- (void)_handleXPCError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 == (id)MEMORY[0x263EF86A0])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[SPXPCConnection _handleXPCError:]();
    }
  }
  else
  {
    if (v4 != (id)MEMORY[0x263EF86A8])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86B0]);
        id v6 = "Unknown error";
        if (string) {
          id v6 = string;
        }
        int v9 = 136315138;
        uint64_t v10 = v6;
        _os_log_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_INFO, "Error: %s", (uint8_t *)&v9, 0xCu);
      }
      goto LABEL_13;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[SPXPCConnection _handleXPCError:]();
    }
  }
  disconnectHandler = (void (**)(void))self->_disconnectHandler;
  if (disconnectHandler)
  {
    disconnectHandler[2]();
    id v8 = self->_disconnectHandler;
    self->_disconnectHandler = 0;
  }
LABEL_13:
}

- (void)shutdown
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E5D7000, &_os_log_internal, v0, "Shutdown called on XPC connection %@", v1, v2, v3, v4, v5);
}

void __27__SPXPCConnection_shutdown__block_invoke(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);

  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)_sendMessage:handler:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 67109120;
  v0[1] = qos_class_self();
  _os_log_debug_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SPXPC message QOS: %d", (uint8_t *)v0, 8u);
}

- (void)sendMessage:(uint64_t)a3 withReply:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendMessage:(uint64_t)a1 withReply:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 name];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_1(&dword_21E5D7000, &_os_log_internal, v3, "sendMessage on %p: %@", v4, v5, v6, v7, v8);
}

void __41__SPXPCConnection_sendMessage_withReply___block_invoke_cold_1(int a1, xpc_object_t xdict)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Reply Error on %p:%s", v2, 0x16u);
}

- (void)_handleXPCError:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E5D7000, &_os_log_internal, v0, "XPC Connection interrupted %@", v1, v2, v3, v4, v5);
}

- (void)_handleXPCError:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E5D7000, &_os_log_internal, v0, "XPC Connection invalid %@", v1, v2, v3, v4, v5);
}

- (void)_handleXPCMessage:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E5D7000, &_os_log_internal, v2, "Handle message: %@", v3, v4, v5, v6, v7);
}

@end