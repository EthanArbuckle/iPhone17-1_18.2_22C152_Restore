@interface REPipedLocationReceiver
- (CLLocation)location;
- (OS_dispatch_queue)queue;
- (id)_init;
- (void)_queue_clearConnection;
- (void)_queue_setLocation:(id)a3;
- (void)_queue_setupConnection;
- (void)dealloc;
- (void)setLocation:(id)a3;
@end

@implementation REPipedLocationReceiver

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)REPipedLocationReceiver;
  v2 = [(RESingleton *)&v6 _init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.relevanceengine.REPipedLocationReceiver", 0);
    v4 = (void *)v2[4];
    v2[4] = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)REPipedLocationReceiver;
  [(REPipedLocationReceiver *)&v3 dealloc];
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__REPipedLocationReceiver_setLocation___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __39__REPipedLocationReceiver_setLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setLocation:", *(void *)(a1 + 40));
}

- (void)_queue_setLocation:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = RELogForDomain(5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 description];
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = [v7 UTF8String];
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_INFO, "REPipedLocationReceiver preparing to set location to %s", buf, 0xCu);
  }
  objc_storeStrong((id *)&self->_location, a3);
  connection = self->_connection;
  if (!connection)
  {
    [(REPipedLocationReceiver *)self _queue_setupConnection];
    connection = self->_connection;
  }
  v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_25];
  v10 = v9;
  if (v9)
  {
    [v9 updateLocation:self->_location];
    v11 = RELogForDomain(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v5 description];
      uint64_t v13 = [v12 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = v13;
      _os_log_impl(&dword_21E6E6000, v11, OS_LOG_TYPE_INFO, "REPipedLocationReceiver sent location to %s", buf, 0xCu);
    }
    ++self->_connectionWindowRetainCount;
    dispatch_time_t v14 = dispatch_time(0, 60000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__REPipedLocationReceiver__queue_setLocation___block_invoke_5;
    block[3] = &unk_2644BC660;
    block[4] = self;
    dispatch_after(v14, queue, block);
  }
}

void __46__REPipedLocationReceiver__queue_setLocation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = RELogForDomain(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __46__REPipedLocationReceiver__queue_setLocation___block_invoke_cold_1(v2, v3);
  }
}

uint64_t __46__REPipedLocationReceiver__queue_setLocation___block_invoke_5(uint64_t result)
{
  --*(void *)(*(void *)(result + 32) + 24);
  uint64_t v1 = *(void *)(result + 32);
  if (*(uint64_t *)(v1 + 24) <= 0 && *(void *)(v1 + 8))
  {
    uint64_t v2 = result;
    objc_super v3 = RELogForDomain(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_INFO, "Closing out REPipedLocationReceiver connection", v4, 2u);
    }

    return [*(id *)(*(void *)(v2 + 32) + 8) invalidate];
  }
  return result;
}

- (CLLocation)location
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__REPipedLocationReceiver_location__block_invoke;
  v5[3] = &unk_2644BD938;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CLLocation *)v3;
}

void __35__REPipedLocationReceiver_location__block_invoke(uint64_t a1)
{
}

- (void)_queue_setupConnection
{
  id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.relevanceengine.pipedlocation" options:4096];
  connection = self->_connection;
  self->_connection = v3;

  id v5 = self->_connection;
  uint64_t v6 = REPipedLocationReceiverInterface();
  [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

  id v7 = self->_connection;
  uint64_t v8 = REPipedLocationDonorInterface();
  [(NSXPCConnection *)v7 setExportedInterface:v8];

  [(NSXPCConnection *)self->_connection setExportedObject:self];
  objc_initWeak(&location, self);
  v9 = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__REPipedLocationReceiver__queue_setupConnection__block_invoke;
  v13[3] = &unk_2644BC638;
  objc_copyWeak(&v14, &location);
  [(NSXPCConnection *)v9 setInterruptionHandler:v13];
  v10 = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_2;
  v11[3] = &unk_2644BC638;
  objc_copyWeak(&v12, &location);
  [(NSXPCConnection *)v10 setInvalidationHandler:v11];
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __49__REPipedLocationReceiver__queue_setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = RELogForDomain(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_DEFAULT, "REPipedLocationReceiver XPC connection interrupted.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_6;
    block[3] = &unk_2644BC660;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearConnection");
}

void __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = RELogForDomain(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_DEFAULT, "REPipedLocationReceiver XPC connection invalidated.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_7;
    block[3] = &unk_2644BC660;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearConnection");
}

- (void)_queue_clearConnection
{
  [(NSXPCConnection *)self->_connection invalidate];
  [(NSXPCConnection *)self->_connection setExportedObject:0];
  connection = self->_connection;
  self->_connection = 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__REPipedLocationReceiver__queue_setLocation___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 localizedDescription];
  int v4 = 136315138;
  uint64_t v5 = [v3 UTF8String];
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Failed to get REPipedLocationReceiver proxy: %s", (uint8_t *)&v4, 0xCu);
}

@end