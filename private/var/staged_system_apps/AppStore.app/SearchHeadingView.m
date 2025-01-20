@interface SearchHeadingView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore17SearchHeadingView)initWithCoder:(id)a3;
- (_TtC8AppStore17SearchHeadingView)initWithFrame:(CGRect)a3;
- (void)didPressWithDetailButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation SearchHeadingView

- (_TtC8AppStore17SearchHeadingView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore17SearchHeadingView *)sub_100468310(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore17SearchHeadingView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17SearchHeadingView_metrics);
  v4[3] = &type metadata for CGFloat;
  v4[4] = &protocol witness table for CGFloat;
  void *v4 = 0;
  v4[8] = &type metadata for CGFloat;
  v4[9] = &protocol witness table for CGFloat;
  v4[5] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17SearchHeadingView_detailButtonHandler);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC8AppStore17SearchHeadingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100468B90();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  double v7 = sub_100468E60(a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)didPressWithDetailButton:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore17SearchHeadingView_detailButtonHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_100060050((uint64_t)v3);
    v3(v6);
    sub_10006012C((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  sub_10046AE8C((uint64_t)self + OBJC_IVAR____TtC8AppStore17SearchHeadingView_metrics);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore17SearchHeadingView_detailButtonHandler);

  sub_10006012C(v3);
}

@end