@interface JSBadgingViewController
- (_TtC16MusicApplication23JSBadgingViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication23JSBadgingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JSBadgingViewController

- (_TtC16MusicApplication23JSBadgingViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication23JSBadgingViewController_badgingView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for BadgingView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC16MusicApplication23JSBadgingViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_34DF4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_34F64();
}

- (_TtC16MusicApplication23JSBadgingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication23JSBadgingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSBadgingViewController_badgingViewModel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication23JSBadgingViewController_badgingView);
}

@end