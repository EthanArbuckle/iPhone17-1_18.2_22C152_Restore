@interface ICRemoteRequestOperationController
+ (ICRemoteRequestOperationController)sharedRemoteRequestOperationController;
- (id)_clientConnection;
- (id)_init;
- (void)_cancelClientConnectionInvalidationTimer;
- (void)_clientConnectionInvalidationTimerDidExpire;
- (void)_didEndExecutingRemoteRequestOperation;
- (void)_invalidateClientConnection;
- (void)_scheduleInvalidationOfClientConnection;
- (void)_willBeginExecutingRemoteRequestOperation;
- (void)performRemoteRequestOperationWithExecutionContext:(id)a3 completionHandler:(id)a4;
@end

@implementation ICRemoteRequestOperationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnectionInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_willBeginExecutingRemoteRequestOperation
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ICRemoteRequestOperationController__willBeginExecutingRemoteRequestOperation__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void *__79__ICRemoteRequestOperationController__willBeginExecutingRemoteRequestOperation__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 16);
  result = *(void **)(a1 + 32);
  if (result[2] == 1) {
    return (void *)[result _cancelClientConnectionInvalidationTimer];
  }
  return result;
}

- (void)_scheduleInvalidationOfClientConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_accessQueue);
  clientConnectionInvalidationTimer = self->_clientConnectionInvalidationTimer;
  self->_clientConnectionInvalidationTimer = v3;

  v5 = self->_clientConnectionInvalidationTimer;
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v7 = self->_clientConnectionInvalidationTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __77__ICRemoteRequestOperationController__scheduleInvalidationOfClientConnection__block_invoke;
  handler[3] = &unk_1E5ACD750;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_clientConnectionInvalidationTimer);
}

uint64_t __77__ICRemoteRequestOperationController__scheduleInvalidationOfClientConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clientConnectionInvalidationTimerDidExpire];
}

- (void)_clientConnectionInvalidationTimerDidExpire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  [(ICRemoteRequestOperationController *)self _cancelClientConnectionInvalidationTimer];

  [(ICRemoteRequestOperationController *)self _invalidateClientConnection];
}

- (id)_clientConnection
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4401;
  v10 = __Block_byref_object_dispose__4402;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ICRemoteRequestOperationController__clientConnection__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__ICRemoteRequestOperationController__clientConnection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Creating connection to remote request execution service.", v13, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    v5 = +[ICRemoteRequestOperationExecuting machServiceName];
    uint64_t v6 = [v4 initWithMachServiceName:v5 options:0];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v6;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setExportedObject:");
    v9 = *(void **)(*(void *)(a1 + 32) + 24);
    v10 = +[ICRemoteRequestOperationExecuting clientInterface];
    [v9 setExportedInterface:v10];

    id v11 = *(void **)(*(void *)(a1 + 32) + 24);
    v12 = +[ICRemoteRequestOperationExecuting serviceInterface];
    [v11 setRemoteObjectInterface:v12];

    [*(id *)(*(void *)(a1 + 32) + 24) setInterruptionHandler:&__block_literal_global_9];
    [*(id *)(*(void *)(a1 + 32) + 24) setInvalidationHandler:&__block_literal_global_12];
    [*(id *)(*(void *)(a1 + 32) + 24) resume];
    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __55__ICRemoteRequestOperationController__clientConnection__block_invoke_10()
{
  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A2D01000, v0, OS_LOG_TYPE_DEFAULT, "Connection to remote request execution service invalidated.", v1, 2u);
  }
}

void __55__ICRemoteRequestOperationController__clientConnection__block_invoke_7()
{
  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A2D01000, v0, OS_LOG_TYPE_DEFAULT, "Connection to remote request execution service interrupted.", v1, 2u);
  }
}

- (void)_invalidateClientConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  clientConnection = self->_clientConnection;
  if (clientConnection)
  {
    [(NSXPCConnection *)clientConnection invalidate];
    id v4 = self->_clientConnection;
    self->_clientConnection = 0;

    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating connection to remote request execution service.", v6, 2u);
    }
  }
}

- (void)_didEndExecutingRemoteRequestOperation
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ICRemoteRequestOperationController__didEndExecutingRemoteRequestOperation__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void *__76__ICRemoteRequestOperationController__didEndExecutingRemoteRequestOperation__block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 16);
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return (void *)[result _scheduleInvalidationOfClientConnection];
  }
  return result;
}

- (void)_cancelClientConnectionInvalidationTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  clientConnectionInvalidationTimer = self->_clientConnectionInvalidationTimer;
  if (clientConnectionInvalidationTimer)
  {
    dispatch_source_cancel(clientConnectionInvalidationTimer);
    id v4 = self->_clientConnectionInvalidationTimer;
    self->_clientConnectionInvalidationTimer = 0;
  }
}

- (void)performRemoteRequestOperationWithExecutionContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICRemoteRequestOperationController *)self _willBeginExecutingRemoteRequestOperation];
  uint64_t v8 = [(ICRemoteRequestOperationController *)self _clientConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__ICRemoteRequestOperationController_performRemoteRequestOperationWithExecutionContext_completionHandler___block_invoke;
  v14[3] = &unk_1E5ACD8E0;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__ICRemoteRequestOperationController_performRemoteRequestOperationWithExecutionContext_completionHandler___block_invoke_3;
  v12[3] = &unk_1E5AC7780;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 performRemoteRequestOperationWithExecutionContext:v7 completionHandler:v12];
}

void __106__ICRemoteRequestOperationController_performRemoteRequestOperationWithExecutionContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to obtain remote proxy to perform remote request operation. error = %{public}@.", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

void __106__ICRemoteRequestOperationController_performRemoteRequestOperationWithExecutionContext_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _didEndExecutingRemoteRequestOperation];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, 0);
  }
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)ICRemoteRequestOperationController;
  v2 = [(ICRemoteRequestOperationController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICRemoteRequestOperationController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (ICRemoteRequestOperationController)sharedRemoteRequestOperationController
{
  if (sharedRemoteRequestOperationController_sOnceToken != -1) {
    dispatch_once(&sharedRemoteRequestOperationController_sOnceToken, &__block_literal_global_4419);
  }
  v2 = (void *)sharedRemoteRequestOperationController_sSharedRemoteRequestOperationController;

  return (ICRemoteRequestOperationController *)v2;
}

uint64_t __76__ICRemoteRequestOperationController_sharedRemoteRequestOperationController__block_invoke()
{
  id v0 = [[ICRemoteRequestOperationController alloc] _init];
  uint64_t v1 = sharedRemoteRequestOperationController_sSharedRemoteRequestOperationController;
  sharedRemoteRequestOperationController_sSharedRemoteRequestOperationController = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end