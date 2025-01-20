@interface DescriptionTextViewController
- (_TtC16MusicApplication29DescriptionTextViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication29DescriptionTextViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissAnimated;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DescriptionTextViewController

- (_TtC16MusicApplication29DescriptionTextViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29DescriptionTextViewController____lazy_storage___descriptionTextView) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication29DescriptionTextViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2A4FB0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2A5460();
}

- (void)dismissAnimated
{
}

- (_TtC16MusicApplication29DescriptionTextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication29DescriptionTextViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication29DescriptionTextViewController____lazy_storage___descriptionTextView);
}

@end