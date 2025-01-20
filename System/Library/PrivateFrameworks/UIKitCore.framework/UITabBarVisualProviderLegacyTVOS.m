@interface UITabBarVisualProviderLegacyTVOS
@end

@implementation UITabBarVisualProviderLegacyTVOS

void __102___UITabBarVisualProviderLegacyTVOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v20 + 1) + 8 * i));
        [v7 setAlpha:0.0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  [a1[5] _layoutTabBarItems];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = a1[6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        if (objc_msgSend(v13, "isEnabled", (void)v16)) {
          double v14 = 1.0;
        }
        else {
          double v14 = 0.25;
        }
        v15 = -[UITabBarItem _tabBarButton]((id *)v13);
        [v15 setAlpha:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }
}

void __102___UITabBarVisualProviderLegacyTVOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v7 + 1) + 8 * v5));
        objc_msgSend(v6, "removeFromSuperview", (void)v7);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __55___UITabBarVisualProviderLegacyTVOS__layoutTabBarItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  v36 = v3;
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v4 = -[UITabBarItem _tabBarButton](v3);
    uint64_t v5 = -[UITabBarItem _tabBarButton](v36);
    [v5 frame];
    objc_msgSend(v4, "sizeThatFits:", v6, v7);
    double v9 = v8;

    uint64_t v3 = v36;
    double v10 = v9 * *(double *)(a1 + 56);
    if (v10 > 0.0) {
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10 + *(double *)(a1 + 64);
    }
  }
  uint64_t v11 = -[UITabBarItem _tabBarButton](v3);
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    double v13 = *(float *)(v12 + 24);
    double v14 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    float v15 = v14 + v13;
    *(float *)(v12 + 24) = v15;
    double v16 = *(double *)(a1 + 72);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    float v18 = *(double *)(a1 + 80) + *(float *)(v17 + 24);
    *(float *)(v17 + 24) = v18;
  }
  else
  {
    double v19 = (double)*(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v14 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    double v16 = *(double *)(a1 + 72);
    double v13 = *(double *)(a1 + 88) + v14 * v19 + *(double *)(a1 + 80) * v19;
  }
  float v20 = round(v13) - v13;
  double v21 = v20;
  double v22 = v13 + v21;
  double v23 = v14 - v21;
  double v24 = 0.0;
  float v25 = round(v22 + v23) - (v22 + v23);
  double v26 = v23 + v25;
  if (*(unsigned char *)(a1 + 97))
  {
    double v27 = v16;
    double v28 = v26;
  }
  else
  {
    if (*(unsigned char *)(a1 + 98)) {
      double v29 = 0.0;
    }
    else {
      double v29 = 2.0;
    }
    if (v26 < v29 + v29 || v16 < 5.0)
    {
      double v22 = v22 + v29;
      double v28 = *MEMORY[0x1E4F1DB30];
      double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v24 = 3.0;
    }
    else
    {
      uint64_t v31 = 0;
      double v32 = v23 + v25;
      double v33 = v16;
      *(CGRect *)&double v22 = CGRectInset(*(CGRect *)&v22, v29, 0.0);
      double v24 = v34 + 1.0;
      double v27 = v35 + -1.0;
    }
  }
  objc_msgSend(v11, "setFrame:", v22, v24, v28, v27);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v11, "_setTabBarHitRect:", 0.0, 0.0, v26, v16);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __70___UITabBarVisualProviderLegacyTVOS__setFocusedItemHightlightVisible___block_invoke(uint64_t a1)
{
  uint64_t v2 = [UIImageView alloc];
  uint64_t v3 = _UIImageWithName(@"UITabBarFocusedItemHighlight");
  uint64_t v4 = [(UIImageView *)v2 initWithImage:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;

  [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:0.0];
  double v7 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:0];
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(void **)(v8 + 64);
  *(void *)(v8 + 64) = v7;

  [*(id *)(*(void *)(a1 + 32) + 56) addMotionEffect:*(void *)(*(void *)(a1 + 32) + 64)];
  double v10 = [*(id *)(a1 + 32) _parentViewForItems];
  [v10 insertSubview:*(void *)(*(void *)(a1 + 32) + 56) atIndex:0];

  uint64_t v11 = *(void **)(a1 + 32);
  return [v11 _updateFocusedItemHighlightFrame];
}

uint64_t __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFocusedItemHightlightVisible:1];
}

uint64_t __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateFocusedItemHighlightFrame];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _updateHighlightMotionEffect];
}

uint64_t __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFocusedItemHightlightVisible:0];
}

uint64_t __73___UITabBarVisualProviderLegacyTVOS__shim_updateFocusHighlightVisibility__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFocusedItemHightlightVisible:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __73___UITabBarVisualProviderLegacyTVOS__shim_updateFocusHighlightVisibility__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFocusedItemHightlightVisible:*(unsigned __int8 *)(a1 + 40)];
}

@end