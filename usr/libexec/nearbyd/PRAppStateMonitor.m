@interface PRAppStateMonitor
- (BOOL)isDaemon;
- (BOOL)isRunningBoardApp;
- (BOOL)isUIBackgroundModeEnabled;
- (BOOL)isXPCService;
- (NSArray)printableState;
- (NSString)launchdJobLabel;
- (NSString)monitoredProcessName;
- (PRAppStateMonitor)initWithPID:(int)a3;
- (id).cxx_construct;
- (int)currentAppState;
- (int)monitoredPID;
- (void)_process:(id)a3 didTerminate:(id)a4;
- (void)_process:(id)a3 didUpdateState:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
@end

@implementation PRAppStateMonitor

- (PRAppStateMonitor)initWithPID:(int)a3
{
  v41.receiver = self;
  v41.super_class = (Class)PRAppStateMonitor;
  v4 = [(PRAppStateMonitor *)&v41 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    observers = v4->_observers;
    v4->_observers = (NSMutableSet *)v5;

    processNameInternal = v4->_processNameInternal;
    v4->_processNameInternal = 0;

    launchdJobLabelInternal = v4->_launchdJobLabelInternal;
    v4->_launchdJobLabelInternal = 0;

    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_monitoredPID = a3;
    objc_initWeak(&location, v4);
    v9 = +[RBSProcessIdentifier identifierWithPid:v4->_monitoredPID];
    id v39 = 0;
    uint64_t v10 = +[RBSProcessHandle handleForIdentifier:v9 error:&v39];
    id v11 = v39;
    processHandle = v4->_processHandle;
    v4->_processHandle = (RBSProcessHandle *)v10;

    if (v11)
    {
      v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041BCE0((uint64_t)v11, v13);
      }
    }
    uint64_t v14 = [(RBSProcessHandle *)v4->_processHandle name];
    v15 = v4->_processNameInternal;
    v4->_processNameInternal = (NSString *)v14;

    uint64_t v16 = [(RBSProcessHandle *)v4->_processHandle daemonJobLabel];
    v17 = v4->_launchdJobLabelInternal;
    v4->_launchdJobLabelInternal = (NSString *)v16;

    v4->_isDaemonInternal = [(RBSProcessHandle *)v4->_processHandle isDaemon];
    v4->_isRunningBoardAppInternal = [(RBSProcessHandle *)v4->_processHandle isApplication];
    v4->_isXPCServiceInternal = [(RBSProcessHandle *)v4->_processHandle isXPCService];
    v18 = [(RBSProcessHandle *)v4->_processHandle bundle];
    v19 = [v18 bundleInfoValueForKey:@"UIBackgroundModes"];
    v4->_isUIBackgroundModeEnabledInternal = [v19 containsObject:@"nearby-interaction"];

    v20 = [(RBSProcessHandle *)v4->_processHandle bundle];
    uint64_t v21 = [v20 identifier];
    bundleIdentifierInternal = v4->_bundleIdentifierInternal;
    v4->_bundleIdentifierInternal = (NSString *)v21;

    v4->_timeOfLatestAppState = sub_100006C38();
    long long v37 = 0u;
    long long v38 = 0u;
    v23 = v4->_processHandle;
    if (v23) {
      [(RBSProcessHandle *)v23 auditToken];
    }
    v24 = (void *)xpc_copy_code_signing_identity_for_token();
    if (v24)
    {
      uint64_t v25 = +[NSString stringWithUTF8String:v24];
      signingIdentityInternal = v4->_signingIdentityInternal;
      v4->_signingIdentityInternal = (NSString *)v25;

      free(v24);
    }
    v27 = v4->_processHandle;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1001DCA14;
    v35[3] = &unk_1008586E0;
    objc_copyWeak(&v36, &location);
    [(RBSProcessHandle *)v27 monitorForDeath:v35];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001DCAA8;
    v32[3] = &unk_100858730;
    id v28 = v9;
    id v33 = v28;
    objc_copyWeak(&v34, &location);
    uint64_t v29 = +[RBSProcessMonitor monitorWithConfiguration:v32];
    processMonitor = v4->_processMonitor;
    v4->_processMonitor = (RBSProcessMonitor *)v29;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)dealloc
{
  [(PRAppStateMonitor *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRAppStateMonitor;
  [(PRAppStateMonitor *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
}

- (NSString)monitoredProcessName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_processNameInternal;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)launchdJobLabel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_launchdJobLabelInternal;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)isDaemon
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isDaemonInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isRunningBoardApp
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isRunningBoardAppInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isXPCService
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isXPCServiceInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUIBackgroundModeEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isUIBackgroundModeEnabledInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int)currentAppState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_latestState.__engaged_) {
    int appState = self->_latestState.var0.__val_.appState;
  }
  else {
    int appState = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return appState;
}

- (NSArray)printableState
{
  objc_super v3 = objc_opt_new();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isDaemonInternal)
  {
    v6 = @"Daemon";
  }
  else if (self->_isXPCServiceInternal)
  {
    v6 = @"XPC Service";
  }
  else if (self->_isRunningBoardAppInternal)
  {
    v6 = @"App";
  }
  else
  {
    v6 = @"Other";
  }
  v7 = v6;
  if (self->_latestState.__engaged_ && (unsigned int v8 = self->_latestState.var0.__val_.appState - 1, v8 <= 2)) {
    CFStringRef v9 = off_100858788[v8];
  }
  else {
    CFStringRef v9 = @"Unknown";
  }
  if (self->_latestState.__engaged_)
  {
    unsigned int v10 = [(RBSProcessState *)self->_latestState.var0.__val_.processState isRunning];
    id v11 = @"No";
    if (v10) {
      id v11 = @"Yes";
    }
  }
  else
  {
    id v11 = @"Unknown";
  }
  v12 = v11;
  if (self->_latestState.__engaged_) {
    id v13 = [(RBSProcessState *)self->_latestState.var0.__val_.processState taskState];
  }
  else {
    id v13 = 0;
  }
  uint64_t v14 = +[NSString stringWithFormat:@"[%d: %@]", self->_monitoredPID, self->_processNameInternal];
  [v3 addObject:v14];

  v15 = +[NSString stringWithFormat:@"    Type: %@. State: running %@ [%d], app %@ [age: %.2f s]. Observers: %d", v7, v12, v13, v9, sub_100006C38() - self->_timeOfLatestAppState, [(NSMutableSet *)self->_observers count]];
  [v3 addObject:v15];

  uint64_t v16 = +[NSString stringWithFormat:@"    Label: %@. Signing ID: %@", self->_launchdJobLabelInternal, self->_signingIdentityInternal];
  [v3 addObject:v16];

  v17 = +[NSString stringWithFormat:@"    Bundle: ID %@, UIBackgroundModeNI %d", self->_bundleIdentifierInternal, self->_isUIBackgroundModeEnabledInternal];
  [v3 addObject:v17];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v3;
}

- (void)_process:(id)a3 didUpdateState:(id)a4
{
  id v28 = a3;
  id v29 = a4;
  v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v28 name];
    *(_DWORD *)buf = 138478339;
    v42 = (const char *)v28;
    __int16 v43 = 2113;
    *(void *)v44 = v7;
    *(_WORD *)&v44[8] = 2113;
    *(void *)&v44[10] = v29;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PRAppStateMonitor] _process: %{private}@, name: %{private}@, didUpdateState: %{private}@", buf, 0x20u);
  }
  unsigned int v8 = [v29 state];
  id v38 = sub_1001DD774(v8);
  uint64_t v39 = v9;

  unsigned int v10 = [v29 previousState];
  id v27 = sub_1001DD774(v10);
  int v12 = v11;

  int v13 = [v28 pid];
  p_monitoredPID = &self->_monitoredPID;
  if (v13 != self->_monitoredPID)
  {
    v24 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041BD58(p_monitoredPID, v13, v24);
    }
    uint64_t v25 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/AppState/PRAppStateMonitor.mm";
      __int16 v43 = 1024;
      *(_DWORD *)v44 = 250;
      *(_WORD *)&v44[4] = 2080;
      *(void *)&v44[6] = "-[PRAppStateMonitor _process:didUpdateState:]";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_processNameInternal)
  {
    uint64_t v16 = [v28 name];
    processNameInternal = self->_processNameInternal;
    self->_processNameInternal = v16;
  }
  sub_1001DD800((uint64_t)&self->_latestState, (uint64_t)&v38);
  os_unfair_lock_unlock(&self->_lock);
  if (v39 != v12)
  {
    self->_timeOfLatestAppState = sub_100006C38();
    os_unfair_lock_lock(&self->_lock);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v18 = self->_observers;
    id v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v34 objects:v40 count:16];
    lock = p_lock;
    if (v19)
    {
      uint64_t v20 = *(void *)v35;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v23 = [v22 updatesQueue:lock v27];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3321888768;
          block[2] = sub_1001DD868;
          block[3] = &unk_100858758;
          block[4] = v22;
          int v33 = v13;
          id v31 = v38;
          int v32 = v39;
          dispatch_async(v23, block);
        }
        id v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v19);
    }

    os_unfair_lock_unlock(lock);
  }
}

- (void)_process:(id)a3 didTerminate:(id)a4
{
  id v14 = a3;
  unsigned int v5 = [v14 pid];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->_observers;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  lock = p_lock;
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v12 = [v11 updatesQueue:lock];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001DDA88;
        block[3] = &unk_100857CC8;
        block[4] = v11;
        unsigned int v16 = v5;
        dispatch_async(v12, block);
      }
      id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(lock);
}

- (int)monitoredPID
{
  return self->_monitoredPID;
}

- (void).cxx_destruct
{
  if (self->_latestState.__engaged_) {

  }
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_signingIdentityInternal, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierInternal, 0);
  objc_storeStrong((id *)&self->_launchdJobLabelInternal, 0);

  objc_storeStrong((id *)&self->_processNameInternal, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 80) = 0;
  *((unsigned char *)self + 96) = 0;
  return self;
}

@end