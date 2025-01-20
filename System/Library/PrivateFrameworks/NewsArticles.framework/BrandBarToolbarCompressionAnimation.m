@interface BrandBarToolbarCompressionAnimation
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
- (void)updateWithPercentage:(double)a3;
@end

@implementation BrandBarToolbarCompressionAnimation

- (BOOL)shouldCompressAtTop
{
  return 1;
}

- (double)topOffset
{
  return 0.0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 1;
}

- (void)updateWithPercentage:(double)a3
{
  Class isa = self[1].super.isa;
  swift_retain();
  [(objc_class *)isa frame];
  CGFloat Height = CGRectGetHeight(v7);
  CGAffineTransformMakeTranslation(&v6, 0.0, (Height + 44.0) * a3);
  [(objc_class *)isa setTransform:&v6];
  swift_release();
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  Class isa = self[1].super.isa;
  id v4 = a3;
  swift_retain();
  [(objc_class *)isa frame];
  double Height = CGRectGetHeight(v7);

  swift_release();
  return Height;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

@end