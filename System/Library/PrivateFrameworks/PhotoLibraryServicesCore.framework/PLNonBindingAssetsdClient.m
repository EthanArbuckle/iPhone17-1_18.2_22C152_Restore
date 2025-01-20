@interface PLNonBindingAssetsdClient
- (PLAssetsdDemoClient)demoClient;
- (PLAssetsdLibraryManagementClient)libraryManagementClient;
- (PLAssetsdNonBindingDebugClient)nonBindingDebugClient;
- (PLAssetsdPrivacySupportClient)privacySupportClient;
- (PLAssetsdSystemLibraryURLReadOnlyClient)systemLibraryURLReadOnlyClient;
- (PLNonBindingAssetsdClient)init;
- (void)_updateLibraryStateConnectionInterrupted:(id)a3;
@end

@implementation PLNonBindingAssetsdClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBindingDebugClient, 0);
  objc_storeStrong((id *)&self->_privacySupportClient, 0);
  objc_storeStrong((id *)&self->_demoClient, 0);
  objc_storeStrong((id *)&self->_libraryManagementClient, 0);
  objc_storeStrong((id *)&self->_systemLibraryURLReadOnlyClient, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_updateLibraryStateConnectionInterrupted:(id)a3
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PLNonBindingAssetsdClient__updateLibraryStateConnectionInterrupted___block_invoke;
  block[3] = &unk_1E58A1EC0;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

void __70__PLNonBindingAssetsdClient__updateLibraryStateConnectionInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = 0;
}

- (PLAssetsdNonBindingDebugClient)nonBindingDebugClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6531;
  v10 = __Block_byref_object_dispose__6532;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PLNonBindingAssetsdClient_nonBindingDebugClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdNonBindingDebugClient *)v3;
}

void __50__PLNonBindingAssetsdClient_nonBindingDebugClient__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    id v3 = [(PLAssetsdBaseClient *)[PLAssetsdNonBindingDebugClient alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16) proxyCreating:*(void *)(*(void *)(a1 + 32) + 8) proxyGetter:sel_getNonBindingDebugServiceWithReply_];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

- (PLAssetsdPrivacySupportClient)privacySupportClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6531;
  v10 = __Block_byref_object_dispose__6532;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PLNonBindingAssetsdClient_privacySupportClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdPrivacySupportClient *)v3;
}

void __49__PLNonBindingAssetsdClient_privacySupportClient__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    id v3 = [(PLAssetsdBaseClient *)[PLAssetsdPrivacySupportClient alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16) proxyCreating:*(void *)(*(void *)(a1 + 32) + 8) proxyGetter:sel_getPrivacySupportServiceWithReply_];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

- (PLAssetsdDemoClient)demoClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6531;
  v10 = __Block_byref_object_dispose__6532;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PLNonBindingAssetsdClient_demoClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdDemoClient *)v3;
}

void __39__PLNonBindingAssetsdClient_demoClient__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    id v3 = [(PLAssetsdBaseClient *)[PLAssetsdDemoClient alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16) proxyCreating:*(void *)(*(void *)(a1 + 32) + 8) proxyGetter:sel_getDemoServiceWithReply_];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

- (PLAssetsdLibraryManagementClient)libraryManagementClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6531;
  v10 = __Block_byref_object_dispose__6532;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PLNonBindingAssetsdClient_libraryManagementClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdLibraryManagementClient *)v3;
}

void __52__PLNonBindingAssetsdClient_libraryManagementClient__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    id v3 = [(PLAssetsdBaseClient *)[PLAssetsdLibraryManagementClient alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16) proxyCreating:*(void *)(*(void *)(a1 + 32) + 8) proxyGetter:sel_getLibraryManagementServiceWithReply_];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

- (PLAssetsdSystemLibraryURLReadOnlyClient)systemLibraryURLReadOnlyClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6531;
  v10 = __Block_byref_object_dispose__6532;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PLNonBindingAssetsdClient_systemLibraryURLReadOnlyClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdSystemLibraryURLReadOnlyClient *)v3;
}

void __59__PLNonBindingAssetsdClient_systemLibraryURLReadOnlyClient__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = [(PLAssetsdBaseClient *)[PLAssetsdSystemLibraryURLReadOnlyClient alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16) proxyCreating:*(void *)(*(void *)(a1 + 32) + 8) proxyGetter:sel_getSystemLibraryURLReadOnlyServiceWithReply_];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

- (PLNonBindingAssetsdClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLNonBindingAssetsdClient;
  uint64_t v2 = [(PLNonBindingAssetsdClient *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc_init(PLAssetsdClientXPCConnection);
    connection = v2->_connection;
    v2->_connection = v3;

    dispatch_queue_t v5 = dispatch_queue_create("PLNonBindingAssetsdClient isolation queue", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v5;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__updateLibraryStateConnectionInterrupted_ name:@"PLAssetsdClientXPCConnectionInterruptedInternalNotificationName" object:v2->_connection];

    uint64_t v8 = v2;
  }

  return v2;
}

@end