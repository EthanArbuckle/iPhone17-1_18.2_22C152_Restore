@interface NRMockServerNSXPCConnection
- (NRMockServerNSXPCConnection)initWithListener:(id)a3 clientConnection:(id)a4;
- (NRMockServerNSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (NSString)processName;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyAsync:(BOOL)a3;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)valueForEntitlement:(id)a3;
- (int)processIdentifier;
- (void)_invalidate;
- (void)dealloc;
- (void)invalidate;
- (void)runCompletionBlock:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation NRMockServerNSXPCConnection

- (void)_invalidate
{
  if (a1)
  {
    isa = +[NRMockXPCStuff sharedInstance];
    v7 = isa;
    if (isa) {
      isa = isa[2].isa;
    }
    dispatch_assert_queue_V2(isa);
    if (!*(unsigned char *)(a1 + 40))
    {
      *(unsigned char *)(a1 + 40) = 1;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v4 = WeakRetained;
      if (WeakRetained)
      {
        [WeakRetained _invalidate];
        objc_storeWeak((id *)(a1 + 8), 0);
      }
      objc_storeWeak((id *)(a1 + 24), 0);
      objc_storeWeak((id *)(a1 + 32), 0);
      v5 = (void *)MEMORY[0x1A624A7E0](*(void *)(a1 + 72));
      v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      if (v5) {
        dispatch_async(*(dispatch_queue_t *)(a1 + 48), v5);
      }
    }
  }
}

- (NRMockServerNSXPCConnection)initWithListener:(id)a3 clientConnection:(id)a4
{
  v6 = a3;
  id v7 = a4;
  v8 = [(NRMockServerNSXPCConnection *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_clientConnection, v7);
    objc_storeWeak((id *)&v9->_listener, v6);
    if (v6) {
      v10 = (void *)v6[4];
    }
    else {
      v10 = 0;
    }
    objc_storeStrong((id *)&v9->_queue, v10);
    [(NRMockServerNSXPCConnection *)v9 suspend];
  }

  return v9;
}

- (NSString)processName
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"client%ld", -[NRMockServerNSXPCConnection processIdentifier](self, "processIdentifier"));
}

- (id)valueForEntitlement:(id)a3
{
  return (id)MEMORY[0x1E4F1CC38];
}

- (void)runCompletionBlock:(id)a3
{
  dispatch_block_t block = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained queue];
    dispatch_async(v6, block);
  }
}

- (NSXPCInterface)remoteObjectInterface
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  uint64_t v3 = +[NRMockXPCStuff sharedInstance];
  v4 = (void *)v3;
  if (v3) {
    v5 = *(NSObject **)(v3 + 16);
  }
  else {
    v5 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NRMockServerNSXPCConnection_remoteObjectInterface__block_invoke;
  v8[3] = &unk_1E5B00198;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return (NSXPCInterface *)v6;
}

void __52__NRMockServerNSXPCConnection_remoteObjectInterface__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (([WeakRetained invalidated] & 1) == 0)
  {
    v2 = [WeakRetained exportedInterface];
    uint64_t v3 = [v2 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)remoteObjectProxyAsync:(BOOL)a3
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v5 = +[NRMockXPCStuff sharedInstance];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = *(NSObject **)(v5 + 16);
  }
  else {
    id v7 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NRMockServerNSXPCConnection_remoteObjectProxyAsync___block_invoke;
  block[3] = &unk_1E5B00258;
  block[4] = self;
  block[5] = &v12;
  BOOL v11 = a3;
  dispatch_sync(v7, block);
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __54__NRMockServerNSXPCConnection_remoteObjectProxyAsync___block_invoke(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v13 = (void *)WeakRetained;
    uint64_t WeakRetained = [(id)WeakRetained invalidated];
    uint64_t v3 = (uint64_t)v13;
    if ((WeakRetained & 1) == 0)
    {
      uint64_t v4 = 32;
      if (!*(unsigned char *)(a1 + 48)) {
        uint64_t v4 = 24;
      }
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + v4));
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);

      uint64_t v3 = (uint64_t)v13;
      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        id v6 = [NRMockXPCProxy alloc];
        id v7 = [v13 exportedObject];
        id v8 = [v13 queue];
        -[NRMockXPCProxy initWithBlahBlahBlahTarget:queue:async:]((uint64_t)v6, v7, v8, *(unsigned char *)(a1 + 48));
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v6;

        uint64_t v11 = 32;
        if (!*(unsigned char *)(a1 + 48)) {
          uint64_t v11 = 24;
        }
        uint64_t WeakRetained = (uint64_t)objc_storeWeak((id *)(*(void *)(a1 + 32) + v11), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
        uint64_t v3 = (uint64_t)v13;
      }
    }
  }

  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (id)remoteObjectProxy
{
  return [(NRMockServerNSXPCConnection *)self remoteObjectProxyAsync:1];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRMockServerNSXPCConnection *)self remoteObjectProxy];
  id v6 = (void *)v5;
  if (v4 && !v5)
  {
    uint64_t WeakRetained = (NSObject **)objc_loadWeakRetained((id *)&self->_listener);
    id v8 = WeakRetained;
    if (WeakRetained) {
      uint64_t v9 = WeakRetained[4];
    }
    else {
      uint64_t v9 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__NRMockServerNSXPCConnection_remoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E5B00208;
    id v12 = v4;
    dispatch_async(v9, block);
  }

  return v6;
}

void __65__NRMockServerNSXPCConnection_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"NSXPCConnectionInvalid: Did mock client stop running?";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:4099 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRMockServerNSXPCConnection *)self remoteObjectProxyAsync:0];
  uint64_t v6 = (void *)v5;
  if (v4 && !v5)
  {
    uint64_t WeakRetained = (NSObject **)objc_loadWeakRetained((id *)&self->_listener);
    id v8 = WeakRetained;
    if (WeakRetained) {
      uint64_t v9 = WeakRetained[4];
    }
    else {
      uint64_t v9 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__NRMockServerNSXPCConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E5B00208;
    id v12 = v4;
    dispatch_async(v9, block);
  }

  return v6;
}

void __76__NRMockServerNSXPCConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"NSXPCConnectionInvalid: Did mock client stop running?";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:4099 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);
}

- (void)invalidate
{
  isa = +[NRMockXPCStuff sharedInstance];
  id v4 = isa;
  if (isa) {
    isa = isa[2].isa;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NRMockServerNSXPCConnection_invalidate__block_invoke;
  block[3] = &unk_1E5B00230;
  void block[4] = self;
  dispatch_sync(isa, block);
}

void __41__NRMockServerNSXPCConnection_invalidate__block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  isa = +[NRMockXPCStuff sharedInstance];
  id v4 = isa;
  if (isa) {
    isa = isa[2].isa;
  }
  dispatch_sync(isa, &__block_literal_global_0);

  v5.receiver = self;
  v5.super_class = (Class)NRMockServerNSXPCConnection;
  [(NRMockServerNSXPCConnection *)&v5 dealloc];
}

- (NRMockServerNSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (int)processIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  int v3 = ((int)WeakRetained >> 8) % 10000;

  return v3;
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setExportedInterface:(id)a3
{
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_remoteObjectProxy);
  objc_destroyWeak(&self->_synchronousRemoteObjectProxy);
  objc_destroyWeak((id *)&self->_listener);

  objc_destroyWeak((id *)&self->_clientConnection);
}

@end