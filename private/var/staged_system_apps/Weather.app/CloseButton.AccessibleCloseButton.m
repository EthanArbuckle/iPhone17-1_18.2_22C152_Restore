@interface CloseButton.AccessibleCloseButton
- (BOOL)accessibilityActivate;
- (_TtCV7Weather11CloseButton21AccessibleCloseButton)initWithCoder:(id)a3;
- (_TtCV7Weather11CloseButton21AccessibleCloseButton)initWithFrame:(CGRect)a3;
@end

@implementation CloseButton.AccessibleCloseButton

- (BOOL)accessibilityActivate
{
  v2 = self;
  sub_10092C798();

  return 1;
}

- (_TtCV7Weather11CloseButton21AccessibleCloseButton)initWithFrame:(CGRect)a3
{
  return (_TtCV7Weather11CloseButton21AccessibleCloseButton *)sub_10092C7F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV7Weather11CloseButton21AccessibleCloseButton)initWithCoder:(id)a3
{
  return (_TtCV7Weather11CloseButton21AccessibleCloseButton *)sub_10092C87C(a3);
}

@end