@interface SLGLogXPCClient
- (SLGLogClientProtocolDelegate)delegate;
- (SLGLogXPCClient)init;
- (void)_connectWithCompletion:(id)a3;
- (void)_handshake;
- (void)dealloc;
- (void)didReceiveInitialLogMessageFromDomain:(id)a3;
- (void)queryServer:(id)a3 errorHandler:(id)a4;
- (void)serverDidReset;
- (void)setDelegate:(id)a3;
@end

@implementation SLGLogXPCClient

- (SLGLogXPCClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)SLGLogXPCClient;
  v2 = [(SLGLogXPCClient *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("SLGLogXPCClientLock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("SLGLogXPCClientCallout", v3);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v6;

    [(SLGLogXPCClient *)v2 _handshake];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)SLGLogXPCClient;
  [(SLGLogXPCClient *)&v4 dealloc];
}

- (void)queryServer:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__SLGLogXPCClient_queryServer_errorHandler___block_invoke;
  v10[3] = &unk_1E6870380;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(SLGLogXPCClient *)self _connectWithCompletion:v10];
}

void __44__SLGLogXPCClient_queryServer_errorHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__SLGLogXPCClient_queryServer_errorHandler___block_invoke_2;
    v9[3] = &unk_1E6870358;
    id v10 = *(id *)(a1 + 40);
    id v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v5);
    }
  }
}

uint64_t __44__SLGLogXPCClient_queryServer_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)didReceiveInitialLogMessageFromDomain:(id)a3
{
  id v4 = a3;
  lockQueue = self->_lockQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SLGLogXPCClient_didReceiveInitialLogMessageFromDomain___block_invoke;
  v7[3] = &unk_1E6870110;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lockQueue, v7);
}

void __57__SLGLogXPCClient_didReceiveInitialLogMessageFromDomain___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SLGLogXPCClient_didReceiveInitialLogMessageFromDomain___block_invoke_2;
  block[3] = &unk_1E68702E8;
  id v7 = WeakRetained;
  uint64_t v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v5 = WeakRetained;
  dispatch_async(v4, block);
}

uint64_t __57__SLGLogXPCClient_didReceiveInitialLogMessageFromDomain___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) client:*(void *)(a1 + 40) didReceiveInitialLogMessageFromDomain:*(void *)(a1 + 48)];
}

- (void)serverDidReset
{
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SLGLogXPCClient_serverDidReset__block_invoke;
  block[3] = &unk_1E6870138;
  void block[4] = self;
  dispatch_sync(lockQueue, block);
}

void __33__SLGLogXPCClient_serverDidReset__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__SLGLogXPCClient_serverDidReset__block_invoke_2;
  v6[3] = &unk_1E6870110;
  id v7 = WeakRetained;
  uint64_t v8 = v3;
  id v5 = WeakRetained;
  dispatch_async(v4, v6);
}

uint64_t __33__SLGLogXPCClient_serverDidReset__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientDidReceiveServerReset:*(void *)(a1 + 40)];
}

- (void)_connectWithCompletion:(id)a3
{
  id v4 = a3;
  lockQueue = self->_lockQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SLGLogXPCClient__connectWithCompletion___block_invoke;
  v7[3] = &unk_1E68703D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(lockQueue, v7);
}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      uint64_t v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.internal.studylogd" options:0];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v4;

    id v7 = *(void **)(*(void *)(a1 + 32) + 8);
    id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2680718];
    [v7 setRemoteObjectInterface:v8];

    id v9 = *(void **)(*(void *)(a1 + 32) + 8);
    id v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F26801C0];
    [v9 setExportedInterface:v10];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v11 = *(void **)(*(void *)(a1 + 32) + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__SLGLogXPCClient__connectWithCompletion___block_invoke_2;
    v16[3] = &unk_1E68703A8;
    objc_copyWeak(&v17, &location);
    [v11 setInterruptionHandler:v16];
    id v12 = *(void **)(*(void *)(a1 + 32) + 8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__SLGLogXPCClient__connectWithCompletion___block_invoke_67;
    v14[3] = &unk_1E68703A8;
    objc_copyWeak(&v15, &location);
    [v12 setInvalidationHandler:v14];
    [*(id *)(*(void *)(a1 + 32) + 8) resume];
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, uint64_t, void))(v13 + 16))(v13, 1, 0);
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = slg_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1CFDD9000, v2, OS_LOG_TYPE_DEFAULT, "Connection to daemon was interrupted", v3, 2u);
  }

  [WeakRetained _handshake];
}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = slg_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __42__SLGLogXPCClient__connectWithCompletion___block_invoke_67_cold_1(v2);
  }

  uint64_t v3 = WeakRetained[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SLGLogXPCClient__connectWithCompletion___block_invoke_68;
  block[3] = &unk_1E6870138;
  void block[4] = WeakRetained;
  dispatch_async(v3, block);
}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke_68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)_handshake
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __29__SLGLogXPCClient__handshake__block_invoke;
  v2[3] = &unk_1E68703F8;
  v2[4] = self;
  [(SLGLogXPCClient *)self _connectWithCompletion:v2];
}

void __29__SLGLogXPCClient__handshake__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
    [v2 handshake];
  }
}

- (SLGLogClientProtocolDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SLGLogClientProtocolDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __42__SLGLogXPCClient__connectWithCompletion___block_invoke_67_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1CFDD9000, log, OS_LOG_TYPE_ERROR, "Connection to daemon was invalidated", v1, 2u);
}

@end