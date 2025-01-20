@interface SearchUIResultsCollectionViewController
+ (id)hiddenSectionsFromSections:(id)a3;
- (BOOL)canHighlightRowAtIndexPath:(id)a3;
- (BOOL)indexPathIsShowMoreSections:(id)a3;
- (BOOL)sectionShouldBeExpanded:(id)a3;
- (BOOL)updateMustAccountForLayout;
- (NSArray)hiddenSections;
- (NSMutableSet)expandedSections;
- (NSMutableSet)sectionsThatHaveBeenExpanded;
- (SearchUIResultsCollectionViewController)init;
- (double)cachedHeaderHeight;
- (double)headerHeight;
- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4;
- (id)commandEnvironment;
- (id)preferredFocusEnvironments;
- (id)restorationContext;
- (id)tableModelForExpansion;
- (int64_t)focusItemDeferralMode;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didPresentToResumeSearch:(BOOL)a3;
- (void)highlightResult:(id)a3;
- (void)purgeAndResetTable;
- (void)resignTextFieldIfNeeded;
- (void)returnKeyPressed;
- (void)scrollTableToTop;
- (void)setCachedHeaderHeight:(double)a3;
- (void)setExpandedSections:(id)a3;
- (void)setFocusableIndexPath:(id)a3;
- (void)setHiddenSections:(id)a3;
- (void)setSectionsThatHaveBeenExpanded:(id)a3;
- (void)showMoreSectionsWithShowMoreButtonIndexPath:(id)a3;
- (void)toggleExpansionForSectionModel:(id)a3;
- (void)updateWithResultSections:(id)a3 scrollToTop:(BOOL)a4;
- (void)updateWithResultSections:(id)a3 scrollToTop:(BOOL)a4 animated:(BOOL)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismiss;
@end

@implementation SearchUIResultsCollectionViewController

- (double)headerHeight
{
  return 0.0;
}

- (double)cachedHeaderHeight
{
  return self->_cachedHeaderHeight;
}

- (BOOL)sectionShouldBeExpanded:(id)a3
{
  id v4 = a3;
  v5 = [(SearchUIResultsCollectionViewController *)self expandedSections];
  if ([v5 containsObject:v4])
  {
    char v6 = 1;
  }
  else
  {
    v7 = [(SearchUICollectionViewController *)self resultsViewDelegate];
    if (objc_opt_respondsToSelector())
    {
      v8 = [(SearchUICollectionViewController *)self resultsViewDelegate];
      char v6 = [v8 sectionShouldBeExpanded:v4];
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (SearchUIResultsCollectionViewController)init
{
  v16.receiver = self;
  v16.super_class = (Class)SearchUIResultsCollectionViewController;
  v2 = [(SearchUICollectionViewController *)&v16 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SearchUIResultsCollectionViewController *)v2 setExpandedSections:v3];

    id v4 = objc_opt_new();
    [(SearchUIResultsCollectionViewController *)v2 setSectionsThatHaveBeenExpanded:v4];

    objc_initWeak(&location, v2);
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4FAE1A8];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __47__SearchUIResultsCollectionViewController_init__block_invoke;
    v13 = &unk_1E6E73B98;
    objc_copyWeak(&v14, &location);
    id v7 = (id)[v5 addObserverForName:v6 object:0 queue:0 usingBlock:&v10];

    v8 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v10, v11, v12, v13);
    [v8 addObserver:v2 selector:sel_expandCellsIfNeeded name:*MEMORY[0x1E4FB3148] object:0];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setSectionsThatHaveBeenExpanded:(id)a3
{
}

- (void)setExpandedSections:(id)a3
{
}

- (void)setCachedHeaderHeight:(double)a3
{
  self->_cachedHeaderHeight = a3;
}

- (void)didPresentToResumeSearch:(BOOL)a3
{
  BOOL v3 = a3;
  [(SearchUICollectionViewController *)self setIsVisibleFeedbackEnabled:1];
  if (v3)
  {
    [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:12];
  }
}

- (id)commandEnvironment
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIResultsCollectionViewController;
  BOOL v3 = [(SearchUICollectionViewController *)&v7 commandEnvironment];
  id v4 = [(SearchUICollectionViewController *)self queryString];
  [v3 setSearchString:v4];

  v5 = [(SearchUICollectionViewController *)self tableModel];
  objc_msgSend(v3, "setQueryId:", objc_msgSend(v5, "queryId"));

  return v3;
}

- (void)highlightResult:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  id v18 = (id)v5;
  if (a3 && v5)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];

    if (v6) {
      [(SearchUIResultsCollectionViewController *)self setFocusableIndexPath:0];
    }
    objc_super v7 = [(SearchUIResultsCollectionViewController *)self collectionView];
    [v7 layoutIfNeeded];

    v8 = [(SearchUIResultsCollectionViewController *)self collectionView];
    v9 = [v8 cellForItemAtIndexPath:v18];

    if ([v9 setupManualFocus])
    {
      id v10 = v18;
    }
    else
    {
      v13 = [(SearchUIResultsCollectionViewController *)self collectionView];
      BOOL v14 = [(SearchUICollectionViewController *)self collectionView:v13 shouldHighlightItemAtIndexPath:v18];

      if (v14) {
        v15 = v18;
      }
      else {
        v15 = 0;
      }
      id v16 = v15;

      v17 = [(SearchUIResultsCollectionViewController *)self collectionView];
      [v17 selectItemAtIndexPath:v16 animated:0 scrollPosition:0];

      id v10 = v16;
    }
    id v18 = v10;
    [(SearchUIResultsCollectionViewController *)self setFocusableIndexPath:v10];
  }
  else
  {
    [(SearchUIResultsCollectionViewController *)self setFocusableIndexPath:0];
    uint64_t v11 = [(SearchUIResultsCollectionViewController *)self collectionView];
    v9 = [v11 cellForItemAtIndexPath:v18];

    [v9 removeManualFocus];
    v12 = [(SearchUIResultsCollectionViewController *)self collectionView];
    [v12 selectItemAtIndexPath:0 animated:0 scrollPosition:0];
  }
}

- (void)setFocusableIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SearchUIKeyboardableCollectionViewController *)self interactionDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(SearchUICollectionViewController *)self dataSource];
    v8 = [v7 itemIdentifierForIndexPath:v4];

    v9 = [(SearchUIKeyboardableCollectionViewController *)self interactionDelegate];
    id v10 = [v8 identifyingResult];
    uint64_t v11 = [v8 cardSection];
    [v9 didUpdateKeyboardFocusToResult:v10 cardSection:v11];
  }
  v12.receiver = self;
  v12.super_class = (Class)SearchUIResultsCollectionViewController;
  [(SearchUICollectionViewController *)&v12 setFocusableIndexPath:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:12];
  v5.receiver = self;
  v5.super_class = (Class)SearchUIResultsCollectionViewController;
  [(SearchUICollectionViewController *)&v5 viewWillAppear:v3];
}

- (void)updateWithResultSections:(id)a3 scrollToTop:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v30 = a5;
  BOOL v31 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = [(SearchUICollectionViewController *)self viewWillUpdateHandler];

  if (v7)
  {
    v8 = [(SearchUICollectionViewController *)self viewWillUpdateHandler];
    v8[2]();
  }
  v9 = [(SearchUIResultsCollectionViewController *)self expandedSections];
  [v9 removeAllObjects];

  id v10 = [(SearchUIResultsCollectionViewController *)self sectionsThatHaveBeenExpanded];
  [v10 removeAllObjects];

  uint64_t v11 = [(SearchUICollectionViewController *)self expandedCollectionSections];
  [v11 removeAllObjects];

  objc_super v12 = [(id)objc_opt_class() hiddenSectionsFromSections:v6];
  [(SearchUIResultsCollectionViewController *)self setHiddenSections:v12];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v19 = [(SearchUICollectionViewController *)self resultsViewDelegate];
        if (objc_opt_respondsToSelector())
        {
          v20 = [(SearchUICollectionViewController *)self resultsViewDelegate];
          int v21 = [v20 sectionShouldBeExpanded:v18];

          if (!v21) {
            continue;
          }
          v19 = [(SearchUIResultsCollectionViewController *)self expandedSections];
          [v19 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  v22 = (void *)[v13 mutableCopy];
  v23 = [(SearchUIResultsCollectionViewController *)self hiddenSections];
  [v22 removeObjectsInArray:v23];

  id v24 = v22;
  v25 = [(SearchUIResultsCollectionViewController *)self expandedSections];
  v26 = [(SearchUICollectionViewController *)self expandedCollectionSections];
  v27 = +[SearchUITableModel tableModelWithSections:v24 expandedSections:v25 expandedCollectionCardSections:v26];

  [(SearchUICollectionViewController *)self setTableModel:v27 animated:v30];
  if (v31) {
    [(SearchUIResultsCollectionViewController *)self scrollTableToTop];
  }
  v28 = [(SearchUICollectionViewController *)self viewDidUpdateHandler];

  if (v28)
  {
    v29 = [(SearchUICollectionViewController *)self viewDidUpdateHandler];
    v29[2]();
  }
}

- (NSMutableSet)expandedSections
{
  return self->_expandedSections;
}

- (void)setHiddenSections:(id)a3
{
}

- (NSMutableSet)sectionsThatHaveBeenExpanded
{
  return self->_sectionsThatHaveBeenExpanded;
}

- (void)scrollTableToTop
{
  BOOL v3 = [(SearchUIResultsCollectionViewController *)self collectionView];
  [v3 adjustedContentInset];
  double v5 = -v4;

  id v6 = [(SearchUIResultsCollectionViewController *)self collectionView];
  [v6 contentOffset];
  double v8 = v7;

  if (v8 != v5)
  {
    id v9 = [(SearchUIResultsCollectionViewController *)self collectionView];
    objc_msgSend(v9, "setContentOffset:animated:", 0, 0.0, v5);
  }
}

- (NSArray)hiddenSections
{
  return self->_hiddenSections;
}

- (BOOL)updateMustAccountForLayout
{
  return 1;
}

+ (id)hiddenSectionsFromSections:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isInitiallyHidden", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SearchUIResultsCollectionViewController;
  id v6 = a4;
  uint64_t v7 = [(SearchUICollectionViewController *)&v15 cellForRowModel:a3 atIndexPath:v6];
  uint64_t v8 = [(SearchUICollectionViewController *)self dataSource];
  uint64_t v9 = [v6 section];

  id v10 = [v8 sectionIdentifierForIndex:v9];

  if ([v7 isExpandable])
  {
    uint64_t v11 = [(SearchUIResultsCollectionViewController *)self expandedSections];
    long long v12 = [v10 section];
    long long v13 = [v12 resultSection];
    objc_msgSend(v7, "updateExpanded:animated:", objc_msgSend(v11, "containsObject:", v13), 0);
  }
  return v7;
}

void __47__SearchUIResultsCollectionViewController_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCachedHeaderHeight:0.0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 purgeAndResetTable];
}

- (id)restorationContext
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIResultsCollectionViewController;
  id v3 = [(SearchUICollectionViewController *)&v7 restorationContext];
  double v4 = [(SearchUICollectionViewController *)self tableModel];
  id v5 = [v4 sections];
  [v3 setSections:v5];

  return v3;
}

- (void)updateWithResultSections:(id)a3 scrollToTop:(BOOL)a4
{
}

- (id)preferredFocusEnvironments
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  if (v3
    && (double v4 = (void *)v3,
        [(SearchUICollectionViewController *)self focusableIndexPath],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    id v10 = [(SearchUIKeyboardableCollectionViewController *)self textField];
    v21[0] = v10;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  }
  else
  {
    id v6 = [(SearchUICollectionViewController *)self focusableIndexPath];

    if (!v6)
    {
      v18.receiver = self;
      v18.super_class = (Class)SearchUIResultsCollectionViewController;
      uint64_t v16 = [(SearchUIResultsCollectionViewController *)&v18 preferredFocusEnvironments];
      goto LABEL_14;
    }
    objc_super v7 = [(SearchUIResultsCollectionViewController *)self collectionView];
    [v7 layoutIfNeeded];

    uint64_t v8 = [(SearchUIResultsCollectionViewController *)self collectionView];
    uint64_t v9 = [(SearchUICollectionViewController *)self focusableIndexPath];
    id v10 = [v8 cellForItemAtIndexPath:v9];

    uint64_t v11 = [v10 viewForForcedFocus];
    long long v12 = (void *)v11;
    if (v11) {
      long long v13 = (void *)v11;
    }
    else {
      long long v13 = v10;
    }
    id v14 = v13;

    if (v14)
    {
      id v20 = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)SearchUIResultsCollectionViewController;
      uint64_t v15 = [(SearchUIResultsCollectionViewController *)&v19 preferredFocusEnvironments];
    }
    uint64_t v16 = (void *)v15;
  }
LABEL_14:
  return v16;
}

- (int64_t)focusItemDeferralMode
{
  return 2;
}

- (void)returnKeyPressed
{
  id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  uint64_t v3 = [(SearchUIResultsCollectionViewController *)self collectionView];
  double v4 = [v3 cellForItemAtIndexPath:v5];

  if ([v4 needsInternalFocus]) {
    [v4 returnKeyPressed];
  }
  else {
    [(SearchUICollectionViewController *)self tapAtIndexPath:v5];
  }
}

- (BOOL)canHighlightRowAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(SearchUIResultsCollectionViewController *)self indexPathIsShowMoreSections:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIResultsCollectionViewController;
    BOOL v5 = [(SearchUICollectionViewController *)&v7 canHighlightRowAtIndexPath:v4];
  }

  return v5;
}

- (BOOL)indexPathIsShowMoreSections:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SearchUICollectionViewController *)self dataSource];
  uint64_t v6 = [v4 section];

  objc_super v7 = [v5 sectionIdentifierForIndex:v6];
  uint64_t v8 = [v7 section];
  uint64_t v9 = [v8 resultSection];

  id v10 = [v9 results];
  uint64_t v11 = [v10 firstObject];
  long long v12 = [v11 identifier];
  char v13 = [v12 isEqualToString:@"com.apple.other:show_more"];

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SearchUIResultsCollectionViewController *)self indexPathIsShowMoreSections:v7])
  {
    uint64_t v8 = [SearchUICommandHandler alloc];
    uint64_t v9 = [(SearchUICollectionViewController *)self dataSource];
    id v10 = [v9 itemIdentifierForIndexPath:v7];
    uint64_t v11 = [(SearchUIResultsCollectionViewController *)self commandEnvironment];
    long long v12 = [(SearchUICommandHandler *)v8 initWithCommand:0 rowModel:v10 button:0 environment:v11];

    [(SearchUIResultsCollectionViewController *)self showMoreSectionsWithShowMoreButtonIndexPath:v7];
    [(SearchUICommandHandler *)v12 wasPerformedWithTriggerEvent:2];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SearchUIResultsCollectionViewController;
    [(SearchUICollectionViewController *)&v13 collectionView:v6 didSelectItemAtIndexPath:v7];
  }
}

- (void)purgeAndResetTable
{
  id v4 = [(SearchUICollectionViewController *)self tableModel];
  [(SearchUICollectionViewController *)self setTableModel:0];
  uint64_t v3 = [(SearchUIResultsCollectionViewController *)self collectionView];
  [v3 _purgeReuseQueues];

  [(SearchUICollectionViewController *)self setTableModel:v4];
}

- (void)willDismiss
{
}

- (void)toggleExpansionForSectionModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 section];
  uint64_t v6 = [v5 resultSection];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [v4 section];
    uint64_t v9 = [v8 collectionSection];
    id v10 = [v9 collectionStyle];
    uint64_t v11 = [v10 initiallyVisibleCardSectionCount];

    if (!v11)
    {
      long long v12 = [v4 section];
      objc_super v13 = [v12 resultSection];

      BOOL v14 = [(SearchUIResultsCollectionViewController *)self sectionShouldBeExpanded:v13];
      uint64_t v15 = [(SearchUIResultsCollectionViewController *)self expandedSections];
      uint64_t v16 = v15;
      if (v14)
      {
        [v15 removeObject:v13];
      }
      else
      {
        [v15 addObject:v13];

        uint64_t v17 = [(SearchUIResultsCollectionViewController *)self sectionsThatHaveBeenExpanded];
        char v18 = [v17 containsObject:v13];

        if ((v18 & 1) == 0)
        {
          objc_super v19 = [v13 results];
          id v20 = [v19 firstObject];
          int v21 = [v20 moreResults];
          v22 = v21;
          if (v21)
          {
            id v23 = v21;
          }
          else
          {
            id v24 = [v13 results];
            v25 = [v24 lastObject];
            id v23 = [v25 moreResults];
          }
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __74__SearchUIResultsCollectionViewController_toggleExpansionForSectionModel___block_invoke;
          v26[3] = &unk_1E6E73BC0;
          v26[4] = self;
          id v27 = v13;
          id v28 = v4;
          [v23 loadSearchResultsWithCompletionHandler:v26];

          if (v23) {
            goto LABEL_13;
          }
        }
      }
      [(SearchUICollectionViewController *)self performExpansion:!v14 withSection:v4];
      id v23 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
  }
  v29.receiver = self;
  v29.super_class = (Class)SearchUIResultsCollectionViewController;
  [(SearchUICollectionViewController *)&v29 toggleExpansionForSectionModel:v4];
LABEL_14:
}

void __74__SearchUIResultsCollectionViewController_toggleExpansionForSectionModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__SearchUIResultsCollectionViewController_toggleExpansionForSectionModel___block_invoke_2;
  v6[3] = &unk_1E6E73970;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v6];
}

void __74__SearchUIResultsCollectionViewController_toggleExpansionForSectionModel___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) expandedSections];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) maxInitiallyVisibleResults];
    id v5 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v5, "setMaxInitiallyVisibleResults:");
    }
    else
    {
      uint64_t v6 = [v5 results];
      objc_msgSend(*(id *)(a1 + 40), "setMaxInitiallyVisibleResults:", objc_msgSend(v6, "count"));
    }
    id v7 = [*(id *)(a1 + 40) results];
    id v8 = [v7 arrayByAddingObjectsFromArray:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setResults:v8];

    id v9 = [*(id *)(a1 + 32) sectionsThatHaveBeenExpanded];
    [v9 addObject:*(void *)(a1 + 40)];

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    [v10 performExpansion:1 withSection:v11];
  }
}

- (id)tableModelForExpansion
{
  int v3 = [(SearchUICollectionViewController *)self tableModel];
  uint64_t v4 = [(SearchUIResultsCollectionViewController *)self expandedSections];
  id v5 = [(SearchUICollectionViewController *)self expandedCollectionSections];
  uint64_t v6 = [v3 updatedTableModelWithExpandedSections:v4 expandedCollectionCardSections:v5 hiddenSections:0 atSectionIndex:0];

  return v6;
}

- (void)resignTextFieldIfNeeded
{
  if (([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode] & 1) == 0)
  {
    id v3 = [(SearchUIKeyboardableCollectionViewController *)self textField];
    [v3 resignFirstResponder];
  }
}

- (void)showMoreSectionsWithShowMoreButtonIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 section];
  uint64_t v6 = [(SearchUICollectionViewController *)self tableModel];
  id v7 = [(SearchUIResultsCollectionViewController *)self expandedSections];
  id v8 = [(SearchUICollectionViewController *)self expandedCollectionSections];
  id v9 = [(SearchUIResultsCollectionViewController *)self hiddenSections];
  id v10 = [v6 updatedTableModelWithExpandedSections:v7 expandedCollectionCardSections:v8 hiddenSections:v9 atSectionIndex:v5];

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__SearchUIResultsCollectionViewController_showMoreSectionsWithShowMoreButtonIndexPath___block_invoke;
  v11[3] = &unk_1E6E73BE8;
  objc_copyWeak(v12, &location);
  v12[1] = v5;
  [(SearchUICollectionViewController *)self setTableModel:v10 animated:1 completion:v11];
  [(SearchUIResultsCollectionViewController *)self resignTextFieldIfNeeded];
  [(SearchUICollectionViewController *)self setLastVisibleFeedbackTrigger:15];
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __87__SearchUIResultsCollectionViewController_showMoreSectionsWithShowMoreButtonIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained collectionView];
  [v2 layoutIfNeeded];

  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:*(void *)(a1 + 40)];
  [WeakRetained setFocusableIndexPath:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenSections, 0);
  objc_storeStrong((id *)&self->_sectionsThatHaveBeenExpanded, 0);
  objc_storeStrong((id *)&self->_expandedSections, 0);
}

@end