@interface LemonadeDetailsNavigationController
- (PXPagingViewControllerDelegate)pagingViewControllerDelegate;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithRootViewController:(id)a3;
- (int64_t)pagingViewControllerNumberOfItems;
- (void)setPagingViewControllerDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation LemonadeDetailsNavigationController

- (UIViewController)childViewControllerForStatusBarStyle
{
  id v2 = [(LemonadeDetailsNavigationController *)self topViewController];
  return (UIViewController *)v2;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LemonadeDetailsNavigationController();
  id v2 = v7.receiver;
  [(LemonadeDetailsNavigationController *)&v7 viewDidLoad];
  v3 = self;
  sub_1A9B21070(0, (unint64_t *)&qword_1E981C660);
  id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance, v7.receiver, v7.super_class);
  objc_msgSend(v4, sel_simulatedDetailsViewLoadingDelay);
  double v6 = v5;

  objc_msgSend(v3, sel_sleepForTimeInterval_, v6);
}

- (PXPagingViewControllerDelegate)pagingViewControllerDelegate
{
  id v2 = self;
  id v3 = [(LemonadeDetailsNavigationController *)v2 topViewController];
  if (v3)
  {
    id v4 = v3;
    double v5 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v5)
    {
      id v6 = objc_msgSend(v5, sel_pagingViewControllerDelegate);

      goto LABEL_7;
    }
  }
  else
  {
  }
  id v6 = 0;
LABEL_7:
  return (PXPagingViewControllerDelegate *)v6;
}

- (void)setPagingViewControllerDelegate:(id)a3
{
  id v4 = self;
  swift_unknownObjectRetain();
  id v5 = [(LemonadeDetailsNavigationController *)v4 topViewController];
  if (v5)
  {
    id v6 = v5;
    objc_super v7 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v7) {
      objc_msgSend(v7, sel_setPagingViewControllerDelegate_, a3);
    }

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
}

- (int64_t)pagingViewControllerNumberOfItems
{
  id v2 = self;
  id v3 = [(LemonadeDetailsNavigationController *)v2 topViewController];
  if (!v3)
  {

    return 0;
  }
  id v4 = v3;
  id v5 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (!v5)
  {

    return 0;
  }
  id v6 = objc_msgSend(v5, sel_pagingViewControllerNumberOfItems);

  return (int64_t)v6;
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LemonadeDetailsNavigationController();
  return [(LemonadeDetailsNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LemonadeDetailsNavigationController();
  return [(LemonadeDetailsNavigationController *)&v5 initWithRootViewController:a3];
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1AB23A76C();
    id v6 = a4;
    objc_super v7 = (void *)sub_1AB23A72C();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    objc_super v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LemonadeDetailsNavigationController();
  v9 = [(LemonadeDetailsNavigationController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController *)sub_1AA4103A0(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for LemonadeDetailsNavigationController);
}

@end