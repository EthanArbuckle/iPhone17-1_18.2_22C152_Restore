@interface DebugFormatEditorPathView
- (_TtC8NewsFeed25DebugFormatEditorPathView)initWithCoder:(id)a3;
- (_TtC8NewsFeed25DebugFormatEditorPathView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatEditorPathView

- (_TtC8NewsFeed25DebugFormatEditorPathView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C09D04AC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C09CF588();
}

- (_TtC8NewsFeed25DebugFormatEditorPathView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed25DebugFormatEditorPathView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed25DebugFormatEditorPathView_onShowSourceMap));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugFormatEditorPathView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugFormatEditorPathView_separatorView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugFormatEditorPathView_linkHandler));
  swift_release();
}

@end