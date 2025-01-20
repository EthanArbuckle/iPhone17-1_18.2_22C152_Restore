@interface STKUserEventMonitor
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (BOOL)isEnabled;
- (STKUserEventMonitor)init;
- (STKUserEventMonitorDelegate)delegate;
- (id)_initWithAttentionAwarenessClient:(id)a3;
- (id)_queue;
- (void)_queue_handleAttentionAwarenessEvent:(id)a3;
- (void)_resume;
- (void)_suspend;
- (void)dealloc;
- (void)invalidate;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation STKUserEventMonitor

- (id)_initWithAttentionAwarenessClient:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"STKUserEventMonitor.m", 26, @"Invalid parameter not satisfying: %@", @"awClient" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)STKUserEventMonitor;
  v7 = [(STKUserEventMonitor *)&v19 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_attentionAwarenessClient, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.stk.AttentionAwareQueue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    id v11 = objc_alloc_init(MEMORY[0x263F28870]);
    [v11 setEventMask:14];
    [v11 setIdentifier:@"SIMToolkit"];
    [v11 setAttentionLostTimeout:0.01];
    [(AWAttentionAwarenessClient *)v8->_attentionAwarenessClient setConfiguration:v11 shouldReset:1];
    objc_initWeak(&location, v8);
    attentionAwarenessClient = v8->_attentionAwarenessClient;
    v13 = v8->_queue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __57__STKUserEventMonitor__initWithAttentionAwarenessClient___block_invoke;
    v16[3] = &unk_2645F4828;
    objc_copyWeak(&v17, &location);
    [(AWAttentionAwarenessClient *)attentionAwarenessClient setEventHandlerWithQueue:v13 block:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __57__STKUserEventMonitor__initWithAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_queue_handleAttentionAwarenessEvent:", v3);
}

- (STKUserEventMonitor)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F28868]);
  v4 = [(STKUserEventMonitor *)self _initWithAttentionAwarenessClient:v3];

  return v4;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"STKUserEventMonitor.m" lineNumber:52 description:@"Monitor must be invalidated before it can deallocate."];
  }
  v5.receiver = self;
  v5.super_class = (Class)STKUserEventMonitor;
  [(STKUserEventMonitor *)&v5 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  if (!self->_invalidated && self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3) {
      [(STKUserEventMonitor *)self _resume];
    }
    else {
      [(STKUserEventMonitor *)self _suspend];
    }
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221DC0000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Invalidating attention monitor.", buf, 2u);
    }
    [(STKUserEventMonitor *)self setEnabled:0];
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__STKUserEventMonitor_invalidate__block_invoke;
    block[3] = &unk_2645F4458;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __33__STKUserEventMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) invalidateWithError:0];
}

- (id)_queue
{
  return self->_queue;
}

- (void)_queue_handleAttentionAwarenessEvent:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssert();
  char v5 = [v4 eventMask];

  if ((v5 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained userEventDidOccur:self];

    attentionAwarenessClient = self->_attentionAwarenessClient;
    id v9 = 0;
    LOBYTE(WeakRetained) = [(AWAttentionAwarenessClient *)attentionAwarenessClient resetAttentionLostTimeoutWithError:&v9];
    id v8 = v9;
    if ((WeakRetained & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_221DC0000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unable to reset attention lost timeout due to error: %{public}@", buf, 0xCu);
    }
  }
}

- (void)_resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__STKUserEventMonitor__resume__block_invoke;
  block[3] = &unk_2645F4458;
  block[4] = self;
  dispatch_async(queue, block);
}

void __30__STKUserEventMonitor__resume__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DC0000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Resuming attention monitor.", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = a1 + 32;
  id v4 = *(void **)(v3 + 40);
  id v7 = 0;
  char v5 = [v4 resumeWithError:&v7];
  id v6 = v7;
  if ((v5 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __30__STKUserEventMonitor__resume__block_invoke_cold_1(v2);
  }
}

- (void)_suspend
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__STKUserEventMonitor__suspend__block_invoke;
  block[3] = &unk_2645F4458;
  block[4] = self;
  dispatch_async(queue, block);
}

void __31__STKUserEventMonitor__suspend__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DC0000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Suspending attention monitor.", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = a1 + 32;
  id v4 = *(void **)(v3 + 40);
  id v7 = 0;
  char v5 = [v4 suspendWithError:&v7];
  id v6 = v7;
  if ((v5 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __31__STKUserEventMonitor__suspend__block_invoke_cold_1(v2);
  }
}

- (STKUserEventMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STKUserEventMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_queue_configuration, 0);
}

void __30__STKUserEventMonitor__resume__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(*(void *)a1 + 8) identifier];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_221DC0000, &_os_log_internal, OS_LOG_TYPE_ERROR, "attention client %{public}@ cannot resume; error: %{public}@",
    v2,
    0x16u);
}

void __31__STKUserEventMonitor__suspend__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(*(void *)a1 + 8) identifier];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_221DC0000, &_os_log_internal, OS_LOG_TYPE_ERROR, "attention client %{public}@ cannot suspend; error: %{public}@",
    v2,
    0x16u);
}

@end