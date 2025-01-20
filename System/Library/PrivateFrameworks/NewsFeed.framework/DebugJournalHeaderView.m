@interface DebugJournalHeaderView
- (_TtC8NewsFeed22DebugJournalHeaderView)initWithCoder:(id)a3;
- (_TtC8NewsFeed22DebugJournalHeaderView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation DebugJournalHeaderView

- (_TtC8NewsFeed22DebugJournalHeaderView)initWithReuseIdentifier:(id)a3
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
  return (_TtC8NewsFeed22DebugJournalHeaderView *)sub_1C14E2DC8(v3, v4);
}

- (_TtC8NewsFeed22DebugJournalHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed22DebugJournalHeaderView_showHideLabel;
  sub_1C151A4AC();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1C151A47C();

  result = (_TtC8NewsFeed22DebugJournalHeaderView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C14E2FA8();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DebugJournalHeaderView *)&v3 prepareForReuse];
  sub_1C151A48C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22DebugJournalHeaderView_showHideLabel));
}

@end