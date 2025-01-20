@interface VisualEffectContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore25VisualEffectContainerView)initWithCoder:(id)a3;
- (_TtC8AppStore25VisualEffectContainerView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation VisualEffectContainerView

- (_TtC8AppStore25VisualEffectContainerView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore25VisualEffectContainerView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore25VisualEffectContainerView_embeddedView);
  v5 = self;
  [v4 sizeThatFits:width, 1.79769313e308];
  double v7 = v6;
  double v9 = v8;
  [(VisualEffectContainerView *)v5 bounds];
  double v10 = CGRectGetWidth(v14);

  if (v10 >= v7) {
    double v11 = v7;
  }
  else {
    double v11 = v10;
  }
  double v12 = v9;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003E78B8();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore25VisualEffectContainerView_embeddedView) measurementsWithFitting:a4 in:a3.width, a3.height];
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (_TtC8AppStore25VisualEffectContainerView)initWithEffect:(id)a3
{
  id v3 = a3;
  JUMeasurements result = (_TtC8AppStore25VisualEffectContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25VisualEffectContainerView_embeddedView));
}

@end