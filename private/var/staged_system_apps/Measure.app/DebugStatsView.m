@interface DebugStatsView
- (_TtC7Measure14DebugStatsView)initWithCoder:(id)a3;
- (_TtC7Measure14DebugStatsView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation DebugStatsView

- (_TtC7Measure14DebugStatsView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure14DebugStatsView *)sub_10005B0BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure14DebugStatsView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure14DebugStatsView_maxWidth) = 0;
  id v4 = a3;

  result = (_TtC7Measure14DebugStatsView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_10005AB1C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure14DebugStatsView_renderGlobalTimeLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure14DebugStatsView_arGlobalMaxFrameCountLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure14DebugStatsView_arAgeLabel);
}

@end