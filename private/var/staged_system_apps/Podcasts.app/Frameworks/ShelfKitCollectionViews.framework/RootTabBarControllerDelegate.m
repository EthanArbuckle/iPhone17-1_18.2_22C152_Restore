@interface RootTabBarControllerDelegate
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (_TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate)init;
- (id)tabBarController:(id)a3 displayedViewControllersForTab:(id)a4 proposedViewControllers:(id)a5;
- (void)tabBarController:(id)a3 didSelectTab:(id)a4 previousTab:(id)a5;
@end

@implementation RootTabBarControllerDelegate

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_329EF0(v7);

  return v9 & 1;
}

- (void)tabBarController:(id)a3 didSelectTab:(id)a4 previousTab:(id)a5
{
  id v8 = a3;
  id v14 = a4;
  char v9 = self;
  id v10 = a5;
  id v11 = [v14 managingTabGroup];
  if (v11)
  {
    v12 = v11;
    v13 = (_TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate *)[v14 identifier];
    if (!v13)
    {
      sub_3843C0();
      v13 = (_TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate *)sub_384380();
      swift_bridgeObjectRelease();
    }
    [v12 setDefaultChildIdentifier:v13];

    char v9 = v13;
  }
  else
  {
    v12 = v10;
  }
}

- (id)tabBarController:(id)a3 displayedViewControllersForTab:(id)a4 proposedViewControllers:(id)a5
{
  sub_2E66C(0, (unint64_t *)&qword_4713F0);
  unint64_t v8 = sub_3845F0();
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  _s23ShelfKitCollectionViews28RootTabBarControllerDelegateC03tabgH0_27displayedViewControllersFor08proposedlM0SaySo06UIViewH0CGSo05UITabgH0C_So0Q0CAItF_0(v9, (uint64_t)v10, v8);

  swift_bridgeObjectRelease();
  v12.super.isa = sub_3845E0().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (_TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate)init
{
  result = (_TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end