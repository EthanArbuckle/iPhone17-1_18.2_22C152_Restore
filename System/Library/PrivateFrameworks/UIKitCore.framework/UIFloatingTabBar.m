@interface UIFloatingTabBar
@end

@implementation UIFloatingTabBar

void __34___UIFloatingTabBar_sidebarButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 traitCollection];
  _UIFloatingTabBarGetPlatformMetrics([v3 userInterfaceIdiom]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [v2 configuration];
  v5 = [v9 contentPaletteProvider];
  v6 = [v2 traitCollection];
  v7 = v5[2](v5, [v6 userInterfaceStyle]);
  v8 = [v7 inactiveColor];
  [v4 setBaseForegroundColor:v8];

  [v2 setConfiguration:v4];
}

void __41___UIFloatingTabBar__createViewHierarchy__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scrollToSelectedItemIfNeeded];
  v1 = [WeakRetained _indexPathForSelectedItem];
  uint64_t v2 = [v1 section];

  if (v2 != 3) {
    [WeakRetained _updateSelectionViewFrameAnimated:0 completion:0];
  }
  [WeakRetained _updateContentAlphaForVisibleCells];
}

void __41___UIFloatingTabBar__createViewHierarchy__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [v4 targetItem];

  [WeakRetained _selectItemAtIndexPath:v5];
}

id __38___UIFloatingTabBar__createDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v9 isPlaceholder])
  {
    v11 = @"UIFloatingTabBar.PlaceholderCell";
  }
  else
  {
    v12 = [v9 contentTab];

    if (v12)
    {
      v11 = @"UIFloatingTabBar.Cell";
    }
    else
    {
      v13 = [v9 children];

      if (v13)
      {
        v11 = @"UIFloatingTabBar.GroupCell";
      }
      else
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:*(void *)(a1 + 40) object:WeakRetained file:@"_UIFloatingTabBar.m" lineNumber:566 description:@"Cannot create cells for an unknown list item type"];

        v11 = 0;
      }
    }
  }
  v15 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];
  [v15 setListItem:v9];

  return v15;
}

void __57___UIFloatingTabBar__updateDataSourceFromParserAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v3 = [WeakRetained collectionView];
    [v3 scrollToTargetPageAnimated:*(unsigned __int8 *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

uint64_t __53___UIFloatingTabBar__updateTabBarPaginationAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __41___UIFloatingTabBar_setEditing_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 0.0;
  }
  else {
    double v2 = 1.0;
  }
  v3 = [*(id *)(a1 + 32) selectionContainerView];
  [v3 setAlpha:v2];

  if (*(unsigned char *)(a1 + 41))
  {
    id v4 = [*(id *)(a1 + 32) collectionView];
    [v4 _setAutomaticContentOffsetAdjustmentEnabled:0];

    [*(id *)(a1 + 32) layoutIfNeeded];
    v5 = [*(id *)(a1 + 32) collectionView];
    [v5 _setAutomaticContentOffsetAdjustmentEnabled:1];
  }
  id v7 = [*(id *)(a1 + 32) dragController];
  v6 = [v7 activeDropItem];
  [v6 setNeedsDropPreviewUpdate];
}

BOOL __45___UIFloatingTabBar__contentTabForRecentTab___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _tabPlacement] != 6;
}

void __44___UIFloatingTabBar__selectItemAtIndexPath___block_invoke(void **a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a2)
  {
    id v11 = WeakRetained;
    v5 = [WeakRetained tabModel];
    v6 = [v5 selectedItem];
    id v7 = v6;
    if (v6 == a1[4])
    {
      id v8 = [a1[5] parent];
      id v9 = [v11 expandedGroupItem];

      if (v8 == v9) {
        [v11 setExpandedGroupItem:0];
      }
    }
    else
    {
    }
    v10 = [v11 pointerInteraction];
    [v10 invalidate];

    id WeakRetained = v11;
  }
}

uint64_t __42___UIFloatingTabBar__indexPathForTabItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 tabForSelection];
  id v4 = [v3 identifier];
  v5 = [*(id *)(a1 + 32) identifier];
  id v6 = v4;
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    if (v6 && v7) {
      uint64_t v9 = [v6 isEqual:v7];
    }
  }

  return v9;
}

void __66___UIFloatingTabBar__updateSelectionViewFrameAnimated_completion___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  id v6 = [*(id *)(a1 + 32) selectionContainerView];
  objc_msgSend(v6, "setSelectionViewFrame:", v2, v3, v4, v5);

  int v7 = *(unsigned __int8 *)(a1 + 72);
  if (v7 != *(unsigned __int8 *)(a1 + 73))
  {
    id v8 = [*(id *)(a1 + 32) contentView];
    uint64_t v9 = [v8 traitOverrides];
    uint64_t v10 = objc_opt_class();
    if (v7) {
      [v9 setNSIntegerValue:1 forTrait:v10];
    }
    else {
      [v9 removeTrait:v10];
    }

    id v11 = [*(id *)(a1 + 32) contentView];
    [v11 updateTraitsIfNeeded];
  }
}

uint64_t __66___UIFloatingTabBar__updateSelectionViewFrameAnimated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) complete];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __50___UIFloatingTabBar_selectionFrameGroupCompletion__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained[57];
    WeakRetained[57] = 0;
    double v4 = WeakRetained;

    double v3 = [v4[68] traitOverrides];
    [v3 removeTrait:objc_opt_class()];

    id WeakRetained = v4;
  }
}

unint64_t __50___UIFloatingTabBar__pageIndexForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = *(void *)(a1 + 40);
  unint64_t result = [a2 range];
  if (v7 >= result && v7 - result < v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

void __60___UIFloatingTabBar__updateSelectionViewVisibilityAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v3 = [*(id *)(a1 + 32) selectionContainerView];
  id v2 = [v3 selectionView];
  [v2 setAlpha:v1];
}

void __42___UIFloatingTabBar_setExpandedGroupItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 624);
  *(void *)(v2 + 624) = 0;
}

void __49___UIFloatingTabBar_scrollViewWillBeginDragging___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectionContainerView];
  double v1 = [v2 selectionView];
  [v1 setAlpha:1.0];
}

void __44___UIFloatingTabBar_registerPlatformMetrics__block_invoke()
{
  id v1 = +[_UIVisualStyleRegistry defaultRegistry];
  uint64_t v0 = objc_opt_class();
  [v1 registerVisualStyleClass:v0 forStylableClass:objc_opt_class()];
}

@end