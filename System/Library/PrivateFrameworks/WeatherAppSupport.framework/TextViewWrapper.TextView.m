@interface TextViewWrapper.TextView
- (BOOL)canBecomeFirstResponder;
- (CGSize)intrinsicContentSize;
- (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView)initWithCoder:(id)a3;
- (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation TextViewWrapper.TextView

- (CGSize)intrinsicContentSize
{
  double v2 = sub_2615949EC();
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_261594A28() & 1;
}

- (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView *)sub_261594A30(a4, x, y, width, height);
}

- (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView)initWithCoder:(id)a3
{
  return (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper8TextView *)sub_261594B14(a3);
}

@end