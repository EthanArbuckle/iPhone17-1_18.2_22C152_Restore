@interface UISplitViewController
- (UIViewController)mt_detailViewController;
- (UIViewController)mt_masterViewController;
@end

@implementation UISplitViewController

- (UIViewController)mt_masterViewController
{
  v2 = [(UISplitViewController *)self viewControllers];
  v3 = [v2 firstObject];

  return (UIViewController *)v3;
}

- (UIViewController)mt_detailViewController
{
  v3 = [(UISplitViewController *)self viewControllers];
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    v6 = 0;
  }
  else
  {
    v5 = [(UISplitViewController *)self viewControllers];
    v6 = [v5 objectAtIndexedSubscript:1];
  }

  return (UIViewController *)v6;
}

@end