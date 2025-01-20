@interface PLBackgroundJobDeferredRenderDerivativesLowPriorityWorker
+ (id)_criteriaToUse;
- (id)_predicateToFetchDeferredAssets;
- (id)deferredProcessingStatesHandled;
- (id)taskIdentifier;
@end

@implementation PLBackgroundJobDeferredRenderDerivativesLowPriorityWorker

+ (id)_criteriaToUse
{
  return +[PLBackgroundJobCriteria criteriaForDiscretionaryResourceWorker];
}

- (id)taskIdentifier
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = taskIdentifier_requestNumber++;
  v6 = [v2 stringWithFormat:@"%@-%lu", v4, v5];

  return v6;
}

- (id)_predicateToFetchDeferredAssets
{
  v2 = (void *)MEMORY[0x1E4F28F60];
  v3 = [(PLBackgroundJobDeferredRenderDerivativesLowPriorityWorker *)self deferredProcessingStatesHandled];
  v4 = [v2 predicateWithFormat:@"%K in %@", @"deferredProcessingNeeded", v3];

  return v4;
}

- (id)deferredProcessingStatesHandled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEBF1628];
}

@end