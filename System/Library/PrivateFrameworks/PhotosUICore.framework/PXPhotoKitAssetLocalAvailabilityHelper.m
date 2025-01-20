@interface PXPhotoKitAssetLocalAvailabilityHelper
- (BOOL)treatLivePhotoAsStill;
- (BOOL)wasInterrupted;
- (NSMutableArray)pinnedResourceLocalAvailabilityRequests;
- (NSMutableArray)resourceLocalAvailabilityRequests;
- (NSProgress)localAvailabilityProgress;
- (NSProgress)overallProgress;
- (OS_dispatch_queue)workQueue;
- (PHResourceLocalAvailabilityRequest)currentResourceRequest;
- (PXFastEnumeration)assets;
- (PXPhotoKitAssetLocalAvailabilityHelper)initWithAssets:(id)a3 treatLivePhotoAsStill:(BOOL)a4;
- (id)_setUpLocalAvailabilityRequests;
- (id)ensureLocalAvailabilityOfAssetsWithCompletionHandler:(id)a3;
- (unint64_t)_ensureAssetsAreLocallyAvailable:(id *)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLocalAvailabilityProgress:(id)a3;
@end

@implementation PXPhotoKitAssetLocalAvailabilityHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAvailabilityProgress, 0);
  objc_storeStrong((id *)&self->_overallProgress, 0);
  objc_storeStrong((id *)&self->_currentResourceRequest, 0);
  objc_storeStrong((id *)&self->_resourceLocalAvailabilityRequests, 0);
  objc_storeStrong((id *)&self->_pinnedResourceLocalAvailabilityRequests, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (NSProgress)localAvailabilityProgress
{
  return self->_localAvailabilityProgress;
}

- (NSProgress)overallProgress
{
  return self->_overallProgress;
}

- (PHResourceLocalAvailabilityRequest)currentResourceRequest
{
  return self->_currentResourceRequest;
}

- (NSMutableArray)resourceLocalAvailabilityRequests
{
  return self->_resourceLocalAvailabilityRequests;
}

- (NSMutableArray)pinnedResourceLocalAvailabilityRequests
{
  return self->_pinnedResourceLocalAvailabilityRequests;
}

- (BOOL)wasInterrupted
{
  return self->_wasInterrupted;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)treatLivePhotoAsStill
{
  return self->_treatLivePhotoAsStill;
}

- (PXFastEnumeration)assets
{
  return self->_assets;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &PXPhotoKitAssetLocalAvailabilityHelperFractionCompletedContext)
  {
    v13 = [(PXPhotoKitAssetLocalAvailabilityHelper *)self localAvailabilityProgress];
    int v14 = [v11 isEqual:v13];

    if (v14)
    {
      v15 = [(PXPhotoKitAssetLocalAvailabilityHelper *)self localAvailabilityProgress];
      [v15 fractionCompleted];
      uint64_t v17 = v16;

      v18 = PLUIGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = v17;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: Fraction completed: %f", buf, 0xCu);
      }
    }
  }
  else if (a6 == &PXPhotoKitAssetLocalAvailabilityHelperIsCancelledContext)
  {
    v19 = [(PXPhotoKitAssetLocalAvailabilityHelper *)self localAvailabilityProgress];
    int v20 = [v11 isEqual:v19];

    if (v20)
    {
      v21 = [(PXPhotoKitAssetLocalAvailabilityHelper *)self localAvailabilityProgress];
      int v22 = [v21 isCancelled];

      if (v22)
      {
        v23 = PLUIGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: Action was cancelled", buf, 2u);
        }

        self->_wasInterrupted = 1;
      }
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PXPhotoKitAssetLocalAvailabilityHelper;
    [(PXPhotoKitAssetLocalAvailabilityHelper *)&v24 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (unint64_t)_ensureAssetsAreLocallyAvailable:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F39278]);
  objc_msgSend(v5, "setTreatLivePhotoAsStill:", -[PXPhotoKitAssetLocalAvailabilityHelper treatLivePhotoAsStill](self, "treatLivePhotoAsStill"));
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__178898;
  uint64_t v26 = __Block_byref_object_dispose__178899;
  id v27 = 0;
  dispatch_group_t v6 = dispatch_group_create();
  resourceLocalAvailabilityRequests = self->_resourceLocalAvailabilityRequests;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __75__PXPhotoKitAssetLocalAvailabilityHelper__ensureAssetsAreLocallyAvailable___block_invoke;
  uint64_t v17 = &unk_1E5DC2408;
  v8 = v6;
  v18 = v8;
  v19 = self;
  id v9 = v5;
  id v20 = v9;
  v21 = &v22;
  [(NSMutableArray *)resourceLocalAvailabilityRequests enumerateObjectsUsingBlock:&v14];
  if ([(PXPhotoKitAssetLocalAvailabilityHelper *)self wasInterrupted])
  {
    id v10 = [(PXPhotoKitAssetLocalAvailabilityHelper *)self localAvailabilityProgress];
    [v10 cancel];

    unint64_t v11 = 2;
  }
  else
  {
    id v12 = (void *)v23[5];
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      unint64_t v11 = 1;
    }
    else
    {
      unint64_t v11 = 0;
    }
  }

  _Block_object_dispose(&v22, 8);
  return v11;
}

void __75__PXPhotoKitAssetLocalAvailabilityHelper__ensureAssetsAreLocallyAvailable___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 48), a2);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __75__PXPhotoKitAssetLocalAvailabilityHelper__ensureAssetsAreLocallyAvailable___block_invoke_2;
  uint64_t v16 = &unk_1E5DC23E0;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 56);
  id v17 = v9;
  uint64_t v19 = v10;
  id v20 = a4;
  id v18 = *(id *)(a1 + 32);
  [v9 retrieveRequiredResourcesWithOptions:v8 completionHandler:&v13];
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(v11 + 48);
  *(void *)(v11 + 48) = 0;

  if (objc_msgSend(*(id *)(a1 + 40), "wasInterrupted", v13, v14, v15, v16)) {
    *a4 = 1;
  }
}

void __75__PXPhotoKitAssetLocalAvailabilityHelper__ensureAssetsAreLocallyAvailable___block_invoke_2(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [*(id *)(a1 + 32) asset];
  id v12 = [v11 localIdentifier];

  if (a2)
  {
    uint64_t v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v9;
      uint64_t v14 = "PXPhotoKitAssetLocalAvailabilityHelper: Asset %@ retrieval succeeded: %@";
LABEL_7:
      uint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_1A9AE7000, v15, v16, v14, (uint8_t *)&v17, 0x16u);
    }
  }
  else if (a3)
  {
    **(unsigned char **)(a1 + 56) = 1;
    uint64_t v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v9;
      uint64_t v14 = "PXPhotoKitAssetLocalAvailabilityHelper: Asset %@ retrieval cancelled: %@";
      goto LABEL_7;
    }
  }
  else
  {
    if (!v10) {
      goto LABEL_10;
    }
    **(unsigned char **)(a1 + 56) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
    uint64_t v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412546;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v10;
      uint64_t v14 = "PXPhotoKitAssetLocalAvailabilityHelper: Asset %@ retrieval failed with error: %@.";
      uint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
  }

LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)_setUpLocalAvailabilityRequests
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F39278]);
  objc_msgSend(v3, "setTreatLivePhotoAsStill:", -[PXPhotoKitAssetLocalAvailabilityHelper treatLivePhotoAsStill](self, "treatLivePhotoAsStill"));
  v4 = [MEMORY[0x1E4F1CA48] array];
  pinnedResourceLocalAvailabilityRequests = self->_pinnedResourceLocalAvailabilityRequests;
  self->_pinnedResourceLocalAvailabilityRequests = v4;

  dispatch_group_t v6 = [MEMORY[0x1E4F1CA48] array];
  resourceLocalAvailabilityRequests = self->_resourceLocalAvailabilityRequests;
  self->_resourceLocalAvailabilityRequests = v6;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = [(PXPhotoKitAssetLocalAvailabilityHelper *)self assets];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F39270]) initWithAsset:v13 requestType:2];
        [(NSMutableArray *)self->_pinnedResourceLocalAvailabilityRequests addObject:v14];
        uint64_t v15 = [v14 resourceAvailabilityForOptions:v3 resourceInfo:0];
        os_log_type_t v16 = PLUIGetLog();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v17)
          {
            id v18 = [v13 localIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = (uint64_t)v18;
            _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: [Queued] Resources need retrieval for %@", buf, 0xCu);
          }
          [(NSMutableArray *)self->_resourceLocalAvailabilityRequests addObject:v14];
        }
        else
        {
          if (v17)
          {
            __int16 v19 = [v13 localIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = (uint64_t)v19;
            _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: [Skipped] Resources already available for %@", buf, 0xCu);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v10);
  }

  id v20 = PLUIGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = [(NSMutableArray *)self->_resourceLocalAvailabilityRequests count];
    uint64_t v22 = [(PXPhotoKitAssetLocalAvailabilityHelper *)self assets];
    uint64_t v23 = [v22 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v35 = v21;
    __int16 v36 = 2048;
    uint64_t v37 = v23;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: %tu / %tu assets need to have their resource retrieved.", buf, 0x16u);
  }
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", -[NSMutableArray count](self->_resourceLocalAvailabilityRequests, "count"));
  v25 = self->_resourceLocalAvailabilityRequests;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __73__PXPhotoKitAssetLocalAvailabilityHelper__setUpLocalAvailabilityRequests__block_invoke;
  v28[3] = &unk_1E5DC23B8;
  id v26 = v24;
  id v29 = v26;
  [(NSMutableArray *)v25 enumerateObjectsUsingBlock:v28];
  [(PXPhotoKitAssetLocalAvailabilityHelper *)self setLocalAvailabilityProgress:v26];

  return v26;
}

void __73__PXPhotoKitAssetLocalAvailabilityHelper__setUpLocalAvailabilityRequests__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 progress];
  [v2 addChild:v3 withPendingUnitCount:1];
}

- (void)setLocalAvailabilityProgress:(id)a3
{
  uint64_t v8 = (NSProgress *)a3;
  id v5 = self->_localAvailabilityProgress;
  if (v5 == v8)
  {
  }
  else
  {
    dispatch_group_t v6 = v5;
    char v7 = [(NSProgress *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      [(NSProgress *)self->_localAvailabilityProgress removeObserver:self forKeyPath:@"fractionCompleted"];
      [(NSProgress *)self->_localAvailabilityProgress removeObserver:self forKeyPath:@"cancelled"];
      objc_storeStrong((id *)&self->_localAvailabilityProgress, a3);
      [(NSProgress *)self->_localAvailabilityProgress addObserver:self forKeyPath:@"fractionCompleted" options:4 context:&PXPhotoKitAssetLocalAvailabilityHelperFractionCompletedContext];
      [(NSProgress *)self->_localAvailabilityProgress addObserver:self forKeyPath:@"cancelled" options:4 context:&PXPhotoKitAssetLocalAvailabilityHelperIsCancelledContext];
    }
  }
}

- (id)ensureLocalAvailabilityOfAssetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_localAvailabilityProgress) {
    PXAssertGetLog();
  }
  self->_wasInterrupted = 0;
  id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_group_t v6 = (OS_dispatch_queue *)dispatch_queue_create("PXPhotoKitAssetLocalAvailabilityHelper", v5);
  workQueue = self->_workQueue;
  self->_workQueue = v6;

  uint64_t v8 = [(PXPhotoKitAssetLocalAvailabilityHelper *)self _setUpLocalAvailabilityRequests];
  uint64_t v9 = self->_workQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__PXPhotoKitAssetLocalAvailabilityHelper_ensureLocalAvailabilityOfAssetsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5DD3280;
  v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(v9, v12);

  return v8;
}

void __95__PXPhotoKitAssetLocalAvailabilityHelper_ensureLocalAvailabilityOfAssetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v13 = 0;
  uint64_t v3 = [v2 _ensureAssetsAreLocallyAvailable:&v13];
  id v4 = v13;
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__PXPhotoKitAssetLocalAvailabilityHelper_ensureLocalAvailabilityOfAssetsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5DC2380;
    uint64_t v12 = v3;
    id v11 = v5;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __95__PXPhotoKitAssetLocalAvailabilityHelper_ensureLocalAvailabilityOfAssetsWithCompletionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2 == 2)
  {
    uint64_t v3 = *(void (**)(void))(a1[6] + 16);
  }
  else if (v2 == 1)
  {
    uint64_t v3 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    if (v2) {
      goto LABEL_8;
    }
    uint64_t v3 = *(void (**)(void))(a1[6] + 16);
  }
  v3();
LABEL_8:
  id v4 = (void *)a1[5];
  return [v4 setLocalAvailabilityProgress:0];
}

- (void)dealloc
{
  [(PXPhotoKitAssetLocalAvailabilityHelper *)self setLocalAvailabilityProgress:0];
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitAssetLocalAvailabilityHelper;
  [(PXPhotoKitAssetLocalAvailabilityHelper *)&v3 dealloc];
}

- (PXPhotoKitAssetLocalAvailabilityHelper)initWithAssets:(id)a3 treatLivePhotoAsStill:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotoKitAssetLocalAvailabilityHelper;
  uint64_t v8 = [(PXPhotoKitAssetLocalAvailabilityHelper *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_assets, a3);
    v9->_treatLivePhotoAsStill = a4;
  }

  return v9;
}

@end