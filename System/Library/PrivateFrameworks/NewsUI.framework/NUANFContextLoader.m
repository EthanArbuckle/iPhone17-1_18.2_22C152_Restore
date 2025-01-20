@interface NUANFContextLoader
- (BOOL)hasLoaded;
- (FCANFContent)anfContent;
- (FCAsyncOnceOperation)asyncOnceOperation;
- (FCFlintResourceManager)flintResourceManager;
- (FCHeadlineProviding)headline;
- (FCNetworkReachabilityType)networkReachability;
- (NSError)contextError;
- (NSOperationQueue)imageDecodingQueue;
- (NUANFAssetLoader)assetLoader;
- (NUANFContextLoader)initWithANFContent:(id)a3 flintResourceManager:(id)a4 networkReachability:(id)a5 host:(id)a6 resourceURLTranslator:(id)a7 headline:(id)a8;
- (NUArticleResourceURLTranslator)resourceURLTranslator;
- (SXContext)context;
- (SXHost)host;
- (id)asyncLoadContextOnceWithCompletion:(id)a3;
- (id)fallbackAssetForImageRequest:(id)a3 original:(id)a4;
- (id)loadContextWithCompletion:(id)a3;
- (id)loadImagesForImageRequest:(id)a3 completionBlock:(id)a4;
- (id)translateURL:(id)a3;
- (int64_t)relativePriority;
- (void)fileURLForURL:(id)a3 onCompletion:(id)a4 onError:(id)a5;
- (void)setAssetLoader:(id)a3;
- (void)setAsyncOnceOperation:(id)a3;
- (void)setContext:(id)a3;
- (void)setContextError:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
@end

@implementation NUANFContextLoader

void __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = [v5 data];
    if (v10)
    {
      id v28 = v6;
      v11 = NSURL;
      v12 = [v9 headline];
      v13 = [v12 articleID];
      uint64_t v27 = objc_msgSend(v11, "nss_NewsURLForArticleID:", v13);

      id v14 = objc_alloc(MEMORY[0x263F6C5F0]);
      v15 = [v9 anfContent];
      v16 = [v15 identifier];
      v17 = [v9 host];
      id v29 = 0;
      v18 = (void *)[v14 initWithIdentifier:v16 shareURL:v27 JSONData:v10 resourceDataSource:v9 host:v17 error:&v29];
      id v19 = v29;
      [v9 setContext:v18];

      [v9 setContextError:v19];
      v9[8] = 1;
      v20 = [NUANFAssetLoader alloc];
      v21 = [v9 context];
      v22 = [v9 flintResourceManager];
      v23 = [(NUANFAssetLoader *)v20 initWithContext:v21 flintResourceManager:v22];
      [v9 setAssetLoader:v23];

      uint64_t v24 = [a1[4] relativePriority];
      v25 = [v9 assetLoader];
      [v25 setRelativePriority:v24];

      id v6 = v28;
      (*((void (**)(void))a1[5] + 2))();

      v26 = (void *)v27;
    }
    else
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke_3;
      v30[3] = &unk_2645FE180;
      v30[4] = v9;
      id v31 = v6;
      id v32 = a1[5];
      __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke_3((uint64_t)v30);

      v26 = v31;
    }
  }
  else
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke_2;
    v33[3] = &unk_2645FE158;
    v34 = a1[5];
    __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke_2((uint64_t)v33);
    v9 = v34;
  }
}

- (SXHost)host
{
  return self->_host;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (id)asyncLoadContextOnceWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(NUANFContextLoader *)self anfContent];
  int64_t v6 = [(NUANFContextLoader *)self relativePriority];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke;
  v10[3] = &unk_2645FE298;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  v10[4] = self;
  id v11 = v7;
  v8 = [v5 fetchANFDocumentDataProviderWithPriority:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (FCANFContent)anfContent
{
  return self->_anfContent;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
  id v5 = [(NUANFContextLoader *)self asyncOnceOperation];
  [v5 setRelativePriority:a3];

  id v6 = [(NUANFContextLoader *)self assetLoader];
  [v6 setRelativePriority:a3];
}

- (FCAsyncOnceOperation)asyncOnceOperation
{
  return self->_asyncOnceOperation;
}

- (id)loadContextWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void))a3;
  uint64_t v5 = [(NUANFContextLoader *)self context];
  if (v5
    && (id v6 = (void *)v5,
        [(NUANFContextLoader *)self assetLoader],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = [(NUANFContextLoader *)self context];
    v9 = [(NUANFContextLoader *)self assetLoader];
    v4[2](v4, v8, v9, 0);

    v10 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    id v11 = [(NUANFContextLoader *)self asyncOnceOperation];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __48__NUANFContextLoader_loadContextWithCompletion___block_invoke;
    v13[3] = &unk_2645FE130;
    objc_copyWeak(&v15, &location);
    id v14 = v4;
    v10 = [v11 executeWithCompletionHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (NUANFContextLoader)initWithANFContent:(id)a3 flintResourceManager:(id)a4 networkReachability:(id)a5 host:(id)a6 resourceURLTranslator:(id)a7 headline:(id)a8
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)NUANFContextLoader;
  v18 = [(NUANFContextLoader *)&v28 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_anfContent, a3);
    objc_storeStrong((id *)&v19->_flintResourceManager, a4);
    objc_storeStrong((id *)&v19->_networkReachability, a5);
    objc_storeStrong((id *)&v19->_host, a6);
    objc_storeStrong((id *)&v19->_resourceURLTranslator, a7);
    objc_storeStrong((id *)&v19->_headline, a8);
    v19->_relativePriority = 0;
    uint64_t v20 = [objc_alloc(MEMORY[0x263F59390]) initWithTarget:v19 selector:sel_asyncLoadContextOnceWithCompletion_];
    asyncOnceOperation = v19->_asyncOnceOperation;
    v19->_asyncOnceOperation = (FCAsyncOnceOperation *)v20;

    v22 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    imageDecodingQueue = v19->_imageDecodingQueue;
    v19->_imageDecodingQueue = v22;

    [(NSOperationQueue *)v19->_imageDecodingQueue setMaxConcurrentOperationCount:2];
    [(NSOperationQueue *)v19->_imageDecodingQueue setQualityOfService:17];
  }

  return v19;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (SXContext)context
{
  return self->_context;
}

- (NUANFAssetLoader)assetLoader
{
  return self->_assetLoader;
}

void __48__NUANFContextLoader_loadContextWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v8 = WeakRetained;
    id v4 = WeakRetained;
    uint64_t v5 = [v4 context];
    id v6 = [v4 assetLoader];
    id v7 = [v4 contextError];

    (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v5, v6, v7);
    id WeakRetained = v8;
  }
}

- (id)loadImagesForImageRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  objc_initWeak(&location, self);
  id v8 = [(NUANFContextLoader *)self assetLoader];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke;
  v20[3] = &unk_2645FE1F8;
  objc_copyWeak(&v24, &location);
  id v9 = v7;
  id v22 = v9;
  v23 = v26;
  id v10 = v6;
  id v21 = v10;
  id v11 = [v8 loadAssetURLsWithCompletion:v20];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_10;
  v16[3] = &unk_2645FE220;
  id v18 = v9;
  id v19 = v26;
  id v17 = v11;
  id v12 = v9;
  id v13 = v11;
  id v14 = (void *)MEMORY[0x223C968A0](v16);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(v26, 8);

  return v14;
}

void __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_3;
      v17[3] = &unk_2645FE158;
      id v18 = *(id *)(a1 + 40);
      __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_3((uint64_t)v17);
    }
    else
    {
      id v7 = [v5 assetLoader];
      id v8 = [*(id *)(a1 + 32) URL];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_4;
      v12[3] = &unk_2645FE1D0;
      objc_copyWeak(&v16, v2);
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      id v14 = v9;
      uint64_t v15 = v10;
      v12[4] = v6;
      id v13 = *(id *)(a1 + 32);
      id v11 = (id)[v7 loadAssetWithURL:v8 completion:v12];

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_2;
    v19[3] = &unk_2645FE158;
    id v20 = *(id *)(a1 + 40);
    __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_2((uint64_t)v19);
    id v6 = v20;
  }
}

uint64_t __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_6;
      v18[3] = &unk_2645FE158;
      id v19 = *(id *)(a1 + 48);
      __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_6((uint64_t)v18);
      id v7 = v19;
    }
    else
    {
      id v8 = [v3 assetHandle];
      id v9 = [v8 filePath];

      if (!v9)
      {
        uint64_t v10 = [*(id *)(a1 + 32) fallbackAssetForImageRequest:*(void *)(a1 + 40) original:v8];

        id v8 = (void *)v10;
      }
      id v11 = [v6 imageDecodingQueue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_7;
      v14[3] = &unk_2645FE1A8;
      long long v13 = *(_OWORD *)(a1 + 48);
      id v12 = (id)v13;
      long long v17 = v13;
      id v15 = v8;
      id v16 = *(id *)(a1 + 40);
      id v7 = v8;
      [v11 addOperationWithBlock:v14];
    }
  }
  else
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_5;
    v20[3] = &unk_2645FE158;
    id v21 = *(id *)(a1 + 48);
    __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_5((uint64_t)v20);
    id v6 = v21;
  }
}

uint64_t __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_7(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_8;
    v10[3] = &unk_2645FE158;
    id v11 = *(id *)(a1 + 48);
    __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_8((uint64_t)v10);
    id v2 = v11;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) fileURL];
    uint64_t v4 = [*(id *)(a1 + 40) preserveColorspace];
    [*(id *)(a1 + 40) size];
    id v5 = +[NUANFImageResolver imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:](NUANFImageResolver, "imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:", v3, v4, 4);

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_9;
    v6[3] = &unk_2645FE180;
    id v7 = *(id *)(a1 + 40);
    id v8 = v5;
    id v9 = *(id *)(a1 + 48);
    id v2 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

uint64_t __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_9(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) loadingBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) loadingBlock];
    v3[2](v3, *(void *)(a1 + 40));
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    v6[0] = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t __64__NUANFContextLoader_loadImagesForImageRequest_completionBlock___block_invoke_10(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  [*(id *)(a1 + 32) cancel];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)fileURLForURL:(id)a3 onCompletion:(id)a4 onError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NUANFContextLoader *)self assetLoader];
  id v12 = [v11 resourceIDForResourceURL:v8];

  objc_initWeak(&location, self);
  long long v13 = [(NUANFContextLoader *)self assetLoader];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke;
  v18[3] = &unk_2645FE270;
  objc_copyWeak(&v22, &location);
  id v14 = v10;
  id v20 = v14;
  id v15 = v12;
  id v19 = v15;
  id v16 = v9;
  id v21 = v16;
  id v17 = (id)[v13 loadAssetURLsWithCompletion:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained assetLoader];
    id v5 = [v4 resourceForID:*(void *)(a1 + 32)];

    id v6 = [v5 assetHandle];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_3;
    v9[3] = &unk_2645FE248;
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    id v7 = v5;
    id v8 = (id)[v6 downloadIfNeededWithCompletion:v9];
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_2;
    v13[3] = &unk_2645FE158;
    id v14 = *(id *)(a1 + 40);
    __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_2((uint64_t)v13);
    id v7 = v14;
  }
}

uint64_t __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_3(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_4;
  block[3] = &unk_2645FE248;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__NUANFContextLoader_fileURLForURL_onCompletion_onError___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fileURL];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) fileURL];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

- (id)translateURL:(id)a3
{
  id v4 = a3;
  id v5 = [(NUANFContextLoader *)self resourceURLTranslator];
  id v6 = [v5 translateFileURLForURL:v4];

  return v6;
}

uint64_t __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__NUANFContextLoader_asyncLoadContextOnceWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setContextError:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (id)fallbackAssetForImageRequest:(id)a3 original:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NUANFContextLoader *)self networkReachability];
  int v9 = [v8 isNetworkReachable];

  if (v9)
  {
    uint64_t v42 = MEMORY[0x263EF8330];
    uint64_t v43 = 3221225472;
    v44 = __60__NUANFContextLoader_fallbackAssetForImageRequest_original___block_invoke;
    v45 = &unk_2645FE2C0;
    id v46 = v7;
    id v10 = v46;
    id v11 = v10;
  }
  else
  {
    id v12 = [(NUANFContextLoader *)self context];
    long long v13 = [v12 documentController];
    v37 = v6;
    id v14 = [v6 imageIdentifier];
    id v11 = [v13 allResourcesForImageIdentifier:v14];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v15 = [v11 reverseObjectEnumerator];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v21 = [(NUANFContextLoader *)self assetLoader];
          id v22 = [v20 URL];
          v23 = [v21 resourceIDForResourceURL:v22];

          id v24 = [(NUANFContextLoader *)self assetLoader];
          id v25 = [v24 fallbackResourceForID:v23];

          if (v25 && ([v25 isOnDisk] & 1) != 0)
          {
            v34 = [v25 assetHandle];

            id v6 = v37;
            goto LABEL_18;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    id v6 = v37;
    id v26 = [v37 imageIdentifier];
    char v27 = [(NUANFContextLoader *)self context];
    objc_super v28 = [v27 documentController];
    id v29 = [v28 metadata];
    v30 = [v29 thumbnailImageIdentifier];
    int v31 = [v26 isEqualToString:v30];

    if (v31)
    {
      id v32 = [(NUANFContextLoader *)self headline];
      v33 = FCCachedThumbnailForHeadline();
      v34 = [v33 thumbnailAssetHandle];

      v35 = [v34 filePath];

      if (v35) {
        goto LABEL_18;
      }
    }
    id v10 = v7;
  }
  v34 = v10;
LABEL_18:

  return v34;
}

id __60__NUANFContextLoader_fallbackAssetForImageRequest_original___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setContext:(id)a3
{
}

- (NSError)contextError
{
  return self->_contextError;
}

- (void)setContextError:(id)a3
{
}

- (void)setAssetLoader:(id)a3
{
}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (NUArticleResourceURLTranslator)resourceURLTranslator
{
  return self->_resourceURLTranslator;
}

- (void)setAsyncOnceOperation:(id)a3
{
}

- (NSOperationQueue)imageDecodingQueue
{
  return self->_imageDecodingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_imageDecodingQueue, 0);
  objc_storeStrong((id *)&self->_asyncOnceOperation, 0);
  objc_storeStrong((id *)&self->_resourceURLTranslator, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_anfContent, 0);
  objc_storeStrong((id *)&self->_assetLoader, 0);
  objc_storeStrong((id *)&self->_contextError, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end