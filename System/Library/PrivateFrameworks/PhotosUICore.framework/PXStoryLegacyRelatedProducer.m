@interface PXStoryLegacyRelatedProducer
+ (id)_relatedResultForConfiguration:(id)a3 targetUpNextCount:(unint64_t)a4;
- (OS_dispatch_queue)workQueue;
- (PXStoryLegacyRelatedProducer)initWithTargetUpNextCount:(unint64_t)a3;
- (id)requestConfigurationsRelatedToConfiguration:(id)a3 withOptions:(unint64_t)a4 musicCurationParameters:(id)a5 resultHandler:(id)a6;
- (unint64_t)targetUpNextCount;
@end

@implementation PXStoryLegacyRelatedProducer

- (void).cxx_destruct
{
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
  id v8 = a3;
  id v9 = a6;
  v10 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
  v11 = [(PXStoryLegacyRelatedProducer *)self workQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __126__PXStoryLegacyRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke;
  v18[3] = &unk_1E5DD2BB8;
  id v12 = v10;
  id v19 = v12;
  id v20 = v8;
  v21 = self;
  id v22 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v18);

  v15 = v22;
  id v16 = v12;

  return v16;
}

void __126__PXStoryLegacyRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v2 = +[PXStoryLegacyRelatedProducer _relatedResultForConfiguration:*(void *)(a1 + 40) targetUpNextCount:*(void *)(*(void *)(a1 + 48) + 8)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (PXStoryLegacyRelatedProducer)initWithTargetUpNextCount:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PXStoryLegacyRelatedProducer;
  v4 = [(PXStoryLegacyRelatedProducer *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_targetUpNextCount = a3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    id v8 = (const char *)[v7 UTF8String];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create(v8, v10);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;
  }
  return v5;
}

+ (id)_relatedResultForConfiguration:(id)a3 targetUpNextCount:(unint64_t)a4
{
  id v5 = a3;
  v6 = [v5 assetCollection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (PXStoryProducerResult *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = [v5 parentConfiguration];
    if (v8)
    {
      id v9 = (void *)v8;
      do
      {
        v10 = [v9 assetCollection];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(PXStoryProducerResult *)v7 addObject:v10];
        }
        uint64_t v11 = [v9 parentConfiguration];

        id v9 = (void *)v11;
      }
      while (v11);
    }
    id v39 = v5;
    id v12 = objc_alloc_init(MEMORY[0x1E4F39268]);
    v37 = v7;
    id v13 = (void *)[(PXStoryProducerResult *)v7 copy];
    [v12 setExcludedAssetCollections:v13];

    [v12 setFetchLimit:a4];
    v38 = v6;
    id v36 = v12;
    v35 = [MEMORY[0x1E4F39260] transientCollectionListWithCollectionsRelatedToObject:v6 relationType:63 options:v12];
    objc_super v14 = objc_msgSend(MEMORY[0x1E4F38EE8], "fetchCollectionsInCollectionList:options:");
    uint64_t v15 = [v14 count];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
    if (v15 >= 1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        BOOL v18 = +[PXStoryRelatedLayoutGenerator isExpectedKeyItemAtIndex:i];
        id v19 = [PXStoryConfiguration alloc];
        id v20 = [v14 objectAtIndexedSubscript:i];
        v21 = [(PXStoryConfiguration *)v19 initWithAssetCollection:v20];

        [(PXStoryConfiguration *)v21 setLaunchType:@"UpNext"];
        if (v18) {
          uint64_t v22 = 4;
        }
        else {
          uint64_t v22 = 8;
        }
        id v23 = [(PXStoryConfiguration *)v21 copyWithAdditionalOptions:v22];

        [v16 addObject:v23];
      }
    }
    v24 = [[PXStoryRelatedResult alloc] initWithStoryConfigurations:v16 debugInfo:@"Legacy Related Producer"];
    v25 = [[PXStoryProducerResult alloc] initWithObject:v24];

    v6 = v38;
    id v5 = v39;
    v27 = v36;
    v26 = v37;
  }
  else
  {
    v26 = objc_alloc_init(PXStoryProducerResult);
    v27 = PXStoryErrorCreateWithCodeDebugFormat(1, @"asset collection isn't a PHAssetCollection: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v6);
    v25 = [(PXStoryProducerResult *)v26 error:v27];
  }

  return v25;
}

@end