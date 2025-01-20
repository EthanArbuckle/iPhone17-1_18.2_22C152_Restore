@interface UIViewController(SBUISystemApertureElementContextProviding)
- (id)systemApertureElementContext;
@end

@implementation UIViewController(SBUISystemApertureElementContextProviding)

- (id)systemApertureElementContext
{
  v2 = [a1 viewIfLoaded];
  v3 = [v2 systemApertureElementContext];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)UIViewController_0;
    objc_msgSendSuper2(&v8, sel_systemApertureElementContext);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end