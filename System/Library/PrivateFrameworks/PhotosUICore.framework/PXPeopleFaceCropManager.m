@interface PXPeopleFaceCropManager
+ (BOOL)_change:(id)a3 containsVisibleChangesToAssetWithOID:(id)a4;
+ (BOOL)_isFinalForIsDegraded:(BOOL)a3 isCropped:(BOOL)a4;
+ (BOOL)_shouldCacheResultForOptions:(id)a3 isDegraded:(BOOL)a4 isCropped:(BOOL)a5 isForCleanup:(BOOL)a6;
+ (BOOL)_shouldTakeSquareCropForFace:(id)a3 cropFactor:(int64_t)a4 outNormalizedFaceCropRect:(CGRect *)a5;
+ (CGRect)cropRectWithAspectRatioFittingAroundEyeLevelForAspectRatio:(double)a3 pixelFaceCrop:(CGRect)a4 eyelinePoint:(CGPoint)a5;
+ (CGSize)_constrainedSizeForDesiredSize:(CGSize)result;
+ (PXPeopleFaceCropManager)sharedManager;
+ (double)_cornerRadiusForCornerStyle:(int64_t)a3 pixelTargetSize:(CGSize)a4 displayScale:(double)a5;
+ (double)_cornerRadiusForRoundedCornerStyleWithDisplayScale:(double)a3;
+ (double)_cropFactorValueForCropFactor:(int64_t)a3;
+ (double)roundedCornerRadiusForTargetSize:(CGSize)a3 displayScale:(double)a4;
+ (id)_compressionQueue;
+ (id)_cropQueue;
+ (id)_faceCropManagerLog;
+ (id)_fetchQueue;
+ (int)generateUniqueRequestID;
- (BOOL)isRequestActiveWithRequestID:(int)a3;
- (PXPeopleFaceCropManager)init;
- (id)_cachedResultForOptions:(id)a3;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (int)_prepareFaceCropRequestWithOptions:(id)a3 resultHandler:(id)a4;
- (int)requestFaceCropForOptions:(id)a3 resultHandler:(id)a4;
- (int)requestFaceCropImageForPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 completionHandler:(id)a6;
- (void)_cacheResult:(id)a3;
- (void)_cleanupForImage:(id)a3 request:(id)a4;
- (void)_compressImage:(id)a3 request:(id)a4 resultHandler:(id)a5;
- (void)_cropImage:(id)a3 request:(id)a4 resultHandler:(id)a5;
- (void)_emptyFaceCropCache;
- (void)_executeFaceCropRequest:(id)a3 resultHandler:(id)a4;
- (void)_fetchFaceAndAssetIfNecessaryForOptions:(id)a3 completion:(id)a4;
- (void)_handleImage:(id)a3 info:(id)a4 faceCropRequest:(id)a5 resultHandler:(id)a6;
- (void)_invalidateCacheForLocalIdentifiers:(id)a3 wantsNotificationPosted:(BOOL)a4 userInfoKey:(id)a5;
- (void)cancelRequestForRequestID:(int)a3;
- (void)invalidateCacheForPerson:(id)a3;
@end

@implementation PXPeopleFaceCropManager

- (void)_executeFaceCropRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[PXPeopleFaceCropManager _faceCropManagerLog];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "executeRequest", "", buf, 2u);
  }

  v12 = [v6 options];
  [v6 targetSizeToUse];
  double v14 = v13;
  double v16 = v15;
  [v6 normalizedFaceCropRect];
  +[PXPeopleFaceCropManager _constrainedSizeForDesiredSize:](PXPeopleFaceCropManager, "_constrainedSizeForDesiredSize:", ceil(v14 / v17), ceil(v16 / v18));
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [v12 isSynchronous];
  id v24 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  objc_msgSend(v24, "setDeliveryMode:", objc_msgSend(v12, "deliveryMode"));
  [v24 setSynchronous:v23];
  objc_msgSend(v24, "setUseLowMemoryMode:", objc_msgSend(v12, "useLowMemoryMode"));
  [v24 setNetworkAccessAllowed:1];
  [v24 setAllowSecondaryDegradedImage:1];
  [v24 setResizeMode:1];
  [v24 setLoadingMode:0x40000];
  if ((v23 & 1) == 0)
  {
    v25 = +[PXPeopleFaceCropManager _fetchQueue];
    [v24 setResultHandlerQueue:v25];
  }
  v26 = [MEMORY[0x1E4F390D0] defaultManager];
  v27 = [v6 asset];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __65__PXPeopleFaceCropManager__executeFaceCropRequest_resultHandler___block_invoke;
  v32[3] = &unk_1E5DC4AC8;
  id v36 = v7;
  os_signpost_id_t v37 = v9;
  v33 = v11;
  id v34 = v6;
  v35 = self;
  double v38 = v20;
  double v39 = v22;
  id v28 = v7;
  id v29 = v6;
  v30 = v11;
  uint64_t v31 = objc_msgSend(v26, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v27, 1, v24, v32, v20, v22);

  [v29 setImageManagerRequestID:v31];
}

- (void)_fetchFaceAndAssetIfNecessaryForOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __78__PXPeopleFaceCropManager__fetchFaceAndAssetIfNecessaryForOptions_completion___block_invoke;
  double v14 = &unk_1E5DD3280;
  id v7 = v5;
  id v15 = v7;
  id v8 = v6;
  id v16 = v8;
  os_signpost_id_t v9 = (void (**)(void))_Block_copy(&v11);
  if (objc_msgSend(v7, "isSynchronous", v11, v12, v13, v14))
  {
    v9[2](v9);
  }
  else
  {
    v10 = +[PXPeopleFaceCropManager _fetchQueue];
    dispatch_async(v10, v9);
  }
}

+ (id)_fetchQueue
{
  if (_fetchQueue_onceToken != -1) {
    dispatch_once(&_fetchQueue_onceToken, &__block_literal_global_289_205770);
  }
  v2 = (void *)_fetchQueue_fetchQueue;
  return v2;
}

- (void)_handleImage:(id)a3 info:(id)a4 faceCropRequest:(id)a5 resultHandler:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = +[PXPeopleFaceCropManager _faceCropManagerLog];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  double v14 = v12;
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "handleResponse", "", buf, 2u);
  }

  [v10 options];
  objc_claimAutoreleasedReturnValue();
  [v10 targetSizeToUse];
  id v16 = [v10 asset];
  [v16 pixelWidth];
  [v16 pixelHeight];
  [v10 normalizedCenterEyeLine];
  PXPointDenormalize();
}

- (int)_prepareFaceCropRequestWithOptions:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PXPeopleFaceCropManager _faceCropManagerLog];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  id v10 = v8;
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "prepareRequest", "", buf, 2u);
  }

  uint64_t v12 = [v6 photoLibrary];
  objc_msgSend(v12, "px_registerChangeObserver:", self);

  os_signpost_id_t v13 = [[PXPeopleFaceCropRequest alloc] initWithFetchOptions:v6];
  uint64_t v14 = [(PXPeopleFaceCropRequest *)v13 faceCropRequestID];
  id v15 = [NSNumber numberWithInt:v14];
  os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
  [(NSMutableDictionary *)self->_faceCropRequestsByRequestIDs setObject:v13 forKey:v15];
  os_unfair_lock_unlock(&self->_faceCropRequestsByRequestIDsLock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__PXPeopleFaceCropManager__prepareFaceCropRequestWithOptions_resultHandler___block_invoke;
  v21[3] = &unk_1E5DC4AA0;
  double v22 = v11;
  uint64_t v23 = v13;
  id v24 = v6;
  v25 = self;
  int v28 = v14;
  id v26 = v7;
  os_signpost_id_t v27 = v9;
  id v16 = v7;
  id v17 = v6;
  uint64_t v18 = v13;
  double v19 = v11;
  [(PXPeopleFaceCropManager *)self _fetchFaceAndAssetIfNecessaryForOptions:v17 completion:v21];

  return v14;
}

+ (id)_faceCropManagerLog
{
  if (_faceCropManagerLog_onceToken != -1) {
    dispatch_once(&_faceCropManagerLog_onceToken, &__block_literal_global_303_205758);
  }
  v2 = (void *)_faceCropManagerLog_faceCropManagerLog;
  return v2;
}

void __78__PXPeopleFaceCropManager__fetchFaceAndAssetIfNecessaryForOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) person];
  v3 = [*(id *)(a1 + 32) face];
  uint64_t v4 = [*(id *)(a1 + 32) asset];
  if (v4)
  {
    id v5 = (void *)v4;
    if (!v3)
    {
      id v6 = [v2 photoLibrary];
      id v7 = [v6 librarySpecificFetchOptions];

      [v7 setIncludeTorsoAndFaceDetectionData:1];
      id v8 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
      [v7 setIncludedDetectionTypes:v8];

      os_signpost_id_t v9 = (void *)MEMORY[0x1E4F28F60];
      id v10 = [v2 uuid];
      id v11 = [v9 predicateWithFormat:@"%K = %@", @"personForFace.personUUID", v10];
      [v7 setInternalPredicate:v11];

      [v7 setFetchLimit:1];
      uint64_t v12 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v5 options:v7];
      v3 = [v12 firstObject];

      if (v3)
      {
LABEL_17:

        goto LABEL_18;
      }
      os_signpost_id_t v13 = PLUIGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [v2 localIdentifier];
        id v15 = [v5 localIdentifier];
        *(_DWORD *)buf = 138543618;
        double v20 = v14;
        __int16 v21 = 2114;
        double v22 = v15;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: nil face returned for person: %{public}@ in asset: %{public}@", buf, 0x16u);
      }
LABEL_16:
      v3 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    if (!v3)
    {
      v3 = +[PXPeopleUtilities keyFaceForPerson:v2];
      if (!v3)
      {
        id v7 = PLUIGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = [v2 localIdentifier];
          *(_DWORD *)buf = 138543362;
          double v20 = v18;
          _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: nil key face returned for person: %{public}@", buf, 0xCu);
        }
        id v5 = 0;
        goto LABEL_16;
      }
    }
    id v16 = +[PXPeopleUtilities keyAssetForPerson:v2 face:v3];
    id v5 = [v16 firstObject];

    if (!v5)
    {
      id v7 = PLUIGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v17 = [v3 localIdentifier];
        *(_DWORD *)buf = 138543362;
        double v20 = v17;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: nil asset returned for face: %{public}@", buf, 0xCu);
      }
      id v5 = 0;
      goto LABEL_17;
    }
  }
LABEL_18:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__PXPeopleFaceCropManager__handleImage_info_faceCropRequest_resultHandler___block_invoke(uint64_t a1)
{
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "handleResponse", "", v5, 2u);
  }
}

- (void)_cacheResult:(id)a3
{
  id v15 = a3;
  os_signpost_id_t v4 = [v15 options];
  id v5 = [v4 cacheKey];
  if ([v5 length])
  {
    id v6 = [(PXPeopleFaceCropManager *)self _cachedResultForOptions:v4];
    p_faceCropCacheLock = &self->_faceCropCacheLock;
    os_unfair_lock_lock(&self->_faceCropCacheLock);
    id v8 = [(NSCache *)self->_faceCropCache objectForKey:v5];
    if (v8)
    {
      if (!v6) {
        goto LABEL_9;
      }
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(NSCache *)self->_faceCropCache setObject:v8 forKey:v5];
      if (!v6) {
        goto LABEL_9;
      }
    }
    if (([v15 isCropped] & 1) == 0)
    {
      os_signpost_id_t v9 = [v6 image];
      [v9 size];
      double v11 = v10;
      uint64_t v12 = [v15 image];
      [v12 size];
      double v14 = v13;

      if (v11 >= v14) {
        goto LABEL_10;
      }
    }
    [v8 removeLastObject];
LABEL_9:
    [v8 addObject:v15];
LABEL_10:

    os_unfair_lock_unlock(p_faceCropCacheLock);
  }
}

- (id)_cachedResultForOptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 cacheKey];
  if ([v5 length])
  {
    p_faceCropCacheLock = &self->_faceCropCacheLock;
    os_unfair_lock_lock(&self->_faceCropCacheLock);
    [(NSCache *)self->_faceCropCache objectForKey:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "options", (void)v15);
          int v13 = [v12 areFetchParametersEqualtoFetchParametersOfOptions:v4];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    os_unfair_lock_unlock(p_faceCropCacheLock);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int)requestFaceCropForOptions:(id)a3 resultHandler:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = (void *)[a3 copy];
  id v8 = [(PXPeopleFaceCropManager *)self _cachedResultForOptions:v7];
  if (!v8) {
    goto LABEL_7;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v10 = [v8 assetLocalIdentifier];
  [v9 setObject:v10 forKey:@"PXPeopleAssetLocalIdentifierKey"];

  uint64_t v11 = [v8 isCropped];
  uint64_t v12 = (void *)MEMORY[0x1E4F29238];
  if (v11)
  {
    double v13 = *(double *)off_1E5DAB010;
    double v14 = *((double *)off_1E5DAB010 + 1);
    double v15 = *((double *)off_1E5DAB010 + 2);
    double v16 = *((double *)off_1E5DAB010 + 3);
  }
  else
  {
    [v8 faceRect];
  }
  long long v17 = objc_msgSend(v12, "valueWithCGRect:", v13, v14, v15, v16);
  [v9 setObject:v17 forKey:@"PXPeopleContentsRectKey"];

  uint64_t v18 = [v8 isDegraded];
  double v19 = [NSNumber numberWithBool:v18];
  [v9 setObject:v19 forKeyedSubscript:*(void *)off_1E5DAAFC8];

  uint64_t v20 = [v8 image];
  v6[2](v6, v20, v9);

  BOOL v21 = +[PXPeopleFaceCropManager _isFinalForIsDegraded:v18 isCropped:v11];
  if (v21) {
    int v22 = 0;
  }
  else {
LABEL_7:
  }
    int v22 = [(PXPeopleFaceCropManager *)self _prepareFaceCropRequestWithOptions:v7 resultHandler:v6];

  return v22;
}

+ (CGRect)cropRectWithAspectRatioFittingAroundEyeLevelForAspectRatio:(double)a3 pixelFaceCrop:(CGRect)a4 eyelinePoint:(CGPoint)a5
{
}

void __76__PXPeopleFaceCropManager__prepareFaceCropRequestWithOptions_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXPeopleFaceCropManager__prepareFaceCropRequestWithOptions_resultHandler___block_invoke_2;
  aBlock[3] = &unk_1E5DD08D8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 72);
  id v26 = v7;
  uint64_t v27 = v8;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  if ([*(id *)(a1 + 40) canceled]) {
    goto LABEL_20;
  }
  if (!v5)
  {
    double v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: no face for options: %@\n", buf, 0xCu);
    }

    [*(id *)(a1 + 56) cancelRequestForRequestID:*(unsigned int *)(a1 + 80)];
    double v15 = [*(id *)(a1 + 48) person];
    if (v15)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 56) + 48));
      [*(id *)(*(void *)(a1 + 56) + 40) addObject:v15];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 56) + 48));
    }
    double v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.people.faceCropManagerError" code:0 userInfo:0];
    uint64_t v31 = @"PXPeopleErrorKey";
    v32[0] = v16;
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v9[2](v9);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    goto LABEL_19;
  }
  if (!v6)
  {
    uint64_t v18 = PLUIGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 48);
      uint64_t v20 = [v5 localIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: failed to fetch an asset for options: %@\n face: %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 56) cancelRequestForRequestID:*(unsigned int *)(a1 + 80)];
    double v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.people.faceCropManagerError" code:1 userInfo:0];
    id v29 = @"PXPeopleErrorKey";
    v30 = v15;
    double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v9[2](v9);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  [*(id *)(a1 + 40) setFace:v5];
  [*(id *)(a1 + 40) setAsset:v6];
  objc_msgSend(v5, "px_normalizedCenterEyeLine");
  objc_msgSend(*(id *)(a1 + 40), "setNormalizedCenterEyeLine:");
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v22 = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)buf = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)&uint8_t buf[16] = v21;
  BOOL v10 = +[PXPeopleFaceCropManager _shouldTakeSquareCropForFace:cropFactor:outNormalizedFaceCropRect:](PXPeopleFaceCropManager, "_shouldTakeSquareCropForFace:cropFactor:outNormalizedFaceCropRect:", v5, [*(id *)(a1 + 48) cropFactor], buf);
  objc_msgSend(*(id *)(a1 + 40), "setNormalizedFaceCropRect:", *(double *)buf, *(double *)&buf[8], *(_OWORD *)&buf[16]);
  if (v10)
  {
    [*(id *)(a1 + 40) targetSizeToUse];
    if (v11 >= v12) {
      double v11 = v12;
    }
    objc_msgSend(*(id *)(a1 + 40), "setTargetSizeToUse:", v11, v11);
  }
  if ([*(id *)(a1 + 48) wantsSmallFaceRect])
  {
    long long v23 = v22;
    long long v24 = v21;
    +[PXPeopleFaceCropManager _shouldTakeSquareCropForFace:v5 cropFactor:0 outNormalizedFaceCropRect:&v23];
    objc_msgSend(*(id *)(a1 + 40), "setNormalizedSmallFaceRect:", v23, v24);
  }
  v9[2](v9);
  [*(id *)(a1 + 56) _executeFaceCropRequest:*(void *)(a1 + 40) resultHandler:*(void *)(a1 + 64)];
LABEL_20:
}

void __65__PXPeopleFaceCropManager__executeFaceCropRequest_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "executeRequest", "", buf, 2u);
  }

  if ([*(id *)(a1 + 40) canceled])
  {
    int v10 = 1;
  }
  else
  {
    double v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
    int v10 = [v11 BOOLValue];
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
  double v13 = (void *)v12;
  if ((v10 & 1) != 0 || v12)
  {
    if (v10)
    {
      uint64_t v14 = PLUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        double v16 = NSStringFromSize(*(NSSize *)(a1 + 72));
        *(_DWORD *)buf = 138412802;
        uint64_t v24 = v15;
        __int16 v25 = 2112;
        id v26 = v16;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: the image request was canceled. Request: %@ sizeToRequest: %@ info: %@", buf, 0x20u);
      }
    }
    if (v13)
    {
      long long v17 = PLUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = NSStringFromSize(*(NSSize *)(a1 + 72));
        *(_DWORD *)buf = 138412802;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        id v26 = v19;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: error for image request: %@ sizeToRequest %@ info: %@", buf, 0x20u);
      }
      if ((v10 & 1) == 0)
      {
        long long v21 = @"PXPeopleErrorKey";
        long long v22 = v13;
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
  }
  else
  {
    [*(id *)(a1 + 48) _handleImage:v5 info:v6 faceCropRequest:*(void *)(a1 + 40) resultHandler:*(void *)(a1 + 56)];
  }
}

void __76__PXPeopleFaceCropManager__prepareFaceCropRequestWithOptions_resultHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "prepareRequest", "", v5, 2u);
  }
}

+ (BOOL)_shouldTakeSquareCropForFace:(id)a3 cropFactor:(int64_t)a4 outNormalizedFaceCropRect:(CGRect *)a5
{
  id v7 = a3;
  uint64_t v8 = v7;
  if ((unint64_t)a4 < 2)
  {
    +[PXPeopleFaceCropManager _cropFactorValueForCropFactor:a4];
    objc_msgSend(v8, "px_cropRectWithCropFactor:");
    a5->origin.x = v9;
    a5->origin.y = v10;
    a5->size.width = v11;
    a5->size.height = v12;
LABEL_6:
    LOBYTE(a5) = 1;
    goto LABEL_8;
  }
  if (a4 == 2)
  {
    LODWORD(a5) = objc_msgSend(v7, "px_cropRectForPortraitImage:", a5) ^ 1;
    goto LABEL_8;
  }
  if (a4 != 3) {
    goto LABEL_6;
  }
  objc_msgSend(v7, "px_cropRectForPortraitImage:", a5);
  LOBYTE(a5) = 0;
LABEL_8:

  return (char)a5;
}

+ (double)_cropFactorValueForCropFactor:(int64_t)a3
{
  if (a3 == 1) {
    return 7.19999981;
  }
  if ((unint64_t)(a3 - 2) < 2)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"PXPeopleFaceCropManager.m" lineNumber:723 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 2.27999997;
}

+ (CGSize)_constrainedSizeForDesiredSize:(CGSize)result
{
  if (result.width * result.height > 3000000.0)
  {
    double v3 = sqrt(result.width * result.height / 3000000.0);
    float v4 = result.width / v3;
    result.width = roundf(v4);
    float v5 = result.height / v3;
    result.height = roundf(v5);
  }
  return result;
}

+ (PXPeopleFaceCropManager)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PXPeopleFaceCropManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_205775 != -1) {
    dispatch_once(&sharedManager_onceToken_205775, block);
  }
  v2 = (void *)sharedManager_sharedManager_205776;
  return (PXPeopleFaceCropManager *)v2;
}

- (void)_cropImage:(id)a3 request:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CGFloat v11 = +[PXPeopleFaceCropManager _faceCropManagerLog];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  double v13 = v11;
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "imageCrop", "", buf, 2u);
  }

  uint64_t v15 = [v9 options];
  id v16 = v8;
  long long v17 = (CGImage *)[v16 CGImage];
  double Width = (double)CGImageGetWidth(v17);
  double Height = (double)CGImageGetHeight(v17);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PXPeopleFaceCropManager__cropImage_request_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DC4AF0;
  id v20 = v9;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  id v28 = v20;
  double v36 = Width;
  double v37 = Height;
  id v21 = v15;
  id v29 = v21;
  id v22 = v16;
  id v30 = v22;
  long long v23 = v14;
  uint64_t v31 = v23;
  os_signpost_id_t v38 = v12;
  id v24 = v10;
  v32 = self;
  id v33 = v24;
  __int16 v25 = (void (**)(void))_Block_copy(aBlock);
  if ([v21 isSynchronous])
  {
    v25[2](v25);
  }
  else
  {
    id v26 = +[PXPeopleFaceCropManager _cropQueue];
    dispatch_async(v26, v25);
  }
}

+ (id)_cropQueue
{
  if (_cropQueue_onceToken != -1) {
    dispatch_once(&_cropQueue_onceToken, &__block_literal_global_292_205766);
  }
  v2 = (void *)_cropQueue_cropQueue;
  return v2;
}

uint64_t __60__PXPeopleFaceCropManager__cropImage_request_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canceled];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) normalizedEdgeAdjustedCropRect];
    PXRectDenormalize();
  }
  return result;
}

- (void)_compressImage:(id)a3 request:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CGFloat v11 = +[PXPeopleFaceCropManager _faceCropManagerLog];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  double v13 = v11;
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "compressImage", "", buf, 2u);
  }

  uint64_t v15 = [v9 options];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXPeopleFaceCropManager__compressImage_request_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DCF088;
  id v16 = v9;
  id v24 = v16;
  id v17 = v8;
  id v25 = v17;
  uint64_t v18 = v14;
  id v26 = v18;
  os_signpost_id_t v30 = v12;
  id v19 = v15;
  id v27 = v19;
  id v20 = v10;
  id v28 = self;
  id v29 = v20;
  id v21 = (void (**)(void))_Block_copy(aBlock);
  if ([v19 isSynchronous])
  {
    v21[2](v21);
  }
  else
  {
    id v22 = +[PXPeopleFaceCropManager _compressionQueue];
    dispatch_async(v22, v21);
  }
}

+ (double)_cornerRadiusForCornerStyle:(int64_t)a3 pixelTargetSize:(CGSize)a4 displayScale:(double)a5
{
  double v5 = fmin(a4.width, a4.height);
  BOOL v6 = v5 < 10.0 && a3 == 1;
  int64_t v7 = 2;
  if (!v6) {
    int64_t v7 = a3;
  }
  if (v7 == 2) {
    return v5 * 0.5;
  }
  double v8 = 0.0;
  if (v7 == 1)
  {
    +[PXPeopleFaceCropManager roundedCornerRadiusForTargetSize:displayScale:](PXPeopleFaceCropManager, "roundedCornerRadiusForTargetSize:displayScale:", a4.width, a4.height, a5, 0.0);
    return result;
  }
  return v8;
}

+ (id)_compressionQueue
{
  if (_compressionQueue_onceToken != -1) {
    dispatch_once(&_compressionQueue_onceToken, &__block_literal_global_298);
  }
  v2 = (void *)_compressionQueue_compressionQueue;
  return v2;
}

void __44__PXPeopleFaceCropManager__compressionQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = dispatch_queue_attr_make_initially_inactive(v1);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.people.faceCropManager.compress", attr);
  double v3 = (void *)_compressionQueue_compressionQueue;
  _compressionQueue_compressionQueue = (uint64_t)v2;

  float v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleMainQueueTask:&__block_literal_global_301_205764];
}

void __40__PXPeopleFaceCropManager_sharedManager__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___PXPeopleFaceCropManager;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "init");
  dispatch_queue_t v2 = (void *)sharedManager_sharedManager_205776;
  sharedManager_sharedManager_205776 = v1;
}

- (PXPeopleFaceCropManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleFaceCropManager;
  dispatch_queue_t v2 = [(PXPeopleFaceCropManager *)&v10 init];
  if (v2)
  {
    objc_super v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    faceCropCache = v2->_faceCropCache;
    v2->_faceCropCache = v3;

    v2->_faceCropCacheLock._os_unfair_lock_opaque = 0;
    double v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    faceCropRequestsByRequestIDs = v2->_faceCropRequestsByRequestIDs;
    v2->_faceCropRequestsByRequestIDs = v5;

    v2->_faceCropRequestsByRequestIDsLock._os_unfair_lock_opaque = 0;
    int64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    peopleWithoutKeyFaces = v2->_peopleWithoutKeyFaces;
    v2->_peopleWithoutKeyFaces = v7;

    v2->_peopleWithoutKeyFacesLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleWithoutKeyFaces, 0);
  objc_storeStrong((id *)&self->_faceCropRequestsByRequestIDs, 0);
  objc_storeStrong((id *)&self->_faceCropCache, 0);
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 hasIncrementalChanges] & 1) == 0)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    p_faceCropCacheLock = &self->_faceCropCacheLock;
    os_unfair_lock_lock(&self->_faceCropCacheLock);
    uint64_t v31 = [(NSCache *)self->_faceCropCache allObjects];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __56__PXPeopleFaceCropManager_prepareForPhotoLibraryChange___block_invoke;
    v55[3] = &unk_1E5DC4B68;
    id v56 = v28;
    v32 = self;
    id v33 = v29;
    v58 = v32;
    SEL v59 = a2;
    id v57 = v33;
    [v31 enumerateObjectsUsingBlock:v55];

    os_unfair_lock_unlock(p_faceCropCacheLock);
    [v33 copy];
    os_unfair_lock_lock(&v32->_peopleWithoutKeyFacesLock);
    PXMap();
  }
  v46 = [v5 updatedObjectIDs];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  os_unfair_lock_t lock = &self->_faceCropCacheLock;
  os_unfair_lock_lock(&self->_faceCropCacheLock);
  double v36 = self;
  [(NSCache *)self->_faceCropCache allObjects];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (!v39)
  {
LABEL_38:

    os_unfair_lock_unlock(lock);
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    os_unfair_lock_lock(&v36->_peopleWithoutKeyFacesLock);
    v5;
    v27;
    PXMap();
  }
  uint64_t v38 = *(void *)v52;
  id v45 = v5;
LABEL_4:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v52 != v38) {
      objc_enumerationMutation(obj);
    }
    uint64_t v40 = v6;
    int64_t v7 = *(void **)(*((void *)&v51 + 1) + 8 * v6);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v43 = v7;
    uint64_t v8 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v47, v60, 16, lock);
    if (v8) {
      break;
    }
LABEL_36:

    uint64_t v6 = v40 + 1;
    if (v40 + 1 == v39)
    {
      uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (!v39) {
        goto LABEL_38;
      }
      goto LABEL_4;
    }
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v48;
LABEL_9:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v48 != v10) {
      objc_enumerationMutation(v43);
    }
    os_signpost_id_t v12 = *(void **)(*((void *)&v47 + 1) + 8 * v11);
    double v13 = [v12 options];
    uint64_t v14 = [v13 person];
    uint64_t v15 = [v13 face];
    id v16 = [v12 assetObjectID];
    char v17 = [v46 containsObject:v16];
    BOOL v18 = +[PXPeopleFaceCropManager _change:v5 containsVisibleChangesToAssetWithOID:v16];
    BOOL v19 = v18;
    if ((v17 & 1) == 0 && !v18) {
      break;
    }
    BOOL v22 = v15 != 0;
    if (v14) {
      goto LABEL_29;
    }
LABEL_32:
    if (v22) {
      goto LABEL_33;
    }
LABEL_34:

    ++v11;
    id v5 = v45;
    if (v9 == v11)
    {
      uint64_t v9 = [v43 countByEnumeratingWithState:&v47 objects:v60 count:16];
      if (!v9) {
        goto LABEL_36;
      }
      goto LABEL_9;
    }
  }
  int v20 = [v5 contentOrThumbnailChangedForPHAssetOID:v16];
  if (v14) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  if (v21)
  {
    long long v23 = [v14 objectID];
    int v24 = [v5 keyFaceChangedForPersonOID:v23];

    if (!v24) {
      goto LABEL_34;
    }
    BOOL v22 = 0;
  }
  else
  {
    if (v15) {
      BOOL v22 = v20;
    }
    else {
      BOOL v22 = 0;
    }
    if (!v14)
    {
      if (!v22) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  BOOL v19 = 0;
LABEL_29:
  id v25 = [v14 localIdentifier];
  [v44 addObject:v25];

  if (v19)
  {
    [v41 addObject:v14];
    if (!v22) {
      goto LABEL_34;
    }
LABEL_33:
    id v26 = [v15 localIdentifier];
    [v42 addObject:v26];

    goto LABEL_34;
  }
  goto LABEL_32;
}

void __56__PXPeopleFaceCropManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_super v3 = [v10 firstObject];
  float v4 = [v3 options];

  id v5 = [v4 cacheKey];
  uint64_t v6 = [v4 person];

  if (v6)
  {
    int64_t v7 = (id *)(a1 + 32);
  }
  else
  {
    uint64_t v8 = [v4 face];

    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 48) file:@"PXPeopleFaceCropManager.m" lineNumber:960 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    int64_t v7 = (id *)(a1 + 40);
  }
  [*v7 addObject:v5];
}

id __56__PXPeopleFaceCropManager_prepareForPhotoLibraryChange___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = *(void **)(a1 + 32);
  id v5 = [v3 objectID];
  LODWORD(v4) = [v4 keyFaceChangedForPersonOID:v5];

  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v6 = [v3 localIdentifier];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __56__PXPeopleFaceCropManager_prepareForPhotoLibraryChange___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

- (void)_invalidateCacheForLocalIdentifiers:(id)a3 wantsNotificationPosted:(BOOL)a4 userInfoKey:(id)a5
{
  BOOL v6 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v10 && v6)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXPeopleFaceCropManager.m", 879, @"Invalid parameter not satisfying: %@", @"!wantsNotificationPosted || (wantsNotificationPosted && userInfoKey)" object file lineNumber description];
  }
  if ([v9 count])
  {
    uint64_t v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v12 = @"NO";
      if (v6) {
        os_signpost_id_t v12 = @"YES";
      }
      double v13 = v12;
      *(_DWORD *)buf = 138543618;
      id v38 = v9;
      __int16 v39 = 2112;
      uint64_t v40 = v13;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: invalidating cache for local identifiers: %{public}@ wantsNotificationPosted: %@", buf, 0x16u);
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
    faceCropRequestsByRequestIDs = self->_faceCropRequestsByRequestIDs;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __99__PXPeopleFaceCropManager__invalidateCacheForLocalIdentifiers_wantsNotificationPosted_userInfoKey___block_invoke;
    v31[3] = &unk_1E5DC4B18;
    id v16 = v9;
    id v32 = v16;
    id v17 = v14;
    id v33 = v17;
    [(NSMutableDictionary *)faceCropRequestsByRequestIDs enumerateKeysAndObjectsUsingBlock:v31];
    [(NSMutableDictionary *)self->_faceCropRequestsByRequestIDs removeObjectsForKeys:v17];

    os_unfair_lock_unlock(&self->_faceCropRequestsByRequestIDsLock);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          -[PXPeopleFaceCropManager cancelRequestForRequestID:](self, "cancelRequestForRequestID:", [*(id *)(*((void *)&v27 + 1) + 8 * i) intValue]);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v20);
    }

    os_unfair_lock_lock(&self->_faceCropCacheLock);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __99__PXPeopleFaceCropManager__invalidateCacheForLocalIdentifiers_wantsNotificationPosted_userInfoKey___block_invoke_2;
    v26[3] = &unk_1E5DC4B40;
    v26[4] = self;
    [v16 enumerateObjectsUsingBlock:v26];
    os_unfair_lock_unlock(&self->_faceCropCacheLock);
    if (v6)
    {
      long long v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v34 = v10;
      id v35 = v16;
      int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      [v23 postNotificationName:@"PXPeopleFaceCropManagerDidInvalidateCacheNotification" object:self userInfo:v24];
    }
  }
}

void __99__PXPeopleFaceCropManager__invalidateCacheForLocalIdentifiers_wantsNotificationPosted_userInfoKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(a1 + 32);
  BOOL v6 = [a3 options];
  int64_t v7 = [v6 cacheKey];
  LODWORD(v5) = [v5 containsObject:v7];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

uint64_t __99__PXPeopleFaceCropManager__invalidateCacheForLocalIdentifiers_wantsNotificationPosted_userInfoKey___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:a2];
}

- (void)_emptyFaceCropCache
{
  p_faceCropCacheLock = &self->_faceCropCacheLock;
  os_unfair_lock_lock(&self->_faceCropCacheLock);
  [(NSCache *)self->_faceCropCache removeAllObjects];
  os_unfair_lock_unlock(p_faceCropCacheLock);
  float v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: emptied the face crop cache", v5, 2u);
  }
}

- (void)_cleanupForImage:(id)a3 request:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  int64_t v7 = [v6 options];
  if (+[PXPeopleFaceCropManager _shouldCacheResultForOptions:v7 isDegraded:0 isCropped:1 isForCleanup:1])
  {
    id v8 = [v6 asset];
    id v9 = [PXPeopleFaceCropFetchResult alloc];
    id v10 = [v8 objectID];
    uint64_t v11 = [v8 localIdentifier];
    os_signpost_id_t v12 = -[PXPeopleFaceCropFetchResult initWithImage:assetObjectID:assetLocalIdentifier:faceRect:isCropped:isDegraded:options:](v9, "initWithImage:assetObjectID:assetLocalIdentifier:faceRect:isCropped:isDegraded:options:", v14, v10, v11, 1, 0, v7, *(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));

    [(PXPeopleFaceCropManager *)self _cacheResult:v12];
  }
  double v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "faceCropRequestID"));
  os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
  [(NSMutableDictionary *)self->_faceCropRequestsByRequestIDs removeObjectForKey:v13];
  os_unfair_lock_unlock(&self->_faceCropRequestsByRequestIDsLock);
}

void __64__PXPeopleFaceCropManager__compressImage_request_resultHandler___block_invoke(uint64_t a1)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) canceled] & 1) == 0)
  {
    id v2 = *(id *)(a1 + 40);
    id v3 = objc_msgSend(*(id *)(a1 + 40), "px_ASTCCompressedImageWithBlockSize:", 68);
    float v4 = v3;
    if (v3)
    {
      id v5 = v3;

      id v2 = v5;
    }
    id v6 = *(id *)(a1 + 48);
    int64_t v7 = v6;
    os_signpost_id_t v8 = *(void *)(a1 + 80);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)id v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "compressImage", "", v17, 2u);
    }

    v18[0] = @"PXPeopleContentsRectKey";
    id v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", *(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
    v18[1] = @"PXPeopleIsFinalImageKey";
    v19[0] = v9;
    id v10 = [NSNumber numberWithBool:1];
    v19[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    os_signpost_id_t v12 = (void *)[v11 mutableCopy];

    double v13 = [*(id *)(a1 + 32) asset];
    id v14 = [v13 localIdentifier];
    [v12 setObject:v14 forKey:@"PXPeopleAssetLocalIdentifierKey"];

    if ([*(id *)(a1 + 56) wantsSmallFaceRect])
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F29238];
      [*(id *)(a1 + 32) smallFaceRect];
      id v16 = objc_msgSend(v15, "valueWithCGRect:");
      [v12 setObject:v16 forKey:@"PXPeopleSmallFaceRectKey"];
    }
    [v12 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*(void *)off_1E5DAAFC8];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    [*(id *)(a1 + 64) _cleanupForImage:v2 request:*(void *)(a1 + 32)];
  }
}

- (void)invalidateCacheForPerson:(id)a3
{
  if (a3)
  {
    float v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [a3 localIdentifier];
    id v5 = [v4 setWithObject:v6];
    [(PXPeopleFaceCropManager *)self _invalidateCacheForLocalIdentifiers:v5 wantsNotificationPosted:1 userInfoKey:@"PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey"];
  }
}

- (BOOL)isRequestActiveWithRequestID:(int)a3
{
  float v4 = [NSNumber numberWithInt:*(void *)&a3];
  p_faceCropRequestsByRequestIDsLock = &self->_faceCropRequestsByRequestIDsLock;
  os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
  id v6 = [(NSMutableDictionary *)self->_faceCropRequestsByRequestIDs objectForKey:v4];
  os_unfair_lock_unlock(p_faceCropRequestsByRequestIDsLock);

  return v6 != 0;
}

- (void)cancelRequestForRequestID:(int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  float v4 = [NSNumber numberWithInt:*(void *)&a3];
  os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
  id v5 = [(NSMutableDictionary *)self->_faceCropRequestsByRequestIDs objectForKey:v4];
  [(NSMutableDictionary *)self->_faceCropRequestsByRequestIDs removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_faceCropRequestsByRequestIDsLock);
  [v5 cancel];
  id v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    os_signpost_id_t v8 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: canceled request: %@", (uint8_t *)&v7, 0xCu);
  }
}

void __46__PXPeopleFaceCropManager__faceCropManagerLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.people", "PeopleFaceCropManager");
  uint64_t v1 = (void *)_faceCropManagerLog_faceCropManagerLog;
  _faceCropManagerLog_faceCropManagerLog = (uint64_t)v0;
}

void __44__PXPeopleFaceCropManager__compressionQueue__block_invoke_2()
{
}

void __37__PXPeopleFaceCropManager__cropQueue__block_invoke()
{
  os_log_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = dispatch_queue_attr_make_initially_inactive(v1);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.people.faceCropManager.crop", attr);
  id v3 = (void *)_cropQueue_cropQueue;
  _cropQueue_cropQueue = (uint64_t)v2;

  float v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleTaskAfterCATransactionCommits:&__block_literal_global_296_205769];
}

void __37__PXPeopleFaceCropManager__cropQueue__block_invoke_2()
{
}

void __38__PXPeopleFaceCropManager__fetchQueue__block_invoke()
{
  dispatch_queue_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.people.faceCropManager.fetch", v2);
  uint64_t v1 = (void *)_fetchQueue_fetchQueue;
  _fetchQueue_fetchQueue = (uint64_t)v0;
}

+ (BOOL)_change:(id)a3 containsVisibleChangesToAssetWithOID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 trashedStateChangedForPHAssetOID:v6] & 1) != 0
    || ([v5 hiddenStateChangedForPHAssetOID:v6] & 1) != 0)
  {
    char v7 = 1;
  }
  else
  {
    os_signpost_id_t v8 = [v5 deletedObjectIDs];
    char v7 = [v8 containsObject:v6];
  }
  return v7;
}

+ (BOOL)_isFinalForIsDegraded:(BOOL)a3 isCropped:(BOOL)a4
{
  return a4 & ~a3;
}

+ (BOOL)_shouldCacheResultForOptions:(id)a3 isDegraded:(BOOL)a4 isCropped:(BOOL)a5 isForCleanup:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  if ([v9 shouldCacheResult])
  {
    uint64_t v10 = [v9 deliveryMode];
    BOOL v11 = v10 == 0;
    if (v6)
    {
      uint64_t v12 = v10;
      BOOL v13 = +[PXPeopleFaceCropManager _isFinalForIsDegraded:v8 isCropped:v7];
      if (v12) {
        BOOL v11 = v13;
      }
      else {
        BOOL v11 = 1;
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (double)_cornerRadiusForRoundedCornerStyleWithDisplayScale:(double)a3
{
  BOOL v4 = +[PXPeopleFaceCropFetchOptions shouldUseLemonadeRoundedCorners];
  double result = 10.0;
  if (v4)
  {
    +[PXLemonadePeopleCellSpecsConstants cornerRadius];
    return v6 * a3;
  }
  return result;
}

+ (double)roundedCornerRadiusForTargetSize:(CGSize)a3 displayScale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  +[PXPeopleFaceCropManager _cornerRadiusForRoundedCornerStyleWithDisplayScale:a4];
  if (height >= width) {
    double v7 = width;
  }
  else {
    double v7 = height;
  }
  double v8 = v7 * 0.15;
  if (v6 > v8) {
    double v6 = v8;
  }
  float v9 = v6;
  return ceilf(v9);
}

+ (int)generateUniqueRequestID
{
  return +[PXPeopleFaceCropRequest generateUniqueRequestID];
}

- (int)requestFaceCropImageForPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  BOOL v13 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v12, width, height, a5);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __112__PXPeopleFaceCropManager_Convenience__requestFaceCropImageForPerson_targetSize_displayScale_completionHandler___block_invoke;
  v16[3] = &unk_1E5DD24E8;
  id v17 = v11;
  id v14 = v11;
  LODWORD(self) = [(PXPeopleFaceCropManager *)self requestFaceCropForOptions:v13 resultHandler:v16];

  return (int)self;
}

void __112__PXPeopleFaceCropManager_Convenience__requestFaceCropImageForPerson_targetSize_displayScale_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"PXPeopleErrorKey"];
  double v8 = [v6 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];

  [v8 CGRectValue];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PXPeopleFaceCropManager_Convenience__requestFaceCropImageForPerson_targetSize_displayScale_completionHandler___block_invoke_2;
  block[3] = &unk_1E5DC4BB8;
  id v17 = *(id *)(a1 + 32);
  id v22 = v7;
  id v23 = v17;
  uint64_t v24 = v10;
  uint64_t v25 = v12;
  uint64_t v26 = v14;
  uint64_t v27 = v16;
  id v21 = v5;
  id v18 = v7;
  id v19 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __112__PXPeopleFaceCropManager_Convenience__requestFaceCropImageForPerson_targetSize_displayScale_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double, double, double, double))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

@end