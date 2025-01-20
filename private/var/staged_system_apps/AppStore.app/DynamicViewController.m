@interface DynamicViewController
- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4;
- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4;
- (_TtC8AppStore21DynamicViewController)initWithCoder:(id)a3;
- (_TtC8AppStore21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation DynamicViewController

- (_TtC8AppStore21DynamicViewController)initWithCoder:(id)a3
{
  *(void *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_dynamicDelegate] = 0;
  *(void *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_gridPresenter] = 0;
  v4 = &self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_gridView];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  id v5 = a3;

  result = (_TtC8AppStore21DynamicViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_100676BEC(&qword_1009A40F8, v4, (void (*)(uint64_t))type metadata accessor for DynamicViewController);
  id v5 = self;
  DynamicViewControllerDisplaying.injectFieldsIntoMetricsOverlay()();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(DynamicViewController *)&v6 viewDidLoad];
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4
{
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4
{
}

- (_TtC8AppStore21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore21DynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  v3 = *(void **)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_gridView];
}

@end