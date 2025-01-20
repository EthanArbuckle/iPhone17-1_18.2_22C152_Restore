@interface TLContentProtectionStateObserver
+ (TLContentProtectionStateObserver)sharedContentProtectionStateObserver;
- (TLContentProtectionStateObserver)init;
- (id)_performBlockAfterProtectedContentUnlocked:(id)a3;
- (id)performBlockAfterProtectedContentUnlocked:(id)a3;
- (int64_t)_queryCurrentUnlockedSinceBootStatus;
- (void)_assertNotRunningOnAccessQueue;
- (void)_assertRunningOnAccessQueue;
- (void)_cancelBlockScheduledForProtectedContentUnlockedEventWithToken:(id)a3;
- (void)_cancelFirstUnlockNotifyToken;
- (void)_handleFirstUnlockNotification;
- (void)_loadContentProtectionStatusIfNeeded;
- (void)_loadUnlockedSinceBootStatusIfNeeded;
- (void)_queryCurrentUnlockedSinceBootStatus;
- (void)_registerFirstUnlockNotifyToken;
- (void)_updateUnlockedSinceBootStatus;
- (void)cancelBlockScheduledForProtectedContentUnlockedEventWithToken:(id)a3;
- (void)dealloc;
@end

@implementation TLContentProtectionStateObserver

+ (TLContentProtectionStateObserver)sharedContentProtectionStateObserver
{
  if (sharedContentProtectionStateObserver__TLContentProtectionStateObserverSharedInstanceOnceToken != -1) {
    dispatch_once(&sharedContentProtectionStateObserver__TLContentProtectionStateObserverSharedInstanceOnceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedContentProtectionStateObserver__TLContentProtectionStateObserverSharedInstance;

  return (TLContentProtectionStateObserver *)v2;
}

uint64_t __72__TLContentProtectionStateObserver_sharedContentProtectionStateObserver__block_invoke()
{
  sharedContentProtectionStateObserver__TLContentProtectionStateObserverSharedInstance = objc_alloc_init(TLContentProtectionStateObserver);

  return MEMORY[0x1F41817F8]();
}

- (TLContentProtectionStateObserver)init
{
  v15.receiver = self;
  v15.super_class = (Class)TLContentProtectionStateObserver;
  v2 = [(TLContentProtectionStateObserver *)&v15 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:v3];
    v6 = [v5 bundleIdentifier];

    uint64_t v7 = [NSString stringWithFormat:@"%@.%@-%@", v6, v4, @"AccessQueue"];
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v7;

    dispatch_queue_t v9 = dispatch_queue_create([(NSString *)v2->_accessQueueLabel UTF8String], 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = v2->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__TLContentProtectionStateObserver_init__block_invoke;
    block[3] = &unk_1E6C20D60;
    v14 = v2;
    dispatch_sync(v11, block);
  }
  return v2;
}

uint64_t __40__TLContentProtectionStateObserver_init__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = -1;
  *(void *)(*(void *)(result + 32) + 40) = -1;
  *(_DWORD *)(*(void *)(result + 32) + 48) = -1;
  return result;
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  [(TLContentProtectionStateObserver *)self _cancelFirstUnlockNotifyToken];
  dispatch_sync(v4, &__block_literal_global_8);

  v5.receiver = self;
  v5.super_class = (Class)TLContentProtectionStateObserver;
  [(TLContentProtectionStateObserver *)&v5 dealloc];
}

- (id)performBlockAfterProtectedContentUnlocked:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__TLContentProtectionStateObserver_performBlockAfterProtectedContentUnlocked___block_invoke;
  block[3] = &unk_1E6C21F60;
  v12 = &v13;
  void block[4] = self;
  v6 = (void (**)(void))v4;
  id v11 = v6;
  dispatch_sync(accessQueue, block);
  uint64_t v7 = (void *)v14[5];
  if (!v7)
  {
    v6[2](v6);
    uint64_t v7 = (void *)v14[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __78__TLContentProtectionStateObserver_performBlockAfterProtectedContentUnlocked___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _performBlockAfterProtectedContentUnlocked:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (id)_performBlockAfterProtectedContentUnlocked:(id)a3
{
  id v4 = a3;
  [(TLContentProtectionStateObserver *)self _assertRunningOnAccessQueue];
  [(TLContentProtectionStateObserver *)self _loadContentProtectionStatusIfNeeded];
  if (self->_contentProtectionStatus == 1
    && ([(TLContentProtectionStateObserver *)self _loadUnlockedSinceBootStatusIfNeeded], self->_unlockedSinceBootStatus != 1))
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    objc_super v5 = [v6 UUIDString];

    blocksScheduledForProtectedContentUnlockedEvent = self->_blocksScheduledForProtectedContentUnlockedEvent;
    if (!blocksScheduledForProtectedContentUnlockedEvent)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      dispatch_queue_t v9 = self->_blocksScheduledForProtectedContentUnlockedEvent;
      self->_blocksScheduledForProtectedContentUnlockedEvent = v8;

      blocksScheduledForProtectedContentUnlockedEvent = self->_blocksScheduledForProtectedContentUnlockedEvent;
    }
    v10 = (void *)[v4 copy];
    id v11 = (void *)MEMORY[0x1E0195470]();
    [(NSMutableDictionary *)blocksScheduledForProtectedContentUnlockedEvent setObject:v11 forKey:v5];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (void)cancelBlockScheduledForProtectedContentUnlockedEventWithToken:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__TLContentProtectionStateObserver_cancelBlockScheduledForProtectedContentUnlockedEventWithToken___block_invoke;
  v7[3] = &unk_1E6C20CC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __98__TLContentProtectionStateObserver_cancelBlockScheduledForProtectedContentUnlockedEventWithToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelBlockScheduledForProtectedContentUnlockedEventWithToken:*(void *)(a1 + 40)];
}

- (void)_cancelBlockScheduledForProtectedContentUnlockedEventWithToken:(id)a3
{
  id v4 = a3;
  [(TLContentProtectionStateObserver *)self _assertRunningOnAccessQueue];
  [(NSMutableDictionary *)self->_blocksScheduledForProtectedContentUnlockedEvent removeObjectForKey:v4];
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
      objc_super v5 = TLLogGeneral();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLContentProtectionStateObserver.m"];
        id v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_queue_t v9 = [v7 lastPathComponent];
          v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v12 = 136381443;
          uint64_t v13 = "-[TLContentProtectionStateObserver _assertRunningOnAccessQueue]";
          __int16 v14 = 2113;
          uint64_t v15 = v9;
          __int16 v16 = 2049;
          uint64_t v17 = 155;
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

      id v11 = TLLogGeneral();
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
      objc_super v5 = TLLogGeneral();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLContentProtectionStateObserver.m"];
        id v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_queue_t v9 = [v7 lastPathComponent];
          v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v12 = 136381443;
          uint64_t v13 = "-[TLContentProtectionStateObserver _assertNotRunningOnAccessQueue]";
          __int16 v14 = 2113;
          uint64_t v15 = v9;
          __int16 v16 = 2049;
          uint64_t v17 = 163;
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

      id v11 = TLLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TLAttentionAwarenessEffectProcessor _assertNotRunningOnAccessQueue]();
      }
    }
  }
}

- (void)_cancelFirstUnlockNotifyToken
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB936000, v0, v1, "%{public}@: Failed to cancel notify token for notify topic named \"%{public}s\"; notifyCancelStatus = %lu.");
}

- (void)_registerFirstUnlockNotifyToken
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB936000, v0, v1, "%{public}@: Failed to register notify token for notify topic named \"%{public}s\"; notifyRegisterDispatchStatus = %lu.");
}

void __67__TLContentProtectionStateObserver__registerFirstUnlockNotifyToken__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleFirstUnlockNotification];
    id WeakRetained = v2;
  }
}

- (void)_handleFirstUnlockNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(TLContentProtectionStateObserver *)self _assertRunningOnAccessQueue];
  v3 = TLLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543618;
    objc_super v5 = self;
    __int16 v6 = 2082;
    uint64_t v7 = "com.apple.mobile.keybagd.first_unlock";
    _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Notify block fired for topic named \"%{public}s\"; updating unlocked since boot status.",
      (uint8_t *)&v4,
      0x16u);
  }

  [(TLContentProtectionStateObserver *)self _updateUnlockedSinceBootStatus];
}

- (void)_updateUnlockedSinceBootStatus
{
  [(TLContentProtectionStateObserver *)self _assertRunningOnAccessQueue];
  int64_t v3 = [(TLContentProtectionStateObserver *)self _queryCurrentUnlockedSinceBootStatus];
  self->_unlockedSinceBootStatus = v3;
  if (v3 == 1)
  {
    [(TLContentProtectionStateObserver *)self _cancelFirstUnlockNotifyToken];
    int v4 = [(NSMutableDictionary *)self->_blocksScheduledForProtectedContentUnlockedEvent allValues];
    objc_super v5 = (void *)[v4 copy];

    blocksScheduledForProtectedContentUnlockedEvent = self->_blocksScheduledForProtectedContentUnlockedEvent;
    self->_blocksScheduledForProtectedContentUnlockedEvent = 0;

    if ([v5 count])
    {
      uint64_t v7 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__TLContentProtectionStateObserver__updateUnlockedSinceBootStatus__block_invoke;
      block[3] = &unk_1E6C20D60;
      id v9 = v5;
      dispatch_async(v7, block);
    }
  }
}

void __66__TLContentProtectionStateObserver__updateUnlockedSinceBootStatus__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_loadUnlockedSinceBootStatusIfNeeded
{
  [(TLContentProtectionStateObserver *)self _assertRunningOnAccessQueue];
  if (self->_unlockedSinceBootStatus == -1)
  {
    [(TLContentProtectionStateObserver *)self _registerFirstUnlockNotifyToken];
    [(TLContentProtectionStateObserver *)self _updateUnlockedSinceBootStatus];
  }
}

- (void)_loadContentProtectionStatusIfNeeded
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_1(&dword_1DB936000, v0, v1, "%{public}@: MKBDeviceFormattedForContentProtection() returned unexpected result: %d; sticking to unlockedSinceBootSt"
    "atus = %{public}@.");
}

- (int64_t)_queryCurrentUnlockedSinceBootStatus
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v3 = (uint64_t (*)(uint64_t))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  __int16 v16 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    *(void *)&buf[24] = &unk_1E6C210C8;
    __int16 v18 = &v13;
    uint64_t v4 = (void *)MobileKeyBagLibrary();
    uint64_t v5 = dlsym(v4, "MKBDeviceUnlockedSinceBoot");
    *(void *)(v18[1] + 24) = v5;
    getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(v18[1] + 24);
    uint64_t v3 = (uint64_t (*)(uint64_t))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v3)
  {
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    __break(1u);
  }
  int v7 = v3(v6);
  int v8 = v7;
  if (!v7)
  {
    int64_t v10 = 0;
    long long v9 = @"no";
LABEL_8:
    uint64_t v11 = TLLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v9;
      _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: MKBDeviceUnlockedSinceBoot() returned %d; converted to unlockedSinceBootStatus = %{public}@.",
        buf,
        0x1Cu);
    }
    goto LABEL_13;
  }
  if (v7 == 1)
  {
    long long v9 = @"yes";
    int64_t v10 = 1;
    goto LABEL_8;
  }
  uint64_t v11 = TLLogGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[TLContentProtectionStateObserver _queryCurrentUnlockedSinceBootStatus]();
  }
  int64_t v10 = -1;
LABEL_13:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksScheduledForProtectedContentUnlockedEvent, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_queryCurrentUnlockedSinceBootStatus
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_1(&dword_1DB936000, v0, v1, "%{public}@: MKBDeviceUnlockedSinceBoot() returned unexpected result: %d; sticking to unlockedSinceBootStatus = %{public}@.");
}

@end