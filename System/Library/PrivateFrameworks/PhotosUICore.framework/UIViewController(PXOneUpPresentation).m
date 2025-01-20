@interface UIViewController(PXOneUpPresentation)
+ (uint64_t)_px_prepareClassForOneUpPresentation;
- (PXOneUpPresentation)px_oneUpPresentation;
- (id)px_oneUpPresentationProxy;
- (uint64_t)_pxswizzled_oneUpPresentation_viewDidAppear:()PXOneUpPresentation;
- (uint64_t)_pxswizzled_oneUpPresentation_viewIsAppearing:()PXOneUpPresentation;
- (uint64_t)_pxswizzled_oneUpPresentation_viewWillAppear:()PXOneUpPresentation;
- (uint64_t)px_oneUpPresentationStyle;
- (void)_pxswizzled_oneUpPresentation_viewDidDisappear:()PXOneUpPresentation;
- (void)_pxswizzled_oneUpPresentation_viewWillDisappear:()PXOneUpPresentation;
- (void)px_enableOneUpPresentation;
- (void)px_enableOneUpPresentationFromViewController:()PXOneUpPresentation;
- (void)px_setOneUpPresentationProxy:()PXOneUpPresentation;
- (void)px_setOneUpPresentationStyle:()PXOneUpPresentation;
@end

@implementation UIViewController(PXOneUpPresentation)

- (uint64_t)_pxswizzled_oneUpPresentation_viewIsAppearing:()PXOneUpPresentation
{
  v5 = objc_msgSend(a1, "px_oneUpPresentation");
  [v5 presentingViewControllerViewIsAppearing:a3];

  v6 = objc_msgSend(a1, "px_oneUpPresentationProxy");
  [v6 presentingViewControllerViewIsAppearing:a3];

  return objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewIsAppearing:", a3);
}

- (uint64_t)_pxswizzled_oneUpPresentation_viewDidAppear:()PXOneUpPresentation
{
  objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewDidAppear:");
  v5 = objc_msgSend(a1, "px_oneUpPresentation");
  [v5 presentingViewControllerViewDidAppear:a3];

  v6 = objc_msgSend(a1, "px_oneUpPresentationProxy");
  [v6 presentingViewControllerViewDidAppear:a3];

  return objc_msgSend(a1, "px_setOneUpPresentationProxy:", 0);
}

- (id)px_oneUpPresentationProxy
{
  return objc_getAssociatedObject(a1, sel_px_oneUpPresentationProxy);
}

- (PXOneUpPresentation)px_oneUpPresentation
{
  objc_getAssociatedObject(a1, (const void *)PXOneUpPresentationAssocationKey);
  v2 = (PXOneUpPresentation *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = [[PXOneUpPresentation alloc] initWithPresentingViewController:a1];
    objc_setAssociatedObject(a1, (const void *)PXOneUpPresentationAssocationKey, v2, (void *)1);
  }
  return v2;
}

- (uint64_t)_pxswizzled_oneUpPresentation_viewWillAppear:()PXOneUpPresentation
{
  v5 = objc_msgSend(a1, "px_oneUpPresentation");
  [v5 presentingViewControllerViewWillAppear:a3];

  v6 = objc_msgSend(a1, "px_oneUpPresentationProxy");
  [v6 presentingViewControllerViewWillAppear:a3];

  return objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewWillAppear:", a3);
}

- (void)px_enableOneUpPresentation
{
  objc_msgSend((id)objc_opt_class(), "_px_prepareClassForOneUpPresentation");
  objc_msgSend(a1, "px_oneUpPresentation");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setEnabled:1];
  [v2 _updateImplementationDelegate];
}

- (void)px_setOneUpPresentationProxy:()PXOneUpPresentation
{
  id value = a3;
  objc_msgSend((id)objc_opt_class(), "_px_prepareClassForOneUpPresentation");
  objc_setAssociatedObject(a1, sel_px_oneUpPresentationProxy, value, (void *)1);
}

+ (uint64_t)_px_prepareClassForOneUpPresentation
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = PXOneUpPresentationContext;
  return objc_msgSend(a1, "px_swizzleOnceAsSubclassOfClass:context:usingBlock:", v2, v3, &__block_literal_global_207367);
}

- (void)_pxswizzled_oneUpPresentation_viewDidDisappear:()PXOneUpPresentation
{
  objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewDidDisappear:");
  v5 = objc_msgSend(a1, "px_oneUpPresentation");
  [v5 presentingViewControllerViewDidDisappear:a3];

  objc_msgSend(a1, "px_oneUpPresentationProxy");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 presentingViewControllerViewDidDisappear:a3];
}

- (void)_pxswizzled_oneUpPresentation_viewWillDisappear:()PXOneUpPresentation
{
  objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewWillDisappear:");
  v5 = objc_msgSend(a1, "px_oneUpPresentation");
  [v5 presentingViewControllerViewWillDisappear:a3];

  objc_msgSend(a1, "px_oneUpPresentationProxy");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 presentingViewControllerViewWillDisappear:a3];
}

- (void)px_setOneUpPresentationStyle:()PXOneUpPresentation
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_px_oneUpPresentationStyle, v2, (void *)1);
}

- (uint64_t)px_oneUpPresentationStyle
{
  v1 = objc_getAssociatedObject(a1, sel_px_oneUpPresentationStyle);
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)px_enableOneUpPresentationFromViewController:()PXOneUpPresentation
{
  id v13 = a3;
  v5 = objc_getAssociatedObject(a1, (const void *)PXOneUpPresentationAssocationKey);

  if (v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PXOneUpPresentation.m", 901, @"-px_enableOneUpPresentationFromViewController: called after one up presentation was already enabled for %@. This is not supported, see <rdar://problem/42023978> for details.", a1 object file lineNumber description];
  }
  id v6 = objc_msgSend(v13, "px_oneUpPresentation");
  char v7 = [v6 isEnabled];

  if ((v7 & 1) == 0) {
    objc_msgSend(v13, "px_enableOneUpPresentation");
  }
  v8 = objc_msgSend(v13, "px_oneUpPresentation");
  v9 = [v8 originalPresentingViewController];

  if (v9)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [v8 originalPresentingViewController];
    [v11 handleFailureInMethod:a2, a1, @"PXOneUpPresentation.m", 906, @"-px_enableOneUpPresentationFromViewController: called with parameter %@ whose one up presentation was originally enabled for a different presenting view controller that is still alive (%@). This is not supported, see <rdar://problem/42023978> for details.", v13, v12 object file lineNumber description];
  }
  [v8 setOriginalPresentingViewController:a1];
  objc_setAssociatedObject(a1, (const void *)PXOneUpPresentationAssocationKey, v8, (void *)1);
}

@end