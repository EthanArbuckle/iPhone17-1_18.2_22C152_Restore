@interface MarketingItemViewController
- (_TtC8AppStore27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC8AppStore27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC8AppStore27MarketingItemViewController)initWithCoder:(id)a3;
- (_TtC8AppStore27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4;
- (_TtC8AppStore27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8AppStore27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6;
- (_TtC8AppStore27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5;
- (void)viewDidLoad;
@end

@implementation MarketingItemViewController

- (_TtC8AppStore27MarketingItemViewController)initWithCoder:(id)a3
{
  *(void *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_dynamicDelegate] = 0;
  *(void *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_gridPresenter] = 0;
  v4 = &self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_gridView];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  id v5 = a3;

  result = (_TtC8AppStore27MarketingItemViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1005CD824(&qword_10099FCB8);
  v4 = self;
  DynamicViewControllerDisplaying.injectFieldsIntoMetricsOverlay()();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(MarketingItemViewController *)&v5 viewDidLoad];
}

- (_TtC8AppStore27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5
{
  swift_unknownObjectRetain();
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v6 = a5;
  swift_unknownObjectRetain();
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4
{
  uint64_t v4 = type metadata accessor for URL();
  __chkstk_darwin(v4 - 8);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  v3 = *(void **)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_gridView];
}

@end