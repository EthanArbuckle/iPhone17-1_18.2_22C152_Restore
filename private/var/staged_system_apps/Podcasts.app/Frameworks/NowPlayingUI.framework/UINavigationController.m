@interface UINavigationController
- (id)removeViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation UINavigationController

- (id)removeViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  v8 = (void *)UINavigationController.removeViewController(_:animated:)((UIViewController)v6, a4);

  return v8;
}

@end