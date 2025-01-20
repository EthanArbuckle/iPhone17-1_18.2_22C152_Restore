@interface MSClientSidePauseContext
- (MSClientSidePauseContext)initWithServer:(id)a3;
- (MSTimerGate)gate;
- (NSXPCConnection)server;
- (OS_dispatch_queue)timerQueue;
- (void)resume;
- (void)setGate:(id)a3;
- (void)setServer:(id)a3;
- (void)setTimerQueue:(id)a3;
- (void)timerQueuePing;
- (void)timerQueueTimerFired;
@end

@implementation MSClientSidePauseContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gate, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setGate:(id)a3
{
}

- (MSTimerGate)gate
{
  return self->_gate;
}

- (void)setServer:(id)a3
{
}

- (NSXPCConnection)server
{
  return self->_server;
}

- (void)setTimerQueue:(id)a3
{
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)timerQueuePing
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Pause context %p pinging server.", (uint8_t *)&v5, 0xCu);
  }
  v3 = [(MSClientSidePauseContext *)self server];
  v4 = [v3 remoteObjectProxy];
  [v4 pauseForUUID:self->_UUID];
}

- (void)timerQueueTimerFired
{
  v3 = [(MSClientSidePauseContext *)self gate];
  int v4 = [v3 enabled];

  if (v4)
  {
    [(MSClientSidePauseContext *)self timerQueuePing];
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    timerQueue = self->_timerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSClientSidePauseContext_timerQueueTimerFired__block_invoke;
    block[3] = &unk_1E6CFCBF0;
    block[4] = self;
    dispatch_after(v5, timerQueue, block);
  }
}

void __48__MSClientSidePauseContext_timerQueueTimerFired__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E01C1600]();
  [*(id *)(a1 + 32) timerQueueTimerFired];
}

- (void)resume
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Pause context %p ended.", buf, 0xCu);
  }
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MSClientSidePauseContext_resume__block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(timerQueue, block);
}

void __34__MSClientSidePauseContext_resume__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) disable];
  v2 = [*(id *)(a1 + 32) server];
  v3 = [v2 remoteObjectProxy];
  [v3 unpauseForUUID:*(void *)(*(void *)(a1 + 32) + 8)];

  uint64_t v4 = *(void *)(a1 + 32);
  dispatch_time_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

- (MSClientSidePauseContext)initWithServer:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MSClientSidePauseContext;
  v6 = [(MSClientSidePauseContext *)&v24 init];
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v26 = v6;
      _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Pause context %p started.", buf, 0xCu);
    }
    objc_storeStrong((id *)&v6->_server, a3);
    uint64_t v7 = [NSString MSMakeUUID];
    UUID = v6->_UUID;
    v6->_UUID = (NSString *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("MSClientSidePauseContext timer queue", 0);
    timerQueue = v6->_timerQueue;
    v6->_timerQueue = (OS_dispatch_queue *)v9;

    v11 = (MSTimerGate *)objc_alloc_init(MEMORY[0x1E4F5C390]);
    gate = v6->_gate;
    v6->_gate = v11;

    v13 = v6->_timerQueue;
    v14 = dispatch_get_global_queue(-2, 0);
    dispatch_set_target_queue(v13, v14);

    dispatch_time_t v15 = dispatch_time(0, 5000000000);
    v16 = v6->_timerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__MSClientSidePauseContext_initWithServer___block_invoke;
    block[3] = &unk_1E6CFCBF0;
    v17 = v6;
    v23 = v17;
    dispatch_after(v15, v16, block);
    v18 = v6->_timerQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43__MSClientSidePauseContext_initWithServer___block_invoke_2;
    v20[3] = &unk_1E6CFCBF0;
    v21 = v17;
    dispatch_async(v18, v20);
  }
  return v6;
}

void __43__MSClientSidePauseContext_initWithServer___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E01C1600]();
  [*(id *)(a1 + 32) timerQueueTimerFired];
}

void __43__MSClientSidePauseContext_initWithServer___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E01C1600]();
  [*(id *)(a1 + 32) timerQueuePing];
}

@end