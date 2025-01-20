@interface UICollectionReusableView
- (BOOL)_disableRasterizeInAnimations;
@end

@implementation UICollectionReusableView

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

@end