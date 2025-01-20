@interface JSTabViewController
- (_TtC16MusicApplication19JSTabViewController)init;
- (_TtC16MusicApplication19JSTabViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation JSTabViewController

- (_TtC16MusicApplication19JSTabViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication19JSTabViewController____lazy_storage___accountButton) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication19JSTabViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  JSTabViewController.viewDidLoad()();
}

- (_TtC16MusicApplication19JSTabViewController)init
{
  result = (_TtC16MusicApplication19JSTabViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19JSTabViewController____lazy_storage___accountButton));

  swift_bridgeObjectRelease();
}

@end