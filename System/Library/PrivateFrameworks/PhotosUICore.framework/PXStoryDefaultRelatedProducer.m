@interface PXStoryDefaultRelatedProducer
+ (id)_relatedResultFromUpNextResult:(id)a3 error:(id)a4;
+ (id)_requestForConfiguration:(id)a3 targetUpNextMemoryCount:(unint64_t)a4 musicCurationParameters:(id)a5 error:(id *)a6;
- (NSMutableArray)activeRequests;
- (OS_dispatch_queue)workQueue;
- (PXStoryDefaultRelatedProducer)initWithTargetUpNextCount:(unint64_t)a3;
- (id)requestConfigurationsRelatedToConfiguration:(id)a3 withOptions:(unint64_t)a4 musicCurationParameters:(id)a5 resultHandler:(id)a6;
- (unint64_t)targetUpNextCount;
@end

@implementation PXStoryDefaultRelatedProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSMutableArray)activeRequests
{
  return self->_activeRequests;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)targetUpNextCount
{
  return self->_targetUpNextCount;
}

- (id)requestConfigurationsRelatedToConfiguration:(id)a3 withOptions:(unint64_t)a4 musicCurationParameters:(id)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
  v14 = [(PXStoryDefaultRelatedProducer *)self activeRequests];
  v15 = [(PXStoryDefaultRelatedProducer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__PXStoryDefaultRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke;
  block[3] = &unk_1E5DCF088;
  id v16 = v13;
  id v25 = v16;
  id v26 = v10;
  v27 = self;
  id v28 = v11;
  id v30 = v12;
  unint64_t v31 = a4;
  id v29 = v14;
  id v17 = v12;
  id v18 = v14;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v15, block);

  v21 = v30;
  id v22 = v16;

  return v22;
}

void __127__PXStoryDefaultRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void *)(a1 + 56);
    id v16 = 0;
    v5 = +[PXStoryDefaultRelatedProducer _requestForConfiguration:v2 targetUpNextMemoryCount:v3 musicCurationParameters:v4 error:&v16];
    id v6 = v16;
    if (v5)
    {
      if ((*(unsigned char *)(a1 + 80) & 8) != 0) {
        [v5 setWantsVerboseDebugInfo:1];
      }
      [*(id *)(a1 + 64) addObject:v5];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __127__PXStoryDefaultRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke_2;
      v11[3] = &unk_1E5DBACC8;
      uint64_t v15 = v7;
      v14 = (PXStoryProducerResult *)*(id *)(a1 + 72);
      id v12 = *(id *)(a1 + 64);
      id v13 = v5;
      [v13 startGenerationWithCompletionHandler:v11];

      v8 = v14;
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 72);
      v8 = objc_alloc_init(PXStoryProducerResult);
      id v10 = [(PXStoryProducerResult *)v8 error:v6];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
  }
}

void __127__PXStoryDefaultRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[PXStoryDefaultRelatedProducer _relatedResultFromUpNextResult:a2 error:a3];
  v5 = PLStoryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6 - *(double *)(a1 + 56);
    int v8 = 134218242;
    double v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "Produced related in %0.3f seconds: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
}

- (PXStoryDefaultRelatedProducer)initWithTargetUpNextCount:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PXStoryDefaultRelatedProducer;
  uint64_t v4 = [(PXStoryDefaultRelatedProducer *)&v16 init];
  v5 = v4;
  if (v4)
  {
    v4->_targetUpNextCount = a3;
    double v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    int v8 = (const char *)[v7 UTF8String];
    double v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create(v8, v10);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;

    id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activeRequests = v5->_activeRequests;
    v5->_activeRequests = v13;
  }
  return v5;
}

+ (id)_relatedResultFromUpNextResult:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    id v23 = v6;
    int v8 = [v5 memories];
    uint64_t v9 = [(PXStoryProducerResult *)v8 count];
    __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
    if (v9 >= 1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        BOOL v12 = +[PXStoryRelatedLayoutGenerator isExpectedKeyItemAtIndex:i];
        id v13 = [PXStoryConfiguration alloc];
        v14 = [(PXStoryProducerResult *)v8 objectAtIndexedSubscript:i];
        uint64_t v15 = [(PXStoryConfiguration *)v13 initWithAssetCollection:v14];

        [(PXStoryConfiguration *)v15 setLaunchType:@"UpNext"];
        if (v12) {
          uint64_t v16 = 4;
        }
        else {
          uint64_t v16 = 8;
        }
        id v17 = [(PXStoryConfiguration *)v15 copyWithAdditionalOptions:v16];

        [v10 addObject:v17];
      }
    }
    id v18 = [PXStoryRelatedResult alloc];
    id v19 = [v5 debugInfo];
    id v20 = [(PXStoryRelatedResult *)v18 initWithStoryConfigurations:v10 debugInfo:v19];

    v21 = [[PXStoryProducerResult alloc] initWithObject:v20];
    id v7 = v23;
  }
  else
  {
    int v8 = objc_alloc_init(PXStoryProducerResult);
    v21 = [(PXStoryProducerResult *)v8 error:v7];
  }

  return v21;
}

+ (id)_requestForConfiguration:(id)a3 targetUpNextMemoryCount:(unint64_t)a4 musicCurationParameters:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  dispatch_queue_t v11 = [v9 assetCollection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v22 = a4;
    id v12 = v11;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v14 = [v9 parentConfiguration];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      do
      {
        uint64_t v16 = [v15 assetCollection];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = [v16 localIdentifier];
          [v13 addObject:v17];
        }
        uint64_t v18 = [v15 parentConfiguration];

        uint64_t v15 = (void *)v18;
      }
      while (v18);
    }
    id v19 = [[PXUpNextMemoriesGenerationRequest alloc] initWithRootMemory:v12 avoidMemoriesWithLocalIdentifiers:v13 targetUpNextMemoryCount:v22 musicCurationParameters:v10];

    if (!a6) {
      goto LABEL_13;
    }
LABEL_12:
    *a6 = 0;
    goto LABEL_13;
  }
  id v20 = PLStoryGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_INFO, "cannot produce related because asset collection isn't a PHMemory: %@", buf, 0xCu);
  }

  id v19 = 0;
  if (a6) {
    goto LABEL_12;
  }
LABEL_13:

  return v19;
}

@end