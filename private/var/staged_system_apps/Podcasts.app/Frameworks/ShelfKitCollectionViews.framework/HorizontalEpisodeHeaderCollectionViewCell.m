@interface HorizontalEpisodeHeaderCollectionViewCell
- (_TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation HorizontalEpisodeHeaderCollectionViewCell

- (_TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell *)sub_20BEF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20E658();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell_artworkWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell____lazy_storage___horizontalStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell_verticalStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell_buttonStackView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell_episodeHeaderSubtitle));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell_episodeHeaderEntitlementDisplay));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell_episodeTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell____lazy_storage___showSubtitleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41HorizontalEpisodeHeaderCollectionViewCell____lazy_storage___primaryButton));
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end