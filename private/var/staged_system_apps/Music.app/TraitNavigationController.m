@interface TraitNavigationController
- (_TtC5Music25TraitNavigationController)initWithCoder:(id)a3;
- (_TtC5Music25TraitNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC5Music25TraitNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Music25TraitNavigationController)initWithRootViewController:(id)a3;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4;
@end

@implementation TraitNavigationController

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = sub_10001491C((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = sub_100063814(&qword_1010A3B20);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UITraitOverrides();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  id v11 = a3;
  v12 = self;
  sub_10004F184(v11, (uint64_t)v9, v4);
  sub_1000637B8((uint64_t)v9, &qword_1010A3B20);
}

- (_TtC5Music25TraitNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TraitNavigationController();
  return [(TraitNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = self;
  id v8 = [(TraitNavigationController *)v7 viewControllers];
  sub_100057778(0, (unint64_t *)&qword_101099260);
  unint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(v8) = sub_1003C86A4((uint64_t)v6, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for TraitNavigationController();
  if (v8)
  {
    v12 = v7;
    id v11 = (objc_super *)&v12;
  }
  else
  {
    uint64_t v13 = v7;
    id v11 = (objc_super *)&v13;
  }
  v11->super_class = (Class)v10;
  -[objc_super removeChildViewController:notifyDidMove:](v11, "removeChildViewController:notifyDidMove:", v6, v4, v12);
}

- (_TtC5Music25TraitNavigationController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TraitNavigationController();
  return [(TraitNavigationController *)&v5 initWithRootViewController:a3];
}

- (_TtC5Music25TraitNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TraitNavigationController();
  unint64_t v9 = [(TraitNavigationController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC5Music25TraitNavigationController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TraitNavigationController();
  return [(TraitNavigationController *)&v5 initWithCoder:a3];
}

@end