@interface SUUIConfigurationPreloader
- (BOOL)hasExistingConfigurationCache;
- (NSDictionary)loadedConfiguration;
- (NSMutableArray)completionBlocks;
- (NSOperationQueue)workQueue;
- (NSString)configurationCachePath;
- (SUUIConfigurationPreloader)init;
- (SUUIConfigurationPreloader)initWithConfigurationCachePath:(id)a3;
- (SUUIReloadConfigurationOperation)pendingReloadOperation;
- (id)newReloadConfigurationOperation;
- (void)finishPreloadingConfiguration:(id)a3 error:(id)a4;
- (void)preloadConfigurationForPurpose:(int64_t)a3 withCompletionBlock:(id)a4;
- (void)setLoadedConfiguration:(id)a3;
- (void)setPendingReloadOperation:(id)a3;
@end

@implementation SUUIConfigurationPreloader

- (void)preloadConfigurationForPurpose:(int64_t)a3 withCompletionBlock:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SUUIConfigurationPreloader.m", 48, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  v8 = [(SUUIConfigurationPreloader *)self loadedConfiguration];

  if (v8)
  {
    v9 = [MEMORY[0x263F08A48] mainQueue];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_3;
    v22[3] = &unk_265400AF0;
    v22[4] = self;
    id v23 = v7;
    [v9 addOperationWithBlock:v22];
  }
  else if (a3 || ![(SUUIConfigurationPreloader *)self hasExistingConfigurationCache])
  {
    v10 = [(SUUIConfigurationPreloader *)self completionBlocks];
    v11 = (void *)[v7 copy];
    v12 = _Block_copy(v11);
    [v10 addObject:v12];

    v13 = [(SUUIConfigurationPreloader *)self pendingReloadOperation];

    if (!v13)
    {
      id v14 = [(SUUIConfigurationPreloader *)self newReloadConfigurationOperation];
      [(SUUIConfigurationPreloader *)self setPendingReloadOperation:v14];

      if (a3 == 2)
      {
        v15 = [MEMORY[0x263F7B358] contextWithBagType:0];
        v16 = SSVDefaultUserAgent();
        [v15 setValue:v16 forHTTPHeaderField:*MEMORY[0x263F7B788]];

        v17 = [(SSURLBag *)[SUUIURLBag alloc] initWithURLBagContext:v15];
        [(SUUIReloadConfigurationOperation *)self->_pendingReloadOperation setURLBag:v17];
      }
      objc_initWeak(&location, self);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke;
      v24[3] = &unk_2654057F8;
      objc_copyWeak(&v25, &location);
      v18 = [(SUUIConfigurationPreloader *)self pendingReloadOperation];
      [v18 setOutputBlock:v24];

      v19 = [(SUUIConfigurationPreloader *)self workQueue];
      v20 = [(SUUIConfigurationPreloader *)self pendingReloadOperation];
      [v19 addOperation:v20];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x263EFFA78], 0);
  }
}

- (NSDictionary)loadedConfiguration
{
  return self->_loadedConfiguration;
}

- (BOOL)hasExistingConfigurationCache
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(SUUIConfigurationPreloader *)self configurationCachePath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (NSString)configurationCachePath
{
  return self->_configurationCachePath;
}

- (SUUIConfigurationPreloader)init
{
  v3 = +[SUUIReloadConfigurationOperation cachePath];
  v4 = [(SUUIConfigurationPreloader *)self initWithConfigurationCachePath:v3];

  return v4;
}

- (SUUIConfigurationPreloader)initWithConfigurationCachePath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIConfigurationPreloader;
  char v5 = [(SUUIConfigurationPreloader *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configurationCachePath = v5->_configurationCachePath;
    v5->_configurationCachePath = (NSString *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    workQueue = v5->_workQueue;
    v5->_workQueue = v8;

    [(NSOperationQueue *)v5->_workQueue setName:@"com.apple.storekit.configurationpreloader"];
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    completionBlocks = v5->_completionBlocks;
    v5->_completionBlocks = v10;
  }
  return v5;
}

- (id)newReloadConfigurationOperation
{
  return objc_alloc_init(SUUIReloadConfigurationOperation);
}

void __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = [MEMORY[0x263F08A48] mainQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_2;
    v9[3] = &unk_265400958;
    v9[4] = WeakRetained;
    id v10 = v5;
    id v11 = v6;
    [v8 addOperationWithBlock:v9];
  }
}

uint64_t __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishPreloadingConfiguration:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) loadedConfiguration];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)finishPreloadingConfiguration:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SUUIConfigurationPreloader *)self setLoadedConfiguration:v6];
  [(SUUIConfigurationPreloader *)self setPendingReloadOperation:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = [(SUUIConfigurationPreloader *)self completionBlocks];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_super v13 = [(SUUIConfigurationPreloader *)self completionBlocks];
  [v13 removeAllObjects];
}

- (NSOperationQueue)workQueue
{
  return self->_workQueue;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (SUUIReloadConfigurationOperation)pendingReloadOperation
{
  return self->_pendingReloadOperation;
}

- (void)setPendingReloadOperation:(id)a3
{
}

- (void)setLoadedConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedConfiguration, 0);
  objc_storeStrong((id *)&self->_pendingReloadOperation, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_configurationCachePath, 0);
}

@end