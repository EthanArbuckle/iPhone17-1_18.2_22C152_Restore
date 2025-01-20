@interface FlowNavigationController
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC23ShelfKitCollectionViews24FlowNavigationController)init;
- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithRootViewController:(id)a3;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FlowNavigationController

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)init
{
  return (_TtC23ShelfKitCollectionViews24FlowNavigationController *)FlowNavigationController.init()();
}

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_macNavigationBar);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_flowController;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_actionRunner);
  void *v6 = 0;
  v6[1] = 0;
  id v7 = a3;

  result = (_TtC23ShelfKitCollectionViews24FlowNavigationController *)sub_385890();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  [(FlowNavigationController *)&v7 viewDidLoad];
  id v3 = [v2 navigationBar];
  id v4 = [v2 view];
  if (v4)
  {
    v5 = v4;
    [v4 bounds];

    sub_37BF00();
    sub_37BF20();
    [v3 setLayoutMargins:0.0 v6, 0.0, v6];
  }
  else
  {
    __break(1u);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v4 = v10.receiver;
  id v5 = a3;
  [(FlowNavigationController *)&v10 traitCollectionDidChange:v5];
  id v6 = [v4 navigationBar];
  id v7 = [v4 view];
  if (v7)
  {
    v8 = v7;
    [v7 bounds];

    sub_37BF00();
    sub_37BF20();
    [v6 setLayoutMargins:0.0 v9, 0.0, v9];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = v10.receiver;
  -[FlowNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  id v8 = [v7 navigationBar];
  sub_37BF00();
  sub_37BF20();
  [v8 setLayoutMargins:0.0, v9, 0.0, v9];
  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  id v5 = [(FlowNavigationController *)v4 navigationBar];
  id v6 = [(FlowNavigationController *)v4 view];
  if (v6)
  {
    id v7 = v6;
    [v6 bounds];

    sub_37BF00();
    sub_37BF20();
    [v5 setLayoutMargins:0.0, v8, 0.0, v8];

    v9.receiver = v4;
    v9.super_class = ObjectType;
    [(FlowNavigationController *)&v9 viewWillLayoutSubviews];
  }
  else
  {
    __break(1u);
  }
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  id v2 = [(FlowNavigationController *)self topViewController];

  return (UIViewController *)v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  id v5 = [(FlowNavigationController *)v4 topViewController];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 supportedInterfaceOrientations];
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = ObjectType;
    id v7 = [(FlowNavigationController *)&v9 supportedInterfaceOrientations];
  }
  return (unint64_t)v7;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  id v4 = self;
  unint64_t v5 = (unint64_t)FlowNavigationController.popToRootViewController(animated:)(a3);

  if (v5)
  {
    sub_2E66C(0, (unint64_t *)&qword_4713F0);
    v6.super.isa = sub_3845E0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }

  return v6.super.isa;
}

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC23ShelfKitCollectionViews24FlowNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC23ShelfKitCollectionViews24FlowNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews24FlowNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_flowController, &qword_473850);

  swift_unknownObjectRelease();
}

@end