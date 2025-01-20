@interface PXAudioAssetImageProvider
- (NSCache)imageCache;
- (NSCountedSet)requestCountByCacheSpec;
- (NSMutableDictionary)imageLoaderByIdentifier;
- (NSMutableDictionary)requestByClientID;
- (NSMutableDictionary)requestIDByCacheSpec;
- (NSMutableDictionary)requestsByImageLoaderIdentifier;
- (OS_os_log)log;
- (PXAudioAssetImageProvider)init;
- (id)createImageLoaderForRequest:(id)a3;
- (id)imageCacheKeyForRequest:(id)a3;
- (id)imageLoaderCoalescingKeyForRequest:(id)a3;
- (id)resultForCompletedImageLoader:(id)a3 request:(id)a4 error:(id *)a5;
- (int64_t)requestCounter;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (void)_handleImageLoaderCompletionForIdentifier:(id)a3;
- (void)cancelImageRequest:(int64_t)a3;
- (void)setRequestCounter:(int64_t)a3;
- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
- (void)stopCachingImagesForAllAssets;
- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
@end

@implementation PXAudioAssetImageProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_imageLoaderByIdentifier, 0);
  objc_storeStrong((id *)&self->_requestsByImageLoaderIdentifier, 0);
  objc_storeStrong((id *)&self->_requestCountByCacheSpec, 0);
  objc_storeStrong((id *)&self->_requestIDByCacheSpec, 0);
  objc_storeStrong((id *)&self->_requestByClientID, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (NSMutableDictionary)imageLoaderByIdentifier
{
  return self->_imageLoaderByIdentifier;
}

- (NSMutableDictionary)requestsByImageLoaderIdentifier
{
  return self->_requestsByImageLoaderIdentifier;
}

- (NSCountedSet)requestCountByCacheSpec
{
  return self->_requestCountByCacheSpec;
}

- (NSMutableDictionary)requestIDByCacheSpec
{
  return self->_requestIDByCacheSpec;
}

- (NSMutableDictionary)requestByClientID
{
  return self->_requestByClientID;
}

- (void)setRequestCounter:(int64_t)a3
{
  self->_requestCounter = a3;
}

- (int64_t)requestCounter
{
  return self->_requestCounter;
}

- (void)_handleImageLoaderCompletionForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXAudioAssetImageProvider *)self imageLoaderByIdentifier];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    v7 = [(PXAudioAssetImageProvider *)self imageLoaderByIdentifier];
    [v7 setObject:0 forKeyedSubscript:v4];

    v8 = [(PXAudioAssetImageProvider *)self requestsByImageLoaderIdentifier];
    v9 = [v8 objectForKeyedSubscript:v4];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __71__PXAudioAssetImageProvider__handleImageLoaderCompletionForIdentifier___block_invoke;
    v15 = &unk_1E5DB4C30;
    v16 = self;
    id v17 = v6;
    [v9 enumerateObjectsUsingBlock:&v12];
    v10 = [(PXAudioAssetImageProvider *)self requestsByImageLoaderIdentifier];
    v11 = [v10 objectForKeyedSubscript:v4];
    [v11 removeAllObjects];
  }
}

void __71__PXAudioAssetImageProvider__handleImageLoaderCompletionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v20 = 0;
  v6 = [v4 resultForCompletedImageLoader:v5 request:v3 error:&v20];
  id v7 = v20;
  v8 = v7;
  if (v6)
  {
    v9 = [*(id *)(a1 + 32) imageCacheKeyForRequest:v3];
    v10 = [*(id *)(a1 + 32) imageCache];
    [v10 setObject:v6 forKey:v9];

    v11 = [v3 resultHandler];
    ((void (**)(void, void *, void))v11)[2](v11, v6, 0);

    uint64_t v12 = [*(id *)(a1 + 32) log];
    uint64_t v13 = [v3 signpostID];
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)v19 = 0;
LABEL_11:
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_END, v14, "AudioAssetImageProviderResultDelivery", "", v19, 2u);
      }
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v21 = *MEMORY[0x1E4F39698];
      v22[0] = v7;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    }
    else
    {
      v9 = 0;
    }
    v15 = [v3 resultHandler];
    ((void (**)(void, void, void *))v15)[2](v15, 0, v9);

    uint64_t v12 = [*(id *)(a1 + 32) log];
    uint64_t v16 = [v3 signpostID];
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v16;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)v19 = 0;
        goto LABEL_11;
      }
    }
  }

  id v17 = [*(id *)(a1 + 32) requestByClientID];
  v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "requestID"));
  [v17 setObject:0 forKeyedSubscript:v18];
}

- (id)resultForCompletedImageLoader:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  [v10 handleFailureInMethod:a2, self, @"PXAudioAssetImageProvider.m", 183, @"Method %s is a responsibility of subclass %@", "-[PXAudioAssetImageProvider resultForCompletedImageLoader:request:error:]", v12 object file lineNumber description];

  abort();
}

- (id)createImageLoaderForRequest:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXAudioAssetImageProvider.m", 179, @"Method %s is a responsibility of subclass %@", "-[PXAudioAssetImageProvider createImageLoaderForRequest:]", v8 object file lineNumber description];

  abort();
}

- (id)imageLoaderCoalescingKeyForRequest:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXAudioAssetImageProvider.m", 175, @"Method %s is a responsibility of subclass %@", "-[PXAudioAssetImageProvider imageLoaderCoalescingKeyForRequest:]", v8 object file lineNumber description];

  abort();
}

- (id)imageCacheKeyForRequest:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXAudioAssetImageProvider.m", 171, @"Method %s is a responsibility of subclass %@", "-[PXAudioAssetImageProvider imageCacheKeyForRequest:]", v8 object file lineNumber description];

  abort();
}

- (void)cancelImageRequest:(int64_t)a3
{
  id v5 = [(PXAudioAssetImageProvider *)self requestByClientID];
  v6 = [NSNumber numberWithInteger:a3];
  id v18 = [v5 objectForKeyedSubscript:v6];

  id v7 = v18;
  if (v18)
  {
    id v8 = [(PXAudioAssetImageProvider *)self requestByClientID];
    id v9 = [NSNumber numberWithInteger:a3];
    [v8 setObject:0 forKeyedSubscript:v9];

    v10 = [(PXAudioAssetImageProvider *)self imageLoaderCoalescingKeyForRequest:v18];
    v11 = [(PXAudioAssetImageProvider *)self requestsByImageLoaderIdentifier];
    uint64_t v12 = [v11 objectForKeyedSubscript:v10];
    [v12 removeObject:v18];

    uint64_t v13 = [(PXAudioAssetImageProvider *)self requestsByImageLoaderIdentifier];
    os_signpost_id_t v14 = [v13 objectForKeyedSubscript:v10];
    uint64_t v15 = [v14 count];

    if (!v15)
    {
      uint64_t v16 = [(PXAudioAssetImageProvider *)self requestsByImageLoaderIdentifier];
      [v16 setObject:0 forKeyedSubscript:v10];

      id v17 = [(PXAudioAssetImageProvider *)self imageLoaderByIdentifier];
      [v17 setObject:0 forKeyedSubscript:v10];
    }
    id v7 = v18;
  }
}

- (void)stopCachingImagesForAllAssets
{
  id v3 = [(PXAudioAssetImageProvider *)self requestCountByCacheSpec];
  [v3 removeAllObjects];

  id v4 = [(PXAudioAssetImageProvider *)self requestIDByCacheSpec];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PXAudioAssetImageProvider_stopCachingImagesForAllAssets__block_invoke;
  v6[3] = &unk_1E5DCEBF0;
  v6[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  id v5 = [(PXAudioAssetImageProvider *)self requestIDByCacheSpec];
  [v5 removeAllObjects];
}

uint64_t __58__PXAudioAssetImageProvider_stopCachingImagesForAllAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a3 integerValue];
  return [v3 cancelImageRequest:v4];
}

- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PXAudioAssetImageProvider_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
  v13[3] = &unk_1E5DCEBC8;
  CGFloat v16 = width;
  CGFloat v17 = height;
  int64_t v18 = a5;
  id v14 = v11;
  uint64_t v15 = self;
  id v12 = v11;
  [a3 enumerateObjectsUsingBlock:v13];
}

void __87__PXAudioAssetImageProvider_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10 = -[PXImageRequestDescriptor initWithAsset:targetSize:contentMode:options:]([PXImageRequestDescriptor alloc], "initWithAsset:targetSize:contentMode:options:", v3, *(void *)(a1 + 64), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

  uint64_t v4 = [*(id *)(a1 + 40) requestIDByCacheSpec];
  id v5 = [v4 objectForKeyedSubscript:v10];

  if (v5)
  {
    v6 = [*(id *)(a1 + 40) requestCountByCacheSpec];
    [v6 removeObject:v10];

    id v7 = [*(id *)(a1 + 40) requestCountByCacheSpec];
    uint64_t v8 = [v7 countForObject:v10];

    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "cancelImageRequest:", objc_msgSend(v5, "integerValue"));
      id v9 = [*(id *)(a1 + 40) requestIDByCacheSpec];
      [v9 setObject:0 forKeyedSubscript:v10];
    }
  }
}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__PXAudioAssetImageProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
  v13[3] = &unk_1E5DCEBC8;
  CGFloat v16 = width;
  CGFloat v17 = height;
  int64_t v18 = a5;
  id v14 = v11;
  uint64_t v15 = self;
  id v12 = v11;
  [a3 enumerateObjectsUsingBlock:v13];
}

void __88__PXAudioAssetImageProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[PXImageRequestDescriptor initWithAsset:targetSize:contentMode:options:]([PXImageRequestDescriptor alloc], "initWithAsset:targetSize:contentMode:options:", v3, *(void *)(a1 + 64), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  id v5 = [*(id *)(a1 + 40) requestIDByCacheSpec];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__PXAudioAssetImageProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2;
    v14[3] = &unk_1E5DCBFC0;
    id v15 = v3;
    uint64_t v10 = objc_msgSend(v8, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, v7, v9, v14, *(double *)(a1 + 48), *(double *)(a1 + 56));
    id v11 = [NSNumber numberWithInteger:v10];
    id v12 = [*(id *)(a1 + 40) requestIDByCacheSpec];
    [v12 setObject:v11 forKeyedSubscript:v4];
  }
  uint64_t v13 = [*(id *)(a1 + 40) requestCountByCacheSpec];
  [v13 addObject:v4];
}

void __88__PXAudioAssetImageProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "Finished caching artwork for asset %@: ; Info: %@",
      (uint8_t *)&v7,
      0x16u);
  }
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  CGFloat v16 = [(PXAudioAssetImageProvider *)self log];
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
  int64_t v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "AudioAssetImageProviderResultDelivery", "", (uint8_t *)buf, 2u);
  }

  [(PXAudioAssetImageProvider *)self setRequestCounter:[(PXAudioAssetImageProvider *)self requestCounter] + 1];
  int64_t v20 = [(PXAudioAssetImageProvider *)self requestCounter];
  v39 = v15;
  v40 = v14;
  uint64_t v21 = -[_PXAudioAssetImageProviderRequest initWithAsset:targetSize:contentMode:options:resultHandler:requestID:signpostID:]([_PXAudioAssetImageProviderRequest alloc], "initWithAsset:targetSize:contentMode:options:resultHandler:requestID:signpostID:", v13, a5, v14, v15, v20, v17, width, height);
  v22 = [(PXAudioAssetImageProvider *)self imageCacheKeyForRequest:v21];
  v23 = [(PXAudioAssetImageProvider *)self imageCache];
  v24 = [v23 objectForKey:v22];

  if (v24)
  {
    v25 = [(_PXAudioAssetImageProviderRequest *)v21 resultHandler];
    ((void (**)(void, void *, void))v25)[2](v25, v24, 0);

    v26 = v19;
    v27 = v26;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v27, OS_SIGNPOST_INTERVAL_END, v17, "AudioAssetImageProviderResultDelivery", "", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    id v38 = v13;
    v28 = [(PXAudioAssetImageProvider *)self requestByClientID];
    v29 = [NSNumber numberWithInteger:v20];
    [v28 setObject:v21 forKeyedSubscript:v29];

    v27 = [(PXAudioAssetImageProvider *)self imageLoaderCoalescingKeyForRequest:v21];
    v30 = [(PXAudioAssetImageProvider *)self requestsByImageLoaderIdentifier];
    id v31 = [v30 objectForKeyedSubscript:v27];

    if (!v31)
    {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v32 = [(PXAudioAssetImageProvider *)self requestsByImageLoaderIdentifier];
      [v32 setObject:v31 forKeyedSubscript:v27];
    }
    [v31 addObject:v21];
    v33 = [(PXAudioAssetImageProvider *)self imageLoaderByIdentifier];
    v34 = [v33 objectForKeyedSubscript:v27];

    if (!v34)
    {
      v35 = [(PXAudioAssetImageProvider *)self createImageLoaderForRequest:v21];
      v36 = [(PXAudioAssetImageProvider *)self imageLoaderByIdentifier];
      [v36 setObject:v35 forKeyedSubscript:v27];

      objc_initWeak(buf, self);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __95__PXAudioAssetImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
      v41[3] = &unk_1E5DD20C8;
      objc_copyWeak(&v43, buf);
      v42 = v27;
      [v35 startWithCompletion:v41];

      objc_destroyWeak(&v43);
      objc_destroyWeak(buf);
    }
    id v13 = v38;
  }

  return v20;
}

void __95__PXAudioAssetImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 40));
  *(id *)(a1 + 32);
  px_dispatch_on_main_queue();
}

void __95__PXAudioAssetImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleImageLoaderCompletionForIdentifier:*(void *)(a1 + 32)];
}

- (PXAudioAssetImageProvider)init
{
  v17.receiver = self;
  v17.super_class = (Class)PXAudioAssetImageProvider;
  id v2 = [(PXAudioAssetImageProvider *)&v17 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestsByImageLoaderIdentifier = v2->_requestsByImageLoaderIdentifier;
    v2->_requestsByImageLoaderIdentifier = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestByClientID = v2->_requestByClientID;
    v2->_requestByClientID = v5;

    int v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    imageLoaderByIdentifier = v2->_imageLoaderByIdentifier;
    v2->_imageLoaderByIdentifier = v7;

    __int16 v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v9;

    uint64_t v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    id v13 = (const char *)[v12 UTF8String];

    os_log_t v14 = os_log_create((const char *)*MEMORY[0x1E4F8A240], v13);
    log = v2->_log;
    v2->_log = (OS_os_log *)v14;
  }
  return v2;
}

@end