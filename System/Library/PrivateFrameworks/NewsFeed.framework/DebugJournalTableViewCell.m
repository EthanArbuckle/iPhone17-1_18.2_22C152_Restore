@interface DebugJournalTableViewCell
- (_TtC8NewsFeed25DebugJournalTableViewCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed25DebugJournalTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation DebugJournalTableViewCell

- (_TtC8NewsFeed25DebugJournalTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1C151E62C();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC8NewsFeed25DebugJournalTableViewCell *)sub_1C1514C3C(v4, v5);
}

- (_TtC8NewsFeed25DebugJournalTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_stripView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_activityIndicatorView;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1400]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed25DebugJournalTableViewCell *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(DebugJournalTableViewCell *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_stripView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_, 0.0, 0.0, 4.0, CGRectGetHeight(v6));
  uint64_t v4 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_activityIndicatorView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(DebugJournalTableViewCell *)&v4 prepareForReuse];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_activityIndicatorView];
  objc_msgSend(v3, sel_setHidden_, 1, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_stopAnimating);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_stripView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_activityIndicatorView);
}

@end