@interface TRIAssetDiffQueryGuardedData
@end

@implementation TRIAssetDiffQueryGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->retryAfter, 0);
  objc_storeStrong((id *)&self->recordIdsForTargetAssetIds, 0);
}

@end