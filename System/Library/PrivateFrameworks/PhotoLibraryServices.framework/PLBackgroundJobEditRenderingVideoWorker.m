@interface PLBackgroundJobEditRenderingVideoWorker
- (id)_predicateToFetchDeferredAdjustmentNeededAssets;
@end

@implementation PLBackgroundJobEditRenderingVideoWorker

- (id)_predicateToFetchDeferredAdjustmentNeededAssets
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d && %K == %d", @"deferredProcessingNeeded", 2, @"kind", 1);
}

@end