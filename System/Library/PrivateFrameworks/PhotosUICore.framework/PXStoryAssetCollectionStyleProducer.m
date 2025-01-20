@interface PXStoryAssetCollectionStyleProducer
- (OS_dispatch_queue)workQueue;
- (PXDisplayAssetCollection)assetCollection;
- (PXStoryAssetCollectionStyleProducer)initWithAssetCollection:(id)a3;
- (id)requestStylesWithOptions:(unint64_t)a3 resultHandler:(id)a4;
@end

@implementation PXStoryAssetCollectionStyleProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (id)requestStylesWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PXStoryAssetCollectionStyleProducer_requestStylesWithOptions_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DD3280;
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
    v11 = [(PXStoryAssetCollectionStyleProducer *)self workQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__PXStoryAssetCollectionStyleProducer_requestStylesWithOptions_resultHandler___block_invoke_52;
    v14[3] = &unk_1E5DD3280;
    id v12 = v10;
    id v15 = v12;
    id v16 = v9;
    dispatch_async(v11, v14);
  }
  return v12;
}

void __78__PXStoryAssetCollectionStyleProducer_requestStylesWithOptions_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) assetCollection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    uint64_t v4 = [v3 storyColorGradeKind];
    if (!v4)
    {
      v5 = PLStoryGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "Memory lacking storyColorGradeKind, setting to None: %@", buf, 0xCu);
      }

      uint64_t v4 = 1;
    }
    id v6 = [v3 storyTitleCategory];
    if (v6 == (void *)*MEMORY[0x1E4F8D2E0])
    {
      id v7 = PLStoryGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "Memory lacking storyTitleCategory: %@", buf, 0xCu);
      }
    }
    v8 = [[PXStoryStyleConfiguration alloc] initWithOriginalColorGradeCategory:0 customColorGradeKind:v4 songResource:0 autoEditDecisionList:0 isCustomized:0];
  }
  else
  {
    v8 = objc_alloc_init(PXStoryStyleConfiguration);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [PXStoryProducerResult alloc];
  v13 = v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  id v12 = [(PXStoryProducerResult *)v10 initWithObject:v11];
  (*(void (**)(uint64_t, PXStoryProducerResult *))(v9 + 16))(v9, v12);
}

uint64_t __78__PXStoryAssetCollectionStyleProducer_requestStylesWithOptions_resultHandler___block_invoke_52(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (PXStoryAssetCollectionStyleProducer)initWithAssetCollection:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryAssetCollectionStyleProducer;
  id v6 = [(PXStoryAssetCollectionStyleProducer *)&v16 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetCollection, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create(v10, v12);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v13;
  }
  return v7;
}

@end