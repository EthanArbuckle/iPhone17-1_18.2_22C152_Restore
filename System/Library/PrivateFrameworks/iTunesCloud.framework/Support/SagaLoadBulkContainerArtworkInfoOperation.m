@interface SagaLoadBulkContainerArtworkInfoOperation
- (BOOL)useLongIDs;
- (unsigned)itemKind;
@end

@implementation SagaLoadBulkContainerArtworkInfoOperation

- (unsigned)itemKind
{
  return 1;
}

- (BOOL)useLongIDs
{
  return 0;
}

@end