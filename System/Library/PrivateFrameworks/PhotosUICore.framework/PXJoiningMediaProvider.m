@interface PXJoiningMediaProvider
- (NSArray)allMediaProviders;
- (NSCountedSet)requestCountByCacheSpec;
- (NSDictionary)mediaProvidersByAssetClassName;
- (NSMutableDictionary)requestIDByCacheSpec;
- (PXJoiningMediaProvider)init;
- (PXJoiningMediaProvider)initWithMediaProvidersByAssetClassName:(id)a3;
- (id)_mediaProviderForAsset:(id)a3;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)_externalRequestIDForMediaProvider:(id)a3 mediaProviderRequestID:(int64_t)a4;
- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int64_t)a3;
- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
- (void)stopCachingImagesForAllAssets;
- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
@end

@implementation PXJoiningMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCountByCacheSpec, 0);
  objc_storeStrong((id *)&self->_requestIDByCacheSpec, 0);
  objc_storeStrong((id *)&self->_allMediaProviders, 0);
  objc_storeStrong((id *)&self->_mediaProvidersByAssetClassName, 0);
}

- (NSCountedSet)requestCountByCacheSpec
{
  return self->_requestCountByCacheSpec;
}

- (NSMutableDictionary)requestIDByCacheSpec
{
  return self->_requestIDByCacheSpec;
}

- (NSArray)allMediaProviders
{
  return self->_allMediaProviders;
}

- (NSDictionary)mediaProvidersByAssetClassName
{
  return self->_mediaProvidersByAssetClassName;
}

- (int64_t)_externalRequestIDForMediaProvider:(id)a3 mediaProviderRequestID:(int64_t)a4
{
  id v7 = a3;
  v8 = [(PXJoiningMediaProvider *)self allMediaProviders];
  uint64_t v9 = [v8 indexOfObject:v7];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXJoiningMediaProvider.m", 133, @"Encountered unknown media provider %@", v7 object file lineNumber description];
  }
  v10 = [(PXJoiningMediaProvider *)self allMediaProviders];
  int64_t v11 = v9 + [v10 count] * a4;

  return v11;
}

- (id)_mediaProviderForAsset:(id)a3
{
  id v5 = a3;
  v6 = [(PXJoiningMediaProvider *)self mediaProvidersByAssetClassName];
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  uint64_t v9 = [v6 objectForKeyedSubscript:v8];

  if (!v9)
  {
    int64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXJoiningMediaProvider.m", 127, @"Unable to find media provider for asset %@", v5 object file lineNumber description];
  }
  return v9;
}

- (void)stopCachingImagesForAllAssets
{
  v3 = [(PXJoiningMediaProvider *)self requestCountByCacheSpec];
  [v3 removeAllObjects];

  v4 = [(PXJoiningMediaProvider *)self requestIDByCacheSpec];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PXJoiningMediaProvider_stopCachingImagesForAllAssets__block_invoke;
  v6[3] = &unk_1E5DCEBF0;
  v6[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  id v5 = [(PXJoiningMediaProvider *)self requestIDByCacheSpec];
  [v5 removeAllObjects];
}

uint64_t __55__PXJoiningMediaProvider_stopCachingImagesForAllAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
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
  v13[2] = __84__PXJoiningMediaProvider_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
  v13[3] = &unk_1E5DCEBC8;
  CGFloat v16 = width;
  CGFloat v17 = height;
  int64_t v18 = a5;
  id v14 = v11;
  v15 = self;
  id v12 = v11;
  [a3 enumerateObjectsUsingBlock:v13];
}

void __84__PXJoiningMediaProvider_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
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
      uint64_t v9 = [*(id *)(a1 + 40) requestIDByCacheSpec];
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
  v13[2] = __85__PXJoiningMediaProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
  v13[3] = &unk_1E5DCEBC8;
  CGFloat v16 = width;
  CGFloat v17 = height;
  int64_t v18 = a5;
  id v14 = v11;
  v15 = self;
  id v12 = v11;
  [a3 enumerateObjectsUsingBlock:v13];
}

void __85__PXJoiningMediaProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
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
    v14[2] = __85__PXJoiningMediaProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2;
    v14[3] = &unk_1E5DCEBA0;
    id v15 = v3;
    uint64_t v10 = objc_msgSend(v8, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v15, v7, v9, v14, *(double *)(a1 + 48), *(double *)(a1 + 56));
    id v11 = [NSNumber numberWithInteger:v10];
    id v12 = [*(id *)(a1 + 40) requestIDByCacheSpec];
    [v12 setObject:v11 forKeyedSubscript:v4];
  }
  v13 = [*(id *)(a1 + 40) requestCountByCacheSpec];
  [v13 addObject:v4];
}

void __85__PXJoiningMediaProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "Finished caching image for asset %@: ; Info: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PXJoiningMediaProvider *)self _mediaProviderForAsset:v10];
  uint64_t v12 = [v11 requestPlayerItemForVideo:v10 options:v9 resultHandler:v8];

  int64_t v13 = [(PXJoiningMediaProvider *)self _externalRequestIDForMediaProvider:v11 mediaProviderRequestID:v12];
  return v13;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  uint64_t v12 = [(PXJoiningMediaProvider *)self _mediaProviderForAsset:v11];
  int64_t v13 = objc_msgSend(v12, "thumbnailDataForAsset:targetSize:onlyFromCache:outDataSpec:", v11, v7, a6, width, height);

  return v13;
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PXJoiningMediaProvider *)self _mediaProviderForAsset:v10];
  uint64_t v12 = [v11 requestImageURLForAsset:v10 options:v9 resultHandler:v8];

  int64_t v13 = [(PXJoiningMediaProvider *)self _externalRequestIDForMediaProvider:v11 mediaProviderRequestID:v12];
  return v13;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  CGFloat v16 = [(PXJoiningMediaProvider *)self _mediaProviderForAsset:v15];
  uint64_t v17 = objc_msgSend(v16, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  int64_t v18 = [(PXJoiningMediaProvider *)self _externalRequestIDForMediaProvider:v16 mediaProviderRequestID:v17];
  return v18;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__PXJoiningMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v17[3] = &unk_1E5DC9818;
  id v18 = v13;
  id v14 = v13;
  int64_t v15 = -[PXJoiningMediaProvider requestCGImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", a3, a5, a6, v17, width, height);

  return v15;
}

void __92__PXJoiningMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2)
  {
    BOOL v7 = (objc_class *)MEMORY[0x1E4FB1818];
    id v8 = a4;
    id v10 = (id)[[v7 alloc] initWithCGImage:a2 scale:a3 orientation:0.0];
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    id v9 = *(void (**)(uint64_t, void))(v4 + 16);
    id v10 = a4;
    v9(v4, 0);
  }
}

- (void)cancelImageRequest:(int64_t)a3
{
  id v5 = [(PXJoiningMediaProvider *)self allMediaProviders];
  uint64_t v6 = [v5 count];

  BOOL v7 = [(PXJoiningMediaProvider *)self allMediaProviders];
  id v8 = [v7 objectAtIndexedSubscript:a3 % v6];

  [v8 cancelImageRequest:a3 / v6];
}

- (PXJoiningMediaProvider)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXJoiningMediaProvider.m", 35, @"%s is not available as initializer", "-[PXJoiningMediaProvider init]");

  abort();
}

- (PXJoiningMediaProvider)initWithMediaProvidersByAssetClassName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXJoiningMediaProvider;
  id v5 = [(PXJoiningMediaProvider *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    mediaProvidersByAssetClassName = v5->_mediaProvidersByAssetClassName;
    v5->_mediaProvidersByAssetClassName = (NSDictionary *)v6;

    uint64_t v8 = [v4 allValues];
    allMediaProviders = v5->_allMediaProviders;
    v5->_allMediaProviders = (NSArray *)v8;
  }
  return v5;
}

@end