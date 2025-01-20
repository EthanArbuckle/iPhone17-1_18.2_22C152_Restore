@interface LoadingTableViewCell
- (_TtC8NewsFeed20LoadingTableViewCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed20LoadingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation LoadingTableViewCell

- (_TtC8NewsFeed20LoadingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed20LoadingTableViewCell *)sub_1C0DD89C0(v4, v5);
}

- (_TtC8NewsFeed20LoadingTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed20LoadingTableViewCell_activityIndicatorView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1400]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed20LoadingTableViewCell *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(LoadingTableViewCell *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed20LoadingTableViewCell_activityIndicatorView];
  id v4 = objc_msgSend(v2, sel_contentView, v13.receiver, v13.super_class);
  objc_msgSend(v4, sel_bounds);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, sel_setFrame_, v6, v8, v10, v12);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20LoadingTableViewCell_activityIndicatorView));
}

@end