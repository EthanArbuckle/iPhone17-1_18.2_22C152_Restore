@interface TouchInsetsButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC5TeaUI17TouchInsetsButton)initWithCoder:(id)a3;
- (_TtC5TeaUI17TouchInsetsButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TouchInsetsButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_1B5F854F8(x, y);

  return self & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B5F855F4();
}

- (_TtC5TeaUI17TouchInsetsButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI17TouchInsetsButton *)TouchInsetsButton.init(frame:)();
}

- (_TtC5TeaUI17TouchInsetsButton)initWithCoder:(id)a3
{
  return (_TtC5TeaUI17TouchInsetsButton *)TouchInsetsButton.init(coder:)(a3);
}

@end