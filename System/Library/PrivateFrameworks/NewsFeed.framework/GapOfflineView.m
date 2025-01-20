@interface GapOfflineView
- (_TtC8NewsFeed14GapOfflineView)initWithCoder:(id)a3;
- (_TtC8NewsFeed14GapOfflineView)initWithFrame:(CGRect)a3;
@end

@implementation GapOfflineView

- (_TtC8NewsFeed14GapOfflineView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed14GapOfflineView *)sub_1C0336E64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed14GapOfflineView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed14GapOfflineView_offlineLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed14GapOfflineView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end