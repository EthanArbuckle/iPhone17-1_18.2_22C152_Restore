@interface ActivityMoveAndExerciseChartView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)moveAndExerciseChartPoints;
- (_TtC10FitnessApp32ActivityMoveAndExerciseChartView)initWithCoder:(id)a3;
- (_TtC10FitnessApp32ActivityMoveAndExerciseChartView)initWithFrame:(CGRect)a3;
- (double)moveAndExerciseChartMaxYValue;
- (int64_t)moveAndExerciseChartViewType;
- (void)layoutSubviews;
- (void)reloadDataWithShowFull:(BOOL)a3 animated:(BOOL)a4;
- (void)updateFonts;
@end

@implementation ActivityMoveAndExerciseChartView

- (CGSize)intrinsicContentSize
{
  v3 = self;
  v4 = self;
  id v5 = [v3 mainScreen];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  -[ActivityMoveAndExerciseChartView sizeThatFits:](v4, "sizeThatFits:", CGRectGetWidth(v21), 1.79769313e308);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (_TtC10FitnessApp32ActivityMoveAndExerciseChartView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp32ActivityMoveAndExerciseChartView *)sub_1003E8828(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp32ActivityMoveAndExerciseChartView)initWithCoder:(id)a3
{
  return 0;
}

- (void)updateFonts
{
  v2 = self;
  sub_1003E8E10();
}

- (void)reloadDataWithShowFull:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v6 = self;
  sub_1003E9060(v5, v4);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003E9E40();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_chartHeight);
  sub_1003EAB6C();
  double v6 = v4 + v5;
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_dataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_unitManager));
  sub_1000D6120(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___mainHistogram));
  sub_1000D6120(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___workoutOverlayHistogram));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_axisLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___mainBarLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView____lazy_storage___workoutOverlayBarLayer));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_topAxisLabel);
}

- (NSArray)moveAndExerciseChartPoints
{
  v2 = self;
  sub_1003EA4D4();

  type metadata accessor for CGPoint(0);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (double)moveAndExerciseChartMaxYValue
{
  v2 = self;
  sub_1003E7964(v4);
  sub_1000B008C((uint64_t)v4);

  return *(double *)&v4[3];
}

- (int64_t)moveAndExerciseChartViewType
{
  return *((unsigned __int8 *)&self->super.super.super.isa
         + OBJC_IVAR____TtC10FitnessApp32ActivityMoveAndExerciseChartView_chartViewType);
}

@end