@interface SKUIConfigurationPreloader
- (BOOL)hasExistingConfigurationCache;
- (NSDictionary)loadedConfiguration;
- (NSMutableArray)completionBlocks;
- (NSOperationQueue)workQueue;
- (NSString)configurationCachePath;
- (SKUIConfigurationPreloader)init;
- (SKUIConfigurationPreloader)initWithConfigurationCachePath:(id)a3;
- (SKUIReloadConfigurationOperation)pendingReloadOperation;
- (id)newReloadConfigurationOperation;
- (void)finishPreloadingConfiguration:(id)a3 error:(id)a4;
- (void)preloadConfigurationForPurpose:(int64_t)a3 withCompletionBlock:(id)a4;
- (void)setLoadedConfiguration:(id)a3;
- (void)setPendingReloadOperation:(id)a3;
@end

@implementation SKUIConfigurationPreloader

- (SKUIConfigurationPreloader)initWithConfigurationCachePath:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIConfigurationPreloader initWithConfigurationCachePath:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIConfigurationPreloader;
  v5 = [(SKUIConfigurationPreloader *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configurationCachePath = v5->_configurationCachePath;
    v5->_configurationCachePath = (NSString *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    workQueue = v5->_workQueue;
    v5->_workQueue = v8;

    [(NSOperationQueue *)v5->_workQueue setName:@"com.apple.storekit.configurationpreloader"];
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionBlocks = v5->_completionBlocks;
    v5->_completionBlocks = v10;
  }
  return v5;
}

- (SKUIConfigurationPreloader)init
{
  v3 = +[SKUIReloadConfigurationOperation cachePath];
  id v4 = [(SKUIConfigurationPreloader *)self initWithConfigurationCachePath:v3];

  return v4;
}

- (BOOL)hasExistingConfigurationCache
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(SKUIConfigurationPreloader *)self configurationCachePath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (id)newReloadConfigurationOperation
{
  return objc_alloc_init(SKUIReloadConfigurationOperation);
}

- (void)preloadConfigurationForPurpose:(int64_t)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  v7 = [(SKUIConfigurationPreloader *)self loadedConfiguration];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28F08] mainQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_3;
    v20[3] = &unk_1E6423A78;
    v20[4] = self;
    id v21 = v6;
    [v8 addOperationWithBlock:v20];
  }
  else if (a3 || ![(SKUIConfigurationPreloader *)self hasExistingConfigurationCache])
  {
    v9 = [(SKUIConfigurationPreloader *)self completionBlocks];
    v10 = (void *)[v6 copy];
    v11 = _Block_copy(v10);
    [v9 addObject:v11];

    v12 = [(SKUIConfigurationPreloader *)self pendingReloadOperation];

    if (!v12)
    {
      id v13 = [(SKUIConfigurationPreloader *)self newReloadConfigurationOperation];
      [(SKUIConfigurationPreloader *)self setPendingReloadOperation:v13];

      if (a3 == 2)
      {
        v14 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
        v15 = SSVDefaultUserAgent();
        [v14 setValue:v15 forHTTPHeaderField:*MEMORY[0x1E4FA8698]];

        v16 = [(SSURLBag *)[SKUIURLBag alloc] initWithURLBagContext:v14];
        [(SKUIReloadConfigurationOperation *)self->_pendingReloadOperation setURLBag:v16];
      }
      objc_initWeak(&location, self);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke;
      v22[3] = &unk_1E6424020;
      objc_copyWeak(&v23, &location);
      v17 = [(SKUIConfigurationPreloader *)self pendingReloadOperation];
      [v17 setOutputBlock:v22];

      v18 = [(SKUIConfigurationPreloader *)self workQueue];
      v19 = [(SKUIConfigurationPreloader *)self pendingReloadOperation];
      [v18 addOperation:v19];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CC08], 0);
  }
}

void __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = [MEMORY[0x1E4F28F08] mainQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E64225B0;
    v9[4] = WeakRetained;
    id v10 = v5;
    id v11 = v6;
    [v8 addOperationWithBlock:v9];
  }
}

uint64_t __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishPreloadingConfiguration:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __81__SKUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) loadedConfiguration];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)finishPreloadingConfiguration:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(SKUIConfigurationPreloader *)self setLoadedConfiguration:v6];
  [(SKUIConfigurationPreloader *)self setPendingReloadOperation:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = [(SKUIConfigurationPreloader *)self completionBlocks];
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

  id v13 = [(SKUIConfigurationPreloader *)self completionBlocks];
  [v13 removeAllObjects];
}

- (NSString)configurationCachePath
{
  return self->_configurationCachePath;
}

- (NSOperationQueue)workQueue
{
  return self->_workQueue;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (SKUIReloadConfigurationOperation)pendingReloadOperation
{
  return self->_pendingReloadOperation;
}

- (void)setPendingReloadOperation:(id)a3
{
}

- (NSDictionary)loadedConfiguration
{
  return self->_loadedConfiguration;
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

- (void)initWithConfigurationCachePath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUIConfigurationPreloader initWithConfigurationCachePath:]";
}

@end