@interface DebugFormatMarkdownHeaderFooterView
- (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView)initWithCoder:(id)a3;
- (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView)initWithReuseIdentifier:(id)a3;
@end

@implementation DebugFormatMarkdownHeaderFooterView

- (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1C151E62C();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView *)sub_1C0B9040C(v3, v4);
}

- (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView_label;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView_label));
}

@end