@interface DebugFormatInspectorSplitView
- (_TtC8NewsFeed29DebugFormatInspectorSplitView)initWithCoder:(id)a3;
- (_TtC8NewsFeed29DebugFormatInspectorSplitView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatInspectorSplitView

- (_TtC8NewsFeed29DebugFormatInspectorSplitView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed29DebugFormatInspectorSplitView *)sub_1C0CBB174(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed29DebugFormatInspectorSplitView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorSplitView_left;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorSplitView_right;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed29DebugFormatInspectorSplitView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0CBB3B0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorSplitView_left));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorSplitView_right);
}

@end