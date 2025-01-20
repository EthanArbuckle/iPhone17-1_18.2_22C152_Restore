@interface UIViewController(SBIconViewCustomImageViewControllerConveniences)
- (id)sbh_owningIconView;
- (id)sbh_pushOwningIconView:()SBIconViewCustomImageViewControllerConveniences;
- (id)sbh_removeOwningIconView:()SBIconViewCustomImageViewControllerConveniences;
@end

@implementation UIViewController(SBIconViewCustomImageViewControllerConveniences)

- (id)sbh_pushOwningIconView:()SBIconViewCustomImageViewControllerConveniences
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, &SBHIconViewCustomViewControllerOwningIconViewsKey);
  [v5 compact];
  v6 = objc_msgSend(v5, "sbh_lastPointer");
  if (!v5)
  {
    v5 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    objc_setAssociatedObject(a1, &SBHIconViewCustomViewControllerOwningIconViewsKey, v5, (void *)1);
  }
  if (objc_msgSend(v5, "sbh_indexOfPointer:", v4) == 0x7FFFFFFFFFFFFFFFLL) {
    [v5 addPointer:v4];
  }

  return v6;
}

- (id)sbh_removeOwningIconView:()SBIconViewCustomImageViewControllerConveniences
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, &SBHIconViewCustomViewControllerOwningIconViewsKey);
  objc_msgSend(v5, "sbh_removePointer:", v4);

  [v5 compact];
  v6 = objc_msgSend(v5, "sbh_lastPointer");

  return v6;
}

- (id)sbh_owningIconView
{
  v1 = objc_getAssociatedObject(a1, &SBHIconViewCustomViewControllerOwningIconViewsKey);
  [v1 compact];
  v2 = objc_msgSend(v1, "sbh_lastPointer");

  return v2;
}

@end