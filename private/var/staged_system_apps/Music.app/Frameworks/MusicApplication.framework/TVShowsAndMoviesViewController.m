@interface TVShowsAndMoviesViewController
- (_TtC16MusicApplication30TVShowsAndMoviesViewController)init;
- (_TtC16MusicApplication30TVShowsAndMoviesViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication30TVShowsAndMoviesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollView;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVShowsAndMoviesViewController

- (_TtC16MusicApplication30TVShowsAndMoviesViewController)init
{
  return (_TtC16MusicApplication30TVShowsAndMoviesViewController *)sub_934F8();
}

- (_TtC16MusicApplication30TVShowsAndMoviesViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_9566C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_93680();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_93ED4();
}

- (id)contentScrollView
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_selectedViewController) contentScrollView];

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TVShowsAndMoviesViewController();
  id v4 = a3;
  id v5 = v11.receiver;
  [(TVShowsAndMoviesViewController *)&v11 traitCollectionDidChange:v4];
  id v6 = [v5 navigationItem];
  id v7 = [v5 traitCollection];
  uint64_t v8 = sub_2E4ECC();
  uint64_t v10 = v9;

  sub_3B8070(v8, v10);
}

- (_TtC16MusicApplication30TVShowsAndMoviesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication30TVShowsAndMoviesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_showsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_moviesViewController));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_selectedViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_contentOffsetObserver));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController____lazy_storage___segmentedControlContainerView);
}

@end