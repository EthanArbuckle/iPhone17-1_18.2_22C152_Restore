@interface ActivityStandChartView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)standChartPoints;
- (_TtC10FitnessApp22ActivityStandChartView)initWithCoder:(id)a3;
- (_TtC10FitnessApp22ActivityStandChartView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation ActivityStandChartView

- (_TtC10FitnessApp22ActivityStandChartView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp22ActivityStandChartView *)sub_1006DC000(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp22ActivityStandChartView)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2 = self;
  sub_1006DC7D0();
}

- (void).cxx_destruct
{
  sub_1000D6120(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___stoodHistogram));
  sub_1000D6120(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___sedentaryHistogram));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView_axisLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___stoodBarLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView____lazy_storage___sedentaryBarLayer));
  swift_bridgeObjectRelease();
  sub_100074898((uint64_t)self + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView_listener);
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView_dataProvider;

  sub_10019B9F8((uint64_t)v3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006DD378();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC10FitnessApp22ActivityStandChartView_chartHeight);
  sub_1003EAB6C();
  double v6 = v4 + v5;
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v3 = self;
  double v4 = self;
  id v5 = [v3 mainScreen];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.CGFloat width = v11;
  v21.size.height = v13;
  -[ActivityStandChartView sizeThatFits:](v4, "sizeThatFits:", CGRectGetWidth(v21), 1.79769313e308);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.height = v19;
  result.CGFloat width = v18;
  return result;
}

- (NSArray)standChartPoints
{
  v2 = self;
  sub_1006DD8D0();

  type metadata accessor for CGPoint(0);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

@end