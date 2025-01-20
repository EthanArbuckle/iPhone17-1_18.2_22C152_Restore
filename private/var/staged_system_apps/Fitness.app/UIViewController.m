@interface UIViewController
- (id)ch_rootViewController;
@end

@implementation UIViewController

- (id)ch_rootViewController
{
  v2 = [(UIViewController *)self parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    [v2 ch_rootViewController];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

@end