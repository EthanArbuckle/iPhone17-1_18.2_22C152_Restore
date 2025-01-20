@interface PXPhotoKitUIMediaProvider
+ (PXPhotoKitUIMediaProvider)mediaProviderWithLibrary:(id)a3;
+ (id)_defaultImageManager;
+ (id)_defaultLoadingStatusManager;
- (CGSize)masterThumbnailSize;
- (PHCachingImageManager)cachingImageManager;
- (PHImageManager)imageManager;
- (PHPhotoLibrary)photoLibrary;
- (PXPhotoKitUIMediaProvider)init;
- (PXPhotoKitUIMediaProvider)initWithImageManager:(id)a3;
- (PXPhotoKitUIMediaProvider)initWithImageManager:(id)a3 library:(id)a4;
- (id)_preheatInfoForQualityClassIndex:(int64_t)a3;
- (id)_thumbnailDataForAsset:(id)a3 qualityClass:(id)a4 cache:(id)a5 onlyFromCache:(BOOL)a6 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a7;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)_getQualityClass:(id *)a3 cache:(id *)a4 qualityClassIndex:(int64_t *)a5 forTargetSize:(CGSize)a6;
- (void)_noteActivity;
- (void)_preheatQueue_schedulePreheat;
- (void)_preheatQueue_scheduleUpdateAfterDelay;
- (void)_preheatQueue_update;
- (void)_schedulePreheat;
- (void)_setPreheatInfo:(id)a3 forQualityClassIndex:(int64_t)a4;
- (void)cancelImageRequest:(int64_t)a3;
- (void)enumerateAvailableThumbnailDataFormats:(id)a3;
- (void)preheatThumbnailDataForAssets:(id)a3 origin:(int64_t)a4 targetSize:(CGSize)a5;
- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
- (void)stopCachingImagesForAllAssets;
- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
@end

@implementation PXPhotoKitUIMediaProvider

uint64_t __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_257(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)cancelImageRequest:(int64_t)a3
{
  id v4 = [(PXPhotoKitUIMediaProvider *)self imageManager];
  [v4 cancelImageRequest:a3];
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F396E8]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  unint64_t v8 = v7 - 9997;
  v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F39710]];
  uint64_t v10 = [v9 BOOLValue];

  if (v19 && (v10 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _noteActivity];
  }
  id v12 = v5;
  v13 = v12;
  if (v8 < 4) {
    int v14 = 1;
  }
  else {
    int v14 = v10;
  }
  v15 = v12;
  if (v14 == 1)
  {
    v15 = (void *)[v12 mutableCopy];
    v16 = [NSNumber numberWithBool:v8 < 4];
    [v15 setObject:v16 forKeyedSubscript:*(void *)off_1E5DAAFF0];

    v17 = [NSNumber numberWithBool:v10];
    [v15 setObject:v17 forKeyedSubscript:*(void *)off_1E5DAAFF8];
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v19, v15);
  }
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  if (!v7) {
    [(PXPhotoKitUIMediaProvider *)self _noteActivity];
  }
  id v16 = 0;
  id v17 = 0;
  -[PXPhotoKitUIMediaProvider _getQualityClass:cache:qualityClassIndex:forTargetSize:](self, "_getQualityClass:cache:qualityClassIndex:forTargetSize:", &v17, &v16, 0, width, height);
  id v12 = v17;
  id v13 = v16;
  int v14 = [(PXPhotoKitUIMediaProvider *)self _thumbnailDataForAsset:v11 qualityClass:v12 cache:v13 onlyFromCache:v7 outDataSpec:a6];

  return v14;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = v13;
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v28);
    v29 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
    [v25 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 179, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v27, v29 object file lineNumber description];
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    [v25 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 179, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v27 object file lineNumber description];
  }

LABEL_3:
  [(PXPhotoKitUIMediaProvider *)self _noteActivity];
  v31 = v14;
  id v17 = [v14 photoKitRequestOptions];
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DBDAC0;
  objc_copyWeak(&v36, location);
  id v30 = v15;
  id v35 = v30;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = [(PXMediaProvider *)self loadingStatusManager];
  if (v19)
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__133581;
    v33[4] = __Block_byref_object_dispose__133582;
    v33[5] = 0;
    v19;
    v16;
    px_dispatch_on_main_queue();
  }
  if ([v16 isCloudPlaceholder])
  {
    v20 = [v17 progressHandler];

    if (v20)
    {
      LOBYTE(v33[0]) = 0;
      v21 = [v17 progressHandler];
      ((void (**)(void, void, void *, void, double))v21)[2](v21, 0, v33, 0, 0.0);
    }
  }
  v22 = [(PXPhotoKitUIMediaProvider *)self imageManager];
  int v23 = objc_msgSend(v22, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v16, a5, v17, v18, width, height);

  objc_destroyWeak(&v36);
  objc_destroyWeak(location);

  return v23;
}

- (void)_noteActivity
{
}

- (PHImageManager)imageManager
{
  return self->_imageManager;
}

- (id)_thumbnailDataForAsset:(id)a3 qualityClass:(id)a4 cache:(id)a5 onlyFromCache:(BOOL)a6 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = 0;
  if (v11 && v12)
  {
    id v15 = v11;
    memset(v29, 0, sizeof(v29));
    id v14 = [v13 tableThumbnailDataForAsset:v15 dataSpecification:v29];
    if (!v14 && !a6)
    {
      id v14 = [v12 tableThumbnailDataForAsset:v15 dataSpecification:v29];
      if (!v14)
      {
LABEL_12:

        goto LABEL_13;
      }
      [v13 cacheThumbnailData:v14 specification:v29 forAsset:v15];
    }
    if (a7 && v14)
    {
      int v16 = SDWORD2(v29[0]) / SHIDWORD(v29[0]);
      if (SDWORD2(v29[0]) / SHIDWORD(v29[0]) <= 1) {
        int v16 = 1;
      }
      int v28 = v16;
      unint64_t v17 = [v12 metalPixelFormat];
      uint64_t v18 = (__CFString *)[v12 colorSpaceName];
      unsigned __int16 v19 = [v12 maxSideLengthIfSquare];
      unsigned __int16 v20 = [v12 maxSideLengthIfSquare];
      char v21 = [v12 isCroppedToSquare];
      unsigned __int16 v22 = WORD4(v29[0]);
      int v23 = SDWORD1(v29[1]) / SDWORD2(v29[0]);
      int v24 = SDWORD1(v29[1]) % SDWORD2(v29[0]) / v28;
      v25.i64[0] = *(void *)&v29[0];
      uint64_t v26 = *(void *)((char *)v29 + 12);
      a7->var0.var0 = v17;
      a7->var0.var1 = v18;
      a7->var0.var2 = v19;
      a7->var0.var3 = v20;
      a7->var0.var4 = v21;
      *(_WORD *)(&a7->var0.var4 + 1) = 0;
      *(&a7->var0.var4 + 3) = 0;
      a7->var1 = v24;
      a7->var2 = v23;
      v25.i64[1] = v26;
      *(int16x4_t *)&a7->var3 = vmovn_s32(v25);
      *(_DWORD *)&a7->var7 = v22;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v14;
}

- (void)_getQualityClass:(id *)a3 cache:(id *)a4 qualityClassIndex:(int64_t *)a5 forTargetSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_lastTargetSize.width == width && self->_lock_lastTargetSize.height == height)
  {
    int v28 = self->_lock_lastResourceQualityClass;
    v29 = self->_lock_lastThumbnailCache;
    int64_t lock_lastQualityClassIndex = self->_lock_lastQualityClassIndex;
  }
  else
  {
    v33 = p_lock;
    v34 = a3;
    v31 = a4;
    v32 = a5;
    if (width >= height) {
      double v14 = width;
    }
    else {
      double v14 = height;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obj = self->_thumbnailQualityClasses;
    uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      unint64_t v17 = 0;
      uint64_t v18 = 0;
      int64_t lock_lastQualityClassIndex = 0;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v37;
LABEL_10:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(obj);
        }
        int v23 = *(void **)(*((void *)&v36 + 1) + 8 * v22);
        if (objc_msgSend(v23, "isCroppedToSquare", v31, v32)) {
          BOOL v24 = width == height;
        }
        else {
          BOOL v24 = 0;
        }
        if (v24 || ([v23 isCroppedToSquare] & 1) == 0)
        {
          int64_t lock_lastQualityClassIndex = v20 + v22;
          double v25 = (double)[v23 maxSideLengthIfSquare];
          id v26 = v23;

          v27 = [(NSArray *)self->_thumbnailCaches objectAtIndexedSubscript:v20 + v22];

          if (v14 <= v25)
          {
            int v28 = (PHAssetResourceQualityClass *)v26;
            v29 = v27;

            if (v28)
            {
              a4 = v31;
              a5 = v32;
              goto LABEL_30;
            }
            unint64_t v17 = 0;
            uint64_t v18 = v29;
            goto LABEL_29;
          }
          unint64_t v17 = v26;
          uint64_t v18 = v27;
        }
        if (v16 == ++v22)
        {
          v20 += v22;
          uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v16) {
            goto LABEL_10;
          }
          goto LABEL_27;
        }
      }
    }
    int64_t lock_lastQualityClassIndex = 0;
    uint64_t v18 = 0;
    unint64_t v17 = 0;
LABEL_27:

    v29 = 0;
LABEL_29:
    a4 = v31;
    a5 = v32;
    int v28 = v17;
    id v30 = v18;

    v29 = v30;
LABEL_30:
    self->_lock_lastTargetSize.double width = width;
    self->_lock_lastTargetSize.double height = height;
    objc_storeStrong((id *)&self->_lock_lastResourceQualityClass, v28);
    objc_storeStrong((id *)&self->_lock_lastThumbnailCache, v29);
    self->_int64_t lock_lastQualityClassIndex = lock_lastQualityClassIndex;

    p_lock = v33;
    a3 = v34;
  }
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v28;
  }
  if (a4) {
    *a4 = v29;
  }
  if (a5) {
    *a5 = lock_lastQualityClassIndex;
  }
}

- (CGSize)masterThumbnailSize
{
  double width = self->_masterThumbnailSize.width;
  double height = self->_masterThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5DCDEC8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    int v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
      int v9 = [v8 BOOLValue];

      uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396C8]];
      uint64_t v10 = *(void *)(a1 + 48) | v14;
      BOOL v11 = v10 != 0;
      if (v10) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v9 == 0;
      }
      if (!v12) {
        BOOL v11 = *(unsigned char *)(a1 + 64) == 0;
      }
      id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v11 error:v13];
    }
  }
}

- (PXPhotoKitUIMediaProvider)initWithImageManager:(id)a3 library:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)PXPhotoKitUIMediaProvider;
  int v9 = [(PXPhotoKitUIMediaProvider *)&v48 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a4);
    objc_storeStrong((id *)&v10->_imageManager, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v11 = v7;
    }
    else {
      BOOL v11 = 0;
    }
    objc_storeStrong((id *)&v10->_cachingImageManager, v11);
    BOOL v12 = (void *)MEMORY[0x1E4F38F88];
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isTable = YES"];
    uint64_t v14 = [v12 allQualityClassesMatchingPredicate:v13 inLibrary:v8];
    thumbnailQualityClasses = v10->_thumbnailQualityClasses;
    v10->_thumbnailQualityClasses = (NSArray *)v14;

    uint64_t v16 = [off_1E5DA9658 sharedInstance];
    uint64_t v17 = [v16 thumbnailCacheSize];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v41 = v16;
      id v19 = v8;
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v42 = v10;
      obj = v10->_thumbnailQualityClasses;
      uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = v18 << 20;
        uint64_t v25 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v45 != v25) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            int v28 = [[PXPhotoKitThumbnailCache alloc] initWithSizeLimit:v24 photoLibrary:v19];
            v29 = [v27 description];
            [(PXPhotoKitThumbnailCache *)v28 setLabel:v29];

            [v20 addObject:v28];
            id v30 = [[PXPreheatInfo alloc] initWithFetchResult:0 origin:0];
            [(NSMutableArray *)v21 addObject:v30];
          }
          uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v23);
      }

      uint64_t v31 = [v20 copy];
      uint64_t v10 = v42;
      thumbnailCaches = v42->_thumbnailCaches;
      v42->_thumbnailCaches = (NSArray *)v31;

      preheatLock_preheatStates = v42->_preheatLock_preheatStates;
      v42->_preheatLock_preheatStates = v21;

      id v8 = v19;
      uint64_t v16 = v41;
    }
    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_preheatlock._os_unfair_lock_opaque = 0;
    uint64_t v34 = objc_msgSend(off_1E5DA7100, "preheatQueue", v41);
    preheatQueue = v10->_preheatQueue;
    v10->_preheatQueue = (OS_dispatch_queue *)v34;

    atomic_store(0, (unint64_t *)&v10->_lastActivity);
    long long v36 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
    long long v37 = [v36 masterThumbnailFormat];

    objc_msgSend(v37, "sizeWithFallBackSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    v10->_masterThumbnailSize.double width = v38;
    v10->_masterThumbnailSize.double height = v39;
  }
  return v10;
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E5DBDB10;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  char v17 = *(unsigned char *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)enumerateAvailableThumbnailDataFormats:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoKitUIMediaProvider;
  [(PXMediaProvider *)&v9 enumerateAvailableThumbnailDataFormats:v4];
  thumbnailQualityClasses = self->_thumbnailQualityClasses;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PXPhotoKitUIMediaProvider_enumerateAvailableThumbnailDataFormats___block_invoke;
  v7[3] = &unk_1E5DBDCC8;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)thumbnailQualityClasses enumerateObjectsUsingBlock:v7];
}

void __68__PXPhotoKitUIMediaProvider_enumerateAvailableThumbnailDataFormats___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isTable] && objc_msgSend(v3, "metalPixelFormat"))
  {
    uint64_t v4 = [v3 metalPixelFormat];
    uint64_t v5 = [v3 colorSpaceName];
    __int16 v6 = [v3 maxSideLengthIfSquare];
    __int16 v7 = [v3 maxSideLengthIfSquare];
    char v8 = [v3 isCroppedToSquare];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void *))(v9 + 16);
    v11[0] = v4;
    v11[1] = v5;
    __int16 v12 = v6;
    __int16 v13 = v7;
    char v14 = v8;
    __int16 v15 = 0;
    char v16 = 0;
    v10(v9, v11);
  }
}

+ (PXPhotoKitUIMediaProvider)mediaProviderWithLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _defaultImageManager];
  __int16 v6 = (void *)[objc_alloc((Class)a1) initWithImageManager:v5 library:v4];

  __int16 v7 = [a1 _defaultLoadingStatusManager];
  [v6 setLoadingStatusManager:v7];

  return (PXPhotoKitUIMediaProvider *)v6;
}

- (PXPhotoKitUIMediaProvider)init
{
  id v3 = [MEMORY[0x1E4F390D0] defaultManager];
  id v4 = [(PXPhotoKitUIMediaProvider *)self initWithImageManager:v3];

  return v4;
}

- (PXPhotoKitUIMediaProvider)initWithImageManager:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F39228];
  id v5 = a3;
  __int16 v6 = objc_msgSend(v4, "px_deprecated_appPhotoLibrary");
  __int16 v7 = [(PXPhotoKitUIMediaProvider *)self initWithImageManager:v5 library:v6];

  return v7;
}

+ (id)_defaultLoadingStatusManager
{
  if (_defaultLoadingStatusManager_onceToken != -1) {
    dispatch_once(&_defaultLoadingStatusManager_onceToken, &__block_literal_global_225);
  }
  unint64_t v2 = (void *)_defaultLoadingStatusManager_defaultLoadingStatusManager;
  return v2;
}

+ (id)_defaultImageManager
{
  if (_defaultImageManager_onceToken != -1) {
    dispatch_once(&_defaultImageManager_onceToken, &__block_literal_global_133627);
  }
  unint64_t v2 = (void *)_defaultImageManager_defaultImageManager;
  return v2;
}

void __57__PXPhotoKitUIMediaProvider__defaultLoadingStatusManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)off_1E5DA7080);
  v1 = (void *)_defaultLoadingStatusManager_defaultLoadingStatusManager;
  _defaultLoadingStatusManager_defaultLoadingStatusManager = (uint64_t)v0;
}

void __49__PXPhotoKitUIMediaProvider__defaultImageManager__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F38FB0]);
  v1 = (void *)_defaultImageManager_defaultImageManager;
  _defaultImageManager_defaultImageManager = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingImageManager, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_lock_lastThumbnailCache, 0);
  objc_storeStrong((id *)&self->_lock_lastResourceQualityClass, 0);
  objc_storeStrong((id *)&self->_preheatQueue, 0);
  objc_storeStrong((id *)&self->_preheatLock_preheatStates, 0);
  objc_storeStrong((id *)&self->_thumbnailCaches, 0);
  objc_storeStrong((id *)&self->_thumbnailQualityClasses, 0);
}

- (PHCachingImageManager)cachingImageManager
{
  return self->_cachingImageManager;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)_preheatQueue_scheduleUpdateAfterDelay
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 250000000);
  preheatQueue = self->_preheatQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PXPhotoKitUIMediaProvider__preheatQueue_scheduleUpdateAfterDelay__block_invoke;
  v5[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, preheatQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__PXPhotoKitUIMediaProvider__preheatQueue_scheduleUpdateAfterDelay__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_preheatQueue_update");
}

- (void)_preheatQueue_schedulePreheat
{
  if (!self->_preheatQueue_state)
  {
    self->_preheatQueue_state = 1;
    [(PXPhotoKitUIMediaProvider *)self _preheatQueue_update];
  }
}

- (void)_schedulePreheat
{
  objc_initWeak(&location, self);
  preheatQueue = self->_preheatQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PXPhotoKitUIMediaProvider__schedulePreheat__block_invoke;
  v5[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v6, &location);
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v5);
  dispatch_async(preheatQueue, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __45__PXPhotoKitUIMediaProvider__schedulePreheat__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_preheatQueue_schedulePreheat");
}

- (void)_setPreheatInfo:(id)a3 forQualityClassIndex:(int64_t)a4
{
  p_preheatlock = &self->_preheatlock;
  id v7 = a3;
  os_unfair_lock_lock(p_preheatlock);
  [(NSMutableArray *)self->_preheatLock_preheatStates replaceObjectAtIndex:a4 withObject:v7];
  os_unfair_lock_unlock(p_preheatlock);
  LOBYTE(a4) = [v7 finished];

  if ((a4 & 1) == 0)
  {
    [(PXPhotoKitUIMediaProvider *)self _schedulePreheat];
  }
}

- (id)_preheatInfoForQualityClassIndex:(int64_t)a3
{
  p_preheatlock = &self->_preheatlock;
  os_unfair_lock_lock(&self->_preheatlock);
  id v6 = [(NSMutableArray *)self->_preheatLock_preheatStates objectAtIndexedSubscript:a3];
  os_unfair_lock_unlock(p_preheatlock);
  return v6;
}

- (void)_preheatQueue_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_preheatQueue);
  unint64_t v2 = [off_1E5DA9658 sharedInstance];
  mach_absolute_time();
  [v2 opportunisticPreheatRequiredIdleTime];
  PXTimebaseConversionFactor();
}

uint64_t __49__PXPhotoKitUIMediaProvider__preheatQueue_update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(_DWORD *)(a2 + 8) - *(_DWORD *)(a3 + 8));
}

- (void)stopCachingImagesForAllAssets
{
  id v2 = [(PXPhotoKitUIMediaProvider *)self cachingImageManager];
  [v2 stopCachingImagesForAllAssets];
}

- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v19 = a3;
  id v12 = a6;
  if ([v19 count])
  {
    __int16 v13 = [v19 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
      char v16 = NSStringFromSelector(a2);
      [v15 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 840, @"%@ expected PHAssets", v16 object file lineNumber description];
    }
  }
  char v17 = [(PXPhotoKitUIMediaProvider *)self cachingImageManager];
  uint64_t v18 = [v12 photoKitRequestOptions];

  objc_msgSend(v17, "stopCachingImagesForAssets:targetSize:contentMode:options:", v19, a5, v18, width, height);
}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v19 = a3;
  id v12 = a6;
  if ([v19 count])
  {
    __int16 v13 = [v19 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
      char v16 = NSStringFromSelector(a2);
      [v15 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 835, @"%@ expected PHAssets", v16 object file lineNumber description];
    }
  }
  char v17 = [(PXPhotoKitUIMediaProvider *)self cachingImageManager];
  uint64_t v18 = [v12 photoKitRequestOptions];

  objc_msgSend(v17, "startCachingImagesForAssets:targetSize:contentMode:options:", v19, a5, v18, width, height);
}

- (void)preheatThumbnailDataForAssets:(id)a3 origin:(int64_t)a4 targetSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v20 = 0;
  uint64_t v21 = 0;
  id v19 = 0;
  -[PXPhotoKitUIMediaProvider _getQualityClass:cache:qualityClassIndex:forTargetSize:](self, "_getQualityClass:cache:qualityClassIndex:forTargetSize:", &v20, &v19, &v21, width, height);
  id v10 = v20;
  id v11 = v19;
  if (v11)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
      a4 = 0;
    }
    id v12 = [[PXPreheatInfo alloc] initWithFetchResult:v9 origin:a4];
    [(PXPhotoKitUIMediaProvider *)self _setPreheatInfo:v12 forQualityClassIndex:v21];
  }
  else
  {
    id v12 = (PXPreheatInfo *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v13 = [v9 count];
    if (v13 >= 1)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        char v16 = [v9 thumbnailAssetAtIndex:i];
        uint64_t v17 = [v16 thumbnailIndex];
        if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
          [(PXPreheatInfo *)v12 addIndex:v17];
        }
      }
    }
    uint64_t v18 = [(PXPhotoKitUIMediaProvider *)self photoLibrary];
    [v10 preheatDataForThumbnailIndexes:v12 inLibrary:v18];
  }
}

- (int64_t)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 602, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  [(PXPhotoKitUIMediaProvider *)self _noteActivity];
  id v12 = [v10 photoKitRequestOptions];
  uint64_t v13 = _Block_copy(v11);
  uint64_t v14 = [(PXMediaProvider *)self loadingStatusManager];
  if (v14)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__133581;
    v19[4] = __Block_byref_object_dispose__133582;
    v19[5] = 0;
    v14;
    v9;
    px_dispatch_on_main_queue();
  }
  __int16 v15 = [(PXPhotoKitUIMediaProvider *)self imageManager];
  int v16 = [v15 requestStreamForVideo:v9 options:v12 resultHandler:v13];

  return v16;
}

void __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(__n128))(v3 + 16))(a2);
  }
  *(id *)(a1 + 32);
  px_dispatch_on_main_queue();
}

void __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id, id))(v10 + 16))(v10, v7, v8, v9);
  }
  *(id *)(a1 + 32);
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  px_dispatch_on_main_queue();
}

void __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    if (*(void *)(a1 + 48)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = *(void *)(a1 + 56) != 0;
    }
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) withSuccess:v6 error:v7];
  }
}

uint64_t __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int64_t)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 553, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  [(PXPhotoKitUIMediaProvider *)self _noteActivity];
  id v12 = [v10 photoKitRequestOptions];
  id v13 = _Block_copy(v11);
  uint64_t v14 = [(PXMediaProvider *)self loadingStatusManager];
  if (v14)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__133581;
    v19[4] = __Block_byref_object_dispose__133582;
    v19[5] = 0;
    v14;
    v9;
    px_dispatch_on_main_queue();
  }
  __int16 v15 = [(PXPhotoKitUIMediaProvider *)self imageManager];
  int v16 = [v15 requestURLForVideo:v9 options:v12 resultHandler:v13];

  return v16;
}

void __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(__n128))(v3 + 16))(a2);
  }
  *(id *)(a1 + 32);
  px_dispatch_on_main_queue();
}

void __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  px_dispatch_on_main_queue();
}

void __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
    int v7 = [v6 BOOLValue];

    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v9 = v8 != 0;
    if (!v8 && v7) {
      BOOL v9 = *(unsigned char *)(a1 + 64) == 0;
    }
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v9 error:v10];
  }
}

uint64_t __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 504, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  [(PXPhotoKitUIMediaProvider *)self _noteActivity];
  id v12 = [v10 photoKitRequestOptions];
  id v13 = _Block_copy(v11);
  uint64_t v14 = [(PXMediaProvider *)self loadingStatusManager];
  if (v14)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__133581;
    v19[4] = __Block_byref_object_dispose__133582;
    v19[5] = 0;
    v14;
    v9;
    px_dispatch_on_main_queue();
  }
  __int16 v15 = [(PXPhotoKitUIMediaProvider *)self imageManager];
  int v16 = [v15 requestAnimatedImageForAsset:v9 options:v12 resultHandler:v13];

  return v16;
}

void __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5DCDEC8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E5DBDB10;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  char v17 = *(unsigned char *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    int v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
      int v9 = [v8 BOOLValue];

      uint64_t v10 = *(void *)(a1 + 48);
      BOOL v11 = v10 != 0;
      if (!v10 && v9) {
        BOOL v11 = *(unsigned char *)(a1 + 64) == 0;
      }
      id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v11 error:v12];
    }
  }
}

uint64_t __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 453, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  [(PXPhotoKitUIMediaProvider *)self _noteActivity];
  uint64_t v16 = [v14 photoKitRequestOptions];
  char v17 = _Block_copy(v15);
  uint64_t v18 = [(PXMediaProvider *)self loadingStatusManager];
  if (v18)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__133581;
    v24[4] = __Block_byref_object_dispose__133582;
    v24[5] = 0;
    v18;
    v13;
    px_dispatch_on_main_queue();
  }
  id v19 = [(PXPhotoKitUIMediaProvider *)self imageManager];
  int v20 = objc_msgSend(v19, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v16, v17, width, height);

  return v20;
}

void __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5DCDEC8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E5DBDB10;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  char v17 = *(unsigned char *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
    int v7 = [v6 BOOLValue];

    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v9 = v8 != 0;
    if (!v8 && v7) {
      BOOL v9 = *(unsigned char *)(a1 + 64) == 0;
    }
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v9 error:v10];
  }
}

uint64_t __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 404, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  [(PXPhotoKitUIMediaProvider *)self _noteActivity];
  id v12 = [v10 photoKitRequestOptions];
  id v13 = _Block_copy(v11);
  id v14 = [(PXMediaProvider *)self loadingStatusManager];
  if (v14)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__133581;
    v19[4] = __Block_byref_object_dispose__133582;
    v19[5] = 0;
    v14;
    v9;
    px_dispatch_on_main_queue();
  }
  id v15 = [(PXPhotoKitUIMediaProvider *)self imageManager];
  int v16 = [v15 requestPlayerItemForVideo:v9 options:v12 resultHandler:v13];

  return v16;
}

void __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5DCDEC8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E5DBDB10;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  char v17 = *(unsigned char *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
    int v7 = [v6 BOOLValue];

    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v9 = v8 != 0;
    if (!v8 && v7) {
      BOOL v9 = *(unsigned char *)(a1 + 64) == 0;
    }
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v9 error:v10];
  }
}

uint64_t __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 353, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:PHAsset.class]" object file lineNumber description];
  }
  [(PXPhotoKitUIMediaProvider *)self _noteActivity];
  id v12 = [v10 photoKitRequestOptions];
  [v12 setLoadingMode:0x10000];
  id v13 = _Block_copy(v11);
  id v14 = [(PXMediaProvider *)self loadingStatusManager];
  if (v14)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__133581;
    v31[4] = __Block_byref_object_dispose__133582;
    v31[5] = 0;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
    v27 = &unk_1E5DCCA20;
    id v30 = v31;
    id v28 = v14;
    id v29 = v9;
    px_dispatch_on_main_queue();
  }
  id v15 = [(PXPhotoKitUIMediaProvider *)self imageManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_6;
  v22[3] = &unk_1E5DD24E8;
  id v23 = v13;
  double v16 = *MEMORY[0x1E4F396D8];
  double v17 = *(double *)(MEMORY[0x1E4F396D8] + 8);
  id v18 = v13;
  int v19 = objc_msgSend(v15, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 0, v12, v22, v16, v17);

  return v19;
}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5DCDEC8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E5DCA7A8;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F396C8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    int v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = *(void *)(a1 + 48) != 0;
      id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v8 error:v9];
    }
  }
}

uint64_t __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXPhotoKitUIMediaProvider.m", 300, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  [(PXPhotoKitUIMediaProvider *)self _noteActivity];
  id v12 = [v10 photoKitRequestOptions];
  id v13 = _Block_copy(v11);
  id v14 = [(PXMediaProvider *)self loadingStatusManager];
  if (v14)
  {
    v29[0] = 0;
    v29[1] = v29;
    _OWORD v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__133581;
    v29[4] = __Block_byref_object_dispose__133582;
    v29[5] = 0;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
    uint64_t v25 = &unk_1E5DCCA20;
    id v28 = v29;
    id v26 = v14;
    id v27 = v9;
    px_dispatch_on_main_queue();
  }
  id v15 = [(PXPhotoKitUIMediaProvider *)self imageManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_6;
  v20[3] = &unk_1E5DBDB88;
  id v21 = v13;
  id v16 = v13;
  int v17 = [v15 requestImageDataAndOrientationForAsset:v9 options:v12 resultHandler:v20];

  return v17;
}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5DCDEC8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, id))(v11 + 16))(v11, v9, a3, a4, v10);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E5DBDB10;
  id v17 = v10;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  id v19 = v9;
  uint64_t v20 = v13;
  id v18 = v12;
  char v21 = *(unsigned char *)(a1 + 56);
  id v14 = v9;
  id v15 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_6(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v8 = a5;
    id v9 = a3;
    id v11 = a2;
    uint64_t v10 = PLImageOrientationFromExifOrientation();
    (*(void (**)(uint64_t, id, id, uint64_t, id))(v5 + 16))(v5, v11, v9, v10, v8);
  }
}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
    int v7 = [v6 BOOLValue];

    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v9 = v8 != 0;
    if (!v8 && v7) {
      BOOL v9 = *(unsigned char *)(a1 + 64) == 0;
    }
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v9 error:v10];
  }
}

uint64_t __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

@end