@interface DebugFormatDebuggerSourceBreakpointIndicatorView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView)initWithCoder:(id)a3;
- (_TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation DebugFormatDebuggerSourceBreakpointIndicatorView

- (_TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView_onTap;
  sub_1C0A0C080(0, (unint64_t *)&qword_1EB871600, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4FAD760]);
  id v7 = objc_allocWithZone(v6);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  id v8 = self;
  [(DebugFormatDebuggerSourceBreakpointIndicatorView *)v8 bounds];
  v16.origin.CGFloat x = UIEdgeInsetsInsetRect(v9, v10, v11, v12, -40.0, -40.0);
  v15.CGFloat x = x;
  v15.CGFloat y = y;
  BOOL v13 = CGRectContainsPoint(v16, v15);

  return v13;
}

- (_TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView_onTap);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  double v9 = (void *)sub_1C0A0D038();

  return v9;
}

@end