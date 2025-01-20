@interface TLSilentModeController
+ (TLSilentModeController)sharedSilentModeController;
- (BOOL)_registerRingerSwitchChangedNotifyToken;
- (TLSilentModeController)init;
- (int64_t)_silentModeStatusForRingerSwitchChangedNotifyToken:(int)a3;
- (int64_t)silentModeStatus;
- (void)_assertNotRunningOnAccessQueue;
- (void)_assertRunningOnAccessQueue;
- (void)_cancelRingerSwitchChangedNotifyToken;
- (void)_performBlockOnAccessQueue:(id)a3;
- (void)_registerRingerSwitchChangedNotifyToken;
- (void)_setSilentModeStatus:(int64_t)a3;
- (void)_updateSilentModeStatusUsingRingerSwitchChangedNotifyToken:(int)a3;
- (void)dealloc;
@end

@implementation TLSilentModeController

+ (TLSilentModeController)sharedSilentModeController
{
  if (sharedSilentModeController__TLSilentModeControllerSharedInstanceOnceToken != -1) {
    dispatch_once(&sharedSilentModeController__TLSilentModeControllerSharedInstanceOnceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedSilentModeController__TLSilentModeControllerSharedInstance;

  return (TLSilentModeController *)v2;
}

uint64_t __52__TLSilentModeController_sharedSilentModeController__block_invoke()
{
  sharedSilentModeController__TLSilentModeControllerSharedInstance = objc_alloc_init(TLSilentModeController);

  return MEMORY[0x1F41817F8]();
}

- (TLSilentModeController)init
{
  v17.receiver = self;
  v17.super_class = (Class)TLSilentModeController;
  v2 = [(TLSilentModeController *)&v17 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSString;
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:v3];
    v6 = [v5 bundleIdentifier];
    v7 = NSStringFromClass(v3);
    uint64_t v8 = [v4 stringWithFormat:@"%@.%@-%@", v6, v7, @"AccessQueue"];
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v8;

    dispatch_queue_t v10 = dispatch_queue_create([(NSString *)v2->_accessQueueLabel UTF8String], 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v10;

    if ([(TLSilentModeController *)v2 _registerRingerSwitchChangedNotifyToken])
    {
      uint64_t v12 = [(TLSilentModeController *)v2 _silentModeStatusForRingerSwitchChangedNotifyToken:v2->_ringerSwitchChangedNotifyToken];
    }
    else
    {
      uint64_t v12 = -1;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __30__TLSilentModeController_init__block_invoke;
    v14[3] = &unk_1E6C21058;
    v15 = v2;
    uint64_t v16 = v12;
    [(TLSilentModeController *)v15 _performBlockOnAccessQueue:v14];
  }
  return v2;
}

uint64_t __30__TLSilentModeController_init__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = *(void *)(result + 40);
  return result;
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  [(TLSilentModeController *)self _cancelRingerSwitchChangedNotifyToken];
  dispatch_sync(v4, &__block_literal_global_8_0);

  v5.receiver = self;
  v5.super_class = (Class)TLSilentModeController;
  [(TLSilentModeController *)&v5 dealloc];
}

- (int64_t)silentModeStatus
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = -1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__TLSilentModeController_silentModeStatus__block_invoke;
  v4[3] = &unk_1E6C20D10;
  v4[4] = self;
  v4[5] = &v5;
  [(TLSilentModeController *)self _performBlockOnAccessQueue:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __42__TLSilentModeController_silentModeStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)_setSilentModeStatus:(int64_t)a3
{
  if (self->_silentModeStatus != a3) {
    self->_silentModeStatus = a3;
  }
}

- (void)_performBlockOnAccessQueue:(id)a3
{
  accessQueue = self->_accessQueue;
  if (accessQueue) {
    dispatch_sync(accessQueue, a3);
  }
}

- (void)_assertRunningOnAccessQueue
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  accessQueue = self->_accessQueue;
  if (accessQueue)
  {
    dispatch_assert_queue_V2(accessQueue);
  }
  else
  {
    label = dispatch_queue_get_label(0);
    if (strcmp(label, [(NSString *)self->_accessQueueLabel UTF8String]))
    {
      uint64_t v5 = TLLogGeneral();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLSilentModeController.m"];
        uint64_t v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = [v7 lastPathComponent];
          dispatch_queue_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v12 = 136381443;
          v13 = "-[TLSilentModeController _assertRunningOnAccessQueue]";
          __int16 v14 = 2113;
          v15 = v9;
          __int16 v16 = 2049;
          uint64_t v17 = 114;
          __int16 v18 = 2113;
          v19 = v10;
          _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);
        }
      }
      else
      {
        uint64_t v7 = TLLogGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
        }
      }

      v11 = TLLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TLAttentionAwarenessEffectProcessor _assertRunningOnAccessQueue]();
      }
    }
  }
}

- (void)_assertNotRunningOnAccessQueue
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  accessQueue = self->_accessQueue;
  if (accessQueue)
  {
    dispatch_assert_queue_not_V2(accessQueue);
  }
  else
  {
    label = dispatch_queue_get_label(0);
    if (!strcmp(label, [(NSString *)self->_accessQueueLabel UTF8String]))
    {
      uint64_t v5 = TLLogGeneral();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLSilentModeController.m"];
        uint64_t v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = [v7 lastPathComponent];
          dispatch_queue_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v12 = 136381443;
          v13 = "-[TLSilentModeController _assertNotRunningOnAccessQueue]";
          __int16 v14 = 2113;
          v15 = v9;
          __int16 v16 = 2049;
          uint64_t v17 = 122;
          __int16 v18 = 2113;
          v19 = v10;
          _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);
        }
      }
      else
      {
        uint64_t v7 = TLLogGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
        }
      }

      v11 = TLLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TLAttentionAwarenessEffectProcessor _assertNotRunningOnAccessQueue]();
      }
    }
  }
}

- (void)_cancelRingerSwitchChangedNotifyToken
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB936000, v0, v1, "%{public}@: Failed to cancel notify token for notify topic named \"%{public}s\"; notifyCancelStatus = %lu.");
}

- (BOOL)_registerRingerSwitchChangedNotifyToken
{
  objc_initWeak(&location, self);
  self->_ringerSwitchChangedNotifyToken = -1;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__TLSilentModeController__registerRingerSwitchChangedNotifyToken__block_invoke;
  v7[3] = &unk_1E6C21F88;
  objc_copyWeak(&v8, &location);
  uint32_t v4 = notify_register_dispatch("com.apple.springboard.ringerstate", &self->_ringerSwitchChangedNotifyToken, accessQueue, v7);
  if (v4)
  {
    uint64_t v5 = TLLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[TLSilentModeController _registerRingerSwitchChangedNotifyToken]();
    }
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v4 == 0;
}

void __65__TLSilentModeController__registerRingerSwitchChangedNotifyToken__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _updateSilentModeStatusUsingRingerSwitchChangedNotifyToken:a2];
    id WeakRetained = v4;
  }
}

- (int64_t)_silentModeStatusForRingerSwitchChangedNotifyToken:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {
    BOOL v6 = TLLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TLSilentModeController _silentModeStatusForRingerSwitchChangedNotifyToken:]((uint64_t)self, v6);
    }

    return -1;
  }
  else
  {
    uint64_t state64 = -1;
    if (notify_get_state(a3, &state64))
    {
      id v4 = TLLogGeneral();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[TLSilentModeController _silentModeStatusForRingerSwitchChangedNotifyToken:]();
      }
      int64_t v5 = -1;
    }
    else
    {
      uint64_t v7 = -1;
      id v8 = @"unknown";
      v9 = @"silent";
      if (state64) {
        v9 = 0;
      }
      else {
        id v8 = @"on";
      }
      if (!state64) {
        uint64_t v7 = 1;
      }
      if (state64 == 1) {
        dispatch_queue_t v10 = @"tone1";
      }
      else {
        dispatch_queue_t v10 = v9;
      }
      if (state64 == 1) {
        v11 = @"off";
      }
      else {
        v11 = v8;
      }
      if (state64 == 1) {
        int64_t v5 = 0;
      }
      else {
        int64_t v5 = v7;
      }
      id v4 = TLLogGeneral();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        v15 = self;
        __int16 v16 = 2048;
        uint64_t v17 = state64;
        __int16 v18 = 2114;
        v19 = v10;
        __int16 v20 = 2082;
        v21 = "com.apple.springboard.ringerstate";
        __int16 v22 = 2114;
        v23 = v11;
        _os_log_impl(&dword_1DB936000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved ringerSwitchState = %llu (%{public}@) from notify token for topic named \"%{public}s\"; "
          "converted to silentModeStatus = %{public}@.",
          buf,
          0x34u);
      }
    }
  }
  return v5;
}

- (void)_updateSilentModeStatusUsingRingerSwitchChangedNotifyToken:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(TLSilentModeController *)self _assertRunningOnAccessQueue];
  int64_t v5 = TLLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    uint64_t v7 = self;
    __int16 v8 = 2082;
    v9 = "com.apple.springboard.ringerstate";
    _os_log_impl(&dword_1DB936000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Notify block fired for topic named \"%{public}s\"; updating silent mode.",
      (uint8_t *)&v6,
      0x16u);
  }

  [(TLSilentModeController *)self _setSilentModeStatus:[(TLSilentModeController *)self _silentModeStatusForRingerSwitchChangedNotifyToken:v3]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_registerRingerSwitchChangedNotifyToken
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB936000, v0, v1, "%{public}@: Failed to register notify token for notify topic named \"%{public}s\"; notifyRegisterDispatchStatus = %lu.");
}

- (void)_silentModeStatusForRingerSwitchChangedNotifyToken:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2082;
  int64_t v5 = "com.apple.springboard.ringerstate";
  _os_log_error_impl(&dword_1DB936000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get state for notify topic named \"%{public}s\" because ringerSwitchChangedNotifyToken = NOTIFY_TOKEN_INVALID.", (uint8_t *)&v2, 0x16u);
}

- (void)_silentModeStatusForRingerSwitchChangedNotifyToken:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB936000, v0, v1, "%{public}@: Failed to get state for notify topic named \"%{public}s\"; notifyStatus = %lu.");
}

@end