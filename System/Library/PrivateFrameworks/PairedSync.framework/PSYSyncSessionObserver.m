@interface PSYSyncSessionObserver
- (PSYSyncSessionObserver)init;
- (PSYSyncSessionObserverDelegate)delegate;
- (id)providerWithErrorHandler:(id)a3;
- (void)_checkin:(BOOL)a3;
- (void)_connectionInvalidated;
- (void)_disconnectFromPairedSync;
- (void)_handleDaemonStarted;
- (void)_queue_invalidateSyncSession:(id)a3;
- (void)_queue_loadConnectionIfNeeded;
- (void)_reconnectToPairedSync;
- (void)dealloc;
- (void)didBecomeActive:(id)a3;
- (void)invalidateSyncSession:(id)a3;
- (void)setCurrentSyncSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObservingSyncSessionsWithCompletion:(id)a3;
- (void)syncSessionWillStart:(id)a3;
- (void)updateSyncSession:(id)a3;
- (void)willResignActive:(id)a3;
@end

@implementation PSYSyncSessionObserver

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);

  objc_storeStrong((id *)&self->_currentSyncSession, 0);
}

- (void)didBecomeActive:(id)a3
{
  v4 = psy_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = psy_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2179FA000, v6, OS_LOG_TYPE_DEFAULT, "PairedSync Client: Did become active! Possibly reconnecting to pairedsync...", buf, 2u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__PSYSyncSessionObserver_didBecomeActive___block_invoke;
  block[3] = &unk_2642B3DB8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  int daemonDidLaunchNotifyToken = self->_daemonDidLaunchNotifyToken;
  if (daemonDidLaunchNotifyToken != -1) {
    notify_cancel(daemonDidLaunchNotifyToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)PSYSyncSessionObserver;
  [(PSYSyncSessionObserver *)&v5 dealloc];
}

- (PSYSyncSessionObserver)init
{
  v19.receiver = self;
  v19.super_class = (Class)PSYSyncSessionObserver;
  v2 = [(PSYSyncSessionObserver *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.pairedsync.syncsessionobserver", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v2);
    v6 = (const char *)[@"com.apple.pairedsyncd.launched" UTF8String];
    v7 = v2->_queue;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __30__PSYSyncSessionObserver_init__block_invoke;
    v16 = &unk_2642B3D90;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch(v6, &v2->_daemonDidLaunchNotifyToken, v7, &v13);
    v8 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v13, v14, v15, v16);
    [v8 addObserver:v2 selector:sel_willResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel_willResignActive_ name:*MEMORY[0x263F07FD8] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel_didBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel_didBecomeActive_ name:*MEMORY[0x263F07FC0] object:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)startObservingSyncSessionsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = psy_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = psy_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x21D452D80](v4);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v8;
      _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, "PairedSync Client: Starting to observe sync session, completion=%p", buf, 0xCu);
    }
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke;
  v11[3] = &unk_2642B4070;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(queue, v11);
}

void __55__PSYSyncSessionObserver__queue_loadConnectionIfNeeded__block_invoke(uint64_t a1)
{
  v2 = psy_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = psy_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_2179FA000, v4, OS_LOG_TYPE_DEFAULT, "PSYSyncSessionObserver connection invalidated", v6, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)_connectionInvalidated
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PSYSyncSessionObserver__connectionInvalidated__block_invoke;
  block[3] = &unk_2642B3DB8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__PSYSyncSessionObserver__connectionInvalidated__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    v2 = psy_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = psy_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2179FA000, v4, OS_LOG_TYPE_DEFAULT, "PSYSyncSessionObserver clearing invalidated connection", buf, 2u);
      }
    }
    objc_super v5 = *(void **)(a1 + 32);
    if (v5[1])
    {
      objc_msgSend(v5, "_queue_invalidateSyncSession:");
      objc_super v5 = *(void **)(a1 + 32);
    }
    BOOL v6 = (void *)v5[4];
    v5[4] = 0;

    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = 0;

    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = 0;

    uint64_t v11 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v11 + 40))
    {
      *(unsigned char *)(v11 + 40) = 0;
      id v12 = psy_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        uint64_t v14 = psy_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl(&dword_2179FA000, v14, OS_LOG_TYPE_DEFAULT, "PSYSyncSessionObserver - checking in following invalidation handler", v15, 2u);
        }
      }
      [*(id *)(a1 + 32) _checkin:0];
    }
  }
}

- (void)_checkin:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__PSYSyncSessionObserver__checkin___block_invoke;
  v4[3] = &unk_2642B4210;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke_2;
  v8[3] = &unk_2642B4178;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v4 = [v2 providerWithErrorHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke_3;
  v6[3] = &unk_2642B41A0;
  BOOL v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 requestActiveSyncSessionWithCompletion:v6];
}

void __35__PSYSyncSessionObserver__checkin___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__PSYSyncSessionObserver__checkin___block_invoke_2;
  v3[3] = &unk_2642B41C8;
  char v4 = *(unsigned char *)(a1 + 40);
  v3[4] = v1;
  v2 = [v1 providerWithErrorHandler:v3];
  [v2 checkin:&__block_literal_global_2];
}

- (id)providerWithErrorHandler:(id)a3
{
  id v4 = a3;
  [(PSYSyncSessionObserver *)self _queue_loadConnectionIfNeeded];
  BOOL v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:v4];

  return v5;
}

- (void)_queue_loadConnectionIfNeeded
{
  if (!self->_connection)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.pairedsyncd.progress" options:4096];
    connection = self->_connection;
    self->_connection = v3;

    BOOL v5 = objc_alloc_init(PSYSyncSessionObserverExportedObject);
    exportedObject = self->_exportedObject;
    self->_exportedObject = v5;

    [(PSYSyncSessionObserverExportedObject *)self->_exportedObject setDelegate:self];
    [(NSXPCConnection *)self->_connection setExportedObject:self->_exportedObject];
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7FEB60]);
    id v7 = self->_connection;
    v8 = PSYSyncSessionProviderXPCInterface();
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    id v9 = self->_connection;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __55__PSYSyncSessionObserver__queue_loadConnectionIfNeeded__block_invoke;
    BOOL v13 = &unk_2642B3F20;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:&v10];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    id v4 = (void *)v3[1];
    v3[1] = 0;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [v3 setCurrentSyncSession:0];
  }
}

void __35__PSYSyncSessionObserver__checkin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = [v3 domain];
    if ([v5 isEqual:*MEMORY[0x263F07F70]])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 4099)
      {
        id v7 = psy_log();
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

        if (v8)
        {
          id v9 = psy_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            __35__PSYSyncSessionObserver__checkin___block_invoke_2_cold_1(v9);
          }
        }
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(NSObject **)(v10 + 24);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __35__PSYSyncSessionObserver__checkin___block_invoke_17;
        block[3] = &unk_2642B3DB8;
        block[4] = v10;
        dispatch_async(v11, block);
      }
    }
    else
    {
    }
  }
}

void __42__PSYSyncSessionObserver_didBecomeActive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));

    if (WeakRetained)
    {
      id v4 = *(void **)(a1 + 32);
      [v4 _reconnectToPairedSync];
    }
  }
}

void __30__PSYSyncSessionObserver_init__block_invoke(uint64_t a1)
{
  v2 = psy_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = psy_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2179FA000, v4, OS_LOG_TYPE_DEFAULT, "PSYSyncSessionObserver _daemonStarted", v6, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDaemonStarted];
}

- (void)willResignActive:(id)a3
{
  id v4 = psy_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v6 = psy_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2179FA000, v6, OS_LOG_TYPE_DEFAULT, "PairedSync Client: Will resign active! Invalidating progress connection.", buf, 2u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PSYSyncSessionObserver_willResignActive___block_invoke;
  block[3] = &unk_2642B3DB8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __43__PSYSyncSessionObserver_willResignActive___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  return [*(id *)(a1 + 32) _disconnectFromPairedSync];
}

- (void)_disconnectFromPairedSync
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)_reconnectToPairedSync
{
}

- (void)setCurrentSyncSession:(id)a3
{
  id v4 = (PSYSyncSession *)a3;
  currentSyncSession = self->_currentSyncSession;
  if (currentSyncSession != v4)
  {
    id v9 = v4;
    if (![(PSYSyncSession *)currentSyncSession isEqual:v4])
    {
      uint64_t v6 = self->_currentSyncSession;
      if (!v9)
      {
        [(PSYSyncSessionObserver *)self invalidateSyncSession:v6];
        id v7 = self;
        BOOL v8 = 0;
        goto LABEL_7;
      }
      id v7 = self;
      if (v6)
      {
        BOOL v8 = v9;
LABEL_7:
        [(PSYSyncSessionObserver *)v7 updateSyncSession:v8];
        goto LABEL_9;
      }
      [(PSYSyncSessionObserver *)self syncSessionWillStart:v9];
    }
  }
LABEL_9:

  MEMORY[0x270F9A758]();
}

void __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = psy_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    BOOL v13 = psy_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_2179FA000, v13, OS_LOG_TYPE_DEFAULT, "Started observing sync session: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v14 = [*(id *)(a1 + 32) delegate];
  [v8 setSupportsMigrationSync:objc_opt_respondsToSelector() & 1];

  uint64_t v15 = *(id **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    objc_storeStrong(v15 + 1, a2);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [v15 setCurrentSyncSession:v8];
  }
}

- (void)_handleDaemonStarted
{
}

uint64_t __35__PSYSyncSessionObserver__checkin___block_invoke_17(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = 1;
  return result;
}

- (void)_queue_invalidateSyncSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PSYSyncSessionObserver *)self delegate];
  [v5 syncSessionObserver:self didInvalidateSyncSession:v4];

  uint64_t v6 = [v4 sessionIdentifier];

  id v7 = [(PSYSyncSession *)self->_currentSyncSession sessionIdentifier];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    currentSyncSession = self->_currentSyncSession;
    self->_currentSyncSession = 0;
  }
}

- (void)syncSessionWillStart:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__PSYSyncSessionObserver_syncSessionWillStart___block_invoke;
  v7[3] = &unk_2642B3DE0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__PSYSyncSessionObserver_syncSessionWillStart___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 40) delegate];
  [*(id *)(a1 + 32) setSupportsMigrationSync:objc_opt_respondsToSelector() & 1];

  BOOL v3 = *(void **)(*(void *)(a1 + 40) + 8);
  if (v3 != *(void **)(a1 + 32) && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), *(id *)(a1 + 32));
    id v4 = [*(id *)(a1 + 40) delegate];
    [v4 syncSessionObserver:*(void *)(a1 + 40) receivedSyncSession:*(void *)(a1 + 32)];

    BOOL v5 = psy_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = psy_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = 138543362;
        uint64_t v10 = v8;
        _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, "syncSessionWillStart: %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)updateSyncSession:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__PSYSyncSessionObserver_updateSyncSession___block_invoke;
  v7[3] = &unk_2642B3DE0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__PSYSyncSessionObserver_updateSyncSession___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) delegate];
  [*(id *)(a1 + 32) setSupportsMigrationSync:objc_opt_respondsToSelector() & 1];

  BOOL v3 = *(void **)(*(void *)(a1 + 40) + 8);
  if (v3 != *(void **)(a1 + 32) && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) sessionIdentifier];
    BOOL v5 = [*(id *)(*(void *)(a1 + 40) + 8) sessionIdentifier];
    int v6 = [v4 isEqual:v5];

    if (v6)
    {
      id v8 = [[PSYSyncSessionUpdate alloc] initWithOriginalSession:*(void *)(*(void *)(a1 + 40) + 8) updatedSession:*(void *)(a1 + 32)];
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), *(id *)(a1 + 32));
      id v7 = [*(id *)(a1 + 40) delegate];
      [v7 syncSessionObserver:*(void *)(a1 + 40) didReceiveUpdate:v8];
    }
  }
}

- (void)invalidateSyncSession:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__PSYSyncSessionObserver_invalidateSyncSession___block_invoke;
  v7[3] = &unk_2642B3DE0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __48__PSYSyncSessionObserver_invalidateSyncSession___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) delegate];
  [*(id *)(a1 + 32) setSupportsMigrationSync:objc_opt_respondsToSelector() & 1];

  BOOL v3 = *(void **)(a1 + 40);
  id v4 = (void *)v3[1];
  if (v4)
  {
    v3[1] = 0;

    BOOL v3 = *(void **)(a1 + 40);
  }
  uint64_t v5 = *(void *)(a1 + 32);

  return objc_msgSend(v3, "_queue_invalidateSyncSession:", v5);
}

- (PSYSyncSessionObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSYSyncSessionObserverDelegate *)WeakRetained;
}

void __35__PSYSyncSessionObserver__checkin___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2179FA000, log, OS_LOG_TYPE_ERROR, "PSYSyncSessionObserver - retrying checkin because the original connection was invalidated", v1, 2u);
}

@end