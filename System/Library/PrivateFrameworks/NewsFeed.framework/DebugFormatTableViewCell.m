@interface DebugFormatTableViewCell
- (_TtC8NewsFeed24DebugFormatTableViewCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed24DebugFormatTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation DebugFormatTableViewCell

- (_TtC8NewsFeed24DebugFormatTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed24DebugFormatTableViewCell *)sub_1C14C4D40(v4, v5);
}

- (_TtC8NewsFeed24DebugFormatTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_indicatorColor) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_circleView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed24DebugFormatTableViewCell *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(DebugFormatTableViewCell *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_circleView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  sub_1C151F77C();
  objc_msgSend(v3, sel_setFrame_, 4.0);
  id v4 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v4, sel_setCornerRadius_, 4.0);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1C14C4BF0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_indicatorColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_circleView);
}

@end