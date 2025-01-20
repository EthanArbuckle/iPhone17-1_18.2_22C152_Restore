@interface CrossFadeNavigationBarCompressionAnimation
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldAlwaysScrollToTopOnTap;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (_TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation)init;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
- (void)attached;
- (void)detached;
- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4;
@end

@implementation CrossFadeNavigationBarCompressionAnimation

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

- (void)attached
{
  v2 = self;
  CrossFadeNavigationBarCompressionAnimation.attached()();
}

- (void)detached
{
  v2 = self;
  CrossFadeNavigationBarCompressionAnimation.detached()();
}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  v4 = self;
  CrossFadeNavigationBarCompressionAnimation.scrollViewIs(atTop:offset:)(0);
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = CrossFadeNavigationBarCompressionAnimation.maximumBarHeight(for:)();

  return v6;
}

- (_TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation_navigationItem));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation_navigationBar));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation_scrollView));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation_backgroundColor);
}

@end