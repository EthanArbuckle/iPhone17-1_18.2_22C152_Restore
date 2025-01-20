@interface PXStoryPersistableRecipeAssetsProducer
- (OS_dispatch_queue)workQueue;
- (PFStoryRecipe)persistableRecipe;
- (PXStoryPersistableRecipeAssetsProducer)init;
- (PXStoryPersistableRecipeAssetsProducer)initWithPersistableRecipe:(id)a3;
- (id)requestAssetsWithOptions:(unint64_t)a3 storyQueue:(id)a4 resultHandler:(id)a5;
@end

@implementation PXStoryPersistableRecipeAssetsProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PFStoryRecipe)persistableRecipe
{
  return self->_persistableRecipe;
}

- (id)requestAssetsWithOptions:(unint64_t)a3 storyQueue:(id)a4 resultHandler:(id)a5
{
  char v5 = a3;
  id v8 = a5;
  v9 = [(PXStoryPersistableRecipeAssetsProducer *)self persistableRecipe];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PXStoryPersistableRecipeAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DC2380;
  id v10 = v9;
  SEL v25 = a2;
  id v22 = v10;
  v23 = self;
  id v11 = v8;
  id v24 = v11;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (v5)
  {
    (*((void (**)(void *))v12 + 2))(v12);
    id v16 = 0;
  }
  else
  {
    v14 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    v15 = [(PXStoryPersistableRecipeAssetsProducer *)self workQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __92__PXStoryPersistableRecipeAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke_11;
    v18[3] = &unk_1E5DD3280;
    id v16 = v14;
    id v19 = v16;
    id v20 = v13;
    dispatch_async(v15, v18);
  }
  return v16;
}

void __92__PXStoryPersistableRecipeAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v12 = 0;
  v3 = +[PFStoryRecipe_PXStoryExtension displayAssetsInRecipe:v2 withCategory:1 error:&v12];
  id v4 = v12;
  if (!v3) {
    PXAssertGetLog();
  }
  char v5 = [PXStaticDisplayAssetsDataSource alloc];
  v13 = v3;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v7 = [(PXStaticDisplayAssetsDataSource *)v5 initWithAssetCollectionBySection:0 assetsBySection:0 curatedAssetsBySection:v6 keyAssetsBySection:0 sectionContent:1];

  id v8 = [[PXPassthroughAssetsDataSourceManager alloc] initWithDataSource:v7];
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [[PXStoryProducerResult alloc] initWithObject:v8];
  id v11 = [(PXStoryProducerResult *)v10 error:v4];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);
}

uint64_t __92__PXStoryPersistableRecipeAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke_11(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (PXStoryPersistableRecipeAssetsProducer)initWithPersistableRecipe:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryPersistableRecipeAssetsProducer;
  v6 = [(PXStoryPersistableRecipeAssetsProducer *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistableRecipe, a3);
    id v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    id v10 = (const char *)[v9 UTF8String];
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create(v10, v12);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v13;
  }
  return v7;
}

- (PXStoryPersistableRecipeAssetsProducer)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPersistableRecipeAssetsProducer.m", 26, @"%s is not available as initializer", "-[PXStoryPersistableRecipeAssetsProducer init]");

  abort();
}

@end