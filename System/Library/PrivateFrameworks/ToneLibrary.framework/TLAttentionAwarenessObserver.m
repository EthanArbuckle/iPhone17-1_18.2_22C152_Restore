@interface TLAttentionAwarenessObserver
+ (BOOL)supportsAttenuatingTonesForAttentionDetected;
+ (TLAttentionAwarenessObserver)sharedAttentionAwarenessObserver;
- (TLAttentionAwarenessObserver)init;
- (id)pollForAttentionWithEventHandler:(id)a3;
- (void)_assertNotRunningOnAccessQueue;
- (void)_assertRunningOnAccessQueue;
- (void)_beginPollingForAttention;
- (void)_didCompleteInitialization;
- (void)_didReceiveAttentionPollingEventOfType:(unint64_t)a3 attentionEvent:(id)a4;
- (void)_endPollingForAttention;
- (void)_invokePollingForAttentionEventHandlers:(id)a3 eventType:(int64_t)a4;
- (void)cancelPollForAttentionWithToken:(id)a3;
- (void)dealloc;
@end

@implementation TLAttentionAwarenessObserver

+ (TLAttentionAwarenessObserver)sharedAttentionAwarenessObserver
{
  if (sharedAttentionAwarenessObserver__TLAttentionAwarenessObserverSharedInstanceOnceToken != -1) {
    dispatch_once(&sharedAttentionAwarenessObserver__TLAttentionAwarenessObserverSharedInstanceOnceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedAttentionAwarenessObserver__TLAttentionAwarenessObserverSharedInstance;

  return (TLAttentionAwarenessObserver *)v2;
}

uint64_t __64__TLAttentionAwarenessObserver_sharedAttentionAwarenessObserver__block_invoke()
{
  sharedAttentionAwarenessObserver__TLAttentionAwarenessObserverSharedInstance = objc_alloc_init(TLAttentionAwarenessObserver);

  return MEMORY[0x1F41817F8]();
}

- (TLAttentionAwarenessObserver)init
{
  v23.receiver = self;
  v23.super_class = (Class)TLAttentionAwarenessObserver;
  v2 = [(TLAttentionAwarenessObserver *)&v23 init];
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

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pollingForAttentionEventHandlers = v2->_pollingForAttentionEventHandlers;
    v2->_pollingForAttentionEventHandlers = v11;

    id v13 = [NSString stringWithFormat:@"%@.%@-%@", v6, v4, @"AttentionAwarenessClientQueue"];
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    attentionAwarenessClientQueue = v2->_attentionAwarenessClientQueue;
    v2->_attentionAwarenessClientQueue = (OS_dispatch_queue *)v14;

    v16 = +[TLCapabilitiesManager sharedCapabilitiesManager];
    char v17 = [v16 isHomePod];

    if ((v17 & 1) == 0)
    {
      v18 = v2->_attentionAwarenessClientQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__TLAttentionAwarenessObserver_init__block_invoke;
      block[3] = &unk_1E6C20CC0;
      id v21 = v6;
      v22 = v2;
      dispatch_async(v18, block);
    }
  }
  return v2;
}

void __36__TLAttentionAwarenessObserver_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)getAWAttentionAwarenessConfigurationClass());
  [v2 setEventMask:128];
  [v2 setIdentifier:*(void *)(a1 + 32)];
  v3 = [MEMORY[0x1E4F1CAD0] set];
  [v2 setAttentionLostTimeouts:v3];

  [v2 setPollingFilter:1];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v4 = (void *)getAWAttentionAwarenessClientClass_softClass;
  uint64_t v17 = getAWAttentionAwarenessClientClass_softClass;
  if (!getAWAttentionAwarenessClientClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getAWAttentionAwarenessClientClass_block_invoke;
    v13[3] = &unk_1E6C210C8;
    v13[4] = &v14;
    __getAWAttentionAwarenessClientClass_block_invoke((uint64_t)v13);
    v4 = (void *)v15[3];
  }
  v5 = v4;
  _Block_object_dispose(&v14, 8);
  id v6 = objc_alloc_init(v5);
  [v6 setConfiguration:v2];
  uint64_t v7 = *(void **)(a1 + 40);
  v8 = v7[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__TLAttentionAwarenessObserver_init__block_invoke_2;
  block[3] = &unk_1E6C20CC0;
  v11 = v7;
  id v12 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

uint64_t __36__TLAttentionAwarenessObserver_init__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = TLLogPlayback();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1DB936000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: -init: Created %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  return [*(id *)(a1 + 32) _didCompleteInitialization];
}

- (void)dealloc
{
  uint64_t v3 = self->_accessQueue;
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__5;
  id v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__TLAttentionAwarenessObserver_dealloc__block_invoke;
  block[3] = &unk_1E6C21CD0;
  void block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync((dispatch_queue_t)v3, block);
  if (v16[5])
  {
    attentionAwarenessClientQueue = self->_attentionAwarenessClientQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__TLAttentionAwarenessObserver_dealloc__block_invoke_2;
    v7[3] = &unk_1E6C20D10;
    v7[4] = self;
    v7[5] = &v15;
    dispatch_async(attentionAwarenessClientQueue, v7);
  }
  [(TLAttentionAwarenessObserver *)self _invokePollingForAttentionEventHandlers:v10[5] eventType:0];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  v6.receiver = self;
  v6.super_class = (Class)TLAttentionAwarenessObserver;
  [(TLAttentionAwarenessObserver *)&v6 dealloc];
}

uint64_t __39__TLAttentionAwarenessObserver_dealloc__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 33))
  {
    [(id)v2 _endPollingForAttention];
    uint64_t v2 = a1[4];
  }
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(v2 + 40));
  uint64_t v3 = [*(id *)(a1[4] + 24) allValues];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(a1[6] + 8);
  objc_super v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(a1[4] + 24);

  return [v7 removeAllObjects];
}

void __39__TLAttentionAwarenessObserver_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v12 = 0;
  int v3 = [v2 invalidateWithError:&v12];
  id v4 = v12;
  uint64_t v5 = TLLogPlayback();
  objc_super v6 = v5;
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -dealloc: Successfully invalidated %{public}@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 1024;
    int v18 = v3;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_1DB936000, v6, OS_LOG_TYPE_ERROR, "%{public}@: -dealloc: -invalidateWithError: on %{public}@ returned didSucceed = %{BOOL}d and error = %{public}@.", buf, 0x26u);
  }
}

+ (BOOL)supportsAttenuatingTonesForAttentionDetected
{
  uint64_t v2 = +[TLCapabilitiesManager sharedCapabilitiesManager];
  char v3 = [v2 isHomePod];

  if (v3) {
    LOBYTE(v4) = 0;
  }
  else {
    return ((unint64_t)[getAWAttentionAwarenessConfigurationClass() supportedEvents] >> 7) & 1;
  }
  return v4;
}

- (id)pollForAttentionWithEventHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  objc_super v6 = [v5 UUIDString];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__TLAttentionAwarenessObserver_pollForAttentionWithEventHandler___block_invoke;
  block[3] = &unk_1E6C21CF8;
  void block[4] = self;
  id v15 = v4;
  id v8 = v6;
  id v14 = v8;
  id v9 = v4;
  dispatch_async(accessQueue, block);
  uint64_t v10 = v14;
  id v11 = v8;

  return v11;
}

unsigned char *__65__TLAttentionAwarenessObserver_pollForAttentionWithEventHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  char v3 = (void *)[*(id *)(a1 + 48) copy];
  id v4 = (void *)MEMORY[0x1E0195470]();
  [v2 setObject:v4 forKey:*(void *)(a1 + 40)];

  result = *(unsigned char **)(a1 + 32);
  if (result[32] && !result[33])
  {
    return (unsigned char *)[result _beginPollingForAttention];
  }
  return result;
}

- (void)cancelPollForAttentionWithToken:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__TLAttentionAwarenessObserver_cancelPollForAttentionWithToken___block_invoke;
  v7[3] = &unk_1E6C20CC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __64__TLAttentionAwarenessObserver_cancelPollForAttentionWithToken___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 32))
  {
    if (*(unsigned char *)(v3 + 33))
    {
      uint64_t result = [*(id *)(v3 + 24) count];
      if (!result)
      {
        id v4 = *(void **)(a1 + 32);
        return [v4 _endPollingForAttention];
      }
    }
  }
  return result;
}

- (void)_beginPollingForAttention
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1DB936000, v0, v1, "%{public}@: -_beginPollingForAttention: Not fully initialized yet.", v2, v3, v4, v5, v6);
}

void __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke(uint64_t a1)
{
  v37[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v31 = 0;
  int v3 = [v2 resumeWithError:&v31];
  id v4 = v31;
  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = v3;
  }
  uint8_t v6 = TLLogPlayback();
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = *(double *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v8;
      __int16 v34 = 2114;
      double v35 = v9;
      _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginPollingForAttention: Successfully resumed %{public}@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    double v25 = *(double *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v33 = v24;
    __int16 v34 = 2114;
    double v35 = v25;
    __int16 v36 = 1024;
    LODWORD(v37[0]) = v3;
    WORD2(v37[0]) = 2114;
    *(void *)((char *)v37 + 6) = v4;
    _os_log_error_impl(&dword_1DB936000, v7, OS_LOG_TYPE_ERROR, "%{public}@: -_beginPollingForAttention: -resumeWithError: on %{public}@ returned didSucceed = %{BOOL}d and error = %{public}@.", buf, 0x26u);
  }

  uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v10 timeIntervalSinceNow];
  double v12 = v11;

  id v13 = TLLogPlayback();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v33 = v14;
    __int16 v34 = 2048;
    double v35 = v12;
    __int16 v36 = 2114;
    v37[0] = v15;
    _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginPollingForAttention: Will begin polling for attention until distant future (%f) with %{public}@.", buf, 0x20u);
  }

  uint64_t v16 = *(void **)(a1 + 32);
  __int16 v17 = dispatch_get_global_queue(2, 0);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke_19;
  v29[3] = &unk_1E6C21D20;
  objc_copyWeak(&v30, (id *)(a1 + 48));
  id v28 = 0;
  int v18 = [v16 pollForAttentionWithTimeout:v17 queue:v29 block:&v28 error:v12];
  id v19 = v28;

  if (v19) {
    int v20 = 0;
  }
  else {
    int v20 = v18;
  }
  if (v20 == 1)
  {
    uint64_t v21 = TLLogPlayback();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = *(double *)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v22;
      __int16 v34 = 2114;
      double v35 = v23;
      _os_log_impl(&dword_1DB936000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginPollingForAttention: Did begin polling successfully from %{public}@.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v21 = TLLogPlayback();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      double v27 = *(double *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      uint64_t v33 = v26;
      __int16 v34 = 2114;
      double v35 = v27;
      __int16 v36 = 1024;
      LODWORD(v37[0]) = v18;
      WORD2(v37[0]) = 2114;
      *(void *)((char *)v37 + 6) = v19;
      _os_log_error_impl(&dword_1DB936000, v21, OS_LOG_TYPE_ERROR, "%{public}@: -_beginPollingForAttention: -pollForAttentionWithTimeout:error: on %{public}@ returned didSucceedInitializingPoll = %{BOOL}d and errorPolling = %{public}@.", buf, 0x26u);
    }
  }

  objc_destroyWeak(&v30);
}

void __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = (void *)*((void *)WeakRetained + 1);
    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke_2;
      block[3] = &unk_1E6C21358;
      void block[4] = WeakRetained;
      uint64_t v12 = a2;
      id v11 = v5;
      double v9 = v8;
      dispatch_async(v9, block);
    }
  }
}

uint64_t __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveAttentionPollingEventOfType:*(void *)(a1 + 48) attentionEvent:*(void *)(a1 + 40)];
}

- (void)_endPollingForAttention
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1DB936000, v0, v1, "%{public}@: -_endPollingForAttention: Not fully initialized yet.", v2, v3, v4, v5, v6);
}

void __55__TLAttentionAwarenessObserver__endPollingForAttention__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v22 = 0;
  int v3 = [v2 cancelPollForAttentionWithError:&v22];
  id v4 = v22;
  uint64_t v5 = TLLogPlayback();
  uint8_t v6 = v5;
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v10;
      __int16 v25 = 2114;
      uint64_t v26 = v11;
      _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPollingForAttention: Successfully cancelled poll for attention on %{public}@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v24 = v8;
    __int16 v25 = 2114;
    uint64_t v26 = v9;
    __int16 v27 = 1024;
    int v28 = v3;
    __int16 v29 = 2114;
    id v30 = v4;
    _os_log_error_impl(&dword_1DB936000, v6, OS_LOG_TYPE_ERROR, "%{public}@: -_endPollingForAttention: -cancelPollForAttentionWithError: on %{public}@ returned didSucceed = %{BOOL}d and error = %{public}@.", buf, 0x26u);
  }

  uint64_t v12 = *(void **)(a1 + 32);
  id v21 = 0;
  int v13 = [v12 suspendWithError:&v21];
  id v14 = v21;
  uint64_t v15 = TLLogPlayback();
  uint64_t v16 = v15;
  if (!v13 || v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      uint64_t v24 = v19;
      __int16 v25 = 2114;
      uint64_t v26 = v20;
      __int16 v27 = 1024;
      int v28 = v13;
      __int16 v29 = 2114;
      id v30 = v14;
      _os_log_error_impl(&dword_1DB936000, v16, OS_LOG_TYPE_ERROR, "%{public}@: -_endPollingForAttention: -suspendWithError: on %{public}@ returned didSucceed = %{BOOL}d and error = %{public}@.", buf, 0x26u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v17;
    __int16 v25 = 2114;
    uint64_t v26 = v18;
    _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPollingForAttention: Successfully suspended %{public}@.", buf, 0x16u);
  }
}

- (void)_didReceiveAttentionPollingEventOfType:(unint64_t)a3 attentionEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(TLAttentionAwarenessObserver *)self _assertRunningOnAccessQueue];
  BOOL v7 = TLLogPlayback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543874;
    id v14 = self;
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didReceiveAttentionPollingEventOfType:(%ld) attentionEvent:(%{public}@).", (uint8_t *)&v13, 0x20u);
  }

  if (a3 == 2)
  {
    uint64_t v8 = 1;
    int v9 = 1;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    uint64_t v8 = 0;
    int v9 = 0;
LABEL_7:
    int v10 = 1;
    goto LABEL_9;
  }
  uint64_t v8 = 0;
  int v9 = 0;
  int v10 = 0;
LABEL_9:
  uint64_t v11 = [(NSMutableDictionary *)self->_pollingForAttentionEventHandlers allValues];
  uint64_t v12 = (void *)[v11 copy];

  if (v9)
  {
    if (self->_isPollingForAttention) {
      [(TLAttentionAwarenessObserver *)self _endPollingForAttention];
    }
    [(NSMutableDictionary *)self->_pollingForAttentionEventHandlers removeAllObjects];
  }
  if (v10) {
    [(TLAttentionAwarenessObserver *)self _invokePollingForAttentionEventHandlers:v12 eventType:v8];
  }
}

- (void)_didCompleteInitialization
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1DB936000, v0, v1, "%{public}@: -_didCompleteInitialization: Already fully initialized.", v2, v3, v4, v5, v6);
}

- (void)_invokePollingForAttentionEventHandlers:(id)a3 eventType:(int64_t)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    uint8_t v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__TLAttentionAwarenessObserver__invokePollingForAttentionEventHandlers_eventType___block_invoke;
    v7[3] = &unk_1E6C21058;
    id v8 = v5;
    int64_t v9 = a4;
    dispatch_async(v6, v7);
  }
}

void __82__TLAttentionAwarenessObserver__invokePollingForAttentionEventHandlers_eventType___block_invoke(uint64_t a1)
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
        long long v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLAttentionAwarenessObserver.m"];
        long long v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          long long v9 = [v7 lastPathComponent];
          int v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v12 = 136381443;
          int v13 = "-[TLAttentionAwarenessObserver _assertRunningOnAccessQueue]";
          __int16 v14 = 2113;
          __int16 v15 = v9;
          __int16 v16 = 2049;
          uint64_t v17 = 290;
          __int16 v18 = 2113;
          uint64_t v19 = v10;
          _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);
        }
      }
      else
      {
        long long v7 = TLLogGeneral();
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
      uint64_t v5 = TLLogGeneral();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        long long v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLAttentionAwarenessObserver.m"];
        long long v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          long long v9 = [v7 lastPathComponent];
          int v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v12 = 136381443;
          int v13 = "-[TLAttentionAwarenessObserver _assertNotRunningOnAccessQueue]";
          __int16 v14 = 2113;
          __int16 v15 = v9;
          __int16 v16 = 2049;
          uint64_t v17 = 298;
          __int16 v18 = 2113;
          uint64_t v19 = v10;
          _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);
        }
      }
      else
      {
        long long v7 = TLLogGeneral();
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
  objc_storeStrong((id *)&self->_attentionAwarenessClientQueue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_pollingForAttentionEventHandlers, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end