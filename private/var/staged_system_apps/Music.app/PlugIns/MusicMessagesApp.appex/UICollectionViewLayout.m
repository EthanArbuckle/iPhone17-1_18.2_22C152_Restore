@interface UICollectionViewLayout
- (BOOL)_disablesDoubleSidedAnimations;
@end

@implementation UICollectionViewLayout

- (BOOL)_disablesDoubleSidedAnimations
{
  return 1;
}

@end