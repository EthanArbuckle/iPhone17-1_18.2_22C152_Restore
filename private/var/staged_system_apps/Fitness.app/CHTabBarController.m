@interface CHTabBarController
- (unint64_t)supportedInterfaceOrientations;
- (void)setCustomizableViewControllers:(id)a3;
@end

@implementation CHTabBarController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)setCustomizableViewControllers:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CHTabBarController;
  [(CHTabBarController *)&v3 setCustomizableViewControllers:0];
}

@end