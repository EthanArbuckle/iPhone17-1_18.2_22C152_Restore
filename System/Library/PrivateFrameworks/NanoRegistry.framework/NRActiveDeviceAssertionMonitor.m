@interface NRActiveDeviceAssertionMonitor
+ (id)sharedInstance;
- (BOOL)hasActiveAssertion;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NRActiveDeviceAssertionMonitor

+ (id)sharedInstance
{
  if (_MergedGlobals_11 != -1) {
    dispatch_once(&_MergedGlobals_11, &__block_literal_global_9);
  }
  v2 = (void *)qword_1EB30BAF0;

  return v2;
}

void __48__NRActiveDeviceAssertionMonitor_sharedInstance__block_invoke()
{
  v0 = [NRActiveDeviceAssertionMonitor alloc];
  if (v0)
  {
    v8.receiver = v0;
    v8.super_class = (Class)NRActiveDeviceAssertionMonitor;
    v1 = objc_msgSendSuper2(&v8, sel_init);
    if (v1)
    {
      uint64_t v2 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v3 = (void *)v1[2];
      v1[2] = v2;

      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v5 = dispatch_queue_create("com.apple.NanoRegistry.NRActiveDeviceAssertionMonitor", v4);
      v6 = (void *)v1[3];
      v1[3] = v5;

      *((_DWORD *)v1 + 2) = -1;
    }
  }
  else
  {
    v1 = 0;
  }
  v7 = (void *)qword_1EB30BAF0;
  qword_1EB30BAF0 = (uint64_t)v1;
}

- (BOOL)hasActiveAssertion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__NRActiveDeviceAssertionMonitor_hasActiveAssertion__block_invoke;
  v5[3] = &unk_1E5B00198;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__NRActiveDeviceAssertionMonitor_hasActiveAssertion__block_invoke(uint64_t a1)
{
  state64[1] = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
  int out_token = v2;
  if (v2 != -1) {
    goto LABEL_8;
  }
  uint32_t v3 = notify_register_check("com.apple.NanoRegistry.NRActiveDeviceAssertion", &out_token);
  if (v3)
  {
    uint32_t v4 = v3;
    dispatch_queue_t v5 = nr_framework_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LODWORD(state64[0]) = 67109120;
        HIDWORD(state64[0]) = v4;
        _os_log_error_impl(&dword_1A356E000, v7, OS_LOG_TYPE_ERROR, "Failed to register short lived token with status: (%u)", (uint8_t *)state64, 8u);
      }
    }
  }
  int v2 = out_token;
  if (out_token != -1)
  {
LABEL_8:
    state64[0] = 0;
    uint32_t state = notify_get_state(v2, state64);
    if (state)
    {
      uint32_t v9 = state;
      v10 = nr_framework_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        v12 = nr_framework_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          uint32_t v20 = v9;
          _os_log_error_impl(&dword_1A356E000, v12, OS_LOG_TYPE_ERROR, "Failed to query token value with status: (%u)", buf, 8u);
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = state64[0] == 1;
    if (*(_DWORD *)(*(void *)(a1 + 32) + 8) == -1)
    {
      uint32_t v13 = notify_cancel(out_token);
      if (v13)
      {
        uint32_t v14 = v13;
        v15 = nr_framework_log();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

        if (v16)
        {
          v17 = nr_framework_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            uint32_t v20 = v14;
            _os_log_error_impl(&dword_1A356E000, v17, OS_LOG_TYPE_ERROR, "Failed to unregister short lived token with status: (%u)", buf, 8u);
          }
        }
      }
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__NRActiveDeviceAssertionMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E5B002A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

void __46__NRActiveDeviceAssertionMonitor_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 16) count] == 1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      if (*(_DWORD *)(v2 + 8) == -1)
      {
        objc_initWeak(&location, (id)v2);
        uint32_t v3 = *(NSObject **)(v2 + 24);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __53__NRActiveDeviceAssertionMonitor_startObservingToken__block_invoke;
        v8[3] = &unk_1E5B00B80;
        objc_copyWeak(&v9, &location);
        uint32_t v4 = notify_register_dispatch("com.apple.NanoRegistry.NRActiveDeviceAssertion", (int *)(v2 + 8), v3, v8);
        if (v4)
        {
          dispatch_queue_t v5 = nr_framework_log();
          BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

          if (v6)
          {
            v7 = nr_framework_log();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              uint32_t v12 = v4;
              _os_log_error_impl(&dword_1A356E000, v7, OS_LOG_TYPE_ERROR, "Failed to register observer with status: (%u)", buf, 8u);
            }
          }
        }
        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__NRActiveDeviceAssertionMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E5B002A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __49__NRActiveDeviceAssertionMonitor_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      int v3 = *(_DWORD *)(v2 + 8);
      if (v3 != -1)
      {
        uint32_t v4 = notify_cancel(v3);
        if (v4)
        {
          uint32_t v5 = v4;
          id v6 = nr_framework_log();
          BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

          if (v7)
          {
            id v8 = nr_framework_log();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              v9[0] = 67109120;
              v9[1] = v5;
              _os_log_error_impl(&dword_1A356E000, v8, OS_LOG_TYPE_ERROR, "Failed to unregister observer with status: (%u)", (uint8_t *)v9, 8u);
            }
          }
        }
        *(_DWORD *)(v2 + 8) = -1;
      }
    }
  }
}

void __53__NRActiveDeviceAssertionMonitor_startObservingToken__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v9 = WeakRetained;
    id v2 = WeakRetained[2];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      id v6 = MEMORY[0x1E4F14428];
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __64__NRActiveDeviceAssertionMonitor_notifyObserversWithTokenValue___block_invoke;
          block[3] = &unk_1E5B00230;
          block[4] = v8;
          dispatch_async(v6, block);
          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }

    WeakRetained = v9;
  }
}

uint64_t __64__NRActiveDeviceAssertionMonitor_notifyObserversWithTokenValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activeDeviceAssertionStateDidChange];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end