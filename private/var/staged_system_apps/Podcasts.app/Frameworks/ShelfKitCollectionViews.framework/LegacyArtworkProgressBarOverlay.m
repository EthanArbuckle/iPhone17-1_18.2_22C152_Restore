@interface LegacyArtworkProgressBarOverlay
- (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateProgressViewOpacity;
@end

@implementation LegacyArtworkProgressBarOverlay

- (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressStyle) = 1;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progress) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_playing) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay *)sub_385890();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_178150();
}

- (void)updateProgressViewOpacity
{
  v2 = self;
  sub_1784C0();
}

- (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->super.cornerStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressBarSettings];
  id v4 = *(void **)&self->super.roundedCorners[OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressBarSettings
                                           + 7];
  objc_release(*(id *)&self->super.borderView[OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressBarSettings
                                            + 7]);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_blurredImageBackgroundView));
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews31LegacyArtworkProgressBarOverlay_progressView);
}

@end