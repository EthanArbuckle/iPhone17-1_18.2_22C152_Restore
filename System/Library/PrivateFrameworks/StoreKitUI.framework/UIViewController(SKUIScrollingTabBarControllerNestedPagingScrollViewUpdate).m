@interface UIViewController(SKUIScrollingTabBarControllerNestedPagingScrollViewUpdate)
- (void)setNeedsNestedPagingScrollViewUpdate;
@end

@implementation UIViewController(SKUIScrollingTabBarControllerNestedPagingScrollViewUpdate)

- (void)setNeedsNestedPagingScrollViewUpdate
{
  id v1 = a1;
  id v3 = 0;
  do
  {
    v2 = v3;
    id v3 = v1;

    id v1 = [v3 parentViewController];

    if (!v1) {
      break;
    }
    objc_opt_class();
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);
  [v1 _viewControllerNeedsNestedPagingScrollViewUpdate:v3];
}

@end