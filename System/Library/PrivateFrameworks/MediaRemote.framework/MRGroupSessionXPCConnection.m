@interface MRGroupSessionXPCConnection
- (MRGroupSessionClientXPCProtocol)clientObject;
- (MRGroupSessionXPCConnection)initWithClientObject:(id)a3 invalidationHandler:(id)a4;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)invalidationHandler;
- (id)server;
- (void)dealloc;
- (void)initializeConnection;
- (void)sendMessage:(id)a3;
@end

@implementation MRGroupSessionXPCConnection

- (MRGroupSessionXPCConnection)initWithClientObject:(id)a3 invalidationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MRGroupSessionXPCConnection;
  v9 = [(MRGroupSessionXPCConnection *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientObject, a3);
    uint64_t v11 = MEMORY[0x1997190F0](v8);
    id invalidationHandler = v10->_invalidationHandler;
    v10->_id invalidationHandler = (id)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = MRGroupSessionSubsystemGetQueue();
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("com.apple.MRDGroupSessionClient.queue", v13, v14);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    v17 = v10->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MRGroupSessionXPCConnection_initWithClientObject_invalidationHandler___block_invoke;
    block[3] = &unk_1E57D0518;
    v20 = v10;
    dispatch_async(v17, block);
  }
  return v10;
}

uint64_t __72__MRGroupSessionXPCConnection_initWithClientObject_invalidationHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeConnection];
}

- (void)dealloc
{
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  [(NSXPCConnection *)self->_connection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MRGroupSessionXPCConnection;
  [(MRGroupSessionXPCConnection *)&v4 dealloc];
}

- (void)initializeConnection
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRGroupSessionXPCConnection] <%p> Received nil XPC endpoint. Failing.", (uint8_t *)&v2, 0xCu);
}

void __51__MRGroupSessionXPCConnection_initializeConnection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      id v5 = WeakRetained;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionXPCConnection] <%p> XPC interrupted.", (uint8_t *)&v4, 0xCu);
    }

    uint64_t v3 = [WeakRetained connection];
    [v3 invalidate];
  }
}

void __51__MRGroupSessionXPCConnection_initializeConnection__block_invoke_58(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      id v5 = WeakRetained;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionXPCConnection] <%p> XPC invalidated.", (uint8_t *)&v4, 0xCu);
    }

    uint64_t v3 = [WeakRetained invalidationHandler];
    v3[2]();
  }
}

- (id)server
{
  uint64_t v3 = [(MRGroupSessionXPCConnection *)self connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MRGroupSessionXPCConnection_server__block_invoke;
  v6[3] = &unk_1E57D1148;
  v6[4] = self;
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return v4;
}

void __37__MRGroupSessionXPCConnection_server__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionXPCConnection] <%p> Server proxy error %@.", (uint8_t *)&v6, 0x16u);
  }
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRGroupSessionXPCConnection *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__MRGroupSessionXPCConnection_sendMessage___block_invoke;
  v7[3] = &unk_1E57D0DB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__MRGroupSessionXPCConnection_sendMessage___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) server];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (MRGroupSessionClientXPCProtocol)clientObject
{
  return self->_clientObject;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientObject, 0);
}

@end