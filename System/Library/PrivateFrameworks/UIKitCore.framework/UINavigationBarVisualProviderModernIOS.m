@interface UINavigationBarVisualProviderModernIOS
@end

@implementation UINavigationBarVisualProviderModernIOS

uint64_t __94___UINavigationBarVisualProviderModernIOS_navigationItemUpdatedCenterBarButtonItems_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) end];
}

void __67___UINavigationBarVisualProviderModernIOS_setAppearanceAPIVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(unsigned char **)(a1 + 32);
  id v15 = v3;
  if (v4[232])
  {
    [v4 _ensureLayoutsConfiguredForEntry:v3];
    id v3 = v15;
  }
  uint64_t v5 = [v3 normalLayout];
  v6 = (id *)v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v5)
  {
    *(void *)(v5 + 304) = *(void *)(v7 + 144);
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 232)) {
      goto LABEL_7;
    }
    v8 = *(void **)(v5 + 176);
    goto LABEL_6;
  }
  if (*(unsigned char *)(v7 + 232))
  {
    v8 = 0;
LABEL_6:
    id v9 = v8;
    [v9 setLayout:0];
  }
LABEL_7:
  -[_UINavigationBarLayout setStandardBackgroundViewLayout:](v6, 0);
  -[_UINavigationBarLayout setCompactBackgroundViewLayout:]((uint64_t)v6, 0);
  uint64_t v10 = [v15 searchLayout];
  v11 = (id *)v10;
  uint64_t v12 = *(void *)(a1 + 32);
  if (v10)
  {
    *(void *)(v10 + 304) = *(void *)(v12 + 144);
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 232)) {
      goto LABEL_11;
    }
    v13 = *(void **)(v10 + 176);
    goto LABEL_10;
  }
  if (*(unsigned char *)(v12 + 232))
  {
    v13 = 0;
LABEL_10:
    id v14 = v13;
    [v14 setLayout:0];
  }
LABEL_11:
  -[_UINavigationBarLayout setStandardBackgroundViewLayout:](v11, 0);
  -[_UINavigationBarLayout setCompactBackgroundViewLayout:]((uint64_t)v11, 0);
}

BOOL __50___UINavigationBarVisualProviderModernIOS_prepare__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateBackground];
  }

  return v2 != 0;
}

uint64_t __69___UINavigationBarVisualProviderModernIOS__updateTitleViewForLayout___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) setInlineTitleViewAlpha:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 48);
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  return [v3 setAlpha:v2];
}

void __72___UINavigationBarVisualProviderModernIOS_setForceScrollEdgeAppearance___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 item];
  int v4 = objc_msgSend(v2, "useManualScrollEdgeAppearanceForItem:");
  uint64_t v5 = [v3 normalLayout];

  if (v5 && v5[111] != v4)
  {
    v5[111] = v4;
    [v5 _updateLayoutOutputs];
  }
}

void __54___UINavigationBarVisualProviderModernIOS__popToItem___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 addObject:v6];
  id v7 = *(id *)(a1 + 40);

  if (v7 == v6) {
    *a3 = 1;
  }
}

void __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v22 = (void (**)(void, void))v3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = [WeakRetained[2] topEntry];
    id v6 = WeakRetained[2];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke_2;
    v32[3] = &unk_1E52DE838;
    id v21 = v5;
    id v33 = v21;
    id v7 = v4;
    id v34 = v7;
    [v6 reverseIterateEntries:v32];
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_initWeak(&location, v12);
          v13 = [v12 _backButtonTitleAllowingGenericTitles:0];
          id v14 = objc_msgSend(NSString, "stringWithFormat:", @"PopToItem<NavigationItem:%p>", v12);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke_3;
          v25[3] = &unk_1E52DD308;
          objc_copyWeak(&v26, &location);
          v25[4] = WeakRetained;
          id v15 = +[UIAction actionWithTitle:v13 image:0 identifier:v14 handler:v25];
          [v8 addObject:v15];

          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v9);
    }

    v16 = [WeakRetained navigationBar];
    v17 = [v16 _effectiveDelegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      v19 = [*(id *)(*(void *)(a1 + 32) + 8) _effectiveDelegate];
      v20 = [v19 _navigationBarAdditionalActionsForBackButtonMenu:v16];

      if ([v20 count]) {
        [v8 addObjectsFromArray:v20];
      }
    }
    ((void (**)(void, void *))v22)[2](v22, v8);
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, MEMORY[0x1E4F1CBF0]);
  }
}

void __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  if (*(void **)(a1 + 32) != a2)
  {
    id v7 = [a2 item];
    [*(id *)(a1 + 40) addObject:v7];
    if (([v7 hidesBackButton] & 1) != 0
      || ([v7 leftItemsSupplementBackButton] & 1) == 0
      && ([v7 leftBarButtonItems],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 count],
          v5,
          v6))
    {
      *a3 = 1;
    }
  }
}

void __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) _popToItem:WeakRetained];
    id WeakRetained = v3;
  }
}

void __74___UINavigationBarVisualProviderModernIOS__staticNavBarButtonFakeBackMenu__block_invoke(uint64_t a1, void *a2)
{
  v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained navigationBar];
    uint64_t v6 = [v5 _effectiveDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [*(id *)(*(void *)(a1 + 32) + 8) _effectiveDelegate];
      uint64_t v9 = [v8 _navigationBarAdditionalActionsForBackButtonMenu:v5];

      if ([v9 count]) {
        id v10 = v9;
      }
      else {
        id v10 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    v11[2](v11, v10);
  }
  else
  {
    v11[2](v11, (id)MEMORY[0x1E4F1CBF0]);
  }
}

void __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) _barCustomizationItemWithBarButtonGroup:a2];
  id v7 = (id)v5;
  uint64_t v6 = 48;
  if (a3) {
    uint64_t v6 = 40;
  }
  [*(id *)(a1 + v6) addObject:v5];
}

void __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 setHidden:1];

  [*(id *)(*(void *)(a1 + 40) + 48) setAlpha:0.0];
  id v5 = +[UIImage systemImageNamed:@"circle"];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 48) layout];
  int v4 = [v3 overflowItem];
  [v4 setImage:v5];
}

uint64_t __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:1.0];
}

void __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_4(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained;
  if (WeakRetained && WeakRetained[22] == v10)
  {
    WeakRetained[22] = 0;

    id v5 = [*(id *)(a1 + 32) view];
    [v5 setHidden:0];

    [v4[23] removeFromSuperview];
    id v6 = v4[23];
    v4[23] = 0;

    id v7 = +[UIImage systemImageNamed:@"ellipsis.circle"];
    v8 = [v4[6] layout];
    uint64_t v9 = [v8 overflowItem];
    [v9 setImage:v7];
  }
}

id __79___UINavigationBarVisualProviderModernIOS__sourceViewProviderForBarButtonItem___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = _contentViewFromBarButton(v1);

    v1 = (void *)v2;
  }
  return v1;
}

void __81___UINavigationBarVisualProviderModernIOS_barCustomizer_willEndSession_didReset___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

void __81___UINavigationBarVisualProviderModernIOS_barCustomizer_willEndSession_didReset___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

id __86___UINavigationBarVisualProviderModernIOS__updateContentForTopItem_backItem_animated___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __86___UINavigationBarVisualProviderModernIOS__updateContentForTopItem_backItem_animated___block_invoke_2(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *(void *)(a1 + 32);
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = +[UIMenu menuWithChildren:v1];

  return v2;
}

void __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  id v3 = [v2[2] topItem];
  int v4 = [v3 _bottomPalette];
  [*(id *)(*(void *)(a1 + 32) + 8) _contentMargin];
  objc_msgSend(v2, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v4);

  id v5 = *(id **)(a1 + 32);
  id v7 = [v5[2] topItem];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) backItem];
  [v5 _updateContentForTopItem:v7 backItem:v6 animated:0];
}

uint64_t __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) _sendNavigationBarAnimateTransition];
  [*(id *)(*(void *)(a1 + 32) + 96) animate];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 layoutIfNeeded];
}

void __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) complete];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;
}

uint64_t __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  char v5 = [v4 cancelledTransition];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  if ((v5 & 1) == 0)
  {
    id v6 = *(id **)(a1 + 32);
    id v8 = [v6[2] topEntry];
    id v7 = [v8 item];
    [v6 navigationItemUpdatedLargeTitleDisplayMode:v7];
  }
}

void __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  id v3 = [v2[2] topItem];
  id v4 = [v3 _topPalette];
  [*(id *)(*(void *)(a1 + 32) + 8) _contentMargin];
  objc_msgSend(v2, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v4);

  char v5 = *(id **)(a1 + 32);
  id v6 = [v5[2] topItem];
  id v7 = [v6 _bottomPalette];
  [*(id *)(*(void *)(a1 + 32) + 8) _contentMargin];
  objc_msgSend(v5, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v7);

  id v8 = *(id **)(a1 + 32);
  uint64_t v9 = [v8[2] topItem];
  id v10 = [*(id *)(*(void *)(a1 + 32) + 16) backItem];
  [v8 _updateContentForTopItem:v9 backItem:v10];

  if (_UIBarsDesktopNavigationBarEnabled())
  {
    id v11 = [*(id *)(*(void *)(a1 + 32) + 48) layout];
    [v11 layoutSubviews];
  }
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) _sendNavigationBarAnimateTransition];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) previousTopItem];
  id v3 = [v2 _weeTitle];
  if ([v3 length] && *(void *)(a1 + 48) == 1)
  {
    int v4 = *(unsigned __int8 *)(a1 + 56);

    if (v4)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      char v18 = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_4;
      v19 = &unk_1E52D9F70;
      uint64_t v20 = *(void *)(a1 + 32);
      char v5 = &v16;
LABEL_10:
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.0, 0.0, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) topItem];
  id v7 = [v6 _weeTitle];
  if (![v7 length] || *(void *)(a1 + 48) != 2)
  {

    goto LABEL_12;
  }
  int v8 = *(unsigned __int8 *)(a1 + 57);

  if (v8)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_6;
    id v14 = &unk_1E52D9F70;
    uint64_t v15 = *(void *)(a1 + 32);
    char v5 = &v11;
    goto LABEL_10;
  }
LABEL_12:
  [*(id *)(a1 + 32) _updatePromptViewAndActuallyHide:0];
  uint64_t v9 = *(id **)(a1 + 32);
  [v9[1] bounds];
  objc_msgSend(v9, "_layoutInBounds:");
  [*(id *)(a1 + 32) _updateTitleViewForLayout:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) updateBarVisibilityForTopItem];
  [*(id *)(*(void *)(a1 + 32) + 8) layoutIfNeeded];
  [*(id *)(a1 + 32) applyBarBackground:*(void *)(*(void *)(a1 + 32) + 40) alpha:*(double *)(*(void *)(a1 + 32) + 120)];
  return [*(id *)(*(void *)(a1 + 32) + 96) animate];
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_5;
  v2[3] = &unk_1E52D9F70;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:v2 relativeDuration:0.0 animations:0.2];
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) setAlpha:0.0];
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_6(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_7;
  v2[3] = &unk_1E52D9F70;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:v2 relativeDuration:0.93 animations:0.07];
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) setAlpha:1.0];
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_endTransitionCompleted:", objc_msgSend(*(id *)(a1 + 32), "cancelledTransition") ^ 1);
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 8);
  return [v2 setNeedsLayout];
}

void __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_9(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (v6) {
      v6[2](v6, 1);
    }
  }
  else
  {
    if ([*(id *)(a1 + 32) allowsUserInteractionDuringTransitions]) {
      uint64_t v5 = 393826;
    }
    else {
      uint64_t v5 = 393824;
    }
    [*(id *)(a1 + 40) duration];
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", v5, *(void *)(a1 + 32), *(void *)(a1 + 48), v6);
  }
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_2;
  v4[3] = &unk_1E52D9F70;
  v4[4] = *(void *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.333333333];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_3;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:v3 relativeDuration:0.333333333 animations:0.333333333];
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:0.0];
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:0.0];
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:*(double *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:*(double *)(a1 + 48)];
  *(unsigned char *)(*(void *)(a1 + 32) + 225) = 0;
  return result;
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_5(void *a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_6;
  v4[3] = &unk_1E52D9CD0;
  v4[4] = a1[4];
  void v4[5] = a1[5];
  +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.666666667 animations:0.333333333];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_7;
  v3[3] = &unk_1E52D9CD0;
  v3[4] = a1[4];
  void v3[5] = a1[6];
  return +[UIView addKeyframeWithRelativeStartTime:v3 relativeDuration:0.333333333 animations:0.333333333];
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_8(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 225) = 0;
  return result;
}

uint64_t __61___UINavigationBarVisualProviderModernIOS_barDidMoveToWindow__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) end];
}

uint64_t __101___UINavigationBarVisualProviderModernIOS_navigationItemUpdatedSearchController_oldSearchController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActive:0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 setSearchActive:0];
}

uint64_t __78___UINavigationBarVisualProviderModernIOS__immediatelyFinishRunningTransition__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end