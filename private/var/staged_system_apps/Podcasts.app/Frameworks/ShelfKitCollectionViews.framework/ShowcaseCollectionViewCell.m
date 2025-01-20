@interface ShowcaseCollectionViewCell
- (UILabel)accessibilityCaptionLabel;
- (UILabel)accessibilitySubtitleLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ShowcaseCollectionViewCell

- (_TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell *)sub_6D9D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_70BB4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_6E6D4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_mainArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_mainArtworkContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_thumbnailArtworkContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell____lazy_storage___thumbnailArtworkView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell____lazy_storage___hStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_overlayingCaptionLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_separatorView);
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_captionLabel));
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_titleLabel));
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowcaseCollectionViewCell_subtitleLabel));
}

@end