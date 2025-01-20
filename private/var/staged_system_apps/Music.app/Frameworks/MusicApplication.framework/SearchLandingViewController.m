@interface SearchLandingViewController
- (_TtC16MusicApplication27SearchLandingViewController)init;
- (_TtC16MusicApplication27SearchLandingViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication27SearchLandingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation SearchLandingViewController

- (_TtC16MusicApplication27SearchLandingViewController)init
{
  return (_TtC16MusicApplication27SearchLandingViewController *)sub_7895C();
}

- (_TtC16MusicApplication27SearchLandingViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController____lazy_storage___accountButton) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController_availabilityBinding) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController_landingDrivenViewController) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication27SearchLandingViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_78EDC();
}

- (_TtC16MusicApplication27SearchLandingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication27SearchLandingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController____lazy_storage___accountButton));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController_landingDrivenViewController);
}

@end