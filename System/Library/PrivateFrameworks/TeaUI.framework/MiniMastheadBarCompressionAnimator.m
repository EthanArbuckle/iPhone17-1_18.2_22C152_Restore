@interface MiniMastheadBarCompressionAnimator
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (_TtC5TeaUI34MiniMastheadBarCompressionAnimator)init;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
- (void)detached;
- (void)setTopOffset:(double)a3;
- (void)updateWithPercentage:(double)a3;
@end

@implementation MiniMastheadBarCompressionAnimator

- (double)topOffset
{
  return MiniMastheadBarCompressionAnimator.topOffset.getter();
}

- (void)setTopOffset:(double)a3
{
}

- (BOOL)shouldCompressAtTop
{
  return 1;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 0;
}

- (void)detached
{
  v2 = self;
  MiniMastheadBarCompressionAnimator.detached()();
}

- (void)updateWithPercentage:(double)a3
{
  v4 = self;
  MiniMastheadBarCompressionAnimator.update(withPercentage:)(a3);
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  v6 = (UIScrollView *)a3;
  v7 = self;
  Swift::Bool v8 = MiniMastheadBarCompressionAnimator.animationShouldBegin(for:currentlyFullyCompressed:)(v6, a4);

  return v8;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = MiniMastheadBarCompressionAnimator.maximumBarHeight(for:)();

  return v6;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (_TtC5TeaUI34MiniMastheadBarCompressionAnimator)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI34MiniMastheadBarCompressionAnimator_navigationBar));
}

@end