@interface NRMockClientNSXPCConnection
- (BOOL)invalidated;
- (NRMockClientNSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (NRMockServerNSXPCConnection)serverConnection;
- (NSString)processName;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (OS_dispatch_queue)queue;
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
- (void)invalidate;
- (void)runCompletionBlock:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation NRMockClientNSXPCConnection

- (NRMockClientNSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(NRMockClientNSXPCConnection *)self init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_name, a3);
    id v9 = [NSString stringWithFormat:@"com.apple.nanoregistry.mockxpclistener.%@.serverservice%p", v6, v8];
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;
  }
  return v8;
}

- (NSString)processName
{
  return (NSString *)@"server";
}

- (void)runCompletionBlock:(id)a3
{
  dispatch_block_t block = a3;
  v4 = +[NRMockXPCStuff sharedInstance];
  v5 = v4;
  if (v4) {
    v4 = (void *)v4[1];
  }
  id v6 = [v4 objectForKeyedSubscript:self->_name];
  v7 = [(NRMockClientNSXPCConnection *)self serverConnection];

  if (v7 && v6) {
    dispatch_async(v6[4], block);
  }
}

- (NRMockServerNSXPCConnection)serverConnection
{
  p_serverConnection = &self->_serverConnection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_serverConnection);
  if (!WeakRetained)
  {
    objc_storeWeak(&self->_remoteObjectProxy, 0);
    objc_storeWeak(&self->_synchronousRemoteObjectProxy, 0);
    if (!self->_invalidated)
    {
      v5 = +[NRMockXPCStuff sharedInstance];
      id v6 = v5;
      if (v5) {
        v5 = (void *)v5[1];
      }
      v7 = [v5 objectForKeyedSubscript:self->_name];
      v8 = self;
      id v9 = v8;
      if (v7)
      {
        uint64_t v15 = 0;
        v16 = &v15;
        uint64_t v17 = 0x3032000000;
        v18 = __Block_byref_object_copy_;
        v19 = __Block_byref_object_dispose_;
        id v20 = 0;
        dispatch_queue_t v10 = v7[4];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __60__NRMockNSXPCListener_serverConnectionWithClientConnection___block_invoke;
        block[3] = &unk_1E5B002D0;
        block[4] = v7;
        v13 = v8;
        v14 = &v15;
        dispatch_sync(v10, block);
        WeakRetained = (id)v16[5];

        _Block_object_dispose(&v15, 8);
      }
      else
      {
        WeakRetained = 0;
      }

      if (WeakRetained && WeakRetained[40])
      {

        WeakRetained = 0;
      }
    }
    objc_storeWeak((id *)p_serverConnection, WeakRetained);
  }

  return (NRMockServerNSXPCConnection *)WeakRetained;
}

- (NSXPCInterface)remoteObjectInterface
{
  uint64_t v9 = 0;
  dispatch_queue_t v10 = &v9;
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
  v8[2] = __52__NRMockClientNSXPCConnection_remoteObjectInterface__block_invoke;
  v8[3] = &unk_1E5B00198;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return (NSXPCInterface *)v6;
}

void __52__NRMockClientNSXPCConnection_remoteObjectInterface__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) serverConnection];
  v2 = [v6 exportedInterface];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)remoteObjectProxyAsync:(BOOL)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v5 = +[NRMockXPCStuff sharedInstance];
  if (v5) {
    id v6 = v5[2];
  }
  else {
    id v6 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__NRMockClientNSXPCConnection_remoteObjectProxyAsync___block_invoke;
  v10[3] = &unk_1E5B001E0;
  v10[4] = self;
  id v11 = v5;
  v12 = &v14;
  BOOL v13 = a3;
  v7 = v5;
  dispatch_sync(v6, v10);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __54__NRMockClientNSXPCConnection_remoteObjectProxyAsync___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serverConnection];
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = (id)v2;
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = [v4 objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 8)];
  if (v16) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = 32;
    if (!*(unsigned char *)(a1 + 56)) {
      uint64_t v7 = 24;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + v7));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), WeakRetained);

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v9 = [NRMockXPCProxy alloc];
      dispatch_queue_t v10 = [v16 exportedObject];
      char v11 = *(unsigned char *)(a1 + 56);
      id v12 = v5[4];
      -[NRMockXPCProxy initWithBlahBlahBlahTarget:queue:async:]((uint64_t)v9, v10, v12, v11);
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v9;

      uint64_t v15 = 32;
      if (!*(unsigned char *)(a1 + 56)) {
        uint64_t v15 = 24;
      }
      objc_storeWeak((id *)(*(void *)(a1 + 32) + v15), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    }
  }
}

- (id)remoteObjectProxy
{
  return [(NRMockClientNSXPCConnection *)self remoteObjectProxyAsync:1];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRMockClientNSXPCConnection *)self remoteObjectProxy];
  BOOL v6 = (void *)v5;
  if (v4 && !v5)
  {
    uint64_t v7 = [(NRMockClientNSXPCConnection *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__NRMockClientNSXPCConnection_remoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E5B00208;
    id v10 = v4;
    dispatch_async(v7, block);
  }

  return v6;
}

void __65__NRMockClientNSXPCConnection_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"NSXPCConnectionInterrupted: Make sure mock server is running";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:4097 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRMockClientNSXPCConnection *)self remoteObjectProxyAsync:0];
  uint64_t v6 = (void *)v5;
  if (v4 && !v5)
  {
    uint64_t v7 = +[NRMockXPCStuff sharedInstance];
    id v8 = v7;
    if (v7) {
      uint64_t v7 = (void *)v7[1];
    }
    uint64_t v9 = [v7 objectForKeyedSubscript:self->_name];
    id v10 = (void *)v9;
    if (v9) {
      char v11 = *(NSObject **)(v9 + 32);
    }
    else {
      char v11 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__NRMockClientNSXPCConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E5B00208;
    id v14 = v4;
    dispatch_async(v11, block);
  }

  return v6;
}

void __76__NRMockClientNSXPCConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"NSXPCConnectionInterrupted: Make sure mock server is running";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:4097 userInfo:v4];
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
  block[2] = __41__NRMockClientNSXPCConnection_invalidate__block_invoke;
  block[3] = &unk_1E5B00230;
  void block[4] = self;
  dispatch_sync(isa, block);
}

uint64_t __41__NRMockClientNSXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (id)valueForEntitlement:(id)a3
{
  return (id)MEMORY[0x1E4F1CC38];
}

- (void)_invalidate
{
  isa = +[NRMockXPCStuff sharedInstance];
  id v8 = isa;
  if (isa) {
    isa = isa[2].isa;
  }
  dispatch_assert_queue_V2(isa);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serverConnection);
    uint64_t v5 = WeakRetained;
    if (WeakRetained)
    {
      -[NRMockServerNSXPCConnection _invalidate]((uint64_t)WeakRetained);
      objc_storeWeak((id *)&self->_serverConnection, 0);
    }
    objc_storeWeak(&self->_synchronousRemoteObjectProxy, 0);
    objc_storeWeak(&self->_remoteObjectProxy, 0);
    uint64_t v6 = (void *)MEMORY[0x1A624A7E0](self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v6) {
      dispatch_async((dispatch_queue_t)self->_queue, v6);
    }
  }
}

- (int)processIdentifier
{
  return 0;
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_destroyWeak(&self->_remoteObjectProxy);
  objc_destroyWeak(&self->_synchronousRemoteObjectProxy);
  objc_destroyWeak((id *)&self->_serverConnection);

  objc_storeStrong((id *)&self->_name, 0);
}

@end