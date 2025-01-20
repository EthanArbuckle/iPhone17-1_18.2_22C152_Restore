@interface ArtworkCheckmarkProgressOverlay
- (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArtworkCheckmarkProgressOverlay

- (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_progressStyle) = 2;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_checkmarkInset) = 0;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_progress) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_playing) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay *)sub_385890();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2C7FBC();
}

- (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ArtworkCheckmarkProgressOverlay_checkmarkImageView));
}

@end