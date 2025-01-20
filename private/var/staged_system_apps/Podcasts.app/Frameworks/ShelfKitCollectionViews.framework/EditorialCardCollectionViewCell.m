@interface EditorialCardCollectionViewCell
- (UILabel)accessibilityCaptionLabel;
- (UILabel)accessibilitySubtitleLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation EditorialCardCollectionViewCell

- (_TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell *)sub_188FD8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18AFEC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_189684();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18992C();
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell_captionLabel));
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell_titleLabel));
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell_subtitleLabel));
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell_artworkContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews31EditorialCardCollectionViewCell_subtitleLabel);
}

@end