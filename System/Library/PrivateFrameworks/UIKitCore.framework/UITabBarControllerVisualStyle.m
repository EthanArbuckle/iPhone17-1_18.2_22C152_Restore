@interface UITabBarControllerVisualStyle
@end

@implementation UITabBarControllerVisualStyle

uint64_t __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setHiddenAwaitingFocus:*(unsigned __int8 *)(a1 + 48)];
  v2 = *(void **)(*(void *)(a1 + 40) + 64);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  return [v2 setEnabled:v3];
}

uint64_t __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 32) _setShadowAlpha:*(double *)(a1 + 88)];
  if (*(unsigned char *)(a1 + 96)) {
    [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 88)];
  }
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _layoutViewController:v3];
}

uint64_t __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _setHidesShadow:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) _setHiddenAwaitingFocus:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setHidden:v2];
}

uint64_t __56___UITabBarControllerVisualStyle_Pad_updateTabBarLayout__block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  if (v2 <= v3) {
    double v4 = 1194.0;
  }
  else {
    double v4 = 1024.0;
  }
  BOOL v5 = v2 > v4;
  double v6 = *(double *)(a1 + 88);
  if (v6 <= *(double *)(a1 + 96)) {
    double v7 = 1194.0;
  }
  else {
    double v7 = 1024.0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t result = CGRectEqualToRect(*(CGRect *)(&v2 - 2), *MEMORY[0x1E4F1DB28]);
  if (((v5 ^ (v6 > v7)) & 1) != 0 || result)
  {
    uint64_t v11 = [*(id *)(a1 + 32) sidebar];
    v12 = (void *)v11;
    if (v11 && (*(unsigned char *)(v11 + 16) & 2) != 0)
    {
      v14 = [*(id *)(a1 + 32) sidebar];
      int v13 = [v14 isHidden] ^ 1;
    }
    else
    {
      int v13 = 1;
    }

    uint64_t v15 = [*(id *)(a1 + 32) sidebar];
    v16 = (void *)v15;
    if (v6 <= v7) {
      int v17 = 1;
    }
    else {
      int v17 = v13 ^ 1;
    }
    -[UITabBarControllerSidebar _setHidden:source:](v15, v17, 0);

    v18 = *(void **)(a1 + 32);
    return [v18 _setNeedsContentLayout];
  }
  return result;
}

uint64_t __86___UITabBarControllerVisualStyle_Pad__updateContentLayoutForSidebarAppearanceIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSidebarResolvedLayout];
  [*(id *)(a1 + 40) setNeedsStatusBarAppearanceUpdate];
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    double v2 = [*(id *)(a1 + 40) _existingView];
    [v2 layoutIfNeeded];
  }
  double v3 = *(void **)(a1 + 40);
  return [v3 _updateLayoutForStatusBarAndInterfaceOrientation];
}

@end