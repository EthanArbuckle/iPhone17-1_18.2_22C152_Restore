@interface FeedItemTableViewCell
- (_TtC8NewsFeed21FeedItemTableViewCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed21FeedItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation FeedItemTableViewCell

- (_TtC8NewsFeed21FeedItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_1C151E62C();
    v7 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed21FeedItemTableViewCell_identifier);
    void *v7 = 0;
    v7[1] = 0;
    a4 = (id)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed21FeedItemTableViewCell_identifier);
    void *v8 = 0;
    v8[1] = 0;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = [(FeedItemTableViewCell *)&v11 initWithStyle:3 reuseIdentifier:a4];

  return v9;
}

- (_TtC8NewsFeed21FeedItemTableViewCell)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FeedItemTableViewCell_identifier);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8NewsFeed21FeedItemTableViewCell *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(FeedItemTableViewCell *)&v4 prepareForReuse];
  v3 = &v2[OBJC_IVAR____TtC8NewsFeed21FeedItemTableViewCell_identifier];
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end