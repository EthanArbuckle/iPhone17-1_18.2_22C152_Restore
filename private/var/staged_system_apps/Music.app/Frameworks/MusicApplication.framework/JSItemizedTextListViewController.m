@interface JSItemizedTextListViewController
- (_TtC16MusicApplication32JSItemizedTextListViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication32JSItemizedTextListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JSItemizedTextListViewController

- (_TtC16MusicApplication32JSItemizedTextListViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication32JSItemizedTextListViewController_verticalStackItemPrefersTopHairline) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication32JSItemizedTextListViewController_textListView) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication32JSItemizedTextListViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_C31A8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_C3290();
}

- (_TtC16MusicApplication32JSItemizedTextListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication32JSItemizedTextListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32JSItemizedTextListViewController_viewModel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication32JSItemizedTextListViewController_textListView);
}

@end