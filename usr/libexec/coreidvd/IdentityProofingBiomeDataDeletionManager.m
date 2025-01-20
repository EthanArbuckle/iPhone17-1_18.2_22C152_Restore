@interface IdentityProofingBiomeDataDeletionManager
- (void)pruneUserProofingStream;
@end

@implementation IdentityProofingBiomeDataDeletionManager

- (void)pruneUserProofingStream
{
  id v2 = [objc_alloc((Class)BMRestrictedStream) initWithIdentifier:@"UserProofingMetadata"];
  [v2 pruneWithPredicateBlock:&stru_1006F0CA0];
}

@end