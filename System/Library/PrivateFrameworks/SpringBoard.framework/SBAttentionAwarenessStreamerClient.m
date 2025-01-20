@interface SBAttentionAwarenessStreamerClient
- (AWAttentionAwarenessConfiguration)configuration;
- (SBAttentionAwarenessStreamerClient)init;
- (SBAttentionAwarenessStreamerClientDelegate)delegate;
- (void)_handleAttentionAwarenessEvent:(id)a3;
- (void)invalidate;
- (void)resume;
- (void)setConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBAttentionAwarenessStreamerClient

- (SBAttentionAwarenessStreamerClient)init
{
  v15.receiver = self;
  v15.super_class = (Class)SBAttentionAwarenessStreamerClient;
  id v2 = [(SBAttentionAwarenessStreamerClient *)&v15 init];
  if (v2)
  {
    uint64_t v3 = +[SBScreenLongevityDomain rootSettings];
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F4E700]);
    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.springboard.AttentionAwareStreamerQueue", 0);
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    objc_initWeak(&location, v2);
    v9 = (void *)*((void *)v2 + 4);
    uint64_t v10 = *((void *)v2 + 5);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__SBAttentionAwarenessStreamerClient_init__block_invoke;
    v12[3] = &unk_1E6AF9328;
    objc_copyWeak(&v13, &location);
    [v9 setEventStreamerWithQueue:v10 block:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (SBAttentionAwarenessStreamerClient *)v2;
}

void __42__SBAttentionAwarenessStreamerClient_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SBAttentionAwarenessStreamerClient_init__block_invoke_2;
  v5[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __42__SBAttentionAwarenessStreamerClient_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAttentionAwarenessEvent:*(void *)(a1 + 32)];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SBAttentionAwarenessStreamerClient_invalidate__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __48__SBAttentionAwarenessStreamerClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogIdleTimer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "attention client INVALIDATE %{public}@", buf, 0xCu);
  }

  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = 0;
  char v5 = [v4 invalidateWithError:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    id v7 = SBLogIdleTimer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __40__SBAttentionAwarenessClient_invalidate__block_invoke_cold_1();
    }
  }
}

- (AWAttentionAwarenessConfiguration)configuration
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__77;
  uint64_t v10 = __Block_byref_object_dispose__77;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBAttentionAwarenessStreamerClient_configuration__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AWAttentionAwarenessConfiguration *)v3;
}

void __51__SBAttentionAwarenessStreamerClient_configuration__block_invoke(uint64_t a1)
{
}

- (void)setConfiguration:(id)a3
{
}

- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SBAttentionAwarenessStreamerClient_setConfiguration_shouldReset___block_invoke;
  block[3] = &unk_1E6AF5770;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(queue, block);
}

uint64_t __67__SBAttentionAwarenessStreamerClient_setConfiguration_shouldReset___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) identifier];
  if (v2) {
    objc_setProperty_atomic_copy(v2, v3, v4, 48);
  }

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  uint64_t v8 = *(void *)(a1 + 40);
  v9 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
  return [v9 setConfiguration:v8 shouldReset:v10];
}

- (void)resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SBAttentionAwarenessStreamerClient_resume__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__SBAttentionAwarenessStreamerClient_resume__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogIdleTimer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "attention client RESUME %{public}@", buf, 0xCu);
  }

  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = 0;
  char v5 = [v4 resumeWithError:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    id v7 = SBLogIdleTimer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __37__SBAttentionAwarenessClient__resume__block_invoke_cold_1();
    }
  }
}

- (void)_handleAttentionAwarenessEvent:(id)a3
{
  id v16 = a3;
  if (([v16 eventMask] & 0x80) != 0)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = v16;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      [v7 attentionScore];
      double v9 = v8;
      [v7 faceDetectionScore];
      double v11 = v10;
      if (SBFIsIRDCResetAvailable())
      {
        [(SBScreenLongevitySettings *)self->_settings attentionScoreThreshold];
        if (v12 >= v9) {
          CARenderServerFlushIRDC();
        }
      }
      [(SBScreenLongevitySettings *)self->_settings faceDetectionScoreThreshold];
      if (v13 <= v11)
      {
        [(SBScreenLongevitySettings *)self->_settings attentionScoreThreshold];
        if (v14 <= v9)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained streamerClientDidResetForUserAttention:self];
        }
      }
    }
  }
}

- (SBAttentionAwarenessStreamerClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAttentionAwarenessStreamerClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_queue_configuration, 0);
}

@end