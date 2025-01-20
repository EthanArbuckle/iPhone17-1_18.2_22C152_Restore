@interface NARApplicationWorkspace
- (NARApplicationWorkspace)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)_workspaceServiceWithErrorHandler:(id)a3;
- (id)workspaceInfo:(id *)a3;
- (void)_connectionInvalidated;
- (void)_loadConnectionIfNeeded;
- (void)dealloc;
- (void)getWorkspaceInfoIncludingHiddenApps:(BOOL)a3 completion:(id)a4;
- (void)getWorkspaceInfoWithCompletion:(id)a3;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation NARApplicationWorkspace

- (NARApplicationWorkspace)init
{
  v6.receiver = self;
  v6.super_class = (Class)NARApplicationWorkspace;
  v2 = [(NARApplicationWorkspace *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanoappregistry.xpc", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NARApplicationWorkspace;
  [(NARApplicationWorkspace *)&v3 dealloc];
}

- (id)workspaceInfo:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v5 = [(NARApplicationWorkspace *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__NARApplicationWorkspace_workspaceInfo___block_invoke;
  block[3] = &unk_2648538F8;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(v5, block);

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __41__NARApplicationWorkspace_workspaceInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadConnectionIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__NARApplicationWorkspace_workspaceInfo___block_invoke_2;
  v5[3] = &unk_2648538A8;
  v5[4] = *(void *)(a1 + 40);
  objc_super v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__NARApplicationWorkspace_workspaceInfo___block_invoke_3;
  v4[3] = &unk_2648538D0;
  v4[4] = *(void *)(a1 + 48);
  [v3 getWorkspaceInfoWithCompletion:v4];
}

void __41__NARApplicationWorkspace_workspaceInfo___block_invoke_2(uint64_t a1, void *a2)
{
}

void __41__NARApplicationWorkspace_workspaceInfo___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)getWorkspaceInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NARApplicationWorkspace *)self queue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke;
    v6[3] = &unk_264853970;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadConnectionIfNeeded];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke_2;
  v6[3] = &unk_264853920;
  v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_super v3 = [v2 _workspaceServiceWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke_3;
  v4[3] = &unk_264853948;
  id v5 = *(id *)(a1 + 40);
  [v3 getWorkspaceInfoWithCompletion:v4];
}

uint64_t __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getWorkspaceInfoIncludingHiddenApps:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(NARApplicationWorkspace *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke;
    block[3] = &unk_264853998;
    block[4] = self;
    id v9 = v6;
    BOOL v10 = a3;
    dispatch_async(v7, block);
  }
}

void __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadConnectionIfNeeded];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke_2;
  v7[3] = &unk_264853920;
  v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  objc_super v3 = [v2 _workspaceServiceWithErrorHandler:v7];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke_3;
  v5[3] = &unk_264853948;
  id v6 = *(id *)(a1 + 40);
  [v3 getWorkspaceInfoIncludingHiddenApps:v4 completion:v5];
}

uint64_t __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_workspaceServiceWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a3];
}

- (void)_connectionInvalidated
{
  objc_super v3 = [(NARApplicationWorkspace *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NARApplicationWorkspace__connectionInvalidated__block_invoke;
  block[3] = &unk_2648539C0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __49__NARApplicationWorkspace__connectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)_loadConnectionIfNeeded
{
  if (!self->_connection)
  {
    objc_super v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.nanoappregistry.workspace" options:0];
    connection = self->_connection;
    self->_connection = v3;

    id v5 = self->_connection;
    id v6 = NARWorkspaceServiceInterface();
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    id v7 = self->_connection;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    BOOL v10 = __50__NARApplicationWorkspace__loadConnectionIfNeeded__block_invoke;
    uint64_t v11 = &unk_2648539E8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v7 setInvalidationHandler:&v8];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __50__NARApplicationWorkspace__loadConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end