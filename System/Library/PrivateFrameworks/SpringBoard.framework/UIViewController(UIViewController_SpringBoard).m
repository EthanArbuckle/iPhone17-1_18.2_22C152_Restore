@interface UIViewController(UIViewController_SpringBoard)
+ (id)sb_firstDescendantOfViewControllers:()UIViewController_SpringBoard passingTest:;
- (SBMutableStatusBarSettings)sb_childOrPresentedViewControllerStatusBarSettings;
- (id)sb_firstDescendantOfClass:()UIViewController_SpringBoard;
- (id)sb_firstDescendantPassingTest:()UIViewController_SpringBoard;
- (uint64_t)sb_beginAppearanceTransitionIfNecessary:()UIViewController_SpringBoard animated:;
- (uint64_t)sb_endAppearanceTransitionIfNecessary;
- (uint64_t)sb_firstDescendantOfClassNamed:()UIViewController_SpringBoard;
@end

@implementation UIViewController(UIViewController_SpringBoard)

- (uint64_t)sb_beginAppearanceTransitionIfNecessary:()UIViewController_SpringBoard animated:
{
  uint64_t result = [a1 isViewLoaded];
  if (result)
  {
    int v8 = [a1 _appearState];
    if (a3)
    {
      if (!v8 || v8 == 3) {
        goto LABEL_5;
      }
    }
    else if ((v8 - 1) <= 1)
    {
LABEL_5:
      [a1 beginAppearanceTransition:a3 animated:a4];
      return 1;
    }
    return 0;
  }
  return result;
}

- (uint64_t)sb_endAppearanceTransitionIfNecessary
{
  uint64_t result = [a1 isViewLoaded];
  if (result)
  {
    if (([a1 _appearState] & 0xFFFFFFFD) == 1)
    {
      [a1 endAppearanceTransition];
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)sb_firstDescendantOfViewControllers:()UIViewController_SpringBoard passingTest:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v7);
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "childViewControllers", (void)v19);
          [v9 addObjectsFromArray:v16];

          v17 = [v15 presentedViewController];
          objc_msgSend(v9, "_sb_safeAddObject:", v17);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      int v8 = objc_msgSend(a1, "sb_firstDescendantOfViewControllers:passingTest:", v9, v7);
    }
    else
    {
      int v8 = 0;
    }
  }
  return v8;
}

- (id)sb_firstDescendantPassingTest:()UIViewController_SpringBoard
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_class();
  v9[0] = a1;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = objc_msgSend(v5, "sb_firstDescendantOfViewControllers:passingTest:", v6, v4);

  return v7;
}

- (id)sb_firstDescendantOfClass:()UIViewController_SpringBoard
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__UIViewController_UIViewController_SpringBoard__sb_firstDescendantOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "sb_firstDescendantPassingTest:", v5);
  return v3;
}

- (uint64_t)sb_firstDescendantOfClassNamed:()UIViewController_SpringBoard
{
  Class v4 = NSClassFromString(aClassName);
  return objc_msgSend(a1, "sb_firstDescendantOfClass:", v4);
}

- (SBMutableStatusBarSettings)sb_childOrPresentedViewControllerStatusBarSettings
{
  v2 = [a1 _effectiveStatusBarStyleViewController];
  uint64_t v3 = [a1 _effectiveStatusBarHiddenViewController];
  Class v4 = (void *)v3;
  if (v2 == a1 && (void *)v3 == a1)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_alloc_init(SBMutableStatusBarSettings);
    int v6 = [v4 _preferredStatusBarVisibility];
    uint64_t v7 = [v2 preferredStatusBarStyle];
    if (v6)
    {
      double v8 = 1.0;
      if (v6 == 1) {
        double v8 = 0.0;
      }
      v9 = [NSNumber numberWithDouble:v8];
      [(SBMutableStatusBarSettings *)v5 setAlpha:v9];
    }
    if (v7 != -1)
    {
      if (v7) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F43228]) initWithStyle:v10];
      [(SBMutableStatusBarSettings *)v5 setLegibilitySettings:v11];
    }
  }

  return v5;
}

@end