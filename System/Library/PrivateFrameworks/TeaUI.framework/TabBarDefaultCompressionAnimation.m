@interface TabBarDefaultCompressionAnimation
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (_TtC5TeaUI33TabBarDefaultCompressionAnimation)init;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
- (void)reloadWithTraitCollection:(id)a3;
- (void)updateWithPercentage:(double)a3;
@end

@implementation TabBarDefaultCompressionAnimation

- (double)topOffset
{
  return 0.0;
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 1;
}

- (void)updateWithPercentage:(double)a3
{
  v3 = self;
  TabBarDefaultCompressionAnimation.update(withPercentage:)();
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = TabBarDefaultCompressionAnimation.maximumBarHeight(for:)();

  return v6;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (void)reloadWithTraitCollection:(id)a3
{
  id v4 = a3;
  v7.value.super.Class isa = (Class)self;
  Class isa = v7.value.super.isa;
  TabBarDefaultCompressionAnimation.reload(with:)(v7);
}

- (_TtC5TeaUI33TabBarDefaultCompressionAnimation)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI33TabBarDefaultCompressionAnimation_tabBarController));
}

@end