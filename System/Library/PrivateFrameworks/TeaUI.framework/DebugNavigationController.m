@interface DebugNavigationController
- (_TtC5TeaUI25DebugNavigationController)initWithCoder:(id)a3;
- (_TtC5TeaUI25DebugNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC5TeaUI25DebugNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5TeaUI25DebugNavigationController)initWithRootViewController:(id)a3;
@end

@implementation DebugNavigationController

- (_TtC5TeaUI25DebugNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return (_TtC5TeaUI25DebugNavigationController *)DebugNavigationController.init(navigationBarClass:toolbarClass:)(ObjCClassMetadata, v6);
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata();
  return (_TtC5TeaUI25DebugNavigationController *)DebugNavigationController.init(navigationBarClass:toolbarClass:)(ObjCClassMetadata, v6);
}

- (_TtC5TeaUI25DebugNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC5TeaUI25DebugNavigationController *)DebugNavigationController.init(rootViewController:)(a3);
}

- (_TtC5TeaUI25DebugNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1B61B20F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5TeaUI25DebugNavigationController *)DebugNavigationController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC5TeaUI25DebugNavigationController)initWithCoder:(id)a3
{
  return (_TtC5TeaUI25DebugNavigationController *)DebugNavigationController.init(coder:)(a3);
}

@end