@interface WebBookmarksXPCConnection
- (BOOL)hasBoolEntitlement:(id)a3;
- (OS_xpc_object)connection;
- (WebBookmarksXPCConnection)initWithConnection:(id)a3;
- (WebBookmarksXPCConnectionDelegate)delegate;
- (id)initClientForMachService:(const char *)a3;
- (id)messageWithName:(const char *)a3;
- (void)_handleMessage:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReplyHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3 forMessageNamed:(const char *)a4;
- (void)setMessageHandlers:(id)a3;
@end

@implementation WebBookmarksXPCConnection

- (WebBookmarksXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WebBookmarksXPCConnection;
  id v6 = [(WebBookmarksXPCConnection *)&v20 init];
  if (v6)
  {
    objc_initWeak(&location, v6);
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v10 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v9;

    objc_storeStrong((id *)v6 + 3, a3);
    v11 = (_xpc_connection_s *)*((void *)v6 + 3);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __48__WebBookmarksXPCConnection_initWithConnection___block_invoke;
    v17[3] = &unk_2643DC608;
    objc_copyWeak(&v18, &location);
    xpc_connection_set_event_handler(v11, v17);
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.WebBookmarks.WebBookmarksXPCConnectionQueue", v12);
    v14 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v13;

    xpc_connection_set_target_queue(*((xpc_connection_t *)v6 + 3), *((dispatch_queue_t *)v6 + 4));
    xpc_connection_resume(*((xpc_connection_t *)v6 + 3));
    id v15 = v6;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return (WebBookmarksXPCConnection *)v6;
}

void __48__WebBookmarksXPCConnection_initWithConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__WebBookmarksXPCConnection_initWithConnection___block_invoke_2;
  v5[3] = &unk_2643DC5E0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __48__WebBookmarksXPCConnection_initWithConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleMessage:*(void *)(a1 + 32)];
}

- (id)initClientForMachService:(const char *)a3
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, 0, 0);
  id v5 = [(WebBookmarksXPCConnection *)self initWithConnection:mach_service];

  return v5;
}

- (void)_handleMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (MEMORY[0x21D4A1810]() == MEMORY[0x263EF8720])
  {
    connection = self->_connection;
    self->_connection = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained connection:self didCloseWithError:v4];
  }
  else
  {
    string = xpc_dictionary_get_string(v4, "_name");
    id v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (string)
    {
      if (v7)
      {
        int v14 = 136446210;
        id v15 = string;
        _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "Handling XPC message name: %{public}s.", (uint8_t *)&v14, 0xCu);
      }
      messageHandlers = self->_messageHandlers;
      id v9 = [NSString stringWithUTF8String:string];
      v10 = [(NSMutableDictionary *)messageHandlers objectForKey:v9];

      if (v10)
      {
        ((void (**)(void, WebBookmarksXPCConnection *, id))v10)[2](v10, self, v4);
      }
      else
      {
        dispatch_queue_t v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[WebBookmarksXPCConnection _handleMessage:]((uint64_t)string, v13);
        }
      }
    }
    else if (v7)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "XPC message name unexpectedly nil, nothing to handle.", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)setHandler:(id)a3 forMessageNamed:(const char *)a4
{
  messageHandlers = self->_messageHandlers;
  id v7 = (id)MEMORY[0x21D4A1230](a3, a2);
  id v6 = [NSString stringWithUTF8String:a4];
  [(NSMutableDictionary *)messageHandlers setObject:v7 forKey:v6];
}

- (void)setMessageHandlers:(id)a3
{
  id v4 = (NSMutableDictionary *)[a3 mutableCopy];
  messageHandlers = self->_messageHandlers;
  self->_messageHandlers = v4;

  if (!self->_messageHandlers)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v7 = self->_messageHandlers;
    self->_messageHandlers = v6;
    MEMORY[0x270F9A758](v6, v7);
  }
}

- (BOOL)hasBoolEntitlement:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_entitlementLookupCache objectForKey:v4];
  if (!v5)
  {
    id v6 = v4;
    [v6 UTF8String];
    uint64_t v7 = xpc_connection_copy_entitlement_value();
    v8 = (void *)v7;
    if (v7 && MEMORY[0x21D4A1810](v7) == MEMORY[0x263EF86E0])
    {
      id v5 = [NSNumber numberWithBool:xpc_BOOL_get_value(v8)];
    }
    else
    {
      id v5 = (void *)MEMORY[0x263EFFA80];
    }
    [(NSMutableDictionary *)self->_entitlementLookupCache setObject:v5 forKey:v6];
  }
  char v9 = [v5 BOOLValue];

  return v9;
}

- (id)messageWithName:(const char *)a3
{
  keys[1] = *(char **)MEMORY[0x263EF8340];
  xpc_object_t v3 = xpc_string_create(a3);
  xpc_object_t values = v3;
  keys[0] = "_name";
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);

  return v4;
}

- (void)sendMessage:(id)a3
{
}

- (void)sendMessage:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connection = self->_connection;
  if (connection)
  {
    if (v7)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__8;
      v15[4] = __Block_byref_object_dispose__8;
      char v9 = self;
      uint64_t v16 = v9;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __58__WebBookmarksXPCConnection_sendMessage_withReplyHandler___block_invoke;
      v12[3] = &unk_2643DC630;
      id v13 = v7;
      int v14 = v15;
      v10 = (void *)MEMORY[0x21D4A1230](v12);
      xpc_connection_send_message_with_reply(self->_connection, v6, (dispatch_queue_t)v9->_connectionQueue, v10);

      _Block_object_dispose(v15, 8);
    }
    else
    {
      xpc_connection_send_message(connection, v6);
    }
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarksXPCConnection sendMessage:withReplyHandler:](v11);
    }
  }
}

void __58__WebBookmarksXPCConnection_sendMessage_withReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x21D4A1810]() == MEMORY[0x263EF8708])
  {
    (*(void (**)(void, id, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, 0);
  }
  else
  {
    uint64_t v4 = MEMORY[0x21D4A1810](v3);

    if (v4 != MEMORY[0x263EF8720]) {
      goto LABEL_6;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    [MEMORY[0x263F087E8] errorWithDomain:@"WebBookmarksXPCConnectionErrorDomain" code:v3 == (id)MEMORY[0x263EF86A0] userInfo:0];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }

LABEL_6:
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (WebBookmarksXPCConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WebBookmarksXPCConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_entitlementLookupCache, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
}

- (void)_handleMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21C043000, a2, OS_LOG_TYPE_FAULT, "WebBookmarksXPCConnection: No handler registered for the message %{public}s.", (uint8_t *)&v2, 0xCu);
}

- (void)sendMessage:(os_log_t)log withReplyHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Unable to send message since there is no connection", v1, 2u);
}

@end