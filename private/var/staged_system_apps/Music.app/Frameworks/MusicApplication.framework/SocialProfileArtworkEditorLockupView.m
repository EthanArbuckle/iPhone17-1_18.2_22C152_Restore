@interface SocialProfileArtworkEditorLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication36SocialProfileArtworkEditorLockupView)initWithCoder:(id)a3;
- (_TtC16MusicApplication36SocialProfileArtworkEditorLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SocialProfileArtworkEditorLockupView

- (_TtC16MusicApplication36SocialProfileArtworkEditorLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication36SocialProfileArtworkEditorLockupView *)sub_51C864(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication36SocialProfileArtworkEditorLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_51D51C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_51CF9C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = a3.width + 32.0;
  BOOL v4 = a3.width <= 128.0;
  double v5 = 160.0;
  if (v4) {
    double v5 = v3;
  }
  double v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkEditButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_lockupImageArtworkCatalog));
  sub_34BEC(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkPlaceholder), *(void **)&self->artworkEditButtonHandler[OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkPlaceholder], *(void **)&self->artworkEditButtonHandler[OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkPlaceholder+ 8], *(void **)&self->lockupImageArtworkCatalog[OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkPlaceholder]);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkContainerView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkCameraImageView);
}

@end