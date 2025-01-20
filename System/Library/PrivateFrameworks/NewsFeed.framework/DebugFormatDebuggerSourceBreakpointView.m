@interface DebugFormatDebuggerSourceBreakpointView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView)initWithCoder:(id)a3;
- (_TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView)initWithFrame:(CGRect)a3;
@end

@implementation DebugFormatDebuggerSourceBreakpointView

- (_TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView_sourceFile;
  sub_1C017F2B4(v8);
  sub_1C09CFC44((uint64_t)v8, (uint64_t)v5);
  id v6 = a3;

  result = (_TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(DebugFormatDebuggerSourceBreakpointView *)v8 bounds];
  v16.origin.CGFloat x = UIEdgeInsetsInsetRect(v9, v10, v11, v12, -40.0, -20.0);
  v15.CGFloat x = x;
  v15.CGFloat y = y;
  BOOL v13 = CGRectContainsPoint(v16, v15);

  return v13;
}

- (_TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_1C09CFC44((uint64_t)self + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView_sourceFile, (uint64_t)v2);
  sub_1C0A0C01C(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1C02F609C);
  swift_release();
}

@end