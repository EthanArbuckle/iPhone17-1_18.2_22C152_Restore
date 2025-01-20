@interface SSRVTUITrainingListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)activeConnection;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (SSRVTUITrainingListener)initWithMessageHandler:(id)a3;
- (SSRVTUITrainingMessageHandler)messageHandler;
- (void)listen;
- (void)setActiveConnection:(id)a3;
- (void)setListener:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SSRVTUITrainingListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeConnection, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setMessageHandler:(id)a3
{
}

- (SSRVTUITrainingMessageHandler)messageHandler
{
  return self->_messageHandler;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setActiveConnection:(id)a3
{
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  v8 = (os_log_t *)MEMORY[0x263F37FA8];
  v9 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[SSRVTUITrainingListener listener:shouldAcceptNewConnection:]";
    __int16 v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Got new connection on attending service: %@", buf, 0x16u);
  }
  listener = self->_listener;
  if (listener == v6)
  {
    v12 = SSRVTUITrainingServiceGetXPCInterface();
    [(NSXPCListener *)v7 setExportedInterface:v12];

    id v13 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD48FD8];
    [(NSXPCListener *)v7 setRemoteObjectInterface:v13];

    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_26442A138;
    v15 = v7;
    v25 = v15;
    v26 = self;
    dispatch_sync(queue, block);
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v15);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_2;
    v20[3] = &unk_264429528;
    objc_copyWeak(&v21, (id *)buf);
    objc_copyWeak(&v22, &location);
    [(NSXPCListener *)v15 setInterruptionHandler:v20];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_2_4;
    v17[3] = &unk_264429528;
    objc_copyWeak(&v18, (id *)buf);
    objc_copyWeak(&v19, &location);
    [(NSXPCListener *)v15 setInvalidationHandler:v17];
    [(NSXPCListener *)v15 resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SSRVTUITrainingListener listener:shouldAcceptNewConnection:]";
      __int16 v29 = 2114;
      v30 = v6;
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s Invalid listener - %{public}@", buf, 0x16u);
    }
  }

  return listener == v6;
}

uint64_t __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setExportedObject:*(void *)(*(void *)(a1 + 40) + 32)];
  v2 = *(void **)(*(void *)(a1 + 40) + 32);
  v3 = [*(id *)(a1 + 32) remoteObjectProxy];
  [v2 setRemoteObjectProxy:v3];

  v4 = [*(id *)(a1 + 40) activeConnection];

  if (v4)
  {
    v5 = [*(id *)(a1 + 40) activeConnection];
    [v5 setInvalidationHandler:0];

    v6 = [*(id *)(a1 + 40) activeConnection];
    [v6 invalidate];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  v7 = *(void **)(a1 + 40);

  return [v7 setActiveConnection:v8];
}

void __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)*MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = v5;
    *(_DWORD *)buf = 136315906;
    v14 = "-[SSRVTUITrainingListener listener:shouldAcceptNewConnection:]_block_invoke_2";
    __int16 v15 = 2114;
    v16 = @"com.apple.siri.ssrvtuitrainingservice.xpc";
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 1026;
    int v20 = [v6 processIdentifier];
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s [Service:%{public}@] Listener Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x26u);
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = v7;
  if (WeakRetained && v7)
  {
    v9 = [WeakRetained queue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_3;
    v10[3] = &unk_26442A138;
    id v11 = v8;
    id v12 = WeakRetained;
    dispatch_async(v9, v10);
  }
}

void __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_2_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)*MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = v5;
    *(_DWORD *)buf = 136315906;
    id v12 = "-[SSRVTUITrainingListener listener:shouldAcceptNewConnection:]_block_invoke_2";
    __int16 v13 = 2114;
    v14 = @"com.apple.siri.ssrvtuitrainingservice.xpc";
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 1026;
    int v18 = [v6 processIdentifier];
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s [Service:%{public}@] Listener Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x26u);
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = v7;
  if (WeakRetained && v7)
  {
    v9 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_5;
    block[3] = &unk_26442A618;
    void block[4] = WeakRetained;
    dispatch_async(v9, block);
  }
}

void __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setActiveConnection:0];
  v2 = [*(id *)(a1 + 32) messageHandler];
  [v2 setRemoteObjectProxy:0];

  id v3 = [*(id *)(a1 + 32) messageHandler];
  [v3 vtuiTrainingXPCDisconnected];
}

void __62__SSRVTUITrainingListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) setActiveConnection:0];
  v2 = [*(id *)(a1 + 40) messageHandler];
  [v2 setRemoteObjectProxy:0];

  id v3 = [*(id *)(a1 + 40) messageHandler];
  [v3 vtuiTrainingXPCDisconnected];
}

- (void)listen
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.siri.ssrvtuitrainingservice.xpc"];
  listener = self->_listener;
  self->_listener = v3;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  id v5 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SSRVTUITrainingListener listen]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s SSRVTUITrainingListener start listening", (uint8_t *)&v6, 0xCu);
  }
}

- (SSRVTUITrainingListener)initWithMessageHandler:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSRVTUITrainingListener;
  int v6 = [(SSRVTUITrainingListener *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F380D0] getSerialQueue:@"SSRVTUITrainingListener Queue" qualityOfService:33];
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_messageHandler, a3);
  }

  return v6;
}

@end