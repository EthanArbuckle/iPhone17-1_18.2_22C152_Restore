@interface YearlyLineChartView
- (_TtC10FitnessApp19YearlyLineChartView)initWithCoder:(id)a3;
- (_TtC10FitnessApp19YearlyLineChartView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation YearlyLineChartView

- (_TtC10FitnessApp19YearlyLineChartView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp19YearlyLineChartView *)sub_1006A2588(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp19YearlyLineChartView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006A30D4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_lineSeriesLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_maximumValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_averageValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_averageLayer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_gestureOverlay));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_monthFormatter));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19YearlyLineChartView_canonicalUnit));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end