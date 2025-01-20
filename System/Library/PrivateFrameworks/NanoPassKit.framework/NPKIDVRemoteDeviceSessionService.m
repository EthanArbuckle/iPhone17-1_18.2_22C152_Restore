@interface NPKIDVRemoteDeviceSessionService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NPKIDVRemoteDeviceSessionService)initWithRemoteDeviceEventsCoordinator:(id)a3 connectionCoordinator:(id)a4 preflightManager:(id)a5;
- (NPKIDVRemoteDeviceSessionServiceDataSource)dataSource;
- (void)_addConnection:(id)a3;
- (void)_addServer:(id)a3;
- (void)_removeServer:(id)a3;
- (void)dealloc;
- (void)remoteDevicesSessionServer:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5;
- (void)remoteDevicesSessionServer:(id)a3 remoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a4 completion:(id)a5;
- (void)setDataSource:(id)a3;
- (void)teardownCurrentRemoteDeviceSessions;
@end

@implementation NPKIDVRemoteDeviceSessionService

- (NPKIDVRemoteDeviceSessionService)initWithRemoteDeviceEventsCoordinator:(id)a3 connectionCoordinator:(id)a4 preflightManager:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NPKIDVRemoteDeviceSessionService;
  v12 = [(NPKIDVRemoteDeviceSessionService *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_remoteDeviceEventCoordinator, a3);
    objc_storeStrong((id *)&v13->_remoteDeviceConnectionCoordinator, a4);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    sessionServers = v13->_sessionServers;
    v13->_sessionServers = v14;

    objc_storeStrong((id *)&v13->_preflightManager, a5);
    v16 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.NanoPassbook.IDVRemoteDeviceService.session.server"];
    [(NSXPCListener *)v16 setDelegate:v13];
    xpcListener = v13->_xpcListener;
    v13->_xpcListener = v16;
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
        v24 = v13;
        __int16 v25 = 2112;
        v26 = @"com.apple.NanoPassbook.IDVRemoteDeviceService.session.server";
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: New Remote Device service Listener created:%@ with serviceName:%@", buf, 0x16u);
      }
    }
  }

  return v13;
}

- (void)dealloc
{
  [(NSMutableSet *)self->_sessionServers enumerateObjectsUsingBlock:&__block_literal_global_35];
  sessionServers = self->_sessionServers;
  self->_sessionServers = 0;

  v4.receiver = self;
  v4.super_class = (Class)NPKIDVRemoteDeviceSessionService;
  [(NPKIDVRemoteDeviceSessionService *)&v4 dealloc];
}

void __43__NPKIDVRemoteDeviceSessionService_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = [v3 connection];
  [v2 invalidate];

  [v3 clearConnectionReference];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v6 = (NSXPCListener *)a3;
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
    id v11 = [(NSXPCListener *)v7 valueForEntitlement:@"com.apple.NanoPassbook.IDVRemoteDeviceService.session.client"];
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([v11 BOOLValue] & 1) != 0)
    {
      [(NPKIDVRemoteDeviceSessionService *)self _addConnection:v7];
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

- (void)remoteDevicesSessionServer:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  v7 = (void (**)(id, void, void *))a5;
  v8 = [(NPKIDVRemoteDeviceSessionService *)self dataSource];

  if (v8)
  {
    id v9 = [(NPKIDVRemoteDeviceSessionService *)self dataSource];
    [v9 remoteDevicesSessionService:self provisionedCredentialCountsForType:a4 completion:v7];
  }
  else
  {
    id v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      BOOL v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v16 = 0;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unable to fetch provisioned credential count! No data source found.", v16, 2u);
      }
    }
    if (v7)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F08320];
      v18[0] = @"No data source found";
      v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v15 = [v13 errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:v14];

      v7[2](v7, 0, v15);
    }
  }
}

- (void)remoteDevicesSessionServer:(id)a3 remoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  v7 = (void (**)(id, void, void *))a5;
  v8 = [(NPKIDVRemoteDeviceSessionService *)self dataSource];

  if (v8)
  {
    id v9 = [(NPKIDVRemoteDeviceSessionService *)self dataSource];
    [v9 remoteDevicesSessionService:self remoteBiometricAuthenticationStatusForCredentialType:a4 completion:v7];
  }
  else
  {
    id v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      BOOL v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v16 = 0;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unable to fetch remote biometric authentication status! No data source found.", v16, 2u);
      }
    }
    if (v7)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F08320];
      v18[0] = @"No data source found";
      v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v15 = [v13 errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:v14];

      v7[2](v7, 0, v15);
    }
  }
}

- (void)teardownCurrentRemoteDeviceSessions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, requested teardown all current remote device sessions", buf, 0xCu);
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = (void *)[(NSMutableSet *)self->_sessionServers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NPKIDVRemoteDeviceSessionService *)self _removeServer:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_addConnection:(id)a3
{
  id v4 = a3;
  v5 = [[NPKIDVRemoteDeviceSessionServer alloc] initWithConnection:v4 eventsCoordinator:self->_remoteDeviceEventCoordinator connectionCoordinator:self->_remoteDeviceConnectionCoordinator preflightManager:self->_preflightManager];
  [(NPKIDVRemoteDeviceSessionServer *)v5 setDataSource:self];
  v6 = NPKIDVRemoteDeviceServiceSessionServerProtocolInterface();
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:v5];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__NPKIDVRemoteDeviceSessionService__addConnection___block_invoke;
  v16[3] = &unk_2644D3260;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  uint64_t v7 = v5;
  uint64_t v17 = v7;
  [v4 setInvalidationHandler:v16];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  long long v11 = __51__NPKIDVRemoteDeviceSessionService__addConnection___block_invoke_22;
  long long v12 = &unk_2644D3260;
  objc_copyWeak(&v14, &from);
  objc_copyWeak(&v15, &location);
  uint64_t v8 = v7;
  long long v13 = v8;
  [v4 setInterruptionHandler:&v9];
  -[NPKIDVRemoteDeviceSessionService _addServer:](self, "_addServer:", v8, v9, v10, v11, v12);
  [v4 resume];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __51__NPKIDVRemoteDeviceSessionService__addConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = pk_Payment_log();
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
  [v3 _removeServer:*(void *)(a1 + 32)];
}

void __51__NPKIDVRemoteDeviceSessionService__addConnection___block_invoke_22(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = pk_Payment_log();
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
  [v3 _removeServer:*(void *)(a1 + 32)];
}

- (void)_addServer:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableSet *)self->_sessionServers addObject:v4];
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 connection];
      __int16 v9 = [v4 connection];
      int v10 = 138412546;
      __int16 v11 = v8;
      __int16 v12 = 1024;
      int v13 = [v9 processIdentifier];
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Added new connection:{%@, PID:%d}", (uint8_t *)&v10, 0x12u);
    }
  }
}

- (void)_removeServer:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 connection];
  [v5 invalidate];

  [v4 clearConnectionReference];
  [(NSMutableSet *)self->_sessionServers removeObject:v4];
  BOOL v6 = pk_Payment_log();
  LODWORD(v5) = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 connection];
      __int16 v9 = [v4 connection];
      int v10 = 138412546;
      __int16 v11 = v8;
      __int16 v12 = 1024;
      int v13 = [v9 processIdentifier];
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Removed new connection:{%@, PID:%d}", (uint8_t *)&v10, 0x12u);
    }
  }
}

- (NPKIDVRemoteDeviceSessionServiceDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NPKIDVRemoteDeviceSessionServiceDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sessionServers, 0);
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_remoteDeviceConnectionCoordinator, 0);
  objc_storeStrong((id *)&self->_remoteDeviceEventCoordinator, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end