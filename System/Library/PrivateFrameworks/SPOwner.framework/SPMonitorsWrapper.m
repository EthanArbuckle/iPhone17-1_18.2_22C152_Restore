@interface SPMonitorsWrapper
- (BOOL)isNetworkUp;
- (BOOL)isRunning;
- (BOOL)useLegacyMacBeaconing;
- (NSDate)lastStateChangeDate;
- (NSDate)nextStateChangeDate;
- (OS_dispatch_queue)delegateQueue;
- (SPMonitorsWrapper)initWithBeaconManager:(id)a3 delegateQueue:(id)a4;
- (SPMonitorsWrapperDelegate)delegate;
- (SPNetworkMonitor)networkMonitor;
- (int)_cpuType;
- (unint64_t)powerState;
- (void)pause;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setLastStateChangeDate:(id)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setNextStateChangeDate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SPMonitorsWrapper

- (SPMonitorsWrapper)initWithBeaconManager:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SPMonitorsWrapper;
  v8 = [(SPMonitorsWrapper *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    if (v7)
    {
      v10 = (OS_dispatch_queue *)v7;
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = v10;
    }
    else
    {
      delegateQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v12 = dispatch_queue_create("com.apple.icloud.SPOwner.monitor-wrapper", delegateQueue);
      v13 = v9->_delegateQueue;
      v9->_delegateQueue = (OS_dispatch_queue *)v12;
    }
  }

  return v9;
}

- (int)_cpuType
{
  if (_cpuType_onceToken != -1) {
    dispatch_once(&_cpuType_onceToken, &__block_literal_global_4);
  }
  return _cpuType_cachedCPUType;
}

void __29__SPMonitorsWrapper__cpuType__block_invoke()
{
  int v2 = 0;
  size_t v1 = 4;
  if (sysctlbyname("hw.cputype", &v2, &v1, 0, 0) == -1)
  {
    v0 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
      __29__SPMonitorsWrapper__cpuType__block_invoke_cold_1(v0);
    }
  }
  _cpuType_cachedCPUType = v2;
}

- (BOOL)useLegacyMacBeaconing
{
  return [(SPMonitorsWrapper *)self _cpuType] == 7;
}

- (BOOL)isNetworkUp
{
  int v2 = [(SPMonitorsWrapper *)self networkMonitor];
  char v3 = [v2 isNetworkUp];

  return v3;
}

- (unint64_t)powerState
{
  return 0;
}

- (void)start
{
  objc_initWeak(&location, self);
  char v3 = objc_alloc_init(SPNetworkMonitor);
  [(SPMonitorsWrapper *)self setNetworkMonitor:v3];

  v4 = [(SPMonitorsWrapper *)self networkMonitor];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __26__SPMonitorsWrapper_start__block_invoke;
  v8 = &unk_1E601BAF0;
  objc_copyWeak(&v9, &location);
  [v4 startMonitoringWithCallback:&v5];

  [(SPMonitorsWrapper *)self resume];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __26__SPMonitorsWrapper_start__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained delegate];
  objc_msgSend(v3, "stateDidChange:powerState:", a2, objc_msgSend(WeakRetained, "powerState"));
}

- (void)stop
{
  char v3 = [(SPMonitorsWrapper *)self networkMonitor];
  [v3 stopMonitoring];

  [(SPMonitorsWrapper *)self setNetworkMonitor:0];

  [(SPMonitorsWrapper *)self pause];
}

- (void)pause
{
  char v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconMonitorWrapper: pausing", v4, 2u);
  }

  [(SPMonitorsWrapper *)self setIsRunning:0];
}

- (void)resume
{
  char v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconMonitorWrapper: resuming", v4, 2u);
  }

  [(SPMonitorsWrapper *)self setIsRunning:1];
}

- (SPMonitorsWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SPMonitorsWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (SPNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
}

- (NSDate)lastStateChangeDate
{
  return self->_lastStateChangeDate;
}

- (void)setLastStateChangeDate:(id)a3
{
}

- (NSDate)nextStateChangeDate
{
  return self->_nextStateChangeDate;
}

- (void)setNextStateChangeDate:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextStateChangeDate, 0);
  objc_storeStrong((id *)&self->_lastStateChangeDate, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __29__SPMonitorsWrapper__cpuType__block_invoke_cold_1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1B2FD8000, a1, OS_LOG_TYPE_FAULT, "hw.cputype failed with error: %d", (uint8_t *)v3, 8u);
}

@end