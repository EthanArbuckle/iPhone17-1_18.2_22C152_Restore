@interface SCLSchoolModeXPCClient
- (BOOL)_makeConnection:(id)a3;
- (BOOL)isLoaded;
- (NSXPCConnection)connection;
- (SCLScheduleSettings)scheduleSettings;
- (SCLSchoolModeConfiguration)configuration;
- (SCLSchoolModeXPCClient)initWithDelegate:(id)a3 configuration:(id)a4;
- (SCLSchoolModeXPCClientDelegate)delegate;
- (SCLState)state;
- (id)serverWithErrorHandler:(id)a3;
- (int64_t)clientState;
- (int64_t)connectionState;
- (mach_timebase_info)timebase;
- (unint64_t)lastServerRestartTime;
- (void)_connectionDidInterrupt;
- (void)_connectionDidInvalidate;
- (void)_reconnectToServer;
- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4;
- (void)applyScheduleSettings:(id)a3 completion:(id)a4;
- (void)applyServerSettings:(id)a3;
- (void)dealloc;
- (void)deleteHistoryWithCompletion:(id)a3;
- (void)didChangeUnlockHistory;
- (void)dumpState;
- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3;
- (void)invalidate;
- (void)noteSignificantUserInteraction;
- (void)resume;
- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setClientState:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLastServerRestartTime:(unint64_t)a3;
- (void)setTimebase:(mach_timebase_info)a3;
- (void)triggerRemoteSync;
@end

@implementation SCLSchoolModeXPCClient

- (SCLSchoolModeXPCClient)initWithDelegate:(id)a3 configuration:(id)a4
{
  kern_return_t v10;
  NSObject *v11;
  SCLSchoolModeServerSettings *v12;
  SCLSchoolModeServerSettings *serverSettings;
  SCLMutableScheduleSettings *v14;
  SCLSchedule *v15;
  SCLState *v16;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void handler[4];
  id v27;
  id v28;
  id location;
  objc_super v30;
  uint8_t buf[24];
  uint64_t v32;

  v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SCLSchoolModeXPCClient;
  v8 = [(SCLSchoolModeXPCClient *)&v30 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_configuration, a4);
    v9->_connectionLock._os_unfair_lock_opaque = 0;
    v9->_connectionState = 0;
    v9->_clientState = 0;
    v10 = mach_timebase_info(&v9->_timebase);
    if (v10)
    {
      v11 = scl_framework_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SCLSchoolModeXPCClient initWithDelegate:configuration:](v7, v10, v11);
      }
    }
    v12 = objc_alloc_init(SCLSchoolModeServerSettings);
    serverSettings = v9->_serverSettings;
    v9->_serverSettings = v12;

    v14 = objc_alloc_init(SCLMutableScheduleSettings);
    v15 = objc_alloc_init(SCLSchedule);
    [(SCLMutableScheduleSettings *)v14 setSchedule:v15];

    [(SCLSchoolModeServerSettings *)v9->_serverSettings setScheduleSettings:v14];
    v16 = [[SCLState alloc] initWithActiveState:0 scheduleEnabled:0 inSchedule:0];
    [(SCLSchoolModeServerSettings *)v9->_serverSettings setState:v16];
    [(SCLSchoolModeXPCClient *)v9 _makeConnection:v7];
    v17 = [v7 identifier];
    objc_initWeak(&location, v9);
    v18 = (const char *)[@"SCLServerStartNotification" UTF8String];
    v19 = [(SCLSchoolModeXPCClient *)v9 configuration];
    v20 = [v19 targetQueue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __57__SCLSchoolModeXPCClient_initWithDelegate_configuration___block_invoke;
    handler[3] = &unk_2648AC1E8;
    v21 = v17;
    v27 = v21;
    objc_copyWeak(&v28, &location);
    v22 = notify_register_dispatch(v18, &v9->_restartNotificationToken, v20, handler);

    if (v22)
    {
      v23 = scl_framework_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = [NSNumber numberWithUnsignedInt:v22];
        [(SCLSchoolModeXPCClient *)(uint64_t)v21 initWithDelegate:buf configuration:v23];
      }
    }
    objc_destroyWeak(&v28);

    objc_destroyWeak(&location);
  }

  return v9;
}

void __57__SCLSchoolModeXPCClient_initWithDelegate_configuration___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = scl_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_22B7B4000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] received server restart notification", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setLastServerRestartTime:mach_continuous_time()];
  [WeakRetained _reconnectToServer];
}

- (void)dealloc
{
  int restartNotificationToken = self->_restartNotificationToken;
  if (restartNotificationToken != -1) {
    notify_cancel(restartNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCLSchoolModeXPCClient;
  [(SCLSchoolModeXPCClient *)&v4 dealloc];
}

- (BOOL)_makeConnection:(id)a3
{
  id v4 = a3;
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if ([(SCLSchoolModeXPCClient *)self clientState] == 2)
  {
    os_unfair_lock_unlock(&self->_connectionLock);
    BOOL v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    if ((unint64_t)(self->_connectionState - 3) <= 1)
    {
      [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
      [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
      [(NSXPCConnection *)self->_connection invalidate];
      connection = self->_connection;
      self->_connection = 0;

      self->_connectionState = 2;
    }
    v9 = self->_connection;
    v10 = v9;
    if (!v9)
    {
      v11 = [v4 testingEndpoint];

      id v12 = objc_alloc(MEMORY[0x263F08D68]);
      v13 = v12;
      if (v11)
      {
        v14 = [v4 testingEndpoint];
        v15 = (NSXPCConnection *)[v13 initWithListenerEndpoint:v14];
        v16 = self->_connection;
        self->_connection = v15;
      }
      else
      {
        v17 = (NSXPCConnection *)[v12 initWithMachServiceName:@"com.apple.schooltime.schedule" options:0];
        v14 = self->_connection;
        self->_connection = v17;
      }

      v18 = [v4 identifier];
      [(NSXPCConnection *)self->_connection setExportedObject:self];
      v19 = self->_connection;
      v20 = SCLSchoolModeClientXPCInterface();
      [(NSXPCConnection *)v19 setExportedInterface:v20];

      v21 = self->_connection;
      v22 = SCLSchoolModeServerXPCInterface();
      [(NSXPCConnection *)v21 setRemoteObjectInterface:v22];

      v23 = self->_connection;
      v24 = [v4 targetQueue];
      [(NSXPCConnection *)v23 _setQueue:v24];

      objc_initWeak(&location, self);
      v25 = self->_connection;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __42__SCLSchoolModeXPCClient__makeConnection___block_invoke;
      v33[3] = &unk_2648AC210;
      objc_copyWeak(&v35, &location);
      id v26 = v18;
      id v34 = v26;
      [(NSXPCConnection *)v25 setInterruptionHandler:v33];
      v27 = self->_connection;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __42__SCLSchoolModeXPCClient__makeConnection___block_invoke_10;
      v30[3] = &unk_2648AC210;
      objc_copyWeak(&v32, &location);
      id v28 = v26;
      id v31 = v28;
      [(NSXPCConnection *)v27 setInvalidationHandler:v30];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);

      v10 = self->_connection;
    }
    uint64_t v7 = v10;
    os_unfair_lock_unlock(p_connectionLock);
    if (v9)
    {
      BOOL v6 = 0;
    }
    else
    {
      [(NSXPCConnection *)v7 resume];
      BOOL v6 = 1;
    }
  }

  return v6;
}

void __42__SCLSchoolModeXPCClient__makeConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = scl_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_22B7B4000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Connection was interrupted.", (uint8_t *)&v5, 0xCu);
  }

  [WeakRetained _connectionDidInterrupt];
}

void __42__SCLSchoolModeXPCClient__makeConnection___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = scl_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__SCLSchoolModeXPCClient__makeConnection___block_invoke_10_cold_1(a1, v3);
  }

  [WeakRetained _connectionDidInvalidate];
}

- (void)resume
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "Cannot resume an invalidated client %{public}@", buf, 0xCu);
}

void __32__SCLSchoolModeXPCClient_resume__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  int v5 = [*(id *)(a1 + 32) configuration];
  uint64_t v6 = [v5 identifier];

  uint64_t v7 = *(void *)(a1 + 40);
  v8 = scl_framework_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9) {
      __32__SCLSchoolModeXPCClient_resume__block_invoke_cold_2();
    }
  }
  else
  {
    if (v9) {
      __32__SCLSchoolModeXPCClient_resume__block_invoke_cold_1();
    }

    v10 = [[SCLState alloc] initWithActiveState:0 scheduleEnabled:0 inSchedule:0];
    [v4 setState:v10];

    [*(id *)(a1 + 32) applyServerSettings:v4];
  }
}

void __32__SCLSchoolModeXPCClient_resume__block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v4 = scl_framework_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_INFO, "synchronous, updating server settings before applying", v7, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    int v5 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = [v3 state];
    [v5 setState:v6];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
  [*(id *)(a1 + 32) applyServerSettings:v3];
}

- (void)_reconnectToServer
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = _os_activity_create(&dword_22B7B4000, "Reconnect SCLSchoolMode", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v3, &v12);
  uint64_t v4 = [(SCLSchoolModeConfiguration *)self->_configuration identifier];
  int v5 = [(SCLSchoolModeXPCClient *)self configuration];
  BOOL v6 = [(SCLSchoolModeXPCClient *)self _makeConnection:v5];

  os_unfair_lock_lock(&self->_connectionLock);
  unint64_t v7 = [(SCLSchoolModeXPCClient *)self clientState];
  os_unfair_lock_unlock(&self->_connectionLock);
  v8 = scl_framework_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 2) {
      BOOL v9 = &stru_26DF07678;
    }
    else {
      BOOL v9 = off_2648AC318[v7];
    }
    *(_DWORD *)buf = 138543874;
    v14 = v4;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_22B7B4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] made new connection for reconnect: %{BOOL}d; clientState: %@",
      buf,
      0x1Cu);
  }

  if (v7 == 1 && v6)
  {
    v11 = scl_framework_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      _os_log_impl(&dword_22B7B4000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] new connection and previously running, resuming", buf, 0xCu);
    }

    [(SCLSchoolModeXPCClient *)self resume];
  }

  os_activity_scope_leave(&v12);
}

- (SCLState)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(SCLSchoolModeServerSettings *)self->_serverSettings state];
  os_unfair_lock_unlock(p_lock);
  return (SCLState *)v4;
}

- (SCLScheduleSettings)scheduleSettings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(SCLSchoolModeServerSettings *)self->_serverSettings scheduleSettings];
  os_unfair_lock_unlock(p_lock);
  return (SCLScheduleSettings *)v4;
}

- (BOOL)isLoaded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(SCLSchoolModeServerSettings *)v2->_serverSettings isLoaded];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  [(SCLSchoolModeXPCClient *)self setClientState:2];
  notify_cancel(self->_restartNotificationToken);
  self->_int restartNotificationToken = -1;
  id v4 = [(SCLSchoolModeXPCClient *)self connection];
  [v4 setInterruptionHandler:0];
  [v4 setInvalidationHandler:0];
  os_unfair_lock_unlock(p_connectionLock);
  [v4 invalidate];
}

- (void)applyScheduleSettings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__SCLSchoolModeXPCClient_applyScheduleSettings_completion___block_invoke;
  v11[3] = &unk_2648AC288;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  BOOL v9 = [(SCLSchoolModeXPCClient *)self serverWithErrorHandler:v11];
  v10 = (void *)[v8 copy];

  [v9 applySchedule:v10 completion:v7];
}

uint64_t __59__SCLSchoolModeXPCClient_applyScheduleSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__SCLSchoolModeXPCClient_setActive_options_completion___block_invoke;
  v15[3] = &unk_2648AC2B0;
  v15[4] = self;
  BOOL v17 = v6;
  id v9 = v8;
  id v16 = v9;
  v10 = [(SCLSchoolModeXPCClient *)self serverWithErrorHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__SCLSchoolModeXPCClient_setActive_options_completion___block_invoke_14;
  v12[3] = &unk_2648AC2D8;
  BOOL v14 = v6;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 setActive:v6 options:a4 completion:v12];
}

void __55__SCLSchoolModeXPCClient_setActive_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = scl_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = [*(id *)(a1 + 32) configuration];
    BOOL v6 = [v5 identifier];
    int v7 = *(unsigned __int8 *)(a1 + 48);
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 1024;
    int v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_INFO, "[%@] setActive %{BOOL}u error %@", (uint8_t *)&v8, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55__SCLSchoolModeXPCClient_setActive_options_completion___block_invoke_14(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = scl_framework_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [*(id *)(a1 + 32) configuration];
    int v8 = [v7 identifier];
    int v9 = *(unsigned __int8 *)(a1 + 48);
    int v10 = 138413058;
    int v11 = v8;
    __int16 v12 = 1024;
    int v13 = v9;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_INFO, "[%@] setActive %{BOOL}u success %{BOOL}u error %@", (uint8_t *)&v10, 0x22u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__SCLSchoolModeXPCClient_fetchRecentUnlockHistoryItemsWithCompletion___block_invoke;
  v7[3] = &unk_2648AC288;
  id v8 = v4;
  id v5 = v4;
  BOOL v6 = [(SCLSchoolModeXPCClient *)self serverWithErrorHandler:v7];
  [v6 fetchRecentUnlockHistoryItemsWithCompletion:v5];
}

uint64_t __70__SCLSchoolModeXPCClient_fetchRecentUnlockHistoryItemsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__SCLSchoolModeXPCClient_addUnlockHistoryItem_completion___block_invoke;
  v10[3] = &unk_2648AC288;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  int v9 = [(SCLSchoolModeXPCClient *)self serverWithErrorHandler:v10];
  [v9 addUnlockHistoryItem:v8 completion:v7];
}

uint64_t __58__SCLSchoolModeXPCClient_addUnlockHistoryItem_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteHistoryWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SCLSchoolModeXPCClient_deleteHistoryWithCompletion___block_invoke;
  v7[3] = &unk_2648AC288;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(SCLSchoolModeXPCClient *)self serverWithErrorHandler:v7];
  [v6 deleteHistoryWithCompletion:v5];
}

uint64_t __54__SCLSchoolModeXPCClient_deleteHistoryWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)noteSignificantUserInteraction
{
  id v2 = [(SCLSchoolModeXPCClient *)self serverWithErrorHandler:&__block_literal_global_0];
  [v2 noteSignificantUserInteraction];
}

- (void)triggerRemoteSync
{
  id v2 = [(SCLSchoolModeXPCClient *)self serverWithErrorHandler:&__block_literal_global_17];
  [v2 triggerRemoteSync];
}

- (void)dumpState
{
  id v2 = [(SCLSchoolModeXPCClient *)self serverWithErrorHandler:&__block_literal_global_19];
  [v2 dumpState];
}

- (id)serverWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLSchoolModeXPCClient *)self configuration];
  BOOL v6 = [(SCLSchoolModeXPCClient *)self _makeConnection:v5];

  if (v6) {
    [(SCLSchoolModeXPCClient *)self resume];
  }
  id v7 = [(SCLSchoolModeXPCClient *)self connection];
  id v8 = [v7 remoteObjectProxyWithErrorHandler:v4];

  return v8;
}

- (void)_connectionDidInvalidate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = scl_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SCLSchoolModeXPCClient *)self configuration];
    id v5 = [v4 identifier];
    BOOL v6 = [(SCLSchoolModeXPCClient *)self configuration];
    id v7 = [v6 pairingID];
    int v8 = 138412546;
    int v9 = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_22B7B4000, v3, OS_LOG_TYPE_DEFAULT, "Marking connection as interrupted and NOT reconnecting %@ - %@", (uint8_t *)&v8, 0x16u);
  }
  os_unfair_lock_lock(&self->_connectionLock);
  self->_connectionState = 4;
  os_unfair_lock_unlock(&self->_connectionLock);
}

- (void)_connectionDidInterrupt
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(SCLSchoolModeXPCClient *)self configuration];
  id v4 = [v3 targetQueue];
  dispatch_assert_queue_V2(v4);

  if ([(SCLSchoolModeXPCClient *)self lastServerRestartTime]
    && (uint64_t v5 = mach_continuous_time(),
        (v5 - [(SCLSchoolModeXPCClient *)self lastServerRestartTime])
      * self->_timebase.numer
      / self->_timebase.denom <= 0x773593FF))
  {
    BOOL v6 = scl_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(SCLSchoolModeXPCClient *)self configuration];
      int v8 = [v7 identifier];
      int v9 = [(SCLSchoolModeXPCClient *)self configuration];
      __int16 v10 = [v9 pairingID];
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "Marking connection as interrupted and reconnecting %@ - %@ because server recently restarted", (uint8_t *)&v16, 0x16u);
    }
    os_unfair_lock_lock(&self->_connectionLock);
    self->_connectionState = 3;
    os_unfair_lock_unlock(&self->_connectionLock);
    [(SCLSchoolModeXPCClient *)self _reconnectToServer];
  }
  else
  {
    id v11 = scl_framework_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(SCLSchoolModeXPCClient *)self configuration];
      int v13 = [v12 identifier];
      __int16 v14 = [(SCLSchoolModeXPCClient *)self configuration];
      int v15 = [v14 pairingID];
      int v16 = 138412546;
      id v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_impl(&dword_22B7B4000, v11, OS_LOG_TYPE_DEFAULT, "Marking connection as interrupted and NOT reconnecting %@ - %@", (uint8_t *)&v16, 0x16u);
    }
    os_unfair_lock_lock(&self->_connectionLock);
    self->_connectionState = 3;
    os_unfair_lock_unlock(&self->_connectionLock);
  }
}

- (void)applyServerSettings:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = self->_serverSettings;
  BOOL v6 = (SCLSchoolModeServerSettings *)[v4 copy];
  serverSettings = self->_serverSettings;
  self->_serverSettings = v6;

  os_unfair_lock_unlock(&self->_lock);
  int v8 = [(SCLSchoolModeServerSettings *)v5 state];
  int v9 = [v4 state];
  __int16 v10 = scl_framework_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [(SCLSchoolModeXPCClient *)self configuration];
    uint64_t v12 = [v11 identifier];
    int v18 = 138543874;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    v21 = v8;
    __int16 v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_22B7B4000, v10, OS_LOG_TYPE_INFO, "[%{public}@] Applying server settings, oldState %@, newState %@", (uint8_t *)&v18, 0x20u);
  }
  if (v8 != v9 && ([v8 isEqual:v9] & 1) == 0)
  {
    int v13 = [(SCLSchoolModeXPCClient *)self delegate];
    [v13 client:self didUpdateToState:v9 fromState:v8];
  }
  __int16 v14 = [(SCLSchoolModeServerSettings *)v5 scheduleSettings];
  int v15 = [v4 scheduleSettings];
  if (!-[SCLSchoolModeServerSettings isLoaded](v5, "isLoaded") && [v4 isLoaded])
  {
    int v16 = [(SCLSchoolModeXPCClient *)self delegate];
    [v16 client:self didLoadScheduleSettings:v15];
  }
  if (([v14 isEqual:v15] & 1) == 0
    && [(SCLSchoolModeServerSettings *)v5 isLoaded]
    && [v4 isLoaded])
  {
    id v17 = [(SCLSchoolModeXPCClient *)self delegate];
    [v17 client:self didUpdateScheduleSettings:v15];
  }
}

- (void)didChangeUnlockHistory
{
  id v3 = [(SCLSchoolModeXPCClient *)self delegate];
  [v3 clientDidChangeUnlockHistory:self];
}

- (SCLSchoolModeXPCClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCLSchoolModeXPCClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (SCLSchoolModeConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (int64_t)clientState
{
  return self->_clientState;
}

- (void)setClientState:(int64_t)a3
{
  self->_clientState = a3;
}

- (unint64_t)lastServerRestartTime
{
  return self->_lastServerRestartTime;
}

- (void)setLastServerRestartTime:(unint64_t)a3
{
  self->_lastServerRestartTime = a3;
}

- (mach_timebase_info)timebase
{
  return self->_timebase;
}

- (void)setTimebase:(mach_timebase_info)a3
{
  self->_timebase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverSettings, 0);
}

- (void)initWithDelegate:(uint8_t *)buf configuration:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Could not register for server restart notification: %@", buf, 0x16u);
}

- (void)initWithDelegate:(NSObject *)a3 configuration:.cold.2(void *a1, int a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 identifier];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_error_impl(&dword_22B7B4000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Error getting timebase info: %{errno}d", (uint8_t *)&v6, 0x12u);
}

void __42__SCLSchoolModeXPCClient__makeConnection___block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Connection was invalidated remotely.", (uint8_t *)&v3, 0xCu);
}

void __32__SCLSchoolModeXPCClient_resume__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22B7B4000, v0, v1, "[%{public}@] Failed to get initial settings for school mode: %@");
}

void __32__SCLSchoolModeXPCClient_resume__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22B7B4000, v0, v1, "[%{public}@] Failed to get settings for reconnecting to school mode: %@");
}

@end