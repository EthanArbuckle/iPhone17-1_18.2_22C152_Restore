@interface StackIconView
- (_TtC9SeymourUI13StackIconView)initWithCoder:(id)a3;
- (_TtC9SeymourUI13StackIconView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
@end

@implementation StackIconView

- (_TtC9SeymourUI13StackIconView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13StackIconView *)sub_239FCB91C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239FCC020();
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_239FCC138();
}

- (_TtC9SeymourUI13StackIconView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239FCC84C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13StackIconView_layoutView);
}

@end