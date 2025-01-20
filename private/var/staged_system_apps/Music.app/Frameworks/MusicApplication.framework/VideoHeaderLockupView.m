@interface VideoHeaderLockupView
- (_TtC16MusicApplication12ProgressView)accessibilityProgressView;
- (_TtC16MusicApplication21VideoHeaderLockupView)initWithCoder:(id)a3;
- (_TtC16MusicApplication21VideoHeaderLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation VideoHeaderLockupView

- (_TtC16MusicApplication21VideoHeaderLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication21VideoHeaderLockupView *)sub_2895A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication21VideoHeaderLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_28BDD4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_28A660();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC16MusicApplication12ProgressView)accessibilityProgressView
{
  return (_TtC16MusicApplication12ProgressView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_progressView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_lockupImageArtworkCatalog));
  sub_9289C((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkCornerTreatment);
  sub_34BEC(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkPlaceholder), *(void **)&self->lockupImageArtworkCatalog[OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkPlaceholder], *(void **)&self->artworkPlaceholder[OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkPlaceholder], *(void **)&self->artworkPlaceholder[OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkPlaceholder + 8]);
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_playButtonHandler));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_playButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_durationTextStackView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_progressView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_checkmarkImageView);
}

@end