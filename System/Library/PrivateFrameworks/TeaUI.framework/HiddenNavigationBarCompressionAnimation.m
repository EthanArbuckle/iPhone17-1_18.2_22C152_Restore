@interface HiddenNavigationBarCompressionAnimation
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldAlwaysScrollToTopOnTap;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (_TtC5TeaUI39HiddenNavigationBarCompressionAnimation)init;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
@end

@implementation HiddenNavigationBarCompressionAnimation

- (BOOL)shouldCloseGapOnScroll
{
  return 0;
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (double)topOffset
{
  return 0.0;
}

- (BOOL)shouldAlwaysScrollToTopOnTap
{
  return 1;
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 0;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (_TtC5TeaUI39HiddenNavigationBarCompressionAnimation)init
{
  return (_TtC5TeaUI39HiddenNavigationBarCompressionAnimation *)HiddenNavigationBarCompressionAnimation.init()();
}

@end