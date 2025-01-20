@interface PHPerson(PXSelectionAssetContainer)
- (BOOL)px_isFavorite;
- (uint64_t)px_canPerformFavoriteAction;
- (uint64_t)px_isEmpty;
@end

@implementation PHPerson(PXSelectionAssetContainer)

- (uint64_t)px_canPerformFavoriteAction
{
  return 1;
}

- (BOOL)px_isFavorite
{
  return [a1 type] == 1;
}

- (uint64_t)px_isEmpty
{
  return 0;
}

@end