@interface VTAssetMonitor
+ (id)sharedInstance;
- (VTAssetMonitor)init;
- (void)_didReceiveNewAssetAvailable;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)notifyNewAssetDownloaded;
@end

@implementation VTAssetMonitor

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  [(VTEventMonitor *)self notifyObserver:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 VTAssetMonitor:self didReceiveNewAssetAvailable:1];
  }
}

- (void)_didReceiveNewAssetAvailable
{
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "New asset is available", buf, 2u);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__VTAssetMonitor__didReceiveNewAssetAvailable__block_invoke;
  v4[3] = &unk_264325AD0;
  v4[4] = self;
  [(VTEventMonitor *)self enumerateObservers:v4];
}

uint64_t __46__VTAssetMonitor__didReceiveNewAssetAvailable__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2];
}

- (void)notifyNewAssetDownloaded
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__VTAssetMonitor_notifyNewAssetDownloaded__block_invoke;
  v2[3] = &unk_264325AD0;
  v2[4] = self;
  [(VTEventMonitor *)self enumerateObserversInQueue:v2];
}

uint64_t __42__VTAssetMonitor_notifyNewAssetDownloaded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2];
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    id v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Asset meta update", v5, 2u);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __44__VTAssetMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_264325C58;
    handler[4] = self;
    notify_register_dispatch("com.apple.MobileAsset.VoiceTriggerAssets.ma.cached-metadata-updated", &self->_notifyToken, (dispatch_queue_t)a3, handler);
    v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Start monitoring : Asset meta update", v4, 2u);
    }
  }
}

uint64_t __44__VTAssetMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNewAssetAvailable];
}

- (VTAssetMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTAssetMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result) {
    result->_int notifyToken = -1;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2879 != -1) {
    dispatch_once(&sharedInstance_onceToken_2879, &__block_literal_global_2880);
  }
  v2 = (void *)sharedInstance__sharedInstance_2881;

  return v2;
}

uint64_t __32__VTAssetMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_2881 = objc_alloc_init(VTAssetMonitor);

  return MEMORY[0x270F9A758]();
}

@end