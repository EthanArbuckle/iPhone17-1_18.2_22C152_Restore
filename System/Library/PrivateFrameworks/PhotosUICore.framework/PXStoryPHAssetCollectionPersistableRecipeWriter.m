@interface PXStoryPHAssetCollectionPersistableRecipeWriter
- (OS_dispatch_queue)workQueue;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)referencePersons;
- (PXStoryPHAssetCollectionPersistableRecipeWriter)init;
- (PXStoryPHAssetCollectionPersistableRecipeWriter)initWithAssetCollection:(id)a3 referencePersons:(id)a4;
- (id)writePersistableRecipe:(id)a3 assetEdits:(id)a4 undoManager:(id)a5 resultHandler:(id)a6;
@end

@implementation PXStoryPHAssetCollectionPersistableRecipeWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencePersons, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (PHFetchResult)referencePersons
{
  return self->_referencePersons;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (id)writePersistableRecipe:(id)a3 assetEdits:(id)a4 undoManager:(id)a5 resultHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:2];
  v16 = [(PXStoryPHAssetCollectionPersistableRecipeWriter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke;
  block[3] = &unk_1E5DCF088;
  id v17 = v15;
  id v26 = v17;
  v27 = self;
  id v31 = v14;
  SEL v32 = a2;
  id v28 = v11;
  id v29 = v12;
  id v30 = v13;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  dispatch_async(v16, block);

  v22 = v31;
  id v23 = v17;

  return v23;
}

void __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke(uint64_t a1)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__59270;
    v44 = __Block_byref_object_dispose__59271;
    id v45 = 0;
    v2 = [*(id *)(a1 + 40) assetCollection];
    v3 = [v2 photoLibrary];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_197;
    v36[3] = &unk_1E5DCCA20;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 40);
    id v37 = v4;
    uint64_t v38 = v5;
    v39 = &v40;
    id v35 = 0;
    int v6 = [v3 performChangesAndWait:v36 error:&v35];
    id v7 = v35;
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    if (v6 && v41[5])
    {
      v8 = (void *)MEMORY[0x1E4F39160];
      v50[0] = v41[5];
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
      v10 = [v3 librarySpecificFetchOptions];
      id v11 = [v8 fetchAssetCollectionsWithLocalIdentifiers:v9 options:v10];

      if ([v11 count] == 1)
      {
        id v18 = [v11 firstObject];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v29 = [MEMORY[0x1E4F28B00] currentHandler];
          [v29 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 40), @"PXStoryPHAssetCollectionPersistableRecipeWriter.m", 64, @"Invalid parameter not satisfying: %@", @"[createdMemory isKindOfClass:PHMemory.class]" object file lineNumber description];
        }
        id v19 = [[PXStoryPHMemoryPersistableRecipeWriter alloc] initWithMemory:v18];
        uint64_t v20 = *(void *)(a1 + 48);
        uint64_t v21 = *(void *)(a1 + 56);
        uint64_t v22 = *(void *)(a1 + 64);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_2;
        v30[3] = &unk_1E5DB4890;
        v34 = &v40;
        id v31 = *(id *)(a1 + 32);
        id v33 = *(id *)(a1 + 72);
        id v23 = v18;
        id v32 = v23;
        id v24 = [(PXStoryPHMemoryPersistableRecipeWriter *)v19 writePersistableRecipe:v20 assetEdits:v21 undoManager:v22 resultHandler:v30];

        uint64_t v25 = (uint64_t)v7;
      }
      else
      {
        uint64_t v25 = PXStoryErrorCreateWithCodeDebugFormat(14, @"Should be able to fetch the newly created memory with identifier:%@", v12, v13, v14, v15, v16, v17, v41[5]);

        id v28 = PLMemoriesGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v47 = v25;
          _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_ERROR, "Failed to fetch newly created memory:%@", buf, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      }

      id v7 = (id)v25;
    }
    else
    {
      id v26 = PLMemoriesGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = v41[5];
        *(_DWORD *)buf = 138412546;
        uint64_t v47 = (uint64_t)v7;
        __int16 v48 = 2112;
        uint64_t v49 = v27;
        _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "Failed to create memory with error:%@ localIdentifier:%@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }

    _Block_object_dispose(&v40, 8);
  }
}

void __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_197(uint64_t a1)
{
  uint64_t v2 = +[PXStoryPHAssetCollectionAssetsProducer shouldEnableCurationForAssetCollection:*(void *)(a1 + 32)] ^ 1;
  v3 = (void *)MEMORY[0x1E4F39170];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) referencePersons];
  objc_msgSend(v3, "px_creationRequestForAssetCollection:displayTitleInfo:people:ignoreCuration:", v4, 0, v5, v2);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v10 setUserCreated:1];
  int v6 = [v10 placeholderForCreatedMemory];
  uint64_t v7 = [v6 localIdentifier];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_2(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((a2 & 1) == 0)
  {
    uint64_t v7 = PLMemoriesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed to write recipe to newly created memory with identifier:%@ error:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (PXStoryPHAssetCollectionPersistableRecipeWriter)initWithAssetCollection:(id)a3 referencePersons:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_assetCollection, a3);
    objc_storeStrong((id *)&self->_referencePersons, a4);
    int v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v10 = objc_claimAutoreleasedReturnValue();
    __int16 v11 = (const char *)[v10 UTF8String];
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    uint64_t v14 = (OS_dispatch_queue *)dispatch_queue_create(v11, v13);
    workQueue = self->_workQueue;
    self->_workQueue = v14;
  }
  return self;
}

- (PXStoryPHAssetCollectionPersistableRecipeWriter)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPHAssetCollectionPersistableRecipeWriter.m", 28, @"%s is not available as initializer", "-[PXStoryPHAssetCollectionPersistableRecipeWriter init]");

  abort();
}

@end