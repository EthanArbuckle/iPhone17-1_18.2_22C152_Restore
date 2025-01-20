@interface FullScreenVideoControls
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC23ShelfKitCollectionViews23FullScreenVideoControls)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23FullScreenVideoControls)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FullScreenVideoControls

- (_TtC23ShelfKitCollectionViews23FullScreenVideoControls)initWithFrame:(CGRect)a3
{
  sub_322EF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC23ShelfKitCollectionViews23FullScreenVideoControls)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3243D0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_323E2C();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 47.0;
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
  sub_324568((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_backdrop));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_progressBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_progressBarFill));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_currentTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_totalDurationLabel));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews23FullScreenVideoControls_durationFormatter);
}

@end