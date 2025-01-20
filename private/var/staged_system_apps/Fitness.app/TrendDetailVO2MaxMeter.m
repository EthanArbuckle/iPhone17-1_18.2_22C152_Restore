@interface TrendDetailVO2MaxMeter
- (CGSize)intrinsicContentSize;
- (_TtC10FitnessApp22TrendDetailVO2MaxMeter)initWithCoder:(id)a3;
- (_TtC10FitnessApp22TrendDetailVO2MaxMeter)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TrendDetailVO2MaxMeter

- (CGSize)intrinsicContentSize
{
  double v2 = 119.0;
  double v3 = 10.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (_TtC10FitnessApp22TrendDetailVO2MaxMeter)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp22TrendDetailVO2MaxMeter *)sub_10037C430(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp22TrendDetailVO2MaxMeter)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TrendDetailVO2MaxMeter();
  double v2 = (char *)v4.receiver;
  [(TrendDetailVO2MaxMeter *)&v4 layoutSubviews];
  double v3 = self;
  [v3 begin];
  [v3 setDisableActions:1];
  sub_10037C830(v2);
  [v3 commit];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendDetailVO2MaxMeter_gradientLayer));
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp22TrendDetailVO2MaxMeter_shapeLayer);
}

@end