@interface HDSPSleepLockScreenAssertionManager
- (BOOL)hasLockScreenConnection;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (HDSPEnvironment)environment;
- (HDSPSleepLockScreenAssertionManager)initWithEnvironment:(id)a3;
- (HDSPSleepLockScreenAssertionManagerDelegate)delegate;
- (NSXPCConnection)connection;
- (SBSLockScreenRemoteContentAssertion)lockScreenAssertion;
- (void)_withLock:(id)a3;
- (void)connect;
- (void)didDismissWithReason:(int64_t)a3;
- (void)invalidateAssertion;
- (void)sendLockScreenState:(int64_t)a3 userInfo:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)takeAssertionIfNeeded;
@end

@implementation HDSPSleepLockScreenAssertionManager

- (HDSPSleepLockScreenAssertionManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPSleepLockScreenAssertionManager;
  v5 = [(HDSPSleepLockScreenAssertionManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v6->_connectionLock._os_unfair_lock_opaque = 0;
    v7 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  p_connectionLock = &self->_connectionLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_connectionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_connectionLock);
}

- (void)takeAssertionIfNeeded
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  lockScreenAssertion = self->_lockScreenAssertion;
  id v4 = HKSPLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (lockScreenAssertion)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      id v21 = (id)objc_opt_class();
      id v6 = v21;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] lock screen assertion already taken", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      id v21 = (id)objc_opt_class();
      id v7 = v21;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] taking lock screen assertion", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_super v9 = [WeakRetained assertionManager];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 takeIndefiniteAssertionWithIdentifier:v11 type:1];

    v12 = [MEMORY[0x263F08D88] anonymousListener];
    [(NSXPCListener *)v12 setDelegate:self];
    [(NSXPCListener *)v12 resume];
    listener = self->_listener;
    self->_listener = v12;
    v14 = v12;

    id v4 = [objc_alloc(MEMORY[0x263F79450]) initWithServiceName:@"com.apple.SleepLockScreen" viewControllerClassName:@"SleepLockScreen.LockScreenViewController"];
    v15 = [(NSXPCListener *)v14 endpoint];
    v16 = [v15 _endpoint];
    [v4 setXpcEndpoint:v16];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __60__HDSPSleepLockScreenAssertionManager_takeAssertionIfNeeded__block_invoke;
    v19[3] = &unk_2645D9E40;
    v19[4] = self;
    v17 = [MEMORY[0x263F793C0] acquireRemoteContentAssertionWithDefinition:v4 errorHandler:v19];
    v18 = self->_lockScreenAssertion;
    self->_lockScreenAssertion = v17;
  }
}

void __60__HDSPSleepLockScreenAssertionManager_takeAssertionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = [v2 domain];
  if ([v3 isEqual:*MEMORY[0x263F29B98]])
  {
    uint64_t v4 = [v2 code];

    if (v4 == 5)
    {
      BOOL v5 = HKSPLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543362;
        id v8 = (id)objc_opt_class();
        id v6 = v8;
        _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidated lock screen assertion", (uint8_t *)&v7, 0xCu);
LABEL_9:

        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
  }
  BOOL v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v2;
    id v6 = v8;
    _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] error acquiring lock screen assertion: %{public}@", (uint8_t *)&v7, 0x16u);
    goto LABEL_9;
  }
LABEL_7:
}

- (void)sendLockScreenState:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_lockScreenAssertion)
  {
    id v6 = a4;
    int v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = NSStringFromHKSPSleepLockScreenState();
      int v13 = 138543618;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending state: %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = [(HDSPSleepLockScreenAssertionManager *)self connection];
    v12 = [v11 remoteObjectProxy];
    [v12 setLockScreenState:a3 userInfo:v6];
  }
}

- (void)invalidateAssertion
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  lockScreenAssertion = self->_lockScreenAssertion;
  id WeakRetained = HKSPLogForCategory();
  BOOL v5 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (lockScreenAssertion)
  {
    if (v5)
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v6 = v14;
      _os_log_impl(&dword_221A52000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidating lock screen assertion", (uint8_t *)&v13, 0xCu);
    }
    [(SBSLockScreenRemoteContentAssertion *)self->_lockScreenAssertion invalidate];
    int v7 = self->_lockScreenAssertion;
    self->_lockScreenAssertion = 0;

    [(NSXPCListener *)self->_listener invalidate];
    listener = self->_listener;
    self->_listener = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    id v9 = [WeakRetained assertionManager];
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [v9 releaseAssertionWithIdentifier:v11];
  }
  else if (v5)
  {
    int v13 = 138543362;
    id v14 = (id)objc_opt_class();
    id v12 = v14;
    _os_log_impl(&dword_221A52000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[%{public}@] lock screen assertion already invalidated", (uint8_t *)&v13, 0xCu);
  }
}

- (void)connect
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] lock screen service did connect", (uint8_t *)&v6, 0xCu);
  }
  BOOL v5 = [(HDSPSleepLockScreenAssertionManager *)self delegate];
  [v5 lockScreenDidConnect];
}

- (void)didDismissWithReason:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
    case 1:
      v3 = HKSPLogForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      _os_log_error_impl(&dword_221A52000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] lock screen service did dismiss due to error", (uint8_t *)&v6, 0xCu);
      goto LABEL_19;
    case 2:
      v3 = HKSPLogForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      BOOL v5 = "[%{public}@] lock screen service did dismiss due to dismiss button";
      break;
    case 3:
      v3 = HKSPLogForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      BOOL v5 = "[%{public}@] lock screen service did dismiss due to home gesture";
      break;
    case 4:
      v3 = HKSPLogForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      BOOL v5 = "[%{public}@] lock screen service did dismiss due to notification";
      break;
    case 5:
      v3 = HKSPLogForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      BOOL v5 = "[%{public}@] lock screen service did dismiss due to camera launch";
      break;
    case 6:
      v3 = HKSPLogForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      BOOL v5 = "[%{public}@] lock screen service did dismiss due to assertion invalidation";
      break;
    case 7:
      v3 = HKSPLogForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      BOOL v5 = "[%{public}@] lock screen service did dismiss due to lock screen dismissal";
      break;
    case 8:
      v3 = HKSPLogForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      BOOL v5 = "[%{public}@] lock screen service did dismiss due to tap";
      break;
    default:
      return;
  }
  _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 0xCu);
LABEL_19:

LABEL_20:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D42B1C0];
  [v7 setRemoteObjectInterface:v8];
  id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D418C28];
  [v7 setExportedInterface:v9];
  [v7 setExportedObject:self];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__HDSPSleepLockScreenAssertionManager_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_2645D90C0;
  v18[4] = self;
  [v7 setInterruptionHandler:v18];
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  int v13 = __74__HDSPSleepLockScreenAssertionManager_listener_shouldAcceptNewConnection___block_invoke_295;
  id v14 = &unk_2645D9E68;
  uint64_t v15 = self;
  objc_copyWeak(&v16, &location);
  [v7 setInvalidationHandler:&v11];
  objc_msgSend(v7, "resume", v11, v12, v13, v14, v15);
  [(HDSPSleepLockScreenAssertionManager *)self setConnection:v7];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return 1;
}

void __74__HDSPSleepLockScreenAssertionManager_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = HKSPLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 138543362;
    id v3 = (id)objc_opt_class();
    id v1 = v3;
    _os_log_impl(&dword_221A52000, v0, OS_LOG_TYPE_DEFAULT, "[%{public}@] interruption handler", (uint8_t *)&v2, 0xCu);
  }
}

void __74__HDSPSleepLockScreenAssertionManager_listener_shouldAcceptNewConnection___block_invoke_295(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v3 = v6;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidation handler", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setConnection:0];
}

- (void)setConnection:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__HDSPSleepLockScreenAssertionManager_setConnection___block_invoke;
  v6[3] = &unk_2645D9288;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HDSPSleepLockScreenAssertionManager *)self _withLock:v6];
}

void __53__HDSPSleepLockScreenAssertionManager_setConnection___block_invoke(uint64_t a1)
{
}

- (NSXPCConnection)connection
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  id v9 = __Block_byref_object_dispose__6;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepLockScreenAssertionManager_connection__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepLockScreenAssertionManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSXPCConnection *)v2;
}

void __49__HDSPSleepLockScreenAssertionManager_connection__block_invoke(uint64_t a1)
{
}

- (BOOL)hasLockScreenConnection
{
  id v2 = [(HDSPSleepLockScreenAssertionManager *)self connection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPSleepLockScreenAssertionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPSleepLockScreenAssertionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBSLockScreenRemoteContentAssertion)lockScreenAssertion
{
  return self->_lockScreenAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end