@interface UIResponder(TKExtensions)
- (id)tk_firstViewControllerInResponderChain;
@end

@implementation UIResponder(TKExtensions)

- (id)tk_firstViewControllerInResponderChain
{
  v1 = [a1 nextResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "tk_firstViewControllerInResponderChain");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

@end