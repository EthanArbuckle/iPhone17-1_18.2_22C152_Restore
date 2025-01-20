@interface SUSUIControllerClient
- (BOOL)createKeybagWithSecret:(id)a3;
- (SUSUIControllerClient)init;
- (id)_remoteInterface;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (void)_connectToServerIfNecessary;
- (void)_invalidateConnection;
- (void)_noteConnectionDropped;
- (void)_noteServerExiting;
- (void)dealloc;
- (void)getPasscodePolicy:(id)a3;
- (void)invalidate;
@end

@implementation SUSUIControllerClient

- (SUSUIControllerClient)init
{
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIControllerClient;
  v4 = [(SUSUIControllerClient *)&v5 init];
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4) {
    [(SUSUIControllerClient *)v7 _connectToServerIfNecessary];
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

- (void)invalidate
{
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(SUSUIControllerClient *)self _invalidateConnection];
  v2.receiver = v4;
  v2.super_class = (Class)SUSUIControllerClient;
  [(SUSUIControllerClient *)&v2 dealloc];
}

- (BOOL)createKeybagWithSecret:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v8 = 0;
  id v5 = objc_alloc(MEMORY[0x263F78200]);
  SEL v6 = dispatch_get_global_queue(21, 0);
  id v7 = (id)objc_msgSend(v5, "initWithDelegate:queue:clientType:", 0);

  if (v7 && location[0]) {
    char v8 = [v7 createInstallationKeybag:location[0] forUnattendedInstall:1] & 1;
  }
  if (v7) {
    [v7 invalidate];
  }
  char v4 = v8;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)getPasscodePolicy:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v19 = SUSUILog();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v23, (uint64_t)v22);
      _os_log_impl(&dword_224ECB000, (os_log_t)v19, v18, "Client <%p>: getPasscodePolicy", v23, 0xCu);
    }
    objc_storeStrong(&v19, 0);
    SEL v3 = v22;
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    v14 = __43__SUSUIControllerClient_getPasscodePolicy___block_invoke;
    v15 = &unk_26470BF58;
    v16 = v22;
    id v17 = location[0];
    id v4 = [(SUSUIControllerClient *)v3 _remoteInterfaceWithErrorHandler:&v11];
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    char v8 = __43__SUSUIControllerClient_getPasscodePolicy___block_invoke_274;
    v9 = &unk_26470AC40;
    id v10 = location[0];
    [v4 getPasscodePolicy:&v5];

    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v16, 0);
    int v20 = 0;
  }
  else
  {
    int v20 = 1;
  }
  objc_storeStrong(location, 0);
}

void __43__SUSUIControllerClient_getPasscodePolicy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v5, *(void *)(a1 + 32));
    _os_log_impl(&dword_224ECB000, oslog[0], OS_LOG_TYPE_DEFAULT, "Client <%p>: error communicatin with server, return NotRequired", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

uint64_t __43__SUSUIControllerClient_getPasscodePolicy___block_invoke_274(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v2 = suPasscodePolicyToSUSUIPasscodePolicyType(a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, v2);
}

- (id)_remoteInterface
{
  return [(NSXPCConnection *)self->_serverConnection remoteObjectProxy];
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUIControllerClient *)v6 _connectToServerIfNecessary];
  id v4 = [(NSXPCConnection *)v6->_serverConnection remoteObjectProxyWithErrorHandler:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (void)_invalidateConnection
{
  if (self->_serverConnection)
  {
    -[NSXPCConnection setInvalidationHandler:](self->_serverConnection, "setInvalidationHandler:");
    [(NSXPCConnection *)self->_serverConnection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_serverConnection invalidate];
    objc_storeStrong((id *)&self->_serverConnection, 0);
    self->_connected = 0;
  }
}

- (void)_connectToServerIfNecessary
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v29 = self;
  location[1] = (os_log_t)a2;
  if (!self->_connected)
  {
    location[0] = (os_log_t)SUSUILog();
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v31, (uint64_t)v29);
      _os_log_impl(&dword_224ECB000, location[0], v27, "Client <%p>: establishing connection to softwareupdateservicesui plugin.", v31, 0xCu);
    }
    objc_storeStrong((id *)location, 0);
    [(SUSUIControllerClient *)v29 _invalidateConnection];
    uint64_t v10 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.softwareupdateservicesui.controller" options:4096];
    serverConnection = v29->_serverConnection;
    v29->_serverConnection = (NSXPCConnection *)v10;

    v9 = v29->_serverConnection;
    id v8 = MEMORY[0x263EF83A0];
    -[NSXPCConnection _setQueue:](v9, "_setQueue:");

    int v7 = v29->_serverConnection;
    id v6 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D853F10];
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:");

    uint64_t v5 = v29->_serverConnection;
    id v4 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D853F10];
    -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:");

    [(NSXPCConnection *)v29->_serverConnection setExportedObject:v29];
    objc_initWeak(&from, v29);
    uint64_t v19 = MEMORY[0x263EF8330];
    int v20 = -1073741824;
    int v21 = 0;
    v22 = __52__SUSUIControllerClient__connectToServerIfNecessary__block_invoke;
    v23 = &unk_26470B910;
    objc_copyWeak(&v24, &from);
    id v25 = (id)MEMORY[0x22A6262D0](&v19);
    [(NSXPCConnection *)v29->_serverConnection setInvalidationHandler:v25];
    SEL v3 = v29->_serverConnection;
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    v15 = __52__SUSUIControllerClient__connectToServerIfNecessary__block_invoke_2;
    v16 = &unk_26470B938;
    objc_copyWeak(&v18, &from);
    id v17 = v25;
    [(NSXPCConnection *)v3 setInterruptionHandler:&v12];
    [(NSXPCConnection *)v29->_serverConnection resume];
    v29->_connected = 1;
    v29->_serverIsExiting = 0;
    id v11 = SUSUILog();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v30, (uint64_t)v29);
      _os_log_impl(&dword_224ECB000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Client <%p>: connection established to softwareupdateservicesui plugin.", v30, 0xCu);
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v17, 0);
    objc_destroyWeak(&v18);
    objc_storeStrong(&v25, 0);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
  }
}

void __52__SUSUIControllerClient__connectToServerIfNecessary__block_invoke(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _noteConnectionDropped];
}

uint64_t __52__SUSUIControllerClient__connectToServerIfNecessary__block_invoke_2(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  os_log_t oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&a1[5].isa);
    __os_log_helper_16_0_1_8_0((uint64_t)v5, (uint64_t)WeakRetained);
    _os_log_impl(&dword_224ECB000, oslog[0], OS_LOG_TYPE_DEFAULT, "Client <%p>: softwareupdateservicesui plugin exit detected.", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  return (*((uint64_t (**)(void))a1[4].isa + 2))();
}

- (void)_noteConnectionDropped
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  SEL v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_224ECB000, oslog[0], OS_LOG_TYPE_DEFAULT, "Client <%p>: disconnected from softwareupdateservicesui plugin.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  v3->_connected = 0;
}

- (void)_noteServerExiting
{
  self->_serverIsExiting = 1;
}

- (void).cxx_destruct
{
}

@end