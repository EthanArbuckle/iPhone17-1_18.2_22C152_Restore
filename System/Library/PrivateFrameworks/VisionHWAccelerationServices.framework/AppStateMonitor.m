@interface AppStateMonitor
- (AppStateMonitor)initWithPID:(int)a3;
- (NSString)monitoredProcessName;
- (id).cxx_construct;
- (int)currentAppState;
- (int)monitoredPID;
- (void)_process:(id)a3 didUpdateState:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation AppStateMonitor

- (AppStateMonitor)initWithPID:(int)a3
{
  v23.receiver = self;
  v23.super_class = (Class)AppStateMonitor;
  v4 = [(AppStateMonitor *)&v23 init];
  v5 = v4;
  if (v4)
  {
    processNameInternal = v4->_processNameInternal;
    v4->_processNameInternal = 0;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_monitoredPID = a3;
    objc_initWeak(&location, v5);
    v7 = [MEMORY[0x263F64580] identifierWithPid:v5->_monitoredPID];
    id v21 = 0;
    uint64_t v8 = [MEMORY[0x263F64570] handleForIdentifier:v7 error:&v21];
    id v9 = v21;
    processHandle = v5->_processHandle;
    v5->_processHandle = (RBSProcessHandle *)v8;

    if (v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_226DD2E14((uint64_t)v9);
    }
    uint64_t v11 = [(RBSProcessHandle *)v5->_processHandle name];
    v12 = v5->_processNameInternal;
    v5->_processNameInternal = (NSString *)v11;

    [(RBSProcessHandle *)v5->_processHandle monitorForDeath:&unk_26DAEF8A8];
    v13 = (void *)MEMORY[0x263F645C0];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_226DC8A60;
    v18[3] = &unk_2647E6D48;
    id v14 = v7;
    id v19 = v14;
    objc_copyWeak(&v20, &location);
    uint64_t v15 = [v13 monitorWithConfiguration:v18];
    processMonitor = v5->_processMonitor;
    v5->_processMonitor = (RBSProcessMonitor *)v15;

    if (!v5->_processMonitor && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_226DD2DCC();
    }
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)dealloc
{
  [(AppStateMonitor *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AppStateMonitor;
  [(AppStateMonitor *)&v3 dealloc];
}

- (void)invalidate
{
}

- (int)currentAppState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_latestState.__engaged_)
  {
    int appState = self->_latestState.var0.__val_.appState;
    os_unfair_lock_unlock(p_lock);
    return appState;
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    return 0;
  }
}

- (void)_process:(id)a3 didUpdateState:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 state];
  id v9 = sub_226DC903C(v8);
  int v11 = v10;

  v12 = [v7 previousState];
  v13 = sub_226DC903C(v12);
  int v15 = v14;

  int v16 = [v6 pid];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v6 name];
    LODWORD(v25) = 67109891;
    HIDWORD(v25) = v15;
    __int16 v26 = 1024;
    int v27 = v11;
    __int16 v28 = 2113;
    v29 = v17;
    __int16 v30 = 1024;
    int v31 = v16;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: previousState: %d, state: %d, name: %{private}@, pid: %d", (uint8_t *)&v25, 0x1Eu);
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_processNameInternal)
  {
    v18 = [v6 name];
    processNameInternal = self->_processNameInternal;
    self->_processNameInternal = v18;
  }
  BOOL engaged = self->_latestState.__engaged_;
  id v21 = v9;
  v22 = v21;
  if (engaged)
  {
    processState = self->_latestState.var0.__val_.processState;
    self->_latestState.var0.__val_.processState = v21;

    self->_latestState.var0.__val_.int appState = v11;
    os_unfair_lock_unlock(&self->_lock);
    if (v11 == v15) {
      goto LABEL_13;
    }
  }
  else
  {
    self->_latestState.var0.__val_.processState = v21;
    self->_latestState.__engaged_ = 1;
    self->_latestState.var0.__val_.int appState = v11;
    os_unfair_lock_unlock(&self->_lock);
    if (v11 == v15) {
      goto LABEL_13;
    }
  }
  objc_initWeak(&v25, self);
  if ((v11 - 5) <= 0xFFFFFFFD && (v15 - 3) <= 1)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    id v24 = objc_loadWeakRetained(&v25);
    CMNotificationCenterPostNotification();
  }
  objc_destroyWeak(&v25);
LABEL_13:
}

- (int)monitoredPID
{
  return self->_monitoredPID;
}

- (NSString)monitoredProcessName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredProcessName, 0);
  if (self->_latestState.__engaged_) {

  }
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);

  objc_storeStrong((id *)&self->_processNameInternal, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 40) = 0;
  *((unsigned char *)self + 56) = 0;
  return self;
}

@end