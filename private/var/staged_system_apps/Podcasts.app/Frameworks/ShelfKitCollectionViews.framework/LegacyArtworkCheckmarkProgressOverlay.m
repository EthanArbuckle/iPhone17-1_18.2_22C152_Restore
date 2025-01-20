@interface LegacyArtworkCheckmarkProgressOverlay
- (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LegacyArtworkCheckmarkProgressOverlay

- (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_progressStyle) = 2;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_checkmarkInset) = 0;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_progress) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_playing) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay *)sub_385890();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19BE84();
}

- (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_checkmarkImageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews37LegacyArtworkCheckmarkProgressOverlay_blurredImageBackgroundView);
}

@end