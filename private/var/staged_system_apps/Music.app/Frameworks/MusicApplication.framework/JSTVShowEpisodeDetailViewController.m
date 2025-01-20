@interface JSTVShowEpisodeDetailViewController
- (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation JSTVShowEpisodeDetailViewController

- (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_tvShowEpisodeDetailView) = 0;
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_artworkCachingReference;
  type metadata accessor for Artwork.CachingReference();
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)swift_allocObject();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_contentItem) = 0;
  id v6 = a3;

  result = (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_187EE8();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1887C4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_18895C(a3);
}

- (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication35JSTVShowEpisodeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_tvShowEpisodeDetail));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_tvShowEpisodeDetailView));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication35JSTVShowEpisodeDetailViewController_contentItem);
}

@end