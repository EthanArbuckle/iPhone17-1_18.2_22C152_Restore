@interface PXStoryPHMemoryPersistableRecipeWriter
- (OS_dispatch_queue)workQueue;
- (PHMemory)memory;
- (PXStoryPHMemoryPersistableRecipeWriter)init;
- (PXStoryPHMemoryPersistableRecipeWriter)initWithMemory:(id)a3;
- (id)writePersistableRecipe:(id)a3 assetEdits:(id)a4 undoManager:(id)a5 resultHandler:(id)a6;
@end

@implementation PXStoryPHMemoryPersistableRecipeWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (id)writePersistableRecipe:(id)a3 assetEdits:(id)a4 undoManager:(id)a5 resultHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(PXStoryPHMemoryPersistableRecipeWriter *)self memory];
  if (v12)
  {
    [v12 overallDurationInfo];
    if ((void)v42)
    {
      if (v11) {
        [v11 overallDurationInfo];
      }
      else {
        memset(v41, 0, sizeof(v41));
      }
      [v12 overallDurationInfo];
      if (*(void *)&v41[0] != v36) {
        goto LABEL_11;
      }
      CMTime v54 = *(CMTime *)((char *)&v41[3] + 8);
      CMTime v49 = v40;
      CMTime time1 = *(CMTime *)((char *)v41 + 8);
      *(_OWORD *)&v53[16] = *(_OWORD *)((char *)&v41[2] + 8);
      *(_OWORD *)buf = *(_OWORD *)((char *)v41 + 8);
      *(_OWORD *)v53 = *(_OWORD *)((char *)&v41[1] + 8);
      *(_OWORD *)&v48[16] = v39;
      long long v47 = v37;
      *(_OWORD *)v48 = v38;
      *(_OWORD *)&time2.value = v37;
      time2.epoch = v38;
      if (CMTimeCompare(&time1, &time2)
        || (time1 = *(CMTime *)&v53[8], CMTime time2 = *(CMTime *)&v48[8], CMTimeCompare(&time1, &time2))
        || (time1 = v54, CMTime time2 = v49, CMTimeCompare(&time1, &time2)))
      {
LABEL_11:
        PXAssertGetLog();
      }
    }
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v42 = 0u;
  }
  v16 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:3];
  v17 = [(PXStoryPHMemoryPersistableRecipeWriter *)self workQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke;
  v27[3] = &unk_1E5DD2BE0;
  id v18 = v16;
  id v28 = v18;
  id v29 = v11;
  id v30 = v15;
  id v31 = v12;
  id v34 = v14;
  SEL v35 = a2;
  v32 = self;
  id v33 = v13;
  id v19 = v13;
  id v20 = v14;
  id v21 = v12;
  id v22 = v15;
  id v23 = v11;
  dispatch_async(v17, v27);

  v24 = v33;
  id v25 = v18;

  return v25;
}

void __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (*(void *)(a1 + 40))
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F8CDB8]);
      v3 = [v2 archivedDataWithRecipe:*(void *)(a1 + 40)];
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    if ([*(id *)(a1 + 32) isCancelled])
    {
      id v4 = 0;
    }
    else
    {
      v5 = [*(id *)(a1 + 40) currentStyle];
      v6 = *(void **)(a1 + 48);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_2;
      v27[3] = &unk_1E5DD2B68;
      id v28 = v3;
      id v7 = v5;
      id v29 = v7;
      id v30 = *(id *)(a1 + 56);
      id v26 = 0;
      v8 = objc_msgSend(v6, "px_photosGraphDataByMutatingPropertiesUsingBlock:error:", v27, &v26);
      id v4 = v26;
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
        if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
        {
          if (v7)
          {
            uint64_t v9 = [v7 customColorGradeKind];
            v10 = +[PXStoryColorGradingRepositoryFactory sharedRepository];
            if (!v9)
            {
              id v11 = [v7 originalColorGradeCategory];
              uint64_t v9 = [v10 colorGradeKindForColorGradeCategory:v11];
            }
          }
          else
          {
            uint64_t v9 = 0;
          }
          uint64_t v25 = v9;
          id v12 = [*(id *)(a1 + 56) keyAsset];
          if (v12)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v19 = [MEMORY[0x1E4F28B00] currentHandler];
              uint64_t v23 = *(void *)(a1 + 64);
              uint64_t v24 = *(void *)(a1 + 88);
              id v20 = (objc_class *)objc_opt_class();
              id v21 = NSStringFromClass(v20);
              id v22 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
              [v19 handleFailureInMethod:v24, v23, @"PXStoryPHMemoryPersistableRecipeWriter.m", 89, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"assetEdits.keyAsset", v21, v22 object file lineNumber description];
            }
          }
          id v13 = [PXEditMemoryAction alloc];
          uint64_t v14 = *(void *)(a1 + 48);
          v15 = [*(id *)(a1 + 56) userCuratedAssets];
          v16 = [*(id *)(a1 + 56) customUserAssetsEdit];
          v17 = [(PXEditMemoryAction *)v13 initWithMemory:v14 photosGraphData:v8 storyColorGradeKind:v25 keyAsset:v12 userCuratedAssets:v15 customUserAssetsEdit:v16];

          *(id *)(a1 + 72);
          *(id *)(a1 + 32);
          *(id *)(a1 + 80);
          id v18 = v17;
          px_dispatch_on_main_queue();
        }
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      }
    }
  }
}

void __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  [v9 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"storyRecipeData"];
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "customColorGradeKind"));
    [v9 setObject:v4 forKeyedSubscript:@"storyColorGradeKind"];

    v5 = [*(id *)(a1 + 40) originalColorGradeCategory];
    [v9 setObject:v5 forKeyedSubscript:@"storyColorGradeCategory"];
  }
  v6 = [*(id *)(a1 + 48) customUserAssetsEdit];
  id v7 = [v6 assets];
  uint64_t v8 = [v7 count];

  if (v8 >= 1) {
    [v9 setObject:0 forKeyedSubscript:@"chapterTitles"];
  }
}

void __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_4;
  v4[3] = &unk_1E5DD2B90;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 executeWithUndoManager:v3 completionHandler:v4];
}

void __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PXStoryPHMemoryPersistableRecipeWriter)initWithMemory:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryPHMemoryPersistableRecipeWriter;
  id v6 = [(PXStoryPHMemoryPersistableRecipeWriter *)&v16 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_memory, a3);
    uint64_t v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    v10 = (const char *)[v9 UTF8String];
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create(v10, v12);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v13;
  }
  return v7;
}

- (PXStoryPHMemoryPersistableRecipeWriter)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPHMemoryPersistableRecipeWriter.m", 34, @"%s is not available as initializer", "-[PXStoryPHMemoryPersistableRecipeWriter init]");

  abort();
}

@end