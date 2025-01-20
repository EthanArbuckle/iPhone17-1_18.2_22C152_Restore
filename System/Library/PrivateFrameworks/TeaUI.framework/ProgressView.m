@interface ProgressView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5TeaUI12ProgressView)initWithCoder:(id)a3;
- (_TtC5TeaUI12ProgressView)initWithFrame:(CGRect)a3;
@end

@implementation ProgressView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1B5F5CCE8(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC5TeaUI12ProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI12ProgressView *)ProgressView.init(frame:)();
}

- (_TtC5TeaUI12ProgressView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI12ProgressView *)ProgressView.init(coder:)(a3);
}

@end