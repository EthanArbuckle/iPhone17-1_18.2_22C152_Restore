@interface SFXPCClient
- (BOOL)shouldEscapeXpcTryCatch;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)dispatchQueue;
- (SFXPCClient)init;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)_activate;
- (void)_invalidate;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)connectionEstablished;
- (void)dealloc;
- (void)getRemoteObjectProxyOnQueue:(id)a3;
- (void)interrupted;
- (void)invalidated;
- (void)onqueue_activate;
- (void)onqueue_connectionEstablished;
- (void)onqueue_connectionInterrupted;
- (void)onqueue_connectionInvalidated;
- (void)onqueue_ensureConnectionEstablished;
- (void)onqueue_ensureXPCStarted;
- (void)onqueue_getRemoteObjectProxyOnQueue:(id)a3;
- (void)onqueue_interrupted;
- (void)onqueue_invalidate;
- (void)onqueue_invalidated;
- (void)setConnection:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation SFXPCClient

- (SFXPCClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFXPCClient;
  v2 = [(SFXPCClient *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_connection)
  {
    v4 = (SFXPCClient *)FatalErrorF();
    [(SFXPCClient *)v4 setDispatchQueue:v6];
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;
    }
    v7.receiver = self;
    v7.super_class = (Class)SFXPCClient;
    [(SFXPCClient *)&v7 dealloc];
  }
}

- (void)setDispatchQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)getRemoteObjectProxyOnQueue:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SFXPCClient_getRemoteObjectProxyOnQueue___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __43__SFXPCClient_getRemoteObjectProxyOnQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_getRemoteObjectProxyOnQueue:", *(void *)(a1 + 40));
}

- (void)onqueue_getRemoteObjectProxyOnQueue:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activateCalled)
  {
    [(SFXPCClient *)self onqueue_ensureXPCStarted];
    id v4 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_25];
    v6[2](v6, v4);
  }
  else
  {
    uint64_t v5 = FatalErrorF();
    __51__SFXPCClient_onqueue_getRemoteObjectProxyOnQueue___block_invoke(v5);
  }
}

void __51__SFXPCClient_onqueue_getRemoteObjectProxyOnQueue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __51__SFXPCClient_onqueue_getRemoteObjectProxyOnQueue___block_invoke_cold_1(v2, v3);
  }
}

- (void)_activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__SFXPCClient__activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __24__SFXPCClient__activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_activate");
}

- (void)onqueue_activate
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Activate already called", v2, v3, v4, v5, v6);
}

- (void)_invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SFXPCClient__invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFXPCClient__invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_invalidate");
}

- (void)onqueue_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    connection = self->_connection;
    if (connection)
    {
      [(NSXPCConnection *)connection invalidate];
      uint64_t v4 = self->_connection;
      self->_connection = 0;
    }
    else
    {
      [(SFXPCClient *)self onqueue_invalidated];
    }
  }
}

- (void)onqueue_ensureXPCStarted
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A5389000, v0, OS_LOG_TYPE_DEBUG, "connection created", v1, 2u);
}

void __39__SFXPCClient_onqueue_ensureXPCStarted__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained shouldEscapeXpcTryCatch];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (v3) {
    objc_msgSend(v4, "onqueue_interrupted");
  }
  else {
    [v4 interrupted];
  }
}

void __39__SFXPCClient_onqueue_ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained shouldEscapeXpcTryCatch];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (v3) {
    objc_msgSend(v4, "onqueue_invalidated");
  }
  else {
    [v4 invalidated];
  }
}

- (void)onqueue_ensureConnectionEstablished
{
  int v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Establishing connection", buf, 2u);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SFXPCClient_onqueue_ensureConnectionEstablished__block_invoke;
  v4[3] = &unk_1E5BBE3A0;
  objc_copyWeak(&v5, (id *)buf);
  [(SFXPCClient *)self onqueue_getRemoteObjectProxyOnQueue:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __50__SFXPCClient_onqueue_ensureConnectionEstablished__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SFXPCClient_onqueue_ensureConnectionEstablished__block_invoke_2;
  v4[3] = &unk_1E5BBCB80;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  [v3 establishConnectionWithCompletionHandler:v4];
  objc_destroyWeak(&v5);
}

void __50__SFXPCClient_onqueue_ensureConnectionEstablished__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = daemon_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "connection established", v8, 2u);
  }

  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  int v5 = [WeakRetained shouldEscapeXpcTryCatch];

  id v6 = objc_loadWeakRetained(v3);
  objc_super v7 = v6;
  if (v5) {
    objc_msgSend(v6, "onqueue_connectionEstablished");
  }
  else {
    [v6 connectionEstablished];
  }
}

- (void)interrupted
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SFXPCClient_interrupted__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFXPCClient_interrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_interrupted");
}

- (void)onqueue_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Interrupted", v4, 2u);
  }

  [(SFXPCClient *)self onqueue_connectionInterrupted];
  [(SFXPCClient *)self onqueue_ensureConnectionEstablished];
}

- (void)invalidated
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SFXPCClient_invalidated__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFXPCClient_invalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_invalidated");
}

- (void)onqueue_invalidated
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "XPC connection unexpectedly invalidated", v2, v3, v4, v5, v6);
}

- (void)connectionEstablished
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SFXPCClient_connectionEstablished__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__SFXPCClient_connectionEstablished__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_connectionEstablished");
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6 = a4;
  [v6 retainArguments];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SFXPCClient_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_1E5BBC870;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __51__SFXPCClient_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

- (id)machServiceName
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  v9 = [v5 stringWithFormat:@"Subclass %@ must override %@", v7, v8];
  id v10 = [v3 exceptionWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)exportedInterface
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  v9 = [v5 stringWithFormat:@"Subclass %@ must override %@", v7, v8];
  id v10 = [v3 exceptionWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)remoteObjectInterface
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  v9 = [v5 stringWithFormat:@"Subclass %@ must override %@", v7, v8];
  id v10 = [v3 exceptionWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)shouldEscapeXpcTryCatch
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  v9 = [v5 stringWithFormat:@"Subclass %@ must override %@", v7, v8];
  id v10 = [v3 exceptionWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)onqueue_connectionEstablished
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v2 = daemon_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "connection established", v3, 2u);
  }
}

- (void)onqueue_connectionInterrupted
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "connection interrupted", v2, v3, v4, v5, v6);
}

- (void)onqueue_connectionInvalidated
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "connection invalidated", v2, v3, v4, v5, v6);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __51__SFXPCClient_onqueue_getRemoteObjectProxyOnQueue___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 debugDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Failed to get remote object proxy: %@", (uint8_t *)&v4, 0xCu);
}

@end