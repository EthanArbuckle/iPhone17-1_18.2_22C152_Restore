@interface BrandBarNavigationAnimation
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
@end

@implementation BrandBarNavigationAnimation

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (double)topOffset
{
  return *(double *)&self->topOffset[7];
}

- (BOOL)shouldCloseGapOnScroll
{
  return 1;
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  return 90.0;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

@end