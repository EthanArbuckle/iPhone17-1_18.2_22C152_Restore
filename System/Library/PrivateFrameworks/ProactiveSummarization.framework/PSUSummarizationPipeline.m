@interface PSUSummarizationPipeline
+ (id)sharedPipelineWithContactStore:(id)a3 incomingBundleId:(id)a4;
- (PSUSummarizationPipeline)initWithContactStore:(id)a3;
- (void)handleDeletionOfItemsWithIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)processSearchableItem:(id)a3;
@end

@implementation PSUSummarizationPipeline

+ (id)sharedPipelineWithContactStore:(id)a3 incomingBundleId:(id)a4
{
  id v5 = a3;
  if (+[_PSUAvailabilityManager areGenerativeModelsAvailableFor:a4])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__PSUSummarizationPipeline_sharedPipelineWithContactStore_incomingBundleId___block_invoke;
    block[3] = &unk_26547FAB8;
    id v9 = v5;
    if (sharedPipelineWithContactStore_incomingBundleId___pasOnceToken2 != -1) {
      dispatch_once(&sharedPipelineWithContactStore_incomingBundleId___pasOnceToken2, block);
    }
    id v6 = (id)sharedPipelineWithContactStore_incomingBundleId___pasExprOnceResult;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)handleDeletionOfItemsWithIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
}

- (void)processSearchableItem:(id)a3
{
}

- (PSUSummarizationPipeline)initWithContactStore:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUSummarizationPipeline;
  id v5 = [(PSUSummarizationPipeline *)&v9 init];
  if (v5)
  {
    id v6 = [[_PSUSummarizationPipeline alloc] initWithContactStore:v4];
    pipeline = v5->_pipeline;
    v5->_pipeline = v6;
  }
  return v5;
}

void __76__PSUSummarizationPipeline_sharedPipelineWithContactStore_incomingBundleId___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x26114B190]();
  v3 = [[PSUSummarizationPipeline alloc] initWithContactStore:*(void *)(a1 + 32)];
  id v4 = (void *)sharedPipelineWithContactStore_incomingBundleId___pasExprOnceResult;
  sharedPipelineWithContactStore_incomingBundleId___pasExprOnceResult = (uint64_t)v3;
}

@end