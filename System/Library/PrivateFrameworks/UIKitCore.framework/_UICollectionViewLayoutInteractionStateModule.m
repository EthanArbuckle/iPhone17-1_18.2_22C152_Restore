@interface _UICollectionViewLayoutInteractionStateModule
- (BOOL)_shouldAdjustLayoutToDrawTopSeparatorInSection:(uint64_t)a1;
- (BOOL)enumerateSectionsAfterSectionIndex:(void *)a3 enumerator:;
- (_UICollectionViewLayoutInteractionStateModuleHost)host;
- (uint64_t)_itemIsSelectedOrHighlightedAndHasBackgroundFillForGroupingAtIndexPath:(void *)a3 cellGroupingPreference:(unsigned char *)a4 backgroundIsInset:;
- (uint64_t)itemAtIndexPathIsBeingReordered:(uint64_t)result;
- (uint64_t)itemAtIndexPathIsSelected:(uint64_t)a1;
- (uint64_t)swipeActionsStyleForSwipedItemAtIndexPath:(uint64_t)a1;
- (unint64_t)selectionGroupingForItemAtIndexPath:(uint64_t)a1;
- (void)_noteCellWillBeginProcessing:(void *)a3 atIndexPath:;
- (void)initWithHost:(void *)a1;
- (void)performPreferredAttributesProcessingBlock:(void *)a3 withLayoutAttributes:(void *)a4 forView:;
- (void)setHost:(id)a3;
@end

@implementation _UICollectionViewLayoutInteractionStateModule

- (void)performPreferredAttributesProcessingBlock:(void *)a3 withLayoutAttributes:(void *)a4 forView:
{
  v12 = a2;
  id v7 = a4;
  if (a1)
  {
    v8 = a3;
    v9 = v8;
    if (v8) {
      int v10 = v8[144] & 1;
    }
    else {
      int v10 = 0;
    }
    v11 = [v8 indexPath];

    if (v10)
    {
      -[_UICollectionViewLayoutInteractionStateModule _noteCellWillBeginProcessing:atIndexPath:](a1, v7, v11);
      v12[2]();
      [*(id *)(a1 + 8) removeObjectForKey:v11];
    }
    else
    {
      v12[2]();
    }
  }
}

- (void)_noteCellWillBeginProcessing:(void *)a3 atIndexPath:
{
  id v13 = a2;
  id v5 = a3;
  v6 = v5;
  if (a1)
  {
    id v7 = v13;
    if (v13)
    {
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__noteCellWillBeginProcessing_atIndexPath_, a1, @"_UICollectionViewLayoutInteractionStateModule.m", 317, @"Invalid parameter not satisfying: %@", @"cell" object file lineNumber description];

      id v7 = 0;
      if (v6) {
        goto LABEL_4;
      }
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel__noteCellWillBeginProcessing_atIndexPath_, a1, @"_UICollectionViewLayoutInteractionStateModule.m", 318, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];

    id v7 = v13;
LABEL_4:
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      [v8 setObject:v7 forKeyedSubscript:v6];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v7 forKey:v6];
      int v10 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v9;
    }
  }
}

- (uint64_t)itemAtIndexPathIsSelected:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = (id *)(a1 + 24);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained collectionView];
  uint64_t v6 = [v5 _selectionController];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = [*(id *)(v6 + 8) containsObject:v3];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)itemAtIndexPathIsBeingReordered:(uint64_t)result
{
  if (result)
  {
    v2 = (id *)(result + 24);
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained(v2);
    id v5 = [WeakRetained collectionView];
    uint64_t v6 = [v5 _isReorderingItemAtIndexPath:v3];

    return v6;
  }
  return result;
}

- (uint64_t)swipeActionsStyleForSwipedItemAtIndexPath:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_swipeActionsStyleForSwipedItemAtIndexPath_, a1, @"_UICollectionViewLayoutInteractionStateModule.m", 274, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    a1 = [WeakRetained _interactionStateModule:a1 swipeActionsStyleForSwipedItemAtIndexPath:v4];
  }
  return a1;
}

- (void)initWithHost:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel_initWithHost_, a1, @"_UICollectionViewLayoutInteractionStateModule.m", 55, @"Invalid parameter not satisfying: %@", @"host" object file lineNumber description];
    }
    v10.receiver = a1;
    v10.super_class = (Class)_UICollectionViewLayoutInteractionStateModule;
    id v5 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeWeak((id *)v5 + 3, v4);
      uint64_t v6 = [(id)objc_opt_class() invalidationContextClass];
      id v7 = (void *)a1[2];
      a1[2] = v6;
    }
  }

  return a1;
}

- (BOOL)enumerateSectionsAfterSectionIndex:(void *)a3 enumerator:
{
  id v5 = a3;
  uint64_t v6 = (void (**)(void, void, void, void, void, double))v5;
  if (!a1)
  {
    BOOL i = 0;
    goto LABEL_17;
  }
  if (a2 < 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:sel_enumerateSectionsAfterSectionIndex_enumerator_, a1, @"_UICollectionViewLayoutInteractionStateModule.m", 230, @"Invalid parameter not satisfying: %@", @"sectionIndex >= 0" object file lineNumber description];

    if (v6) {
      goto LABEL_4;
    }
  }
  else if (v5)
  {
    goto LABEL_4;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:sel_enumerateSectionsAfterSectionIndex_enumerator_, a1, @"_UICollectionViewLayoutInteractionStateModule.m", 231, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];

LABEL_4:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  uint64_t v8 = [WeakRetained collectionView];
  uint64_t v9 = [v8 _collectionViewData];
  objc_super v10 = (void *)v9;
  BOOL i = 0;
  if (WeakRetained && v8 && v9)
  {
    if ((*(unsigned char *)(v9 + 96) & 2) == 0) {
      -[UICollectionViewData _updateItemCounts](v9);
    }
    uint64_t v12 = (uint64_t)(v10[14] - v10[13]) >> 3;
    if (v12 - 1 <= a2)
    {
      BOOL i = 0;
    }
    else
    {
      id v13 = [WeakRetained _interactionStateModule:a1 layoutSectionForIndex:a2 + 1];
      for (BOOL i = v13 != 0; v13; a2 = v18 - 1)
      {
        [WeakRetained _interactionStateModule:a1 spacingAfterLayoutSection:a2];
        double v15 = v14;
        char v22 = 0;
        uint64_t v16 = a2 + 1;
        uint64_t v17 = -[UICollectionViewData numberOfItemsInSection:]((uint64_t)v10, v16);
        ((void (**)(void, void *, uint64_t, uint64_t, char *, double))v6)[2](v6, v13, v16, v17, &v22, v15);
        if (v22) {
          break;
        }

        uint64_t v18 = v16 + 1;
        if (v18 == v12)
        {
          BOOL i = 1;
          goto LABEL_16;
        }
        id v13 = [WeakRetained _interactionStateModule:a1 layoutSectionForIndex:v18];
      }
    }
  }
LABEL_16:

LABEL_17:
  return i;
}

- (unint64_t)selectionGroupingForItemAtIndexPath:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (!a1)
  {
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  if (!v3)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:sel_selectionGroupingForItemAtIndexPath_, a1, @"_UICollectionViewLayoutInteractionStateModule.m", 131, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  uint64_t v6 = objc_msgSend(WeakRetained, "_interactionStateModule:layoutSectionForIndex:", a1, objc_msgSend(v4, "section"));

  if (!v6) {
    goto LABEL_9;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICVGrouping", &qword_1EB265448);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v36 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v4;
      _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "Grouping check: Beginning at indexPath: %@", buf, 0xCu);
    }
  }
  unint64_t v44 = 0;
  char v43 = 0;
  char v8 = -[_UICollectionViewLayoutInteractionStateModule _itemIsSelectedOrHighlightedAndHasBackgroundFillForGroupingAtIndexPath:cellGroupingPreference:backgroundIsInset:](a1, v4, &v44, &v43);
  unint64_t v9 = v44;
  if ((v8 & 1) != 0 || v44)
  {
    if (v44)
    {
      if (v44 >= 5)
      {
        v28 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v29 = *MEMORY[0x1E4F1C3C8];
        v30 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown list cell grouping received: %ld", v44);
        id v31 = [v28 exceptionWithName:v29 reason:v30 userInfo:0];

        objc_exception_throw(v31);
      }
      unint64_t v12 = __UILogGetCategoryCachedImpl("UICVGrouping", &qword_1EB265458);
      if ((*(unsigned char *)v12 & 1) == 0) {
        goto LABEL_10;
      }
      id v13 = *(NSObject **)(v12 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      if (v9 > 4) {
        double v14 = @"unknown";
      }
      else {
        double v14 = off_1E5310F98[v9 - 1];
      }
      *(_DWORD *)buf = 138412546;
      id v46 = v4;
      __int16 v47 = 2112;
      v48 = v14;
      v39 = v13;
      _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_ERROR, "Grouping check: Returning explicit grouping preference from cell at indexPath: %@. Grouping: %@\n\n===", buf, 0x16u);
LABEL_54:

      goto LABEL_10;
    }
    if (v43)
    {
      unint64_t v15 = __UILogGetCategoryCachedImpl("UICVGrouping", &qword_1EB265460);
      if (*(unsigned char *)v15)
      {
        v38 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v4;
          _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_ERROR, "Grouping check: Forcing grouping to alone for inset background at indexPath: %@\n\n===", buf, 0xCu);
        }
      }
      unint64_t v9 = 1;
      goto LABEL_10;
    }
    buf[0] = 0;
    uint64_t v16 = (void *)MEMORY[0x1E4F28D58];
    id v17 = v4;
    uint64_t v18 = [v17 item] + 1;
    uint64_t v19 = [v17 section];

    v20 = [v16 indexPathForItem:v18 inSection:v19];
    int v21 = -[_UICollectionViewLayoutInteractionStateModule _itemIsSelectedOrHighlightedAndHasBackgroundFillForGroupingAtIndexPath:cellGroupingPreference:backgroundIsInset:](a1, v20, 0, buf);

    if (buf[0]) {
      int v21 = 0;
    }
    id v22 = v17;
    if ([v22 item] <= 0)
    {
    }
    else
    {
      v23 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v22, "item") - 1, objc_msgSend(v22, "section"));

      buf[0] = 0;
      if (v23)
      {
        char v24 = -[_UICollectionViewLayoutInteractionStateModule _itemIsSelectedOrHighlightedAndHasBackgroundFillForGroupingAtIndexPath:cellGroupingPreference:backgroundIsInset:](a1, v23, 0, buf);
        if (buf[0]) {
          char v25 = 0;
        }
        else {
          char v25 = v24;
        }

        uint64_t v26 = 1;
        if (v21) {
          uint64_t v26 = 2;
        }
        uint64_t v27 = 3;
        if (!v21) {
          uint64_t v27 = 4;
        }
        if (v25) {
          unint64_t v9 = v27;
        }
        else {
          unint64_t v9 = v26;
        }
        goto LABEL_40;
      }
    }
    if (v21) {
      unint64_t v9 = 2;
    }
    else {
      unint64_t v9 = 1;
    }
LABEL_40:
    unint64_t v32 = __UILogGetCategoryCachedImpl("UICVGrouping", &qword_1EB265468);
    if ((*(unsigned char *)v32 & 1) == 0) {
      goto LABEL_10;
    }
    v33 = *(NSObject **)(v32 + 8);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    if (v9 - 1 > 3) {
      v34 = @"unknown";
    }
    else {
      v34 = off_1E5310F98[v9 - 1];
    }
    v39 = v33;
    v40 = NSStringFromBOOL();
    v41 = NSStringFromBOOL();
    v42 = NSStringFromBOOL();
    *(_DWORD *)buf = 138413314;
    id v46 = v22;
    __int16 v47 = 2112;
    v48 = v34;
    __int16 v49 = 2112;
    v50 = v40;
    __int16 v51 = 2112;
    v52 = v41;
    __int16 v53 = 2112;
    v54 = v42;
    _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_ERROR, "Grouping check: Returning grouping value at index path: %@ -- grouping: %@ -- currentIsSelected: %@ -- previousIsSelected: %@ -- nextIsSelected: %@\n\n===", buf, 0x34u);

    goto LABEL_54;
  }
  unint64_t v10 = __UILogGetCategoryCachedImpl("UICVGrouping", &qword_1EB265450);
  if (*(unsigned char *)v10)
  {
    v37 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v4;
      _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "Grouping check: Returning none because cell is unselected and has no explicit grouping at indexPath: %@.\n\n===", buf, 0xCu);
    }
  }
LABEL_9:
  unint64_t v9 = 0;
LABEL_10:

LABEL_11:
  return v9;
}

- (uint64_t)_itemIsSelectedOrHighlightedAndHasBackgroundFillForGroupingAtIndexPath:(void *)a3 cellGroupingPreference:(unsigned char *)a4 backgroundIsInset:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  char v8 = (id *)(a1 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  unint64_t v10 = [WeakRetained collectionView];

  uint64_t v11 = [v10 _selectionController];
  unint64_t v12 = (id *)v11;
  if (!v10 || !v11)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICVGrouping", &_MergedGlobals_1335);
    if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
      goto LABEL_8;
    }
    double v14 = *(NSObject **)(CategoryCachedImpl + 8);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v36 = v7;
    unint64_t v15 = "Fill state check: Cannot execute without a selection controller. indexPath: %@";
    goto LABEL_35;
  }
  if ([v10 _isReorderingItemAtIndexPath:v7])
  {
    unint64_t v13 = __UILogGetCategoryCachedImpl("UICVGrouping", &qword_1EB265428);
    if ((*(unsigned char *)v13 & 1) == 0) {
      goto LABEL_8;
    }
    double v14 = *(NSObject **)(v13 + 8);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v36 = v7;
    unint64_t v15 = "Fill state check: Early return for reordered item. indexPath: %@";
LABEL_35:
    _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
LABEL_8:
    uint64_t v17 = 0;
    goto LABEL_32;
  }
  if ([v12[1] containsObject:v7]) {
    char v18 = 1;
  }
  else {
    char v18 = [v12[2] containsObject:v7];
  }
  id v19 = v7;
  if (!v19)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:sel__cellForItemAtIndexPath_, a1, @"_UICollectionViewLayoutInteractionStateModule.m", 332, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  v20 = [*(id *)(a1 + 8) objectForKeyedSubscript:v19];
  if (!v20)
  {
    id v21 = objc_loadWeakRetained(v8);
    id v22 = [v21 collectionView];
    v20 = [v22 cellForItemAtIndexPath:v19];
  }
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *a3 = [v20 _backgroundViewConfigurationGrouping];
    }
  }
  if (v18)
  {
    if (v20)
    {
      v23 = [v20 _layoutAttributes];
      char v24 = [v20 _isStyledAsHeaderOrFooterFromLayoutAttributes:v23];

      if (v24) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = [v20 _backgroundFillIsCustomized];
      }
      if (a4) {
        *a4 = [v20 _backgroundIsVerticallyInset];
      }
      unint64_t v27 = __UILogGetCategoryCachedImpl("UICVGrouping", &qword_1EB265440);
      if (*(unsigned char *)v27)
      {
        id v31 = *(NSObject **)(v27 + 8);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          unint64_t v32 = v31;
          v33 = NSStringFromBOOL();
          *(_DWORD *)buf = 138412546;
          id v36 = v19;
          __int16 v37 = 2112;
          v38 = v33;
          _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "Fill state check: Returning live state at indexPath: %@. Has fill: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      unint64_t v26 = __UILogGetCategoryCachedImpl("UICVGrouping", &qword_1EB265438);
      if (*(unsigned char *)v26)
      {
        v34 = *(NSObject **)(v26 + 8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v19;
          _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "Fill state check: No visible cell at indexPath: %@, but is selected or highlighted in the selection controller. Has fill: YES", buf, 0xCu);
        }
      }
      uint64_t v17 = 1;
    }
  }
  else
  {
    unint64_t v25 = __UILogGetCategoryCachedImpl("UICVGrouping", &qword_1EB265430);
    if (*(unsigned char *)v25)
    {
      v30 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v19;
        _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "Fill state check: Early return for unselected at indexPath: %@. Has fill: NO", buf, 0xCu);
      }
    }
    uint64_t v17 = 0;
  }

LABEL_32:
  return v17;
}

- (BOOL)_shouldAdjustLayoutToDrawTopSeparatorInSection:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (a2 < 0)
  {
    unint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel__shouldAdjustLayoutToDrawTopSeparatorInSection_, a1, @"_UICollectionViewLayoutInteractionStateModule.m", 213, @"Invalid parameter not satisfying: %@", @"sectionIndex >= 0" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  id v5 = [WeakRetained collectionView];

  uint64_t v6 = [v5 _collectionViewData];
  id v7 = (unsigned char *)v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    if ([v5 _shouldAdjustLayoutToDrawTopSeparator])
    {
      unint64_t v9 = -[UICollectionViewData validatedIndexPathForItemAtGlobalIndex:](v7, 0);
      unint64_t v10 = v9;
      if (v9) {
        BOOL v8 = [v9 section] == a2;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (_UICollectionViewLayoutInteractionStateModuleHost)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  return (_UICollectionViewLayoutInteractionStateModuleHost *)WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_invalidationContextClass, 0);
  objc_storeStrong((id *)&self->_processingCellsMap, 0);
}

@end