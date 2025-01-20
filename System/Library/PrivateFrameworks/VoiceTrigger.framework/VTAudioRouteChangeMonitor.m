@interface VTAudioRouteChangeMonitor
+ (id)sharedInstance;
- (BOOL)_hasDoAPSupport:(__CFDictionary *)a3;
- (BOOL)_hasInEarDetectSupport:(__CFDictionary *)a3;
- (BOOL)_isActiveRoute:(__CFDictionary *)a3;
- (VTAudioRouteChangeMonitor)init;
- (id)_CMSessionDispatchQueue;
- (unint64_t)_updateHearstConnectionStatus;
- (unint64_t)hearstConnectionStatus;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)updateExternalRouteConnectionStatus;
@end

@implementation VTAudioRouteChangeMonitor

- (id)_CMSessionDispatchQueue
{
  if (-[VTAudioRouteChangeMonitor _CMSessionDispatchQueue]::onceToken != -1) {
    dispatch_once(&-[VTAudioRouteChangeMonitor _CMSessionDispatchQueue]::onceToken, &__block_literal_global_7_5181);
  }
  v2 = (void *)-[VTAudioRouteChangeMonitor _CMSessionDispatchQueue]::gCMSessionQueue;

  return v2;
}

uint64_t __52__VTAudioRouteChangeMonitor__CMSessionDispatchQueue__block_invoke()
{
  -[VTAudioRouteChangeMonitor _CMSessionDispatchQueue]::gCMSessionQueue = (uint64_t)dispatch_queue_create("VT_CMSessionDispatchQueue", 0);

  return MEMORY[0x270F9A758]();
}

- (BOOL)_hasDoAPSupport:(__CFDictionary *)a3
{
  v4 = (const void *)*MEMORY[0x263F54688];
  BOOL result = 0;
  if (CFDictionaryContainsKey(a3, (const void *)*MEMORY[0x263F54688]))
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a3, v4);
    if (CFBooleanGetValue(Value)) {
      return 1;
    }
  }
  return result;
}

- (BOOL)_isActiveRoute:(__CFDictionary *)a3
{
  v4 = (const void *)*MEMORY[0x263F54698];
  BOOL result = 0;
  if (CFDictionaryContainsKey(a3, (const void *)*MEMORY[0x263F54698]))
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a3, v4);
    if (CFBooleanGetValue(Value)) {
      return 1;
    }
  }
  return result;
}

- (BOOL)_hasInEarDetectSupport:(__CFDictionary *)a3
{
  v4 = (const void *)*MEMORY[0x263F54690];
  BOOL result = 0;
  if (CFDictionaryContainsKey(a3, (const void *)*MEMORY[0x263F54690]))
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a3, v4);
    if (CFBooleanGetValue(Value)) {
      return 1;
    }
  }
  return result;
}

- (unint64_t)_updateHearstConnectionStatus
{
  return 2;
}

- (unint64_t)hearstConnectionStatus
{
  return self->_hearstConnection;
}

- (void)updateExternalRouteConnectionStatus
{
  v3 = [(VTAudioRouteChangeMonitor *)self _CMSessionDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__VTAudioRouteChangeMonitor_updateExternalRouteConnectionStatus__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __64__VTAudioRouteChangeMonitor_updateExternalRouteConnectionStatus__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 32) _updateHearstConnectionStatus];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
    *(_DWORD *)buf = 67240192;
    int v8 = v3;
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "Hearst connection status = %{public}d", buf, 8u);
  }
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__VTAudioRouteChangeMonitor_updateExternalRouteConnectionStatus__block_invoke_4;
  v6[3] = &unk_264325AD0;
  v6[4] = v4;
  return [v4 enumerateObserversInQueue:v6];
}

uint64_t __64__VTAudioRouteChangeMonitor_updateExternalRouteConnectionStatus__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2];
}

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:");
  if (objc_opt_respondsToSelector()) {
    [v4 VTAudioRouteChangeMonitorDidChangeAudioRoute:self];
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = [(VTAudioRouteChangeMonitor *)self _CMSessionDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__VTAudioRouteChangeMonitor__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __55__VTAudioRouteChangeMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateHearstConnectionStatus];
  *(void *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (VTAudioRouteChangeMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTAudioRouteChangeMonitor;
  uint64_t result = [(VTEventMonitor *)&v3 init];
  if (result) {
    result->_hearstConnection = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (+[VTAudioRouteChangeMonitor sharedInstance]::onceToken != -1) {
    dispatch_once(&+[VTAudioRouteChangeMonitor sharedInstance]::onceToken, &__block_literal_global_5193);
  }
  v2 = (void *)+[VTAudioRouteChangeMonitor sharedInstance]::sharedInstance;

  return v2;
}

uint64_t __43__VTAudioRouteChangeMonitor_sharedInstance__block_invoke()
{
  +[VTAudioRouteChangeMonitor sharedInstance]::sharedInstance = objc_alloc_init(VTAudioRouteChangeMonitor);

  return MEMORY[0x270F9A758]();
}

@end