@interface FullScreenPodcastView
- (_TtC7Journal21FullScreenPodcastView)initWithCoder:(id)a3;
- (_TtC7Journal21FullScreenPodcastView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenPodcastView

- (_TtC7Journal21FullScreenPodcastView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal21FullScreenPodcastView *)sub_10001F898(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal21FullScreenPodcastView)initWithCoder:(id)a3
{
  return (_TtC7Journal21FullScreenPodcastView *)sub_10001F9BC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal21FullScreenPodcastView_podcastAsset));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal21FullScreenPodcastView_backgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal21FullScreenPodcastView_dropShadowView);
}

@end