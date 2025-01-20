@interface SearchUIMultiResultCollectionView
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)highlightFirstCell;
- (BOOL)isExpanded;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (NSArray)visibleResults;
- (SearchUIFeedbackDelegateInternal)feedbackDelegate;
- (SearchUIMultiResultCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (SearchUIMultiResultRowModel)rowModel;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)focusGroupIdentifier;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)deleteIcon:(id)a3;
- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4;
- (void)hideIcon:(id)a3;
- (void)removeIconWithBundleIdentifier:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setHighlightFirstCell:(BOOL)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setRowModel:(id)a3;
- (void)setVisibleResults:(id)a3;
- (void)updateCountsAnimated:(BOOL)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIMultiResultCollectionView

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  +[SearchUIAppIconUtilities preferredHorizontalPlatterInsetForAppIcons];
  double v6 = v5;
  if (+[SearchUIUtilities isIpad])
  {
    +[SearchUIUtilities standardTableCellContentInset];
    double v6 = v6 + v7;
  }
  +[SearchUIAppIconUtilities distanceToTopOfAppIconsForMultiResultCell];
  double v9 = v6;
  double v10 = v8;
  double v11 = v6;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(SearchUIMultiResultCollectionView *)self visibleResults];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"multicell" forIndexPath:v6];
  double v9 = [(SearchUIMultiResultCollectionView *)self visibleResults];
  double v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  [v8 updateWithResult:v10];

  double v11 = [(SearchUIMultiResultCollectionView *)self feedbackDelegate];
  v12 = [v8 appIconView];
  [v12 setFeedbackDelegate:v11];

  v13 = [v8 appIconView];
  [v13 setEngagementDelegate:self];

  v14 = objc_msgSend(NSString, "stringWithFormat:", @"Identifier:ResultCell,Section:%ld,Row:%ld", objc_msgSend(v6, "section"), objc_msgSend(v6, "row"));
  [v8 setAccessibilityIdentifier:v14];

  if ([(SearchUIMultiResultCollectionView *)self highlightFirstCell]) {
    BOOL v15 = [v6 item] == 0;
  }
  else {
    BOOL v15 = 0;
  }
  v16 = [v8 appIconView];
  [v16 setAddRoundedKeyboardHighlight:v15];

  v17 = [v7 collectionViewLayout];

  [v17 minimumInteritemSpacing];
  double v19 = v18;
  [v17 minimumLineSpacing];
  objc_msgSend(v8, "setHoverHighlightMargins:", v19, v20);

  return v8;
}

- (NSArray)visibleResults
{
  return (NSArray *)objc_getProperty(self, a2, 3288, 1);
}

- (BOOL)highlightFirstCell
{
  return self->_highlightFirstCell;
}

- (SearchUIFeedbackDelegateInternal)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegateInternal *)WeakRetained;
}

- (void)updateWithRowModel:(id)a3
{
  id v8 = a3;
  v4 = [v8 results];
  int64_t v5 = [(SearchUIMultiResultCollectionView *)self rowModel];
  id v6 = [v5 results];
  char v7 = [v4 isEqualToArray:v6];

  if ((v7 & 1) == 0)
  {
    [(SearchUIMultiResultCollectionView *)self setRowModel:v8];
    [(SearchUIMultiResultCollectionView *)self updateCountsAnimated:0];
  }
}

- (void)updateCountsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SearchUIMultiResultCollectionView *)self isExpanded];
  id v6 = [(SearchUIMultiResultCollectionView *)self rowModel];
  char v7 = [v6 results];
  if (!v5)
  {
    id v8 = [(SearchUIMultiResultCollectionView *)self rowModel];
    double v9 = [v8 results];
    unint64_t v10 = [v9 count];

    unint64_t v11 = +[SearchUIAppIconUtilities numberOfAppIconsPerRow];
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    uint64_t v13 = objc_msgSend(v7, "subarrayWithRange:", 0, v12);

    char v7 = (void *)v13;
  }

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  v14 = [(SearchUIMultiResultCollectionView *)self visibleCells];
  uint64_t v15 = [v14 count];

  uint64_t v37 = v15;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  v16 = [(SearchUIMultiResultCollectionView *)self visibleResults];
  uint64_t v17 = [v16 count];

  uint64_t v33 = v17;
  if (v35[3] && v31[3])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke;
    aBlock[3] = &unk_1E6E73040;
    v28 = &v34;
    aBlock[4] = self;
    v29 = &v30;
    id v27 = v7;
    double v18 = _Block_copy(aBlock);
    double v19 = v18;
    if (v3)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_2;
      v24[3] = &unk_1E6E73068;
      id v25 = v18;
      [(SearchUIMultiResultCollectionView *)self performBatchUpdates:v24 completion:0];
      double v20 = v25;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E4FB1EB0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_3;
      v22[3] = &unk_1E6E72C68;
      v22[4] = self;
      id v23 = v18;
      [v21 performWithoutAnimation:v22];
      double v20 = v23;
    }
  }
  else
  {
    [(SearchUIMultiResultCollectionView *)self setVisibleResults:v7];
    [(SearchUIMultiResultCollectionView *)self reloadData];
    [(SearchUIMultiResultCollectionView *)self layoutBelowIfNeeded];
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

- (SearchUIMultiResultRowModel)rowModel
{
  return (SearchUIMultiResultRowModel *)objc_getProperty(self, a2, 3280, 1);
}

- (void)setVisibleResults:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setRowModel:(id)a3
{
}

- (void)setIsExpanded:(BOOL)a3 animated:(BOOL)a4
{
  self->_isExpanded = a3;
  [(SearchUIMultiResultCollectionView *)self updateCountsAnimated:a4];
}

- (void)setHighlightFirstCell:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  id v6 = [(SearchUIMultiResultCollectionView *)self cellForItemAtIndexPath:v5];
  char v7 = [v6 appIconView];
  [v7 setAddRoundedKeyboardHighlight:v3];

  self->_highlightFirstCell = v3;
}

- (SearchUIMultiResultCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIMultiResultCollectionView;
  v4 = -[SearchUIMultiResultCollectionView initWithFrame:collectionViewLayout:](&v9, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v5 = v4;
  if (v4)
  {
    [(SearchUIMultiResultCollectionView *)v4 setDataSource:v4];
    [(SearchUIMultiResultCollectionView *)v5 setDelegate:v5];
    [(SearchUIMultiResultCollectionView *)v5 setBackgroundColor:0];
    [(SearchUIMultiResultCollectionView *)v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"multicell"];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_deleteIcon_ name:*MEMORY[0x1E4FA6708] object:0];

    char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v5 selector:sel_hideIcon_ name:@"SearchUIHomeScreenAppIconViewDidHideIconNotification" object:0];
  }
  return v5;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (id)focusGroupIdentifier
{
  return +[SearchUIUtilities focusGroupIdentifier];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 nextFocusedItem];
  id v6 = [v4 previouslyFocusedItem];
  if (v5 != v6)
  {

LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)SearchUIMultiResultCollectionView;
    BOOL v9 = [(SearchUIMultiResultCollectionView *)&v11 shouldUpdateFocusInContext:v4];
    goto LABEL_6;
  }
  uint64_t v7 = [v4 focusHeading];

  if (v7 != 1) {
    goto LABEL_5;
  }
  id v8 = [v4 nextFocusedItem];
  [v8 setAddRoundedKeyboardHighlight:0];

  [(SearchUIMultiResultCollectionView *)self didUpdateKeyboardFocusToResult:0 cardSection:0];
  BOOL v9 = 0;
LABEL_6:

  return v9;
}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(SearchUIMultiResultCollectionView *)self feedbackDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    BOOL v9 = [(SearchUIMultiResultCollectionView *)self feedbackDelegate];
    [v9 didUpdateKeyboardFocusToResult:v10 cardSection:v6];
  }
  [(SearchUIMultiResultCollectionView *)self setHighlightFirstCell:0];
}

- (void)hideIcon:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"SearchUIHomeScreenAppIconViewBundleIdUserInfoKey"];

  [(SearchUIMultiResultCollectionView *)self removeIconWithBundleIdentifier:v5];
}

- (void)deleteIcon:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA6860]];
  id v6 = [v5 nodeIdentifier];

  [(SearchUIMultiResultCollectionView *)self removeIconWithBundleIdentifier:v6];
}

- (void)removeIconWithBundleIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = [(SearchUIMultiResultCollectionView *)self visibleResults];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        objc_super v11 = [v10 applicationBundleIdentifier];
        char v12 = [v11 isEqualToString:v4];

        if (v12) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v13 = v10;

      if (!v13) {
        goto LABEL_19;
      }
      v14 = [(SearchUIMultiResultCollectionView *)self rowModel];
      uint64_t v15 = [v14 results];
      if ([v15 count] == 1)
      {
        v16 = [(SearchUIMultiResultCollectionView *)self feedbackDelegate];
        char v17 = objc_opt_respondsToSelector();

        if (v17)
        {
          double v18 = [(SearchUIMultiResultCollectionView *)self feedbackDelegate];
          double v19 = [(SearchUIMultiResultCollectionView *)self rowModel];
          [v18 removeRowModel:v19 completion:0];

LABEL_17:
          goto LABEL_18;
        }
      }
      else
      {
      }
      double v20 = [(SearchUIMultiResultCollectionView *)self rowModel];
      uint64_t v21 = [v20 removeResult:v13];

      v22 = [(SearchUIMultiResultCollectionView *)self visibleResults];
      double v18 = (void *)[v22 mutableCopy];

      [v18 removeObject:v13];
      [(SearchUIMultiResultCollectionView *)self setVisibleResults:v18];
      id v23 = [MEMORY[0x1E4F28D58] indexPathForRow:v21 inSection:0];
      v29 = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      [(SearchUIMultiResultCollectionView *)self deleteItemsAtIndexPaths:v24];

      [(SearchUIMultiResultCollectionView *)self updateCountsAnimated:1];
      goto LABEL_17;
    }
LABEL_10:
    id v13 = v5;
LABEL_18:
  }
LABEL_19:
}

void __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) visibleResults];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 count];

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) count];
  [*(id *)(a1 + 32) setVisibleResults:*(void *)(a1 + 40)];
  id v9 = (id)objc_opt_new();
  BOOL v3 = objc_opt_new();
  id v4 = objc_opt_new();
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) | *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                               + 24))
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForRow:v5 inSection:0];
      uint64_t v7 = v4;
      if (v5 < *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        uint64_t v7 = v9;
        if (v5 >= *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          uint64_t v7 = v3;
        }
      }
      [v7 addObject:v6];

      ++v5;
      unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v8 <= *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      }
    }
    while (v5 < v8);
  }
  if ([v9 count]) {
    [*(id *)(a1 + 32) reconfigureItemsAtIndexPaths:v9];
  }
  if ([v4 count]) {
    [*(id *)(a1 + 32) deleteItemsAtIndexPaths:v4];
  }
  if ([v3 count]) {
    [*(id *)(a1 + 32) insertItemsAtIndexPaths:v3];
  }
  [*(id *)(a1 + 32) layoutBelowIfNeeded];
}

uint64_t __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_4;
  v2[3] = &unk_1E6E73068;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performBatchUpdates:v2 completion:0];
}

uint64_t __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_storeStrong((id *)&self->_visibleResults, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
}

@end