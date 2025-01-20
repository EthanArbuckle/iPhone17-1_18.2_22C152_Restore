@interface UIViewController(VideosUICore)
- (BOOL)vuiIsNavigationRoot;
- (id)vuiViewControllerIdentifier;
- (id)vui_initWithCoder:()VideosUICore;
- (id)vui_initWithNibName:()VideosUICore bundle:;
- (uint64_t)vuiIsRTL;
- (uint64_t)vuiShouldAutomaticallyForwardAppearanceMethods;
- (uint64_t)vui_addSubview:()VideosUICore oldView:;
- (uint64_t)vui_requiresLegacyPresentation;
- (uint64_t)vui_setOverrideUserInterfaceStyle:()VideosUICore;
- (unint64_t)vuiOverrideUserInterfaceStyle;
- (unint64_t)vuiUserInterfaceStyle;
- (void)setVuiViewControllerIdentifier:()VideosUICore;
- (void)setVui_requiresLegacyPresentation:()VideosUICore;
- (void)vui_presentedContentSizeChanged:()VideosUICore;
@end

@implementation UIViewController(VideosUICore)

- (void)setVuiViewControllerIdentifier:()VideosUICore
{
}

- (uint64_t)vuiShouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (BOOL)vuiIsNavigationRoot
{
  v2 = [a1 vuiNavigationController];
  v3 = [v2 viewControllers];
  v4 = [v3 firstObject];

  return v4 == a1;
}

- (uint64_t)vui_requiresLegacyPresentation
{
  v1 = objc_getAssociatedObject(a1, &VUIRequiresLegacyPresentationKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setVui_requiresLegacyPresentation:()VideosUICore
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &VUIRequiresLegacyPresentationKey, v2, (void *)1);
}

- (unint64_t)vuiUserInterfaceStyle
{
  v1 = [a1 traitCollection];
  uint64_t v2 = [v1 userInterfaceStyle];

  return +[VUICoreUtilities vuiUserInterfaceStyleForInterfaceStyle:v2];
}

- (unint64_t)vuiOverrideUserInterfaceStyle
{
  uint64_t v1 = [a1 overrideUserInterfaceStyle];
  return +[VUICoreUtilities vuiUserInterfaceStyleForInterfaceStyle:v1];
}

- (uint64_t)vui_setOverrideUserInterfaceStyle:()VideosUICore
{
  if (a3 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a3 == 2);
  }
  return [a1 setOverrideUserInterfaceStyle:v3];
}

- (uint64_t)vuiIsRTL
{
  uint64_t v1 = [a1 vuiView];
  uint64_t v2 = [v1 vuiIsRTL];

  return v2;
}

- (id)vuiViewControllerIdentifier
{
  return objc_getAssociatedObject(a1, &VUIViewControllerIdentifierKey);
}

- (id)vui_initWithNibName:()VideosUICore bundle:
{
  v4 = (void *)[a1 initWithNibName:a3 bundle:a4];
  return v4;
}

- (id)vui_initWithCoder:()VideosUICore
{
  uint64_t v3 = (void *)[a1 initWithCoder:a3];
  return v3;
}

- (void)vui_presentedContentSizeChanged:()VideosUICore
{
  v4 = [a3 view];
  [v4 intrinsicContentSize];
  double v6 = v5;
  double v8 = v7;

  if (round(v6) != 0.0 && round(v8) != 0.0)
  {
    objc_msgSend(a1, "setPreferredContentSize:");
  }
}

- (uint64_t)vui_addSubview:()VideosUICore oldView:
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [a1 vuiView];
  uint64_t v9 = objc_msgSend(v8, "vui_addSubview:oldView:", v7, v6);

  return v9;
}

@end