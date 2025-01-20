@interface UICollectionViewCellPromiseRegion
@end

@implementation UICollectionViewCellPromiseRegion

_UIFocusRegionContainerProxy *__57___UICollectionViewCellPromiseRegion_createPromiseRegion__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _fulfillPromisedFocusRegion];
  v2 = [[_UIFocusRegionContainerProxy alloc] initWithOwningEnvironment:v1 itemContainer:v1];

  return v2;
}

@end