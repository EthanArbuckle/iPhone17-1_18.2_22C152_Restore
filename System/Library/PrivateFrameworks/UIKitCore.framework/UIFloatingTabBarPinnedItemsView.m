@interface UIFloatingTabBarPinnedItemsView
@end

@implementation UIFloatingTabBarPinnedItemsView

uint64_t __54___UIFloatingTabBarPinnedItemsView_setItems_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 contentTab];
  v6 = [v5 identifier];
  v7 = [v4 contentTab];

  v8 = [v7 identifier];
  id v9 = v6;
  id v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    if (v9 && v10) {
      uint64_t v12 = [v9 isEqual:v10];
    }
  }

  return v12;
}

BOOL __63___UIFloatingTabBarPinnedItemsView_itemIndexForItemAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  CGFloat MinX = CGRectGetMinX(v8);
  double v5 = *(double *)(a1 + 32);
  if (MinX <= v5)
  {
    [v3 frame];
    BOOL v6 = v5 <= CGRectGetMaxX(v9);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __63___UIFloatingTabBarPinnedItemsView_itemIndexForItemAtLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _itemViewForItem:a2];
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v4;
}

void __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [a1[4] removals];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = a1[5];
        CGRect v8 = [*(id *)(*((void *)&v14 + 1) + 8 * v6) object];
        CGRect v9 = [v7 _itemViewForItem:v8];

        [a1[6] addObject:v9];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  id v10 = [a1[5] items];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_2;
  v11[3] = &unk_1E52DF050;
  v11[4] = a1[5];
  id v12 = a1[7];
  id v13 = a1[8];
  [v10 enumerateObjectsUsingBlock:v11];
}

void __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v11 = [v5 _itemViewForItem:v6];
  if (!v11)
  {
    v11 = -[_UIFloatingTabBarItemView initWithFrame:]([_UIFloatingTabBarItemView alloc], "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
    [(_UIFloatingTabBarItemView *)v11 setPreferredDisplayMode:2];
    [(_UIFloatingTabBarItemView *)v11 setSuppressEditing:1];
    [(UIView *)v11 setAlpha:0.0];
    [*(id *)(a1 + 32) addSubview:v11];
    [*(id *)(a1 + 40) addObject:v11];
  }
  id v7 = [v6 contentTab];
  [(_UIFloatingTabBarItemView *)v11 setItem:v7];

  -[_UIFloatingTabBarItemView setEditing:](v11, "setEditing:", [*(id *)(a1 + 32) isEditing]);
  -[_UIFloatingTabBarItemView setHasSelectionHighlight:](v11, "setHasSelectionHighlight:", [*(id *)(a1 + 32) highlightedIndex] == a3);
  [(UIView *)v11 layoutIfNeeded];
  CGRect v8 = *(void **)(a1 + 48);
  CGRect v9 = [v6 contentTab];

  id v10 = [v9 identifier];
  [v8 setObject:v11 forKey:v10];
}

void __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v6++) setAlpha:0.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setAlpha:", 1.0, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

void __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "removeFromSuperview", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

BOOL __52___UIFloatingTabBarPinnedItemsView_itemIndexForTab___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 contentTab];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

@end