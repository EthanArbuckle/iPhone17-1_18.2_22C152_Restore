@interface MTSessionServer
- (BOOL)_isSystemReady;
- (BOOL)isSystemReady;
- (MTSessionServer)initWithCoordinator:(id)a3;
- (MTSessionsCoordinator)coordinator;
- (MTXPCConnectionListenerProvider)connectionListenerProvider;
- (NAScheduler)serializer;
- (id)_systemNotReadyError;
- (id)gatherDiagnostics;
- (void)_systemNotReadyError;
- (void)endAlertingSession;
- (void)handleSystemReady;
- (void)printDiagnostics;
- (void)setSerializer:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation MTSessionServer

- (void)endAlertingSession
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ending alerting session", (uint8_t *)&v4, 0xCu);
  }

  [(MTSessionsCoordinator *)self->_coordinator endAlertingSession];
}

- (MTSessionServer)initWithCoordinator:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTSessionServer;
  uint64_t v6 = [(MTSessionServer *)&v17 init];
  if (v6)
  {
    v7 = MTLogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    v8 = MTSessionClientInterface();
    v9 = MTSessionServerInterface();
    v10 = +[MTXPCConnectionInfo infoForMachServiceName:@"com.apple.MobileTimer.sessionserver" remoteObjectInterface:v8 exportedObject:v6 exportedObjectInterface:v9 lifecycleNotification:@"com.apple.MTSessionServer.wakeup" requiredEntitlement:@"com.apple.private.mobiletimerd" options:0];

    uint64_t v11 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTSessionServer.ready-queue", +[MTScheduler defaultPriority]);
    serializer = v6->_serializer;
    v6->_serializer = (NAScheduler *)v11;

    v13 = +[MTXPCConnectionListenerProvider providerWithConnectionInfo:v10 errorHandler:0];
    connectionListenerProvider = v6->_connectionListenerProvider;
    v6->_connectionListenerProvider = v13;
    v15 = v13;

    objc_storeStrong((id *)&v6->_coordinator, a3);
  }

  return v6;
}

- (void)startListening
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Starting %{public}@", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [(MTSessionServer *)self connectionListenerProvider];
  [v4 startListening];
}

- (void)stopListening
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Stopping %{public}@", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [(MTSessionServer *)self connectionListenerProvider];
  [v4 stopListening];
}

- (void)handleSystemReady
{
  v3 = [(MTSessionServer *)self serializer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__MTSessionServer_handleSystemReady__block_invoke;
  v4[3] = &unk_1E59150A8;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __36__MTSessionServer_handleSystemReady__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "System is ready: %{public}@.  Will post MTSessionServerReadyNotification.", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  int v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 postNotificationName:@"com.apple.MTSessionServer.ready" object:0 userInfo:0 deliverImmediately:1];
}

- (id)_systemNotReadyError
{
  v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[MTSessionServer _systemNotReadyError](v2);
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.mobiletimerd.MTSessionServer" code:1 userInfo:0];
  return v3;
}

- (BOOL)_isSystemReady
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  int v4 = [(MTSessionServer *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__MTSessionServer__isSystemReady__block_invoke;
  v7[3] = &unk_1E59150F8;
  v9 = &v10;
  v7[4] = self;
  int v5 = v3;
  v8 = v5;
  [v4 performBlock:v7];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

intptr_t __33__MTSessionServer__isSystemReady__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)printDiagnostics
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----MTSessionServer-----", (uint8_t *)&v9, 2u);
  }

  int v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MTSessionServer _isSystemReady](self, "_isSystemReady"));
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "System Ready: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = MTLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(MTSessionServer *)self connectionListenerProvider];
    v8 = [v7 connectedClients];
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "Clients: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (id)gatherDiagnostics
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"Session system ready";
  if ([(MTSessionServer *)self _isSystemReady]) {
    dispatch_semaphore_t v3 = @"YES";
  }
  else {
    dispatch_semaphore_t v3 = @"NO";
  }
  v10[1] = @"Session clients";
  v11[0] = v3;
  int v4 = [(MTSessionServer *)self connectionListenerProvider];
  int v5 = [v4 connectedClients];
  uint64_t v6 = [v5 valueForKey:@"processName"];
  uint64_t v7 = [v6 componentsJoinedByString:@", "];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (MTXPCConnectionListenerProvider)connectionListenerProvider
{
  return self->_connectionListenerProvider;
}

- (BOOL)isSystemReady
{
  return self->_systemReady;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (MTSessionsCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_connectionListenerProvider, 0);
}

- (void)_systemNotReadyError
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "System isn't ready...", v1, 2u);
}

@end