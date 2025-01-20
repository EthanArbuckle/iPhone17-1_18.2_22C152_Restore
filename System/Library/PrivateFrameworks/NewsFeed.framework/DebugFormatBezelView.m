@interface DebugFormatBezelView
- (_TtC8NewsFeed20DebugFormatBezelView)initWithCoder:(id)a3;
- (_TtC8NewsFeed20DebugFormatBezelView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatBezelView

- (_TtC8NewsFeed20DebugFormatBezelView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed20DebugFormatBezelView *)sub_1C0A74E6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed20DebugFormatBezelView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed20DebugFormatBezelView_bezelLayer;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F39C88]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC8NewsFeed20DebugFormatBezelView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0A750DC();
}

- (void).cxx_destruct
{
}

@end