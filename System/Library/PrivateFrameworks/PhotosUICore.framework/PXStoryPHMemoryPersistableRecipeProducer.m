@interface PXStoryPHMemoryPersistableRecipeProducer
+ (id)_persistableRecipeForMemory:(id)a3 keyAsset:(id)a4 miroDataUsed:(id *)a5 error:(id *)a6;
- (OS_dispatch_queue)workQueue;
- (PHMemory)memory;
- (PXDisplayAsset)keyAsset;
- (PXStoryPHMemoryPersistableRecipeProducer)init;
- (PXStoryPHMemoryPersistableRecipeProducer)initWithMemory:(id)a3 keyAsset:(id)a4;
- (id)requestPersistableRecipeWithOptions:(unint64_t)a3 resultHandler:(id)a4;
@end

@implementation PXStoryPHMemoryPersistableRecipeProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (id)requestPersistableRecipeWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__246536;
  v20[4] = __Block_byref_object_dispose__246537;
  id v21 = [(PXStoryPHMemoryPersistableRecipeProducer *)self memory];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PXStoryPHMemoryPersistableRecipeProducer_requestPersistableRecipeWithOptions_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DCA938;
  v19 = v20;
  aBlock[4] = self;
  id v7 = v6;
  id v18 = v7;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (v4)
  {
    (*((void (**)(void *))v8 + 2))(v8);
    id v12 = 0;
  }
  else
  {
    v10 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    v11 = [(PXStoryPHMemoryPersistableRecipeProducer *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__PXStoryPHMemoryPersistableRecipeProducer_requestPersistableRecipeWithOptions_resultHandler___block_invoke_2;
    block[3] = &unk_1E5DD3280;
    id v12 = v10;
    id v15 = v12;
    id v16 = v9;
    dispatch_async(v11, block);
  }
  _Block_object_dispose(v20, 8);

  return v12;
}

void __94__PXStoryPHMemoryPersistableRecipeProducer_requestPersistableRecipeWithOptions_resultHandler___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectID];

  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F39150]);
    char v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectID];
    v25[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) photoLibrary];
    id v7 = [MEMORY[0x1E4F39160] fetchType];
    v8 = (void *)[v3 initWithOids:v5 photoLibrary:v6 fetchType:v7 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v13 = [*(id *)(a1 + 32) keyAsset];
  id v23 = 0;
  id v24 = 0;
  v14 = +[PXStoryPHMemoryPersistableRecipeProducer _persistableRecipeForMemory:v12 keyAsset:v13 miroDataUsed:&v24 error:&v23];
  id v15 = v24;
  id v16 = v23;

  v17 = [PXStoryPersistableRecipeResult alloc];
  if ([v15 containsAnyData]) {
    id v18 = v15;
  }
  else {
    id v18 = 0;
  }
  v19 = [(PXStoryPersistableRecipeResult *)v17 initWithPersistableRecipe:v14 miroInfo:v18];
  v20 = [[PXStoryProducerResult alloc] initWithObject:v19];
  id v21 = [(PXStoryProducerResult *)v20 flags:0];
  v22 = [v21 error:v16];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __94__PXStoryPHMemoryPersistableRecipeProducer_requestPersistableRecipeWithOptions_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (PXStoryPHMemoryPersistableRecipeProducer)initWithMemory:(id)a3 keyAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryPHMemoryPersistableRecipeProducer;
  uint64_t v9 = [(PXStoryPHMemoryPersistableRecipeProducer *)&v19 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v16 = dispatch_queue_create(v13, v15);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v10->_keyAsset, a4);
  }

  return v10;
}

- (PXStoryPHMemoryPersistableRecipeProducer)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPHMemoryPersistableRecipeProducer.m", 25, @"%s is not available as initializer", "-[PXStoryPHMemoryPersistableRecipeProducer init]");

  abort();
}

+ (id)_persistableRecipeForMemory:(id)a3 keyAsset:(id)a4 miroDataUsed:(id *)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 photosGraphProperties];
  id v12 = [v11 objectForKeyedSubscript:@"storyRecipeData"];

  if (v12)
  {
    v13 = (PXStoryMiroMemoryConverter *)objc_alloc_init(MEMORY[0x1E4F8CDE8]);
    id v23 = 0;
    v14 = [(PXStoryMiroMemoryConverter *)v13 unarchivedRecipeWithData:v12 error:&v23];
    id v15 = v23;
    if (!v14)
    {
      dispatch_queue_t v16 = PLStoryGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "failed to unarchive recipe for %@: %@", buf, 0x16u);
      }

      goto LABEL_13;
    }
    goto LABEL_9;
  }
  v13 = [[PXStoryMiroMemoryConverter alloc] initWithMemory:v9 keyAsset:v10];
  if (![(PXStoryMiroMemoryConverter *)v13 containsAnyData])
  {
    id v15 = 0;
    goto LABEL_13;
  }
  id v22 = 0;
  v14 = [(PXStoryMiroMemoryConverter *)v13 createNewRecipeFromMiroMetadataWithError:&v22];
  id v15 = v22;
  if (v14)
  {
    v13 = v13;
    *a5 = v13;
LABEL_9:
    v17 = v15;

    id v18 = [v9 photoLibrary];
    id v21 = v15;
    objc_super v19 = +[PFStoryRecipe_PXStoryExtension recipe:v14 withPHPhotoLibrary:v18 error:&v21];
    id v15 = v21;

    if (v19) {
      goto LABEL_14;
    }
    PLStoryGetLog();
    v13 = (PXStoryMiroMemoryConverter *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v15;
      _os_log_impl(&dword_1A9AE7000, &v13->super, OS_LOG_TYPE_ERROR, "failed to assign photo library to recipe: %@", buf, 0xCu);
    }
  }
LABEL_13:

  objc_super v19 = 0;
LABEL_14:
  if (a6) {
    *a6 = v15;
  }

  return v19;
}

@end