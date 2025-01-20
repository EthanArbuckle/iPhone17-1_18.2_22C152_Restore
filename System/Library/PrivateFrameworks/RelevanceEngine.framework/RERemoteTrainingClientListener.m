@interface RERemoteTrainingClientListener
+ (id)sharedTrainingClientListener;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RERemoteTrainingClientListener)init;
- (RERemoteTrainingClientListenerDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation RERemoteTrainingClientListener

+ (id)sharedTrainingClientListener
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__RERemoteTrainingClientListener_sharedTrainingClientListener__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTrainingClientListener_onceToken != -1) {
    dispatch_once(&sharedTrainingClientListener_onceToken, block);
  }
  v2 = (void *)sharedTrainingClientListener_listener;
  return v2;
}

uint64_t __62__RERemoteTrainingClientListener_sharedTrainingClientListener__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedTrainingClientListener_listener;
  sharedTrainingClientListener_listener = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (RERemoteTrainingClientListener)init
{
  v15.receiver = self;
  v15.super_class = (Class)RERemoteTrainingClientListener;
  uint64_t v2 = [(RERemoteTrainingClientListener *)&v15 init];
  if (v2)
  {
    uint64_t v3 = RECreateSharedQueueWithQOS(@"RERemoteTrainingClientListener", QOS_CLASS_UTILITY);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    clients = v2->_clients;
    v2->_clients = v5;

    v7 = RELogForDomain(17);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21E6E6000, v7, OS_LOG_TYPE_INFO, "Starting remote training listener", v14, 2u);
    }

    v8 = [MEMORY[0x263F08AB0] processInfo];
    v9 = [v8 processName];
    v10 = RERemoteTrainingMachServiceForProcessName(v9);

    uint64_t v11 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v10];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v11;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  [(NSXPCListener *)self->_listener setDelegate:0];
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)RERemoteTrainingClientListener;
  [(RERemoteTrainingClientListener *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_2644BDBF0;
  id v13 = v6;
  id v14 = v7;
  objc_super v15 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);

  return 1;
}

void __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = RELogForDomain(17);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) description];
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = [v3 UTF8String];
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_INFO, "New connection: %s", buf, 0xCu);
  }
  objc_super v4 = [[_RELocalTrainingContext alloc] initWithConnection:*(void *)(a1 + 40)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke_7;
  v6[3] = &unk_2644BDBC8;
  v6[4] = *(void *)(a1 + 48);
  [(_RELocalTrainingContext *)v4 setInvalidationHandler:v6];
  [*(id *)(*(void *)(a1 + 48) + 8) addObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
  [WeakRetained remoteTrainingClientListenerDidConnectContext:v4];
}

void __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v7[3] = &unk_2644BC688;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained remoteTrainingClientListenerDidDisconnectContext:*(void *)(a1 + 40)];
}

- (RERemoteTrainingClientListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RERemoteTrainingClientListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end