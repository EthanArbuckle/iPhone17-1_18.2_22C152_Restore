@interface ISURLBagLoadingController
+ (id)sharedBagLoadingController;
- (BOOL)isLoadingBag;
- (ISURLBagLoadingController)init;
- (NSDictionary)bagDictionary;
- (void)_didCompleteLoadingBagDictionary:(id)a3 withError:(id)a4;
- (void)_handleAccountStoreDidChangeNotification:(id)a3;
- (void)_handleNetworkReachabilityFlagsDidChangeNotification:(id)a3;
- (void)_handleStoreFrontDidChangeNotification:(id)a3;
- (void)_reloadURLBagAllowingUpdateUsingExistingBagDictionary:(BOOL)a3;
- (void)_updateBagWithDictionary:(id)a3 error:(id)a4;
- (void)addBagObserver:(id)a3;
- (void)dealloc;
- (void)reloadBag;
- (void)removeBagObserver:(id)a3;
- (void)requestAccessToBagUsingBlock:(id)a3;
@end

@implementation ISURLBagLoadingController

+ (id)sharedBagLoadingController
{
  if (sharedBagLoadingController_sOnceToken != -1) {
    dispatch_once(&sharedBagLoadingController_sOnceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedBagLoadingController_sSharedController;

  return v2;
}

uint64_t __55__ISURLBagLoadingController_sharedBagLoadingController__block_invoke()
{
  sharedBagLoadingController_sSharedController = objc_alloc_init(ISURLBagLoadingController);

  return MEMORY[0x270F9A758]();
}

- (ISURLBagLoadingController)init
{
  __ISRecordSPIClassUsage(self);
  v19.receiver = self;
  v19.super_class = (Class)ISURLBagLoadingController;
  v3 = [(ISURLBagLoadingController *)&v19 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iTunesStore.ISURLBagLoadingController.accessQueue", MEMORY[0x263EF83A8]);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.iTunesStore.ISURLBagLoadingController.notificationQueue", 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v6;

    v8 = v3->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__ISURLBagLoadingController_init__block_invoke;
    block[3] = &unk_264260B08;
    v9 = v3;
    v18 = v9;
    dispatch_barrier_sync(v8, block);
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    v11 = +[ISNetworkObserver sharedInstance];
    [v10 addObserver:v9 selector:sel__handleNetworkReachabilityFlagsDidChangeNotification_ name:@"ISNetworkReachabilityFlagsChangedNotification" object:v11];

    uint64_t v12 = *MEMORY[0x263F7B440];
    v13 = [MEMORY[0x263F7B0E8] defaultStore];
    [v10 addObserver:v9 selector:sel__handleAccountStoreDidChangeNotification_ name:v12 object:v13];

    uint64_t v14 = *MEMORY[0x263F7B4D8];
    v15 = [MEMORY[0x263F7B148] currentDevice];
    [v10 addObserver:v9 selector:sel__handleStoreFrontDidChangeNotification_ name:v14 object:v15];
  }
  return v3;
}

uint64_t __33__ISURLBagLoadingController_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadURLBagAllowingUpdateUsingExistingBagDictionary:1];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  dispatch_queue_t v4 = +[ISNetworkObserver sharedInstance];
  [v3 removeObserver:self name:@"ISNetworkReachabilityFlagsChangedNotification" object:v4];

  uint64_t v5 = *MEMORY[0x263F7B440];
  dispatch_queue_t v6 = [MEMORY[0x263F7B0E8] defaultStore];
  [v3 removeObserver:self name:v5 object:v6];

  uint64_t v7 = *MEMORY[0x263F7B4D8];
  v8 = [MEMORY[0x263F7B148] currentDevice];
  [v3 removeObserver:self name:v7 object:v8];

  v9.receiver = self;
  v9.super_class = (Class)ISURLBagLoadingController;
  [(ISURLBagLoadingController *)&v9 dealloc];
}

- (NSDictionary)bagDictionary
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ISURLBagLoadingController_bagDictionary__block_invoke;
  v5[3] = &unk_264260BB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __42__ISURLBagLoadingController_bagDictionary__block_invoke(uint64_t a1)
{
}

- (void)addBagObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__ISURLBagLoadingController_addBagObserver___block_invoke;
    v7[3] = &unk_264260B58;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_sync(accessQueue, v7);
  }
}

uint64_t __44__ISURLBagLoadingController_addBagObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 56);
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = v4;

      id v3 = *(void **)(*(void *)(a1 + 32) + 56);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 addObject:v7];
  }
  return result;
}

- (void)removeBagObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__ISURLBagLoadingController_removeBagObserver___block_invoke;
    v7[3] = &unk_264260B58;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_sync(accessQueue, v7);
  }
}

uint64_t __47__ISURLBagLoadingController_removeBagObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 56);
    return [v4 removeObject:v3];
  }
  return result;
}

- (void)requestAccessToBagUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ISURLBagLoadingController_requestAccessToBagUsingBlock___block_invoke;
  v7[3] = &unk_264260BD8;
  objc_super v9 = &v17;
  v10 = &v11;
  v7[4] = self;
  uint64_t v6 = (void (**)(void))v4;
  id v8 = v6;
  dispatch_barrier_sync(accessQueue, v7);
  if (v18[5] | v12[5]) {
    v6[2](v6);
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

void __58__ISURLBagLoadingController_requestAccessToBagUsingBlock___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 48));
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 40);
    if (!v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      v2 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    id v7 = (id)[*(id *)(a1 + 40) copy];
    uint64_t v6 = (void *)MEMORY[0x2166C7C80]();
    [v2 addObject:v6];
  }
}

- (void)reloadBag
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ISURLBagLoadingController_reloadBag__block_invoke;
  block[3] = &unk_264260B08;
  void block[4] = self;
  dispatch_barrier_sync(accessQueue, block);
}

uint64_t __38__ISURLBagLoadingController_reloadBag__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadURLBagAllowingUpdateUsingExistingBagDictionary:0];
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__ISURLBagLoadingController__handleAccountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_264260B08;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __70__ISURLBagLoadingController__handleAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadURLBagAllowingUpdateUsingExistingBagDictionary:0];
}

- (void)_handleNetworkReachabilityFlagsDidChangeNotification:(id)a3
{
  uint64_t v4 = +[ISNetworkObserver sharedInstance];
  BOOL v5 = +[ISNetworkObserver isLikelyToReachRemoteServerWithReachabilityFlags:](ISNetworkObserver, "isLikelyToReachRemoteServerWithReachabilityFlags:", [v4 networkReachabilityFlags]);

  if (v5)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__ISURLBagLoadingController__handleNetworkReachabilityFlagsDidChangeNotification___block_invoke;
    block[3] = &unk_264260B08;
    void block[4] = self;
    dispatch_barrier_async(accessQueue, block);
  }
}

unsigned char *__82__ISURLBagLoadingController__handleNetworkReachabilityFlagsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[24]) {
    return (unsigned char *)[result _reloadURLBagAllowingUpdateUsingExistingBagDictionary:0];
  }
  return result;
}

- (void)_handleStoreFrontDidChangeNotification:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ISURLBagLoadingController__handleStoreFrontDidChangeNotification___block_invoke;
  block[3] = &unk_264260B08;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __68__ISURLBagLoadingController__handleStoreFrontDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadURLBagAllowingUpdateUsingExistingBagDictionary:0];
}

- (void)_didCompleteLoadingBagDictionary:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ISURLBagLoadingController__didCompleteLoadingBagDictionary_withError___block_invoke;
  block[3] = &unk_264260B80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(accessQueue, block);
}

void __72__ISURLBagLoadingController__didCompleteLoadingBagDictionary_withError___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  [*(id *)(a1 + 32) _updateBagWithDictionary:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ISURLBagLoadingController__didCompleteLoadingBagDictionary_withError___block_invoke_2;
  block[3] = &unk_264260B08;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __72__ISURLBagLoadingController__didCompleteLoadingBagDictionary_withError___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"ISURLBagLoadingControllerIsLoadingBagDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_reloadURLBagAllowingUpdateUsingExistingBagDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x263F7B358] contextWithBagType:0];
  id v6 = [[ISSSURLBag alloc] initWithURLBagContext:v5];
  URLBag = self->_URLBag;
  self->_URLBag = &v6->super;

  if (v3)
  {
    id v8 = [(SSURLBag *)self->_URLBag existingBagDictionary];
    [(ISURLBagLoadingController *)self _updateBagWithDictionary:v8 error:0];
  }
  self->_loadingBag = 1;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__ISURLBagLoadingController__reloadURLBagAllowingUpdateUsingExistingBagDictionary___block_invoke;
  block[3] = &unk_264260B08;
  void block[4] = self;
  dispatch_async(notificationQueue, block);
  id v10 = [MEMORY[0x263F08D40] valueWithWeakObject:self];
  uint64_t v11 = self->_URLBag;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__ISURLBagLoadingController__reloadURLBagAllowingUpdateUsingExistingBagDictionary___block_invoke_2;
  v13[3] = &unk_264260C00;
  id v14 = v10;
  id v12 = v10;
  [(SSURLBag *)v11 loadWithCompletionBlock:v13];
}

void __83__ISURLBagLoadingController__reloadURLBagAllowingUpdateUsingExistingBagDictionary___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"ISURLBagLoadingControllerIsLoadingBagDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __83__ISURLBagLoadingController__reloadURLBagAllowingUpdateUsingExistingBagDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 weakObjectValue];
  [v7 _didCompleteLoadingBagDictionary:v6 withError:v5];
}

- (void)_updateBagWithDictionary:(id)a3 error:(id)a4
{
  id v6 = (NSDictionary *)a3;
  id v7 = a4;
  id v8 = (void *)[(NSDictionary *)self->_bagDictionary copy];
  bagDictionary = self->_bagDictionary;
  if (bagDictionary == v6 || [(NSDictionary *)bagDictionary isEqualToDictionary:v6])
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = (void *)[(NSDictionary *)v6 copy];

    objc_storeStrong((id *)&self->_bagDictionary, v11);
    id v10 = [(NSHashTable *)self->_bagObservers allObjects];
    id v8 = v11;
  }
  objc_storeStrong((id *)&self->_bagLoadingError, a4);
  id v12 = (void *)[(NSMutableArray *)self->_bagAccessRequestBlocks copy];
  bagAccessRequestBlocks = self->_bagAccessRequestBlocks;
  self->_bagAccessRequestBlocks = 0;

  id v14 = dispatch_get_global_queue(0, 0);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__ISURLBagLoadingController__updateBagWithDictionary_error___block_invoke;
  v19[3] = &unk_264260C28;
  id v20 = v12;
  id v21 = v8;
  id v22 = v7;
  id v23 = v10;
  id v15 = v10;
  id v16 = v7;
  id v17 = v8;
  id v18 = v12;
  dispatch_async(v14, v19);
}

void __60__ISURLBagLoadingController__updateBagWithDictionary_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "bagDidChange:", *(void *)(a1 + 40), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

- (BOOL)isLoadingBag
{
  return self->_loadingBag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLBag, 0);
  objc_storeStrong((id *)&self->_bagObservers, 0);
  objc_storeStrong((id *)&self->_bagLoadingError, 0);
  objc_storeStrong((id *)&self->_bagAccessRequestBlocks, 0);
  objc_storeStrong((id *)&self->_bagDictionary, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end