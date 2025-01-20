@interface TrendListMetricView
- (NSString)trendString;
- (UILabel)titleLabel;
- (UILabel)valueLabel;
- (_TtC10FitnessApp19TrendListMetricView)initWithCoder:(id)a3;
- (_TtC10FitnessApp19TrendListMetricView)initWithFrame:(CGRect)a3;
@end

@implementation TrendListMetricView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_titleLabel));
}

- (UILabel)valueLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_valueLabel));
}

- (_TtC10FitnessApp19TrendListMetricView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp19TrendListMetricView *)sub_1005AEE38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp19TrendListMetricView)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_arrowIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp19TrendListMetricView_valueLabel);
}

- (NSString)trendString
{
  v2 = self;
  sub_1005AF968();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end