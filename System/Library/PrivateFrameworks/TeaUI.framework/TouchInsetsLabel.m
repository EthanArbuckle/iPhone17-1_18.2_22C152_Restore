@interface TouchInsetsLabel
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC5TeaUI16TouchInsetsLabel)initWithCoder:(id)a3;
- (_TtC5TeaUI16TouchInsetsLabel)initWithFrame:(CGRect)a3;
@end

@implementation TouchInsetsLabel

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_1B603F428(x, y);

  return self & 1;
}

- (_TtC5TeaUI16TouchInsetsLabel)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI16TouchInsetsLabel *)TouchInsetsLabel.init(frame:)();
}

- (_TtC5TeaUI16TouchInsetsLabel)initWithCoder:(id)a3
{
  return (_TtC5TeaUI16TouchInsetsLabel *)TouchInsetsLabel.init(coder:)(a3);
}

@end