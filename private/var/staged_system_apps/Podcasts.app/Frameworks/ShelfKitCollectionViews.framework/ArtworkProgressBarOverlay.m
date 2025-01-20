@interface ArtworkProgressBarOverlay
- (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateProgressViewOpacity;
@end

@implementation ArtworkProgressBarOverlay

- (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressStyle) = 1;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progress) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_playing) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay *)sub_385890();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B114();
}

- (void)updateProgressViewOpacity
{
  v2 = self;
  sub_1B39C();
}

- (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->super.cornerStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressBarSettings];
  id v4 = *(void **)&self->super.roundedCorners[OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressBarSettings
                                           + 7];
  objc_release(*(id *)&self->super.borderView[OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressBarSettings
                                            + 7]);

  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkProgressBarOverlay_progressView);
}

@end