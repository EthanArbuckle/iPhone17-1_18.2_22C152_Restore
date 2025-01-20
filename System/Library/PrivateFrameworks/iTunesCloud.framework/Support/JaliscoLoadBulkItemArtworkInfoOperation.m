@interface JaliscoLoadBulkItemArtworkInfoOperation
- (BOOL)useLongIDs;
- (unsigned)itemKind;
@end

@implementation JaliscoLoadBulkItemArtworkInfoOperation

- (unsigned)itemKind
{
  return 2;
}

- (BOOL)useLongIDs
{
  return 1;
}

@end