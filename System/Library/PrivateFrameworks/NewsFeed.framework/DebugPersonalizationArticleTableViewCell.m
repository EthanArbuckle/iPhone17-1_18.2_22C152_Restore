@interface DebugPersonalizationArticleTableViewCell
- (_TtC8NewsFeed40DebugPersonalizationArticleTableViewCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed40DebugPersonalizationArticleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation DebugPersonalizationArticleTableViewCell

- (_TtC8NewsFeed40DebugPersonalizationArticleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C151E62C();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_1C0B47C14(a3, (uint64_t)a4, v6);
  return result;
}

- (_TtC8NewsFeed40DebugPersonalizationArticleTableViewCell)initWithCoder:(id)a3
{
  sub_1C0B488B0(a3);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1C0B48C48();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_thumbnailImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_publisherTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_articleTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_yesButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_noButton);
}

@end