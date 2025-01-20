@interface RadioImageCache
+ (_CFURLCache)_sharedCFURLCache;
+ (__CFURLStorageSession)_newSharedCacheStorageSession;
+ (id)sharedCache;
- (RadioImageCache)init;
- (id)_cachedResponseForRequest:(id)a3;
- (id)_init;
- (id)_requestForRadioArtwork:(id)a3;
- (id)cachedImageDataForRadioArtwork:(id)a3 MIMEType:(id *)a4;
- (id)cachedImageDataForStation:(id)a3 withExactSize:(CGSize)a4 MIMEType:(id *)a5;
- (void)_removeAllCachedImages;
- (void)dealloc;
- (void)loadImageForRadioArtwork:(id)a3 withCompletionHandler:(id)a4;
- (void)loadImageForStation:(id)a3 withSize:(CGSize)a4 completionHandler:(id)a5;
@end

@implementation RadioImageCache

- (void).cxx_destruct
{
}

- (id)_requestForRadioArtwork:(id)a3
{
  v3 = [a3 URL];
  if (v3)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:v3];
    uint64_t v5 = [(id)objc_opt_class() _newSharedCacheStorageSession];
    if (v5)
    {
      v6 = (const void *)v5;
      id v4 = v4;
      [v4 _CFURLRequest];
      _CFURLRequestSetStorageSession();
      CFRelease(v6);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_cachedResponseForRequest:(id)a3
{
  [a3 _CFURLRequest];
  if ([(id)objc_opt_class() _sharedCFURLCache] && (uint64_t v3 = CFURLCacheCopyResponseForRequest()) != 0)
  {
    id v4 = (const void *)v3;
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFC5C8]) _initWithCFCachedURLResponse:v3];
    CFRelease(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)_removeAllCachedImages
{
  if ([(id)objc_opt_class() _sharedCFURLCache])
  {
    MEMORY[0x270EE2920]();
  }
}

- (void)loadImageForStation:(id)a3 withSize:(CGSize)a4 completionHandler:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  v10 = [a3 artworkCollection];
  objc_msgSend(v10, "bestArtworkForPointSize:", width, height);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [(RadioImageCache *)self loadImageForRadioArtwork:v11 withCompletionHandler:v9];
}

- (void)loadImageForRadioArtwork:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RadioImageCache *)self _requestForRadioArtwork:v6];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F086D0]);
    objc_initWeak(&location, v9);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_2;
    v11[3] = &unk_2643A9E30;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    id v12 = v8;
    [v9 addExecutionBlock:v11];
    [(NSOperationQueue *)self->_imageRequestQueue addOperation:v9];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke;
    block[3] = &unk_2643A9DB8;
    id v17 = v7;
    dispatch_async(v10, block);

    id v9 = v17;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && ![WeakRetained isCancelled])
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__5;
    v45 = __Block_byref_object_dispose__6;
    v46 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__5;
    v39 = __Block_byref_object_dispose__6;
    id v40 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__5;
    v33[4] = __Block_byref_object_dispose__6;
    id v34 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v8 = [MEMORY[0x263EFC640] sharedSession];
    uint64_t v9 = *(void *)(a1 + 32);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_15;
    v28[3] = &unk_2643A9DE0;
    v30 = &v35;
    v31 = &v41;
    v32 = v33;
    v10 = v7;
    v29 = v10;
    id v11 = [v8 dataTaskWithRequest:v9 completionHandler:v28];

    if (v11)
    {
      [v11 resume];
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (!v36[5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = (id)v42[5];
        uint64_t v13 = [v12 statusCode];
        uint64_t v14 = v13;
        if (v13 > 399 || !v13)
        {
          v15 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
          v16 = [NSNumber numberWithInteger:v14];
          [v15 setObject:v16 forKey:@"statusCode"];

          id v17 = [MEMORY[0x263EFC5E0] localizedStringForStatusCode:v14];
          if (v17) {
            [v15 setObject:v17 forKey:*MEMORY[0x263F08320]];
          }
          uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1 userInfo:v15];
          v19 = (void *)v36[5];
          v36[5] = v18;
        }
      }
    }
    if (v36[5])
    {
      v20 = 0;
    }
    else
    {
      v20 = [(id)v42[5] MIMEType];
    }
    v21 = *(void **)(a1 + 40);
    if (v21)
    {
      v22 = dispatch_get_global_queue(0, 0);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_2_23;
      v23[3] = &unk_2643A9E08;
      id v25 = v21;
      v26 = v33;
      id v24 = v20;
      v27 = &v35;
      dispatch_async(v22, v23);
    }
    _Block_object_dispose(v33, 8);

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);
    id v6 = v46;
    goto LABEL_21;
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_3;
    block[3] = &unk_2643A9DB8;
    id v48 = v4;
    dispatch_async(v5, block);

    id v6 = v48;
LABEL_21:
  }
}

void __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-999 userInfo:0];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

void __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  id v15 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
  id v11 = v8;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_2_23(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4], *(void *)(*(void *)(a1[7] + 8) + 40));
}

- (id)cachedImageDataForStation:(id)a3 withExactSize:(CGSize)a4 MIMEType:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v9 = [a3 artworkCollection];
  v10 = objc_msgSend(v9, "bestArtworkForPointSize:", width, height);

  [v10 pointSize];
  if (width == v12 && height == v11)
  {
    id v14 = [(RadioImageCache *)self cachedImageDataForRadioArtwork:v10 MIMEType:a5];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)cachedImageDataForRadioArtwork:(id)a3 MIMEType:(id *)a4
{
  id v6 = [(RadioImageCache *)self _requestForRadioArtwork:a3];
  if (v6)
  {
    id v7 = [(RadioImageCache *)self _cachedResponseForRequest:v6];
    id v8 = v7;
    if (a4)
    {
      uint64_t v9 = [v7 response];
      *a4 = [v9 MIMEType];
    }
    id v10 = [v8 data];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  }

  return v10;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_imageRequestQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)RadioImageCache;
  [(RadioImageCache *)&v3 dealloc];
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)RadioImageCache;
  id v2 = [(RadioImageCache *)&v6 init];
  if (v2)
  {
    objc_super v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    imageRequestQueue = v2->_imageRequestQueue;
    v2->_imageRequestQueue = v3;

    [(NSOperationQueue *)v2->_imageRequestQueue setMaxConcurrentOperationCount:5];
    [(NSOperationQueue *)v2->_imageRequestQueue setName:@"com.apple.Radio.RadioImageCache.imageRequestQueue"];
  }
  return v2;
}

- (RadioImageCache)init
{
  return 0;
}

+ (__CFURLStorageSession)_newSharedCacheStorageSession
{
  if (_newSharedCacheStorageSession_sOnce != -1) {
    dispatch_once(&_newSharedCacheStorageSession_sOnce, &__block_literal_global);
  }
  result = (__CFURLStorageSession *)_newSharedCacheStorageSession_storageSession;
  if (_newSharedCacheStorageSession_storageSession)
  {
    result = (__CFURLStorageSession *)CFRetain((CFTypeRef)_newSharedCacheStorageSession_storageSession);
    _newSharedCacheStorageSession_storageSession = (uint64_t)result;
  }
  return result;
}

void __48__RadioImageCache__newSharedCacheStorageSession__block_invoke()
{
  v0 = (void *)MEMORY[0x21D490510]();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263EFC6E8], (const void *)*MEMORY[0x263EFFB40]);
  _newSharedCacheStorageSession_storageSession = _CFURLStorageSessionCreate();
  CFRelease(Mutable);
}

+ (_CFURLCache)_sharedCFURLCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__RadioImageCache__sharedCFURLCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_sharedCFURLCache_sOnce != -1) {
    dispatch_once(&_sharedCFURLCache_sOnce, block);
  }
  return (_CFURLCache *)_sharedCFURLCache__shared;
}

void __36__RadioImageCache__sharedCFURLCache__block_invoke()
{
  uint64_t v0 = [(id)objc_opt_class() _newSharedCacheStorageSession];
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    uint64_t v2 = _CFURLStorageSessionCopyCache();
    if (v2)
    {
      uint64_t v3 = v2;
      CFURLCacheSetMemoryCapacity();
      _sharedCFURLCache__shared = v3;
    }
    CFRelease(v1);
  }
}

+ (id)sharedCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__RadioImageCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, block);
  }
  uint64_t v2 = (void *)sharedCache___imageCache;
  return v2;
}

uint64_t __30__RadioImageCache_sharedCache__block_invoke()
{
  sharedCache___imageCache = [objc_alloc((Class)objc_opt_class()) _init];
  return MEMORY[0x270F9A758]();
}

@end