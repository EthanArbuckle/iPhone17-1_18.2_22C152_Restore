@interface FMPageViewController
- (_TtC6FindMy20FMPageViewController)initWithCoder:(id)a3;
- (_TtC6FindMy20FMPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (void)viewDidLoad;
@end

@implementation FMPageViewController

- (_TtC6FindMy20FMPageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMPageViewController_pages) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC6FindMy20FMPageViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100138B1C();
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_1001392C4((uint64_t)v7);

  return v9;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_100139398((uint64_t)v7);

  return v9;
}

- (_TtC6FindMy20FMPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy20FMPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMPageViewController_pageViewController));

  swift_bridgeObjectRelease();
}

@end