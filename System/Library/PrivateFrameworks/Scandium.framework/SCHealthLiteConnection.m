@interface SCHealthLiteConnection
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (SCHLDaemon)healthlite;
- (SCHealthLiteConnection)initWithDelegate:(id)a3 onQueue:(id)a4;
- (SCHealthLiteConnectionDelegate)delegate;
- (void)abortSession;
- (void)beginSession;
- (void)connectToHealthLite;
- (void)dealloc;
- (void)interruptionHandler;
- (void)invalidationHandler;
- (void)setBackgroundAllowed:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHealthlite:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SCHealthLiteConnection

- (SCHealthLiteConnection)initWithDelegate:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCHealthLiteConnection;
  v8 = [(SCHealthLiteConnection *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    [(SCHealthLiteConnection *)v9 connectToHealthLite];
    v10 = v9;
  }

  return v9;
}

- (void)connectToHealthLite
{
  v3 = sc_get_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_25BA34000, v3, OS_LOG_TYPE_DEFAULT, "connecting to HealthLite", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = [(SCHealthLiteConnection *)self queue];
  v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.healthlite.scandium_plugin" options:0];
  [(SCHealthLiteConnection *)self setConnection:v5];
  id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2709390E8];
  [v5 setRemoteObjectInterface:v6];

  id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270937880];
  [v5 setExportedInterface:v7];

  [v5 setExportedObject:self];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __45__SCHealthLiteConnection_connectToHealthLite__block_invoke;
  v19[3] = &unk_2654A05A8;
  id v8 = v4;
  id v20 = v8;
  objc_copyWeak(&v21, buf);
  [v5 setInterruptionHandler:v19];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_3;
  v16 = &unk_2654A05A8;
  id v9 = v8;
  id v17 = v9;
  objc_copyWeak(&v18, buf);
  [v5 setInvalidationHandler:&v13];
  objc_msgSend(v5, "resume", v13, v14, v15, v16);
  v10 = [v5 remoteObjectProxy];
  [(SCHealthLiteConnection *)self setHealthlite:v10];

  v11 = [(SCHealthLiteConnection *)self healthlite];
  [v11 connect];

  objc_super v12 = [(SCHealthLiteConnection *)self delegate];
  [v12 handleInitialConnect];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);

  objc_destroyWeak(buf);
}

void __45__SCHealthLiteConnection_connectToHealthLite__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_2;
  block[3] = &unk_2654A0530;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained interruptionHandler];
}

void __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_3(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_4;
  block[3] = &unk_2654A0530;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidationHandler];
}

- (void)invalidationHandler
{
}

- (void)interruptionHandler
{
}

- (void)dealloc
{
}

- (void)abortSession
{
}

void __38__SCHealthLiteConnection_abortSession__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 abortSession];
}

- (void)beginSession
{
}

void __38__SCHealthLiteConnection_beginSession__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 beginSession];
}

- (void)setBackgroundAllowed:(BOOL)a3
{
  v5 = sc_get_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SCHealthLiteConnection setBackgroundAllowed:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = [(SCHealthLiteConnection *)self queue];
  uint64_t v14 = v13;
  if (v13)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__SCHealthLiteConnection_setBackgroundAllowed___block_invoke;
    v15[3] = &unk_2654A05F8;
    v15[4] = self;
    BOOL v16 = a3;
    dispatch_async(v13, v15);
  }
}

void __47__SCHealthLiteConnection_setBackgroundAllowed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 setBackgroundAllowed:*(unsigned __int8 *)(a1 + 40)];
}

- (SCHLDaemon)healthlite
{
  return self->_healthlite;
}

- (void)setHealthlite:(id)a3
{
}

- (SCHealthLiteConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCHealthLiteConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_healthlite, 0);
}

- (void)setBackgroundAllowed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end