@interface PUWallpaperShuffleMediaProvider
- (NSCache)memoryCache;
- (NSMutableDictionary)operationsByRequestID;
- (NSOperationQueue)operationQueue;
- (PUWallpaperShuffleMediaProvider)initWithResourceManager:(id)a3;
- (PUWallpaperShuffleResourceManager)resourceManager;
- (PXMediaProviderImageCacher)imageCacher;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)_nextRequestID;
- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (void)_handleOperationCompletedWithID:(int64_t)a3;
- (void)cancelImageRequest:(int64_t)a3;
- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
- (void)stopCachingImagesForAllAssets;
- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
@end

@implementation PUWallpaperShuffleMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_imageCacher, 0);
  objc_storeStrong((id *)&self->_operationsByRequestID, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
}

- (NSCache)memoryCache
{
  return self->_memoryCache;
}

- (PXMediaProviderImageCacher)imageCacher
{
  return self->_imageCacher;
}

- (NSMutableDictionary)operationsByRequestID
{
  return self->_operationsByRequestID;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (PUWallpaperShuffleResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (void)_handleOperationCompletedWithID:(int64_t)a3
{
  p_operationsByIDLock = &self->_operationsByIDLock;
  os_unfair_lock_lock(&self->_operationsByIDLock);
  v6 = [(PUWallpaperShuffleMediaProvider *)self operationsByRequestID];
  v7 = [NSNumber numberWithInteger:a3];
  id v13 = [v6 objectForKeyedSubscript:v7];

  v8 = [(PUWallpaperShuffleMediaProvider *)self operationsByRequestID];
  v9 = [NSNumber numberWithInteger:a3];
  [v8 setObject:0 forKeyedSubscript:v9];

  os_unfair_lock_unlock(p_operationsByIDLock);
  v10 = [v13 resultImage];
  if (v10)
  {
    v11 = [(PUWallpaperShuffleMediaProvider *)self memoryCache];
    v12 = [v13 requestDescriptor];
    [v11 setObject:v10 forKey:v12];
  }
}

- (int64_t)_nextRequestID
{
  return (int)(atomic_fetch_add(&self->_requestIDCounter, 1u) + 1);
}

- (void)stopCachingImagesForAllAssets
{
  id v2 = [(PUWallpaperShuffleMediaProvider *)self imageCacher];
  [v2 stopCachingImagesForAllAssets];
}

- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  id v13 = [(PUWallpaperShuffleMediaProvider *)self imageCacher];
  objc_msgSend(v13, "stopCachingImagesForAssets:targetSize:contentMode:options:", v12, a5, v11, width, height);
}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  id v13 = [(PUWallpaperShuffleMediaProvider *)self imageCacher];
  objc_msgSend(v13, "startCachingImagesForAssets:targetSize:contentMode:options:", v12, a5, v11, width, height);
}

- (void)cancelImageRequest:(int64_t)a3
{
  p_operationsByIDLock = &self->_operationsByIDLock;
  os_unfair_lock_lock(&self->_operationsByIDLock);
  v6 = [(PUWallpaperShuffleMediaProvider *)self operationsByRequestID];
  v7 = [NSNumber numberWithInteger:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_operationsByIDLock);
  [v8 cancel];
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F902B0]), "initWithAsset:targetSize:contentMode:options:", v14, a5, v15, width, height);
  v18 = [(PUWallpaperShuffleMediaProvider *)self memoryCache];
  v19 = [v18 objectForKey:v17];

  if (!v19)
  {
    id v38 = v15;
    id v20 = v14;
    v39 = v20;
    if (v20)
    {
      v21 = v20;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_5:
        v22 = [(PUWallpaperShuffleMediaProvider *)self _nextRequestID];
        v23 = [(PUWallpaperShuffleMediaProvider *)self resourceManager];
        v24 = [v21 posterMedia];
        uint64_t v25 = [v23 segmentationItemLoadingOperationForPosterMedia:v24];

        v37 = (void *)v25;
        v26 = [[_PUWallpaperShuffleMediaProviderImageOperation alloc] initWithSegmentationOperation:v25 requestDescriptor:v17 resultHandler:v16];
        os_unfair_lock_lock(&self->_operationsByIDLock);
        v27 = [(PUWallpaperShuffleMediaProvider *)self operationsByRequestID];
        v28 = [NSNumber numberWithInteger:v22];
        [v27 setObject:v26 forKeyedSubscript:v28];

        os_unfair_lock_unlock(&self->_operationsByIDLock);
        objc_initWeak(&location, self);
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __103__PUWallpaperShuffleMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
        v40[3] = &unk_1E5F2B980;
        objc_copyWeak(v41, &location);
        v41[1] = v22;
        [(_PUWallpaperShuffleMediaProviderImageOperation *)v26 setCompletionBlock:v40];
        v29 = [(PUWallpaperShuffleMediaProvider *)self operationQueue];
        [v29 addOperation:v26];

        objc_destroyWeak(v41);
        objc_destroyWeak(&location);

        id v15 = v38;
        goto LABEL_6;
      }
      [MEMORY[0x1E4F28B00] currentHandler];
      v31 = v34 = v21;
      v35 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v35);
      v36 = objc_msgSend(v34, "px_descriptionForAssertionMessage");
      [v31 handleFailureInMethod:a2, self, @"PUWallpaperShuffleMediaProvider.m", 79, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v33, v36 object file lineNumber description];
    }
    else
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      [v31 handleFailureInMethod:a2, self, @"PUWallpaperShuffleMediaProvider.m", 79, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v33 object file lineNumber description];
    }

    v21 = v39;
    goto LABEL_5;
  }
  (*((void (**)(id, uint64_t, void, void))v16 + 2))(v16, [v19 image], 0, 0);
LABEL_6:

  return 0;
}

void __103__PUWallpaperShuffleMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleOperationCompletedWithID:*(void *)(a1 + 40)];
}

- (PUWallpaperShuffleMediaProvider)initWithResourceManager:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUWallpaperShuffleMediaProvider;
  v6 = [(PUWallpaperShuffleMediaProvider *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceManager, a3);
    id v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v8;

    [(NSOperationQueue *)v7->_operationQueue setQualityOfService:25];
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    operationsByRequestID = v7->_operationsByRequestID;
    v7->_operationsByRequestID = v10;

    v7->_operationsByIDLock._os_unfair_lock_opaque = 0;
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F90328]) initWithMediaProvider:v7];
    imageCacher = v7->_imageCacher;
    v7->_imageCacher = (PXMediaProviderImageCacher *)v12;

    id v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    memoryCache = v7->_memoryCache;
    v7->_memoryCache = v14;
  }
  return v7;
}

@end