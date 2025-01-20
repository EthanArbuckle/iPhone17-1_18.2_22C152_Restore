@interface UIViewController(NUNavigationControl)
- (id)navigationControl;
@end

@implementation UIViewController(NUNavigationControl)

- (id)navigationControl
{
  v2 = [a1 parentViewController];
  v3 = [a1 parentViewController];
  int v4 = [v3 conformsToProtocol:&unk_26D4C0860];

  if (!v4 || (id v5 = v2) == 0)
  {
    id v5 = [v2 navigationControl];
  }

  return v5;
}

@end