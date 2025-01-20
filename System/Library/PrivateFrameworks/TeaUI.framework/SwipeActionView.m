@interface SwipeActionView
- (_TtC5TeaUI15SwipeActionView)initWithCoder:(id)a3;
- (_TtC5TeaUI15SwipeActionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SwipeActionView

- (_TtC5TeaUI15SwipeActionView)initWithFrame:(CGRect)a3
{
}

- (_TtC5TeaUI15SwipeActionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5FF8500();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B5FF85D4();
}

- (void).cxx_destruct
{
  id v3 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5TeaUI15SwipeActionView_swipeAction);
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI15SwipeActionView_swipeAction);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end