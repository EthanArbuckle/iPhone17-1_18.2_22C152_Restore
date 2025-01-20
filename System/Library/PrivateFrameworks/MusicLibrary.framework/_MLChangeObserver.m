@interface _MLChangeObserver
+ (id)observerWithConnection:(id)a3;
- (BOOL)hasTimedOut;
- (MSVTaskAssertion)taskAssertion;
- (NSString)bundleID;
- (NSString)description;
- (NSXPCConnection)connection;
- (OS_dispatch_source)timeoutTimer;
- (_MLChangeObserver)init;
- (os_unfair_lock_s)lock;
- (void)dealloc;
- (void)emergencyDisconnectWithCompletion:(id)a3;
- (void)performDatabasePathChange:(id)a3 completion:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setTaskAssertion:(id)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setupTaskAssertion;
- (void)setupTimeoutTimer;
- (void)tearDownTaskAssertion;
- (void)tearDownTimeoutTimer;
- (void)terminateForFailureToPerformDatabasePathChange;
@end

@implementation _MLChangeObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setBundleID:(id)a3
{
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (BOOL)hasTimedOut
{
  return self->_timedOut;
}

- (void)setTaskAssertion:(id)a3
{
}

- (MSVTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)tearDownTimeoutTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [(_MLChangeObserver *)self timeoutTimer];

  if (v3)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - tearDownTimeoutTimer", (uint8_t *)&v6, 0xCu);
    }

    v5 = [(_MLChangeObserver *)self timeoutTimer];
    dispatch_source_cancel(v5);

    [(_MLChangeObserver *)self setTimeoutTimer:0];
  }
}

- (void)setupTimeoutTimer
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(_MLChangeObserver *)self tearDownTimeoutTimer];
  v3 = [(_MLChangeObserver *)self timeoutTimer];

  if (!v3)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - setupTimeoutTimerWithcompletion:", buf, 0xCu);
    }

    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
    [(_MLChangeObserver *)self setTimeoutTimer:v5];

    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    v7 = [(_MLChangeObserver *)self timeoutTimer];
    dispatch_source_set_timer(v7, v6, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_initWeak((id *)buf, self);
    uint64_t v8 = [(_MLChangeObserver *)self bundleID];
    v9 = [(_MLChangeObserver *)self connection];
    LOBYTE(v6) = v9 == 0;

    if (v6)
    {
      pid_t v11 = getpid();
    }
    else
    {
      v10 = [(_MLChangeObserver *)self connection];
      pid_t v11 = [v10 processIdentifier];
    }
    v12 = [(_MLChangeObserver *)self timeoutTimer];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __38___MLChangeObserver_setupTimeoutTimer__block_invoke;
    v18 = &unk_1E5FB6550;
    objc_copyWeak(&v21, (id *)buf);
    id v13 = v8;
    pid_t v22 = v11;
    id v19 = v13;
    v20 = self;
    dispatch_source_set_event_handler(v12, &v15);

    v14 = [(_MLChangeObserver *)self timeoutTimer];
    dispatch_resume(v14);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)tearDownTaskAssertion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [(_MLChangeObserver *)self taskAssertion];

  if (v3)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - tearDownTaskAssertion", (uint8_t *)&v6, 0xCu);
    }

    dispatch_source_t v5 = [(_MLChangeObserver *)self taskAssertion];
    [v5 invalidate];

    [(_MLChangeObserver *)self setTaskAssertion:0];
  }
}

- (void)setupTaskAssertion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F77A28]);
  v4 = [(_MLChangeObserver *)self connection];
  uint64_t v5 = [v4 processIdentifier];
  int v6 = [(_MLChangeObserver *)self bundleID];
  v7 = (void *)[v3 initWithName:@"Processing shared database path change" pid:v5 bundleID:v6 subsystem:@"com.apple.medialibraryd" reason:2 flags:3];
  [(_MLChangeObserver *)self setTaskAssertion:v7];

  uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [(_MLChangeObserver *)self taskAssertion];
    int v10 = 138543618;
    pid_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ - setupTaskAssertion: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (NSString)description
{
  id v3 = NSString;
  v4 = [(_MLChangeObserver *)self bundleID];
  uint64_t v5 = [(_MLChangeObserver *)self connection];
  int v6 = [v3 stringWithFormat:@"_MLChangeObserver <%p> - Observer for %@[%d]", self, v4, objc_msgSend(v5, "processIdentifier")];

  return (NSString *)v6;
}

- (NSString)bundleID
{
  id v3 = [(_MLChangeObserver *)self connection];

  if (v3)
  {
    v4 = self->_bundleID;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v4 = [v5 bundleIdentifier];
  }

  return v4;
}

- (void)setConnection:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  if (v5)
  {
    [v5 auditToken];
    MSVBundleIDForAuditToken();
    int v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleID = self->_bundleID;
    self->_bundleID = v6;
  }
  else
  {
    bundleID = self->_bundleID;
    self->_bundleID = 0;
  }
}

- (void)terminateForFailureToPerformDatabasePathChange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ - terminateForFailureToPerformDatabasePathChange", buf, 0xCu);
  }

  v4 = [(_MLChangeObserver *)self connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___MLChangeObserver_terminateForFailureToPerformDatabasePathChange__block_invoke;
  v6[3] = &unk_1E5FB6528;
  v6[4] = self;
  id v5 = [v4 remoteObjectProxyWithErrorHandler:v6];
  [v5 terminateForFailureToPerformDatabasePathChange];

  [(_MLChangeObserver *)self setConnection:0];
}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    pid_t v22 = self;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - newPath=%{public}@", buf, 0x16u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke;
  v19[3] = &unk_1E5FB7390;
  v19[4] = self;
  id v20 = v7;
  id v9 = v7;
  int v10 = (void *)MEMORY[0x1B3E93EE0](v19);
  os_unfair_lock_lock(&self->_lock);
  [(_MLChangeObserver *)self setupTaskAssertion];
  [(_MLChangeObserver *)self setupTimeoutTimer];
  os_unfair_lock_unlock(&self->_lock);
  pid_t v11 = [(_MLChangeObserver *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke_2;
  v17[3] = &unk_1E5FB6ED8;
  v17[4] = self;
  id v12 = v10;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke_4;
  v15[3] = &unk_1E5FB7390;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 performDatabasePathChange:v6 completion:v15];
}

- (void)dealloc
{
  [(_MLChangeObserver *)self tearDownTaskAssertion];
  [(_MLChangeObserver *)self tearDownTimeoutTimer];
  v3.receiver = self;
  v3.super_class = (Class)_MLChangeObserver;
  [(_MLChangeObserver *)&v3 dealloc];
}

- (_MLChangeObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MLChangeObserver;
  result = [(_MLChangeObserver *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)observerWithConnection:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_MLChangeObserver);
  [(_MLChangeObserver *)v4 setConnection:v3];

  return v4;
}

@end