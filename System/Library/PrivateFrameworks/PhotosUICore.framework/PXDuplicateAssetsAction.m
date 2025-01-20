@interface PXDuplicateAssetsAction
+ (BOOL)canPerformOnAllAssets:(id)a3;
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageTime;
- (BOOL)canExtractStill;
- (BOOL)duplicatesAsStill;
- (BOOL)duplicatesOriginal;
- (NSProgress)actionProgress;
- (PHFetchResult)createdAssets;
- (PXDuplicateAssetsAction)initWithAssets:(id)a3 assetCollection:(id)a4;
- (PXDuplicateAssetsAction)initWithSelectionSnapshot:(id)a3;
- (id)actionNameLocalizationKey;
- (id)downloadCompletionHandler;
- (id)processDuplicateActionWithAssets:(id)a3 assetCollection:(id)a4 assetsInAssetCollection:(id)a5;
- (int64_t)assetCount;
- (void)_checkDuplicateCapabilities;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)processWithAssets:(id)a3 assetCollection:(id)a4 canDuplicate:(BOOL *)a5 canExtractStill:(BOOL *)a6;
- (void)setActionProgress:(id)a3;
- (void)setDownloadCompletionHandler:(id)a3;
- (void)setDuplicatesAsStill:(BOOL)a3;
- (void)setDuplicatesOriginal:(BOOL)a3;
- (void)setStillImageTime:(id *)a3;
@end

@implementation PXDuplicateAssetsAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_downloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_actionProgress, 0);
  objc_storeStrong((id *)&self->_collectionInput, 0);
  objc_storeStrong((id *)&self->_assetsInput, 0);
  objc_storeStrong((id *)&self->_assetsCreated, 0);
  objc_storeStrong((id *)&self->_createdAssetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetsToDuplicate, 0);
}

- (id)downloadCompletionHandler
{
  return self->_downloadCompletionHandler;
}

- (NSProgress)actionProgress
{
  return self->_actionProgress;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (BOOL)duplicatesAsStill
{
  return self->_duplicatesAsStill;
}

- (BOOL)duplicatesOriginal
{
  return self->_duplicatesOriginal;
}

- (PHFetchResult)createdAssets
{
  if (!self->_assetsCreated && [(NSArray *)self->_createdAssetLocalIdentifiers count])
  {
    v3 = (void *)MEMORY[0x1E4F38EB8];
    createdAssetLocalIdentifiers = self->_createdAssetLocalIdentifiers;
    v5 = [(PXPhotosAction *)self standardFetchOptions];
    v6 = [v3 fetchAssetsWithLocalIdentifiers:createdAssetLocalIdentifiers options:v5];
    assetsCreated = self->_assetsCreated;
    self->_assetsCreated = v6;
  }
  v8 = self->_assetsCreated;
  return v8;
}

- (void)performUndo:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F38EB8];
  createdAssetLocalIdentifiers = self->_createdAssetLocalIdentifiers;
  id v6 = a3;
  v7 = [(PXPhotosAction *)self standardFetchOptions];
  id v13 = [v4 fetchAssetsWithLocalIdentifiers:createdAssetLocalIdentifiers options:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F38F30]);
  [v8 setExpungeSource:4];
  v9 = (void *)MEMORY[0x1E4F38ED0];
  v10 = [(PXPhotosAction *)self photoLibrary];
  [v9 performBatchExpungeWithAssets:v13 deleteOptions:v8 photoLibrary:v10 completionHandler:v6];

  v11 = self->_createdAssetLocalIdentifiers;
  self->_createdAssetLocalIdentifiers = 0;

  assetsCreated = self->_assetsCreated;
  self->_assetsCreated = 0;
}

- (id)processDuplicateActionWithAssets:(id)a3 assetCollection:(id)a4 assetsInAssetCollection:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  uint64_t v10 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = v8;
  v12 = v9;
  id v13 = (void *)v10;
  id obj = v11;
  uint64_t v35 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v35)
  {
    unint64_t v14 = 0x1E4F38000uLL;
    uint64_t v34 = *(void *)v39;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v38 + 1) + 8 * v15);
        id v17 = objc_alloc_init(*(Class *)(v14 + 3872));
        [v17 setCopyOriginal:self->_duplicatesOriginal];
        v18 = [v16 burstIdentifier];
        [v17 setCopySinglePhotoFromBurst:v18 != 0];

        [v17 setCopyStillPhotoFromLivePhoto:self->_duplicatesAsStill];
        long long v36 = *(_OWORD *)&self->_stillImageTime.value;
        int64_t epoch = self->_stillImageTime.epoch;
        [v17 setStillSourceTime:&v36];
        v19 = [MEMORY[0x1E4F38F28] creationRequestForAssetCopyFromAsset:v16 options:v17];
        v20 = [v19 placeholderForCreatedAsset];
        v21 = [v20 localIdentifier];
        [v13 addObject:v21];

        if (v19 && [v12 canPerformEditOperation:3])
        {
          v22 = v13;
          uint64_t v23 = [v32 indexOfObject:v16];
          uint64_t v24 = v23 + 1;
          if (v23 == 0x7FFFFFFFFFFFFFFELL)
          {
            v29 = [MEMORY[0x1E4F28B00] currentHandler];
            [v29 handleFailureInMethod:a2 object:self file:@"PXDuplicateAssetsAction.m" lineNumber:238 description:@"The asset being duplicated should be in the assetCollection"];
          }
          v25 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:v12];
          v42 = v20;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
          v27 = v26 = v12;
          v28 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v24];
          [v25 insertAssets:v27 atIndexes:v28];

          v12 = v26;
          id v13 = v22;
          unint64_t v14 = 0x1E4F38000;
        }

        ++v15;
      }
      while (v35 != v15);
      uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v35);
  }

  return v13;
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  v5 = [[PXPhotoKitAssetLocalAvailabilityHelper alloc] initWithAssets:self->_assetsToDuplicate treatLivePhotoAsStill:self->_duplicatesAsStill];
  id v6 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__PXDuplicateAssetsAction_performAction___block_invoke;
  v12[3] = &unk_1E5DD1B00;
  v12[4] = self;
  id v13 = v6;
  id v14 = v4;
  id v7 = v4;
  id v8 = v6;
  id v9 = [(PXPhotoKitAssetLocalAvailabilityHelper *)v5 ensureLocalAvailabilityOfAssetsWithCompletionHandler:v12];
  int64_t v10 = [(PXDuplicateAssetsAction *)self assetCount];
  id v11 = [(PXDuplicateAssetsAction *)self actionProgress];
  [v11 setTotalUnitCount:100 * v10];
  [v11 addChild:v9 withPendingUnitCount:75 * v10];
  [v11 addChild:v8 withPendingUnitCount:25 * v10];
}

void __41__PXDuplicateAssetsAction_performAction___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*((void *)a1[4] + 22)) {
    id v6 = (const void *)*((void *)a1[4] + 22);
  }
  else {
    id v6 = &__block_literal_global_259893;
  }
  id v7 = (unsigned int (**)(void *, void, id))_Block_copy(v6);
  if (v7[2](v7, a2, v5))
  {
    id v8 = [a1[4] photoLibrary];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__PXDuplicateAssetsAction_performAction___block_invoke_3;
    v12[3] = &unk_1E5DD36F8;
    v12[4] = a1[4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__PXDuplicateAssetsAction_performAction___block_invoke_3_208;
    v9[3] = &unk_1E5DD2B90;
    id v10 = a1[5];
    id v11 = a1[6];
    [v8 performChanges:v12 completionHandler:v9];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __41__PXDuplicateAssetsAction_performAction___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__259894;
  id v11 = __Block_byref_object_dispose__259895;
  uint64_t v12 = 0;
  v2 = [*(id *)(a1 + 32) selectedAssets];

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__PXDuplicateAssetsAction_performAction___block_invoke_205;
    v6[3] = &unk_1E5DCD570;
    v6[4] = v3;
    v6[5] = &v7;
    [v3 enumerateSelectedAssetIndexSetsUsingBlock:v6];
  }
  else
  {
    uint64_t v4 = [v3 processDuplicateActionWithAssets:v3[18] assetCollection:v3[19] assetsInAssetCollection:0];
    id v5 = (void *)v8[5];
    v8[5] = v4;
  }
  px_dispatch_on_main_queue();
}

void __41__PXDuplicateAssetsAction_performAction___block_invoke_3_208(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __41__PXDuplicateAssetsAction_performAction___block_invoke_205(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  id v12 = [v7 objectsAtIndexes:a4];
  uint64_t v9 = [*(id *)(a1 + 32) processDuplicateActionWithAssets:v12 assetCollection:v8 assetsInAssetCollection:v7];

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __41__PXDuplicateAssetsAction_performAction___block_invoke_2_206(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 128) = v2;
}

uint64_t __41__PXDuplicateAssetsAction_performAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2;
}

- (id)actionNameLocalizationKey
{
  return @"PXDuplicateActionName";
}

- (void)setDownloadCompletionHandler:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id downloadCompletionHandler = self->_downloadCompletionHandler;
  self->_id downloadCompletionHandler = v4;
}

- (void)setActionProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  if ([(PXAction *)self executionStarted])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDuplicateAssetsAction.m", 157, @"%s cannot be called after the receiver has started executing.", "-[PXDuplicateAssetsAction setActionProgress:]");
  }
  actionProgress = self->_actionProgress;
  self->_actionProgress = v5;
}

- (void)setStillImageTime:(id *)a3
{
  if ([(PXAction *)self executionStarted])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDuplicateAssetsAction.m", 152, @"%s cannot be called after the receiver has started executing.", "-[PXDuplicateAssetsAction setStillImageTime:]");
  }
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_stillImageTime.value = *(_OWORD *)&a3->var0;
  self->_stillImageTime.int64_t epoch = var3;
}

- (void)setDuplicatesAsStill:(BOOL)a3
{
  if ([(PXAction *)self executionStarted])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDuplicateAssetsAction.m", 147, @"%s cannot be called after the receiver has started executing.", "-[PXDuplicateAssetsAction setDuplicatesAsStill:]");
  }
  self->_duplicatesAsStill = a3;
}

- (void)setDuplicatesOriginal:(BOOL)a3
{
  if ([(PXAction *)self executionStarted])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDuplicateAssetsAction.m", 142, @"%s cannot be called after the receiver has started executing.", "-[PXDuplicateAssetsAction setDuplicatesOriginal:]");
  }
  self->_duplicatesOriginal = a3;
}

- (BOOL)canExtractStill
{
  return self->_canExtractStill;
}

- (int64_t)assetCount
{
  return self->_assetCount;
}

- (void)processWithAssets:(id)a3 assetCollection:(id)a4 canDuplicate:(BOOL *)a5 canExtractStill:(BOOL *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v10;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        *a5 = [(id)objc_opt_class() canPerformOnAsset:v16 inAssetCollection:v11];
        uint64_t v17 = [v16 playbackStyle];
        int v18 = [v16 playbackVariation];
        BOOL v19 = *a6;
        if (*a6)
        {
          int v20 = v18;
          char v21 = [v16 isPhotoIris];
          if (v17 == 5) {
            BOOL v19 = 0;
          }
          else {
            BOOL v19 = v21;
          }
          if (v20 == 3) {
            BOOL v19 = 0;
          }
        }
        *a6 = v19;
        [(NSMutableArray *)self->_assetsToDuplicate addObject:v16];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
}

- (void)_checkDuplicateCapabilities
{
  if (!self->_didCheckDuplicateCapabilities)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    uint64_t v3 = [(PXAssetsSelectionAction *)self selectedAssets];

    if (v3)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __54__PXDuplicateAssetsAction__checkDuplicateCapabilities__block_invoke;
      v6[3] = &unk_1E5DCD528;
      v6[4] = self;
      v6[5] = &v15;
      void v6[6] = &v7;
      v6[7] = &v11;
      [(PXAssetsSelectionAction *)self enumerateSelectedAssetIndexSetsUsingBlock:v6];
      int64_t v4 = v8[3];
    }
    else
    {
      [(PXDuplicateAssetsAction *)self processWithAssets:self->_assetsInput assetCollection:0 canDuplicate:v16 + 3 canExtractStill:v12 + 3];
      int64_t v4 = [(NSMutableArray *)self->_assetsInput count];
      v8[3] = v4;
    }
    self->_assetCount = v4;
    char v5 = *((unsigned char *)v12 + 24);
    if (v5) {
      char v5 = *((unsigned char *)v16 + 24) != 0;
    }
    self->_canExtractStill = v5;
    self->_didCheckDuplicateCapabilities = 1;
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
  }
}

void __54__PXDuplicateAssetsAction__checkDuplicateCapabilities__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  id v17 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  char v12 = *(unsigned char *)(v11 + 24);
  if (v12)
  {
    char v12 = [v17 assetCollectionSubtype] != 101;
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v11 + 24) = v12;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  char v14 = *(unsigned char *)(v13 + 24);
  if (v14)
  {
    char v14 = [v17 assetCollectionSubtype] != 1000000201;
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v13 + 24) = v14;
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 count] + v15;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || ([v9 objectsAtIndexes:v10],
        v16 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) processWithAssets:v16 assetCollection:v17 canDuplicate:*(void *)(*(void *)(a1 + 40) + 8) + 24 canExtractStill:*(void *)(*(void *)(a1 + 56) + 8) + 24], v16, !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)))
  {
    *a5 = 1;
  }
}

- (PXDuplicateAssetsAction)initWithAssets:(id)a3 assetCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 firstObject];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 photoLibrary];
    uint64_t v11 = [(PXPhotosAction *)self initWithPhotoLibrary:v10];

    if (v11)
    {
      uint64_t v12 = [v6 copy];
      assetsInput = v11->_assetsInput;
      v11->_assetsInput = (NSMutableArray *)v12;

      objc_storeStrong((id *)&v11->_collectionInput, a4);
    }
    self = v11;
    char v14 = self;
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (PXDuplicateAssetsAction)initWithSelectionSnapshot:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXDuplicateAssetsAction;
  uint64_t v3 = [(PXAssetsSelectionAction *)&v8 initWithSelectionSnapshot:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v5 = (void *)*((void *)v3 + 13);
    *((void *)v3 + 13) = v4;

    uint64_t v6 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v3 + 184) = *MEMORY[0x1E4F1F9F8];
    *((void *)v3 + 25) = *(void *)(v6 + 16);
  }
  return (PXDuplicateAssetsAction *)v3;
}

+ (BOOL)canPerformOnAllAssets:(id)a3
{
}

uint64_t __49__PXDuplicateAssetsAction_canPerformOnAllAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) canPerformOnAsset:a2 inAssetCollection:0] ^ 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4 = a3;
  if (([v4 isTrashed] & 1) != 0
    || ([v4 isRecoveredAsset] & 1) != 0
    || [v4 sourceType] == 2
    || [v4 sourceType] == 8)
  {
    goto LABEL_5;
  }
  if (!objc_msgSend(v4, "px_isSyndicatedAsset"))
  {
    LOBYTE(v5) = 1;
    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "px_isUnsavedSyndicatedAsset")) {
LABEL_5:
  }
    LOBYTE(v5) = 0;
  else {
    int v5 = objc_msgSend(v4, "px_isSyndicationPhotoLibraryAsset") ^ 1;
  }
LABEL_6:

  return v5;
}

@end