@interface EditorialStoryCardCollectionViewCell
- (_TtC8AppStore36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation EditorialStoryCardCollectionViewCell

- (_TtC8AppStore36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36EditorialStoryCardCollectionViewCell *)sub_1006B0260(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006B13B0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006B0C88();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1006B1100();
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_descriptionLabel));

  swift_unknownObjectRelease();
}

@end