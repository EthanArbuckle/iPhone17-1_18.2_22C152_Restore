@interface MastheadNavigationBarCompressionAnimator
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (_TtC5TeaUI40MastheadNavigationBarCompressionAnimator)init;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
- (void)prepareForUpdates;
- (void)reloadWithTraitCollection:(id)a3;
- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4;
- (void)updateWithPercentage:(double)a3;
@end

@implementation MastheadNavigationBarCompressionAnimator

- (BOOL)shouldCloseGapOnScroll
{
  v2 = self;
  unsigned __int8 v3 = MastheadNavigationBarCompressionAnimator.shouldCloseGapOnScroll.getter();

  return v3 & 1;
}

- (BOOL)shouldCompressAtTop
{
  v2 = self;
  unsigned __int8 v3 = MastheadNavigationBarCompressionAnimator.shouldCompressAtTop.getter();

  return v3 & 1;
}

- (double)topOffset
{
  v2 = self;
  MastheadNavigationBarCompressionAnimator.topOffset.getter();
  double v4 = v3;

  return v4;
}

- (void)prepareForUpdates
{
  v2 = self;
  MastheadNavigationBarCompressionAnimator.prepareForUpdates()();
}

- (void)updateWithPercentage:(double)a3
{
  double v4 = self;
  MastheadNavigationBarCompressionAnimator.update(withPercentage:)(a3);
}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  v5 = self;
  MastheadNavigationBarCompressionAnimator.scrollViewIs(atTop:offset:)(a3);
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  v6 = (UIScrollView *)a3;
  v7 = self;
  Swift::Bool v8 = MastheadNavigationBarCompressionAnimator.animationShouldBegin(for:currentlyFullyCompressed:)(v6, a4);

  return v8;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v5 = a3;
  v6 = self;
  MastheadNavigationBarCompressionAnimator.maximumBarHeight(for:)((uint64_t)a3);
  double v8 = v7;

  return v8;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  id v5 = a3;
  v6 = self;
  MastheadNavigationBarCompressionAnimator.minimumBarHeight(for:)((uint64_t)a3);
  double v8 = v7;

  return v8;
}

- (void)reloadWithTraitCollection:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.isa = (Class)a3;
  MastheadNavigationBarCompressionAnimator.reload(with:)(v9);
}

- (_TtC5TeaUI40MastheadNavigationBarCompressionAnimator)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI40MastheadNavigationBarCompressionAnimator_barCompressionAnimator));
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5TeaUI40MastheadNavigationBarCompressionAnimator_scrollView);
}

@end