@interface SBAttentionAwarenessClient
- (AWAttentionAwarenessConfiguration)configuration;
- (BOOL)isEnabled;
- (SBAttentionAwarenessClient)init;
- (SBAttentionAwarenessClientDelegate)delegate;
- (id)identifier;
- (void)_handleAttentionAwarenessEvent:(id)a3;
- (void)_resetAttentionLostTimeout;
- (void)_resume;
- (void)_suspend;
- (void)invalidate;
- (void)setConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(void *)a1;
@end

@implementation SBAttentionAwarenessClient

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setDelegate:(id)a3
{
}

- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SBAttentionAwarenessClient_setConfiguration_shouldReset___block_invoke;
  block[3] = &unk_1E6AF5770;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)setConfiguration:(id)a3
{
}

- (SBAttentionAwarenessClient)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBAttentionAwarenessClient;
  id v2 = [(SBAttentionAwarenessClient *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F4E700]);
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.springboard.AttentionAwareQueue", 0);
    id v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    objc_initWeak(&location, v2);
    v7 = (void *)*((void *)v2 + 4);
    uint64_t v8 = *((void *)v2 + 5);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__SBAttentionAwarenessClient_init__block_invoke;
    v10[3] = &unk_1E6AF9328;
    objc_copyWeak(&v11, &location);
    [v7 setEventHandlerWithQueue:v8 block:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return (SBAttentionAwarenessClient *)v2;
}

uint64_t __59__SBAttentionAwarenessClient_setConfiguration_shouldReset___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) identifier];
  if (v2) {
    objc_setProperty_atomic_copy(v2, v3, v4, 48);
  }

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  uint64_t v8 = *(void *)(a1 + 40);
  v9 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
  return [v9 setConfiguration:v8 shouldReset:v10];
}

void __34__SBAttentionAwarenessClient_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SBAttentionAwarenessClient_init__block_invoke_2;
  v5[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __34__SBAttentionAwarenessClient_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAttentionAwarenessEvent:*(void *)(a1 + 32)];
}

- (void)_handleAttentionAwarenessEvent:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([v4 eventMask])
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v4;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      [v10 attentionLostTimeout];
      double v12 = v11;
      objc_super v13 = [v10 tag];
      uint64_t v14 = objc_opt_class();
      id v15 = v13;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
      v17 = v16;

      if (v17)
      {
        uint64_t v18 = [v17 unsignedIntegerValue];
      }
      else
      {
        v19 = SBLogIdleTimer();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SBAttentionAwarenessClient _handleAttentionAwarenessEvent:](v10, v19);
        }

        uint64_t v18 = 0;
      }
      v20 = [v10 associatedObject];
      [WeakRetained client:self attentionLostTimeoutDidExpire:v18 forConfigurationGeneration:v20 withAssociatedObject:v12];
    }
    else
    {
      v17 = SBLogIdleTimer();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SBAttentionAwarenessClient _handleAttentionAwarenessEvent:]();
      }
    }
  }
  else
  {
    id v6 = SBLogIdleTimer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBAttentionAwarenessClient _handleAttentionAwarenessEvent:]();
    }

    [WeakRetained clientDidResetForUserAttention:self withEvent:v4];
  }
}

- (void)_handleAttentionAwarenessEvent:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 tag];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "attention client lost event tag is not a number: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SBAttentionAwarenessClient_invalidate__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __40__SBAttentionAwarenessClient_invalidate__block_invoke(uint64_t a1)
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

  int v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = 0;
  char v5 = [v4 invalidateWithError:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = SBLogIdleTimer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __40__SBAttentionAwarenessClient_invalidate__block_invoke_cold_1();
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3) {
      [(SBAttentionAwarenessClient *)self _resume];
    }
    else {
      [(SBAttentionAwarenessClient *)self _suspend];
    }
  }
}

- (AWAttentionAwarenessConfiguration)configuration
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__77;
  uint64_t v10 = __Block_byref_object_dispose__77;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SBAttentionAwarenessClient_configuration__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AWAttentionAwarenessConfiguration *)v3;
}

void __43__SBAttentionAwarenessClient_configuration__block_invoke(uint64_t a1)
{
}

- (void)setIdentifier:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic_copy(a1, newValue, newValue, 48);
  }
}

- (void)_resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SBAttentionAwarenessClient__resume__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__SBAttentionAwarenessClient__resume__block_invoke(uint64_t a1)
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

  int v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = 0;
  char v5 = [v4 resumeWithError:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = SBLogIdleTimer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __37__SBAttentionAwarenessClient__resume__block_invoke_cold_1();
    }
  }
}

- (void)_suspend
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBAttentionAwarenessClient__suspend__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__SBAttentionAwarenessClient__suspend__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogIdleTimer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "attention client SUSPEND %{public}@", buf, 0xCu);
  }

  int v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = 0;
  char v5 = [v4 suspendWithError:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = SBLogIdleTimer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __38__SBAttentionAwarenessClient__suspend__block_invoke_cold_1();
    }
  }
}

- (void)_resetAttentionLostTimeout
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SBAttentionAwarenessClient__resetAttentionLostTimeout__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__SBAttentionAwarenessClient__resetAttentionLostTimeout__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogIdleTimer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "attention client RESET %{public}@", buf, 0xCu);
  }

  int v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = 0;
  char v5 = [v4 resetAttentionLostTimeoutWithError:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = SBLogIdleTimer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__SBAttentionAwarenessClient__resetAttentionLostTimeout__block_invoke_cold_1();
    }
  }
}

- (id)identifier
{
  if (result) {
    return objc_getProperty(result, a2, 48, 1);
  }
  return result;
}

- (SBAttentionAwarenessClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAttentionAwarenessClientDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue_configuration, 0);
}

void __40__SBAttentionAwarenessClient_invalidate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_3();
  v1 = [(id)OUTLINED_FUNCTION_2_12(v0) identifier];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "attention client %{public}@ cannot invalidate; error:%{public}@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void __37__SBAttentionAwarenessClient__resume__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_3();
  v1 = [(id)OUTLINED_FUNCTION_2_12(v0) identifier];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "attention client %{public}@ cannot resume; error:%{public}@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void __38__SBAttentionAwarenessClient__suspend__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_3();
  v1 = [(id)OUTLINED_FUNCTION_2_12(v0) identifier];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "attention client %{public}@ cannot suspend; error:%{public}@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void __56__SBAttentionAwarenessClient__resetAttentionLostTimeout__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_3();
  v1 = [(id)OUTLINED_FUNCTION_2_12(v0) identifier];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "attention client %{public}@ cannot reset; error:%{public}@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

- (void)_handleAttentionAwarenessEvent:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (Property) {
    id Property = objc_getProperty(Property, v2, 48, 1);
  }
  id v3 = OUTLINED_FUNCTION_4_3(Property);
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "attention event [%{public}@]: %{public}@", v4, 0x16u);
}

- (void)_handleAttentionAwarenessEvent:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  if (Property) {
    id Property = objc_getProperty(Property, v1, 48, 1);
  }
  id v2 = OUTLINED_FUNCTION_4_3(Property);
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v3, v4, "attention event [%{public}@]: expected AWAttentionLostEvent instead of %{public}@", v5, v6, v7, v8, v9);
}

@end