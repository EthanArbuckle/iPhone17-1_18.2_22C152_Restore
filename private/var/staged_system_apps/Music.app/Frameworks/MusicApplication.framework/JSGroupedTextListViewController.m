@interface JSGroupedTextListViewController
- (_TtC16MusicApplication31JSGroupedTextListViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication31JSGroupedTextListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JSGroupedTextListViewController

- (_TtC16MusicApplication31JSGroupedTextListViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_verticalStackItemPrefersTopHairline) = 1;
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_textDrawingCache;
  type metadata accessor for TextDrawing.Cache();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)TextDrawing.Cache.init()();
  uint64_t v7 = OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_textListView;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)[objc_allocWithZone((Class)type metadata accessor for GroupedTextListView()) initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC16MusicApplication31JSGroupedTextListViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JSGroupedTextListViewController();
  v2 = (char *)v6.receiver;
  [(JSGroupedTextListViewController *)&v6 viewDidLayoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_textListView];
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
  v2 = self;
  sub_248C68();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_249110((uint64_t)a3);
}

- (_TtC16MusicApplication31JSGroupedTextListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication31JSGroupedTextListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_viewModel));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_textListView);
}

@end