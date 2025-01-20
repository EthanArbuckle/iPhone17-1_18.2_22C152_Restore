@interface AccessibilityDoubleStack
- (_TtC7Measure24AccessibilityDoubleStack)initWithCoder:(id)a3;
- (_TtC7Measure24AccessibilityDoubleStack)initWithFrame:(CGRect)a3;
@end

@implementation AccessibilityDoubleStack

- (_TtC7Measure24AccessibilityDoubleStack)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure24AccessibilityDoubleStack *)sub_100056AA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure24AccessibilityDoubleStack)initWithCoder:(id)a3
{
  return (_TtC7Measure24AccessibilityDoubleStack *)sub_100056C3C(a3);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure24AccessibilityDoubleStack_bottomLabel);
}

@end