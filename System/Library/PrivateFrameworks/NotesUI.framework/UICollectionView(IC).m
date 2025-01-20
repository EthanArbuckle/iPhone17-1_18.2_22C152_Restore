@interface UICollectionView(IC)
- (double)ic_firstSelectedItemFrame;
- (double)ic_frameForItemAtIndexPath:()IC;
- (id)ic_cellAtLocation:()IC;
- (id)ic_firstItemIndexPath;
- (id)ic_middleVisibleIndexPath;
- (id)indexPathsForFocusedItems;
- (uint64_t)ic_deselectAllItems;
- (uint64_t)ic_reloadDataWithCompletion:()IC;
- (uint64_t)ic_selectFirstItemIfNoneSelected;
- (uint64_t)ic_selectionContainsFocusedItem;
- (void)ic_deselectAllItemsAnimated:()IC;
- (void)ic_selectCellAtIndexPath:()IC animated:;
@end

@implementation UICollectionView(IC)

- (uint64_t)ic_deselectAllItems
{
  return objc_msgSend(a1, "ic_deselectAllItemsAnimated:", 0);
}

- (void)ic_deselectAllItemsAnimated:()IC
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend(a1, "indexPathsForSelectedItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [a1 deselectItemAtIndexPath:*(void *)(*((void *)&v10 + 1) + 8 * v9++) animated:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)ic_cellAtLocation:()IC
{
  v2 = objc_msgSend(a1, "indexPathForItemAtPoint:");
  v3 = [a1 cellForItemAtIndexPath:v2];

  return v3;
}

- (id)ic_firstItemIndexPath
{
  if ([a1 numberOfSections] < 1)
  {
LABEL_5:
    v3 = 0;
  }
  else
  {
    uint64_t v2 = 0;
    while ([a1 numberOfItemsInSection:v2] < 1)
    {
      if (++v2 >= [a1 numberOfSections]) {
        goto LABEL_5;
      }
    }
    v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v2];
  }
  return v3;
}

- (double)ic_firstSelectedItemFrame
{
  uint64_t v2 = [a1 indexPathsForSelectedItems];
  v3 = [v2 firstObject];

  if (v3)
  {
    objc_msgSend(a1, "ic_frameForItemAtIndexPath:", v3);
    double v5 = v4;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB20];
  }

  return v5;
}

- (id)ic_middleVisibleIndexPath
{
  objc_msgSend(a1, "ic_visibleRectConsideringInsets:", 1);
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  long long v10 = [a1 collectionViewLayout];
  long long v11 = objc_msgSend(v10, "layoutAttributesForElementsInRect:", v3, v5, v7, v9);

  if ([v11 count])
  {
    long long v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v11, "count") >> 1);
    long long v13 = [v12 indexPath];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (double)ic_frameForItemAtIndexPath:()IC
{
  id v4 = a3;
  double v5 = [a1 collectionViewLayout];
  double v6 = [v5 layoutAttributesForItemAtIndexPath:v4];

  if (v6)
  {
    [v6 frame];
    double v8 = v7;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
  }

  return v8;
}

- (uint64_t)ic_selectFirstItemIfNoneSelected
{
  double v2 = [a1 indexPathsForSelectedItems];
  uint64_t v3 = [v2 count];

  uint64_t v4 = objc_msgSend(a1, "ic_firstItemIndexPath");
  double v5 = (void *)v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  uint64_t v7 = !v6;
  if (!v6) {
    [a1 selectItemAtIndexPath:v4 animated:0 scrollPosition:0];
  }

  return v7;
}

- (void)ic_selectCellAtIndexPath:()IC animated:
{
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = [a1 indexPathsForSelectedItems];
    rect2_8 = [v7 firstObject];

    if (rect2_8) {
      [a1 deselectItemAtIndexPath:rect2_8 animated:0];
    }
    double v8 = [a1 layoutAttributesForItemAtIndexPath:v6];
    [v8 frame];
    CGFloat rect2 = v9;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [a1 adjustedContentInset];
    double v17 = v16;
    [a1 adjustedContentInset];
    double v19 = v18;
    [a1 bounds];
    CGFloat v21 = v20;
    [a1 bounds];
    CGFloat v23 = v17 + v22;
    [a1 bounds];
    CGFloat v25 = v24;
    [a1 bounds];
    v31.size.height = v26 - v17 - v19;
    v31.origin.x = v21;
    v31.origin.y = v23;
    v31.size.width = v25;
    v32.origin.x = rect2;
    v32.origin.y = v11;
    v32.size.width = v13;
    v32.size.height = v15;
    if (CGRectContainsRect(v31, v32)) {
      uint64_t v27 = 0;
    }
    else {
      uint64_t v27 = 2;
    }
    [a1 selectItemAtIndexPath:v6 animated:a4 scrollPosition:v27];
  }
}

- (uint64_t)ic_reloadDataWithCompletion:()IC
{
  uint64_t v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v5];

  [a1 reloadData];
  id v6 = (void *)MEMORY[0x1E4F39CF8];
  return [v6 commit];
}

- (id)indexPathsForFocusedItems
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:a1];
  if (v2)
  {
    objc_opt_class();
    uint64_t v3 = [v2 focusedItem];
    uint64_t v4 = ICDynamicCast();

    if (v4)
    {
      uint64_t v5 = [a1 indexPathForCell:v4];
      id v6 = (void *)v5;
      if (v5)
      {
        v9[0] = v5;
        uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)ic_selectionContainsFocusedItem
{
  double v2 = [a1 indexPathsForFocusedItems];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [a1 indexPathsForSelectedItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__UICollectionView_IC__ic_selectionContainsFocusedItem__block_invoke;
  v8[3] = &unk_1E5FDB5D8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "ic_containsObjectPassingTest:", v8);

  return v6;
}

@end