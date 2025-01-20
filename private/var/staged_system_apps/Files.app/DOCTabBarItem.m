@interface DOCTabBarItem
+ (id)itemWithTab:(unint64_t)a3;
+ (id)tabIdentifierForTab:(unint64_t)a3;
- (NSString)description;
- (NSString)displayTitle;
- (NSString)tabIdentifier;
- (_TtC5Files13DOCTabBarItem)init;
- (_TtC5Files13DOCTabBarItem)initWithCoder:(id)a3;
- (id)floatingSwitcherActionRepresentationWithHandler:(id)a3;
- (unint64_t)tab;
- (void)setTab:(unint64_t)a3;
@end

@implementation DOCTabBarItem

- (_TtC5Files13DOCTabBarItem)init
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab) = (Class)2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCTabBarItem();
  return [(DOCTabBarItem *)&v3 init];
}

+ (id)itemWithTab:(unint64_t)a3
{
  objc_super v3 = (void *)_s5Files13DOCTabBarItemC4item3tabACSo0B0V_tFZ_0(a3);

  return v3;
}

- (unint64_t)tab
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab);
  swift_beginAccess();
  return *v2;
}

- (void)setTab:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (NSString)tabIdentifier
{
  objc_super v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (!*v3 || v4 == 2 || v4 == 1)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {
    type metadata accessor for DOCTab(0);
    v7 = self;
    result = (NSString *)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
    __break(1u);
  }
  return result;
}

+ (id)tabIdentifierForTab:(unint64_t)a3
{
  if (!a3 || a3 == 2 || a3 == 1)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    type metadata accessor for DOCTab(0);
    id result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
    __break(1u);
  }
  return result;
}

- (id)floatingSwitcherActionRepresentationWithHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  id result = [(DOCTabBarItem *)v6 _internalTitle];
  if (result)
  {
    id v8 = result;
    sub_10009E6C4(0, (unint64_t *)&qword_100706740);
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_100110374;
    *(void *)(v9 + 24) = v5;
    v10 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)description
{
  v2 = self;
  DOCTabBarItem.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)displayTitle
{
  v2 = self;
  id v3 = [(DOCTabBarItem *)v2 _internalTitle];
  if (v3)
  {
    uint64_t v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (_TtC5Files13DOCTabBarItem)initWithCoder:(id)a3
{
  id result = (_TtC5Files13DOCTabBarItem *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end