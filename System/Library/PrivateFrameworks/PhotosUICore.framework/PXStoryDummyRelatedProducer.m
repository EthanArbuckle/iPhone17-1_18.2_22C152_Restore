@interface PXStoryDummyRelatedProducer
+ (id)_relatedResultForConfiguration:(id)a3 targetUpNextCount:(unint64_t)a4;
- (OS_dispatch_queue)workQueue;
- (PXStoryDummyRelatedProducer)initWithTargetUpNextCount:(unint64_t)a3;
- (id)requestConfigurationsRelatedToConfiguration:(id)a3 withOptions:(unint64_t)a4 musicCurationParameters:(id)a5 resultHandler:(id)a6;
- (unint64_t)targetUpNextCount;
@end

@implementation PXStoryDummyRelatedProducer

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
  v11 = [(PXStoryDummyRelatedProducer *)self workQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __125__PXStoryDummyRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke;
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

void __125__PXStoryDummyRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v2 = +[PXStoryDummyRelatedProducer _relatedResultForConfiguration:*(void *)(a1 + 40) targetUpNextCount:*(void *)(*(void *)(a1 + 48) + 8)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (PXStoryDummyRelatedProducer)initWithTargetUpNextCount:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PXStoryDummyRelatedProducer;
  v4 = [(PXStoryDummyRelatedProducer *)&v14 init];
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
  v22[1] = *MEMORY[0x1E4F143B8];
  v21 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary", a3);
  v5 = [v21 librarySpecificFetchOptions];
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v22[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v5 setSortDescriptors:v7];

  [v5 setFetchLimit:a4];
  id v8 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v5];
  uint64_t v9 = [v8 count];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      BOOL v12 = +[PXStoryRelatedLayoutGenerator isExpectedKeyItemAtIndex:i];
      id v13 = [PXStoryConfiguration alloc];
      objc_super v14 = [v8 objectAtIndexedSubscript:i];
      v15 = [(PXStoryConfiguration *)v13 initWithAssetCollection:v14];

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
  v18 = [[PXStoryRelatedResult alloc] initWithStoryConfigurations:v10 debugInfo:@"Dummy Producer"];
  id v19 = [[PXStoryProducerResult alloc] initWithObject:v18];

  return v19;
}

@end