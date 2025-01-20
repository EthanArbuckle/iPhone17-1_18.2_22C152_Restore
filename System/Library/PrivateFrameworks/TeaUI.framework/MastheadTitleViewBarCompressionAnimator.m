@interface MastheadTitleViewBarCompressionAnimator
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (_TtC5TeaUI39MastheadTitleViewBarCompressionAnimator)init;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
- (void)prepareForUpdates;
- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4;
- (void)setTopOffset:(double)a3;
- (void)updateWithPercentage:(double)a3;
@end

@implementation MastheadTitleViewBarCompressionAnimator

- (double)topOffset
{
  return MastheadTitleViewBarCompressionAnimator.topOffset.getter();
}

- (void)setTopOffset:(double)a3
{
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 0;
}

- (void)prepareForUpdates
{
  v2 = self;
  MastheadTitleViewBarCompressionAnimator.prepareForUpdates()();
}

- (void)updateWithPercentage:(double)a3
{
  v4 = self;
  MastheadTitleViewBarCompressionAnimator.update(withPercentage:)(a3);
}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  v5 = self;
  MastheadTitleViewBarCompressionAnimator.scrollViewIs(atTop:offset:)(a3);
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  v5 = (UIScrollView *)a3;
  v6 = self;
  LOBYTE(self) = MastheadTitleViewBarCompressionAnimator.animationShouldBegin(for:currentlyFullyCompressed:)(v5, 0);

  return self & 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = MastheadTitleViewBarCompressionAnimator.maximumBarHeight(for:)();

  return v6;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (_TtC5TeaUI39MastheadTitleViewBarCompressionAnimator)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI39MastheadTitleViewBarCompressionAnimator_navigationBar));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5TeaUI39MastheadTitleViewBarCompressionAnimator_compressibleTitleView);
}

@end