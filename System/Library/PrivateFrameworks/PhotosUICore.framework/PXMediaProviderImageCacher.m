@interface PXMediaProviderImageCacher
- (NSCountedSet)requestCountByCacheSpec;
- (NSMutableDictionary)requestIDByCacheSpec;
- (PXMediaProvider)mediaProvider;
- (PXMediaProviderImageCacher)initWithMediaProvider:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
- (void)stopCachingImagesForAllAssets;
- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
@end

@implementation PXMediaProviderImageCacher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCountByCacheSpec, 0);
  objc_storeStrong((id *)&self->_requestIDByCacheSpec, 0);
  objc_destroyWeak((id *)&self->_mediaProvider);
}

- (NSCountedSet)requestCountByCacheSpec
{
  return self->_requestCountByCacheSpec;
}

- (NSMutableDictionary)requestIDByCacheSpec
{
  return self->_requestIDByCacheSpec;
}

- (void)setMediaProvider:(id)a3
{
}

- (PXMediaProvider)mediaProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaProvider);
  return (PXMediaProvider *)WeakRetained;
}

- (void)stopCachingImagesForAllAssets
{
  v3 = [(PXMediaProviderImageCacher *)self requestCountByCacheSpec];
  [v3 removeAllObjects];

  v4 = [(PXMediaProviderImageCacher *)self requestIDByCacheSpec];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PXMediaProviderImageCacher_stopCachingImagesForAllAssets__block_invoke;
  v6[3] = &unk_1E5DCEBF0;
  v6[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  v5 = [(PXMediaProviderImageCacher *)self requestIDByCacheSpec];
  [v5 removeAllObjects];
}

void __59__PXMediaProviderImageCacher_stopCachingImagesForAllAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v6 = [v3 mediaProvider];
  uint64_t v5 = [v4 integerValue];

  [v6 cancelImageRequest:v5];
}

- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__PXMediaProviderImageCacher_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
  v13[3] = &unk_1E5DCEBC8;
  CGFloat v16 = width;
  CGFloat v17 = height;
  int64_t v18 = a5;
  id v14 = v11;
  v15 = self;
  id v12 = v11;
  [a3 enumerateObjectsUsingBlock:v13];
}

void __88__PXMediaProviderImageCacher_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = -[PXImageRequestDescriptor initWithAsset:targetSize:contentMode:options:]([PXImageRequestDescriptor alloc], "initWithAsset:targetSize:contentMode:options:", v3, *(void *)(a1 + 64), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

  id v4 = [*(id *)(a1 + 40) requestIDByCacheSpec];
  uint64_t v5 = [v4 objectForKeyedSubscript:v12];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) requestCountByCacheSpec];
    [v6 removeObject:v12];

    v7 = [*(id *)(a1 + 40) requestCountByCacheSpec];
    uint64_t v8 = [v7 countForObject:v12];

    if (!v8)
    {
      uint64_t v9 = [v5 integerValue];
      v10 = [*(id *)(a1 + 40) mediaProvider];
      [v10 cancelImageRequest:v9];

      id v11 = [*(id *)(a1 + 40) requestIDByCacheSpec];
      [v11 setObject:0 forKeyedSubscript:v12];
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
  v13[2] = __89__PXMediaProviderImageCacher_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
  v13[3] = &unk_1E5DCEBC8;
  CGFloat v16 = width;
  CGFloat v17 = height;
  int64_t v18 = a5;
  id v14 = v11;
  v15 = self;
  id v12 = v11;
  [a3 enumerateObjectsUsingBlock:v13];
}

void __89__PXMediaProviderImageCacher_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[PXImageRequestDescriptor initWithAsset:targetSize:contentMode:options:]([PXImageRequestDescriptor alloc], "initWithAsset:targetSize:contentMode:options:", v3, *(void *)(a1 + 64), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v5 = [*(id *)(a1 + 40) requestIDByCacheSpec];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = [*(id *)(a1 + 40) mediaProvider];
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__PXMediaProviderImageCacher_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2;
    v14[3] = &unk_1E5DCEBA0;
    id v15 = v3;
    uint64_t v10 = objc_msgSend(v7, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v15, v8, v9, v14, *(double *)(a1 + 48), *(double *)(a1 + 56));

    id v11 = [NSNumber numberWithInteger:v10];
    id v12 = [*(id *)(a1 + 40) requestIDByCacheSpec];
    [v12 setObject:v11 forKeyedSubscript:v4];
  }
  v13 = [*(id *)(a1 + 40) requestCountByCacheSpec];
  [v13 addObject:v4];
}

void __89__PXMediaProviderImageCacher_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PLAudioPlaybackGetLog();
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

- (PXMediaProviderImageCacher)initWithMediaProvider:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXMediaProviderImageCacher;
  id v5 = [(PXMediaProviderImageCacher *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mediaProvider, v4);
    uint64_t v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    requestCountByCacheSpec = v6->_requestCountByCacheSpec;
    v6->_requestCountByCacheSpec = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestIDByCacheSpec = v6->_requestIDByCacheSpec;
    v6->_requestIDByCacheSpec = v9;
  }
  return v6;
}

@end