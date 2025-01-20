@interface SinglePageViewController
- (NSString)description;
- (_TtC5Books24SinglePageViewController)initWithCoder:(id)a3;
- (_TtC5Books24SinglePageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation SinglePageViewController

- (_TtC5Books24SinglePageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10058C3F0();
}

- (NSString)description
{
  v2 = self;
  sub_1005898A8();

  NSString v3 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)loadView
{
  type metadata accessor for AlwaysPassthroughView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = [v3 init];
  [(SinglePageViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100589A78();
}

- (_TtC5Books24SinglePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Books24SinglePageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002F0080((uint64_t)self + OBJC_IVAR____TtC5Books24SinglePageViewController_containerBuilder);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books24SinglePageViewController_pageBackgroundColor));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books24SinglePageViewController_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books24SinglePageViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books24SinglePageViewController_sampleHeaderChromeViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books24SinglePageViewController_titleChromeViewController);
}

@end