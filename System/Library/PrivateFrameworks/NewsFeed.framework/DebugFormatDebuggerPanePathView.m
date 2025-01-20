@interface DebugFormatDebuggerPanePathView
- (_TtC8NewsFeed31DebugFormatDebuggerPanePathView)initWithCoder:(id)a3;
- (_TtC8NewsFeed31DebugFormatDebuggerPanePathView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatDebuggerPanePathView

- (_TtC8NewsFeed31DebugFormatDebuggerPanePathView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed31DebugFormatDebuggerPanePathView *)sub_1C0CC72B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed31DebugFormatDebuggerPanePathView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0CC7A04();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0CC7710();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatDebuggerPanePathView_topSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatDebuggerPanePathView_bottomSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatDebuggerPanePathView_filePathLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed31DebugFormatDebuggerPanePathView_lineColumnLabel);
}

@end