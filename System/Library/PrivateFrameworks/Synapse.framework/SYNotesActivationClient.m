@interface SYNotesActivationClient
- (NSXPCConnection)_connection;
- (OS_dispatch_queue)_clientQueue;
- (SYNotesActivationClient)init;
- (void)_clientQueue:(id)a3;
- (void)_ensureConnection;
- (void)_setConnection:(id)a3;
- (void)activateNotesWithUserActivity:(id)a3 completion:(id)a4;
@end

@implementation SYNotesActivationClient

- (SYNotesActivationClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)SYNotesActivationClient;
  v2 = [(SYNotesActivationClient *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.ActivationClient", v3);
    clientQueue = v2->__clientQueue;
    v2->__clientQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)activateNotesWithUserActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = SYActivationContextForUserActivity(a3);
  v8 = [(SYNotesActivationClient *)self _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SYNotesActivationClient_activateNotesWithUserActivity_completion___block_invoke;
  block[3] = &unk_1E6463CE8;
  id v12 = v7;
  id v13 = v6;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__SYNotesActivationClient_activateNotesWithUserActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __68__SYNotesActivationClient_activateNotesWithUserActivity_completion___block_invoke_2;
  id v9 = &unk_1E6463EC8;
  id v2 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v2;
  v3 = (void *)MEMORY[0x1C8769940](&v6);
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnection", v6, v7, v8, v9);
  dispatch_queue_t v4 = [*(id *)(a1 + 32) _connection];
  v5 = [v4 remoteObjectProxyWithErrorHandler:v3];

  [v5 activateNotesWithContext:*(void *)(a1 + 40) completion:v3];
}

uint64_t __68__SYNotesActivationClient_activateNotesWithUserActivity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = [*(id *)(a1 + 32) _connection];
  [v3 invalidate];

  dispatch_queue_t v4 = *(void **)(a1 + 32);
  return [v4 _setConnection:0];
}

- (void)_ensureConnection
{
  v3 = [(SYNotesActivationClient *)self _connection];

  if (!v3)
  {
    dispatch_queue_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.synapse.notes-activation-service" options:0];
    [(SYNotesActivationClient *)self _setConnection:v4];

    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2B688];
    uint64_t v6 = [(SYNotesActivationClient *)self _connection];
    [v6 setRemoteObjectInterface:v5];

    uint64_t v7 = [(SYNotesActivationClient *)self _connection];
    v8 = [(SYNotesActivationClient *)self _clientQueue];
    [v7 _setQueue:v8];

    id v9 = [(SYNotesActivationClient *)self _connection];
    [v9 resume];
  }
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)_setConnection:(id)a3
{
}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (void)_clientQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientQueue, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

@end