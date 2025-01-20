@interface CHWorkoutDetailAppleWeatherFooterView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (CHWorkoutDetailAppleWeatherFooterView)init;
- (CHWorkoutDetailAppleWeatherFooterView)initWithCoder:(id)a3;
- (CHWorkoutDetailAppleWeatherFooterView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation CHWorkoutDetailAppleWeatherFooterView

- (CHWorkoutDetailAppleWeatherFooterView)init
{
  return (CHWorkoutDetailAppleWeatherFooterView *)sub_10060FE38();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v5 = self;
  [(CHWorkoutDetailAppleWeatherFooterView *)v5 frame];
  -[CHWorkoutDetailAppleWeatherFooterView sizeThatFits:](v5, "sizeThatFits:", CGRectGetWidth(v13), INFINITY);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CHWorkoutDetailAppleWeatherFooterView)initWithCoder:(id)a3
{
  CGSize result = (CHWorkoutDetailAppleWeatherFooterView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CHWorkoutDetailAppleWeatherFooterView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  CGSize result = (CHWorkoutDetailAppleWeatherFooterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end