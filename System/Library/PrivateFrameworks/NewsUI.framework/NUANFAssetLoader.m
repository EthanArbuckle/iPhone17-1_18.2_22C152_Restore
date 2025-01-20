@interface NUANFAssetLoader
- (FCAsyncOnceOperation)assetURLsOperation;
- (FCAsyncOnceOperation)assetsOperation;
- (FCFlintResourceManager)flintResourceManager;
- (NSArray)resourceIDs;
- (NSMutableDictionary)fetchedResourceIDs;
- (NUANFAssetLoader)initWithContext:(id)a3 flintResourceManager:(id)a4;
- (SXContext)context;
- (id)assetDownloadOperationForResource:(id)a3 completion:(id)a4;
- (id)asyncLoadAssetURLsOnceWithCompletion:(id)a3;
- (id)asyncLoadAssetsOnceWithCompletion:(id)a3;
- (id)fallbackResourceForID:(id)a3;
- (id)loadAssetURLsWithCompletion:(id)a3;
- (id)loadAssetWithURL:(id)a3 completion:(id)a4;
- (id)loadAssetsWithCompletion:(id)a3;
- (id)resourceForID:(id)a3;
- (id)resourceIDForResourceURL:(id)a3;
- (int64_t)relativePriority;
- (void)setAssetURLsOperation:(id)a3;
- (void)setContext:(id)a3;
- (void)setFetchedResourceIDs:(id)a3;
- (void)setFlintResourceManager:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)setResourceIDs:(id)a3;
@end

@implementation NUANFAssetLoader

- (NUANFAssetLoader)initWithContext:(id)a3 flintResourceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NUANFAssetLoader;
  v9 = [(NUANFAssetLoader *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_flintResourceManager, a4);
    v10->_relativePriority = 0;
    uint64_t v11 = objc_opt_new();
    fetchedResourceIDs = v10->_fetchedResourceIDs;
    v10->_fetchedResourceIDs = (NSMutableDictionary *)v11;

    v13 = [v7 documentController];
    v14 = [v13 requiredResourceURLs];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __57__NUANFAssetLoader_initWithContext_flintResourceManager___block_invoke;
    v25[3] = &unk_2645FF7A0;
    v15 = v10;
    v26 = v15;
    uint64_t v16 = objc_msgSend(v14, "fc_arrayByTransformingWithBlock:", v25);
    resourceIDs = v15->_resourceIDs;
    v15->_resourceIDs = (NSArray *)v16;

    v18 = [v8 cachedResourcesWithIdentifiers:v15->_resourceIDs];
    v19 = objc_msgSend(v18, "fc_dictionaryWithKeySelector:", sel_resourceID);

    [(NSMutableDictionary *)v10->_fetchedResourceIDs addEntriesFromDictionary:v19];
    uint64_t v20 = [objc_alloc(MEMORY[0x263F59390]) initWithTarget:v15 selector:sel_asyncLoadAssetURLsOnceWithCompletion_];
    assetURLsOperation = v15->_assetURLsOperation;
    v15->_assetURLsOperation = (FCAsyncOnceOperation *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x263F59390]) initWithTarget:v15 selector:sel_asyncLoadAssetsOnceWithCompletion_];
    assetsOperation = v15->_assetsOperation;
    v15->_assetsOperation = (FCAsyncOnceOperation *)v22;
  }
  return v10;
}

uint64_t __57__NUANFAssetLoader_initWithContext_flintResourceManager___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resourceIDForResourceURL:a2];
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
  v5 = [(NUANFAssetLoader *)self assetURLsOperation];
  [v5 setRelativePriority:a3];

  id v6 = [(NUANFAssetLoader *)self assetsOperation];
  [v6 setRelativePriority:a3];
}

- (id)loadAssetURLsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(NUANFAssetLoader *)self assetURLsOperation];
  id v6 = [v5 executeWithCompletionHandler:v4];

  return v6;
}

- (id)loadAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(NUANFAssetLoader *)self assetsOperation];
  id v6 = [v5 executeWithCompletionHandler:v4];

  return v6;
}

- (id)loadAssetWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__2;
  v24[4] = __Block_byref_object_dispose__2;
  id v25 = 0;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke;
  v18[3] = &unk_2645FF7C8;
  objc_copyWeak(&v22, &location);
  id v8 = v7;
  id v20 = v8;
  id v9 = v6;
  id v19 = v9;
  v21 = v24;
  v10 = [(NUANFAssetLoader *)self loadAssetURLsWithCompletion:v18];
  uint64_t v11 = (void *)MEMORY[0x263F593D8];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_5;
  v15[3] = &unk_2645FF7F0;
  id v12 = v10;
  id v16 = v12;
  v17 = v24;
  v13 = [v11 cancelHandlerWithBlock:v15];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(v24, 8);

  return v13;
}

void __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v5 = [v4 resourceIDForResourceURL:*(void *)(a1 + 32)];
    id v6 = [v4 resourceForID:v5];
    if (v6)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_4;
      v11[3] = &unk_2645FF4D8;
      id v7 = &v13;
      id v13 = *(id *)(a1 + 40);
      id v12 = v6;
      uint64_t v8 = [v4 assetDownloadOperationForResource:v12 completion:v11];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_3;
      v14[3] = &unk_2645FE158;
      id v7 = &v15;
      id v15 = *(id *)(a1 + 40);
      __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_3((uint64_t)v14);
    }
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_2;
    v16[3] = &unk_2645FE158;
    id v17 = *(id *)(a1 + 40);
    __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_2((uint64_t)v16);
    id v4 = v17;
  }
}

uint64_t __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __48__NUANFAssetLoader_loadAssetWithURL_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v2 cancel];
}

- (id)resourceIDForResourceURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  if ([v4 isEqualToString:@"asset"])
  {
    v5 = [v3 host];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)resourceForID:(id)a3
{
  id v4 = a3;
  v5 = [(NUANFAssetLoader *)self fetchedResourceIDs];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)fallbackResourceForID:(id)a3
{
  id v4 = a3;
  v5 = [(NUANFAssetLoader *)self flintResourceManager];
  id v6 = [v5 cachedResourceWithIdentifier:v4];

  return v6;
}

- (id)asyncLoadAssetURLsOnceWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(NUANFAssetLoader *)self flintResourceManager];
  id v6 = [(NUANFAssetLoader *)self resourceIDs];
  int64_t v7 = [(NUANFAssetLoader *)self relativePriority];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__NUANFAssetLoader_asyncLoadAssetURLsOnceWithCompletion___block_invoke;
  v11[3] = &unk_2645FF818;
  void v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  uint64_t v9 = [v5 fetchResourcesWithIdentifiers:v6 downloadAssets:0 relativePriority:v7 callBackQueue:MEMORY[0x263EF83A0] completionBlock:v11];

  return v9;
}

uint64_t __57__NUANFAssetLoader_asyncLoadAssetURLsOnceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08B88];
  id v4 = a2;
  [v3 isMainThread];
  v5 = [*(id *)(a1 + 32) fetchedResourceIDs];
  [v5 addEntriesFromDictionary:v4];

  [v4 count];
  id v6 = [*(id *)(a1 + 32) fetchedResourceIDs];
  [v6 count];

  int64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

- (id)asyncLoadAssetsOnceWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NUANFAssetLoader *)self fetchedResourceIDs];
  id v6 = [(NUANFAssetLoader *)self resourceIDs];
  int64_t v7 = objc_msgSend(v5, "nf_objectsForKeysWithoutMarker:", v6);

  id v8 = objc_msgSend(v7, "fc_subarrayWithMaxCount:", 50);
  uint64_t v9 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_14);
  v10 = (void *)[objc_alloc(MEMORY[0x263F59380]) initWithAssetHandles:v9];
  [v10 setPurpose:*MEMORY[0x263F592D8]];
  [v10 setShouldFailOnMissingObjects:1];
  objc_msgSend(v10, "setRelativePriority:", -[NUANFAssetLoader relativePriority](self, "relativePriority"));
  [v10 setFetchCompletionQueue:MEMORY[0x263EF83A0]];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__NUANFAssetLoader_asyncLoadAssetsOnceWithCompletion___block_invoke_2;
  v16[3] = &unk_2645FF860;
  id v11 = v4;
  id v17 = v11;
  [v10 setFetchCompletionBlock:v16];
  id v12 = objc_msgSend(MEMORY[0x263F08A48], "fc_sharedConcurrentQueue");
  [v12 addOperation:v10];

  id v13 = NUArticleLoadLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v10 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    id v19 = v14;
    _os_log_impl(&dword_2221C5000, v13, OS_LOG_TYPE_DEFAULT, "Article data loader will prefetch assets with operation=%{public}@", buf, 0xCu);
  }

  return v10;
}

uint64_t __54__NUANFAssetLoader_asyncLoadAssetsOnceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetHandle];
}

uint64_t __54__NUANFAssetLoader_asyncLoadAssetsOnceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [a2 status] == 0;
  id v4 = *(uint64_t (**)(uint64_t, BOOL))(v2 + 16);

  return v4(v2, v3);
}

- (id)assetDownloadOperationForResource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 assetHandle];
  id v8 = objc_msgSend(v7, "downloadIfNeededWithPriority:completion:", -[NUANFAssetLoader relativePriority](self, "relativePriority"), v6);

  return v8;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (SXContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

- (void)setFlintResourceManager:(id)a3
{
}

- (NSArray)resourceIDs
{
  return self->_resourceIDs;
}

- (void)setResourceIDs:(id)a3
{
}

- (NSMutableDictionary)fetchedResourceIDs
{
  return self->_fetchedResourceIDs;
}

- (void)setFetchedResourceIDs:(id)a3
{
}

- (FCAsyncOnceOperation)assetURLsOperation
{
  return self->_assetURLsOperation;
}

- (void)setAssetURLsOperation:(id)a3
{
}

- (FCAsyncOnceOperation)assetsOperation
{
  return self->_assetsOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsOperation, 0);
  objc_storeStrong((id *)&self->_assetURLsOperation, 0);
  objc_storeStrong((id *)&self->_fetchedResourceIDs, 0);
  objc_storeStrong((id *)&self->_resourceIDs, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end