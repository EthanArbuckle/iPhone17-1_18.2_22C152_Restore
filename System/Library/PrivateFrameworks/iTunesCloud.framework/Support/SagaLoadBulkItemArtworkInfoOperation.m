@interface SagaLoadBulkItemArtworkInfoOperation
- (BOOL)useLongIDs;
- (unsigned)itemKind;
@end

@implementation SagaLoadBulkItemArtworkInfoOperation

- (unsigned)itemKind
{
  return 2;
}

- (BOOL)useLongIDs
{
  return 0;
}

@end