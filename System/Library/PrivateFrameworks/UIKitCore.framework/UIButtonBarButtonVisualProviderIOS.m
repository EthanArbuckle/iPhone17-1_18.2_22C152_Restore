@interface UIButtonBarButtonVisualProviderIOS
@end

@implementation UIButtonBarButtonVisualProviderIOS

void *__73___UIButtonBarButtonVisualProviderIOS_configureButton_fromBarButtonItem___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    [*(id *)(a1 + 32) alignmentRectInsets];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    uint64_t v8 = [*(id *)(a1 + 32) hasBaseline];
    double v9 = 0.0;
    if ((v8 & 1) == 0)
    {
      [*(id *)(a1 + 40) _defaultBackIndicatorBaselineInsetCompact:*(unsigned __int8 *)(a1 + 81)];
      double v9 = v5 + v10;
    }
    v11 = *(void **)(a1 + 40);
    if (v11[9])
    {
      [v11 _imageInsetsForBarButtonItem:*(void *)(a1 + 48) compact:*(unsigned __int8 *)(a1 + 81) isBackButton:1];
      objc_msgSend(*(id *)(a1 + 40), "_configureImageBackButtonWithImageInsets:backButtonLayoutInsets:useBaselineAlignment:", v8);
    }
    else if (v11[8])
    {
      [v11 backButtonTitlePositionOffsetForCompact:*(unsigned __int8 *)(a1 + 81)];
      objc_msgSend(*(id *)(a1 + 40), "_configureTextBackButtonWithTitlePositionAdjustment:backButtonLayoutInsets:useBaselineAlignment:", v8);
    }
    else
    {
      objc_msgSend(v11, "_configureBackButtonWithBackButtonLayoutInsets:useBaselineAlignment:", v8, 0.0, v3, v9, v7);
    }
  }
  else
  {
    v12 = *(void **)(a1 + 40);
    if (v12[9])
    {
      [v12 _imageInsetsForBarButtonItem:*(void *)(a1 + 48) compact:*(unsigned __int8 *)(a1 + 81) isBackButton:0];
      objc_msgSend(*(id *)(a1 + 40), "_configureImageWithInsets:paddingEdges:additionalPadding:", *(void *)(a1 + 56));
    }
    else if (v12[8])
    {
      [*(id *)(a1 + 48) titlePositionAdjustmentForBarMetrics:*(void *)(a1 + 72)];
      double v14 = v13;
      [*(id *)(a1 + 40) titlePositionOffsetForCompact:*(unsigned __int8 *)(a1 + 81)];
      double v16 = v15;
      double v18 = v17;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 88));
      [WeakRetained defaultTextPadding];
      double v21 = v20;

      uint64_t v22 = *(void *)(a1 + 56);
      if ((v22 & 8) != 0)
      {
        double v25 = v21 + *(double *)(a1 + 64);
      }
      else
      {
        id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 88));
        [v23 defaultEdgeSpacing];
        double v25 = v24;

        uint64_t v22 = *(void *)(a1 + 56);
      }
      double v26 = v14 + v16;
      if ((v22 & 2) != 0)
      {
        double v29 = v21 + *(double *)(a1 + 64);
      }
      else
      {
        id v27 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 88));
        [v27 defaultEdgeSpacing];
        double v29 = v28;
      }
      objc_msgSend(*(id *)(a1 + 40), "_configureTextWithOffset:additionalPadding:", v26, v18, 0.0, v29, 0.0, v25);
    }
  }
  result = *(void **)(a1 + 40);
  if (result[10])
  {
    [result backButtonBackgroundVerticalAdjustmentForCompact:*(unsigned __int8 *)(a1 + 81)];
    double v32 = v31;
    if (fabs(v31) < 2.22044605e-16)
    {
      [*(id *)(a1 + 48) backButtonBackgroundVerticalPositionAdjustmentForBarMetrics:*(unsigned __int8 *)(a1 + 81)];
      double v32 = v33;
    }
    uint64_t v34 = *(unsigned __int8 *)(a1 + 80);
    v35 = *(void **)(a1 + 40);
    uint64_t v36 = [*(id *)(a1 + 48) _resizesBackgroundImage];
    return (void *)[v35 _addConstraintsForBackgroundViewWithOffset:v34 isBackButton:v36 resizesImage:v32];
  }
  return result;
}

uint64_t __60___UIButtonBarButtonVisualProviderIOS__setupAlternateTitles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 width];
  double v6 = v5;
  [v4 width];
  double v8 = v7;

  uint64_t v9 = -1;
  if (v6 <= v8) {
    uint64_t v9 = 1;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

uint64_t __69___UIButtonBarButtonVisualProviderIOS__configureImageOrTitleCompact___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 title];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v5);
  double v7 = (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, WeakRetained, v3);

  if (!v7)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        id v19 = objc_loadWeakRetained(v5);
        *(_DWORD *)buf = 138412290;
        id v27 = v19;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Client configured a bar button item (%@) with a secondaryActionsProvider and secondaryActionsArePrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category)+ 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        double v10 = v9;
        id v11 = objc_loadWeakRetained(v5);
        *(_DWORD *)buf = 138412290;
        id v27 = v11;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Client configured a bar button item (%@) with a secondaryActionsProvider and secondaryActionsArePrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
      }
    }
    id v12 = objc_loadWeakRetained(v5);
    double v13 = [v12 title];
    id v14 = objc_loadWeakRetained(v5);
    double v15 = [v14 image];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_265;
    id v23 = &unk_1E52DDB60;
    objc_copyWeak(&v24, v5);
    double v16 = +[UIAction actionWithTitle:v13 image:v15 identifier:0 handler:&v20];

    double v25 = v16;
    double v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v25, 1, v20, v21, v22, v23);
    double v7 = +[UIMenu menuWithChildren:v17];

    objc_destroyWeak(&v24);
  }

  return v7;
}

void __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_265(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _triggerActionForEvent:0];
}

id __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  double v6 = (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);

  return v6;
}

id __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_4(uint64_t a1)
{
  return -[UIBarButtonItemGroup _representativeItemMenu](*(void **)(a1 + 32));
}

@end