@interface UIViewController(TVMLKitAdditions)
- (id)tvIdentifier;
- (void)tv_setIdentifier:()TVMLKitAdditions;
- (void)tv_updateViewLayout;
@end

@implementation UIViewController(TVMLKitAdditions)

- (id)tvIdentifier
{
  return objc_getAssociatedObject(a1, @"TVUIViewControllerKeyIdentifier");
}

- (void)tv_setIdentifier:()TVMLKitAdditions
{
}

- (void)tv_updateViewLayout
{
  objc_msgSend(a1, "tv_associatedIKViewElement");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = [a1 view];
    [v2 transferLayoutStylesFromElement:v4];

    v3 = [a1 view];
    [v3 setNeedsLayout];
  }
}

@end