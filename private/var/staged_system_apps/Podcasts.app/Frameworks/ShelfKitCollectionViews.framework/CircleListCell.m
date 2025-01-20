@interface CircleListCell
- (_TtC23ShelfKitCollectionViews14CircleListCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews14CircleListCell)initWithFrame:(CGRect)a3;
@end

@implementation CircleListCell

- (_TtC23ShelfKitCollectionViews14CircleListCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews14CircleListCell *)sub_10B3C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews14CircleListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10CD88();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14CircleListCell_favoritedImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14CircleListCell_hStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14CircleListCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14CircleListCell_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14CircleListCell_titlesVStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14CircleListCell_eyebrowLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14CircleListCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14CircleListCell_subtitleLabel));
  swift_release();
  swift_release();

  swift_release();
}

@end