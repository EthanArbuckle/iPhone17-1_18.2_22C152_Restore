@interface VTSiriAssertionMonitor
+ (id)sharedInstance;
- (BOOL)isEnabled;
- (VTSiriAssertionMonitor)init;
- (void)_notifyObserver:(BOOL)a3;
- (void)dealloc;
- (void)disableAssertionReceived;
- (void)enableAssertionReceived;
@end

@implementation VTSiriAssertionMonitor

- (BOOL)isEnabled
{
  return self->_assertionState == 2;
}

- (void)_notifyObserver:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__VTSiriAssertionMonitor__notifyObserver___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

void __42__VTSiriAssertionMonitor__notifyObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) notifyObserver:v3];
  if (objc_opt_respondsToSelector()) {
    [v3 VTSiriAssertionMonitor:*(void *)(a1 + 32) didReceiveEnabled:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)disableAssertionReceived
{
  id v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "did receive disable assertion", v4, 2u);
  }
  if (self->_assertionState != 1)
  {
    self->_assertionState = 1;
    [(VTSiriAssertionMonitor *)self _notifyObserver:[(VTSiriAssertionMonitor *)self isEnabled]];
  }
}

- (void)enableAssertionReceived
{
  id v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "did receive enable assertion", v4, 2u);
  }
  if (self->_assertionState != 2)
  {
    self->_assertionState = 2;
    [(VTSiriAssertionMonitor *)self _notifyObserver:[(VTSiriAssertionMonitor *)self isEnabled]];
  }
}

- (void)dealloc
{
  [(VTSiriAssertionMonitor *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)VTSiriAssertionMonitor;
  [(VTEventMonitor *)&v3 dealloc];
}

- (VTSiriAssertionMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTSiriAssertionMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result) {
    result->_assertionState = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3526 != -1) {
    dispatch_once(&sharedInstance_onceToken_3526, &__block_literal_global_3527);
  }
  v2 = (void *)sharedInstance__sharedInstance_3528;

  return v2;
}

uint64_t __40__VTSiriAssertionMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_3528 = objc_alloc_init(VTSiriAssertionMonitor);

  return MEMORY[0x270F9A758]();
}

@end