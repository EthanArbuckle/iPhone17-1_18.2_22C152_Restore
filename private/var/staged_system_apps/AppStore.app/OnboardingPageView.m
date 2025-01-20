@interface OnboardingPageView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore18OnboardingPageView)initWithCoder:(id)a3;
- (_TtC8AppStore18OnboardingPageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OnboardingPageView

- (_TtC8AppStore18OnboardingPageView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18OnboardingPageView_contentView) = 0;
  id v4 = a3;

  result = (_TtC8AppStore18OnboardingPageView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10074FF3C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double v4 = 0.0;
  CGFloat height = a3.height;
  result.var1 = a3.height;
  result.var0 = a3.width;
  result.var3 = v4;
  result.var2 = height;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100750370(a3);
}

- (_TtC8AppStore18OnboardingPageView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC8AppStore18OnboardingPageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000EE6EC((uint64_t)self + OBJC_IVAR____TtC8AppStore18OnboardingPageView_layoutMetrics);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18OnboardingPageView_contentScrollView));

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18OnboardingPageView_trayBackgroundView);
}

@end