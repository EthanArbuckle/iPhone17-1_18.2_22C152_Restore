@interface UIView(PLScrollViewDelegateAdditions)
- (uint64_t)pl_isScrollViewDelegateMethod:()PLScrollViewDelegateAdditions;
@end

@implementation UIView(PLScrollViewDelegateAdditions)

- (uint64_t)pl_isScrollViewDelegateMethod:()PLScrollViewDelegateAdditions
{
  if (pl_isScrollViewDelegateMethod__onceToken != -1) {
    dispatch_once(&pl_isScrollViewDelegateMethod__onceToken, &__block_literal_global_2);
  }
  v4 = (void *)pl_isScrollViewDelegateMethod____scrollViewDelegateSelectors;
  v5 = NSStringFromSelector(aSelector);
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

@end