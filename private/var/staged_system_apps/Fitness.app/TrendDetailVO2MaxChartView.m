@interface TrendDetailVO2MaxChartView
- (_TtC10FitnessApp26TrendDetailVO2MaxChartView)initWithCoder:(id)a3;
- (_TtC10FitnessApp26TrendDetailVO2MaxChartView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setupFontsWithNote:(id)a3;
@end

@implementation TrendDetailVO2MaxChartView

- (_TtC10FitnessApp26TrendDetailVO2MaxChartView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp26TrendDetailVO2MaxChartView *)sub_10037CA9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setupFontsWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10037DB90();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC10FitnessApp26TrendDetailVO2MaxChartView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10037F0D4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_labelStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_labelRightLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_title365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_title90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_meter365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_meter90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_pill365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_pill90));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_pill90CenterYConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp26TrendDetailVO2MaxChartView_pill365CenterYConstraint);
}

@end