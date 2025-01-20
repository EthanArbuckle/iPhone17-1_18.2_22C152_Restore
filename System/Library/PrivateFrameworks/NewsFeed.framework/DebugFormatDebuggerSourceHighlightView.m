@interface DebugFormatDebuggerSourceHighlightView
- (_TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView)initWithCoder:(id)a3;
- (_TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatDebuggerSourceHighlightView

- (_TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0A48FE8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0A47EEC();
}

- (_TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C09C871C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_sourceFile, (uint64_t)v3, (uint64_t (*)(void))sub_1C017F2CC);
  sub_1C0A0C01C(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1C02F609C);
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_didTapOnHighlight));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_messageFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_messageTextColor));
  sub_1C0A48DC4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_highlight);
}

@end