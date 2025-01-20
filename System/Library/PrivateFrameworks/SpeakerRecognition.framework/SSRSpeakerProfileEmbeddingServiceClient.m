@interface SSRSpeakerProfileEmbeddingServiceClient
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (SSRSpeakerProfileEmbeddingServiceClient)initWithDelegate:(id)a3;
- (SSRSpeakerProfileEmbeddingServiceDelegate)delegate;
- (id)_remoteServiceProxyObjectWithErrorHandler:(id)a3;
- (id)remoteObjectProxy;
- (int)notifyToken;
- (void)_createClientConnection;
- (void)connectToServiceIfNeeded;
- (void)dealloc;
- (void)invalidate;
- (void)refreshEmbeddingsforLanguageCode:(id)a3 withCompletion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SSRSpeakerProfileEmbeddingServiceClient

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setDelegate:(id)a3
{
}

- (SSRSpeakerProfileEmbeddingServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRSpeakerProfileEmbeddingServiceDelegate *)WeakRetained;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_createClientConnection
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.siri.speakerprofile.embedding.service.xpc" options:0];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  v5 = self->_xpcConnection;
  v6 = SSRSpeakerProfileEmbeddingServiceGetXPCInterface();
  [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

  v7 = self->_xpcConnection;
  id v8 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD5A2C8];
  [(NSXPCConnection *)v7 setExportedInterface:v8];

  [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
  [(NSXPCConnection *)self->_xpcConnection _setQueue:self->_queue];
  objc_initWeak(&location, self);
  v9 = self->_xpcConnection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__SSRSpeakerProfileEmbeddingServiceClient__createClientConnection__block_invoke;
  v15[3] = &unk_264429BD0;
  objc_copyWeak(&v16, &location);
  [(NSXPCConnection *)v9 setInterruptionHandler:v15];
  v10 = self->_xpcConnection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__SSRSpeakerProfileEmbeddingServiceClient__createClientConnection__block_invoke_2;
  v13[3] = &unk_264429BD0;
  objc_copyWeak(&v14, &location);
  [(NSXPCConnection *)v10 setInvalidationHandler:v13];
  v11 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_xpcConnection;
    *(_DWORD *)buf = 136315394;
    v19 = "-[SSRSpeakerProfileEmbeddingServiceClient _createClientConnection]";
    __int16 v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Setup connection: %@", buf, 0x16u);
  }
  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __66__SSRSpeakerProfileEmbeddingServiceClient__createClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = [WeakRetained xpcConnection];
    v5 = [WeakRetained xpcConnection];
    *(_DWORD *)buf = 136315650;
    v10 = "-[SSRSpeakerProfileEmbeddingServiceClient _createClientConnection]_block_invoke";
    __int16 v11 = 2114;
    v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    v6 = [WeakRetained xpcConnection];

    if (v6)
    {
      v7 = [WeakRetained queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__SSRSpeakerProfileEmbeddingServiceClient__createClientConnection__block_invoke_5;
      block[3] = &unk_26442A618;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

void __66__SSRSpeakerProfileEmbeddingServiceClient__createClientConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = [WeakRetained xpcConnection];
    v5 = [WeakRetained xpcConnection];
    *(_DWORD *)buf = 136315650;
    v10 = "-[SSRSpeakerProfileEmbeddingServiceClient _createClientConnection]_block_invoke_2";
    __int16 v11 = 2114;
    v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    v6 = [WeakRetained xpcConnection];

    if (v6)
    {
      v7 = [WeakRetained queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__SSRSpeakerProfileEmbeddingServiceClient__createClientConnection__block_invoke_6;
      block[3] = &unk_26442A618;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

uint64_t __66__SSRSpeakerProfileEmbeddingServiceClient__createClientConnection__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setXpcConnection:0];
}

uint64_t __66__SSRSpeakerProfileEmbeddingServiceClient__createClientConnection__block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];
  [v2 invalidate];

  v3 = *(void **)(a1 + 32);

  return [v3 setXpcConnection:0];
}

- (id)_remoteServiceProxyObjectWithErrorHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F38100];
  v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v14 = "-[SSRSpeakerProfileEmbeddingServiceClient _remoteServiceProxyObjectWithErrorHandler:]";
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
  }
  xpcConnection = self->_xpcConnection;
  if (xpcConnection
    || ([(SSRSpeakerProfileEmbeddingServiceClient *)self _createClientConnection],
        (xpcConnection = self->_xpcConnection) != 0))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __85__SSRSpeakerProfileEmbeddingServiceClient__remoteServiceProxyObjectWithErrorHandler___block_invoke;
    v11[3] = &unk_26442A4B0;
    id v12 = v4;
    id v8 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  }
  else
  {
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[SSRSpeakerProfileEmbeddingServiceClient _remoteServiceProxyObjectWithErrorHandler:]";
      _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ERR: _attendingConnection is nil", buf, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

uint64_t __85__SSRSpeakerProfileEmbeddingServiceClient__remoteServiceProxyObjectWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)refreshEmbeddingsforLanguageCode:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__SSRSpeakerProfileEmbeddingServiceClient_refreshEmbeddingsforLanguageCode_withCompletion___block_invoke;
  block[3] = &unk_26442A188;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __91__SSRSpeakerProfileEmbeddingServiceClient_refreshEmbeddingsforLanguageCode_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__SSRSpeakerProfileEmbeddingServiceClient_refreshEmbeddingsforLanguageCode_withCompletion___block_invoke_2;
  v7[3] = &unk_264428FC0;
  id v8 = *(id *)(a1 + 48);
  v3 = [v2 _remoteServiceProxyObjectWithErrorHandler:v7];
  id v4 = v3;
  if (v3)
  {
    [v3 refreshEmbeddingsforLanguageCode:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    v5 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[SSRSpeakerProfileEmbeddingServiceClient refreshEmbeddingsforLanguageCode:withCompletion:]_block_invoke";
      _os_log_error_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_ERROR, "%s Cannot refresh embedding because remoteObjectProxy could not be setup", buf, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
}

uint64_t __91__SSRSpeakerProfileEmbeddingServiceClient_refreshEmbeddingsforLanguageCode_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    v5 = "-[SSRSpeakerProfileEmbeddingServiceClient refreshEmbeddingsforLanguageCode:withCompletion:]_block_invoke_2";
    _os_log_error_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_ERROR, "%s Error handler return completion block to nil", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)dealloc
{
  [(SSRSpeakerProfileEmbeddingServiceClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SSRSpeakerProfileEmbeddingServiceClient;
  [(SSRSpeakerProfileEmbeddingServiceClient *)&v3 dealloc];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SSRSpeakerProfileEmbeddingServiceClient_invalidate__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__SSRSpeakerProfileEmbeddingServiceClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SSRSpeakerProfileEmbeddingServiceClient invalidate]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;
}

- (void)connectToServiceIfNeeded
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SSRSpeakerProfileEmbeddingServiceClient_connectToServiceIfNeeded__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __67__SSRSpeakerProfileEmbeddingServiceClient_connectToServiceIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createClientConnection];
}

- (SSRSpeakerProfileEmbeddingServiceClient)initWithDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSRSpeakerProfileEmbeddingServiceClient;
  int v5 = [(SSRSpeakerProfileEmbeddingServiceClient *)&v10 init];
  if (v5)
  {
    SSRLogInitIfNeeded();
    dispatch_queue_t v6 = dispatch_queue_create("SSRSpeakerProfileEmbeddingServiceClient queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
    id v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[SSRSpeakerProfileEmbeddingServiceClient initWithDelegate:]";
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v5;
}

@end