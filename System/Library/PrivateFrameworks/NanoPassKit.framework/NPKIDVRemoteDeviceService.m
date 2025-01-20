@interface NPKIDVRemoteDeviceService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NPKIDVRemoteDeviceService)initWithServiceName:(id)a3 delegate:(id)a4 callbackQueue:(id)a5;
- (NPKIDVRemoteDeviceServiceDelegate)delegate;
- (NSString)serviceName;
- (void)_addConnection:(id)a3;
- (void)_addServer:(id)a3;
- (void)_removeServer:(id)a3;
- (void)dealloc;
- (void)identityRemoteDeviceServiceServer:(id)a3 didReceiveEvent:(unint64_t)a4 fromRemoteDeviceWithID:(id)a5;
- (void)registerForEvents:(unint64_t)a3 withSession:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)unregisterFromEvents:(unint64_t)a3 withSession:(id)a4 completion:(id)a5;
@end

@implementation NPKIDVRemoteDeviceService

- (NPKIDVRemoteDeviceService)initWithServiceName:(id)a3 delegate:(id)a4 callbackQueue:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NPKIDVRemoteDeviceService;
  v11 = [(NPKIDVRemoteDeviceService *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    serviceName = v11->_serviceName;
    v11->_serviceName = (NSString *)v12;

    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_storeStrong((id *)&v11->_delegateCallBackQueue, a5);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    serviceServers = v11->_serviceServers;
    v11->_serviceServers = v14;

    v16 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v8];
    [(NSXPCListener *)v16 setDelegate:v11];
    xpcListener = v11->_xpcListener;
    v11->_xpcListener = v16;
    v18 = v16;

    [(NSXPCListener *)v18 resume];
    v19 = pk_Payment_log();
    LODWORD(xpcListener) = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (xpcListener)
    {
      v20 = pk_Payment_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v11;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: New Remote Device service Listener created:%@ with serviceName:%@", buf, 0x16u);
      }
    }
  }

  return v11;
}

- (NPKIDVRemoteDeviceServiceDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  delegateCallBackQueue = self->_delegateCallBackQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__NPKIDVRemoteDeviceService_delegate__block_invoke;
  v5[3] = &unk_2644D2960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(delegateCallBackQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NPKIDVRemoteDeviceServiceDelegate *)v3;
}

void __37__NPKIDVRemoteDeviceService_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  delegateCallBackQueue = self->_delegateCallBackQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__NPKIDVRemoteDeviceService_setDelegate___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateCallBackQueue, v7);
}

id __41__NPKIDVRemoteDeviceService_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)dealloc
{
  [(NSMutableSet *)self->_serviceServers enumerateObjectsUsingBlock:&__block_literal_global_2];
  serviceServers = self->_serviceServers;
  self->_serviceServers = 0;

  v4.receiver = self;
  v4.super_class = (Class)NPKIDVRemoteDeviceService;
  [(NPKIDVRemoteDeviceService *)&v4 dealloc];
}

void __36__NPKIDVRemoteDeviceService_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = [v3 connection];
  [v2 invalidate];

  [v3 clearConnectionReference];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  xpcListener = self->_xpcListener;
  id v9 = pk_Payment_log();
  id v10 = v9;
  if (xpcListener == v6)
  {
    BOOL v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested new connection:%@", (uint8_t *)&v18, 0xCu);
      }
    }
    id v11 = [(NSXPCListener *)v7 valueForEntitlement:@"com.apple.NanoPassbook.IDVRemoteDeviceService.client"];
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([v11 BOOLValue] & 1) != 0)
    {
      [(NPKIDVRemoteDeviceService *)self _addConnection:v7];
      LOBYTE(self) = 1;
      goto LABEL_14;
    }
    v15 = pk_Payment_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      v17 = pk_Payment_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: client doesn't have required entitlement to establish the connection", (uint8_t *)&v18, 2u);
      }
    }
LABEL_5:
    LOBYTE(self) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LODWORD(self) = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

  if (self)
  {
    id v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unknown requested connection from listener:%@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_5;
  }
LABEL_15:

  return (char)self;
}

- (void)_addConnection:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[NPKIDVRemoteDeviceServiceServer alloc] initWithConnection:v4 delegate:self];
  id v6 = NPKIDVRemoteDeviceServiceServerProtocolInterface();
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:v5];
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __44__NPKIDVRemoteDeviceService__addConnection___block_invoke;
  v20[3] = &unk_2644D3260;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  v7 = v5;
  v21 = v7;
  [v4 setInvalidationHandler:v20];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __44__NPKIDVRemoteDeviceService__addConnection___block_invoke_7;
  BOOL v16 = &unk_2644D3260;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  id v8 = v7;
  v17 = v8;
  [v4 setInterruptionHandler:&v13];
  -[NPKIDVRemoteDeviceService _addServer:](self, "_addServer:", v8, v13, v14, v15, v16);
  [v4 resume];
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v4 processIdentifier];
      *(_DWORD *)buf = 138412546;
      id v27 = v4;
      __int16 v28 = 1024;
      int v29 = v12;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Added new connection:{%@, PID:%d}", buf, 0x12u);
    }
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __44__NPKIDVRemoteDeviceService__addConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 _removeServer:*(void *)(a1 + 32)];
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      __int16 v11 = 1024;
      int v12 = [WeakRetained processIdentifier];
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@ Connection invalidated:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __44__NPKIDVRemoteDeviceService__addConnection___block_invoke_7(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 _removeServer:*(void *)(a1 + 32)];
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      __int16 v11 = 1024;
      int v12 = [WeakRetained processIdentifier];
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@ Connection interrupted:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)_addServer:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_serviceServers, "addObject:");
  }
}

- (void)_removeServer:(id)a3
{
  id v5 = a3;
  id v4 = [v5 connection];
  [v4 invalidate];

  [v5 clearConnectionReference];
  [(NSMutableSet *)self->_serviceServers removeObject:v5];
}

- (void)registerForEvents:(unint64_t)a3 withSession:(id)a4 completion:(id)a5
{
}

- (void)unregisterFromEvents:(unint64_t)a3 withSession:(id)a4 completion:(id)a5
{
}

- (void)identityRemoteDeviceServiceServer:(id)a3 didReceiveEvent:(unint64_t)a4 fromRemoteDeviceWithID:(id)a5
{
  id v7 = a5;
  delegateCallBackQueue = self->_delegateCallBackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__NPKIDVRemoteDeviceService_identityRemoteDeviceServiceServer_didReceiveEvent_fromRemoteDeviceWithID___block_invoke;
  block[3] = &unk_2644D3288;
  id v11 = v7;
  unint64_t v12 = a4;
  block[4] = self;
  id v9 = v7;
  dispatch_async(delegateCallBackQueue, block);
}

void __102__NPKIDVRemoteDeviceService_identityRemoteDeviceServiceServer_didReceiveEvent_fromRemoteDeviceWithID___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  [WeakRetained identityRemoteDeviceService:a1[4] didReceiveEvent:a1[6] fromRemoteDeviceWithID:a1[5]];

  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_loadWeakRetained((id *)(a1[4] + 32));
      id v7 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a1[6]);
      uint64_t v8 = a1[5];
      int v9 = 138412802;
      id v10 = v6;
      __int16 v11 = 2112;
      unint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did notify delegate:%@ received event: %@ from remote Device with ID:%@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceServers, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateCallBackQueue, 0);
}

@end