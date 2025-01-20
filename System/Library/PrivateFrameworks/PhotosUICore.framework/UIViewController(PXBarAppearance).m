@interface UIViewController(PXBarAppearance)
+ (uint64_t)_px_prepareClassForBarAppearance;
- (PXBarAppearance)px_barAppearance;
- (uint64_t)_pxswizzled_barAppearance_preferredStatusBarStyle;
- (uint64_t)_pxswizzled_barAppearance_preferredStatusBarUpdateAnimation;
- (uint64_t)_pxswizzled_barAppearance_prefersStatusBarHidden;
- (void)_pxswizzled_barAppearance_viewDidDisappear:()PXBarAppearance;
- (void)_pxswizzled_barAppearance_viewIsAppearing:()PXBarAppearance;
- (void)_pxswizzled_barAppearance_viewWillAppear:()PXBarAppearance;
- (void)px_enableBarAppearance;
- (void)px_enablePrefersViewIsAppearingForAppearanceUpdates;
@end

@implementation UIViewController(PXBarAppearance)

- (void)_pxswizzled_barAppearance_viewIsAppearing:()PXBarAppearance
{
  objc_msgSend(a1, "_pxswizzled_barAppearance_viewIsAppearing:");
  objc_msgSend(a1, "px_barAppearance");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 viewControllerViewIsAppearing:a3];
}

- (void)_pxswizzled_barAppearance_viewWillAppear:()PXBarAppearance
{
  objc_msgSend(a1, "_pxswizzled_barAppearance_viewWillAppear:");
  objc_msgSend(a1, "px_barAppearance");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 viewControllerViewWillAppear:a3];
}

- (PXBarAppearance)px_barAppearance
{
  objc_getAssociatedObject(a1, (const void *)PXBarAppearanceAssocationKey);
  v2 = (PXBarAppearance *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = [[PXBarAppearance alloc] initWithViewController:a1];
    objc_setAssociatedObject(a1, (const void *)PXBarAppearanceAssocationKey, v2, (void *)1);
  }
  return v2;
}

- (void)px_enableBarAppearance
{
  objc_msgSend((id)objc_opt_class(), "_px_prepareClassForBarAppearance");
  objc_msgSend(a1, "px_barAppearance");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setEnabled:1];
}

+ (uint64_t)_px_prepareClassForBarAppearance
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = PXBarAppearanceContext;
  return objc_msgSend(a1, "px_swizzleOnceAsSubclassOfClass:context:usingBlock:", v2, v3, &__block_literal_global_141197);
}

- (uint64_t)_pxswizzled_barAppearance_preferredStatusBarStyle
{
  uint64_t v2 = objc_msgSend(a1, "_pxswizzled_barAppearance_preferredStatusBarStyle");
  uint64_t v3 = objc_msgSend(a1, "px_barAppearance");
  uint64_t v4 = [v3 adjustedPreferredStatusBarStyle:v2];

  return v4;
}

- (uint64_t)_pxswizzled_barAppearance_preferredStatusBarUpdateAnimation
{
  uint64_t v2 = objc_msgSend(a1, "_pxswizzled_barAppearance_preferredStatusBarUpdateAnimation");
  uint64_t v3 = objc_msgSend(a1, "px_barAppearance");
  uint64_t v4 = [v3 adjustedPreferredStatusBarUpdateAnimation:v2];

  return v4;
}

- (uint64_t)_pxswizzled_barAppearance_prefersStatusBarHidden
{
  if (objc_msgSend(a1, "_pxswizzled_barAppearance_prefersStatusBarHidden")) {
    return 1;
  }
  uint64_t v3 = objc_msgSend(a1, "px_barAppearance");
  uint64_t v4 = [v3 adjustedPrefersStatusBarHidden:0];

  return v4;
}

- (void)_pxswizzled_barAppearance_viewDidDisappear:()PXBarAppearance
{
  objc_msgSend(a1, "_pxswizzled_barAppearance_viewDidDisappear:");
  objc_msgSend(a1, "px_barAppearance");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 viewControllerViewDidDisappear:a3];
}

- (void)px_enablePrefersViewIsAppearingForAppearanceUpdates
{
  objc_msgSend(a1, "px_barAppearance");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setPrefersViewIsAppearingForAppearanceUpdates:1];
}

@end