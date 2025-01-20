@interface HorizontalShowHeaderCollectionViewCell
- (_TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)benefitsLabelTapped;
@end

@implementation HorizontalShowHeaderCollectionViewCell

- (_TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell *)sub_311940(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_313C2C();
}

- (void)benefitsLabelTapped
{
  v2 = self;
  sub_313184();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___upsellArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___horizontalStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell_parentVerticalStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___verticalStackContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell_verticalStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___buttonStackViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell_showTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell_showMetadataView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___showTitleTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___descriptionBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell_descriptionLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell_contextButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell_subscribeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___primaryButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___showSubtitleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___benefitsLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews38HorizontalShowHeaderCollectionViewCell____lazy_storage___secondaryButton);
}

@end