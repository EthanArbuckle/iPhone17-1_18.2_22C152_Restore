@interface UITableViewCellPromiseRegion
@end

@implementation UITableViewCellPromiseRegion

_UIFocusRegionContainerProxy *__65___UITableViewCellPromiseRegion__searchForFocusRegionsInContext___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _fulfillPromisedFocusRegion];
  v2 = [[_UIFocusRegionContainerProxy alloc] initWithOwningEnvironment:v1 itemContainer:v1];

  return v2;
}

@end