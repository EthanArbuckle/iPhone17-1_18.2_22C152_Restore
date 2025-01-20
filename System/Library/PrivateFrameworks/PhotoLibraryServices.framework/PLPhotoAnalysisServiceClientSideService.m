@interface PLPhotoAnalysisServiceClientSideService
- (PLPhotoAnalysisServiceClientSideService)initWithConnection:(id)a3 remoteInterface:(id)a4 instantiationBlock:(id)a5;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteServiceProxyWithErrorHandler:(id)a3;
- (void)remoteServiceProxyWithErrorHandler:(id)a3 reply:(id)a4;
@end

@implementation PLPhotoAnalysisServiceClientSideService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong(&self->_instantiationBlock, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)synchronousRemoteServiceProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_service = (id *)&self->_service;
  v7 = self->_service;
  os_unfair_lock_unlock(&self->_lock);
  if (!v7)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__94873;
    v23 = __Block_byref_object_dispose__94874;
    id v24 = 0;
    v8 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:v4];
    if (v8)
    {
      instantiationBlock = (void (**)(id, void *, void *))self->_instantiationBlock;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __89__PLPhotoAnalysisServiceClientSideService_synchronousRemoteServiceProxyWithErrorHandler___block_invoke;
      v16 = &unk_1E5871F20;
      v18 = &v19;
      id v17 = v4;
      instantiationBlock[2](instantiationBlock, v8, &v13);
    }
    if (v20[5])
    {
      os_unfair_lock_lock(p_lock);
      id v10 = *p_service;
      if (!*p_service)
      {
        objc_storeStrong(p_service, (id)v20[5]);
        id v10 = *p_service;
      }
      v7 = (NSXPCProxyCreating *)v10;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  v11 = -[NSXPCProxyCreating synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v4, v13, v14, v15, v16);

  return v11;
}

void __89__PLPhotoAnalysisServiceClientSideService_synchronousRemoteServiceProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)remoteServiceProxyWithErrorHandler:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_service;
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    v9 = [(NSXPCProxyCreating *)v8 remoteObjectProxyWithErrorHandler:v6];
    if (v9) {
      v7[2](v7, v9);
    }
  }
  else
  {
    id v10 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:v6];
    if (v10)
    {
      instantiationBlock = (void (**)(id, void *, void *))self->_instantiationBlock;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __84__PLPhotoAnalysisServiceClientSideService_remoteServiceProxyWithErrorHandler_reply___block_invoke;
      v12[3] = &unk_1E5871EF8;
      v12[4] = self;
      id v13 = v6;
      uint64_t v14 = v7;
      instantiationBlock[2](instantiationBlock, v10, v12);
    }
  }
}

void __84__PLPhotoAnalysisServiceClientSideService_remoteServiceProxyWithErrorHandler_reply___block_invoke(void *a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 40));
    uint64_t v4 = a1[4];
    v7 = *(void **)(v4 + 32);
    v5 = (id *)(v4 + 32);
    id v6 = v7;
    if (!v7)
    {
      objc_storeStrong(v5, a2);
      id v6 = *(void **)(a1[4] + 32);
    }
    id v8 = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
    v9 = [v8 remoteObjectProxyWithErrorHandler:a1[5]];
    if (v9) {
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [[PLPhotoAnalysisServiceRemoteServiceProxy alloc] initWithServiceProvider:self remoteInterface:self->_remoteInterface synchronous:1 errorHandler:v4];

  return v5;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [[PLPhotoAnalysisServiceRemoteServiceProxy alloc] initWithServiceProvider:self remoteInterface:self->_remoteInterface synchronous:0 errorHandler:v4];

  return v5;
}

- (id)remoteObjectProxy
{
  v2 = [[PLPhotoAnalysisServiceRemoteServiceProxy alloc] initWithServiceProvider:self remoteInterface:self->_remoteInterface synchronous:0 errorHandler:0];
  return v2;
}

- (PLPhotoAnalysisServiceClientSideService)initWithConnection:(id)a3 remoteInterface:(id)a4 instantiationBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PLPhotoAnalysisServiceClientSideService;
  v12 = [(PLPhotoAnalysisServiceClientSideService *)&v17 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_remoteInterface, a4);
    uint64_t v14 = MEMORY[0x19F38D650](v11);
    id instantiationBlock = v13->_instantiationBlock;
    v13->_id instantiationBlock = (id)v14;

    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

@end