@interface CACSystemStatusManager
+ (id)sharedManager;
- (BOOL)isDictationRunning;
- (CACSystemStatusManager)init;
- (void)setIsDictationRunning:(BOOL)a3;
@end

@implementation CACSystemStatusManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_35);
  }
  v2 = (void *)sharedManager_sSharedManager;
  return v2;
}

uint64_t __39__CACSystemStatusManager_sharedManager__block_invoke()
{
  sharedManager_sSharedManager = objc_alloc_init(CACSystemStatusManager);
  return MEMORY[0x270F9A758]();
}

- (CACSystemStatusManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)CACSystemStatusManager;
  v2 = [(CACSystemStatusManager *)&v14 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (const char *)*MEMORY[0x263F83790];
    v4 = MEMORY[0x263EF83A0];
    id v5 = MEMORY[0x263EF83A0];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = (uint64_t)__30__CACSystemStatusManager_init__block_invoke;
    v11[3] = (uint64_t)&unk_264D12988;
    objc_copyWeak(&v12, &location);
    LODWORD(v3) = notify_register_dispatch(v3, &_notificationToken, v4, v11);

    if (v3)
    {
      v6 = [MEMORY[0x263F08B88] callStackSymbols];
      _CACAssertionFailed((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCommandAndControl/CommandAndControlFramework/SpokenCommandManager/CACSystemStatusManager.m", 52, (uint64_t)"-[CACSystemStatusManager init]", v6, @"Could not register for dictation notifications", v7, v8, v9, v11[0]);
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__CACSystemStatusManager_init__block_invoke(uint64_t a1)
{
  v2 = CACLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __30__CACSystemStatusManager_init__block_invoke_cold_2(v2);
  }

  uint64_t state64 = 0;
  notify_get_state(_notificationToken, &state64);
  v3 = CACLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __30__CACSystemStatusManager_init__block_invoke_cold_1((uint64_t *)&state64, v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _systemDictationStatusDidChange:state64 == 1];
}

- (BOOL)isDictationRunning
{
  return self->_isDictationRunning;
}

- (void)setIsDictationRunning:(BOOL)a3
{
  self->_isDictationRunning = a3;
}

void __30__CACSystemStatusManager_init__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_238377000, a2, OS_LOG_TYPE_DEBUG, "notifyd Keyboard Dictation GETSTATE %llu", (uint8_t *)&v3, 0xCu);
}

void __30__CACSystemStatusManager_init__block_invoke_cold_2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = _notificationToken;
  _os_log_debug_impl(&dword_238377000, log, OS_LOG_TYPE_DEBUG, "notifyd Keyboard Dictation TOKEN %i", (uint8_t *)v1, 8u);
}

@end