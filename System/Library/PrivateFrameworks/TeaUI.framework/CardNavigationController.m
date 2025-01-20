@interface CardNavigationController
- (_TtC5TeaUI24CardNavigationController)initWithCoder:(id)a3;
- (_TtC5TeaUI24CardNavigationController)initWithRootViewController:(id)a3;
- (_TtC5TeaUI24CardNavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidLoad;
@end

@implementation CardNavigationController

- (_TtC5TeaUI24CardNavigationController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  CardNavigationController.viewDidLoad()();
}

- (_TtC5TeaUI24CardNavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4
{
  id v4 = a3;
  CardNavigationController.init(rootViewController:navigationBarClass:)();
}

- (_TtC5TeaUI24CardNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  CardNavigationController.init(rootViewController:)();
}

- (void).cxx_destruct
{
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  v7 = (UINavigationController *)a3;
  v8 = (UIViewController *)a4;
  v9 = self;
  CardNavigationController.navigationController(_:willShow:animated:)(v7, v8, 0);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v10 = self;
  CardNavigationController.navigationController(_:didShow:animated:)(&v10->super.super.super, v9, 0);
}

@end