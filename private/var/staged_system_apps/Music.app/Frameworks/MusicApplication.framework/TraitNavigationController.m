@interface TraitNavigationController
- (_TtC16MusicApplication25TraitNavigationController)initWithCoder:(id)a3;
- (_TtC16MusicApplication25TraitNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC16MusicApplication25TraitNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC16MusicApplication25TraitNavigationController)initWithRootViewController:(id)a3;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (void)presentViewControllerIfNeeded:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5;
- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4;
@end

@implementation TraitNavigationController

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
}

- (void)pushViewController:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_3B88FC((uint64_t)v8, a4, a5);
}

- (void)presentViewControllerIfNeeded:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_3B8B38(v8, (uint64_t)a4, a5);
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = sub_3B9320((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_3B958C(v6, a4);
}

- (_TtC16MusicApplication25TraitNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TraitNavigationController();
  return [(TraitNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC16MusicApplication25TraitNavigationController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TraitNavigationController();
  return [(TraitNavigationController *)&v5 initWithRootViewController:a3];
}

- (_TtC16MusicApplication25TraitNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_AB6510();
    id v6 = a4;
    NSString v7 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TraitNavigationController();
  id v9 = [(TraitNavigationController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC16MusicApplication25TraitNavigationController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TraitNavigationController();
  id v4 = a3;
  objc_super v5 = [(TraitNavigationController *)&v7 initWithCoder:v4];

  return v5;
}

@end