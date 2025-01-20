@interface TUUIXPCHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableSet)connections;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (TUUIXPCHost)init;
- (TUUIXPCHost)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (TUUIXPCHostDelegate)delegate;
- (id)endpoint;
- (int)clientsShouldConnectToken;
- (void)connectionInvalidated:(id)a3;
- (void)dealloc;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcListener:(id)a3;
@end

@implementation TUUIXPCHost

- (TUUIXPCHost)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUUIXPCHost.m", 38, @"%s is not available. Use a designated initializer instead.", "-[TUUIXPCHost init]");

  return 0;
}

- (TUUIXPCHost)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUUIXPCHost;
  v8 = [(TUUIXPCHost *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    objc_storeStrong((id *)&v9->_queue, a4);
    v10 = [MEMORY[0x1E4F29290] anonymousListener];
    [(TUUIXPCHost *)v9 setXpcListener:v10];

    v11 = [(TUUIXPCHost *)v9 xpcListener];
    [v11 setDelegate:v9];

    v12 = [(TUUIXPCHost *)v9 xpcListener];
    [v12 resume];
  }
  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v5;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Asked to accept new connection from %@", buf, 0xCu);
  }

  id v7 = [v5 valueForEntitlement:@"com.apple.telephonyutilities.callservicesd"];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (([v13 isEqual:@"modify-calls"] & 1) != 0
              || ([v13 isEqual:@"access-ui-data-source"] & 1) != 0)
            {

              v17 = [TUUIXPCHostConnection alloc];
              v18 = [(TUUIXPCHost *)self delegate];
              v19 = [(TUUIXPCHost *)self queue];
              v20 = [(TUUIXPCHostConnection *)v17 initWithConnection:v5 hostDelegate:v18 connectionDelegate:self queue:v19];

              v21 = [(TUUIXPCHost *)self queue];
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __50__TUUIXPCHost_listener_shouldAcceptNewConnection___block_invoke;
              v22[3] = &unk_1E58E5C08;
              v22[4] = self;
              v23 = v20;
              objc_super v14 = v20;
              dispatch_async(v21, v22);

              BOOL v15 = 1;
              goto LABEL_18;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
  }
  objc_super v14 = TUDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v5;
    _os_log_impl(&dword_19C496000, v14, OS_LOG_TYPE_DEFAULT, "[WARN] New connection is missing entitlement to access UIXPC so declining the connection %@", buf, 0xCu);
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

void __50__TUUIXPCHost_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connections];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)TUUIXPCHost;
  [(TUUIXPCHost *)&v4 dealloc];
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = a3;
  id v5 = [(TUUIXPCHost *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUUIXPCHost *)self connections];
  [v6 removeObject:v4];
}

- (id)endpoint
{
  id v2 = [(TUUIXPCHost *)self xpcListener];
  v3 = [v2 endpoint];

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (TUUIXPCHostDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUUIXPCHostDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end