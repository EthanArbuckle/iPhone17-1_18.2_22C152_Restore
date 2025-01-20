@interface WebBookmarksXPCListener
- (WebBookmarksXPCConnectionDelegate)delegate;
- (id)initListenerForMachService:(const char *)a3;
- (void)_handleIncomingConnection:(id)a3;
- (void)connection:(id)a3 didCloseWithError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3 forMessageNamed:(const char *)a4;
- (void)setMessageHandlers:(id)a3;
@end

@implementation WebBookmarksXPCListener

- (id)initListenerForMachService:(const char *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)WebBookmarksXPCListener;
  v4 = [(WebBookmarksXPCListener *)&v19 init];
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    clientConnections = v4->_clientConnections;
    v4->_clientConnections = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    messageHandlers = v4->_messageHandlers;
    v4->_messageHandlers = v7;

    v9 = MEMORY[0x263EF83A0];
    id v10 = MEMORY[0x263EF83A0];
    xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, v9, 1uLL);
    listenerConnection = v4->_listenerConnection;
    v4->_listenerConnection = mach_service;

    v13 = v4->_listenerConnection;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__WebBookmarksXPCListener_initListenerForMachService___block_invoke;
    v16[3] = &unk_2643DC608;
    objc_copyWeak(&v17, &location);
    xpc_connection_set_event_handler(v13, v16);
    xpc_connection_set_target_queue(v4->_listenerConnection, MEMORY[0x263EF83A0]);

    xpc_connection_resume(v4->_listenerConnection);
    v14 = v4;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __54__WebBookmarksXPCListener_initListenerForMachService___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleIncomingConnection:v3];
}

- (void)_handleIncomingConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x21D4A1810](v4);
    if (v6 == MEMORY[0x263EF86F0])
    {
      v11 = [[WebBookmarksXPCConnection alloc] initWithConnection:v5];
      [(WebBookmarksXPCConnection *)v11 setDelegate:self];
      [(WebBookmarksXPCConnection *)v11 setMessageHandlers:self->_messageHandlers];
      [(NSMutableArray *)self->_clientConnections addObject:v11];
    }
    else
    {
      v7 = (const _xpc_type_s *)v6;
      v8 = WBS_LOG_CHANNEL_PREFIXWebBookmarkServer();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        int v12 = 136446210;
        name = xpc_type_get_name(v7);
        _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Ignoring incoming message because the message type is %{public}s", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXWebBookmarkServer();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "Ignoring incoming message because the message is nil.", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)setHandler:(id)a3 forMessageNamed:(const char *)a4
{
  messageHandlers = self->_messageHandlers;
  id v7 = (id)MEMORY[0x21D4A1230](a3, a2);
  uint64_t v6 = [NSString stringWithUTF8String:a4];
  [(NSMutableDictionary *)messageHandlers setObject:v7 forKey:v6];
}

- (void)setMessageHandlers:(id)a3
{
  id v4 = (NSMutableDictionary *)[a3 mutableCopy];
  messageHandlers = self->_messageHandlers;
  self->_messageHandlers = v4;

  if (!self->_messageHandlers)
  {
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v7 = self->_messageHandlers;
    self->_messageHandlers = v6;
    MEMORY[0x270F9A758](v6, v7);
  }
}

- (void)connection:(id)a3 didCloseWithError:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:v9 didCloseWithError:v7];

  [v9 setDelegate:0];
  [(NSMutableArray *)self->_clientConnections removeObject:v9];
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
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listenerConnection, 0);
}

@end