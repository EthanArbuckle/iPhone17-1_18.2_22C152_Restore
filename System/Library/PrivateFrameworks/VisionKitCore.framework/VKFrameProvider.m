@interface VKFrameProvider
- (BOOL)_delegateRespondsToLuminosityChanges;
- (BOOL)_delegateRespondsToStabilityChanges;
- (BOOL)isProcessing;
- (BOOL)isRunning;
- (CGRect)regionOfInterest;
- (OS_dispatch_queue)delegateQueue;
- (UIView)previewView;
- (VKFrameProvider)init;
- (VKFrameProvider)initWithConfiguration:(id)a3;
- (VKFrameProviderConfiguration)configuration;
- (VKFrameProviderDelegate)delegate;
- (void)_commonInit;
- (void)_sendSceneLuminosityChanged;
- (void)_sendSceneStabilityStateChanged;
- (void)lock;
- (void)registerProcessor:(id)a3;
- (void)resetAllProcessors;
- (void)sendFrame:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setRegionOfInterest:(CGRect)a3;
- (void)startProcessing;
- (void)stopProcessing;
- (void)unlock;
- (void)unregisterProcessor:(id)a3;
@end

@implementation VKFrameProvider

- (VKFrameProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)VKFrameProvider;
  v2 = [(VKFrameProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    -[VKFrameProvider _commonInit]((uint64_t)v2);
    v4 = objc_alloc_init(VKFrameProviderConfiguration);
    configuration = v3->_configuration;
    v3->_configuration = v4;
  }
  return v3;
}

- (void)_commonInit
{
  if (a1)
  {
    *(_DWORD *)(a1 + 8) = 0;
    objc_storeStrong((id *)(a1 + 24), MEMORY[0x1E4F14428]);
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    v3 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v2;
  }
}

- (VKFrameProvider)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKFrameProvider;
  v5 = [(VKFrameProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    -[VKFrameProvider _commonInit]((uint64_t)v5);
    if (v4) {
      objc_super v7 = (VKFrameProviderConfiguration *)[v4 copy];
    }
    else {
      objc_super v7 = objc_alloc_init(VKFrameProviderConfiguration);
    }
    configuration = v6->_configuration;
    v6->_configuration = v7;
  }
  return v6;
}

- (VKFrameProviderConfiguration)configuration
{
  [(VKFrameProvider *)self lock];
  v3 = (void *)[(VKFrameProviderConfiguration *)self->_configuration copy];
  [(VKFrameProvider *)self unlock];
  return (VKFrameProviderConfiguration *)v3;
}

- (VKFrameProviderDelegate)delegate
{
  [(VKFrameProvider *)self lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(VKFrameProvider *)self unlock];
  return (VKFrameProviderDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  [(VKFrameProvider *)self lock];
  v3 = self->_delegateQueue;
  [(VKFrameProvider *)self unlock];
  return v3;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "delegate != ((void *)0)", "-[VKFrameProvider setDelegate:queue:]", 0, 0, @"Illegal argument. Delegate must not be nil.");
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "queue != ((void *)0)", "-[VKFrameProvider setDelegate:queue:]", 0, 0, @"Illegal argument. Queue must not be nil.");
    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__VKFrameProvider_setDelegate_queue___block_invoke;
  v11[3] = &unk_1E6BF1268;
  v11[4] = self;
  id v12 = v6;
  id v13 = v8;
  id v9 = v8;
  id v10 = v6;
  vk_performWhileLocked(self, v11);
}

uint64_t __37__VKFrameProvider_setDelegate_queue___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 48));
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = objc_opt_respondsToSelector() & 1;
  uint64_t result = objc_opt_respondsToSelector();
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = result & 1;
  return result;
}

- (void)registerProcessor:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v5 && ([(NSMutableArray *)v4->_processors containsObject:v5] & 1) == 0) {
    [(NSMutableArray *)v4->_processors addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)unregisterProcessor:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v5 && [(NSMutableArray *)v4->_processors containsObject:v5])
  {
    [(NSMutableArray *)v4->_processors removeObject:v5];
    [v5 reset];
  }
  objc_sync_exit(v4);
}

- (BOOL)isRunning
{
  return 0;
}

- (BOOL)isProcessing
{
  [(VKFrameProvider *)self lock];
  BOOL processing = self->_processing;
  [(VKFrameProvider *)self unlock];
  return processing;
}

- (void)startProcessing
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__VKFrameProvider_startProcessing__block_invoke;
  v2[3] = &unk_1E6BF0D18;
  v2[4] = self;
  vk_performWhileLocked(self, v2);
}

uint64_t __34__VKFrameProvider_startProcessing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = 1;
  return result;
}

- (void)stopProcessing
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__VKFrameProvider_stopProcessing__block_invoke;
  v3[3] = &unk_1E6BF0D18;
  v3[4] = self;
  vk_performWhileLocked(self, v3);
  [(VKFrameProvider *)self resetAllProcessors];
}

uint64_t __33__VKFrameProvider_stopProcessing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = 0;
  return result;
}

- (void)resetAllProcessors
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[(NSMutableArray *)self->_processors copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "reset", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (CGRect)regionOfInterest
{
  [(VKFrameProvider *)self lock];
  CGFloat x = self->_regionOfInterest.origin.x;
  CGFloat y = self->_regionOfInterest.origin.y;
  CGFloat width = self->_regionOfInterest.size.width;
  CGFloat height = self->_regionOfInterest.size.height;
  [(VKFrameProvider *)self unlock];
  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)setRegionOfInterest:(CGRect)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__VKFrameProvider_setRegionOfInterest___block_invoke;
  v3[3] = &unk_1E6BF2720;
  v3[4] = self;
  CGRect v4 = a3;
  vk_performWhileLocked(self, v3);
}

__n128 __39__VKFrameProvider_setRegionOfInterest___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 56);
  *(__n128 *)(v1 + 80) = result;
  *(_OWORD *)(v1 + 96) = v3;
  return result;
}

- (void)sendFrame:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 info];
  unint64_t v6 = [v5 sceneStability];

  unint64_t sceneStabilityState = self->_sceneStabilityState;
  if (v6 != sceneStabilityState)
  {
    self->_unint64_t sceneStabilityState = v6;
    -[VKFrameProvider _sendSceneStabilityStateChanged]((uint64_t)self);
  }
  double v8 = [v4 info];
  [v8 luminosity];
  double v10 = v9;

  if (vabdd_f64(v10, self->_sceneLuminosity) >= 0.01)
  {
    self->_sceneLuminositCGFloat y = v10;
    -[VKFrameProvider _sendSceneLuminosityChanged]((uint64_t)self);
  }
  if ([(VKFrameProvider *)self isProcessing])
  {
    long long v11 = (void *)[(NSMutableArray *)self->_processors copy];
    id v12 = v11;
    if (v6 == 1)
    {
      if (sceneStabilityState == 1)
      {
LABEL_24:

        goto LABEL_25;
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * i) reset];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v15);
      }
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v18 = v11;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "enqueueFrame:", v4, (void)v23);
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v20);
      }
    }

    goto LABEL_24;
  }
LABEL_25:
}

- (void)_sendSceneStabilityStateChanged
{
  if (a1)
  {
    [(id)a1 lock];
    int v2 = *(unsigned __int8 *)(a1 + 48);
    [(id)a1 unlock];
    if (v2)
    {
      long long v3 = *(void **)(a1 + 56);
      objc_initWeak(&location, (id)a1);
      id v4 = [(id)a1 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__VKFrameProvider__sendSceneStabilityStateChanged__block_invoke;
      block[3] = &unk_1E6BF21B8;
      objc_copyWeak(v6, &location);
      v6[1] = v3;
      dispatch_async(v4, block);

      objc_destroyWeak(v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_sendSceneLuminosityChanged
{
  if (a1)
  {
    [(id)a1 lock];
    int v2 = *(unsigned __int8 *)(a1 + 49);
    [(id)a1 unlock];
    if (v2)
    {
      long long v3 = *(void **)(a1 + 64);
      objc_initWeak(&location, (id)a1);
      id v4 = [(id)a1 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__VKFrameProvider__sendSceneLuminosityChanged__block_invoke;
      block[3] = &unk_1E6BF21B8;
      objc_copyWeak(v6, &location);
      v6[1] = v3;
      dispatch_async(v4, block);

      objc_destroyWeak(v6);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_delegateRespondsToStabilityChanges
{
  if (!a1) {
    return 0;
  }
  [a1 lock];
  BOOL v2 = a1[48] != 0;
  [a1 unlock];
  return v2;
}

- (BOOL)_delegateRespondsToLuminosityChanges
{
  if (!a1) {
    return 0;
  }
  [a1 lock];
  BOOL v2 = a1[49] != 0;
  [a1 unlock];
  return v2;
}

void __50__VKFrameProvider__sendSceneStabilityStateChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    long long v3 = [WeakRetained delegate];
    [v3 frameProvider:v4 didChangeSceneStabilityState:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

void __46__VKFrameProvider__sendSceneLuminosityChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    long long v3 = [WeakRetained delegate];
    [v3 frameProvider:v4 didChangeSceneLuminosity:*(double *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (void)lock
{
}

- (void)unlock
{
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_processors, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end