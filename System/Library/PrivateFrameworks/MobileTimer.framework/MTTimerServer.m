@interface MTTimerServer
- (BOOL)_isSystemReady;
- (BOOL)isSystemReady;
- (MTTimerServer)initWithStorage:(id)a3;
- (MTTimerServer)initWithStorage:(id)a3 connectionListenerProvider:(id)a4;
- (MTTimerStorage)storage;
- (MTXPCConnectionListenerProvider)connectionListenerProvider;
- (NAScheduler)serializer;
- (id)_systemNotReadyError;
- (id)gatherDiagnostics;
- (void)addFavoriteDuration:(id)a3 withCompletion:(id)a4;
- (void)addRecentDuration:(id)a3 withCompletion:(id)a4;
- (void)addTimer:(id)a3 withCompletion:(id)a4;
- (void)dismissTimerWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)favoriteTimerDurationsDidUpdate:(id)a3;
- (void)getTimerDurationsWithCompletion:(id)a3;
- (void)getTimersWithCompletion:(id)a3;
- (void)handleSystemReady;
- (void)latestTimerDurationDidUpdate:(id)a3;
- (void)nextTimerDidChange:(id)a3;
- (void)printDiagnostics;
- (void)recentTimerDurationsDidUpdate:(id)a3;
- (void)removeFavoriteDuration:(id)a3 withCompletion:(id)a4;
- (void)removeRecentDuration:(id)a3 withCompletion:(id)a4;
- (void)removeTimer:(id)a3 withCompletion:(id)a4;
- (void)repeatTimerWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)saveLatestDuration:(id)a3 withCompletion:(id)a4;
- (void)setSerializer:(id)a3;
- (void)source:(id)a3 didAddTimers:(id)a4;
- (void)source:(id)a3 didDismissTimer:(id)a4;
- (void)source:(id)a3 didFireTimer:(id)a4;
- (void)source:(id)a3 didRemoveTimers:(id)a4;
- (void)source:(id)a3 didUpdateTimers:(id)a4;
- (void)startListening;
- (void)stopListening;
- (void)updateTimer:(id)a3 withCompletion:(id)a4;
@end

@implementation MTTimerServer

intptr_t __31__MTTimerServer__isSystemReady__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)getTimersWithCompletion:(id)a3
{
  id v7 = a3;
  if ([(MTTimerServer *)self _isSystemReady])
  {
    id v4 = [(MTTimerServer *)self storage];
    [v4 getTimersWithCompletion:v7];
  }
  else
  {
    v5 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v6 = [(MTTimerServer *)self _systemNotReadyError];
    (*((void (**)(id, id, void, void *))v7 + 2))(v7, v4, 0, v6);
  }
  v5 = v7;
LABEL_6:
}

- (void)getTimerDurationsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, id, id, id, void, void *))a3;
  v5 = MTLogForCategory(9);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ - getTimerDurationsWithCompletion", (uint8_t *)&v10, 0xCu);
  }

  if ([(MTTimerServer *)self _isSystemReady])
  {
    id v6 = [(MTTimerServer *)self storage];
    [v6 getDurationsWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v9 = [(MTTimerServer *)self _systemNotReadyError];
    v4[2](v4, v6, v7, v8, 0, v9);

    goto LABEL_7;
  }
LABEL_8:
}

- (MTTimerStorage)storage
{
  return self->_storage;
}

- (BOOL)_isSystemReady
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(MTTimerServer *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__MTTimerServer__isSystemReady__block_invoke;
  v7[3] = &unk_1E59150F8;
  v9 = &v10;
  v7[4] = self;
  v5 = v3;
  id v8 = v5;
  [v4 performBlock:v7];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (MTTimerServer)initWithStorage:(id)a3
{
  id v4 = a3;
  v5 = MTTimerClientInterface();
  id v6 = MTTimerServerInterface();
  id v7 = +[MTXPCConnectionInfo infoForMachServiceName:@"com.apple.MobileTimer.timerserver" remoteObjectInterface:v5 exportedObject:self exportedObjectInterface:v6 lifecycleNotification:@"com.apple.MTTimerServer.wakeup" requiredEntitlement:@"com.apple.private.mobiletimerd" options:0];

  id v8 = +[MTXPCConnectionListenerProvider providerWithConnectionInfo:v7 errorHandler:0];
  v9 = [(MTTimerServer *)self initWithStorage:v4 connectionListenerProvider:v8];

  return v9;
}

- (MTTimerServer)initWithStorage:(id)a3 connectionListenerProvider:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTTimerServer;
  v9 = [(MTTimerServer *)&v14 init];
  if (v9)
  {
    uint64_t v10 = MTLogForCategory(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_storage, a3);
    [v7 registerObserver:v9];
    [v7 setDurationUpdateDelegate:v9];
    uint64_t v11 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTTimerServer.ready-queue", +[MTScheduler defaultPriority]);
    serializer = v9->_serializer;
    v9->_serializer = (NAScheduler *)v11;

    objc_storeStrong((id *)&v9->_connectionListenerProvider, a4);
  }

  return v9;
}

- (void)startListening
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Starting %{public}@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(MTTimerServer *)self connectionListenerProvider];
  [v4 startListening];
}

- (void)stopListening
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Stopping %{public}@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(MTTimerServer *)self connectionListenerProvider];
  [v4 stopListening];
}

- (void)handleSystemReady
{
  dispatch_semaphore_t v3 = [(MTTimerServer *)self serializer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__MTTimerServer_handleSystemReady__block_invoke;
  v4[3] = &unk_1E59150A8;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __34__MTTimerServer_handleSystemReady__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "System is ready: %{public}@.  Will post MTTimerServerReadyNotification.", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 postNotificationName:@"com.apple.MTTimerServer.ready" object:0 userInfo:0 deliverImmediately:1];
}

- (id)_systemNotReadyError
{
  v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[MTSessionServer _systemNotReadyError](v2);
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.mobiletimerd.MTTimerServer" code:1 userInfo:0];
  return v3;
}

- (void)addTimer:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if ([(MTTimerServer *)self _isSystemReady])
  {
    id v8 = MTLogForCategory(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Adding Timer", v12, 2u);
    }

    v9 = [(MTTimerServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 addTimer:v6 withCompletion:v7 source:v10];
  }
  else if (v7)
  {
    uint64_t v11 = [(MTTimerServer *)self _systemNotReadyError];
    v7[2](v7, v11);
  }
}

- (void)updateTimer:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if ([(MTTimerServer *)self _isSystemReady])
  {
    id v8 = MTLogForCategory(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Updating Timer", v12, 2u);
    }

    v9 = [(MTTimerServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 updateTimer:v6 withCompletion:v7 source:v10];
  }
  else if (v7)
  {
    uint64_t v11 = [(MTTimerServer *)self _systemNotReadyError];
    v7[2](v7, v11);
  }
}

- (void)removeTimer:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if ([(MTTimerServer *)self _isSystemReady])
  {
    id v8 = MTLogForCategory(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Removing Timer", v12, 2u);
    }

    v9 = [(MTTimerServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 removeTimer:v6 withCompletion:v7 source:v10];
  }
  else if (v7)
  {
    uint64_t v11 = [(MTTimerServer *)self _systemNotReadyError];
    v7[2](v7, v11);
  }
}

- (void)dismissTimerWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MTTimerServer *)self _isSystemReady])
  {
    kdebug_trace();
    id v8 = MTLogForCategory(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Dismissing Timer", buf, 2u);
    }

    v9 = [(MTTimerServer *)self storage];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__MTTimerServer_dismissTimerWithIdentifier_withCompletion___block_invoke;
    v12[3] = &unk_1E5914D18;
    id v13 = v7;
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 dismissTimerWithIdentifier:v6 withCompletion:v12 source:v10];
  }
  else if (v7)
  {
    uint64_t v11 = [(MTTimerServer *)self _systemNotReadyError];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __59__MTTimerServer_dismissTimerWithIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  kdebug_trace();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)repeatTimerWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MTTimerServer *)self _isSystemReady])
  {
    kdebug_trace();
    id v8 = MTLogForCategory(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Repeating Timer", buf, 2u);
    }

    v9 = [(MTTimerServer *)self storage];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__MTTimerServer_repeatTimerWithIdentifier_withCompletion___block_invoke;
    v12[3] = &unk_1E5914D18;
    id v13 = v7;
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 repeatTimerWithIdentifier:v6 withCompletion:v12 source:v10];
  }
  else if (v7)
  {
    uint64_t v11 = [(MTTimerServer *)self _systemNotReadyError];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __58__MTTimerServer_repeatTimerWithIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  kdebug_trace();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)addRecentDuration:(id)a3 withCompletion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(9);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    uint64_t v12 = self;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ - addRecentDuration", (uint8_t *)&v11, 0xCu);
  }

  if ([(MTTimerServer *)self _isSystemReady])
  {
    v9 = [(MTTimerServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 addRecentDuration:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    v9 = [(MTTimerServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)removeRecentDuration:(id)a3 withCompletion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(9);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    uint64_t v12 = self;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ - removeRecentDuration", (uint8_t *)&v11, 0xCu);
  }

  if ([(MTTimerServer *)self _isSystemReady])
  {
    v9 = [(MTTimerServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 removeRecentDuration:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    v9 = [(MTTimerServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)addFavoriteDuration:(id)a3 withCompletion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(9);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    uint64_t v12 = self;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ - addFavoriteDuration", (uint8_t *)&v11, 0xCu);
  }

  if ([(MTTimerServer *)self _isSystemReady])
  {
    v9 = [(MTTimerServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 addFavoriteDuration:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    v9 = [(MTTimerServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)removeFavoriteDuration:(id)a3 withCompletion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(9);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    uint64_t v12 = self;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ - removeFavoriteDuration", (uint8_t *)&v11, 0xCu);
  }

  if ([(MTTimerServer *)self _isSystemReady])
  {
    v9 = [(MTTimerServer *)self storage];
    uint64_t v10 = [(MTXPCConnectionListenerProvider *)self->_connectionListenerProvider currentClient];
    [v9 removeFavoriteDuration:v6 withCompletion:v7 source:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    v9 = [(MTTimerServer *)self _systemNotReadyError];
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)saveLatestDuration:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = MTLogForCategory(9);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    int v11 = self;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ - saveLatestDuration", (uint8_t *)&v10, 0xCu);
  }

  if ([(MTTimerServer *)self _isSystemReady])
  {
    [(MTTimerServer *)self saveLatestDuration:v6 withCompletion:v7];
  }
  else if (v7)
  {
    v9 = [(MTTimerServer *)self _systemNotReadyError];
    v7[2](v7, v9);
  }
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTTimerServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__MTTimerServer_source_didAddTimers___block_invoke;
  v10[3] = &unk_1E5918340;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __37__MTTimerServer_source_didAddTimers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 timersAdded:*(void *)(a1 + 32)];
}

- (void)source:(id)a3 didUpdateTimers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTTimerServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__MTTimerServer_source_didUpdateTimers___block_invoke;
  v10[3] = &unk_1E5918340;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __40__MTTimerServer_source_didUpdateTimers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 timersUpdated:*(void *)(a1 + 32)];
}

- (void)source:(id)a3 didRemoveTimers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTTimerServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__MTTimerServer_source_didRemoveTimers___block_invoke;
  v10[3] = &unk_1E5918340;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __40__MTTimerServer_source_didRemoveTimers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 timersRemoved:*(void *)(a1 + 32)];
}

- (void)source:(id)a3 didFireTimer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTTimerServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__MTTimerServer_source_didFireTimer___block_invoke;
  v10[3] = &unk_1E5918340;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __37__MTTimerServer_source_didFireTimer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 timerFired:*(void *)(a1 + 32)];
}

- (void)source:(id)a3 didDismissTimer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTTimerServer *)self connectionListenerProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__MTTimerServer_source_didDismissTimer___block_invoke;
  v10[3] = &unk_1E5918340;
  id v11 = v6;
  id v9 = v6;
  [v8 performBlockOnAllClients:v10 excludingClient:v7];
}

uint64_t __40__MTTimerServer_source_didDismissTimer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 timerDismissed:*(void *)(a1 + 32)];
}

- (void)nextTimerDidChange:(id)a3
{
  id v4 = a3;
  int v5 = [(MTTimerServer *)self connectionListenerProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__MTTimerServer_nextTimerDidChange___block_invoke;
  v7[3] = &unk_1E5918340;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockOnAllClients:v7];
}

uint64_t __36__MTTimerServer_nextTimerDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 nextTimerChanged:*(void *)(a1 + 32)];
}

- (void)printDiagnostics
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----MTTimerServer-----", (uint8_t *)&v9, 2u);
  }

  id v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MTTimerServer _isSystemReady](self, "_isSystemReady"));
    int v9 = 138412290;
    int v10 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "System Ready: %@", (uint8_t *)&v9, 0xCu);
  }
  id v6 = MTLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MTTimerServer *)self connectionListenerProvider];
    id v8 = [v7 connectedClients];
    int v9 = 138543362;
    int v10 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "Clients: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (id)gatherDiagnostics
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"Timer system ready";
  if ([(MTTimerServer *)self _isSystemReady]) {
    uint64_t v3 = @"YES";
  }
  else {
    uint64_t v3 = @"NO";
  }
  v10[1] = @"Timer clients";
  v11[0] = v3;
  id v4 = [(MTTimerServer *)self connectionListenerProvider];
  int v5 = [v4 connectedClients];
  id v6 = [v5 valueForKey:@"processName"];
  id v7 = [v6 componentsJoinedByString:@", "];
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (void)favoriteTimerDurationsDidUpdate:(id)a3
{
  id v4 = a3;
  int v5 = [(MTTimerServer *)self connectionListenerProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MTTimerServer_favoriteTimerDurationsDidUpdate___block_invoke;
  v7[3] = &unk_1E5918340;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockOnAllClients:v7 excludingClient:0];
}

void __49__MTTimerServer_favoriteTimerDurationsDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 favoriteTimerDurationsUpdated:*(void *)(a1 + 32)];
  }
}

- (void)latestTimerDurationDidUpdate:(id)a3
{
  id v4 = a3;
  int v5 = [(MTTimerServer *)self connectionListenerProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MTTimerServer_latestTimerDurationDidUpdate___block_invoke;
  v7[3] = &unk_1E5918340;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockOnAllClients:v7 excludingClient:0];
}

void __46__MTTimerServer_latestTimerDurationDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 latestTimerDurationUpdated:*(void *)(a1 + 32)];
  }
}

- (void)recentTimerDurationsDidUpdate:(id)a3
{
  id v4 = a3;
  int v5 = [(MTTimerServer *)self connectionListenerProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__MTTimerServer_recentTimerDurationsDidUpdate___block_invoke;
  v7[3] = &unk_1E5918340;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockOnAllClients:v7 excludingClient:0];
}

void __47__MTTimerServer_recentTimerDurationsDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 recentTimerDurationsUpdated:*(void *)(a1 + 32)];
  }
}

- (MTXPCConnectionListenerProvider)connectionListenerProvider
{
  return self->_connectionListenerProvider;
}

- (BOOL)isSystemReady
{
  return self->_systemReady;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_connectionListenerProvider, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end