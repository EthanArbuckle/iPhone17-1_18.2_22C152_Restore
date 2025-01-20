@interface PHCollection(PXSelectionAssetContainer)
- (uint64_t)px_canPerformFavoriteAction;
- (uint64_t)px_isFavorite;
@end

@implementation PHCollection(PXSelectionAssetContainer)

- (uint64_t)px_canPerformFavoriteAction
{
  return 0;
}

- (uint64_t)px_isFavorite
{
  return 0;
}

@end