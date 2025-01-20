@interface PHSocialGroup(PXSelectionAssetContainer)
- (uint64_t)px_canPerformFavoriteAction;
- (uint64_t)px_isEmpty;
- (uint64_t)px_isFavorite;
@end

@implementation PHSocialGroup(PXSelectionAssetContainer)

- (uint64_t)px_canPerformFavoriteAction
{
  return 0;
}

- (uint64_t)px_isFavorite
{
  return 0;
}

- (uint64_t)px_isEmpty
{
  return 0;
}

@end