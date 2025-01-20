@interface VTSoftwareUpdateCheckingMonitor
+ (id)sharedInstance;
- (BOOL)_checkSoftwareUpdateCheckingState;
- (BOOL)isSoftwareUpdateCheckingRunning;
- (VTSoftwareUpdateCheckingMonitor)init;
- (unsigned)_softwareUpdateCheckingState;
- (void)_didReceiveSoftwareUpdateCheckingStateChanged:(BOOL)a3;
- (void)_didReceiveSoftwareUpdateCheckingStateChangedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withSoftwareUpdateCheckingRunning:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation VTSoftwareUpdateCheckingMonitor

- (void)_notifyObserver:(id)a3 withSoftwareUpdateCheckingRunning:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(VTEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 VTSoftwareUpdateCheckingMonitor:self didReceiveStateChanged:v4];
  }
}

- (void)_didReceiveSoftwareUpdateCheckingStateChanged:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__VTSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChanged___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObservers:v3];
}

uint64_t __81__VTSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withSoftwareUpdateCheckingRunning:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveSoftwareUpdateCheckingStateChangedInQueue:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __88__VTSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChangedInQueue___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __88__VTSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withSoftwareUpdateCheckingRunning:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isSoftwareUpdateCheckingRunning
{
  return self->_isSoftwareUpdateCheckingRunning;
}

- (unsigned)_softwareUpdateCheckingState
{
  int out_token = -1;
  notify_register_check("com.apple.duetscheduler.restartCheckNotification", &out_token);
  if (out_token == -1) {
    return 2;
  }
  uint64_t v3 = 0;
  notify_get_state(out_token, &v3);
  notify_cancel(out_token);
  return v3 == 0;
}

- (BOOL)_checkSoftwareUpdateCheckingState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = [(VTSoftwareUpdateCheckingMonitor *)self _softwareUpdateCheckingState];
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = @"NO";
    if (!v2) {
      BOOL v4 = @"YES";
    }
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Software update checking running : %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return v2 == 0;
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    BOOL v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Software update checking state", v5, 2u);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  BOOL v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __61__VTSoftwareUpdateCheckingMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_264325C58;
    handler[4] = self;
    notify_register_dispatch("com.apple.duetscheduler.restartCheckNotification", &self->_notifyToken, v4, handler);
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      int v6 = "Start monitoring : Software update checking state";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      int v6 = "Cannot start monitoring software update checking state because it was already started";
LABEL_6:
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 2u);
    }
  }
  self->_isSoftwareUpdateCheckingRunning = [(VTSoftwareUpdateCheckingMonitor *)self _checkSoftwareUpdateCheckingState];
}

uint64_t __61__VTSoftwareUpdateCheckingMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = [*(id *)(a1 + 32) _checkSoftwareUpdateCheckingState];
  int v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = v2[28];

  return [v2 _didReceiveSoftwareUpdateCheckingStateChanged:v3];
}

- (VTSoftwareUpdateCheckingMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTSoftwareUpdateCheckingMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_isSoftwareUpdateCheckingRunning = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6375 != -1) {
    dispatch_once(&sharedInstance_onceToken_6375, &__block_literal_global_6376);
  }
  int v2 = (void *)sharedInstance__sharedInstance_6377;

  return v2;
}

uint64_t __49__VTSoftwareUpdateCheckingMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_6377 = objc_alloc_init(VTSoftwareUpdateCheckingMonitor);

  return MEMORY[0x270F9A758]();
}

@end