@interface TLBacklight
+ (TLBacklight)sharedBacklight;
- (TLBacklight)init;
- (int64_t)backlightStatus;
- (void)_assertNotRunningOnAccessQueue;
- (void)_assertRunningOnAccessQueue;
- (void)_notifyObservers:(id)a3 ofUpdatedBacklightStatus:(int64_t)a4;
- (void)_performBlockOnAccessQueue:(id)a3;
- (void)_setBacklightStatus:(int64_t)a3;
- (void)_setObservingBacklight:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation TLBacklight

+ (TLBacklight)sharedBacklight
{
  if (sharedBacklight__TLBacklightSharedInstanceOnceToken != -1) {
    dispatch_once(&sharedBacklight__TLBacklightSharedInstanceOnceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedBacklight__TLBacklightSharedInstance;

  return (TLBacklight *)v2;
}

uint64_t __30__TLBacklight_sharedBacklight__block_invoke()
{
  sharedBacklight__TLBacklightSharedInstance = objc_alloc_init(TLBacklight);

  return MEMORY[0x1F41817F8]();
}

- (TLBacklight)init
{
  v15.receiver = self;
  v15.super_class = (Class)TLBacklight;
  v2 = [(TLBacklight *)&v15 init];
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

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __19__TLBacklight_init__block_invoke;
    v13[3] = &unk_1E6C20D60;
    v14 = v2;
    [(TLBacklight *)v14 _performBlockOnAccessQueue:v13];
  }
  return v2;
}

uint64_t __19__TLBacklight_init__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = -1;
  return result;
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  dispatch_sync(v4, &__block_literal_global_8_1);
  v5.receiver = self;
  v5.super_class = (Class)TLBacklight;
  [(TLBacklight *)&v5 dealloc];
}

- (int64_t)backlightStatus
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = -1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__TLBacklight_backlightStatus__block_invoke;
  v4[3] = &unk_1E6C20D10;
  v4[4] = self;
  v4[5] = &v5;
  [(TLBacklight *)self _performBlockOnAccessQueue:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__TLBacklight_backlightStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)_setBacklightStatus:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__TLBacklight__setBacklightStatus___block_invoke;
  v6[3] = &unk_1E6C22000;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  [(TLBacklight *)self _performBlockOnAccessQueue:v6];
  uint64_t v5 = v8[5];
  if (v5) {
    [(TLBacklight *)self _notifyObservers:v5 ofUpdatedBacklightStatus:a3];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __35__TLBacklight__setBacklightStatus___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 48);
  if (*(void *)(v1 + 40) != v2)
  {
    uint64_t v3 = result;
    *(void *)(v1 + 40) = v2;
    *(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 40) = [*(id *)(*(void *)(result + 32) + 24) allObjects];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_setObservingBacklight:(BOOL)a3
{
  BOOL v3 = a3;
  [(TLBacklight *)self _assertRunningOnAccessQueue];
  if (self->_isObservingBacklight != v3)
  {
    self->_isObservingBacklight = v3;
    if (!v3) {
      self->_backlightStatus = -1;
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__TLBacklight_addObserver___block_invoke;
  v6[3] = &unk_1E6C20CC0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(TLBacklight *)self _performBlockOnAccessQueue:v6];
}

uint64_t __27__TLBacklight_addObserver___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "containsObject:") & 1) == 0)
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 24);
    if (!v2)
    {
      uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = *(void **)(v4 + 24);
      *(void *)(v4 + 24) = v3;

      uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 24);
    }
    [v2 addObject:*(void *)(a1 + 32)];
  }
  v6 = *(void **)(a1 + 40);

  return [v6 _setObservingBacklight:1];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__TLBacklight_removeObserver___block_invoke;
  v6[3] = &unk_1E6C20CC0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(TLBacklight *)self _performBlockOnAccessQueue:v6];
}

uint64_t __30__TLBacklight_removeObserver___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "containsObject:")) {
    [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 32)];
  }
  uint64_t v2 = *(id **)(a1 + 40);
  BOOL v3 = [v2[3] count] != 0;

  return [v2 _setObservingBacklight:v3];
}

- (void)_notifyObservers:(id)a3 ofUpdatedBacklightStatus:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(TLBacklight *)self _assertNotRunningOnAccessQueue];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "backlightStatusDidChange:", a4, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
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
      id v5 = TLLogGeneral();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLBacklight.m"];
        uint64_t v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v7 lastPathComponent];
          uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v12 = 136381443;
          long long v13 = "-[TLBacklight _assertRunningOnAccessQueue]";
          __int16 v14 = 2113;
          long long v15 = v9;
          __int16 v16 = 2049;
          uint64_t v17 = 208;
          __int16 v18 = 2113;
          v19 = v10;
          _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);
        }
      }
      else
      {
        id v7 = TLLogGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
        }
      }

      uint64_t v11 = TLLogGeneral();
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
      id v5 = TLLogGeneral();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLBacklight.m"];
        uint64_t v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v7 lastPathComponent];
          uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v12 = 136381443;
          long long v13 = "-[TLBacklight _assertNotRunningOnAccessQueue]";
          __int16 v14 = 2113;
          long long v15 = v9;
          __int16 v16 = 2049;
          uint64_t v17 = 216;
          __int16 v18 = 2113;
          v19 = v10;
          _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);
        }
      }
      else
      {
        id v7 = TLLogGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
        }
      }

      uint64_t v11 = TLLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TLAttentionAwarenessEffectProcessor _assertNotRunningOnAccessQueue]();
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end