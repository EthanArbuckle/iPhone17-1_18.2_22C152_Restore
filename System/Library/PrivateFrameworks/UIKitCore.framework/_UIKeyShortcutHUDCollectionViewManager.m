@interface _UIKeyShortcutHUDCollectionViewManager
- (BOOL)client:(id)a3 isCategoryVisibleForCellAtIndexPath:(id)a4;
- (BOOL)client:(id)a3 shouldHideSeparatorAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)nextFocusUpdatePrefersTopSearchResult;
- (NSArray)allClients;
- (NSArray)preferredFocusEnvironments;
- (_UIKeyShortcutHUDCollectionViewManagerClient)menu;
- (_UIKeyShortcutHUDCollectionViewManagerClient)searchButton;
- (_UIKeyShortcutHUDCollectionViewManagerClient)toolbar;
- (_UIKeyShortcutHUDIndexPath)categoryVisibleIndexPath;
- (_UIKeyShortcutHUDIndexPath)highlightedIndexPath;
- (_UIKeyShortcutHUDIndexPath)selectedIndexPath;
- (_UIKeyShortcutHUDViewController)hudVC;
- (id)_clientForCollectionView:(id)a3;
- (void)_client:(id)a3 deselectCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 highlightCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 performBookkeepingForDeselectingCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 performBookkeepingForHighlightingCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 performBookkeepingForRemovingCategoryVisibleForCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 performBookkeepingForSelectingCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 performBookkeepingForSettingCategoryVisibleForCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 performBookkeepingForUnhighlightingCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 removeCategoryVisibleForCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 selectCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 setCategoryVisibleForCellAtIndexPath:(id)a4;
- (void)_client:(id)a3 unhighlightCellAtIndexPath:(id)a4;
- (void)_collectionView:(id)a3 performActionForSelectingCellAtIndexPath:(id)a4;
- (void)_collectionView:(id)a3 updateSeparatorVisibilityForCellAtIndexPath:(id)a4;
- (void)_configureCollectionView:(id)a3;
- (void)client:(id)a3 flashCellIfPossibleAtIndexPath:(id)a4 completionHandler:(id)a5;
- (void)client:(id)a3 highlightCellAtIndexPath:(id)a4;
- (void)client:(id)a3 reloadSeparatorAtIndexPath:(id)a4;
- (void)client:(id)a3 selectCellAtIndexPath:(id)a4;
- (void)client:(id)a3 setCategoryVisibleForCellAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)deselectCurrentlySelectedCell;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)reloadAllVisibleSeparatorsForClient:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCategoryVisibleIndexPath:(id)a3;
- (void)setHighlightedIndexPath:(id)a3;
- (void)setHudVC:(id)a3;
- (void)setMenu:(id)a3;
- (void)setNextFocusUpdatePrefersTopSearchResult:(BOOL)a3;
- (void)setSearchButton:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setToolbar:(id)a3;
@end

@implementation _UIKeyShortcutHUDCollectionViewManager

- (void)setMenu:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_menu, obj);
    v6 = [obj collectionView];
    [(_UIKeyShortcutHUDCollectionViewManager *)self _configureCollectionView:v6];
  }
}

- (void)setToolbar:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_toolbar, obj);
    v6 = [obj collectionView];
    [(_UIKeyShortcutHUDCollectionViewManager *)self _configureCollectionView:v6];
  }
}

- (void)setSearchButton:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchButton);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_searchButton, obj);
    v6 = [obj collectionView];
    [(_UIKeyShortcutHUDCollectionViewManager *)self _configureCollectionView:v6];
  }
}

- (void)_configureCollectionView:(id)a3
{
  id v6 = a3;
  v4 = +[UIColor clearColor];
  [v6 setBackgroundColor:v4];

  [v6 setDelegate:self];
  [v6 setSelectionFollowsFocus:1];
  id v5 = +[_UIKeyShortcutHUDUtilities sharedFocusGroupIdentifier]();
  [v6 setFocusGroupIdentifier:v5];

  [v6 setAlwaysBounceHorizontal:0];
  [v6 setAlwaysBounceVertical:0];
  [v6 setShowsHorizontalScrollIndicator:0];
  [v6 setShowsVerticalScrollIndicator:0];
}

- (id)_clientForCollectionView:(id)a3
{
  id v4 = a3;
  p_toolbar = &self->_toolbar;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);
  id v7 = [WeakRetained collectionView];

  if (v7 != v4)
  {
    p_toolbar = &self->_menu;
    id v8 = objc_loadWeakRetained((id *)&self->_menu);
    id v9 = [v8 collectionView];

    if (v9 != v4) {
      p_toolbar = &self->_searchButton;
    }
  }
  id v10 = objc_loadWeakRetained((id *)p_toolbar);

  return v10;
}

- (NSArray)allClients
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);
  v8[0] = WeakRetained;
  id v4 = objc_loadWeakRetained((id *)&self->_menu);
  v8[1] = v4;
  id v5 = objc_loadWeakRetained((id *)&self->_searchButton);
  v8[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return (NSArray *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (![(_UIKeyShortcutHUDCollectionViewManager *)self nextFocusUpdatePrefersTopSearchResult])goto LABEL_18; {
  [(_UIKeyShortcutHUDCollectionViewManager *)self setNextFocusUpdatePrefersTopSearchResult:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
  id v4 = [WeakRetained collectionView];
  id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  id v6 = [v4 cellForItemAtIndexPath:v5];

  if (!v6)
  {
LABEL_18:
    id v7 = [(_UIKeyShortcutHUDIndexPath *)self->_selectedIndexPath client];
    id v8 = [v7 collectionView];
    id v9 = [(_UIKeyShortcutHUDIndexPath *)self->_selectedIndexPath indexPath];
    id v6 = [v8 cellForItemAtIndexPath:v9];

    if (!v6)
    {
      id v10 = [(_UIKeyShortcutHUDIndexPath *)self->_categoryVisibleIndexPath client];
      v11 = [v10 collectionView];
      v12 = [(_UIKeyShortcutHUDIndexPath *)self->_categoryVisibleIndexPath indexPath];
      id v6 = [v11 cellForItemAtIndexPath:v12];

      if (!v6)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_searchButton);
        v14 = [v13 collectionView];
        v15 = [v14 visibleCells];
        id v6 = [v15 firstObject];
      }
    }
  }
  id v16 = objc_loadWeakRetained((id *)&self->_hudVC);
  if ([v16 isSearching])
  {
    v17 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {

      goto LABEL_12;
    }
  }
  else
  {
  }
  if (v6)
  {
    v21[0] = v6;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

    goto LABEL_13;
  }
LABEL_12:
  v19 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_13:
  return (NSArray *)v19;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v12 = [a3 nextFocusedItem];
  id v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = v12;
    id v8 = [v7 _collectionView];
    id v9 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:v8];
    id v10 = [v8 indexPathForCell:v7];

    [(_UIKeyShortcutHUDCollectionViewManager *)self client:v9 selectCellAtIndexPath:v10];
  }
  else
  {
    selectedIndexPath = self->_selectedIndexPath;
    if (!selectedIndexPath) {
      goto LABEL_6;
    }
    id v8 = [(_UIKeyShortcutHUDIndexPath *)selectedIndexPath client];
    id v9 = [(_UIKeyShortcutHUDIndexPath *)self->_selectedIndexPath indexPath];
    [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v8 deselectCellAtIndexPath:v9];
  }

LABEL_6:
}

- (BOOL)client:(id)a3 shouldHideSeparatorAtIndexPath:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:a3 indexPath:a4];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = [(_UIKeyShortcutHUDCollectionViewManager *)self allClients];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) indexPathsForCellsUsingSeparatorAtIndexPath:v5];
        [v6 unionSet:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          v18 = objc_msgSend(v17, "client", (void)v23);
          v19 = [v18 collectionView];
          uint64_t v20 = [v17 indexPath];
          v21 = [v19 cellForItemAtIndexPath:v20];

          LOBYTE(v20) = [v21 isBackgroundVisible];
          if (v20)
          {
            LOBYTE(v14) = 1;
            goto LABEL_19;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (void)client:(id)a3 reloadSeparatorAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 collectionView];
  uint64_t v9 = +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  id v12 = [v8 supplementaryViewForElementKind:v9 atIndexPath:v6];

  BOOL v10 = [(_UIKeyShortcutHUDCollectionViewManager *)self client:v7 shouldHideSeparatorAtIndexPath:v6];
  v11 = [v12 separatorView];
  [v11 setSeparatorHidden:v10];
}

- (void)reloadAllVisibleSeparatorsForClient:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 collectionView];
  id v6 = +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  id v7 = [v5 indexPathsForVisibleSupplementaryElementsOfKind:v6];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[_UIKeyShortcutHUDCollectionViewManager client:reloadSeparatorAtIndexPath:](self, "client:reloadSeparatorAtIndexPath:", v4, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)client:(id)a3 flashCellIfPossibleAtIndexPath:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 collectionView];
  uint64_t v12 = [v11 cellForItemAtIndexPath:v9];
  if (v12)
  {
    [v11 bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [v12 bounds];
    objc_msgSend(v11, "convertRect:fromView:", v12);
    v39.origin.x = v21;
    v39.origin.y = v22;
    v39.size.width = v23;
    v39.size.height = v24;
    v38.origin.x = v14;
    v38.origin.y = v16;
    v38.size.width = v18;
    v38.size.height = v20;
    if (CGRectIntersectsRect(v38, v39))
    {
      id v25 = [(_UIKeyShortcutHUDIndexPath *)self->_selectedIndexPath client];
      if (v25 == v8)
      {
        long long v26 = [(_UIKeyShortcutHUDIndexPath *)self->_selectedIndexPath indexPath];
        char v27 = [v26 isEqual:v9];

        if (v27)
        {
LABEL_8:
          [v12 setFlashing:1];
          [(_UIKeyShortcutHUDCollectionViewManager *)self _collectionView:v11 updateSeparatorVisibilityForCellAtIndexPath:v9];
          long long v28 = +[UIKeyShortcutHUDMetrics currentMetrics];
          [v28 cellFlashDuration];
          double v30 = v29;

          dispatch_time_t v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __98___UIKeyShortcutHUDCollectionViewManager_client_flashCellIfPossibleAtIndexPath_completionHandler___block_invoke;
          block[3] = &unk_1E52E8FE8;
          id v33 = v12;
          v34 = self;
          id v35 = v11;
          id v36 = v9;
          id v37 = v10;
          dispatch_after(v31, MEMORY[0x1E4F14428], block);

          goto LABEL_9;
        }
      }
      else
      {
      }
      [(_UIKeyShortcutHUDCollectionViewManager *)self client:v8 selectCellAtIndexPath:0];
      goto LABEL_8;
    }
  }
  (*((void (**)(id, void))v10 + 2))(v10, 0);
LABEL_9:
}

- (void)client:(id)a3 selectCellAtIndexPath:(id)a4
{
  selectedIndexPath = self->_selectedIndexPath;
  id v7 = a4;
  id v10 = a3;
  id v8 = [(_UIKeyShortcutHUDIndexPath *)selectedIndexPath client];
  id v9 = [(_UIKeyShortcutHUDIndexPath *)self->_selectedIndexPath indexPath];
  [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v8 deselectCellAtIndexPath:v9];

  [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v10 selectCellAtIndexPath:v7];
}

- (void)_client:(id)a3 deselectCellAtIndexPath:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v8 = a3;
    id v7 = [v8 collectionView];
    [v7 deselectItemAtIndexPath:v6 animated:0];

    [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v8 performBookkeepingForDeselectingCellAtIndexPath:v6];
  }
}

- (void)_client:(id)a3 performBookkeepingForDeselectingCellAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 collectionView];
  [(_UIKeyShortcutHUDCollectionViewManager *)self _collectionView:v7 updateSeparatorVisibilityForCellAtIndexPath:v6];

  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = 0;
}

- (void)_client:(id)a3 selectCellAtIndexPath:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v8 = a3;
    id v7 = [v8 collectionView];
    [v7 selectItemAtIndexPath:v6 animated:0 scrollPosition:0];

    [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v8 performBookkeepingForSelectingCellAtIndexPath:v6];
  }
}

- (void)_client:(id)a3 performBookkeepingForSelectingCellAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 collectionView];
  [(_UIKeyShortcutHUDCollectionViewManager *)self _collectionView:v8 updateSeparatorVisibilityForCellAtIndexPath:v6];

  id v9 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:v7 indexPath:v6];

  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v9;
}

- (void)deselectCurrentlySelectedCell
{
  selectedIndexPath = self->_selectedIndexPath;
  if (selectedIndexPath)
  {
    id v5 = [(_UIKeyShortcutHUDIndexPath *)selectedIndexPath client];
    id v4 = [(_UIKeyShortcutHUDIndexPath *)self->_selectedIndexPath indexPath];
    [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v5 deselectCellAtIndexPath:v4];
  }
}

- (void)client:(id)a3 highlightCellAtIndexPath:(id)a4
{
  highlightedIndexPath = self->_highlightedIndexPath;
  id v7 = a4;
  id v10 = a3;
  id v8 = [(_UIKeyShortcutHUDIndexPath *)highlightedIndexPath client];
  id v9 = [(_UIKeyShortcutHUDIndexPath *)self->_highlightedIndexPath indexPath];
  [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v8 unhighlightCellAtIndexPath:v9];

  [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v10 highlightCellAtIndexPath:v7];
}

- (void)_client:(id)a3 unhighlightCellAtIndexPath:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [v7 collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v6];

    [v9 setHighlighted:0];
    [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v7 performBookkeepingForUnhighlightingCellAtIndexPath:v6];
  }
}

- (void)_client:(id)a3 performBookkeepingForUnhighlightingCellAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 collectionView];
  [(_UIKeyShortcutHUDCollectionViewManager *)self _collectionView:v7 updateSeparatorVisibilityForCellAtIndexPath:v6];

  highlightedIndexPath = self->_highlightedIndexPath;
  self->_highlightedIndexPath = 0;
}

- (void)_client:(id)a3 highlightCellAtIndexPath:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [v7 collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v6];

    [v9 setHighlighted:1];
    [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v7 performBookkeepingForHighlightingCellAtIndexPath:v6];
  }
}

- (void)_client:(id)a3 performBookkeepingForHighlightingCellAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 collectionView];
  [(_UIKeyShortcutHUDCollectionViewManager *)self _collectionView:v8 updateSeparatorVisibilityForCellAtIndexPath:v6];

  id v9 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:v7 indexPath:v6];

  highlightedIndexPath = self->_highlightedIndexPath;
  self->_highlightedIndexPath = v9;
}

- (BOOL)client:(id)a3 isCategoryVisibleForCellAtIndexPath:(id)a4
{
  id v6 = a4;
  categoryVisibleIndexPath = self->_categoryVisibleIndexPath;
  id v8 = a3;
  id v9 = [(_UIKeyShortcutHUDIndexPath *)categoryVisibleIndexPath client];

  if (v9 == v8)
  {
    uint64_t v11 = [(_UIKeyShortcutHUDIndexPath *)self->_categoryVisibleIndexPath indexPath];
    char v10 = [v11 isEqual:v6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)client:(id)a3 setCategoryVisibleForCellAtIndexPath:(id)a4
{
  categoryVisibleIndexPath = self->_categoryVisibleIndexPath;
  id v7 = a4;
  id v10 = a3;
  id v8 = [(_UIKeyShortcutHUDIndexPath *)categoryVisibleIndexPath client];
  id v9 = [(_UIKeyShortcutHUDIndexPath *)self->_categoryVisibleIndexPath indexPath];
  [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v8 removeCategoryVisibleForCellAtIndexPath:v9];

  [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v10 setCategoryVisibleForCellAtIndexPath:v7];
}

- (void)_client:(id)a3 removeCategoryVisibleForCellAtIndexPath:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [v7 collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v6];

    [v9 setCategoryVisible:0];
    [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v7 performBookkeepingForRemovingCategoryVisibleForCellAtIndexPath:v6];
  }
}

- (void)_client:(id)a3 performBookkeepingForRemovingCategoryVisibleForCellAtIndexPath:(id)a4
{
  categoryVisibleIndexPath = self->_categoryVisibleIndexPath;
  self->_categoryVisibleIndexPath = 0;
}

- (void)_client:(id)a3 setCategoryVisibleForCellAtIndexPath:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [v7 collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v6];

    [v9 setCategoryVisible:1];
    [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v7 performBookkeepingForSettingCategoryVisibleForCellAtIndexPath:v6];
  }
}

- (void)_client:(id)a3 performBookkeepingForSettingCategoryVisibleForCellAtIndexPath:(id)a4
{
  id v5 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:a3 indexPath:a4];
  categoryVisibleIndexPath = self->_categoryVisibleIndexPath;
  self->_categoryVisibleIndexPath = v5;
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:a3];
  [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v7 performBookkeepingForUnhighlightingCellAtIndexPath:v6];
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:a3];
  [(_UIKeyShortcutHUDCollectionViewManager *)self client:v7 highlightCellAtIndexPath:v6];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:a3];
  [(_UIKeyShortcutHUDCollectionViewManager *)self _client:v7 performBookkeepingForDeselectingCellAtIndexPath:v6];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:v9];
  id v8 = [v9 cellForItemAtIndexPath:v6];
  if (([v7 shouldPersistSelectionForCellAtIndexPath:v6] & 1) != 0
    || ([v8 isFocused] & 1) != 0)
  {
    [(_UIKeyShortcutHUDCollectionViewManager *)self client:v7 selectCellAtIndexPath:v6];
  }
  else
  {
    [v9 deselectItemAtIndexPath:v6 animated:0];
  }
  [(_UIKeyShortcutHUDCollectionViewManager *)self _collectionView:v9 performActionForSelectingCellAtIndexPath:v6];
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:a3];
  LOBYTE(self) = [v7 selectionFollowsFocusForItemAtIndexPath:v6];

  return (char)self;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:v14];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);

  if (v10 == WeakRetained)
  {
    id v12 = v8;
    double v13 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:v14];
    objc_msgSend(v12, "setCategoryVisible:", -[_UIKeyShortcutHUDCollectionViewManager client:isCategoryVisibleForCellAtIndexPath:](self, "client:isCategoryVisibleForCellAtIndexPath:", v13, v9));
  }
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v13 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:v17];
    id v14 = v9;
    BOOL v15 = [(_UIKeyShortcutHUDCollectionViewManager *)self client:v13 shouldHideSeparatorAtIndexPath:v10];
    CGFloat v16 = [v14 separatorView];

    [v16 setSeparatorHidden:v15];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:a3];
  [v3 didScrollCollectionView];
}

- (void)_collectionView:(id)a3 performActionForSelectingCellAtIndexPath:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:a3];
    [v7 performActionForSelectingCellAtIndexPath:v6];
  }
}

- (void)_collectionView:(id)a3 updateSeparatorVisibilityForCellAtIndexPath:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = [(_UIKeyShortcutHUDCollectionViewManager *)self _clientForCollectionView:a3];
    id v8 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:v7 indexPath:v6];
    id v9 = [MEMORY[0x1E4F1CA80] set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = [(_UIKeyShortcutHUDCollectionViewManager *)self allClients];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          BOOL v15 = [*(id *)(*((void *)&v28 + 1) + 8 * i) indexPathsForSeparatorsUsedByCellAtIndexPath:v8];
          [v9 unionSet:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          CGFloat v21 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          CGFloat v22 = objc_msgSend(v21, "client", (void)v24);
          CGFloat v23 = [v21 indexPath];
          [(_UIKeyShortcutHUDCollectionViewManager *)self client:v22 reloadSeparatorAtIndexPath:v23];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }
  }
}

- (_UIKeyShortcutHUDViewController)hudVC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hudVC);
  return (_UIKeyShortcutHUDViewController *)WeakRetained;
}

- (void)setHudVC:(id)a3
{
}

- (_UIKeyShortcutHUDCollectionViewManagerClient)menu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
  return (_UIKeyShortcutHUDCollectionViewManagerClient *)WeakRetained;
}

- (_UIKeyShortcutHUDCollectionViewManagerClient)toolbar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);
  return (_UIKeyShortcutHUDCollectionViewManagerClient *)WeakRetained;
}

- (_UIKeyShortcutHUDCollectionViewManagerClient)searchButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchButton);
  return (_UIKeyShortcutHUDCollectionViewManagerClient *)WeakRetained;
}

- (BOOL)nextFocusUpdatePrefersTopSearchResult
{
  return self->_nextFocusUpdatePrefersTopSearchResult;
}

- (void)setNextFocusUpdatePrefersTopSearchResult:(BOOL)a3
{
  self->_nextFocusUpdatePrefersTopSearchResult = a3;
}

- (_UIKeyShortcutHUDIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (_UIKeyShortcutHUDIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (void)setHighlightedIndexPath:(id)a3
{
}

- (_UIKeyShortcutHUDIndexPath)categoryVisibleIndexPath
{
  return self->_categoryVisibleIndexPath;
}

- (void)setCategoryVisibleIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryVisibleIndexPath, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_destroyWeak((id *)&self->_searchButton);
  objc_destroyWeak((id *)&self->_toolbar);
  objc_destroyWeak((id *)&self->_menu);
  objc_destroyWeak((id *)&self->_hudVC);
}

@end