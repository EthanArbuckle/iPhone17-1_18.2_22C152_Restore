@interface GymKitConnectingView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI20GymKitConnectingView)initWithCoder:(id)a3;
- (_TtC9SeymourUI20GymKitConnectingView)initWithFrame:(CGRect)a3;
@end

@implementation GymKitConnectingView

- (_TtC9SeymourUI20GymKitConnectingView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI20GymKitConnectingView *)sub_239CD15BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI20GymKitConnectingView)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI20GymKitConnectingView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20GymKitConnectingView_spriteView);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v5 = v4;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
}

@end