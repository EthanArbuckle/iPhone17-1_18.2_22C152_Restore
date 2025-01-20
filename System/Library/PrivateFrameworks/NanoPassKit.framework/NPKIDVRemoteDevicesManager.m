@interface NPKIDVRemoteDevicesManager
- (NPKIDVRemoteDevicesManager)initWithDataSource:(id)a3;
- (NPKIDVRemoteDevicesManagerDataSource)dataSource;
- (id)biometricPassPreflightManagerPairedDeviceOSVersion:(id)a3;
- (void)_handleDeviceDidUnpair:(id)a3;
- (void)_registerForDeviceEvents;
- (void)_teardownConnections;
- (void)biometricPassPreflightManager:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5;
- (void)deviceDidBecomeActive:(id)a3;
- (void)deviceDidBecomeInactive;
- (void)deviceDidDeletePass:(id)a3;
- (void)remoteDeviceConnectionCoordinator:(id)a3 didReceivePrearmStatusUpdate:(int64_t)a4;
- (void)remoteDevicesSessionService:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5;
- (void)remoteDevicesSessionService:(id)a3 remoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a4 completion:(id)a5;
@end

@implementation NPKIDVRemoteDevicesManager

- (NPKIDVRemoteDevicesManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NPKIDVRemoteDevicesManager;
  v5 = [(NPKIDVRemoteDevicesManager *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v7 = objc_alloc_init(NPKIDVRemoteDeviceServiceEventsCoordinator);
    eventsCoordinator = v6->_eventsCoordinator;
    v6->_eventsCoordinator = v7;

    v9 = objc_alloc_init(NPKIDVRemoteDeviceConnectionCoordinator);
    connectionCoordinator = v6->_connectionCoordinator;
    v6->_connectionCoordinator = v9;

    v11 = [[NPKBiometricPassPreflightManager alloc] initWithDataSource:v6];
    preflightManager = v6->_preflightManager;
    v6->_preflightManager = v11;

    v13 = [[NPKIDVRemoteDeviceSessionService alloc] initWithRemoteDeviceEventsCoordinator:v6->_eventsCoordinator connectionCoordinator:v6->_connectionCoordinator preflightManager:v6->_preflightManager];
    remoteDeviceService = v6->_remoteDeviceService;
    v6->_remoteDeviceService = v13;

    [(NPKIDVRemoteDeviceSessionService *)v6->_remoteDeviceService setDataSource:v6];
    [(NPKIDVRemoteDevicesManager *)v6 _registerForDeviceEvents];
  }

  return v6;
}

- (void)deviceDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Handling Device did become activate", v8, 2u);
    }
  }
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self->_eventsCoordinator initializeWithDevice:v4];
  [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator startCurrentRemoteDeviceConnection];
  [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator updatePrearmStatus];
}

- (void)deviceDidBecomeInactive
{
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Handling Device did became Inactive", v6, 2u);
    }
  }
  [(NPKIDVRemoteDevicesManager *)self _teardownConnections];
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self->_eventsCoordinator teardownCurrentRemoteDeviceContextWithReason:0];
}

- (void)deviceDidDeletePass:(id)a3
{
  id v4 = a3;
  v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Handling device pass deletion event", v8, 2u);
    }
  }
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self->_eventsCoordinator handlePassDeletionForPass:v4];
}

- (void)_handleDeviceDidUnpair:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Handling Device did unpair", v7, 2u);
    }
  }
  [(NPKIDVRemoteDevicesManager *)self _teardownConnections];
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self->_eventsCoordinator teardownCurrentRemoteDeviceContextWithReason:1];
}

- (void)remoteDeviceConnectionCoordinator:(id)a3 didReceivePrearmStatusUpdate:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = NSStringFromNPKIDVDeviceCredentialPrearmStatus(a4);
      int v10 = 138412546;
      v11 = self;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: :%@ Received credential prearm status update:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self->_eventsCoordinator setNeedsPrearmCredential:a4 == 1];
}

- (id)biometricPassPreflightManagerPairedDeviceOSVersion:(id)a3
{
  id v4 = [(NPKIDVRemoteDevicesManager *)self dataSource];
  BOOL v5 = [v4 remoteDevicesManagerPairedDeviceOSVersion:self];

  return v5;
}

- (void)biometricPassPreflightManager:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = [(NPKIDVRemoteDevicesManager *)self dataSource];
  [v8 remoteDevicesManager:self provisionedCredentialCountsForType:a4 completion:v7];
}

- (void)remoteDevicesSessionService:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = [(NPKIDVRemoteDevicesManager *)self dataSource];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __104__NPKIDVRemoteDevicesManager_remoteDevicesSessionService_provisionedCredentialCountsForType_completion___block_invoke;
  v10[3] = &unk_2644D4C68;
  id v11 = v7;
  id v9 = v7;
  [v8 remoteDevicesManager:self provisionedCredentialCountsForType:a4 completion:v10];
}

uint64_t __104__NPKIDVRemoteDevicesManager_remoteDevicesSessionService_provisionedCredentialCountsForType_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)remoteDevicesSessionService:(id)a3 remoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = [(NPKIDVRemoteDevicesManager *)self dataSource];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __122__NPKIDVRemoteDevicesManager_remoteDevicesSessionService_remoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke;
  v10[3] = &unk_2644D4150;
  id v11 = v7;
  id v9 = v7;
  [v8 remoteDevicesManager:self remoteBiometricAuthenticationStatusForCredentialType:a4 completion:v10];
}

uint64_t __122__NPKIDVRemoteDevicesManager_remoteDevicesSessionService_remoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)_teardownConnections
{
  [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator teardownCurrentRemoteDeviceConnection];
  remoteDeviceService = self->_remoteDeviceService;
  [(NPKIDVRemoteDeviceSessionService *)remoteDeviceService teardownCurrentRemoteDeviceSessions];
}

- (void)_registerForDeviceEvents
{
  id v4 = [MEMORY[0x263F57730] sharedInstance];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleDeviceDidUnpair_ name:*MEMORY[0x263F576B8] object:v4];
  [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator addObserver:self];
}

- (NPKIDVRemoteDevicesManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NPKIDVRemoteDevicesManagerDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_connectionCoordinator, 0);
  objc_storeStrong((id *)&self->_remoteDeviceService, 0);
  objc_storeStrong((id *)&self->_eventsCoordinator, 0);
}

@end