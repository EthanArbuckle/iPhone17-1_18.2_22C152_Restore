@interface UIViewController(PhotosUI)
+ (id)pu_currentViewControllerStack;
- (BOOL)pu_isPresenting;
- (uint64_t)_pu_updateStatusBarVisibilityWithAnimationSettings:()PhotosUI;
- (uint64_t)pu_navigationBarTintColor;
- (uint64_t)pu_preferredStatusBarUpdateAnimation;
- (uint64_t)pu_scrollToInitialPositionAnimated:()PhotosUI;
- (uint64_t)pu_wantsNavigationBarVisible;
- (uint64_t)pu_wantsTabBarVisible;
- (uint64_t)pu_wantsToolbarVisible;
- (void)_pu_performBarsVisibilityUpdatesWithAnimationSettings:()PhotosUI isStatusBarHidden:;
- (void)_pu_setNavigationBarTintColor:()PhotosUI withAnimationSettings:;
- (void)_pu_setNavigationBarVisible:()PhotosUI withAnimationSettings:;
- (void)_pu_setPreferredStatusBarUpdateAnimation:()PhotosUI;
- (void)_pu_setTabBarVisible:()PhotosUI withAnimationSettings:;
- (void)_pu_setToolbarVisible:()PhotosUI withAnimationSettings:;
- (void)pu_performBarsVisibilityUpdatesWithAnimationSettings:()PhotosUI;
- (void)pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:()PhotosUI;
@end

@implementation UIViewController(PhotosUI)

- (BOOL)pu_isPresenting
{
  v1 = [a1 presentedViewController];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)pu_scrollToInitialPositionAnimated:()PhotosUI
{
  return 0;
}

- (void)_pu_setPreferredStatusBarUpdateAnimation:()PhotosUI
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"PUPreferredStatusBarUpdateAnimationAssociationKey", v2, (void *)1);
}

- (void)_pu_setTabBarVisible:()PhotosUI withAnimationSettings:
{
  if (a4 == 1) {
    unsigned int v7 = 6;
  }
  else {
    unsigned int v7 = 0;
  }
  if (a4 == 2) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = v7;
  }
  id v11 = [a1 tabBarController];
  v9 = [v11 contentScrollView];
  uint64_t v10 = [v9 _isAutomaticContentOffsetAdjustmentEnabled];
  [v9 _setAutomaticContentOffsetAdjustmentEnabled:0];
  if (a3) {
    [v11 showBarWithTransition:v8 duration:*(double *)&a5];
  }
  else {
    [v11 hideBarWithTransition:v8 duration:*(double *)&a5];
  }
  [v9 _setAutomaticContentOffsetAdjustmentEnabled:v10];
}

- (void)_pu_setToolbarVisible:()PhotosUI withAnimationSettings:
{
  id v16 = [a1 navigationController];
  BOOL v8 = [v16 isToolbarHidden] == a3;
  v9 = v16;
  if (v8)
  {
    double v10 = *(double *)&a5;
    id v11 = [v16 contentScrollView];
    uint64_t v12 = [v11 _isAutomaticContentOffsetAdjustmentEnabled];
    [v11 _setAutomaticContentOffsetAdjustmentEnabled:0];
    if (a4 == 2)
    {
      uint64_t v13 = a3 ^ 1u;
      v14 = v16;
      uint64_t v15 = 4;
    }
    else
    {
      if (a4 != 1)
      {
        if (!a4) {
          [v16 setToolbarHidden:a3 ^ 1u animated:0];
        }
        goto LABEL_10;
      }
      uint64_t v13 = a3 ^ 1u;
      v14 = v16;
      uint64_t v15 = 15;
    }
    [v14 _setToolbarHidden:v13 edge:v15 duration:v10];
LABEL_10:
    [v11 _setAutomaticContentOffsetAdjustmentEnabled:v12];

    v9 = v16;
  }
}

- (void)_pu_setNavigationBarTintColor:()PhotosUI withAnimationSettings:
{
  id v8 = a3;
  v9 = [a1 navigationController];
  double v10 = [v9 navigationBar];

  uint64_t v11 = [v10 tintColor];
  if ((id)v11 == v8)
  {
  }
  else
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [v10 tintColor];
    char v14 = [v13 isEqual:v8];

    if ((v14 & 1) == 0)
    {
      if (a4)
      {
        double v15 = *(double *)&a5;
        id v16 = (void *)MEMORY[0x1E4FB1EB0];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __82__UIViewController_PhotosUI___pu_setNavigationBarTintColor_withAnimationSettings___block_invoke;
        v19[3] = &unk_1E5F2ECC8;
        id v20 = v10;
        id v21 = v8;
        [v16 animateWithDuration:v19 animations:v15];
      }
      else if (v8)
      {
        [v10 setTintColor:v8];
      }
      else
      {
        v17 = [MEMORY[0x1E4FB19D0] appearance];
        v18 = [v17 tintColor];
        [v10 setTintColor:v18];
      }
    }
  }
}

- (void)_pu_setNavigationBarVisible:()PhotosUI withAnimationSettings:
{
  id v12 = [a1 navigationController];
  BOOL v8 = [v12 isNavigationBarHidden] == a3;
  v9 = v12;
  if (v8)
  {
    if (a4 == 2)
    {
      uint64_t v10 = a3 ^ 1u;
      uint64_t v11 = 1;
    }
    else
    {
      if (a4 != 1)
      {
        if (a4) {
          goto LABEL_11;
        }
        objc_msgSend(v12, "setNavigationBarHidden:animated:", a3 ^ 1u, 0, *(double *)&a5);
        goto LABEL_10;
      }
      uint64_t v10 = a3 ^ 1u;
      uint64_t v11 = 15;
    }
    [v12 _setNavigationBarHidden:v10 edge:v11 duration:*(double *)&a5];
LABEL_10:
    v9 = v12;
  }
LABEL_11:
}

- (uint64_t)_pu_updateStatusBarVisibilityWithAnimationSettings:()PhotosUI
{
  uint64_t v5 = 1;
  if (a3 == 2) {
    uint64_t v5 = 2;
  }
  if (a3) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  objc_msgSend(a1, "_pu_setPreferredStatusBarUpdateAnimation:", v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__UIViewController_PhotosUI___pu_updateStatusBarVisibilityWithAnimationSettings___block_invoke;
  v9[3] = &unk_1E5F2ED10;
  v9[4] = a1;
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:*(double *)&a4];
}

- (void)_pu_performBarsVisibilityUpdatesWithAnimationSettings:()PhotosUI isStatusBarHidden:
{
  int v9 = [a1 prefersStatusBarHidden];
  uint64_t v10 = objc_msgSend(a1, "pu_wantsNavigationBarVisible");
  unsigned int v15 = objc_msgSend(a1, "pu_wantsToolbarVisible");
  uint64_t v11 = objc_msgSend(a1, "pu_wantsTabBarVisible");
  objc_msgSend(a1, "pu_navigationBarTintColor");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [a1 navigationController];
  int v13 = [v12 isNavigationBarHidden];
  uint64_t v14 = [v12 _useStandardStatusBarHeight];
  if (v9 != a5 && v10 == v13 && v9 != v10) {
    [v12 _setUseStandardStatusBarHeight:1];
  }
  if (v9)
  {
    objc_msgSend(a1, "_pu_updateStatusBarVisibilityWithAnimationSettings:", a3, a4);
    objc_msgSend(a1, "_pu_setNavigationBarVisible:withAnimationSettings:", v10, a3, a4);
    objc_msgSend(a1, "_pu_setNavigationBarTintColor:withAnimationSettings:", v16, a3, a4);
    objc_msgSend(a1, "_pu_setTabBarVisible:withAnimationSettings:", v11, a3, a4);
    objc_msgSend(a1, "_pu_setToolbarVisible:withAnimationSettings:", v15, a3, a4);
  }
  else
  {
    objc_msgSend(a1, "_pu_setNavigationBarVisible:withAnimationSettings:", v10, a3, a4);
    objc_msgSend(a1, "_pu_setNavigationBarTintColor:withAnimationSettings:", v16, a3, a4);
    objc_msgSend(a1, "_pu_setTabBarVisible:withAnimationSettings:", v11, a3, a4);
    objc_msgSend(a1, "_pu_setToolbarVisible:withAnimationSettings:", v15, a3, a4);
    objc_msgSend(a1, "_pu_updateStatusBarVisibilityWithAnimationSettings:", a3, a4);
  }
  [v12 _setUseStandardStatusBarHeight:v14];
}

- (void)pu_performBarsVisibilityUpdatesWithAnimationSettings:()PhotosUI
{
  int v7 = objc_msgSend(a1, "px_isVisible");
  id v13 = [a1 navigationController];
  BOOL v8 = [v13 topViewController];

  if (v13) {
    BOOL v9 = v8 == a1;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = v9;
  if (v7 && v10)
  {
    uint64_t v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v12 = [v11 isStatusBarHidden];

    objc_msgSend(a1, "_pu_performBarsVisibilityUpdatesWithAnimationSettings:isStatusBarHidden:", a3, a4, v12);
  }
}

- (uint64_t)pu_preferredStatusBarUpdateAnimation
{
  v1 = objc_getAssociatedObject(a1, @"PUPreferredStatusBarUpdateAnimationAssociationKey");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:()PhotosUI
{
  uint64_t v5 = objc_msgSend(a1, "pu_navigationController");
  [v5 viewController:a1 willSetupInitialBarsVisibilityOnViewWillAppearAnimated:a3];

  id v13 = [a1 transitionCoordinator];
  if ([v13 isCancelled])
  {
    uint64_t v6 = objc_msgSend(a1, "pu_navigationBarTintColor");
    objc_msgSend(a1, "_pu_setNavigationBarTintColor:withAnimationSettings:", v6, 0, 0);
  }
  else
  {
    if (a3)
    {
      [v13 transitionDuration];
      uint64_t v8 = v7;
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
    int v10 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v11 = [v10 isStatusBarHidden];

    uint64_t v12 = [a1 navigationController];
    uint64_t v6 = objc_msgSend(v12, "pu_currentNavigationTransition");

    if (v6) {
      uint64_t v11 = [v6 wasStatusBarHiddenBeforeTransition];
    }
    objc_msgSend(a1, "_pu_performBarsVisibilityUpdatesWithAnimationSettings:isStatusBarHidden:", v9, v8, v11);
  }
}

- (uint64_t)pu_navigationBarTintColor
{
  return 0;
}

- (uint64_t)pu_wantsTabBarVisible
{
  v1 = objc_msgSend(a1, "px_barAppearance");
  if ([v1 isEnabled]) {
    uint64_t v2 = [v1 prefersTabBarVisible];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

- (uint64_t)pu_wantsToolbarVisible
{
  v1 = objc_msgSend(a1, "px_barAppearance");
  if ([v1 isEnabled]) {
    uint64_t v2 = [v1 prefersToolbarVisible];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)pu_wantsNavigationBarVisible
{
  v1 = objc_msgSend(a1, "px_barAppearance");
  if ([v1 isEnabled]) {
    uint64_t v2 = [v1 prefersNavigationBarVisible];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

+ (id)pu_currentViewControllerStack
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (pu_currentViewControllerStack_onceToken != -1) {
    dispatch_once(&pu_currentViewControllerStack_onceToken, &__block_literal_global_104362);
  }
  v0 = [(id)pu_currentViewControllerStack_window rootViewController];
  uint64_t v1 = objc_msgSend(v0, "px_topmostPresentedViewController");
  uint64_t v2 = (void *)v1;
  if (v1) {
    v3 = (void *)v1;
  }
  else {
    v3 = v0;
  }
  id v4 = v3;

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    id v18 = v4;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
    if ([v6 count])
    {
      v19 = v5;
      do
      {
        uint64_t v7 = [v6 firstObject];
        [v6 removeObjectAtIndex:0];
        [v5 insertObject:v7 atIndex:0];
        uint64_t v8 = [v7 childViewControllers];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 addObjectsFromArray:v8];
        }
        else
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v9 = v8;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v21 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
                if ([v14 isViewLoaded])
                {
                  unsigned int v15 = [v14 view];
                  id v16 = [v15 window];

                  if (v16 && ([v16 isHidden] & 1) == 0) {
                    [v6 addObject:v14];
                  }
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
            }
            while (v11);
          }

          uint64_t v5 = v19;
        }
      }
      while ([v6 count]);
    }

    id v4 = v18;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end