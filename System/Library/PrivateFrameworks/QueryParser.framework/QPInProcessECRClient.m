@interface QPInProcessECRClient
+ (id)sharedClient;
- (BOOL)coolDownECRClientSyncWithError:(id *)a3;
- (BOOL)warmUpECRClientSyncWithError:(id *)a3;
- (QPInProcessECRClient)ecrClientWithError:(id *)a3;
- (QPInProcessECRClient)init;
- (id)resolveEntitiesWithRequest:(id)a3 error:(id *)a4;
@end

@implementation QPInProcessECRClient

+ (id)sharedClient
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__QPInProcessECRClient_sharedClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, block);
  }
  v2 = (void *)sharedClient_client;
  return v2;
}

void __53__QPInProcessECRClient_warmUpECRClientSyncWithError___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)warmUpECRClientSyncWithError:(id *)a3
{
  v4 = -[QPInProcessECRClient ecrClientWithError:](self, "ecrClientWithError:");
  if (v4)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__11;
    v16 = __Block_byref_object_dispose__11;
    id v17 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__QPInProcessECRClient_warmUpECRClientSyncWithError___block_invoke;
    v9[3] = &unk_2647060B0;
    v11 = &v12;
    v6 = v5;
    v10 = v6;
    [v4 warmupForMode:3 completionHandler:v9];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    if (a3) {
      *a3 = (id) v13[5];
    }
    BOOL v7 = v13[5] == 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (QPInProcessECRClient)ecrClientWithError:(id *)a3
{
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  p_client = &self->_client;
  BOOL v7 = *p_client;
  if (!v7)
  {
    BOOL v7 = (GDEntityResolutionInProcessTextClient *)[objc_alloc(MEMORY[0x263F4E880]) initWithMode:3 warmup:0 error:a3];
    objc_storeStrong((id *)p_client, v7);
  }
  os_unfair_lock_unlock(p_clientLock);
  return (QPInProcessECRClient *)v7;
}

void __36__QPInProcessECRClient_sharedClient__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedClient_client;
  sharedClient_client = (uint64_t)v1;
}

- (QPInProcessECRClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)QPInProcessECRClient;
  v2 = [(QPECRClient *)&v6 init];
  if (v2)
  {
    if (ecrClientLogger_token != -1) {
      dispatch_once(&ecrClientLogger_token, &__block_literal_global_14);
    }
    v3 = ecrClientLogger_log;
    if (os_log_type_enabled((os_log_t)ecrClientLogger_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v5 = 0;
      _os_log_impl(&dword_224D85000, v3, OS_LOG_TYPE_DEFAULT, "Initializing QPInProcessECRClient", v5, 2u);
    }
  }
  return v2;
}

- (id)resolveEntitiesWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(QPInProcessECRClient *)self ecrClientWithError:a4];
  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__11;
    v26 = __Block_byref_object_dispose__11;
    id v27 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__11;
    v20 = __Block_byref_object_dispose__11;
    id v21 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__QPInProcessECRClient_resolveEntitiesWithRequest_error___block_invoke;
    v12[3] = &unk_264706088;
    uint64_t v14 = &v22;
    v15 = &v16;
    v9 = v8;
    v13 = v9;
    [v7 resolveEntitiesForRequest:v6 completionHandler:v12];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (a4) {
      *a4 = (id) v17[5];
    }
    id v10 = (id)v23[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __57__QPInProcessECRClient_resolveEntitiesWithRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)coolDownECRClientSyncWithError:(id *)a3
{
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  client = self->_client;
  self->_client = 0;
  id v6 = client;

  os_unfair_lock_unlock(p_clientLock);
  id v9 = 0;
  [(GDEntityResolutionInProcessTextClient *)v6 cooldownWithError:&v9];
  id v7 = v9;

  return v7 == 0;
}

- (void).cxx_destruct
{
}

@end