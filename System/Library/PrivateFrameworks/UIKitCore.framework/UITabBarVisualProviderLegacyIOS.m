@interface UITabBarVisualProviderLegacyIOS
@end

@implementation UITabBarVisualProviderLegacyIOS

void __54___UITabBarVisualProviderLegacyIOS__layoutTabBarItems__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v33 = v3;
  if (*(unsigned char *)(a1 + 112))
  {
    v4 = -[UITabBarItem _tabBarButton](v3);
    v5 = -[UITabBarItem _tabBarButton](v33);
    [v5 frame];
    objc_msgSend(v4, "sizeThatFits:", v6, v7);
    double v9 = v8;

    v3 = v33;
    if (v9 > 0.0) {
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9 + *(double *)(a1 + 80);
    }
  }
  v10 = -[UITabBarItem _tabBarButton](v3);
  [v10 setItemAppearanceData:*(void *)(a1 + 32)];
  [v10 setItemVibrantEffect:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 112))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    double v12 = *(double *)(v11 + 24);
    double v13 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    double v14 = *(double *)(a1 + 88);
    *(double *)(v11 + 24) = v12 + v13;
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 96)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
  }
  else
  {
    double v15 = (double)*(int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    double v13 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    double v14 = *(double *)(a1 + 88);
    double v12 = *(double *)(a1 + 104) + v13 * v15 + *(double *)(a1 + 96) * v15;
  }
  float v16 = round(v12) - v12;
  double v17 = v16;
  double v18 = v12 + v17;
  double v19 = v13 - v17;
  double v20 = 0.0;
  *(float *)&double v17 = round(v18 + v19) - (v18 + v19);
  double v21 = *(float *)&v17;
  double v22 = v19 + v21;
  if (*(unsigned char *)(a1 + 113))
  {
    double v23 = v14;
    double v24 = v19 + v21;
    double v25 = v18;
  }
  else
  {
    if (*(unsigned char *)(a1 + 114)) {
      double v26 = 0.0;
    }
    else {
      double v26 = 2.0;
    }
    if (v22 < v26 + v26 || v14 < 5.0)
    {
      double v25 = v18 + v26;
      double v24 = *MEMORY[0x1E4F1DB30];
      double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v20 = 3.0;
    }
    else
    {
      double v28 = v18;
      double v29 = v22;
      double v30 = v14;
      *(CGRect *)&double v25 = CGRectInset(*(CGRect *)(&v20 - 1), v26, 0.0);
      double v20 = v31 + 1.0;
      double v23 = v32 + -1.0;
    }
  }
  objc_msgSend(v10, "setFrame:", v25, v20, v24, v23);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "convertRect:toView:", v10, v18, 0.0, v22, v14);
    objc_msgSend(v10, "_setTabBarHitRect:");
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
}

BOOL __43___UITabBarVisualProviderLegacyIOS_prepare__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!+[_UIBarBackgroundLayoutPrototyping prototypingEnabled])
    {
      v2 = (void *)WeakRetained[4];
      WeakRetained[4] = 0;
    }
    [WeakRetained _updateBackgroundAnimated:0];
  }

  return WeakRetained != 0;
}

void __101___UITabBarVisualProviderLegacyIOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke(id *a1)
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
        double v7 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v20 + 1) + 8 * i));
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
        double v13 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        if (objc_msgSend(v13, "isEnabled", (void)v16)) {
          double v14 = 1.0;
        }
        else {
          double v14 = 0.25;
        }
        double v15 = -[UITabBarItem _tabBarButton]((id *)v13);
        [v15 setAlpha:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }
}

void __101___UITabBarVisualProviderLegacyIOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke_2(uint64_t a1)
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
        double v6 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v7 + 1) + 8 * v5));
        objc_msgSend(v6, "removeFromSuperview", (void)v7);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __80___UITabBarVisualProviderLegacyIOS_traitCollectionForChild_baseTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v3, "setUserInterfaceStyle:");
    id v3 = v4;
  }
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v4, "setPreferredContentSizeCategory:");
    id v3 = v4;
  }
}

@end