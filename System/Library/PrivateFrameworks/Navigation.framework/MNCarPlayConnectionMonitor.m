@interface MNCarPlayConnectionMonitor
+ (MNCarPlayConnectionMonitor)sharedInstance;
- (BOOL)isConnected;
- (BOOL)isConnectedSynchronous;
- (MNCarPlayConnectionMonitor)init;
- (void)dealloc;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
@end

@implementation MNCarPlayConnectionMonitor

+ (MNCarPlayConnectionMonitor)sharedInstance
{
  if (qword_1EB59C210 != -1) {
    dispatch_once(&qword_1EB59C210, &__block_literal_global_33);
  }
  v2 = (void *)_MergedGlobals_38;
  return (MNCarPlayConnectionMonitor *)v2;
}

uint64_t __44__MNCarPlayConnectionMonitor_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _MergedGlobals_38;
  _MergedGlobals_38 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MNCarPlayConnectionMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)MNCarPlayConnectionMonitor;
  v2 = [(MNCarPlayConnectionMonitor *)&v9 init];
  if (v2)
  {
    v3 = MNGetMNCarPlayConnectionMonitorLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay connection monitor started.", v8, 2u);
    }

    v2->_isConnected = 0;
    v4 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x1E4F57EE0]);
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = v4;

    [(CARSessionStatus *)v2->_carSessionStatus addSessionObserver:v2];
    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(CARSessionStatus *)self->_carSessionStatus removeSessionObserver:self];
  carSessionStatus = self->_carSessionStatus;
  self->_carSessionStatus = 0;

  v4.receiver = self;
  v4.super_class = (Class)MNCarPlayConnectionMonitor;
  [(MNCarPlayConnectionMonitor *)&v4 dealloc];
}

- (BOOL)isConnectedSynchronous
{
  if (self->_shouldWait)
  {
    [(CARSessionStatus *)self->_carSessionStatus waitForSessionInitialization];
    self->_shouldWait = 0;
  }
  return self->_isConnected;
}

- (void)sessionDidConnect:(id)a3
{
  objc_super v4 = MNGetMNCarPlayConnectionMonitorLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay session connected.", v5, 2u);
  }

  self->_isConnected = 1;
}

- (void)sessionDidDisconnect:(id)a3
{
  objc_super v4 = MNGetMNCarPlayConnectionMonitorLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay session disconnected.", v5, 2u);
  }

  self->_isConnected = 0;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void).cxx_destruct
{
}

@end