@interface SSRSpeakerProfileEmbeddingServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)messageHandlers;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (SSRSpeakerProfileEmbeddingServiceListener)init;
- (void)resumeConnection;
- (void)setListener:(id)a3;
- (void)setMessageHandlers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SSRSpeakerProfileEmbeddingServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setMessageHandlers:(id)a3
{
}

- (NSMutableArray)messageHandlers
{
  return self->_messageHandlers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)resumeConnection
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SSRSpeakerProfileEmbeddingServiceListener resumeConnection]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SSRSpeakerProfileEmbeddingServiceListener_resumeConnection__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __61__SSRSpeakerProfileEmbeddingServiceListener_resumeConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  uint64_t v8 = (os_log_t *)MEMORY[0x263F38100];
  v9 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[SSRSpeakerProfileEmbeddingServiceListener listener:shouldAcceptNewConnection:]";
    __int16 v39 = 2112;
    v40 = v7;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Got new connection on speaker profile embedding service: %@", buf, 0x16u);
  }
  if (self->_listener != v6)
  {
    os_log_t v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[SSRSpeakerProfileEmbeddingServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v39 = 2114;
      v40 = v6;
      v11 = "%s Invalid listener - %{public}@";
      v12 = v10;
      uint32_t v13 = 22;
LABEL_10:
      _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (([MEMORY[0x263F380D0] xpcConnection:v7 hasEntitlement:@"siri.speakerprofile.embedding.service.xpc"] & 1) == 0)
  {
    [(NSXPCListener *)v7 invalidate];
    os_log_t v23 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[SSRSpeakerProfileEmbeddingServiceListener listener:shouldAcceptNewConnection:]";
      v11 = "%s Rejecting connection due to entitlement";
      v12 = v23;
      uint32_t v13 = 12;
      goto LABEL_10;
    }
LABEL_11:
    BOOL v22 = 0;
    goto LABEL_12;
  }
  v14 = SSRSpeakerProfileEmbeddingServiceGetXPCInterface();
  [(NSXPCListener *)v7 setExportedInterface:v14];

  id v15 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD5A2C8];
  [(NSXPCListener *)v7 setRemoteObjectInterface:v15];

  v16 = [[SSRSpeakerProfileEmbeddingMessageHandler alloc] initWithConnection:v7];
  v17 = [(NSXPCListener *)v7 remoteObjectProxy];
  [(SSRSpeakerProfileEmbeddingMessageHandler *)v16 setupListenerDelegate:v17];

  [(NSXPCListener *)v7 setExportedObject:v16];
  objc_initWeak((id *)buf, self);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  v34[3] = &unk_26442A160;
  objc_copyWeak(&v36, (id *)buf);
  v18 = v16;
  v35 = v18;
  [(NSXPCListener *)v7 setInvalidationHandler:v34];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke_3;
  v31[3] = &unk_26442A160;
  objc_copyWeak(&v33, (id *)buf);
  v19 = v18;
  v32 = v19;
  [(NSXPCListener *)v7 setInterruptionHandler:v31];
  v20 = [(SSRSpeakerProfileEmbeddingServiceListener *)self queue];
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  v27 = __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke_5;
  v28 = &unk_26442A138;
  v29 = self;
  v21 = v19;
  v30 = v21;
  dispatch_async(v20, &v25);

  [(NSXPCListener *)v7 resume];
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);

  BOOL v22 = 1;
LABEL_12:

  return v22;
}

void __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v4[3] = &unk_26442A138;
  v4[4] = WeakRetained;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(v3, v4);
}

void __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke_4;
  v4[3] = &unk_26442A138;
  v4[4] = WeakRetained;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(v3, v4);
}

void __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageHandlers];
  [v2 addObject:*(void *)(a1 + 40)];
}

void __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageHandlers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __80__SSRSpeakerProfileEmbeddingServiceListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageHandlers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (SSRSpeakerProfileEmbeddingServiceListener)init
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)SSRSpeakerProfileEmbeddingServiceListener;
  id v2 = [(SSRSpeakerProfileEmbeddingServiceListener *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F380D0] getSerialQueue:@"SSRSpeakerProfileEmbeddingServiceListener Queue" qualityOfService:21];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.siri.speakerprofile.embedding.service.xpc"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = (NSMutableArray *)v7;

    v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint32_t v13 = "-[SSRSpeakerProfileEmbeddingServiceListener init]";
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s SSRSpeakerProfileEmbeddingServiceListener start listening", buf, 0xCu);
    }
  }
  return v2;
}

@end