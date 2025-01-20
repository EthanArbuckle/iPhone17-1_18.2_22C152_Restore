@interface JSBiographyViewController
- (_TtC16MusicApplication25JSBiographyViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication25JSBiographyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)music_viewInheritedLayoutInsetsDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JSBiographyViewController

- (_TtC16MusicApplication25JSBiographyViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication25JSBiographyViewController_textDrawingCache;
  type metadata accessor for TextDrawing.Cache();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)TextDrawing.Cache.init()();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25JSBiographyViewController____lazy_storage___biographyView) = 0;

  result = (_TtC16MusicApplication25JSBiographyViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JSBiographyViewController();
  id v2 = v6.receiver;
  [(JSBiographyViewController *)&v6 viewDidLayoutSubviews];
  id v3 = sub_34175C();
  id v4 = [v2 view];
  if (v4)
  {
    uint64_t v5 = v4;
    [v4 bounds];
    [v3 setFrame:];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_3410A4();
}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSBiographyViewController();
  id v2 = v3.receiver;
  [(JSBiographyViewController *)&v3 music_viewInheritedLayoutInsetsDidChange];
  sub_341A6C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_34130C(a3);
}

- (_TtC16MusicApplication25JSBiographyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication25JSBiographyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25JSBiographyViewController_viewModel));
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication25JSBiographyViewController____lazy_storage___biographyView);
}

@end