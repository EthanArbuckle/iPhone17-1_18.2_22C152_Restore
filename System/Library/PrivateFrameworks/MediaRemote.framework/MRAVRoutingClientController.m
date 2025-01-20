@interface MRAVRoutingClientController
- (MRAVRoutingClientController)init;
- (MRAVRoutingClientController)initWithMediaRemoteService:(id)a3;
- (MRMediaRemoteService)mediaRemoteService;
- (void)_cacheFetchedPickableRoutes:(void *)a3 forCategory:;
- (void)_flushPendingCompletionHandlersWithPickableRoutes:(void *)a3 forCategory:;
- (void)_pickableRoutesDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)fetchPickableRoutesForCategory:(id)a3 completion:(id)a4;
@end

@implementation MRAVRoutingClientController

uint64_t __68__MRAVRoutingClientController__pickableRoutesDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
}

- (MRAVRoutingClientController)initWithMediaRemoteService:(id)a3
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MRAVRoutingClientController;
  v7 = [(MRAVRoutingClientController *)&v23 init];
  if (v7)
  {
    if (!v6)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, v7, @"MRAVRoutingClientController.m", 39, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_mediaRemoteService, a3);
    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(Name, v10);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.mediaremote.MRAVRoutingClientController.callbackQueue", v13);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingCompletionHandlersForCategories = v7->_pendingCompletionHandlersForCategories;
    v7->_pendingCompletionHandlersForCategories = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedRoutesForCategories = v7->_cachedRoutesForCategories;
    v7->_cachedRoutesForCategories = v18;

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v7 selector:sel__pickableRoutesDidChangeNotification_ name:@"kMRMediaRemotePickableRoutesDidChangeNotification" object:0];
  }
  return v7;
}

- (void)_pickableRoutesDidChangeNotification:(id)a3
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MRAVRoutingClientController__pickableRoutesDidChangeNotification___block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __71__MRAVRoutingClientController__cacheFetchedPickableRoutes_forCategory___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = *(void **)(a1[5] + 40);
  if (v2) {
    return [v3 setObject:v2 forKey:a1[6]];
  }
  else {
    return [v3 removeObjectForKey:a1[6]];
  }
}

- (void)fetchPickableRoutesForCategory:(id)a3 completion:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke;
  block[3] = &unk_1E57D3F90;
  if (!v6) {
    id v6 = @"MRAVRoutingActiveCategoryName";
  }
  block[4] = self;
  v12 = v6;
  id v13 = v7;
  id v9 = v7;
  v10 = v6;
  dispatch_sync(serialQueue, block);
}

void __93__MRAVRoutingClientController__flushPendingCompletionHandlersWithPickableRoutes_forCategory___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [v5 removeAllObjects];
}

void __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke_2(uint64_t a1, void *a2)
{
  -[MRAVRoutingClientController _cacheFetchedPickableRoutes:forCategory:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
  -[MRAVRoutingClientController _flushPendingCompletionHandlersWithPickableRoutes:forCategory:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
}

- (void)_flushPendingCompletionHandlersWithPickableRoutes:(void *)a3 forCategory:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    objc_super v23 = __Block_byref_object_copy__28;
    v24 = __Block_byref_object_dispose__28;
    id v25 = 0;
    v8 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__MRAVRoutingClientController__flushPendingCompletionHandlersWithPickableRoutes_forCategory___block_invoke;
    block[3] = &unk_1E57D3118;
    block[4] = a1;
    id v18 = v6;
    v19 = &v20;
    dispatch_sync(v8, block);
    if (!v5) {
      id v5 = (id)MEMORY[0x1E4F1CBF0];
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = (id)v21[5];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v26 count:16];
      }
      while (v10);
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (void)_cacheFetchedPickableRoutes:(void *)a3 forCategory:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__MRAVRoutingClientController__cacheFetchedPickableRoutes_forCategory___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v9 = v5;
    uint64_t v10 = a1;
    id v11 = v6;
    dispatch_sync(v7, block);
  }
}

void __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 count];
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v2 forKey:*(void *)(a1 + 40)];
  }
  v4 = (void *)[*(id *)(a1 + 48) copy];
  [v2 addObject:v4];

  if (!v3)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(NSObject **)(v7 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke_3;
      block[3] = &unk_1E57D1B18;
      void block[4] = v7;
      id v16 = v5;
      id v17 = *(id *)(a1 + 40);
      dispatch_async(v8, block);
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v9 = *(__CFString **)(a1 + 40);
      if (v9 == @"MRAVRoutingActiveCategoryName") {
        id v11 = 0;
      }
      else {
        id v11 = *(void **)(a1 + 40);
      }
      uint64_t v12 = *(void **)(v10 + 8);
      long long v13 = *(void **)(v10 + 24);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke_2;
      v18[3] = &unk_1E57D65A0;
      v18[4] = v10;
      v19 = v9;
      id v14 = v11;
      MRMediaRemoteServiceCopyPickableRoutes(v12, v14, v13, v18);
    }
  }
}

- (MRAVRoutingClientController)init
{
  return [(MRAVRoutingClientController *)self initWithMediaRemoteService:0];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRAVRoutingClientController;
  [(MRAVRoutingClientController *)&v4 dealloc];
}

void __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke_3(uint64_t a1)
{
}

- (MRMediaRemoteService)mediaRemoteService
{
  return self->_mediaRemoteService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRoutesForCategories, 0);
  objc_storeStrong((id *)&self->_pendingCompletionHandlersForCategories, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_mediaRemoteService, 0);
}

@end